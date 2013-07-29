Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E6DEC6A4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 06:51:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2013 23:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,767,1367996400"; d="scan'208";a="378140440"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2013 23:51:19 -0700
Message-ID: <51F610E7.9090905@linux.intel.com>
Date: Mon, 29 Jul 2013 09:51:19 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1374842117-24504-4-git-send-email-jukka.rissanen@linux.intel.com>
	<51F2C589.7080706@linux.intel.com>
In-Reply-To: <51F2C589.7080706@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] ofono: Enable test scripts by default
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
X-List-Received-Date: Mon, 29 Jul 2013 06:51:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

On 26.07.2013 21:52, Saul Wold wrote:
> On 07/26/2013 05:35 AM, Jukka Rissanen wrote:
>> oFono test scripts are very useful so enable those by default.
>>
>> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
>> ---
>>   meta/recipes-connectivity/ofono/ofono.inc     | 3 ++-
>>   meta/recipes-connectivity/ofono/ofono_1.12.bb | 3 ---
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
>> b/meta/recipes-connectivity/ofono/ofono.inc
>> index d825496..c5bd4d0 100644
>> --- a/meta/recipes-connectivity/ofono/ofono.inc
>> +++ b/meta/recipes-connectivity/ofono/ofono.inc
>> @@ -15,6 +15,7 @@ INITSCRIPT_PARAMS = "defaults 22"
>>   EXTRA_OECONF += "\
>>       ${@base_contains('DISTRO_FEATURES', 'systemd',
>> '--with-systemdunitdir=${systemd_unitdir}/system/',
>> '--with-systemdunitdir=', d)} \
>>       ${@base_contains('DISTRO_FEATURES',
>> 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
>> +    --enable-test \
>>   "
>>   SYSTEMD_SERVICE_${PN} = "ofono.service"
>>
>> @@ -30,5 +31,5 @@ PACKAGES =+ "${PN}-tests"
>>   RDEPENDS_${PN} += "dbus"
>>
>>   FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
>> -FILES_${PN}-tests = "${libdir}/ofono"
>> +FILES_${PN}-tests = "${libdir}/${BPN}/test"
> I think you should be using the ptest here instead of test and inherit
> ptest, please see the ptest.bbclass.
>
> I realize that this is not new code, but if we are going to changes this
> we should use the new ptest mechanism.
>
> Sau!
>

If I am reading https://wiki.yoctoproject.org/wiki/Ptest correctly, the 
ptest if for running the package test suite. Unfortunately the 
ofono-tests package is not for that purpose, it is just a bunch of 
useful python scripts for setting up cellular modem, context and 
monitoring ofono signals etc.
Similar scripts are also found in connman and neard packages.


Cheers,
Jukka


