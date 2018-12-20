Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id C336260248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 20:26:12 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 8D63A1C002A;
	Fri, 21 Dec 2018 09:26:12 +1300 (NZDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
	<CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <150da13c-a7d6-c6c1-c623-5acba13904df@taitradio.com>
Date: Fri, 21 Dec 2018 09:26:12 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 20:26:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

libpam is unusual in having a patch that creates an entirely new file 
(tty_secure.c). If that patch eventually goes, then this umask setting 
can go as well.

I haven't come across any other cases of a patch creating a file, but if 
there are, then we could certainly move this setting. Perhaps we should 
wait until others emerge.


On 21/12/18 2:04 AM, Burton, Ross wrote:

> Why is this libpam specific and not a general issue that the umask
> needs to be set in patch.bbclass?
>
> Ross
> On Thu, 20 Dec 2018 at 05:41, Douglas Royds <douglas.royds@taitradio.com> wrote:
>> The patch file pam-security-abstract-securetty-handling.patch creates a new
>> file (tty_secure.c) at patch-time, so its permissions are subject to the host
>> umask. This file is later copied into the -dbg package with no change in
>> permissions.
>>
>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>> ---
>>   meta/recipes-extended/pam/libpam_1.3.0.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
>> index 3aec2cdb4c..292b570e11 100644
>> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
>> @@ -49,6 +49,9 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
>>
>>   inherit autotools gettext pkgconfig
>>
>> +# We create a new file (tty_secure.c) from pam-security-abstract-securetty-handling.patch
>> +do_patch[umask] = "022"
>> +
>>   PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
>>
>>   PACKAGES += "${PN}-runtime ${PN}-xtests"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



