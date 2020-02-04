Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F96E61107
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:06:43 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014L6UMx009706;
	Tue, 4 Feb 2020 15:06:43 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 15:06:30 -0600
Message-Id: <20200204210630.41960-6-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
References: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH v4 5/5] Microblaze: Adjust Linux items from microblazeeb to microblaze
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
X-List-Received-Date: Tue, 04 Feb 2020 21:06:44 -0000

Due to recent changes to the tune, in order to match config.guess, the name
of the big-endian microblaze architecture was changes to 'microblaze'.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/meson.bbclass                                     | 2 +-
 meta/classes/siteinfo.bbclass                                  | 3 ---
 meta/lib/oe/elf.py                                             | 3 ---
 .../ghostscript/{microblazeeb => microblaze}/objarch.h         | 0
 4 files changed, 1 insertion(+), 7 deletions(-)
 rename meta/recipes-extended/ghostscript/ghostscript/{microblazeeb => microblaze}/objarch.h (100%)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 001602bd04..06034e8b47 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -57,7 +57,7 @@ def meson_cpu_family(var, d):
         return 'mips64'
     elif re.match(r"i[3-6]86", arch):
         return "x86"
-    elif arch == "microblazeel" or arch == "microblazeeb":
+    elif arch == "microblazeel":
         return "microblaze"
     else:
         return arch
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index d62aaac0f0..1a048c053f 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -35,7 +35,6 @@ def siteinfo_data_for_machine(arch, os, d):
         "lm32": "endian-big bit-32",
         "m68k": "endian-big bit-32",
         "microblaze": "endian-big bit-32 microblaze-common",
-        "microblazeeb": "endian-big bit-32 microblaze-common",
         "microblazeel": "endian-little bit-32 microblaze-common",
         "mips": "endian-big bit-32 mips-common",
         "mips64": "endian-big bit-64 mips-common",
@@ -89,8 +88,6 @@ def siteinfo_data_for_machine(arch, os, d):
         "arm-linux-musleabi": "arm-linux",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-musleabi": "armeb-linux",
-        "microblazeeb-linux" : "microblaze-linux",
-        "microblazeeb-linux-musl" : "microblaze-linux",
         "microblazeel-linux" : "microblaze-linux",
         "microblazeel-linux-musl" : "microblaze-linux",
         "mips-linux-musl": "mips-linux",
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 2ed614f652..df0a4593fa 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -22,7 +22,6 @@ def machine_dict(d):
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
                         "microblaze":  (189,   0,    0,          False,         32),
-                        "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                         "powerpc":    (20,     0,    0,          False,         32),
                         "riscv32":    (243,    0,    0,          True,          32),
@@ -60,7 +59,6 @@ def machine_dict(d):
                         "sh4":        (42,     0,    0,          True,          32),
                         "sparc":      ( 2,     0,    0,          False,         32),
                         "microblaze":  (189,   0,    0,          False,         32),
-                        "microblazeeb":(189,   0,    0,          False,         32),
                         "microblazeel":(189,   0,    0,          True,          32),
                       },
             "linux-musl" : { 
@@ -81,7 +79,6 @@ def machine_dict(d):
                         "mips64":     (   8,     0,    0,          False,         64),
                         "mips64el":   (   8,     0,    0,          True,          64),
                         "microblaze":  (189,     0,    0,          False,         32),
-                        "microblazeeb":(189,     0,    0,          False,         32),
                         "microblazeel":(189,     0,    0,          True,          32),
                         "riscv32":    (243,      0,    0,          True,          32),
                         "riscv64":    (243,      0,    0,          True,          64),
diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
-- 
2.17.1


