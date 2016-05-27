Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C172A65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 19:49:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 27 May 2016 12:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,375,1459839600"; d="scan'208";a="986125576"
Received: from jzhang80-mac02.jf.intel.com (HELO [10.211.55.6]) ([10.24.1.109])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2016 12:49:20 -0700
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1462472437-78392-1-git-send-email-jianxun.zhang@linux.intel.com>
	<1462472437-78392-2-git-send-email-jianxun.zhang@linux.intel.com>
	<1464305107.5221.159.camel@linux.intel.com>
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Message-ID: <5748A4BF.7090709@linux.intel.com>
Date: Fri, 27 May 2016 12:49:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1464305107.5221.159.camel@linux.intel.com>
Subject: Re: [PATCH] systemd: support systemd-boot as a stand-alone EFI bootloader
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
X-List-Received-Date: Fri, 27 May 2016 19:49:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/26/2016 04:25 PM, Saul Wold wrote:
> On Thu, 2016-05-05 at 11:20 -0700, Jianxun Zhang wrote:
>> The "systemd-boot" is gummiboot now included into systemd project.
>> The old gummiboot project supported in OE is dead.
>>
>> Our intention is to get a gummiboot-like EFI bootloader without
>> much dependency on systemd and its features.
>>
>> This work is largely derived from the existing bbclass and recipes
>> of gummiboot and systemd.
>> (commit tip: ee25d0e3987d7732a2e46e1640693b4cf419a9fc)
>>
>> Please refer to the history up to the tip for authorship and
>> credit information for the original works.
>>
>> To enable the systemd-boot in build, add this line
>> EFI_PROVIDER = "systemd-boot" in your machine conf file.
>>
>> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Review-by: Saul Wold <sgw@linux.intel.com>
> Tested-by: Saul Wold <sgw@linux.intel.com>
Saul, I appreciate your review and test! Could any maintainer or 
reviewer provide some feedback?
>
>> ---
>>   meta/classes/systemd-boot.bbclass             | 124
>> ++++++++++++++++++++++++++
>>   meta/recipes-bsp/systemd-boot/systemd-boot.bb |  35 ++++++++
>>   meta/recipes-core/systemd/systemd.inc         |  25 ++++++
>>   meta/recipes-core/systemd/systemd_229.bb      |  26 +-----
>>   4 files changed, 186 insertions(+), 24 deletions(-)
>>   create mode 100644 meta/classes/systemd-boot.bbclass
>>   create mode 100644 meta/recipes-bsp/systemd-boot/systemd-boot.bb
>>   create mode 100644 meta/recipes-core/systemd/systemd.inc
>>
>> diff --git a/meta/classes/systemd-boot.bbclass
>> b/meta/classes/systemd-boot.bbclass
>> new file mode 100644
>> index 0000000..9e9398a
>> --- /dev/null
>> +++ b/meta/classes/systemd-boot.bbclass
>> @@ -0,0 +1,124 @@
>> +# Copyright (C) 2016 Intel Corporation
>> +#
>> +# Released under the MIT license (see COPYING.MIT)
>> +
>> +# systemd-boot.bbclass - The "systemd-boot" is essentially the
>> gummiboot merged into systemd.
>> +#                        The original standalone gummiboot project
>> is dead without any more
>> +#                        maintenance. As a start point, we replace
>> all gummitboot occurrences
>> +#                        with systemd-boot in gummiboot.bbclass to
>> have a base version of this
>> +#                        systemd-boot.bbclass.
>> +#
>> +# Set EFI_PROVIDER = "systemd-boot" to use systemd-boot on your live
>> images instead of grub-efi
>> +# (images built by image-live.bbclass or image-vm.bbclass)
>> +
>> +do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
>> +do_bootdirectdisk[depends] += "${MLPREFIX}systemd-boot:do_deploy"
>> +
>> +EFIDIR = "/EFI/BOOT"
>> +
>> +SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
>> +SYSTEMD_BOOT_ENTRIES ?= ""
>> +SYSTEMD_BOOT_TIMEOUT ?= "10"
>> +
>> +# Need UUID utility code.
>> +inherit fs-uuid
>> +
>> +efi_populate() {
>> +        DEST=$1
>> +
>> +        EFI_IMAGE="systemd-bootia32.efi"
>> +        DEST_EFI_IMAGE="bootia32.efi"
>> +        if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> +            EFI_IMAGE="systemd-bootx64.efi"
>> +            DEST_EFI_IMAGE="bootx64.efi"
>> +        fi
>> +
>> +        install -d ${DEST}${EFIDIR}
>> +        # systemd-boot requires these paths for configuration files
>> +        # they are not customizable so no point in new vars
>> +        install -d ${DEST}/loader
>> +        install -d ${DEST}/loader/entries
>> +        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE}
>> ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
>> +        install -m 0644 ${SYSTEMD_BOOT_CFG}
>> ${DEST}/loader/loader.conf
>> +        for i in ${SYSTEMD_BOOT_ENTRIES}; do
>> +            install -m 0644 ${i} ${DEST}/loader/entries
>> +        done
>> +}
>> +
>> +efi_iso_populate() {
>> +        iso_dir=$1
>> +        efi_populate $iso_dir
>> +        mkdir -p ${EFIIMGDIR}/${EFIDIR}
>> +        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
>> +        cp $iso_dir/vmlinuz ${EFIIMGDIR}
>> +        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
>> +        echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" >
>> ${EFIIMGDIR}/startup.nsh
>> +        if [ -f "$iso_dir/initrd" ] ; then
>> +            cp $iso_dir/initrd ${EFIIMGDIR}
>> +        fi
>> +}
>> +
>> +efi_hddimg_populate() {
>> +        efi_populate $1
>> +}
>> +
>> +python build_efi_cfg() {
>> +    s = d.getVar("S", True)
>> +    labels = d.getVar('LABELS', True)
>> +    if not labels:
>> +        bb.debug(1, "LABELS not defined, nothing to do")
>> +        return
>> +
>> +    if labels == []:
>> +        bb.debug(1, "No labels, nothing to do")
>> +        return
>> +
>> +    cfile = d.getVar('SYSTEMD_BOOT_CFG', True)
>> +    try:
>> +         cfgfile = open(cfile, 'w')
>> +    except OSError:
>> +        raise bb.build.funcFailed('Unable to open %s' % (cfile))
>> +
>> +    cfgfile.write('# Automatically created by OE\n')
>> +    cfgfile.write('default %s\n' % (labels.split()[0]))
>> +    timeout = d.getVar('SYSTEMD_BOOT_TIMEOUT', True)
>> +    if timeout:
>> +        cfgfile.write('timeout %s\n' % timeout)
>> +    else:
>> +        cfgfile.write('timeout 10\n')
>> +    cfgfile.close()
>> +
>> +    for label in labels.split():
>> +        localdata = d.createCopy()
>> +
>> +        overrides = localdata.getVar('OVERRIDES', True)
>> +        if not overrides:
>> +            raise bb.build.FuncFailed('OVERRIDES not defined')
>> +
>> +        entryfile = "%s/%s.conf" % (s, label)
>> +        d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
>> +        try:
>> +            entrycfg = open(entryfile, "w")
>> +        except OSError:
>> +            raise bb.build.funcFailed('Unable to open %s' %
>> (entryfile))
>> +        localdata.setVar('OVERRIDES', label + ':' + overrides)
>> +        bb.data.update_data(localdata)
>> +
>> +        entrycfg.write('title %s\n' % label)
>> +        entrycfg.write('linux /vmlinuz\n')
>> +
>> +        append = localdata.getVar('APPEND', True)
>> +        initrd = localdata.getVar('INITRD', True)
>> +
>> +        if initrd:
>> +            entrycfg.write('initrd /initrd\n')
>> +        lb = label
>> +        if label == "install":
>> +            lb = "install-efi"
>> +        entrycfg.write('options LABEL=%s ' % lb)
>> +        if append:
>> +            append = replace_rootfs_uuid(d, append)
>> +            entrycfg.write('%s' % append)
>> +        entrycfg.write('\n')
>> +        entrycfg.close()
>> +}
>> diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb
>> b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
>> new file mode 100644
>> index 0000000..87e9871
>> --- /dev/null
>> +++ b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
>> @@ -0,0 +1,35 @@
>> +require recipes-core/systemd/systemd.inc
>> +
>> +DEPENDS = "intltool-native libcap util-linux gnu-efi"
>> +
>> +inherit autotools pkgconfig gettext
>> +inherit deploy
>> +
>> +EXTRA_OECONF = " --enable-gnuefi \
>> +                 --with-efi-includedir=${STAGING_INCDIR} \
>> +                 --with-efi-ldsdir=${STAGING_LIBDIR} \
>> +                 --with-efi-libdir=${STAGING_LIBDIR} \
>> +                 --disable-manpages \
>> +               "
>> +
>> +# Imported from gummiboot recipe
>> +TUNE_CCARGS_remove = "-mfpmath=sse"
>> +
>> +do_compile() {
>> +	SYSTEMD_BOOT_EFI_ARCH="ia32"
>> +	if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> +		SYSTEMD_BOOT_EFI_ARCH="x64"
>> +	fi
>> +
>> +	oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>> +}
>> +
>> +do_install() {
>> +	# Bypass systemd installation with a NOP
>> +	:
>> +}
>> +
>> +do_deploy () {
>> +	install ${B}/systemd-boot*.efi ${DEPLOYDIR}
>> +}
>> +addtask deploy before do_build after do_compile
>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-
>> core/systemd/systemd.inc
>> new file mode 100644
>> index 0000000..8247130
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd.inc
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "A System and service manager"
>> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
>> +
>> +DESCRIPTION = "systemd is a system and service manager for Linux,
>> compatible with \
>> +SysV and LSB init scripts. systemd provides aggressive
>> parallelization \
>> +capabilities, uses socket and D-Bus activation for starting
>> services, \
>> +offers on-demand starting of daemons, keeps track of processes using
>> \
>> +Linux cgroups, supports snapshotting and restoring of the system \
>> +state, maintains mount and automount points and implements an \
>> +elaborate transactional dependency-based service control logic. It
>> can \
>> +work as a drop-in replacement for sysvinit."
>> +
>> +LICENSE = "GPLv2 & LGPLv2.1"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>> +                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079
>> 008b364516c"
>> +
>> +SRCREV = "714c62b46379abb7558c544665522aca91691e10"
>> +
>> +SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
>> +
>> +PV = "229+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
>> diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-
>> core/systemd/systemd_229.bb
>> index c23c749..4aef907 100644
>> --- a/meta/recipes-core/systemd/systemd_229.bb
>> +++ b/meta/recipes-core/systemd/systemd_229.bb
>> @@ -1,18 +1,4 @@
>> -SUMMARY = "A System and service manager"
>> -HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
>> -
>> -DESCRIPTION = "systemd is a system and service manager for Linux,
>> compatible with \
>> -SysV and LSB init scripts. systemd provides aggressive
>> parallelization \
>> -capabilities, uses socket and D-Bus activation for starting
>> services, \
>> -offers on-demand starting of daemons, keeps track of processes using
>> \
>> -Linux cgroups, supports snapshotting and restoring of the system \
>> -state, maintains mount and automount points and implements an \
>> -elaborate transactional dependency-based service control logic. It
>> can \
>> -work as a drop-in replacement for sysvinit."
>> -
>> -LICENSE = "GPLv2 & LGPLv2.1"
>> -LIC_FILES_CHKSUM =
>> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>> -                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079
>> 008b364516c"
>> +require systemd.inc
>>
>>   PROVIDES = "udev"
>>
>> @@ -24,11 +10,7 @@ SECTION = "base/shell"
>>
>>   inherit useradd pkgconfig autotools perlnative update-rc.d update-
>> alternatives qemu systemd ptest gettext bash-completion
>>
>> -SRCREV = "714c62b46379abb7558c544665522aca91691e10"
>> -
>> -PV = "229+git${SRCPV}"
>> -
>> -SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
>> +SRC_URI += " \
>>              file://touchscreen.rules \
>>              file://00-create-volatile.conf \
>>              file://init \
>> @@ -60,10 +42,6 @@ SRC_URI_append_libc-uclibc = "\
>>   "
>>   SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-
>> default-device-timeout-to-2.patch"
>>
>> -S = "${WORKDIR}/git"
>> -
>> -LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
>> -
>>   GTKDOC_DOCDIR = "${S}/docs/"
>>
>>   PACKAGECONFIG ??= "xz \

