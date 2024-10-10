Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171EECFC5E2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:06:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47526.1728576397256351687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8192F497
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8E4603F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:06:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 11/11] insane: rewrite package_qa_check_arch
Date: Thu, 10 Oct 2024 17:06:23 +0100
Message-Id: <20241010160623.2880937-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010160623.2880937-1-ross.burton@arm.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205420

Reorder and comment the architecture checks to make it clearer what they
are actually checking.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 41 ++++++++++++++++++------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 2d69bdec8d3..36b139a20d0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -325,32 +325,41 @@ def package_qa_check_arch(path,name,d, elf):
=20
     host_os   =3D d.getVar('HOST_OS')
     host_arch =3D d.getVar('HOST_ARCH')
-    provides =3D d.getVar('PROVIDES')
-    bpn =3D d.getVar('BPN')
+    provides  =3D d.getVar('PROVIDES')
=20
     if host_arch =3D=3D "allarch":
-        pn =3D d.getVar('PN')
-        oe.qa.handle_error("arch", pn + ": Recipe inherits the allarch c=
lass, but has packaged architecture-specific binaries", d)
+        oe.qa.handle_error("arch", "%s: inherits the allarch class, but =
has architecture-specific binaries %s" % \
+            (name, package_qa_clean_path(path, d, name)), d)
         return
=20
-    #if this will throw an exception, then fix the dict above
-    (machine, osabi, abiversion, littleendian, bits) \
+    # If this throws an exception, the machine_dict needs expanding
+    (expected_machine, expected_osabi, expected_abiversion, expected_lit=
tleendian, expected_bits) \
         =3D oe.elf.machine_dict(d)[host_os][host_arch]
=20
+    actual_machine =3D elf.machine()
+    actual_bits =3D elf.abiSize()
+    actual_littleendian =3D elf.isLittleEndian()
+
+    # BPF don't match the target
+    if oe.qa.elf_machine_to_string(actual_machine) =3D=3D "BPF":
+        return
+
+    # These targets have 32-bit userspace but 64-bit kernel, so fudge th=
e expected values
+    if (("virtual/kernel" in provides) or bb.data.inherits_class("module=
", d)) and (host_os in ("linux-gnux32", "linux-muslx32", "linux-gnu_ilp32=
") or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE'))):
+        expected_bits =3D 64
+
     # Check the architecture and endiannes of the binary
-    is_32 =3D (("virtual/kernel" in provides) or bb.data.inherits_class(=
"module", d)) and \
-            (host_os =3D=3D "linux-gnux32" or host_os =3D=3D "linux-musl=
x32" or \
-            host_os =3D=3D "linux-gnu_ilp32" or re.match(r'mips64.*32', =
d.getVar('DEFAULTTUNE')))
-    is_bpf =3D (oe.qa.elf_machine_to_string(elf.machine()) =3D=3D "BPF")
-    if not ((machine =3D=3D elf.machine()) or is_32 or is_bpf):
+    if expected_machine !=3D actual_machine:
         oe.qa.handle_error("arch", "Architecture did not match (%s, expe=
cted %s) in %s" % \
-                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_=
machine_to_string(machine), package_qa_clean_path(path, d, name)), d)
-    elif not ((bits =3D=3D elf.abiSize()) or is_32 or is_bpf):
+                 (oe.qa.elf_machine_to_string(actual_machine), oe.qa.elf=
_machine_to_string(expected_machine), package_qa_clean_path(path, d, name=
)), d)
+
+    if expected_bits !=3D actual_bits:
         oe.qa.handle_error("arch", "Bit size did not match (%d, expected=
 %d) in %s" % \
-                 (elf.abiSize(), bits, package_qa_clean_path(path, d, na=
me)), d)
-    elif not ((littleendian =3D=3D elf.isLittleEndian()) or is_bpf):
+                 (actual_bits, expected_bits, package_qa_clean_path(path=
, d, name)), d)
+
+    if expected_littleendian !=3D actual_littleendian:
         oe.qa.handle_error("arch", "Endiannes did not match (%d, expecte=
d %d) in %s" % \
-                 (elf.isLittleEndian(), littleendian, package_qa_clean_p=
ath(path, d, name)), d)
+                 (actual_littleendian, expected_littleendian, package_qa=
_clean_path(path, d, name)), d)
 package_qa_check_arch[vardepsexclude] =3D "DEFAULTTUNE"
=20
 QAPATHTEST[desktop] =3D "package_qa_check_desktop"
--=20
2.34.1


