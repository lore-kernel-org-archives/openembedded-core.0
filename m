Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.6924.1593768727200070900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: w+ql+bDG1z+YbRzIyNPFKS5Ra6ulVvHvd4cRkw5pk4eTtTjVk54pAfm8mWTIsfp6IGAw2oe5WI
 nylZycRSfBHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="146210838"
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="146210838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 02:32:06 -0700
IronPort-SDR: rsHkFym7aojgY2hnwq7NvsrZxaE3mtOQ2JTbF/IIWyt15RfdVAhfLa4u45WhDjPLn5QzgPFQAh
 qTJIjBEPRfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; 
   d="scan'208";a="426243695"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2020 02:32:05 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] qemu: fix CVE-2020-10702/10761/13362/13659/13800
Date: Fri,  3 Jul 2020 17:32:03 +0800
Message-Id: <1593768724-36791-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix these CVE:
CVE-2020-10702
CVE-2020-10761
CVE-2020-13362
CVE-2020-13659
CVE-2020-13800

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   5 +
 .../qemu/qemu/CVE-2020-10702.patch                 |  52 +++++++
 .../qemu/qemu/CVE-2020-10761.patch                 | 150 +++++++++++++++++++++
 .../qemu/qemu/CVE-2020-13362.patch                 |  52 +++++++
 .../qemu/qemu/CVE-2020-13659.patch                 |  55 ++++++++
 .../qemu/qemu/CVE-2020-13800.patch                 |  60 +++++++++
 6 files changed, 374 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3e50069..24b0379 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-11102.patch \
 	   file://CVE-2020-11869.patch \
 	   file://CVE-2020-13361.patch \
+	   file://CVE-2020-10761.patch \
+	   file://CVE-2020-10702.patch \
+	   file://CVE-2020-13659.patch \
+	   file://CVE-2020-13800.patch \
+	   file://CVE-2020-13362.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
new file mode 100644
index 0000000..0931489
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
@@ -0,0 +1,52 @@
+From de0b1bae6461f67243282555475f88b2384a1eb9 Mon Sep 17 00:00:00 2001
+From: Vincent Dehors <vincent.dehors@smile.fr>
+Date: Thu, 23 Jan 2020 15:22:38 +0000
+Subject: [PATCH] target/arm: Fix PAuth sbox functions
+
+In the PAC computation, sbox was applied over wrong bits.
+As this is a 4-bit sbox, bit index should be incremented by 4 instead of 16.
+
+Test vector from QARMA paper (https://eprint.iacr.org/2016/444.pdf) was
+used to verify one computation of the pauth_computepac() function which
+uses sbox2.
+
+Launchpad: https://bugs.launchpad.net/bugs/1859713
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Vincent DEHORS <vincent.dehors@smile.fr>
+Signed-off-by: Adrien GRASSEIN <adrien.grassein@smile.fr>
+Message-id: 20200116230809.19078-2-richard.henderson@linaro.org
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=patch;h=de0b1bae6461f67243282555475f88b2384a1eb9]
+CVE: CVE-2020-10702
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ target/arm/pauth_helper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
+index d3194f2..0a5f41e 100644
+--- a/target/arm/pauth_helper.c
++++ b/target/arm/pauth_helper.c
+@@ -89,7 +89,7 @@ static uint64_t pac_sub(uint64_t i)
+     uint64_t o = 0;
+     int b;
+ 
+-    for (b = 0; b < 64; b += 16) {
++    for (b = 0; b < 64; b += 4) {
+         o |= (uint64_t)sub[(i >> b) & 0xf] << b;
+     }
+     return o;
+@@ -104,7 +104,7 @@ static uint64_t pac_inv_sub(uint64_t i)
+     uint64_t o = 0;
+     int b;
+ 
+-    for (b = 0; b < 64; b += 16) {
++    for (b = 0; b < 64; b += 4) {
+         o |= (uint64_t)inv_sub[(i >> b) & 0xf] << b;
+     }
+     return o;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
new file mode 100644
index 0000000..e5e336a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
@@ -0,0 +1,150 @@
+From 5c4fe018c025740fef4a0a4421e8162db0c3eefd Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Mon, 8 Jun 2020 13:26:37 -0500
+Subject: [PATCH] nbd/server: Avoid long error message assertions
+ CVE-2020-10761
+
+Ever since commit 36683283 (v2.8), the server code asserts that error
+strings sent to the client are well-formed per the protocol by not
+exceeding the maximum string length of 4096.  At the time the server
+first started sending error messages, the assertion could not be
+triggered, because messages were completely under our control.
+However, over the years, we have added latent scenarios where a client
+could trigger the server to attempt an error message that would
+include the client's information if it passed other checks first:
+
+- requesting NBD_OPT_INFO/GO on an export name that is not present
+  (commit 0cfae925 in v2.12 echoes the name)
+
+- requesting NBD_OPT_LIST/SET_META_CONTEXT on an export name that is
+  not present (commit e7b1948d in v2.12 echoes the name)
+
+At the time, those were still safe because we flagged names larger
+than 256 bytes with a different message; but that changed in commit
+93676c88 (v4.2) when we raised the name limit to 4096 to match the NBD
+string limit.  (That commit also failed to change the magic number
+4096 in nbd_negotiate_send_rep_err to the just-introduced named
+constant.)  So with that commit, long client names appended to server
+text can now trigger the assertion, and thus be used as a denial of
+service attack against a server.  As a mitigating factor, if the
+server requires TLS, the client cannot trigger the problematic paths
+unless it first supplies TLS credentials, and such trusted clients are
+less likely to try to intentionally crash the server.
+
+We may later want to further sanitize the user-supplied strings we
+place into our error messages, such as scrubbing out control
+characters, but that is less important to the CVE fix, so it can be a
+later patch to the new nbd_sanitize_name.
+
+Consideration was given to changing the assertion in
+nbd_negotiate_send_rep_verr to instead merely log a server error and
+truncate the message, to avoid leaving a latent path that could
+trigger a future CVE DoS on any new error message.  However, this
+merely complicates the code for something that is already (correctly)
+flagging coding errors, and now that we are aware of the long message
+pitfall, we are less likely to introduce such errors in the future,
+which would make such error handling dead code.
+
+Reported-by: Xueqiang Wei <xuwei@redhat.com>
+CC: qemu-stable@nongnu.org
+Fixes: https://bugzilla.redhat.com/1843684 CVE-2020-10761
+Fixes: 93676c88d7
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-Id: <20200610163741.3745251-2-eblake@redhat.com>
+Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+
+Upstream-Status: Backport  [https://github.com/qemu/qemu/commit/5c4fe018c025740fef4a0a4421e8162db0c3eefd]
+CVE: CVE-2020-10761
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ nbd/server.c               | 23 ++++++++++++++++++++---
+ tests/qemu-iotests/143     |  4 ++++
+ tests/qemu-iotests/143.out |  2 ++
+ 3 files changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/nbd/server.c b/nbd/server.c
+index 02b1ed08014..20754e9ebc3 100644
+--- a/nbd/server.c
++++ b/nbd/server.c
+@@ -217,7 +217,7 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
+ 
+     msg = g_strdup_vprintf(fmt, va);
+     len = strlen(msg);
+-    assert(len < 4096);
++    assert(len < NBD_MAX_STRING_SIZE);
+     trace_nbd_negotiate_send_rep_err(msg);
+     ret = nbd_negotiate_send_rep_len(client, type, len, errp);
+     if (ret < 0) {
+@@ -231,6 +231,19 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
+     return 0;
+ }
+ 
++/*
++ * Return a malloc'd copy of @name suitable for use in an error reply.
++ */
++static char *
++nbd_sanitize_name(const char *name)
++{
++    if (strnlen(name, 80) < 80) {
++        return g_strdup(name);
++    }
++    /* XXX Should we also try to sanitize any control characters? */
++    return g_strdup_printf("%.80s...", name);
++}
++
+ /* Send an error reply.
+  * Return -errno on error, 0 on success. */
+ static int GCC_FMT_ATTR(4, 5)
+@@ -595,9 +608,11 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
+ 
+     exp = nbd_export_find(name);
+     if (!exp) {
++        g_autofree char *sane_name = nbd_sanitize_name(name);
++
+         return nbd_negotiate_send_rep_err(client, NBD_REP_ERR_UNKNOWN,
+                                           errp, "export '%s' not present",
+-                                          name);
++                                          sane_name);
+     }
+ 
+     /* Don't bother sending NBD_INFO_NAME unless client requested it */
+@@ -995,8 +1010,10 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
+ 
+     meta->exp = nbd_export_find(export_name);
+     if (meta->exp == NULL) {
++        g_autofree char *sane_name = nbd_sanitize_name(export_name);
++
+         return nbd_opt_drop(client, NBD_REP_ERR_UNKNOWN, errp,
+-                            "export '%s' not present", export_name);
++                            "export '%s' not present", sane_name);
+     }
+ 
+     ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), errp);
+diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
+index f649b361950..d2349903b1b 100755
+--- a/tests/qemu-iotests/143
++++ b/tests/qemu-iotests/143
+@@ -58,6 +58,10 @@ _send_qemu_cmd $QEMU_HANDLE \
+ $QEMU_IO_PROG -f raw -c quit \
+     "nbd+unix:///no_such_export?socket=$SOCK_DIR/nbd" 2>&1 \
+     | _filter_qemu_io | _filter_nbd
++# Likewise, with longest possible name permitted in NBD protocol
++$QEMU_IO_PROG -f raw -c quit \
++    "nbd+unix:///$(printf %4096d 1 | tr ' ' a)?socket=$SOCK_DIR/nbd" 2>&1 \
++    | _filter_qemu_io | _filter_nbd | sed 's/aaaa*aa/aa--aa/'
+ 
+ _send_qemu_cmd $QEMU_HANDLE \
+     "{ 'execute': 'quit' }" \
+diff --git a/tests/qemu-iotests/143.out b/tests/qemu-iotests/143.out
+index 1f4001c6013..fc9c0a761fa 100644
+--- a/tests/qemu-iotests/143.out
++++ b/tests/qemu-iotests/143.out
+@@ -5,6 +5,8 @@ QA output created by 143
+ {"return": {}}
+ qemu-io: can't open device nbd+unix:///no_such_export?socket=SOCK_DIR/nbd: Requested export not available
+ server reported: export 'no_such_export' not present
++qemu-io: can't open device nbd+unix:///aa--aa1?socket=SOCK_DIR/nbd: Requested export not available
++server reported: export 'aa--aa...' not present
+ { 'execute': 'quit' }
+ {"return": {}}
+ {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
new file mode 100644
index 0000000..7c92d76
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
@@ -0,0 +1,52 @@
+From f50ab86a2620bd7e8507af865b164655ee921661 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 14 May 2020 00:55:38 +0530
+Subject: [PATCH] megasas: use unsigned type for reply_queue_head and check
+ index
+
+A guest user may set 'reply_queue_head' field of MegasasState to
+a negative value. Later in 'megasas_lookup_frame' it is used to
+index into s->frames[] array. Use unsigned type to avoid OOB
+access issue.
+
+Also check that 'index' value stays within s->frames[] bounds
+through the while() loop in 'megasas_lookup_frame' to avoid OOB
+access.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Acked-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200513192540.1583887-2-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=f50ab86a2620bd7e8507af865b164655ee921661]
+CVE: CVE-2020-13362
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/scsi/megasas.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index af18c88b656..6ce598cd690 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -112,7 +112,7 @@ typedef struct MegasasState {
+     uint64_t reply_queue_pa;
+     void *reply_queue;
+     int reply_queue_len;
+-    int reply_queue_head;
++    uint16_t reply_queue_head;
+     int reply_queue_tail;
+     uint64_t consumer_pa;
+     uint64_t producer_pa;
+@@ -445,7 +445,7 @@ static MegasasCmd *megasas_lookup_frame(MegasasState *s,
+ 
+     index = s->reply_queue_head;
+ 
+-    while (num < s->fw_cmds) {
++    while (num < s->fw_cmds && index < MEGASAS_MAX_FRAMES) {
+         if (s->frames[index].pa && s->frames[index].pa == frame) {
+             cmd = &s->frames[index];
+             break;
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
new file mode 100644
index 0000000..f1e9345
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
@@ -0,0 +1,55 @@
+From 77f55eac6c433e23e82a1b88b2d74f385c4c7d82 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 26 May 2020 16:47:43 +0530
+Subject: [PATCH] exec: set map length to zero when returning NULL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When mapping physical memory into host's virtual address space,
+'address_space_map' may return NULL if BounceBuffer is in_use.
+Set and return '*plen = 0' to avoid later NULL pointer dereference.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Fixes: https://bugs.launchpad.net/qemu/+bug/1878259
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Suggested-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200526111743.428367-1-ppandit@redhat.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/77f55eac6c433e23e82a1b88b2d74f385c4c7d82]
+CVE: CVE-2020-13659
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ exec.c                | 1 +
+ include/exec/memory.h | 3 ++-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/exec.c b/exec.c
+index 9cbde85d8c1..778263f1c6a 100644
+--- a/exec.c
++++ b/exec.c
+@@ -3540,6 +3540,7 @@ void *address_space_map(AddressSpace *as,
+ 
+     if (!memory_access_is_direct(mr, is_write)) {
+         if (atomic_xchg(&bounce.in_use, true)) {
++            *plen = 0;
+             return NULL;
+         }
+         /* Avoid unbounded allocations */
+diff --git a/include/exec/memory.h b/include/exec/memory.h
+index bd7fdd60810..af8ca7824e0 100644
+--- a/include/exec/memory.h
++++ b/include/exec/memory.h
+@@ -2314,7 +2314,8 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
+ /* address_space_map: map a physical memory region into a host virtual address
+  *
+  * May map a subset of the requested range, given by and returned in @plen.
+- * May return %NULL if resources needed to perform the mapping are exhausted.
++ * May return %NULL and set *@plen to zero(0), if resources needed to perform
++ * the mapping are exhausted.
+  * Use only for reads OR writes - not for read-modify-write operations.
+  * Use cpu_register_map_client() to know when retrying the map operation is
+  * likely to succeed.
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
new file mode 100644
index 0000000..84b2f06
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
@@ -0,0 +1,60 @@
+From a98610c429d52db0937c1e48659428929835c455 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 4 Jun 2020 14:38:30 +0530
+Subject: [PATCH] ati-vga: check mm_index before recursive call
+ (CVE-2020-13800)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While accessing VGA registers via ati_mm_read/write routines,
+a guest may set 's->regs.mm_index' such that it leads to infinite
+recursion. Check mm_index value to avoid such recursion. Log an
+error message for wrong values.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Yi Ren <c4tren@gmail.com>
+Message-id: 20200604090830.33885-1-ppandit@redhat.com
+Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
+Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/a98610c429d52db0937c1e48659428929835c455]
+CVE: CVE-2020-13800
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/display/ati.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/display/ati.c b/hw/display/ati.c
+index 065f197678e..67604e68deb 100644
+--- a/hw/display/ati.c
++++ b/hw/display/ati.c
+@@ -285,8 +285,11 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
+             if (idx <= s->vga.vram_size - size) {
+                 val = ldn_le_p(s->vga.vram_ptr + idx, size);
+             }
+-        } else {
++        } else if (s->regs.mm_index > MM_DATA + 3) {
+             val = ati_mm_read(s, s->regs.mm_index + addr - MM_DATA, size);
++        } else {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                "ati_mm_read: mm_index too small: %u\n", s->regs.mm_index);
+         }
+         break;
+     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
+@@ -520,8 +523,11 @@ static void ati_mm_write(void *opaque, hwaddr addr,
+             if (idx <= s->vga.vram_size - size) {
+                 stn_le_p(s->vga.vram_ptr + idx, size, data);
+             }
+-        } else {
++        } else if (s->regs.mm_index > MM_DATA + 3) {
+             ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
++        } else {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                "ati_mm_write: mm_index too small: %u\n", s->regs.mm_index);
+         }
+         break;
+     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
-- 
2.7.4

