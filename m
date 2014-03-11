Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63ABD6F8C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 20:39:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2014 13:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,633,1389772800"; d="scan'208";a="497962428"
Received: from twillis1-mobl1.amr.corp.intel.com (HELO [10.254.38.139])
	([10.254.38.139])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2014 13:37:48 -0700
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Tue, 11 Mar 2014 13:38:08 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Message-ID: <CF44C1BC.76A1B%dvhart@linux.intel.com>
Thread-Topic: [PATCH 3/3] classes: Add gummiboot class
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
	<23d446488f4304516b483a2293bd34c86a23bdff.1394128875.git.stefanx.stanacar@intel.com>
	<CF3E3767.74FE9%dvhart@linux.intel.com>
	<1394186245.29948.5.camel@firebird.rb.intel.com>
In-Reply-To: <1394186245.29948.5.camel@firebird.rb.intel.com>
Mime-version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes: Add gummiboot class
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
X-List-Received-Date: Tue, 11 Mar 2014 20:39:44 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 3/7/14, 1:57, "Stanacar, StefanX" <stefanx.stanacar@intel.com> wrote:

>
>
>
>On Thu, 2014-03-06 at 14:36 -0800, Darren Hart wrote:
>> On 3/6/14, 10:15, "Stefan Stanacar" <stefanx.stanacar@intel.com> wrote:
>> 
>> >Adds a gummiboot class similar to grub-efi class and makes the
>>necessary
>> >changes so it can be used for live/hddimg images as well.
>> >
>> >One can set EFI_PROVIDER = "gummiboot" in local.conf to use gummiboot
>> >instead of grub-efi.
>> >Gummiboot requires some kernel options that are not enabled by default,
>> >so one has to build
>> >with KERNEL_FEATURES_append = " cfg/efi-ext".
>> 
>> cfg/efi is insufficient?
>> 
>
>cfg/efi doesn't have CONFIG_EFI_STUB=y which is required by gummiboot.
>cfg/efi-ext adds more than that, it's true.

Weird... Although the STUB should probably be in efi rather than efi-ext.
I'm surprised gummiboot requires STUB... Since STUB is there to allow the
kernel to be booted directly, no bootloader required. I guess gummiboot is
slightly less than a boot loader :-)

I'd Ack a patch to move STUB from efi-ext to efi.


>
>It's also a good idea to enable CONFIG_EFIVARS_FS, which is the
>newer/better interface than CONFIG_EFI_VARS that cfg/efi-ext enables.


Hrm... OK, perhaps time to revisit those fragments and update them for
current usage.


--
Darren

>> >
>> >The install scripts have been updated too, keeping the old behaviour
>> >around,
>> >but accounting for the new boot loader config files (if they exist).
>> >It can be argued that the installer and bootimg are a bit wierd and not
>> >necessarily correct,
>> >but I wanted to have the exact same behviour with gummiboot.
>> >With the default EFI_PROVIDER = "grub-efi" nothing changes, everthing
>> >should be just as before.
>> >
>> >I've tested live boot, install and normal boot on:
>> >    - FRI2
>> >    - genericx86-64 on NUC
>> >with:
>> >  EFI_PROVIDER = "gummiboot"
>> >  KERNEL_FEATURES_append = " cfg/efi-ext"
>> >in local.conf.
>> >
>> >Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
>> 
>> 
>> Generally looks good. My only reservation is the same as for 2/3, should
>> we define an EFI interface rather than having to construct function
>>names
>> in the consumers of this class?
>
>I don't have a strong opinion here, it just seemed the simplest way atm,
>then adding another interface.
>
>Cheers,
>Stefan
>
>> 
>> --
>> Darren
>> 
>> >---
>> > meta/classes/gummiboot.bbclass                     | 112
>> >+++++++++++++++++++++
>> > .../initrdscripts/files/init-install-efi.sh        |  51 +++++++---
>> > 2 files changed, 147 insertions(+), 16 deletions(-)
>> > create mode 100644 meta/classes/gummiboot.bbclass
>> >
>> >diff --git a/meta/classes/gummiboot.bbclass
>> >b/meta/classes/gummiboot.bbclass
>> >new file mode 100644
>> >index 0000000..5c11286
>> >--- /dev/null
>> >+++ b/meta/classes/gummiboot.bbclass
>> >@@ -0,0 +1,112 @@
>> >+EFICLASS_FUNC_PREFIX = "gummiboot"
>> >+
>> >+do_bootimg[depends] += "gummiboot:do_deploy"
>> >+do_bootdirectdisk[depends] += "gummiboot:do_deploy"
>> >+
>> >+EFIDIR = "/EFI/BOOT"
>> >+
>> >+GUMMIBOOT_CFG ?= "${S}/loader.conf"
>> >+GUMMIBOOT_ENTRIES ?= ""
>> >+GUMMIBOOT_TIMEOUT ?= "10"
>> >+
>> >+gummiboot_populate() {
>> >+        DEST=$1
>> >+
>> >+        EFI_IMAGE="gummibootia32.efi"
>> >+        DEST_EFI_IMAGE="bootia32.efi"
>> >+        if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> >+            EFI_IMAGE="gummibootx64.efi"
>> >+            DEST_EFI_IMAGE="bootx64.efi"
>> >+        fi
>> >+
>> >+        install -d ${DEST}${EFIDIR}
>> >+        # gummiboot requires these paths for configuration files
>> >+        # they are not customizable so no point in new vars
>> >+        install -d ${DEST}/loader
>> >+        install -d ${DEST}/loader/entries
>> >+        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE}
>> >${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
>> >+        install -m 0644 ${GUMMIBOOT_CFG} ${DEST}/loader/loader.conf
>> >+        for i in ${GUMMIBOOT_ENTRIES}; do
>> >+            install -m 0644 ${i} ${DEST}/loader/entries
>> >+        done
>> >+}
>> >+
>> >+gummiboot_iso_populate() {
>> >+        iso_dir=$1
>> >+        gummiboot_populate $iso_dir
>> >+        mkdir -p ${EFIIMGDIR}/${EFIDIR}
>> >+        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
>> >+        cp $iso_dir/vmlinuz ${EFIIMGDIR}
>> >+        echo "${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
>> >+        if [ -f "$iso_dir/initrd" ] ; then
>> >+            cp $iso_dir/initrd ${EFIIMGDIR}
>> >+        fi
>> >+}
>> >+
>> >+gummiboot_hddimg_populate() {
>> >+        gummiboot_populate $1
>> >+}
>> >+
>> >+python build_gummiboot_cfg() {
>> >+    s = d.getVar("S", True)
>> >+    labels = d.getVar('LABELS', True)
>> >+    if not labels:
>> >+        bb.debug(1, "LABELS not defined, nothing to do")
>> >+        return
>> >+
>> >+    if labels == []:
>> >+        bb.debug(1, "No labels, nothing to do")
>> >+        return
>> >+
>> >+    cfile = d.getVar('GUMMIBOOT_CFG', True)
>> >+    try:
>> >+         cfgfile = open(cfile, 'w')
>> >+    except OSError:
>> >+        raise bb.build.funcFailed('Unable to open %s' % (cfile))
>> >+
>> >+    cfgfile.write('# Automatically created by OE\n')
>> >+    cfgfile.write('default %s\n' % (labels.split()[0]))
>> >+    timeout = d.getVar('GUMMIBOOT_TIMEOUT', True)
>> >+    if timeout:
>> >+        cfgfile.write('timeout %s\n' % timeout)
>> >+    else:
>> >+        cfgfile.write('timeout 10\n')
>> >+    cfgfile.close()
>> >+
>> >+    for label in labels.split():
>> >+        localdata = d.createCopy()
>> >+
>> >+        overrides = localdata.getVar('OVERRIDES', True)
>> >+        if not overrides:
>> >+            raise bb.build.FuncFailed('OVERRIDES not defined')
>> >+
>> >+        entryfile = "%s/%s.conf" % (s, label)
>> >+        d.appendVar("GUMMIBOOT_ENTRIES", " " + entryfile)
>> >+        try:
>> >+            entrycfg = open(entryfile, "w")
>> >+        except OSError:
>> >+            raise bb.build.funcFailed('Unable to open %s' %
>>(entryfile))
>> >+        localdata.setVar('OVERRIDES', label + ':' + overrides)
>> >+        bb.data.update_data(localdata)
>> >+
>> >+        entrycfg.write('title %s\n' % label)
>> >+        entrycfg.write('linux /vmlinuz\n')
>> >+
>> >+        append = localdata.getVar('APPEND', True)
>> >+        initrd = localdata.getVar('INITRD', True)
>> >+
>> >+        if initrd:
>> >+            entrycfg.write('initrd /initrd\n')
>> >+        lb = label
>> >+        if label == "install":
>> >+            lb = "install-efi"
>> >+        entrycfg.write('options LABEL=%s ' % lb)
>> >+        if append:
>> >+            entrycfg.write('%s' % append)
>> >+        entrycfg.write('\n')
>> >+        entrycfg.close()
>> >+}
>> >+
>> >+python build_efi_cfg() {
>> >+    bb.build.exec_func("build_gummiboot_cfg", d)
>> >+}
>> >diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> >b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> >index 9846637..ed3221b 100644
>> >--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> >+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> >@@ -104,6 +104,7 @@ parted /dev/${device} mklabel gpt
>> > 
>> > echo "Creating boot partition on $bootfs"
>> > parted /dev/${device} mkpart primary 0% $boot_size
>> >+parted /dev/${device} set 1 boot on
>> > 
>> > echo "Creating rootfs partition on $rootfs"
>> > parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
>> >@@ -149,23 +150,41 @@ mount $bootfs /ssd
>> > 
>> > EFIDIR="/ssd/EFI/BOOT"
>> > mkdir -p $EFIDIR
>> >-GRUBCFG="$EFIDIR/grub.cfg"
>> >-
>> > cp /media/$1/vmlinuz /ssd
>> >-# Copy the efi loader and config (booti*.efi and grub.cfg)
>> >-cp /media/$1/EFI/BOOT/* $EFIDIR
>> >-
>> >-# Update grub config for the installed image
>> >-# Delete the install entry
>> >-sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
>> >-# Delete the initrd lines
>> >-sed -i "/initrd /d" $GRUBCFG
>> >-# Delete any LABEL= strings
>> >-sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
>> >-# Delete any root= strings
>> >-sed -i "s/ root=[^ ]*/ /" $GRUBCFG
>> >-# Add the root= and other standard boot options
>> >-sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait
>> >quiet @" $GRUBCFG
>> >+# Copy the efi loader
>> >+cp /media/$1/EFI/BOOT/*.efi $EFIDIR
>> >+
>> >+if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
>> >+    GRUBCFG="$EFIDIR/grub.cfg"
>> >+    cp /media/$1/EFI/BOOT/grub.cfg $GRUBCFG
>> >+    # Update grub config for the installed image
>> >+    # Delete the install entry
>> >+    sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
>> >+    # Delete the initrd lines
>> >+    sed -i "/initrd /d" $GRUBCFG
>> >+    # Delete any LABEL= strings
>> >+    sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
>> >+    # Delete any root= strings
>> >+    sed -i "s/ root=[^ ]*/ /" $GRUBCFG
>> >+    # Add the root= and other standard boot options
>> >+    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw
>>$rootwait
>> >quiet @" $GRUBCFG
>> >+fi
>> >+
>> >+if [ -d /media/$1/loader ]; then
>> >+    GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
>> >+    # copy config files for gummiboot
>> >+    cp -dr /media/$1/loader /ssd
>> >+    # delete the install entry
>> >+    rm -f /ssd/loader/entries/install.conf
>> >+    # delete the initrd lines
>> >+    sed -i "/initrd /d" $GUMMIBOOT_CFGS
>> >+    # delete any LABEL= strings
>> >+    sed -i "s/ LABEL=[^ ]*/ /" $GUMMIBOOT_CFGS
>> >+    # delete any root= strings
>> >+    sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
>> >+    # add the root= and other standard boot options
>> >+    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @"
>> >$GUMMIBOOT_CFGS
>> >+fi
>> > 
>> > umount /ssd
>> > sync
>> >-- 
>> >1.8.5.3
>> >
>> >
>> 
>> 
>
>


-- 
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





