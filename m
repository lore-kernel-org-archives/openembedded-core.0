Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5630CEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.83749.1691927657722702586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W7gZdUue;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe45481edfso35148495e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927656; x=1692532456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtcdg+/tHiS4R/XC6aWQJqvpaONe57Hate0Y1nuPevw=;
        b=W7gZdUuejtclN1LZyA1lq5cFq3nUlDd6idcPOh4uEEUHTf3XSq98duadaNdT3iMP/b
         TMrEi5AaAf2zgM3YnI+mQ3bsi80nK69s2jBp+arGbc4+6Wmtv0dr8L0/dHvydPI0x6uk
         PAsBxSGduEB2+M1M0W/FRAmTYjgrNtNM/80RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927656; x=1692532456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtcdg+/tHiS4R/XC6aWQJqvpaONe57Hate0Y1nuPevw=;
        b=FM9Jiyhp9sRbNA5QR0CabOM81FAaT7pgleMMCUJVvZPJZTBzHB3KG8QkDbTjtfyycT
         HZFHIGMyvXdwQceQ/AzEJKdpIser44wbnaJdBe4qsc2Fcfs4msYgC0EEEuZT6CFxj7v3
         kPkO2kvYgPdF//ViVwmDmtrLTrWz8Up13vbBN54uhCO94VAqz13zhwI/ZXqiwgcBi/Vr
         Vflfi4tsfkoBgE0fYgOUqj0S6gtTcdrfyP/2d1Kzayw5AAll3xj/NkusqtNb+fpacBmk
         6OKFiOzrV2A7Ra0VyNQFBGIXkdeTxZP/LWp1UBQ1riW0dNhFbTZX5vk9taI9T0x+aGR2
         4KHg==
X-Gm-Message-State: AOJu0YynPKhv7zgfsayn9Mm1D4ySCb5xI8P2BknDm3vy98PMwEAGydqF
	FoTKJJxNOWHFmM9IImtm33LG9SD/RFf807844n4=
X-Google-Smtp-Source: AGHT+IEN7/z0vOQmSN97Bzfe2wNPeIqgH8rn3n+Sdl7A076ozUFTSqjmgWfyW3Ua9eJ9fgm+qzv3oA==
X-Received: by 2002:a7b:cd99:0:b0:3fe:63ca:ccf6 with SMTP id y25-20020a7bcd99000000b003fe63caccf6mr5625839wmj.16.1691927655966;
        Sun, 13 Aug 2023 04:54:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/8] gcc: Add patch to improve testsuite failures, particularly mips
Date: Sun, 13 Aug 2023 12:54:09 +0100
Message-Id: <20230813115410.163212-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185879

Disable loongson-mmi runtine, qemu doesn't appear to fully support them even if some
of the instruction decoding is there.

Also disable MSA mips runtime extensions. For some reason qemu appears to accept the test
code when it shouldn't. Our selected MIPS cpu for QEMU doesn't support them.

MIPS is unusual in the gcc testsuite as it uses EFFECTIVE_TARGETS and loops
multiple times through the vector testsuite. In the case of the two above, we can
compile/link them but not run them. Even with the runtime disabled, if the code
marks it as a runtime test, it will elevate itself to that. Setting the default
target to compile therefore isn't enough.

Therefore add code to downgrade runtime tests to link tests if the hardware
support isn't there to run them. This avoids thousands of test failures. To do
this we have to hook downgrade code into the main test runner.

Enable that downgrading for other cases where hardware to run vector extensions is
unavailable to remove test failures on other architectures too.

Also, for gcc.target tests, add checks on wheter loongson or msa code can
be run before trying that, allowing downgrading of tests there to work too.

Parts of the patch may be able to be split off and acceptable to upstream with
discussion. Need to investigate why qemu-user passes the 'bad' instructions'.

For now, this should at least remove hundreds of test failures and improve test
failures on non-mips too now a root cause of some was identified.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
 .../gcc/gcc/0025-gcc-testsuite-mips.patch     | 225 ++++++++++++++++++
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
index 7329562f657..7f97ecc3329 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -64,6 +64,7 @@ SRC_URI = "${BASEURI} \
            file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
+           file://0025-gcc-testsuite-mips.patch \
 "
 SRC_URI[sha256sum] = "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
new file mode 100644
index 00000000000..49eaece923c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-mips.patch
@@ -0,0 +1,225 @@
+gcc testsuite tweaks for mips/OE
+
+Disable loongson-mmi runtine, qemu doesn't appear to fully support them even if some
+of the instruction decoding is there.
+
+Also disable MSA mips runtime extensions. For some reason qemu appears to accept the test
+code when it shouldn't. Our selected MIPS cpu for QEMU doesn't support them.
+
+MIPS is unusual in the gcc testsuite as it uses EFFECTIVE_TARGETS and loops
+multiple times through the vector testsuite. In the case of the two above, we can
+compile/link them but not run them. Even with the runtime disabled, if the code
+marks it as a runtime test, it will elevate itself to that. Setting the default
+target to compile therefore isn't enough.
+
+Therefore add code to downgrade runtime tests to link tests if the hardware
+support isn't there to run them. This avoids thousands of test failures. To do
+this we have to hook downgrade code into the main test runner.
+
+Enable that downgrading for other cases where hardware to run vector extensions is
+unavailable to remove test failures on other architectures too.
+
+Also, for gcc.target tests, add checks on wheter loongson or msa code can
+be run before trying that, allowing downgrading of tests there to work too.
+
+Upstream-Status: Pending
+[Parts of the patch may be able to be split off and acceptable to upstream with
+discussion. Need to investigate why qemu-user passes the 'bad' instructions']
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
+===================================================================
+--- gcc-13.2.0.orig/gcc/testsuite/lib/target-supports.exp
++++ gcc-13.2.0/gcc/testsuite/lib/target-supports.exp
+@@ -2155,14 +2155,7 @@ proc check_mips_loongson_mmi_hw_availabl
+ 	if { !([istarget mips*-*-*]) } {
+ 	    expr 0
+ 	} else {
+-	    check_runtime_nocache mips_loongson_mmi_hw_available {
+-	      #include <loongson-mmiintrin.h>
+-	      int main()
+-	      {
+-		asm volatile ("paddw $f2,$f4,$f6");
+-		return 0;
+-	      }
+-	    } "-mloongson-mmi"
++	    expr 0
+ 	}
+     }]
+ }
+@@ -2176,29 +2169,7 @@ proc check_mips_msa_hw_available { } {
+     if { !([istarget mips*-*-*]) } {
+       expr 0
+     } else {
+-      check_runtime_nocache mips_msa_hw_available {
+-	#if !defined(__mips_msa)
+-	#error "MSA NOT AVAIL"
+-	#else
+-	#if !(((__mips == 64) || (__mips == 32)) && (__mips_isa_rev >= 2))
+-	#error "MSA NOT AVAIL FOR ISA REV < 2"
+-	#endif
+-	#if !defined(__mips_hard_float)
+-	#error "MSA HARD_FLOAT REQUIRED"
+-	#endif
+-	#if __mips_fpr != 64
+-	#error "MSA 64-bit FPR REQUIRED"
+-	#endif
+-	#include <msa.h>
+-
+-	int main()
+-	{
+-	  v8i16 v = __builtin_msa_ldi_h (0);
+-	  v[0] = 0;
+-	  return v[0];
+-	}
+-	#endif
+-      } "-mmsa"
++      expr 0
+     }
+   }]
+ }
+@@ -9187,6 +9158,7 @@ proc is-effective-target-keyword { arg }
+ 
+ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+     global dg-do-what-default
++    global do-what-limit
+     global EFFECTIVE_TARGETS
+     global et_index
+ 
+@@ -9194,6 +9166,7 @@ proc et-dg-runtest { runtest testcases f
+ 	foreach target $EFFECTIVE_TARGETS {
+ 	    set target_flags $flags
+ 	    set dg-do-what-default compile
++            set do-what-limit link
+ 	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
+ 	    if { [info procs add_options_for_${target}] != [list] } {
+ 		set target_flags [add_options_for_${target} "$flags"]
+@@ -9201,8 +9174,10 @@ proc et-dg-runtest { runtest testcases f
+ 	    if { [info procs check_effective_target_${target}_runtime]
+ 		 != [list] && [check_effective_target_${target}_runtime] } {
+ 		set dg-do-what-default run
++		set do-what-limit run
+ 	    }
+ 	    $runtest $testcases $target_flags ${default-extra-flags}
++	    unset do-what-limit
+ 	}
+     } else {
+ 	set et_index 0
+@@ -10789,6 +10764,7 @@ proc check_effective_target_sigsetjmp {}
+ proc check_vect_support_and_set_flags { } {
+     global DEFAULT_VECTCFLAGS
+     global dg-do-what-default
++    global do-what-limit
+     global EFFECTIVE_TARGETS
+ 
+     if  [istarget powerpc-*paired*]  {
+@@ -10797,6 +10773,7 @@ proc check_vect_support_and_set_flags {
+             set dg-do-what-default run
+         } else {
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif [istarget powerpc*-*-*] {
+         # Skip targets not supporting -maltivec.
+@@ -10821,6 +10798,7 @@ proc check_vect_support_and_set_flags {
+                 lappend DEFAULT_VECTCFLAGS "-mcpu=970"
+             }
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif { [istarget i?86-*-*] || [istarget x86_64-*-*] } {
+         lappend DEFAULT_VECTCFLAGS "-msse2"
+@@ -10828,6 +10806,7 @@ proc check_vect_support_and_set_flags {
+             set dg-do-what-default run
+         } else {
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif { [istarget mips*-*-*]
+ 	       && [check_effective_target_nomips16] } {
+@@ -10847,6 +10826,7 @@ proc check_vect_support_and_set_flags {
+             set dg-do-what-default run
+         } else {
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif [istarget alpha*-*-*] {
+         # Alpha's vectorization capabilities are extremely limited.
+@@ -10860,6 +10840,7 @@ proc check_vect_support_and_set_flags {
+             set dg-do-what-default run
+         } else {
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif [istarget ia64-*-*] {
+         set dg-do-what-default run
+@@ -10873,6 +10854,7 @@ proc check_vect_support_and_set_flags {
+             set dg-do-what-default run
+         } else {
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif [istarget aarch64*-*-*] {
+         set dg-do-what-default run
+@@ -10897,6 +10879,7 @@ proc check_vect_support_and_set_flags {
+         } else {
+ 	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
+             set dg-do-what-default compile
++            set do-what-limit link
+         }
+     } elseif [istarget amdgcn-*-*] {
+         set dg-do-what-default run
+Index: gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
+===================================================================
+--- gcc-13.2.0.orig/gcc/testsuite/gcc.target/mips/mips.exp
++++ gcc-13.2.0/gcc/testsuite/gcc.target/mips/mips.exp
+@@ -709,7 +709,23 @@ proc mips_first_unsupported_option { ups
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
+Index: gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
+===================================================================
+--- gcc-13.2.0.orig/gcc/testsuite/lib/gcc-dg.exp
++++ gcc-13.2.0/gcc/testsuite/lib/gcc-dg.exp
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
-- 
2.39.2


