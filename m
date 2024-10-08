Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3D4CEFC48
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4699.1728415872475054963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03D8DA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B34F3F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] oe/elf: don't regenerate machine data on every call
Date: Tue,  8 Oct 2024 20:30:57 +0100
Message-Id: <20241008193103.2429829-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205304

Every time oe.elf.machine_dict() is called a large dictionary is created
and returned. However, the "arch" package_qa test will call this method
for every binary in a package, which results in a lot of dictionary
creation.

Concrete exmaple: in running ltp:do_package_qa, the arch test takes 25%
of the runtime, and opitimising the machine_dict() call to cache the
generated dictionary reduces the runtime from 57s to 44s.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/elf.py | 264 +++++++++++++++++++++++----------------------
 1 file changed, 133 insertions(+), 131 deletions(-)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index eab2349a4fe..e1bc7b89846 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -5,141 +5,143 @@
 #
=20
 def machine_dict(d):
-#           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little =
Endian, 32bit?
-    machdata =3D {
-            "darwin9" : {=20
-                        "arm" :       (40,     0,    0,          True,  =
        32),
-                      },
-            "eabi" : {
-                        "arm" :       (40,     0,    0,          True,  =
        32),
-                      },
-            "elf" : {
-                        "aarch64" :   (183,    0,    0,          True,  =
        64),
-                        "aarch64_be" :(183,    0,    0,          False, =
        64),
-                        "i586" :      (3,      0,    0,          True,  =
        32),
-                        "i686" :      (3,      0,    0,          True,  =
        32),
-                        "x86_64":     (62,     0,    0,          True,  =
        64),
-                        "epiphany":   (4643,   0,    0,          True,  =
        32),
-                        "lm32":       (138,    0,    0,          False, =
        32),
-                        "loongarch64":(258,    0,    0,          True,  =
        64),
-                        "mips":       ( 8,     0,    0,          False, =
        32),
-                        "mipsel":     ( 8,     0,    0,          True,  =
        32),
-                        "microblaze":  (189,   0,    0,          False, =
        32),
-                        "microblazeel":(189,   0,    0,          True,  =
        32),
-                        "powerpc":    (20,     0,    0,          False, =
        32),
-                        "riscv32":    (243,    0,    0,          True,  =
        32),
-                        "riscv64":    (243,    0,    0,          True,  =
        64),
-                      },
-            "linux" : {=20
-                        "aarch64" :   (183,    0,    0,          True,  =
        64),
-                        "aarch64_be" :(183,    0,    0,          False, =
        64),
-                        "arm" :       (40,    97,    0,          True,  =
        32),
-                        "armeb":      (40,    97,    0,          False, =
        32),
-                        "powerpc":    (20,     0,    0,          False, =
        32),
-                        "powerpc64":  (21,     0,    0,          False, =
        64),
-                        "powerpc64le":  (21,     0,    0,          True,=
         64),
-                        "i386":       ( 3,     0,    0,          True,  =
        32),
-                        "i486":       ( 3,     0,    0,          True,  =
        32),
-                        "i586":       ( 3,     0,    0,          True,  =
        32),
-                        "i686":       ( 3,     0,    0,          True,  =
        32),
-                        "x86_64":     (62,     0,    0,          True,  =
        64),
-                        "ia64":       (50,     0,    0,          True,  =
        64),
-                        "alpha":      (36902,  0,    0,          True,  =
        64),
-                        "hppa":       (15,     3,    0,          False, =
        32),
-                        "loongarch64":(258,    0,    0,          True,  =
        64),
-                        "m68k":       ( 4,     0,    0,          False, =
        32),
-                        "mips":       ( 8,     0,    0,          False, =
        32),
-                        "mipsel":     ( 8,     0,    0,          True,  =
        32),
-                        "mips64":     ( 8,     0,    0,          False, =
        64),
-                        "mips64el":   ( 8,     0,    0,          True,  =
        64),
-                        "mipsisa32r6":   ( 8,  0,    0,          False, =
        32),
-                        "mipsisa32r6el": ( 8,  0,    0,          True,  =
        32),
-                        "mipsisa64r6":   ( 8,  0,    0,          False, =
        64),
-                        "mipsisa64r6el": ( 8,  0,    0,          True,  =
        64),
-                        "nios2":      (113,    0,    0,          True,  =
        32),
-                        "riscv32":    (243,    0,    0,          True,  =
        32),
-                        "riscv64":    (243,    0,    0,          True,  =
        64),
-                        "s390":       (22,     0,    0,          False, =
        32),
-                        "sh4":        (42,     0,    0,          True,  =
        32),
-                        "sparc":      ( 2,     0,    0,          False, =
        32),
-                        "microblaze":  (189,   0,    0,          False, =
        32),
-                        "microblazeel":(189,   0,    0,          True,  =
        32),
-                      },
-            "linux-android" : {
-                        "aarch64" :   (183,    0,    0,          True,  =
        64),
-                        "i686":       ( 3,     0,    0,          True,  =
        32),
-                        "x86_64":     (62,     0,    0,          True,  =
        64),
-                      },
-            "linux-androideabi" : {
-                        "arm" :       (40,    97,    0,          True,  =
        32),
-                      },
-            "linux-musl" : {=20
-                        "aarch64" :   (183,    0,    0,            True,=
          64),
-                        "aarch64_be" :(183,    0,    0,            False=
,         64),
-                        "arm" :       (  40,    97,    0,          True,=
          32),
-                        "armeb":      (  40,    97,    0,          False=
,         32),
-                        "powerpc":    (  20,     0,    0,          False=
,         32),
-                        "powerpc64":  (  21,     0,    0,          False=
,         64),
-                        "powerpc64le":  (21,     0,    0,          True,=
         64),
-                        "i386":       (   3,     0,    0,          True,=
          32),
-                        "i486":       (   3,     0,    0,          True,=
          32),
-                        "i586":       (   3,     0,    0,          True,=
          32),
-                        "i686":       (   3,     0,    0,          True,=
          32),
-                        "x86_64":     (  62,     0,    0,          True,=
          64),
-                        "mips":       (   8,     0,    0,          False=
,         32),
-                        "mipsel":     (   8,     0,    0,          True,=
          32),
-                        "mips64":     (   8,     0,    0,          False=
,         64),
-                        "mips64el":   (   8,     0,    0,          True,=
          64),
-                        "microblaze":  (189,     0,    0,          False=
,         32),
-                        "microblazeel":(189,     0,    0,          True,=
          32),
-                        "riscv32":    (243,      0,    0,          True,=
          32),
-                        "riscv64":    (243,      0,    0,          True,=
          64),
-                        "sh4":        (  42,     0,    0,          True,=
          32),
-                      },
-            "uclinux-uclibc" : {
-                        "bfin":       ( 106,     0,    0,          True,=
         32),
-                      },=20
-            "linux-gnueabi" : {
-                        "arm" :       (40,     0,    0,          True,  =
        32),
-                        "armeb" :     (40,     0,    0,          False, =
        32),
-                      },
-            "linux-musleabi" : {
-                        "arm" :       (40,     0,    0,          True,  =
        32),
-                        "armeb" :     (40,     0,    0,          False, =
        32),
-                      },
-            "linux-gnuspe" : {
-                        "powerpc":    (20,     0,    0,          False, =
        32),
-                      },
-            "linux-muslspe" : {
-                        "powerpc":    (20,     0,    0,          False, =
        32),
-                      },
-            "linux-gnu" :       {
-                        "powerpc":    (20,     0,    0,          False, =
        32),
-                        "sh4":        (42,     0,    0,          True,  =
        32),
-                      },
-            "linux-gnu_ilp32" :     {
-                        "aarch64" :   (183,    0,    0,          True,  =
        32),
-                      },
-            "linux-gnux32" :       {
-                        "x86_64":     (62,     0,    0,          True,  =
        32),
-                      },
-            "linux-muslx32" :       {
-                        "x86_64":     (62,     0,    0,          True,  =
        32),
-                      },
-            "linux-gnun32" :       {
-                        "mips64":       ( 8,     0,    0,          False=
,         32),
-                        "mips64el":     ( 8,     0,    0,          True,=
          32),
-                        "mipsisa64r6":  ( 8,     0,    0,          False=
,         32),
-                        "mipsisa64r6el":( 8,     0,    0,          True,=
          32),
-                      },
-        }
+  # Generating this data is slow, so cache it
+  if not hasattr(machine_dict, "machdata"):
+    machine_dict.machdata =3D {
+      # TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endi=
an, 32bit?
+      "darwin9" : {=20
+                  "arm" :       (40,     0,    0,          True,        =
  32),
+                },
+      "eabi" : {
+                  "arm" :       (40,     0,    0,          True,        =
  32),
+                },
+      "elf" : {
+                  "aarch64" :   (183,    0,    0,          True,        =
  64),
+                  "aarch64_be" :(183,    0,    0,          False,       =
  64),
+                  "i586" :      (3,      0,    0,          True,        =
  32),
+                  "i686" :      (3,      0,    0,          True,        =
  32),
+                  "x86_64":     (62,     0,    0,          True,        =
  64),
+                  "epiphany":   (4643,   0,    0,          True,        =
  32),
+                  "lm32":       (138,    0,    0,          False,       =
  32),
+                  "loongarch64":(258,    0,    0,          True,        =
  64),
+                  "mips":       ( 8,     0,    0,          False,       =
  32),
+                  "mipsel":     ( 8,     0,    0,          True,        =
  32),
+                  "microblaze":  (189,   0,    0,          False,       =
  32),
+                  "microblazeel":(189,   0,    0,          True,        =
  32),
+                  "powerpc":    (20,     0,    0,          False,       =
  32),
+                  "riscv32":    (243,    0,    0,          True,        =
  32),
+                  "riscv64":    (243,    0,    0,          True,        =
  64),
+                },
+      "linux" : {=20
+                  "aarch64" :   (183,    0,    0,          True,        =
  64),
+                  "aarch64_be" :(183,    0,    0,          False,       =
  64),
+                  "arm" :       (40,    97,    0,          True,        =
  32),
+                  "armeb":      (40,    97,    0,          False,       =
  32),
+                  "powerpc":    (20,     0,    0,          False,       =
  32),
+                  "powerpc64":  (21,     0,    0,          False,       =
  64),
+                  "powerpc64le":  (21,     0,    0,          True,      =
   64),
+                  "i386":       ( 3,     0,    0,          True,        =
  32),
+                  "i486":       ( 3,     0,    0,          True,        =
  32),
+                  "i586":       ( 3,     0,    0,          True,        =
  32),
+                  "i686":       ( 3,     0,    0,          True,        =
  32),
+                  "x86_64":     (62,     0,    0,          True,        =
  64),
+                  "ia64":       (50,     0,    0,          True,        =
  64),
+                  "alpha":      (36902,  0,    0,          True,        =
  64),
+                  "hppa":       (15,     3,    0,          False,       =
  32),
+                  "loongarch64":(258,    0,    0,          True,        =
  64),
+                  "m68k":       ( 4,     0,    0,          False,       =
  32),
+                  "mips":       ( 8,     0,    0,          False,       =
  32),
+                  "mipsel":     ( 8,     0,    0,          True,        =
  32),
+                  "mips64":     ( 8,     0,    0,          False,       =
  64),
+                  "mips64el":   ( 8,     0,    0,          True,        =
  64),
+                  "mipsisa32r6":   ( 8,  0,    0,          False,       =
  32),
+                  "mipsisa32r6el": ( 8,  0,    0,          True,        =
  32),
+                  "mipsisa64r6":   ( 8,  0,    0,          False,       =
  64),
+                  "mipsisa64r6el": ( 8,  0,    0,          True,        =
  64),
+                  "nios2":      (113,    0,    0,          True,        =
  32),
+                  "riscv32":    (243,    0,    0,          True,        =
  32),
+                  "riscv64":    (243,    0,    0,          True,        =
  64),
+                  "s390":       (22,     0,    0,          False,       =
  32),
+                  "sh4":        (42,     0,    0,          True,        =
  32),
+                  "sparc":      ( 2,     0,    0,          False,       =
  32),
+                  "microblaze":  (189,   0,    0,          False,       =
  32),
+                  "microblazeel":(189,   0,    0,          True,        =
  32),
+                },
+      "linux-android" : {
+                  "aarch64" :   (183,    0,    0,          True,        =
  64),
+                  "i686":       ( 3,     0,    0,          True,        =
  32),
+                  "x86_64":     (62,     0,    0,          True,        =
  64),
+                },
+      "linux-androideabi" : {
+                  "arm" :       (40,    97,    0,          True,        =
  32),
+                },
+      "linux-musl" : {=20
+                  "aarch64" :   (183,    0,    0,            True,      =
    64),
+                  "aarch64_be" :(183,    0,    0,            False,     =
    64),
+                  "arm" :       (  40,    97,    0,          True,      =
    32),
+                  "armeb":      (  40,    97,    0,          False,     =
    32),
+                  "powerpc":    (  20,     0,    0,          False,     =
    32),
+                  "powerpc64":  (  21,     0,    0,          False,     =
    64),
+                  "powerpc64le":  (21,     0,    0,          True,      =
   64),
+                  "i386":       (   3,     0,    0,          True,      =
    32),
+                  "i486":       (   3,     0,    0,          True,      =
    32),
+                  "i586":       (   3,     0,    0,          True,      =
    32),
+                  "i686":       (   3,     0,    0,          True,      =
    32),
+                  "x86_64":     (  62,     0,    0,          True,      =
    64),
+                  "mips":       (   8,     0,    0,          False,     =
    32),
+                  "mipsel":     (   8,     0,    0,          True,      =
    32),
+                  "mips64":     (   8,     0,    0,          False,     =
    64),
+                  "mips64el":   (   8,     0,    0,          True,      =
    64),
+                  "microblaze":  (189,     0,    0,          False,     =
    32),
+                  "microblazeel":(189,     0,    0,          True,      =
    32),
+                  "riscv32":    (243,      0,    0,          True,      =
    32),
+                  "riscv64":    (243,      0,    0,          True,      =
    64),
+                  "sh4":        (  42,     0,    0,          True,      =
    32),
+                },
+      "uclinux-uclibc" : {
+                  "bfin":       ( 106,     0,    0,          True,      =
   32),
+                },=20
+      "linux-gnueabi" : {
+                  "arm" :       (40,     0,    0,          True,        =
  32),
+                  "armeb" :     (40,     0,    0,          False,       =
  32),
+                },
+      "linux-musleabi" : {
+                  "arm" :       (40,     0,    0,          True,        =
  32),
+                  "armeb" :     (40,     0,    0,          False,       =
  32),
+                },
+      "linux-gnuspe" : {
+                  "powerpc":    (20,     0,    0,          False,       =
  32),
+                },
+      "linux-muslspe" : {
+                  "powerpc":    (20,     0,    0,          False,       =
  32),
+                },
+      "linux-gnu" :       {
+                  "powerpc":    (20,     0,    0,          False,       =
  32),
+                  "sh4":        (42,     0,    0,          True,        =
  32),
+                },
+      "linux-gnu_ilp32" :     {
+                  "aarch64" :   (183,    0,    0,          True,        =
  32),
+                },
+      "linux-gnux32" :       {
+                  "x86_64":     (62,     0,    0,          True,        =
  32),
+                },
+      "linux-muslx32" :       {
+                  "x86_64":     (62,     0,    0,          True,        =
  32),
+                },
+      "linux-gnun32" :       {
+                  "mips64":       ( 8,     0,    0,          False,     =
    32),
+                  "mips64el":     ( 8,     0,    0,          True,      =
    32),
+                  "mipsisa64r6":  ( 8,     0,    0,          False,     =
    32),
+                  "mipsisa64r6el":( 8,     0,    0,          True,      =
    32),
+                },
+    }
=20
     # Add in any extra user supplied data which may come from a BSP laye=
r, removing the
     # need to always change this class directly
     extra_machdata =3D (d and d.getVar("PACKAGEQA_EXTRA_MACHDEFFUNCS" or=
 None) or "").split()
     for m in extra_machdata:
         call =3D m + "(machdata, d)"
-        locs =3D { "machdata" : machdata, "d" : d}
-        machdata =3D bb.utils.better_eval(call, locs)
+        locs =3D { "machdata" : machine_dict.machdata, "d" : d}
+        machine_dict.machdata =3D bb.utils.better_eval(call, locs)
=20
-    return machdata
+  return machine_dict.machdata
--=20
2.34.1


