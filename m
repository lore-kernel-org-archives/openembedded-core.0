Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9lsC-0005Uh-Sl
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:52:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Sep 2012 16:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,382,1344236400"; d="scan'208";a="189788037"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by azsmga001.ch.intel.com with ESMTP; 06 Sep 2012 16:40:08 -0700
Message-ID: <50493458.8020801@linux.intel.com>
Date: Thu, 06 Sep 2012 16:40:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <1346794545-14277-1-git-send-email-fcooper27jr@gmail.com>
	<5048D2BB.3000909@linux.intel.com>
	<8F29D6B095ED194EA1980491A5E029710C2B767E@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B767E@DFLE09.ent.ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Use fw_env.config if available.
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
X-List-Received-Date: Thu, 06 Sep 2012 23:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 04:35 PM, Cooper Jr., Franklin wrote:
> I released a second revision of this patch that should be used instead. http://patches.openembedded.org/patch/35845/
>

It's possible I made a mistake and replied to the wrong email, can you 
please check master and verify which version is there.  If it's the 
wrong version, please prepare a rebased patch.

Thanks
	Sau!


> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, September 06, 2012 11:44 AM
> To: Franklin S. Cooper Jr
> Cc: openembedded-core@lists.openembedded.org; Cooper Jr., Franklin; Franklin S. Cooper Jr
> Subject: Re: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if available.
>
> On 09/04/2012 02:35 PM, Franklin S. Cooper Jr wrote:
>> * Add support for board specific fw_env.config file if available.
>>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
>> ---
>>    meta/recipes-bsp/u-boot/u-boot.inc           |   16 +++++++++++-----
>>    meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>>    meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>>    meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 +-
>>    4 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>> b/meta/recipes-bsp/u-boot/u-boot.inc
>> index a8642f0..ed587a6 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -49,6 +49,11 @@ do_install () {
>>        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>>        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>>
>> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
>> +        install -d ${D}${sysconfdir}
>> +        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
>> +    fi
>> +
>>        if [ "x${SPL_BINARY}" != "x" ]
>>        then
>>            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE} @@ -56,16
>> +61,17 @@ do_install () {
>>        fi
>>    }
>>
>> -FILES_${PN} = "/boot"
>> +FILES_${PN} = "/boot$ {sysconfdir}"
>>    FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
>>
>>    do_deploy () {
>>        install -d ${DEPLOYDIR}
>> -	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>> +    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>>
>> -	cd ${DEPLOYDIR}
>> -	rm -f ${UBOOT_SYMLINK}
>> -	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> +    cd ${DEPLOYDIR}
>> +    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>>
>>        if [ "x${SPL_BINARY}" != "x" ]
>>        then
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> index 8465395..a9cbeca 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>    SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
>>
>>    PV = "v2011.03+git${SRCPV}"
>> -PR = "r7"
>> +PR = "r8"
>>
>>    SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> index 9654795..a115ed2 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>    SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
>>
>>    PV = "v2011.06+git${SRCPV}"
>> -PR = "r2"
>> +PR = "r3"
>>
>>    SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> index c4ec50d..6c099b1 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>>    SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
>>
>>    PV = "v2012.04.01+git${SRCPV}"
>> -PR = "r1"
>> +PR = "r2"
>>
>>    SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>>
>>
> Merged into OE-Core
>
> Thanks
> 	Sau!
>
>
>


