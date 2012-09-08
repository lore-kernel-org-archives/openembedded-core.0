Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TA8io-00063W-5R
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 02:16:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2012 17:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,388,1344236400"; d="scan'208";a="190513038"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2012 17:03:48 -0700
Message-ID: <504A8B60.50602@linux.intel.com>
Date: Fri, 07 Sep 2012 17:03:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
	<3797326.nJL3Eer77d@helios>
In-Reply-To: <3797326.nJL3Eer77d@helios>
Cc: Marc Ferland <marc.ferland@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Sat, 08 Sep 2012 00:16:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 04:56 PM, Paul Eggleton wrote:
> On Friday 07 September 2012 11:17:29 Saul Wold wrote:
>> This allows root to login over ssh with an empty password just like
>> dropbear when the debug-tweaks are enabled, it's important to disable
>> debug-tweaks for a production system as this will leave open a security
>> hole!
>>
>> Thanks to Marc for the settings.
>> Cc: Marc Ferland <marc.ferland@gmail.com>
>>
>> [Yocto #3078]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    9 ++++++++-
>>   1 files changed, 8 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
>> b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb index 31202d4..fcd082c
>> 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
>> @@ -7,7 +7,7 @@ SECTION = "console/network"
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
>>
>> -PR = "r3"
>> +PR = "r4"
>>
>>   DEPENDS = "zlib openssl"
>>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>> @@ -75,6 +75,13 @@ do_install_append () {
>>   			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
>>   		fi
>>   	done
>> +	for i in ${IMAGE_FEATURES};
>> +	do
>> +		if [ ${i} = "debug-tweaks" ]; then
>> +			sed -i -e "s/^#PermitRootLogin/PermitRootLogin/"
>> ${D}${sysconfdir}/ssh/sshd_config +			sed -i -e "s/^#PermitEmptyPasswords
>> no/PermitEmptyPasswords yes/" ${D}${sysconfdir}/ssh/sshd_config +		fi
>> +	done
>>   	install -d ${D}${sysconfdir}/init.d
>>   	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
>>   	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
>
> I'm a bit confused by this because I thought this issue had already been
> solved. Unfortunately when I looked back I see the patch was never merged:
>
> http://patches.openembedded.org/patch/29693/
>
It was merged, I just augmented that allow_empty_passwd() with another 1 
line sed to PermitRootLogin also.

> I agree with Phil, we really don't want to replicate dropbear's usage of
> IMAGE_FEATURES outside of image handling code - in fact there is a bug in the
> Yocto Project bugzilla (#2578) against me to remove this for dropbear.
>
Paul, I can have a crack at it if you want.

Sau!

> Cheers,
> Paul
>


