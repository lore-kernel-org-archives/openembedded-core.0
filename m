Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB9A0731F4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 06:28:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u326SF1Z024022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 23:28:15 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 1 Apr 2016 23:28:14 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1459502011.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56FF667D.3090208@windriver.com>
Date: Sat, 2 Apr 2016 14:28:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1459502011.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] Fixes for grub EFI
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
X-List-Received-Date: Sat, 02 Apr 2016 06:28:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I updated patch 3/3 in the repo, now APPEND is stilled kept for
syslinux and grub-efi.

Here are the patches:

git://git.openembedded.org/openembedded-core-contrib rbt/efi
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/efi

Patch 1 and 2 are the same, here is patch 3:

commit 4d56b6768748368a1a792c0d9e29ddfa2f87d2aa
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Fri Apr 1 00:32:55 2016 -0700

     grub-efi.bbclass: use GRUB_ROOT rather than APPEND for root device

     Use APPEND for grub's root device may cause confusion, for example, when
     building efi + pcbios, there maybe be two root=/dev/ram0, one of them
     would be carried to the installed target, and the target would fail to
     boot. Use GRUB_ROOT to fix the problem, and remove SYSLINUX_ROOT from
     APPEND will fix the problem.

     [YOCTO #9354]

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 3d8ff11..4ce3d28 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -14,6 +14,7 @@
  # ${APPEND} - an override list of append strings for each label
  # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # 
(optional)
  # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
+# ${GRUB_ROOT} - grub's root device.

  do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
  do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
@@ -26,7 +27,8 @@ GRUB_TIMEOUT ?= "10"
  GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"

  EFIDIR = "/EFI/BOOT"
-APPEND_prepend = " ${ROOT} "
+GRUB_ROOT ?= "${ROOT}"
+APPEND ?= ""

  # Need UUID utility code.
  inherit fs-uuid
@@ -108,6 +110,10 @@ python build_efi_cfg() {
      else:
          cfgfile.write('timeout=50\n')

+    root = d.getVar('GRUB_ROOT', True)
+    if not root:
+        raise bb.build.FuncFailed('GRUB_ROOT not defined')
+
      if gfxserial == "1":
          btypes = [ [ " graphics console", "" ],
              [ " serial console", d.getVar('GRUB_SERIAL', True) or "" ] ]
@@ -131,6 +137,8 @@ python build_efi_cfg() {
                  lb = "install-efi"
              cfgfile.write('linux /vmlinuz LABEL=%s' % (lb))

+            cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
+
              append = localdata.getVar('APPEND', True)
              initrd = localdata.getVar('INITRD', True)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 7d324c3..defad73 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -33,7 +33,7 @@ AUTO_SYSLINUXMENU ?= "1"
  SYSLINUX_ROOT ?= "${ROOT}"
  SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
  SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
-APPEND_prepend = " ${SYSLINUX_ROOT} "
+APPEND ?= ""

  # Need UUID utility code.
  inherit fs-uuid
@@ -164,6 +164,10 @@ python build_syslinux_cfg () {
              btypes = [ [ "Graphics console ", syslinux_default_console  ],
                  [ "Serial console ", syslinux_serial_tty ] ]

+        root= d.getVar('SYSLINUX_ROOT', True)
+        if not root:
+            raise bb.build.FuncFailed('SYSLINUX_ROOT not defined')
+
          for btype in btypes:
              cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))

@@ -174,17 +178,15 @@ python build_syslinux_cfg () {
              append = localdata.getVar('APPEND', True)
              initrd = localdata.getVar('INITRD', True)

-            if append:
-                cfgfile.write('APPEND ')
+            append = root + " " + append
+            cfgfile.write('APPEND ')

-                if initrd:
-                    cfgfile.write('initrd=/initrd ')
+            if initrd:
+                cfgfile.write('initrd=/initrd ')

-                cfgfile.write('LABEL=%s '% (label))
-                append = replace_rootfs_uuid(d, append)
-                cfgfile.write('%s %s\n' % (append, btype[1]))
-            else:
-                cfgfile.write('APPEND %s\n' % btype[1])
+            cfgfile.write('LABEL=%s '% (label))
+            append = replace_rootfs_uuid(d, append)
+            cfgfile.write('%s %s\n' % (append, btype[1]))

      cfgfile.close()
  }


// Robert

On 04/01/2016 05:14 PM, Robert Yang wrote:
> The following changes since commit 322904f62f11e794543362f04212242567c556a0:
>
>    selftest/signing: Use packagedata to obtain PR value for signing test (2016-03-31 23:55:13 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/efi
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=19f9e2e1bf005d885453ec2d5ead37de78c6bd0c
>
> Robert Yang (3):
>    init-install.sh: fix disk_size
>    init-install-efi.sh: remove all root=foo from grub.cfg
>    grub-efi.bbclass: don't use APPEND
>
>   meta/classes/grub-efi.bbclass                                | 12 ++++++------
>   .../initrdscripts/files/init-install-efi-testfs.sh           |  2 +-
>   meta/recipes-core/initrdscripts/files/init-install-efi.sh    |  4 ++--
>   meta/recipes-core/initrdscripts/files/init-install.sh        |  2 +-
>   4 files changed, 10 insertions(+), 10 deletions(-)
>

