Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNBsP-00070o-Nu
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 02:48:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 17:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,396,1363158000"; d="scan'208";a="311458560"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2013 17:31:21 -0700
Message-ID: <515B7859.4010504@linux.intel.com>
Date: Tue, 02 Apr 2013 17:31:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Zhenhua Luo <zhenhua.luo@freescale.com>
References: <1364444326-16088-1-git-send-email-zhenhua.luo@freescale.com>
	<51593D83.3020603@windriver.com>
In-Reply-To: <51593D83.3020603@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core v3] rpm: split out run-postinsts
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
X-List-Received-Date: Wed, 03 Apr 2013 00:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2013 12:55 AM, ChenQi wrote:
> On 03/28/2013 12:18 PM, Zhenhua Luo wrote:
>> 1. Split out run-postinsts script into separated package, sometimes
>> only the
>>     postinsts script is required to run all postinsts scripts in
>> /etc/rpm-postinsts/
>>     instead of the whole rpm package.

This change seems to draw all the RPM dependencies into the package even 
if package-management is not added.  We are building the poky-tiny 
distro with core-image-basic and icu and other dependencies of RPM  are 
getting pulled in when the should not be.

ICU shows this on the autobuilder since we tweak eglibc to remove bits.

Please review this patch, change as needed and test with
DISTRO="poky-tiny" bitbake core-image-minimal

This is already in master, so we need a patch ASAP!  I will be filing a 
bug #4175.

Thanks
    Sau!

>> 2. Set ROOTFS_PKGMANAGE_BOOTSTRAP to rpm-postinsts
>>
>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> ---
>>   meta/classes/rootfs_rpm.bbclass        |    4 +---
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 +++++---
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/rootfs_rpm.bbclass
>> b/meta/classes/rootfs_rpm.bbclass
>> index 8392a1e..07ac0e3 100644
>> --- a/meta/classes/rootfs_rpm.bbclass
>> +++ b/meta/classes/rootfs_rpm.bbclass
>> @@ -3,6 +3,7 @@
>>   #
>>   ROOTFS_PKGMANAGE = "rpm smartpm"
>> +ROOTFS_PKGMANAGE_BOOTSTRAP = "rpm-postinsts"
>>   # Add 50Meg of extra space for Smart
>>   IMAGE_ROOTFS_EXTRA_SPACE_append =
>> "${@base_contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
>> @@ -10,9 +11,6 @@ IMAGE_ROOTFS_EXTRA_SPACE_append =
>> "${@base_contains("PACKAGE_INSTALL", "smartpm"
>>   # Smart is python based, so be sure python-native is available to us.
>>   EXTRANATIVEPATH += "python-native"
>> -# Postinstalls on device are handled within this class at present
>> -ROOTFS_PKGMANAGE_BOOTSTRAP = ""
>> -
>>   do_rootfs[depends] += "rpm-native:do_populate_sysroot"
>>   do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
>>   do_rootfs[depends] += "python-smartpm-native:do_populate_sysroot"
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> index 6286771..cfdc390 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
>> -PR = "r61"
>> +PR = "r62"
>>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It
>> is needed
>>   # in order to extract the distribution SRPM into a format we can
>> extract...
>> @@ -199,7 +199,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER
>> -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
>>   LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
>> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev
>> ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg
>> python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm
>> perl-module-rpm-dev ${PN}-locale"
>> +PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev
>> ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg
>> python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm
>> perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
>>   SOLIBS = "5.4.so"
>> @@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
>>           ${libdir}/rpm/bin/wget \
>>           /var/lib/rpm \
>>           /var/cache/rpm \
>> -        ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>>           "
>> +FILES_${PN}-postinsts =
>> "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>> +                "
>> +
>>   FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>>           ${libdir}/rpm/bin/.debug \
>>           "
> Hi Luo,
>
> This patch introduces a new problem, that is, rpm-postinsts is not
> installed on sato images.
> In fact, for now, rpm-postinsts will not be installed if
> 'package-management' is in IMAGE_FEATURES.
>
> I've opened a bug for this problem
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4160).
> Comments and suggestions are appreciated.
>
> Best Regards,
> Chen Qi
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


