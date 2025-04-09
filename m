Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581FEC369A2
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 23:05:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.21834.1744239937536692189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 16:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BcH22nYa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250409230534f9bce320e1cb110a4b-g2evyh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250409230534f9bce320e1cb110a4b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Apr 2025 01:05:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RodRsmbVqoxZdpvssT68pFH4VTkwYLnwlQbeWTAw20w=;
 b=BcH22nYaYY5twbDSc8qNkkyeslB3c4Y/PyAcQYx+yVhS9ozviQioYem6oc2zuPkx9AXYpU
 P03mZGxyfLJobnWFVzYEEE3fV0a1/Vm5kVtpuEHi1Q/1qhTaDcOCyPxKivO5rXyz/YbMwuD0
 5QswVPt/ftPzpyS2vyRhSjndg+0HjJ9zFs+kKJECkNKtdSbRYcbqcv+TCSP8IxT820eiokzY
 DescRdKijOE11e88cXSFxebdB/LQRcaBrBonMiXoYXToJMWoRvRVm4NKoGhHX7ESgfe+fwpf
 6M8Y7pt1Ce1sHp/96sWfMA2uWshvZPNRGFN8W+eOnMdmrUuQm4qqWBOA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/2] xz: patch CVE-2025-31115
Date: Thu, 10 Apr 2025 01:04:46 +0200
Message-Id: <20250409230446.1874538-1-peter.marko@siemens.com>
In-Reply-To: <20250409230216.1874151-1-peter.marko@siemens.com>
References: <20250409230216.1874151-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214601

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commits from [1] linked from [2] from branch v5.4

[1] https://tukaani.org/xz/xz-cve-2025-31115.patch
[2] https://tukaani.org/xz/threaded-decoder-early-free.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xz/xz/CVE-2025-31115-01.patch             |  29 ++++
 .../xz/xz/CVE-2025-31115-02.patch             | 152 ++++++++++++++++++
 .../xz/xz/CVE-2025-31115-03.patch             |  98 +++++++++++
 .../xz/xz/CVE-2025-31115-04.patch             |  56 +++++++
 meta/recipes-extended/xz/xz_5.4.7.bb          |   4 +
 5 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch b/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
new file mode 100644
index 0000000000..efbb9b1e12
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
@@ -0,0 +1,29 @@
+From bdb788137e1f1d967e0c9d885b859e5b95c1b5bf Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Thu, 3 Apr 2025 14:34:42 +0300
+Subject: [PATCH 1/4] liblzma: mt dec: Fix a comment
+
+Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Thanks-to: Sam James <sam@gentoo.org>
+(cherry picked from commit 831b55b971cf579ee16a854f177c36b20d3c6999)
+
+CVE: CVE-2025-31115
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/bdb788137e1f1d967e0c9d885b859e5b95c1b5bf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index 76212b46..8b378852 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -348,7 +348,7 @@ worker_enable_partial_update(void *thr_ptr)
+ 
+ 
+ /// Things do to at THR_STOP or when finishing a Block.
+-/// This is called with thr->mutex locked.
++/// This is called with thr->coder->mutex locked.
+ static void
+ worker_stop(struct worker_thread *thr)
+ {
diff --git a/meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch b/meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
new file mode 100644
index 0000000000..9a1351961d
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
@@ -0,0 +1,152 @@
+From 2ce9ab6588a94cbf04a9c174e562ea5feb00cfb3 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Thu, 3 Apr 2025 14:34:42 +0300
+Subject: [PATCH 2/4] liblzma: mt dec: Simplify by removing the THR_STOP state
+
+The main thread can directly set THR_IDLE in threads_stop() which is
+called when errors are detected. threads_stop() won't return the stopped
+threads to the pool or free the memory pointed by thr->in anymore, but
+it doesn't matter because the existing workers won't be reused after
+an error. The resources will be cleaned up when threads_end() is
+called (reinitializing the decoder always calls threads_end()).
+
+Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Thanks-to: Sam James <sam@gentoo.org>
+(cherry picked from commit c0c835964dfaeb2513a3c0bdb642105152fe9f34)
+
+CVE: CVE-2025-31115
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/2ce9ab6588a94cbf04a9c174e562ea5feb00cfb3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 75 ++++++++++----------------
+ 1 file changed, 29 insertions(+), 46 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index 8b378852..e8e53587 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -24,15 +24,10 @@ typedef enum {
+ 	THR_IDLE,
+ 
+ 	/// Decoding is in progress.
+-	/// Main thread may change this to THR_STOP or THR_EXIT.
++	/// Main thread may change this to THR_IDLE or THR_EXIT.
+ 	/// The worker thread may change this to THR_IDLE.
+ 	THR_RUN,
+ 
+-	/// The main thread wants the thread to stop whatever it was doing
+-	/// but not exit. Main thread may change this to THR_EXIT.
+-	/// The worker thread may change this to THR_IDLE.
+-	THR_STOP,
+-
+ 	/// The main thread wants the thread to exit.
+ 	THR_EXIT,
+ 
+@@ -347,27 +342,6 @@ worker_enable_partial_update(void *thr_ptr)
+ }
+ 
+ 
+-/// Things do to at THR_STOP or when finishing a Block.
+-/// This is called with thr->coder->mutex locked.
+-static void
+-worker_stop(struct worker_thread *thr)
+-{
+-	// Update memory usage counters.
+-	thr->coder->mem_in_use -= thr->in_size;
+-	thr->in_size = 0; // thr->in was freed above.
+-
+-	thr->coder->mem_in_use -= thr->mem_filters;
+-	thr->coder->mem_cached += thr->mem_filters;
+-
+-	// Put this thread to the stack of free threads.
+-	thr->next = thr->coder->threads_free;
+-	thr->coder->threads_free = thr;
+-
+-	mythread_cond_signal(&thr->coder->cond);
+-	return;
+-}
+-
+-
+ static MYTHREAD_RET_TYPE
+ worker_decoder(void *thr_ptr)
+ {
+@@ -398,17 +372,6 @@ next_loop_unlocked:
+ 		return MYTHREAD_RET_VALUE;
+ 	}
+ 
+-	if (thr->state == THR_STOP) {
+-		thr->state = THR_IDLE;
+-		mythread_mutex_unlock(&thr->mutex);
+-
+-		mythread_sync(thr->coder->mutex) {
+-			worker_stop(thr);
+-		}
+-
+-		goto next_loop_lock;
+-	}
+-
+ 	assert(thr->state == THR_RUN);
+ 
+ 	// Update progress info for get_progress().
+@@ -511,7 +474,22 @@ next_loop_unlocked:
+ 				&& thr->coder->thread_error == LZMA_OK)
+ 			thr->coder->thread_error = ret;
+ 
+-		worker_stop(thr);
++		// Return the worker thread to the stack of available
++		// threads.
++		{
++			// Update memory usage counters.
++			thr->coder->mem_in_use -= thr->in_size;
++			thr->in_size = 0; // thr->in was freed above.
++
++			thr->coder->mem_in_use -= thr->mem_filters;
++			thr->coder->mem_cached += thr->mem_filters;
++
++			// Put this thread to the stack of free threads.
++			thr->next = thr->coder->threads_free;
++			thr->coder->threads_free = thr;
++		}
++
++		mythread_cond_signal(&thr->coder->cond);
+ 	}
+ 
+ 	goto next_loop_lock;
+@@ -545,17 +523,22 @@ threads_end(struct lzma_stream_coder *coder, const lzma_allocator *allocator)
+ }
+ 
+ 
++/// Tell worker threads to stop without doing any cleaning up.
++/// The clean up will be done when threads_exit() is called;
++/// it's not possible to reuse the threads after threads_stop().
++///
++/// This is called before returning an unrecoverable error code
++/// to the application. It would be waste of processor time
++/// to keep the threads running in such a situation.
+ static void
+ threads_stop(struct lzma_stream_coder *coder)
+ {
+ 	for (uint32_t i = 0; i < coder->threads_initialized; ++i) {
++		// The threads that are in the THR_RUN state will stop
++		// when they check the state the next time. There's no
++		// need to signal coder->threads[i].cond.
+ 		mythread_sync(coder->threads[i].mutex) {
+-			// The state must be changed conditionally because
+-			// THR_IDLE -> THR_STOP is not a valid state change.
+-			if (coder->threads[i].state != THR_IDLE) {
+-				coder->threads[i].state = THR_STOP;
+-				mythread_cond_signal(&coder->threads[i].cond);
+-			}
++			coder->threads[i].state = THR_IDLE;
+ 		}
+ 	}
+ 
+@@ -1949,7 +1932,7 @@ stream_decoder_mt_init(lzma_next_coder *next, const lzma_allocator *allocator,
+ 	// accounting from scratch, too. Changes in filter and block sizes may
+ 	// affect number of threads.
+ 	//
+-	// FIXME? Reusing should be easy but unlike the single-threaded
++	// Reusing threads doesn't seem worth it. Unlike the single-threaded
+ 	// decoder, with some types of input file combinations reusing
+ 	// could leave quite a lot of memory allocated but unused (first
+ 	// file could allocate a lot, the next files could use fewer
diff --git a/meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch b/meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
new file mode 100644
index 0000000000..a40a024cb0
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
@@ -0,0 +1,98 @@
+From 9a9c17712bd2a070581d9239692e527a2fe13845 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Thu, 3 Apr 2025 14:34:42 +0300
+Subject: [PATCH 3/4] liblzma: mt dec: Don't free the input buffer too early
+ (CVE-2025-31115)
+
+The input buffer must be valid as long as the main thread is writing
+to the worker-specific input buffer. Fix it by making the worker
+thread not free the buffer on errors and not return the worker thread to
+the pool. The input buffer will be freed when threads_end() is called.
+
+With invalid input, the bug could at least result in a crash. The
+effects include heap use after free and writing to an address based
+on the null pointer plus an offset.
+
+The bug has been there since the first committed version of the threaded
+decoder and thus affects versions from 5.3.3alpha to 5.8.0.
+
+As the commit message in 4cce3e27f529 says, I had made significant
+changes on top of Sebastian's patch. This bug was indeed introduced
+by my changes; it wasn't in Sebastian's version.
+
+Thanks to Harri K. Koskinen for discovering and reporting this issue.
+
+Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
+Reported-by: Harri K. Koskinen <x64nop@nannu.org>
+Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Thanks-to: Sam James <sam@gentoo.org>
+(cherry picked from commit d5a2ffe41bb77b918a8c96084885d4dbe4bf6480)
+
+CVE: CVE-2025-31115
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/9a9c17712bd2a070581d9239692e527a2fe13845]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 31 ++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index e8e53587..259c4c65 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -436,8 +436,7 @@ next_loop_unlocked:
+ 	}
+ 
+ 	// Either we finished successfully (LZMA_STREAM_END) or an error
+-	// occurred. Both cases are handled almost identically. The error
+-	// case requires updating thr->coder->thread_error.
++	// occurred.
+ 	//
+ 	// The sizes are in the Block Header and the Block decoder
+ 	// checks that they match, thus we know these:
+@@ -445,16 +444,30 @@ next_loop_unlocked:
+ 	assert(ret != LZMA_STREAM_END
+ 		|| thr->out_pos == thr->block_options.uncompressed_size);
+ 
+-	// Free the input buffer. Don't update in_size as we need
+-	// it later to update thr->coder->mem_in_use.
+-	lzma_free(thr->in, thr->allocator);
+-	thr->in = NULL;
+-
+ 	mythread_sync(thr->mutex) {
++		// Block decoder ensures this, but do a sanity check anyway
++		// because thr->in_filled < thr->in_size means that the main
++		// thread is still writing to thr->in.
++		if (ret == LZMA_STREAM_END && thr->in_filled != thr->in_size) {
++			assert(0);
++			ret = LZMA_PROG_ERROR;
++		}
++
+ 		if (thr->state != THR_EXIT)
+ 			thr->state = THR_IDLE;
+ 	}
+ 
++	// Free the input buffer. Don't update in_size as we need
++	// it later to update thr->coder->mem_in_use.
++	//
++	// This step is skipped if an error occurred because the main thread
++	// might still be writing to thr->in. The memory will be freed after
++	// threads_end() sets thr->state = THR_EXIT.
++	if (ret == LZMA_STREAM_END) {
++		lzma_free(thr->in, thr->allocator);
++		thr->in = NULL;
++	}
++
+ 	mythread_sync(thr->coder->mutex) {
+ 		// Move our progress info to the main thread.
+ 		thr->coder->progress_in += thr->in_pos;
+@@ -475,8 +488,8 @@ next_loop_unlocked:
+ 			thr->coder->thread_error = ret;
+ 
+ 		// Return the worker thread to the stack of available
+-		// threads.
+-		{
++		// threads only if no errors occurred.
++		if (ret == LZMA_STREAM_END) {
+ 			// Update memory usage counters.
+ 			thr->coder->mem_in_use -= thr->in_size;
+ 			thr->in_size = 0; // thr->in was freed above.
diff --git a/meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch b/meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch
new file mode 100644
index 0000000000..8dea412281
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch
@@ -0,0 +1,56 @@
+From c8bb46c5a16ed02401f4a0b46c74f0f46c1b6434 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Thu, 3 Apr 2025 14:34:42 +0300
+Subject: [PATCH 4/4] liblzma: mt dec: Don't modify thr->in_size in the worker
+ thread
+
+Don't set thr->in_size = 0 when returning the thread to the stack of
+available threads. Not only is it useless, but the main thread may
+read the value in SEQ_BLOCK_THR_RUN. With valid inputs, it made
+no difference if the main thread saw the original value or 0. With
+invalid inputs (when worker thread stops early), thr->in_size was
+no longer modified after the previous commit with the security fix
+("Don't free the input buffer too early").
+
+So while the bug appears harmless now, it's important to fix it because
+the variable was being modified without proper locking. It's trivial
+to fix because there is no need to change the value. Only main thread
+needs to set the value in (in SEQ_BLOCK_THR_INIT) when starting a new
+Block before the worker thread is activated.
+
+Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
+Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Thanks-to: Sam James <sam@gentoo.org>
+(cherry picked from commit 8188048854e8d11071b8a50d093c74f4c030acc9)
+
+CVE: CVE-2025-31115
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c8bb46c5a16ed02401f4a0b46c74f0f46c1b6434]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index 259c4c65..6bbbe53b 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -492,8 +492,6 @@ next_loop_unlocked:
+ 		if (ret == LZMA_STREAM_END) {
+ 			// Update memory usage counters.
+ 			thr->coder->mem_in_use -= thr->in_size;
+-			thr->in_size = 0; // thr->in was freed above.
+-
+ 			thr->coder->mem_in_use -= thr->mem_filters;
+ 			thr->coder->mem_cached += thr->mem_filters;
+ 
+@@ -1558,6 +1556,10 @@ stream_decode_mt(void *coder_ptr, const lzma_allocator *allocator,
+ 		}
+ 
+ 		// Return if the input didn't contain the whole Block.
++		//
++		// NOTE: When we updated coder->thr->in_filled a few lines
++		// above, the worker thread might by now have finished its
++		// work and returned itself back to the stack of free threads.
+ 		if (coder->thr->in_filled < coder->thr->in_size) {
+ 			assert(*in_pos == in_size);
+ 			return LZMA_OK;
diff --git a/meta/recipes-extended/xz/xz_5.4.7.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
index 53e5276951..563643d4d9 100644
--- a/meta/recipes-extended/xz/xz_5.4.7.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -26,6 +26,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2025-31115-01.patch \
+           file://CVE-2025-31115-02.patch \
+           file://CVE-2025-31115-03.patch \
+           file://CVE-2025-31115-04.patch \
           "
 SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723836e71"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

