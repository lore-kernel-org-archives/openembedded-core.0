Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B38C5B549
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.921.1748446425825027891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YScTtRj8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c9563fd9so3372479b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446425; x=1749051225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUlG6VfnS3vQLITlce58D9tGn2Ezz0/+62mVOZWfo80=;
        b=YScTtRj8lZZGbYANOWt0OS7mu+BW8JpdYVUXwrooL4GLG5Dzcs8BFpcGMnoBliJagx
         nzJpz2x4LfFlQCxPbokmckpIOPIjzc/TBlddkUiItlad1V8CjCsyC5s1TLfga4uaryVb
         k6cBb6qbbq11x5IOtlF650Mu2A6MQcCzgEQZXkOc1cLLKFZkRAFfDOY76k+bhi9m1jkl
         sY7QADCzrd3H6Wh0QIv8YYfR97pm4g1vGaOaO3ZeDZi9E3E1LA9JzbjlfFk1ns2KF1eP
         zU1w32+f7IA0r3cjXubJUWcj1i+3Qfj0VxzIzaI+fnzF2fqUWZXu/gqEXSAiXBjnKbJO
         XrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446425; x=1749051225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUlG6VfnS3vQLITlce58D9tGn2Ezz0/+62mVOZWfo80=;
        b=GTjHXZ2UZE6g7ywRNLxWeoq0j/dFBhAHglUBBy/tPRFeshxBIFxSx06BtR9+Rkzd4h
         ncqiofIxXIFnHOHzjsohhBp+W3+rxLxJjSfRREpfrD+9LoTeyGn0XPJH+o8erxw7yYuy
         RfHQjR+jPUXrhTayXtfMqr6pqgs20ARokZWm0gOxU/5zhGPXE+ZYUwgibGy81iVOvV1n
         X276Rqr7JO8z25eA8YYDbIQqHt6x7ni1k5BDLlxiJslsMlbN6+t/lwo3dt7PNl4KrI/l
         +SUiChSbs/bWSp2f3oVGsAENoeNb2cEJbafJUt3ESmZoU1Q+py8UbpGVb/fCCqyVri/P
         /m3w==
X-Gm-Message-State: AOJu0YyaOrcvRU5IK+oqc0YR98q16n5rvE28/kc8ecTf0e0S/0LT1wxJ
	1yjTCiNewfoLRwKGob1m27JM3KBD1xsoBuQygE+mOh9cTs8G47ohYInnpl7w55paMkYGCl/KDbY
	5/wpI
X-Gm-Gg: ASbGncvkYXOgNl9mNn4RTnV8HBs1jMX4wV9kdUc2vpNzBqy/hccPDTeCiFBDh6eDXKZ
	J+uW2jksi44ol6XIhPxdNtqDgVtEoC9igLFaBYc3Lwsy7WWs7TFzL21hPsG+t8f0ER4YuXXcSY+
	PfdJNx1X3PWAN4A2TcoTuDNrsgFS2JfR9uUFe02MvvjySI2u4CgnIUF1qzWOJvz/Isxe60gCg0N
	14yPN5/1Vuu+/A71Q+0ZH86hCakowz+MPE8QjiuJba2X6628kJY732J1VGEvGUWgODnFNMmwc5y
	89C79M7wwY+4tt+rRKgjpo+AWwadgThn6NHJmgNK6IZNrbi8RIP1Up1qwQs4pVxI
X-Google-Smtp-Source: AGHT+IHkqJm34vPeT2Sv29cXGeDK0qH3QGo8Zk+mz0lBD5Zp4/WVVjN6DisxjSFcNENsX4HvlK8fLg==
X-Received: by 2002:a05:6a00:130d:b0:740:9d6f:a73b with SMTP id d2e1a72fcca58-745fe01508bmr22378606b3a.17.1748446424749;
        Wed, 28 May 2025 08:33:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/14] xz: patch CVE-2025-31115
Date: Wed, 28 May 2025 08:33:14 -0700
Message-ID: <7c5d0f0e1830095d3e8c30c648081b5e52b0ef06.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217369

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commits from [1] linked from [2] from branch v5.6

[1] https://tukaani.org/xz/xz-cve-2025-31115.patch
[2] https://tukaani.org/xz/threaded-decoder-early-free.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xz/xz/CVE-2025-31115-01.patch             |  29 ++++
 .../xz/xz/CVE-2025-31115-02.patch             | 152 ++++++++++++++++++
 .../xz/xz/CVE-2025-31115-03.patch             |  98 +++++++++++
 .../xz/xz/CVE-2025-31115-04.patch             |  56 +++++++
 meta/recipes-extended/xz/xz_5.6.4.bb          |   4 +
 5 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch

diff --git a/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch b/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
new file mode 100644
index 0000000000..d6e75f8201
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-01.patch
@@ -0,0 +1,29 @@
+From c1a91b8baeb947c5b232a6c3d6319267131830bc Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Thu, 3 Apr 2025 14:34:42 +0300
+Subject: [PATCH 1/4] liblzma: mt dec: Fix a comment
+
+Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Thanks-to: Sam James <sam@gentoo.org>
+(cherry picked from commit 831b55b971cf579ee16a854f177c36b20d3c6999)
+
+CVE: CVE-2025-31115
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c1a91b8baeb947c5b232a6c3d6319267131830bc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index 244624a4..6f06f1d1 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -347,7 +347,7 @@ worker_enable_partial_update(void *thr_ptr)
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
index 0000000000..7b36ae551a
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-02.patch
@@ -0,0 +1,152 @@
+From f74cf18ad084a9185d8ae148d89265860aa8004c Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/f74cf18ad084a9185d8ae148d89265860aa8004c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 75 ++++++++++----------------
+ 1 file changed, 29 insertions(+), 46 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index 6f06f1d1..e1d07007 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -23,15 +23,10 @@ typedef enum {
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
+@@ -346,27 +341,6 @@ worker_enable_partial_update(void *thr_ptr)
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
+@@ -397,17 +371,6 @@ next_loop_unlocked:
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
+@@ -510,7 +473,22 @@ next_loop_unlocked:
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
+@@ -544,17 +522,22 @@ threads_end(struct lzma_stream_coder *coder, const lzma_allocator *allocator)
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
+@@ -1948,7 +1931,7 @@ stream_decoder_mt_init(lzma_next_coder *next, const lzma_allocator *allocator,
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
index 0000000000..892249d0b4
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-03.patch
@@ -0,0 +1,98 @@
+From 1b874b4f04909b7bb5259cb612ecef39a434dde8 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/1b874b4f04909b7bb5259cb612ecef39a434dde8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 31 ++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 9 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index e1d07007..ce5e54ac 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -435,8 +435,7 @@ next_loop_unlocked:
+ 	}
+ 
+ 	// Either we finished successfully (LZMA_STREAM_END) or an error
+-	// occurred. Both cases are handled almost identically. The error
+-	// case requires updating thr->coder->thread_error.
++	// occurred.
+ 	//
+ 	// The sizes are in the Block Header and the Block decoder
+ 	// checks that they match, thus we know these:
+@@ -444,16 +443,30 @@ next_loop_unlocked:
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
+@@ -474,8 +487,8 @@ next_loop_unlocked:
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
index 0000000000..f80daceb4a
--- /dev/null
+++ b/meta/recipes-extended/xz/xz/CVE-2025-31115-04.patch
@@ -0,0 +1,56 @@
+From 6ff5b8c55960f9ebc917b668bd3567ef217175fa Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/6ff5b8c55960f9ebc917b668bd3567ef217175fa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/liblzma/common/stream_decoder_mt.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
+index ce5e54ac..0cdb47d3 100644
+--- a/src/liblzma/common/stream_decoder_mt.c
++++ b/src/liblzma/common/stream_decoder_mt.c
+@@ -491,8 +491,6 @@ next_loop_unlocked:
+ 		if (ret == LZMA_STREAM_END) {
+ 			// Update memory usage counters.
+ 			thr->coder->mem_in_use -= thr->in_size;
+-			thr->in_size = 0; // thr->in was freed above.
+-
+ 			thr->coder->mem_in_use -= thr->mem_filters;
+ 			thr->coder->mem_cached += thr->mem_filters;
+ 
+@@ -1557,6 +1555,10 @@ stream_decode_mt(void *coder_ptr, const lzma_allocator *allocator,
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
diff --git a/meta/recipes-extended/xz/xz_5.6.4.bb b/meta/recipes-extended/xz/xz_5.6.4.bb
index e48f4dbd7f..52bfd844b2 100644
--- a/meta/recipes-extended/xz/xz_5.6.4.bb
+++ b/meta/recipes-extended/xz/xz_5.6.4.bb
@@ -27,6 +27,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2025-31115-01.patch \
+           file://CVE-2025-31115-02.patch \
+           file://CVE-2025-31115-03.patch \
+           file://CVE-2025-31115-04.patch \
           "
 SRC_URI[sha256sum] = "269e3f2e512cbd3314849982014dc199a7b2148cf5c91cedc6db629acdf5e09b"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


