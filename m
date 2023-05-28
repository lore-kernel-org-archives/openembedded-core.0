Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78324C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.33144.1685293705214060283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=G74BRg2f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d24136685so1742069b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293704; x=1687885704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3qrwiqyYB1mxCmGP1yMfTBYQKNwnDvtqsdXoiHm2rc=;
        b=G74BRg2fAB+vBj+bfJkS8rdqBrGws7liJewvoM7+f3mSEgMPQyLVoV9maQa73qGI2V
         gzMeO+ISkWf6KXHJeUwLEqpIr59PlfALYEpav+ZL2bNRZHHfFwDMsisSWKNoFtROW7YX
         1grCXYLDLWftY0A64fjdK+F9XTe1ynrCkALqP0hrdCfnOjPI6aTFgpg7YW1oFLWx/x46
         g0XZEqDLKcY2zePdJyzA0gYE6IpiWlnvgCr8YjC5RLNgTTQ99xQDJlOocumerNM1+KaK
         ESswOo6tzP3TXr9tO4gT9tJfMVzzhaTw5rcWqwI3nX+8EI8wgagw1Y1ubdqJOCrKiRu+
         JAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293704; x=1687885704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3qrwiqyYB1mxCmGP1yMfTBYQKNwnDvtqsdXoiHm2rc=;
        b=EO+ulNOAEBqDxPQ/8afSMJTjNajdyGnXzmYeLvhm6mrP04Il39/yG6T+3mFYd4H6Tb
         bQdso20aWxOTFGfqy1z/lmlRq+18g+8MrTAfQ7rJPSJk0xYSkOEz+IheK/c+KAJFG8p4
         t0ZTUTisYcXD0VJhxp/TgnHfJg/TsQ4l5FkEvC0WSvM0GngZ7zPCGOZx2sZr5B+rGzsH
         1FhiLu3J/lzqz3N+FZ+9eQTEX++UT14E2f1X6SypTBUjpCHW3QE5lC3jgQTOioHW2prB
         djiI1ldSP6u+wjAtQ9lQBQGeVy3b2sJyrgpoo3SByWkSD5Ffb28Q1YdrMFD/RAAEUYlm
         u+Ig==
X-Gm-Message-State: AC+VfDw08ATKqiZtOTq8nS5t7xR+lSMIDmotnGa/LxBCn6HMwRJIGzDY
	nWp34eFB87dGQcCLJlnNlDw+fJ61FyV1cKzUqJc=
X-Google-Smtp-Source: ACHHUZ6h86+mv4Yhp+JBjF06zaIaJ0I3P3FaAyQlaqrHec3ql0VRXIhV1OTl6wx42qrcLR57yDLBVA==
X-Received: by 2002:a05:6a00:2313:b0:645:834c:f521 with SMTP id h19-20020a056a00231300b00645834cf521mr6007898pfh.17.1685293703920;
        Sun, 28 May 2023 10:08:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/12] gdb: fix crashes when debugging threads with Arm Pointer Authentication enabled
Date: Sun, 28 May 2023 07:07:55 -1000
Message-Id: <c46d0cfe4b18318c00390eb112edcbea8b8d6a7a.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181847

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 8057edfcb23004b18ab8cb09b9a359346ed54db9)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a6120d0c7946842195f0c7624b7c3025e74e7964)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 ...r-valid-inferior-thread-regcache-bef.patch | 286 ++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 9457c27f8b..8589de62ff 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch \
            file://add-missing-ldflags.patch \
+           file://0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch \
            "
 SRC_URI[sha256sum] = "115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0"
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch b/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
new file mode 100644
index 0000000000..9adf4a4db5
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
@@ -0,0 +1,286 @@
+From b3eff3e15576229af9bae026c5c23ee694b90389 Mon Sep 17 00:00:00 2001
+From: Luis Machado <luis.machado@arm.com>
+Date: Fri, 24 Mar 2023 07:58:38 +0000
+Subject: [PATCH] aarch64: Check for valid inferior thread/regcache before
+ reading pauth registers
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+There were reports of gdb throwing internal errors when calling
+inferior_thread ()/get_current_regcache () on a system with
+Pointer Authentication enabled.
+
+In such cases, gdb produces the following backtrace, or a variation
+of it (for gdb's with the non-address removal implemented only in
+the aarch64-linux-tdep.c file).
+
+../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_thread: Assertion `current_thread_ != nullptr' failed.
+A problem internal to GDB has been detected,
+further debugging may prove unreliable.
+----- Backtrace -----
+0xaaaae04a571f gdb_internal_backtrace_1
+        ../../../repos/binutils-gdb/gdb/bt-utils.c:122
+0xaaaae04a57f3 _Z22gdb_internal_backtracev
+        ../../../repos/binutils-gdb/gdb/bt-utils.c:168
+0xaaaae0b52ccf internal_vproblem
+        ../../../repos/binutils-gdb/gdb/utils.c:401
+0xaaaae0b5310b _Z15internal_verrorPKciS0_St9__va_list
+        ../../../repos/binutils-gdb/gdb/utils.c:481
+0xaaaae0e24b8f _Z18internal_error_locPKciS0_z
+        ../../../repos/binutils-gdb/gdbsupport/errors.cc:58
+0xaaaae0a88983 _Z15inferior_threadv
+        ../../../repos/binutils-gdb/gdb/thread.c:86
+0xaaaae0956c87 _Z20get_current_regcachev
+        ../../../repos/binutils-gdb/gdb/regcache.c:428
+0xaaaae035223f aarch64_remove_non_address_bits
+        ../../../repos/binutils-gdb/gdb/aarch64-tdep.c:3572
+0xaaaae03e8abb _Z31gdbarch_remove_non_address_bitsP7gdbarchm
+        ../../../repos/binutils-gdb/gdb/gdbarch.c:3109
+0xaaaae0a692d7 memory_xfer_partial
+        ../../../repos/binutils-gdb/gdb/target.c:1620
+0xaaaae0a695e3 _Z19target_xfer_partialP10target_ops13target_objectPKcPhPKhmmPm
+        ../../../repos/binutils-gdb/gdb/target.c:1684
+0xaaaae0a69e9f target_read_partial
+        ../../../repos/binutils-gdb/gdb/target.c:1937
+0xaaaae0a69fdf _Z11target_readP10target_ops13target_objectPKcPhml
+        ../../../repos/binutils-gdb/gdb/target.c:1977
+0xaaaae0a69937 _Z18target_read_memorymPhl
+        ../../../repos/binutils-gdb/gdb/target.c:1773
+0xaaaae08be523 ps_xfer_memory
+        ../../../repos/binutils-gdb/gdb/proc-service.c:90
+0xaaaae08be6db ps_pdread
+        ../../../repos/binutils-gdb/gdb/proc-service.c:124
+0x40001ed7c3b3 _td_fetch_value
+        /build/glibc-RIFKjK/glibc-2.31/nptl_db/fetch-value.c:115
+0x40001ed791ef td_ta_map_lwp2thr
+        /build/glibc-RIFKjK/glibc-2.31/nptl_db/td_ta_map_lwp2thr.c:194
+0xaaaae07f4473 thread_from_lwp
+        ../../../repos/binutils-gdb/gdb/linux-thread-db.c:413
+0xaaaae07f6d6f _ZN16thread_db_target4waitE6ptid_tP17target_waitstatus10enum_flagsI16target_wait_flagE
+        ../../../repos/binutils-gdb/gdb/linux-thread-db.c:1420
+0xaaaae0a6b33b _Z11target_wait6ptid_tP17target_waitstatus10enum_flagsI16target_wait_flagE
+        ../../../repos/binutils-gdb/gdb/target.c:2586
+0xaaaae0789cf7 do_target_wait_1
+        ../../../repos/binutils-gdb/gdb/infrun.c:3825
+0xaaaae0789e6f operator()
+        ../../../repos/binutils-gdb/gdb/infrun.c:3884
+0xaaaae078a167 do_target_wait
+        ../../../repos/binutils-gdb/gdb/infrun.c:3903
+0xaaaae078b0af _Z20fetch_inferior_eventv
+        ../../../repos/binutils-gdb/gdb/infrun.c:4314
+0xaaaae076652f _Z22inferior_event_handler19inferior_event_type
+        ../../../repos/binutils-gdb/gdb/inf-loop.c:41
+0xaaaae07dc68b handle_target_event
+        ../../../repos/binutils-gdb/gdb/linux-nat.c:4206
+0xaaaae0e25fbb handle_file_event
+        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:573
+0xaaaae0e264f3 gdb_wait_for_event
+        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:694
+0xaaaae0e24f9b _Z16gdb_do_one_eventi
+        ../../../repos/binutils-gdb/gdbsupport/event-loop.cc:217
+0xaaaae080f033 start_event_loop
+        ../../../repos/binutils-gdb/gdb/main.c:411
+0xaaaae080f1b7 captured_command_loop
+        ../../../repos/binutils-gdb/gdb/main.c:475
+0xaaaae0810b97 captured_main
+        ../../../repos/binutils-gdb/gdb/main.c:1318
+0xaaaae0810c1b _Z8gdb_mainP18captured_main_args
+        ../../../repos/binutils-gdb/gdb/main.c:1337
+0xaaaae0338453 main
+        ../../../repos/binutils-gdb/gdb/gdb.c:32
+---------------------
+../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_thread: Assertion `current_thread_ != nullptr' failed.
+A problem internal to GDB has been detected,
+further debugging may prove unreliable.
+Quit this debugging session? (y or n)
+
+We also see failures across the testsuite if the tests get executed on a target
+that has native support for the pointer authentication feature. But
+gdb.base/break.exp and gdb.base/access-mem-running.exp are two examples of
+tests that run into errors and internal errors.
+
+This issue started after commit d88cb738e6a7a7179dfaff8af78d69250c852af1, which
+enabled more broad use of pointer authentication masks to remove non-address
+bits of pointers, but wasn't immediately detected because systems with native
+support for pointer authentication are not that common yet.
+
+The above crash happens because gdb is in the middle of handling an event,
+and do_target_wait_1 calls switch_to_inferior_no_thread, nullifying the
+current thread.  This means a call to inferior_thread () will assert, and
+attempting to call get_current_regcache () will also call inferior_thread (),
+resulting in an assertion as well.
+
+target_has_registers was one function that seemed useful for detecting these
+types of situation where we don't have a register cache. The problem with that
+is the inconsistent state of inferior_ptid, which is used by
+target_has_registers.
+
+Despite the call to switch_to_no_thread in switch_to_inferior_no_thread from
+do_target_wait_1 in the backtrace above clearing inferior_ptid, the call to
+ps_xfer_memory sets inferior_ptid momentarily before reading memory:
+
+static ps_err_e
+ps_xfer_memory (const struct ps_prochandle *ph, psaddr_t addr,
+                gdb_byte *buf, size_t len, int write)
+{
+  scoped_restore_current_inferior restore_inferior;
+  set_current_inferior (ph->thread->inf);
+
+  scoped_restore_current_program_space restore_current_progspace;
+  set_current_program_space (ph->thread->inf->pspace);
+
+  scoped_restore save_inferior_ptid = make_scoped_restore (&inferior_ptid);
+  inferior_ptid = ph->thread->ptid;
+
+  CORE_ADDR core_addr = ps_addr_to_core_addr (addr);
+
+  int ret;
+  if (write)
+    ret = target_write_memory (core_addr, buf, len);
+  else
+    ret = target_read_memory (core_addr, buf, len);
+  return (ret == 0 ? PS_OK : PS_ERR);
+}
+
+Maybe this shouldn't happen, or maybe it is just an unfortunate state to be
+in. But this prevents the use of target_has_registers to guard against the
+lack of registers, since, although current_thread_ is still nullptr,
+inferior_ptid is valid and is not null_ptid.
+
+There is another crash scenario after we kill a previously active inferior, in
+which case the gdbarch will still say we support pointer authentication but we
+will also have no current thread (inferior_thread () will assert etc).
+
+If the target has support for pointer authentication, gdb needs to use
+a couple (or 4, for bare-metal) mask registers to mask off some bits of
+pointers, and for that it needs to access the registers.
+
+At some points, like the one from the backtrace above, there is no active
+thread/current regcache because gdb is in the middle of doing event handling
+and switching between threads.
+
+Simon suggested the use of inferior_ptid to fetch the register cache, as
+opposed to relying on the current register cache.  Though we need to make sure
+inferior_ptid is valid (not null_ptid), I think this works nicely.
+
+With inferior_ptid, we can do safety checks along the way, making sure we have
+a thread to fetch a register cache from and checking if the thread is actually
+stopped or running.
+
+The following patch implements this idea with safety checks to make sure we
+don't run into assertions or errors.  If any of the checks fail, we fallback to
+using a default mask to remove non-address bits of a pointer.
+
+I discussed with Pedro the possibility of caching the mask register values
+(which are per-process and can change mid-execution), but there isn't a good
+spot to cache those values. Besides, the mask registers can change constantly
+for bare-metal debugging when switching between exception levels.
+
+In some cases, it is just not possible to get access to these mask registers,
+like the case where threads are running. In those cases, using a default mask
+to remove the non-address bits should be enough.
+
+This can happen when we let threads run in the background and then we attempt
+to access a memory address (now that gdb is capable of reading memory even
+with threads running).  Thus gdb will attempt to remove non-address bits
+of that memory access, will attempt to access registers, running into errors.
+
+Regression-tested on aarch64-linux Ubuntu 20.04.
+---
+ gdb/aarch64-linux-tdep.c | 64 ++++++++++++++++++++++++++++++----------
+ 1 file changed, 49 insertions(+), 15 deletions(-)
+
+diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
+index 20a041c599e..4b2915b8e99 100644
+--- a/gdb/aarch64-linux-tdep.c
++++ b/gdb/aarch64-linux-tdep.c
+@@ -57,6 +57,9 @@
+ #include "elf/common.h"
+ #include "elf/aarch64.h"
+ 
++/* For inferior_ptid and current_inferior ().  */
++#include "inferior.h"
++
+ /* Signal frame handling.
+ 
+       +------------+  ^
+@@ -1986,29 +1989,60 @@ aarch64_linux_decode_memtag_section (struct gdbarch *gdbarch,
+ static CORE_ADDR
+ aarch64_remove_non_address_bits (struct gdbarch *gdbarch, CORE_ADDR pointer)
+ {
+-  aarch64_gdbarch_tdep *tdep = gdbarch_tdep<aarch64_gdbarch_tdep> (gdbarch);
+-
+   /* By default, we assume TBI and discard the top 8 bits plus the VA range
+-     select bit (55).  */
++     select bit (55).  Below we try to fetch information about pointer
++     authentication masks in order to make non-address removal more
++     precise.  */
+   CORE_ADDR mask = AARCH64_TOP_BITS_MASK;
+ 
+-  if (tdep->has_pauth ())
++  /* Check if we have an inferior first.  If not, just use the default
++     mask.
++
++     We use the inferior_ptid here because the pointer authentication masks
++     should be the same across threads of a process.  Since we may not have
++     access to the current thread (gdb may have switched to no inferiors
++     momentarily), we use the inferior ptid.  */
++  if (inferior_ptid != null_ptid)
+     {
+-      /* Fetch the PAC masks.  These masks are per-process, so we can just
+-	 fetch data from whatever thread we have at the moment.
++      /* If we do have an inferior, attempt to fetch its thread's thread_info
++	 struct.  */
++      thread_info *thread
++	= find_thread_ptid (current_inferior ()->process_target (),
++			    inferior_ptid);
+ 
+-	 Also, we have both a code mask and a data mask.  For now they are the
+-	 same, but this may change in the future.  */
+-      struct regcache *regs = get_current_regcache ();
+-      CORE_ADDR cmask, dmask;
++      /* If the thread is running, we will not be able to fetch the mask
++	 registers.  */
++      if (thread != nullptr && thread->state != THREAD_RUNNING)
++	{
++	  /* Otherwise, fetch the register cache and the masks.  */
++	  struct regcache *regs
++	    = get_thread_regcache (current_inferior ()->process_target (),
++				   inferior_ptid);
++
++	  /* Use the gdbarch from the register cache to check for pointer
++	     authentication support, as it matches the features found in
++	     that particular thread.  */
++	  aarch64_gdbarch_tdep *tdep
++	    = gdbarch_tdep<aarch64_gdbarch_tdep> (regs->arch ());
++
++	  /* Is there pointer authentication support?  */
++	  if (tdep->has_pauth ())
++	    {
++	      /* We have both a code mask and a data mask.  For now they are
++		 the same, but this may change in the future.  */
++	      CORE_ADDR cmask, dmask;
+ 
+-      if (regs->cooked_read (tdep->pauth_reg_base, &dmask) != REG_VALID)
+-	dmask = mask;
++	      if (regs->cooked_read (tdep->pauth_reg_base, &dmask)
++		  != REG_VALID)
++		dmask = mask;
+ 
+-      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask) != REG_VALID)
+-	cmask = mask;
++	      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask)
++		  != REG_VALID)
++		cmask = mask;
+ 
+-      mask |= aarch64_mask_from_pac_registers (cmask, dmask);
++	      mask |= aarch64_mask_from_pac_registers (cmask, dmask);
++	    }
++	}
+     }
+ 
+   return aarch64_remove_top_bits (pointer, mask);
+-- 
+2.34.1
+
-- 
2.34.1


