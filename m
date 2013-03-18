Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UHbR0-0006Co-Jq
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 15:53:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Mar 2013 07:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="272343319"
Received: from unknown (HELO [10.237.72.58]) ([10.237.72.58])
	by azsmga001.ch.intel.com with ESMTP; 18 Mar 2013 07:35:16 -0700
Message-ID: <51472623.3080805@linux.intel.com>
Date: Mon, 18 Mar 2013 16:35:15 +0200
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120801 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1363613908-20116-2-git-send-email-jukka.rissanen@linux.intel.com>
	<1363615788.16482.28.camel@ted>
In-Reply-To: <1363615788.16482.28.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] connman-conf: Move the setup script into /usr/lib/connman
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 14:53:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

On 18.03.2013 16:09, Richard Purdie wrote:
> On Mon, 2013-03-18 at 15:38 +0200, Jukka Rissanen wrote:
>> The /etc/connman is not suitable for the setup script.
>> There are other connman related scripts in /usr/lib/connman
>> so moving the wired setup script there.
>>
>> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
>> ---
>>   meta/recipes-connectivity/connman/connman-conf.bb | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
>> index 7b99953..6ecfbfb 100644
>> --- a/meta/recipes-connectivity/connman/connman-conf.bb
>> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
>> @@ -6,16 +6,18 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
>>   SRC_URI_append_qemuall = "file://wired.config \
>>                             file://wired-setup \
>>                            "
>> -PR = "r1"
>> +PR = "r2"
>>
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> +FILES_${PN} = "${localstatedir}/* ${libdir}/*"
>> +
>>   do_install() {
>>       #Configure Wired network interface in case of qemu* machines
>>       if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
>>           install -d ${D}${localstatedir}/lib/connman
>>           install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
>> -        install -d ${D}${sysconfdir}/connman
>> -        install -m 0755 ${WORKDIR}/wired-setup ${D}${sysconfdir}/connman
>> +        install -d ${D}${libdir}/connman
>> +        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
>>       fi
>>   }
>
> You've moved the files, fine, but what uses them and do we need to
> update the caller?

I sent a separate patch "[PATCH] connman-conf: Initial systemd support" 
for systemd support. I did not found any file that would have init.d 
support (I might have missed that one :)


Cheers,
Jukka



