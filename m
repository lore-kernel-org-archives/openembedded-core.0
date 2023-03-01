Return-Path: <tomasagustin.gonzalezorlando@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E41C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 12:46:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20814.1677674765137510173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 04:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tomasagustin.gonzalezorlando@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84742F4;
	Wed,  1 Mar 2023 04:46:47 -0800 (PST)
Received: from e126979.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1094E3F587;
	Wed,  1 Mar 2023 04:46:03 -0800 (PST)
From: =?UTF-8?q?Tom=C3=A1s=20Gonz=C3=A1lez?= <tomasagustin.gonzalezorlando@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: tomasagustin.gonzalezorlando@arm.com
Subject: [PATCH] bootimg-efi: Use the custom .dtb file's path as its final location
Date: Wed,  1 Mar 2023 12:45:51 +0000
Message-Id: <20230301124551.159892-1-tomasagustin.gonzalezorlando@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 12:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177885

From: tomasagustin.gonzalezorlando@arm.com

When specifying a custom .dtb with the --sourceparams=3D"dtb=3D<path>" pa=
rameter,
the custom file is looked for in ${DEPLOY_DIR_IMAGE}/<path>, and the resu=
lting
grub config file is set to look for the .dtb under /<path> inside the boo=
t
partition. However, the file is not currently being copied there.

Change the behaviour of the --sourceparams=3D"dtb=3D<path>" parameter so =
that
the custom .dtb file is copied under /<path> in the boot partition.

Include oe-selftest to validate the functionality.

Signed-off-by: Tom=C3=A1s Gonz=C3=A1lez <tomasagustin.gonzalezorlando@arm=
.com>
---
 .../recipes-test/dtb/devicetree-sample.bb     |  8 +++
 .../dtb/files/sample-devicetree.dts           | 69 +++++++++++++++++++
 meta-selftest/wic/test_dtb_efi.wks            |  3 +
 meta/lib/oeqa/selftest/cases/wic.py           | 16 +++++
 scripts/lib/wic/plugins/source/bootimg-efi.py |  2 +-
 5 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/dtb/devicetree-sample.bb
 create mode 100644 meta-selftest/recipes-test/dtb/files/sample-devicetre=
e.dts
 create mode 100644 meta-selftest/wic/test_dtb_efi.wks

diff --git a/meta-selftest/recipes-test/dtb/devicetree-sample.bb b/meta-s=
elftest/recipes-test/dtb/devicetree-sample.bb
new file mode 100644
index 0000000000..8be977a821
--- /dev/null
+++ b/meta-selftest/recipes-test/dtb/devicetree-sample.bb
@@ -0,0 +1,8 @@
+SUMMARY =3D "Device tree"
+DESCRIPTION =3D "Contains a Device Tree recipe to be used to for testing=
."
+
+inherit devicetree
+
+SRC_URI +=3D "file://sample-devicetree.dts"
+
+COMPATIBLE_MACHINE =3D ""
diff --git a/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts b=
/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts
new file mode 100644
index 0000000000..71af0e117b
--- /dev/null
+++ b/meta-selftest/recipes-test/dtb/files/sample-devicetree.dts
@@ -0,0 +1,69 @@
+/dts-v1/;
+/ {
+	compatible =3D "opencores,or1ksim";
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	interrupt-parent =3D <&pic>;
+
+	aliases {
+		uart0 =3D &serial0;
+	};
+
+	chosen {
+		bootargs =3D "earlycon";
+		stdout-path =3D "uart0:115200";
+	};
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x02000000>;
+	};
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		cpu@0 {
+			compatible =3D "opencores,or1200-rtlsvn481";
+			reg =3D <0>;
+			clock-frequency =3D <20000000>;
+		};
+		cpu@1 {
+			compatible =3D "opencores,or1200-rtlsvn481";
+			reg =3D <1>;
+			clock-frequency =3D <20000000>;
+		};
+	};
+
+	ompic: ompic@98000000 {
+		compatible =3D "openrisc,ompic";
+		reg =3D <0x98000000 16>;
+		interrupt-controller;
+		#interrupt-cells =3D <0>;
+		interrupts =3D <1>;
+	};
+
+	/*
+	 * OR1K PIC is built into CPU and accessed via special purpose
+	 * registers.  It is not addressable and, hence, has no 'reg'
+	 * property.
+	 */
+	pic: pic {
+		compatible =3D "opencores,or1k-pic-level";
+		#interrupt-cells =3D <1>;
+		interrupt-controller;
+	};
+
+	serial0: serial@90000000 {
+		compatible =3D "opencores,uart16550-rtlsvn105", "ns16550a";
+		reg =3D <0x90000000 0x100>;
+		interrupts =3D <2>;
+		clock-frequency =3D <20000000>;
+	};
+
+	enet0: ethoc@92000000 {
+		compatible =3D "opencores,ethoc";
+		reg =3D <0x92000000 0x800>;
+		interrupts =3D <4>;
+		big-endian;
+	};
+};
diff --git a/meta-selftest/wic/test_dtb_efi.wks b/meta-selftest/wic/test_=
dtb_efi.wks
new file mode 100644
index 0000000000..61a7b1c9b4
--- /dev/null
+++ b/meta-selftest/wic/test_dtb_efi.wks
@@ -0,0 +1,3 @@
+part /boot --active --source bootimg-efi --sourceparams=3D"loader=3Dgrub=
-efi,dtb=3Ddevicetree/sample-devicetree.dtb" --active --align 1024 --use-=
uuid --part-type EF00
+part / --source rootfs --fstype=3Dext4 --align 1024 --use-uuid
+bootloader --ptable gpt --timeout=3D1 --append=3D"rootwait rootfstype=3D=
ext4 console=3DttyS0,115200n8"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 0d664d7c39..d702c57679 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1512,3 +1512,19 @@ class ModifyTests(WicTestCase):
         # check if it's removed
         result =3D runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         self.assertTrue('etc' not in [line.split()[-1] for line in resul=
t.output.split('\n') if line])
+
+    def test_dtb_efi(self):
+        """Test custom dtb"""
+        config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_dtb_efi.=
wks"\nMACHINE_FEATURES:append =3D " efi"\n'
+        config +=3D 'EXTRA_IMAGEDEPENDS =3D "devicetree-sample"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+
+        deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D self.td['MACHINE']
+        image_path =3D os.path.join(deploy_dir, 'core-image-minimal-%s.w=
ic' % machine)
+
+        self.assertTrue(os.path.exists(image_path))
+
+        result =3D runCmd("wic ls %s:1/devicetree" % (image_path))
+        self.assertTrue('sample-devicetree.dtb' in [line.split()[-1] for=
 line in result.output.split('\n') if line])
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index 4b00913a70..69c427e01d 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -51,7 +51,7 @@ class BootimgEFIPlugin(SourcePlugin):
         if dtb:
             if ';' in dtb:
                 raise WicError("Only one DTB supported, exiting")
-            cp_cmd =3D "cp %s/%s %s" % (bootimg_dir, dtb, hdddir)
+            cp_cmd =3D "install -D %s/%s %s/%s" % (bootimg_dir, dtb, hdd=
dir, dtb)
             exec_cmd(cp_cmd, True)
=20
     @classmethod
--=20
2.25.1


