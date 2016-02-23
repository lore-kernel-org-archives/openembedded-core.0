Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87A85772E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 22:17:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Feb 2016 14:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,491,1449561600"; d="scan'208";a="909751239"
Received: from afshjern.zpn.intel.com (HELO [10.219.5.147]) ([10.219.5.147])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2016 14:17:01 -0800
To: benjamin.esquivel@linux.intel.com, openembedded-core@lists.openembedded.org
References: <1456218868-36139-1-git-send-email-alejandro.franco@linux.intel.com>
	<1456218868-36139-3-git-send-email-alejandro.franco@linux.intel.com>
	<1456262420.13465.101.camel@linux.intel.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <56CCDAAF.6080303@linux.intel.com>
Date: Tue, 23 Feb 2016 16:18:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456262420.13465.101.camel@linux.intel.com>
Subject: Re: [PATCHv2 2/2] testimage.bbclass: reuse generic test suites
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 22:17:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I tested this with builds in my workstation and (local, internal)
autobuilder, where TEST_SUITES is *not* specified in local.conf, so the
TEST_SUITES are taken from the DEFAULT_TEST_SUITES variable for each
image, which makes the tests work for the variables defined.

If TEST_SUITES includes "auto", then the testimage task for some images
will still fail, but that's why I opened a new bug # 9129

- - Alex Franco

On 02/23/2016 03:20 PM, Benjamin Esquivel wrote:
> Hi Franco, how did you test this? what is the behavior you get with
> these defaults instead of how's behaving now?
>
> See comments below.
>
> On Tue, 2016-02-23 at 09:14 +0000, Alex Franco wrote:
>> Modify existing default test suites to reuse the new
>> generic test suites.
>>
>> Related to [YOCTO #8410]
>>
>> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
>> ---
>>  meta/classes/testimage.bbclass | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass
>> b/meta/classes/testimage.bbclass
>> index 791cce3..e77bb11 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -37,17 +37,19 @@ MINTESTSUITE = "ping"
>>  NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog"
>>  DEVTESTSUITE = "gcc kernelmodule ldd"
>> 
>> -DEFAULT_TEST_SUITES = "ping auto"
>> -DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
>> +DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
>> +DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
>>  DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
>>  DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE}
>> perl python logrotate"
>>  DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
>>  DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam
>> parselogs ${RPMTESTSUITE}"
>> -DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog
>> xorg scp date parselogs ${RPMTESTSUITE} \
>> +DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman
>> xorg parselogs ${RPMTESTSUITE} \
>>      ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
>> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman
>> syslog xorg scp date perl ldd gcc kernelmodule python parselogs
>> ${RPMTESTSUITE}"
>> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE}
>> connman xorg perl python \
>> +    ${DEVTESTSUITE} parselogs ${RPMTESTSUITE}"
>>  DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam
>> perl python parselogs ${RPMTESTSUITE}"
>> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "ping buildcvs
>> buildiptables buildsudoku connman date df gcc kernelmodule ldd pam
>> parselogs perl python scp ${RPMTESTSUITE} ssh syslog logrotate"
>> +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE}
>> buildcvs buildiptables buildsudoku \
>> +    connman ${DEVTESTSUITE} pam perl python parselogs
>
> These lots of declarations seem to be suited for a .inc file instead of
> living in the bbclass.
>> ${RPMTESTSUITE}"
>>  DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
>> 
>>  # aarch64 has no graphics
>> --
>> 2.6.2
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJWzNqsAAoJEPR9uwMY2lTL9ecH/RQag7augvPCsjKCIdDVAV/C
+PW1JgLwLz1ox9TU7fbVICrXPpBLu/a1tGawstqcvLW2mrlzDy7wJ3Vd1pIhkXTV
zqby90ziqPL9eyeYBnCSv5vyttbB4D8WqY7bf+yC7WAhCB0iXiWjHpjsGFwCyolc
V4gaJGUI1Uv6h7DBQTLoVxTENHFLiLmGqrf3dn6O26EGs9wJlH5rKDnKD6sctCrH
A0w7EWMsBNVPlRFFstBreTX/0SEStU9HsaAUo0bQrwe6ZRZ0Ku0zT9fj9YVdRXxL
BXcVMbv6v/TSut7Ah41LWCCcwmjT6XhJZStuiq7zTRwHufAYQNBPVAPMGdW55YM=
=2lA5
-----END PGP SIGNATURE-----


