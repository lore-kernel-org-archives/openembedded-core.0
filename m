Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2478CD37AA
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 20:42:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.31777.1694810574976375121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 13:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UbVKJKBz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-401f68602a8so27875405e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694810573; x=1695415373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OmuQZU3LPm3AaxFPA5DMy8TYyeURETGNO0CiETNmM7g=;
        b=UbVKJKBzFSjoSAtdm077ruRrxV+etsDgV3uc53XQOe2XQ3k5Oag5L/ucqSiTTjkUYD
         leJVfzjVYMCgx1F5C5Liv2TBHYqxT480qIlHlSn6aRxyZqyz3pB8Xan8+7g3WxR6DsLE
         5cJKj8h1dbFKKU3hbYXOpbRhm6eyHPOwsDmW/x4bx+5su1S9rWRO9mWtwgFCMAmIADpl
         JOdisVvb5D25DAeuTennaUkMW6x1HrWfbim2Q23vN59c5LN/g2R7WvVJdE3pvmv8uUL3
         +61O97YHHv+IqaLa6wcF8haPdEfy/8jCixHwsnQrzMpXdlIrJL/qXcacHr9D8fDRzxz7
         KPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694810573; x=1695415373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmuQZU3LPm3AaxFPA5DMy8TYyeURETGNO0CiETNmM7g=;
        b=dqFNDKyHUQn1G80zuuS3H4oJfwRRoBXkixQSvUfvpSVik/p1oYDIkxvBHRWRMURQIy
         RQy5nIdI9h7k/odOO5IxAwh3o3FfpkIFz0U8Ps3a5XqJhoCg+X722G99eVwELBWKhR5t
         2S5XUeb3iZgjzwAcKGoji8XCw0eIeAUpalYzpr+RrOmXNDOO8Xr/gI8GKVASKrmG4M2s
         YHtwXMlhqzabBLwjHEv7yQw2fF6AIP4f8UPawpfwEhJytDX0iCNJFl8CuLuPjdKduc6e
         XL/TIN7sFF0UwUvzWJNNztRIBJR0UCiaft21NEbD3Rm07YG/KR3AeccUkk1ZCrFqi/7z
         UdfQ==
X-Gm-Message-State: AOJu0Yyzz/z4LsFEPoFyqqKMilavzEgP4kgnFI+UWk1eUiMj0JOFTyLF
	vuoOms7kKNTz08qro2dVWRlcw836Hbk=
X-Google-Smtp-Source: AGHT+IFBk2ypwcC6wN9i492nZSvC+0SO4WRyENKvGYWImGcLtOjbu5fadJUwOhk43Itzh3ixB0em+w==
X-Received: by 2002:adf:ea47:0:b0:315:9676:c360 with SMTP id j7-20020adfea47000000b003159676c360mr2195282wrn.25.1694810573043;
        Fri, 15 Sep 2023 13:42:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d17-20020aa7ce11000000b0052568bf9411sm2654110edv.68.2023.09.15.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:42:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] gcc: backport a fix for ICE caused by CVE-2023-4039.patch
Date: Fri, 15 Sep 2023 22:42:47 +0200
Message-ID: <20230915204247.3549304-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 20:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187769

* see:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111418
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111411

* add git headers to 0025-gcc-testsuite-mips.patch so that it does
  easily apply with other patches with git am

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   3 +-
 ...25-gcc-testsuite-tweaks-for-mips-OE.patch} | 148 +++++++++---------
 ...ch64-Fix-loose-ldpstp-check-PR111411.patch | 117 ++++++++++++++
 3 files changed, 197 insertions(+), 71 deletions(-)
 rename meta/recipes-devtools/gcc/gcc/{0025-gcc-testsuite-mips.patch => 0025-gcc-testsuite-tweaks-for-mips-OE.patch} (76%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index 0922251e18..d96f3171e4 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -64,8 +64,9 @@ SRC_URI = "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
-           file://0025-gcc-testsuite-mips.patch \
+           file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://CVE-2023-4039.patch \
+           file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
 "
 SRC_URI[sha256sum] = "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
similarity index 76%
rename from meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
rename to meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index 49eaece923..c405d8d484 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -1,4 +1,7 @@
-gcc testsuite tweaks for mips/OE
+From f12acc6a383546d48da3bdfb2f25ca2adb7976d7 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 13 Aug 2023 10:24:05 +0100
+Subject: [PATCH] gcc testsuite tweaks for mips/OE
 
 Disable loongson-mmi runtine, qemu doesn't appear to fully support them even if some
 of the instruction decoding is there.
@@ -27,12 +30,70 @@ Upstream-Status: Pending
 discussion. Need to investigate why qemu-user passes the 'bad' instructions']
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ gcc/testsuite/gcc.target/mips/mips.exp | 16 +++++++++
+ gcc/testsuite/lib/gcc-dg.exp           | 11 +++++++
+ gcc/testsuite/lib/target-supports.exp  | 45 ++++++++------------------
+ 3 files changed, 41 insertions(+), 31 deletions(-)
 
-Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
-===================================================================
---- gcc-13.2.0.orig/gcc/testsuite/lib/target-supports.exp
-+++ gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
-@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_availabl
+diff --git a/gcc/testsuite/gcc.target/mips/mips.exp b/gcc/testsuite/gcc.target/mips/mips.exp
+index 15d574202d3..2cef9709774 100644
+--- a/gcc/testsuite/gcc.target/mips/mips.exp
++++ b/gcc/testsuite/gcc.target/mips/mips.exp
+@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { upstatus } {
+     global mips_option_tests
+     upvar $upstatus status
+ 
++    if { [mips_have_test_option_p status "-mmsa"] } {
++        verbose -log "Found -mmsa"
++	if { ![check_mips_msa_hw_available] } {
++	    verbose -log "No MSA avail"
++	    return "-mmsa"
++	}
++    }
++    if { [mips_have_test_option_p status "-mloongson-mmi"] } {
++        verbose -log "Found -mloonson-mmi"
++        if { ![check_mips_loongson_mmi_hw_available] } {
++	    verbose -log "No MMI avail"
++   	    return "-mloonson-mmi"
++	}
++    }
++
+     foreach { option code } [array get mips_option_tests] {
++
+ 	if { [mips_have_test_option_p status $option] } {
+ 	    regsub -all "\n" $code "\\n\\\n" asm
+ 	    # Use check_runtime from target-supports.exp, which caches
+diff --git a/gcc/testsuite/lib/gcc-dg.exp b/gcc/testsuite/lib/gcc-dg.exp
+index 9d79b9402e9..e0e5cbb1af8 100644
+--- a/gcc/testsuite/lib/gcc-dg.exp
++++ b/gcc/testsuite/lib/gcc-dg.exp
+@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {
+ 
+ proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {
+     # Set up the compiler flags, based on what we're going to do.
++    global do-what-limit
+ 
+     set options [list]
+ 
++    if [info exists do-what-limit] then {
++        # Demote run tests to $do-what-limit if set
++	switch $do_what {
++	    run {
++    	        set do_what $do-what-limit
++  		set dg-do-what $do-what-limit
++	    }
++        }
++    }
++
+     switch $do_what {
+ 	"preprocess" {
+ 	    set compile_type "preprocess"
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
+index 40f71e9ed8b..10e267fa16d 100644
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
+@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -79,7 +140,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      }
    }]
  }
-@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg }
+@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
@@ -87,7 +148,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases f
+@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
@@ -95,7 +156,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
  	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases f
+@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
@@ -106,7 +167,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
  	}
      } else {
  	set et_index 0
-@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {}
+@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -114,7 +175,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
      global EFFECTIVE_TARGETS
  
      if  [istarget powerpc-*paired*]  {
-@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags {
+@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -122,7 +183,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget powerpc*-*-*] {
          # Skip targets not supporting -maltivec.
-@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags {
+@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags { } {
                  lappend DEFAULT_VECTCFLAGS "-mcpu=970"
              }
              set dg-do-what-default compile
@@ -130,7 +191,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif { [istarget i?86-*-*] || [istarget x86_64-*-*] } {
          lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags {
+@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -138,7 +199,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags {
+@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -146,7 +207,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget alpha*-*-*] {
          # Alpha's vectorization capabilities are extremely limited.
-@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags {
+@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -154,7 +215,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget ia64-*-*] {
          set dg-do-what-default run
-@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags {
+@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -162,7 +223,7 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget aarch64*-*-*] {
          set dg-do-what-default run
-@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags {
+@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags { } {
          } else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
              set dg-do-what-default compile
@@ -170,56 +231,3 @@ Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
          }
      } elseif [istarget amdgcn-*-*] {
          set dg-do-what-default run
-Index: gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
-===================================================================
---- gcc-13.2.0.orig/gcc/testsuite/gcc.target/mips/mips.exp
-+++ gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
-@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { ups
-     global mips_option_tests
-     upvar $upstatus status
- 
-+    if { [mips_have_test_option_p status "-mmsa"] } {
-+        verbose -log "Found -mmsa"
-+	if { ![check_mips_msa_hw_available] } {
-+	    verbose -log "No MSA avail"
-+	    return "-mmsa"
-+	}
-+    }
-+    if { [mips_have_test_option_p status "-mloongson-mmi"] } {
-+        verbose -log "Found -mloonson-mmi"
-+        if { ![check_mips_loongson_mmi_hw_available] } {
-+	    verbose -log "No MMI avail"
-+   	    return "-mloonson-mmi"
-+	}
-+    }
-+
-     foreach { option code } [array get mips_option_tests] {
-+
- 	if { [mips_have_test_option_p status $option] } {
- 	    regsub -all "\n" $code "\\n\\\n" asm
- 	    # Use check_runtime from target-supports.exp, which caches
-Index: gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
-===================================================================
---- gcc-13.2.0.orig/gcc/testsuite/lib/gcc-dg.exp
-+++ gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
-@@ -240,9 +240,20 @@ proc schedule-cleanups { opts } {
- 
- proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {
-     # Set up the compiler flags, based on what we're going to do.
-+    global do-what-limit
- 
-     set options [list]
- 
-+    if [info exists do-what-limit] then {
-+        # Demote run tests to $do-what-limit if set
-+	switch $do_what {
-+	    run {
-+    	        set do_what $do-what-limit
-+  		set dg-do-what $do-what-limit
-+	    }
-+        }
-+    }
-+
-     switch $do_what {
- 	"preprocess" {
- 	    set compile_type "preprocess"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch
new file mode 100644
index 0000000000..a408a98698
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch
@@ -0,0 +1,117 @@
+From adb60dc78e0da4877747f32347cee339364775be Mon Sep 17 00:00:00 2001
+From: Richard Sandiford <richard.sandiford@arm.com>
+Date: Fri, 15 Sep 2023 09:19:14 +0100
+Subject: [PATCH] aarch64: Fix loose ldpstp check [PR111411]
+
+aarch64_operands_ok_for_ldpstp contained the code:
+
+  /* One of the memory accesses must be a mempair operand.
+     If it is not the first one, they need to be swapped by the
+     peephole.  */
+  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
+    return false;
+
+But the requirement isn't just that one of the accesses must be a
+valid mempair operand.  It's that the lower access must be, since
+that's the access that will be used for the instruction operand.
+
+gcc/
+	PR target/111411
+	* config/aarch64/aarch64.cc (aarch64_operands_ok_for_ldpstp): Require
+	the lower memory access to a mem-pair operand.
+
+gcc/testsuite/
+	PR target/111411
+	* gcc.dg/rtl/aarch64/pr111411.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=2d38f45bcca62ca0c7afef4b579f82c5c2a01610]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ gcc/config/aarch64/aarch64.cc               |  8 ++-
+ gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c | 57 +++++++++++++++++++++
+ 2 files changed, 60 insertions(+), 5 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+
+diff --git a/gcc/config/aarch64/aarch64.cc b/gcc/config/aarch64/aarch64.cc
+index 6118a3354ac..9b1f791ca8b 100644
+--- a/gcc/config/aarch64/aarch64.cc
++++ b/gcc/config/aarch64/aarch64.cc
+@@ -26154,11 +26154,9 @@ aarch64_operands_ok_for_ldpstp (rtx *operands, bool load,
+   gcc_assert (known_eq (GET_MODE_SIZE (GET_MODE (mem_1)),
+ 			GET_MODE_SIZE (GET_MODE (mem_2))));
+ 
+-  /* One of the memory accesses must be a mempair operand.
+-     If it is not the first one, they need to be swapped by the
+-     peephole.  */
+-  if (!aarch64_mem_pair_operand (mem_1, GET_MODE (mem_1))
+-       && !aarch64_mem_pair_operand (mem_2, GET_MODE (mem_2)))
++  /* The lower memory access must be a mem-pair operand.  */
++  rtx lower_mem = reversed ? mem_2 : mem_1;
++  if (!aarch64_mem_pair_operand (lower_mem, GET_MODE (lower_mem)))
+     return false;
+ 
+   if (REG_P (reg_1) && FP_REGNUM_P (REGNO (reg_1)))
+diff --git a/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+new file mode 100644
+index 00000000000..ad07e9c6c89
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/rtl/aarch64/pr111411.c
+@@ -0,0 +1,57 @@
++/* { dg-do compile { target aarch64*-*-* } } */
++/* { dg-require-effective-target lp64 } */
++/* { dg-options "-O -fdisable-rtl-postreload -fpeephole2 -fno-schedule-fusion" } */
++
++extern int data[];
++
++void __RTL (startwith ("ira")) foo (void *ptr)
++{
++  (function "foo"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++	(edge-from entry (flags "FALLTHRU"))
++	(cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++	(insn 4 (set (reg:DI <0>) (reg:DI x0)))
++	(insn 5 (set (reg:DI <1>)
++		     (plus:DI (reg:DI <0>) (const_int 768))))
++	(insn 6 (set (mem:SI (plus:DI (reg:DI <0>)
++				      (const_int 508)) [1 &data+508 S4 A4])
++		     (const_int 0)))
++	(insn 7 (set (mem:SI (plus:DI (reg:DI <1>)
++				      (const_int -256)) [1 &data+512 S4 A4])
++		     (const_int 0)))
++	(edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
++
++void __RTL (startwith ("ira")) bar (void *ptr)
++{
++  (function "bar"
++    (param "ptr"
++      (DECL_RTL (reg/v:DI <0> [ ptr ]))
++      (DECL_RTL_INCOMING (reg/v:DI x0 [ ptr ]))
++    ) ;; param "ptr"
++    (insn-chain
++      (block 2
++	(edge-from entry (flags "FALLTHRU"))
++	(cnote 3 [bb 2] NOTE_INSN_BASIC_BLOCK)
++	(insn 4 (set (reg:DI <0>) (reg:DI x0)))
++	(insn 5 (set (reg:DI <1>)
++		     (plus:DI (reg:DI <0>) (const_int 768))))
++	(insn 6 (set (mem:SI (plus:DI (reg:DI <1>)
++				      (const_int -256)) [1 &data+512 S4 A4])
++		     (const_int 0)))
++	(insn 7 (set (mem:SI (plus:DI (reg:DI <0>)
++				      (const_int 508)) [1 &data+508 S4 A4])
++		     (const_int 0)))
++	(edge-to exit (flags "FALLTHRU"))
++      ) ;; block 2
++    ) ;; insn-chain
++  ) ;; function
++}
-- 
2.42.0


