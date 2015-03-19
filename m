Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14D7E6AC33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 19:09:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 Mar 2015 12:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,431,1422950400"; d="scan'208";a="667712860"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2015 12:09:41 -0700
Message-ID: <550B1EF6.8000808@linux.intel.com>
Date: Thu, 19 Mar 2015 13:09:42 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1426762068.git.anibal.limon@linux.intel.com>	<68b7c8a2b55dcd1ee14e22e61cb93bfea299116f.1426762068.git.anibal.limon@linux.intel.com>
	<CAP9ODKqW8cadpDE2FXLNVCh_sAXkAPttGcODR0m_Em4tRntUcA@mail.gmail.com>
In-Reply-To: <CAP9ODKqW8cadpDE2FXLNVCh_sAXkAPttGcODR0m_Em4tRntUcA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] initscripts: Add changetodefaultvt for 1, 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 19:09:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/03/15 13:04, Otavio Salvador wrote:
> On Thu, Mar 19, 2015 at 7:52 AM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> When change between runlevel 5 to another non-graphic runlevel
>> the console stays in the tty where X was launched.
>>
>> This patchs add a default switch to tty1.
>>
>> [YOCTO #5336]
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>   .../initscripts/initscripts-1.0/changetodefaultvt.sh           | 10 ++++++++++
>>   meta/recipes-core/initscripts/initscripts_1.0.bb               |  8 ++++++++
>>   2 files changed, 18 insertions(+)
>>   create mode 100755 meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>> new file mode 100755
>> index 0000000..bbef7ed
>> --- /dev/null
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
>> @@ -0,0 +1,10 @@
>> +#!/bin/sh
>> +### BEGIN INIT INFO
>> +# Provides:             changetodefaultvt
>> +# Required-Start:
>> +# Required-Stop:
>> +# Default-Start:        1 2 3 4
>> +# Default-Stop:
>> +### END INIT INFO
>> +
>> +chvt 1
> You didn't answer the question. How general use distros are handling
> this? It seems hackish!
Yes, its like hackish this is handled by display manager but we don't 
have one in sato.

I think it need to by installed by xserver-nodm-init instead of here. 
I'll send another version.

     alimon
>
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index dfb75b2..177ab90 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -33,6 +33,7 @@ SRC_URI = "file://functions \
>>              file://GPLv2.patch \
>>              file://dmesg.sh \
>>              file://logrotate-dmesg.conf \
>> +           file://changetodefaultvt.sh \
>>   "
>>
>>   S = "${WORKDIR}"
>> @@ -100,6 +101,9 @@ do_install () {
>>          install -m 0644    ${WORKDIR}/volatiles         ${D}${sysconfdir}/default/volatiles/00_core
>>          install -m 0755    ${WORKDIR}/dmesg.sh          ${D}${sysconfdir}/init.d
>>          install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
>> +               install -m 0755    ${WORKDIR}/changetodefaultvt.sh      ${D}${sysconfdir}/init.d
>> +       fi
>>
>>          if [ "${TARGET_ARCH}" = "arm" ]; then
>>                  install -m 0755 ${WORKDIR}/alignment.sh ${D}${sysconfdir}/init.d
>> @@ -112,6 +116,10 @@ do_install () {
>>   #
>>   # Create runlevel links
>>   #
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
>> +               update-rc.d -r ${D} changetodefaultvt.sh start 99 1 2 3 4 .
>> +       fi
>> +
>>          update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
>>          update-rc.d -r ${D} sendsigs start 20 0 6 .
>>          update-rc.d -r ${D} urandom start 30 S 0 6 .
>> --
>> 1.8.4.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


