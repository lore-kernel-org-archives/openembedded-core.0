Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EA6C7EE23
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 13:10:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49025.1683205813683143154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 06:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BBD2F4;
	Thu,  4 May 2023 06:10:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99C5B3F67D;
	Thu,  4 May 2023 06:10:12 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] gdb: fix crashes when debugging threads with Arm Pointer Authentication enabled
Date: Thu,  4 May 2023 14:10:08 +0100
Message-Id: <20230504131010.2182417-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 13:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180872

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 ...r-valid-inferior-thread-regcache-bef.patch | 286 ++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-=
valid-inferior-thread-regcache-bef.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
index 9457c27f8b7..8589de62ffd 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0008-Define-alignof-using-_Alignof-when-using-C11-or-n=
ewe.patch \
            file://0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-oper=
ato.patch \
            file://add-missing-ldflags.patch \
+           file://0001-aarch64-Check-for-valid-inferior-thread-regcache-=
bef.patch \
            "
 SRC_URI[sha256sum] =3D "115ad5c18d69a6be2ab15882d365dda2a2211c14f480b350=
2c6eba576e2e95a0"
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-i=
nferior-thread-regcache-bef.patch b/meta/recipes-devtools/gdb/gdb/0001-aa=
rch64-Check-for-valid-inferior-thread-regcache-bef.patch
new file mode 100644
index 00000000000..9adf4a4db55
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior=
-thread-regcache-bef.patch
@@ -0,0 +1,286 @@
+From b3eff3e15576229af9bae026c5c23ee694b90389 Mon Sep 17 00:00:00 2001
+From: Luis Machado <luis.machado@arm.com>
+Date: Fri, 24 Mar 2023 07:58:38 +0000
+Subject: [PATCH] aarch64: Check for valid inferior thread/regcache befor=
e
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
+../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_th=
read: Assertion `current_thread_ !=3D nullptr' failed.
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
+0xaaaae0a695e3 _Z19target_xfer_partialP10target_ops13target_objectPKcPhP=
KhmmPm
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
+0xaaaae07f6d6f _ZN16thread_db_target4waitE6ptid_tP17target_waitstatus10e=
num_flagsI16target_wait_flagE
+        ../../../repos/binutils-gdb/gdb/linux-thread-db.c:1420
+0xaaaae0a6b33b _Z11target_wait6ptid_tP17target_waitstatus10enum_flagsI16=
target_wait_flagE
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
+../../../repos/binutils-gdb/gdb/thread.c:86: internal-error: inferior_th=
read: Assertion `current_thread_ !=3D nullptr' failed.
+A problem internal to GDB has been detected,
+further debugging may prove unreliable.
+Quit this debugging session? (y or n)
+
+We also see failures across the testsuite if the tests get executed on a=
 target
+that has native support for the pointer authentication feature. But
+gdb.base/break.exp and gdb.base/access-mem-running.exp are two examples =
of
+tests that run into errors and internal errors.
+
+This issue started after commit d88cb738e6a7a7179dfaff8af78d69250c852af1=
, which
+enabled more broad use of pointer authentication masks to remove non-add=
ress
+bits of pointers, but wasn't immediately detected because systems with n=
ative
+support for pointer authentication are not that common yet.
+
+The above crash happens because gdb is in the middle of handling an even=
t,
+and do_target_wait_1 calls switch_to_inferior_no_thread, nullifying the
+current thread.  This means a call to inferior_thread () will assert, an=
d
+attempting to call get_current_regcache () will also call inferior_threa=
d (),
+resulting in an assertion as well.
+
+target_has_registers was one function that seemed useful for detecting t=
hese
+types of situation where we don't have a register cache. The problem wit=
h that
+is the inconsistent state of inferior_ptid, which is used by
+target_has_registers.
+
+Despite the call to switch_to_no_thread in switch_to_inferior_no_thread =
from
+do_target_wait_1 in the backtrace above clearing inferior_ptid, the call=
 to
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
+  scoped_restore save_inferior_ptid =3D make_scoped_restore (&inferior_p=
tid);
+  inferior_ptid =3D ph->thread->ptid;
+
+  CORE_ADDR core_addr =3D ps_addr_to_core_addr (addr);
+
+  int ret;
+  if (write)
+    ret =3D target_write_memory (core_addr, buf, len);
+  else
+    ret =3D target_read_memory (core_addr, buf, len);
+  return (ret =3D=3D 0 ? PS_OK : PS_ERR);
+}
+
+Maybe this shouldn't happen, or maybe it is just an unfortunate state to=
 be
+in. But this prevents the use of target_has_registers to guard against t=
he
+lack of registers, since, although current_thread_ is still nullptr,
+inferior_ptid is valid and is not null_ptid.
+
+There is another crash scenario after we kill a previously active inferi=
or, in
+which case the gdbarch will still say we support pointer authentication =
but we
+will also have no current thread (inferior_thread () will assert etc).
+
+If the target has support for pointer authentication, gdb needs to use
+a couple (or 4, for bare-metal) mask registers to mask off some bits of
+pointers, and for that it needs to access the registers.
+
+At some points, like the one from the backtrace above, there is no activ=
e
+thread/current regcache because gdb is in the middle of doing event hand=
ling
+and switching between threads.
+
+Simon suggested the use of inferior_ptid to fetch the register cache, as
+opposed to relying on the current register cache.  Though we need to mak=
e sure
+inferior_ptid is valid (not null_ptid), I think this works nicely.
+
+With inferior_ptid, we can do safety checks along the way, making sure w=
e have
+a thread to fetch a register cache from and checking if the thread is ac=
tually
+stopped or running.
+
+The following patch implements this idea with safety checks to make sure=
 we
+don't run into assertions or errors.  If any of the checks fail, we fall=
back to
+using a default mask to remove non-address bits of a pointer.
+
+I discussed with Pedro the possibility of caching the mask register valu=
es
+(which are per-process and can change mid-execution), but there isn't a =
good
+spot to cache those values. Besides, the mask registers can change const=
antly
+for bare-metal debugging when switching between exception levels.
+
+In some cases, it is just not possible to get access to these mask regis=
ters,
+like the case where threads are running. In those cases, using a default=
 mask
+to remove the non-address bits should be enough.
+
+This can happen when we let threads run in the background and then we at=
tempt
+to access a memory address (now that gdb is capable of reading memory ev=
en
+with threads running).  Thus gdb will attempt to remove non-address bits
+of that memory access, will attempt to access registers, running into er=
rors.
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
+=20
++/* For inferior_ptid and current_inferior ().  */
++#include "inferior.h"
++
+ /* Signal frame handling.
+=20
+       +------------+  ^
+@@ -1986,29 +1989,60 @@ aarch64_linux_decode_memtag_section (struct gdba=
rch *gdbarch,
+ static CORE_ADDR
+ aarch64_remove_non_address_bits (struct gdbarch *gdbarch, CORE_ADDR poi=
nter)
+ {
+-  aarch64_gdbarch_tdep *tdep =3D gdbarch_tdep<aarch64_gdbarch_tdep> (gd=
barch);
+-
+   /* By default, we assume TBI and discard the top 8 bits plus the VA r=
ange
+-     select bit (55).  */
++     select bit (55).  Below we try to fetch information about pointer
++     authentication masks in order to make non-address removal more
++     precise.  */
+   CORE_ADDR mask =3D AARCH64_TOP_BITS_MASK;
+=20
+-  if (tdep->has_pauth ())
++  /* Check if we have an inferior first.  If not, just use the default
++     mask.
++
++     We use the inferior_ptid here because the pointer authentication m=
asks
++     should be the same across threads of a process.  Since we may not =
have
++     access to the current thread (gdb may have switched to no inferior=
s
++     momentarily), we use the inferior ptid.  */
++  if (inferior_ptid !=3D null_ptid)
+     {
+-      /* Fetch the PAC masks.  These masks are per-process, so we can j=
ust
+-	 fetch data from whatever thread we have at the moment.
++      /* If we do have an inferior, attempt to fetch its thread's threa=
d_info
++	 struct.  */
++      thread_info *thread
++	=3D find_thread_ptid (current_inferior ()->process_target (),
++			    inferior_ptid);
+=20
+-	 Also, we have both a code mask and a data mask.  For now they are the
+-	 same, but this may change in the future.  */
+-      struct regcache *regs =3D get_current_regcache ();
+-      CORE_ADDR cmask, dmask;
++      /* If the thread is running, we will not be able to fetch the mas=
k
++	 registers.  */
++      if (thread !=3D nullptr && thread->state !=3D THREAD_RUNNING)
++	{
++	  /* Otherwise, fetch the register cache and the masks.  */
++	  struct regcache *regs
++	    =3D get_thread_regcache (current_inferior ()->process_target (),
++				   inferior_ptid);
++
++	  /* Use the gdbarch from the register cache to check for pointer
++	     authentication support, as it matches the features found in
++	     that particular thread.  */
++	  aarch64_gdbarch_tdep *tdep
++	    =3D gdbarch_tdep<aarch64_gdbarch_tdep> (regs->arch ());
++
++	  /* Is there pointer authentication support?  */
++	  if (tdep->has_pauth ())
++	    {
++	      /* We have both a code mask and a data mask.  For now they are
++		 the same, but this may change in the future.  */
++	      CORE_ADDR cmask, dmask;
+=20
+-      if (regs->cooked_read (tdep->pauth_reg_base, &dmask) !=3D REG_VAL=
ID)
+-	dmask =3D mask;
++	      if (regs->cooked_read (tdep->pauth_reg_base, &dmask)
++		  !=3D REG_VALID)
++		dmask =3D mask;
+=20
+-      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask) !=3D REG=
_VALID)
+-	cmask =3D mask;
++	      if (regs->cooked_read (tdep->pauth_reg_base + 1, &cmask)
++		  !=3D REG_VALID)
++		cmask =3D mask;
+=20
+-      mask |=3D aarch64_mask_from_pac_registers (cmask, dmask);
++	      mask |=3D aarch64_mask_from_pac_registers (cmask, dmask);
++	    }
++	}
+     }
+=20
+   return aarch64_remove_top_bits (pointer, mask);
+--=20
+2.34.1
+
--=20
2.34.1


