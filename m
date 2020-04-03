Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.6154.1585898433088153606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 00:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=BGoMf+fR;
 spf=neutral (domain: qtec.com, ip: 209.85.208.194, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f194.google.com with SMTP id k21so5954589ljh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxwMPIWc4mZr3oeV3g7AVqkujADb98I5s/iNAt3GYOM=;
        b=BGoMf+fRQbhQfgqRSSUJ/YYR11AhsY0UTKJXA5nwheYVTFDyVBGQMbPGsHMDY9DyqC
         3j37ymE5Kiy05I+gCtJcA1KBi0d5y5x42jZ13dm7enPIizdloFjXsHombgJ/4n5v2ZEP
         r5i8T5tB81f5ARPAz7a5lT8Ebhn0vJxi3M6cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mxwMPIWc4mZr3oeV3g7AVqkujADb98I5s/iNAt3GYOM=;
        b=bDIRtuTxE7lH0zmqS1hLCjfVyH934JL9YKZFCycUo36hreYFpO2GnMv7LN6Sud5yhw
         Fr6keovwZJ8jEGfbfAoLkNm6mZu+dm6zdqvfjxUGSVSeHruS24Jng+QdX7aROt7wPVSA
         SEDYIYeZS4bJc6pX1Ljf5S1j7h/wmlNpeSfQCFSUFl4qf8lV1oEIiR5xPaqs386XcOMz
         267MYx3A6yLvRl95Ook8QBG+z227vm6EppipUQQmqgUcT04nM55lm1NeQORrk8uPvrP2
         HQZH1vsXj18AarJo/zTOLAScYjJ3IekHwuMOTfqJT+Zd8dMMhmV4wC5h5oUUFvzCRwrg
         0DWA==
X-Gm-Message-State: AGi0PuYFonU8NVu80YINqOJsndX8+MsK/3lxJo25PBWSTQSHVms+wayz
	1tds7a9S+StQKHYKiMapUa8tzkn1fFmxpXf9T+yFijuZdPh1fwTZJr9kfoX7QdPnBH7JDRaRMlw
	AnMNzBQ8OzVsI5QxtZfrdnx7PlVrmMPqqws6ElI7VBGtmtGT/UliQVhe7R/sbyhc3SvJTNo+G99
	vLkO89v6oMQw==
X-Google-Smtp-Source: APiQypJ0cYWT1L2+tBzIa5lnGRZUfy4YKGBezuwCmkWv9sUOx4G7UiBLV+qID1squqUPRbm1tkJ/sw==
X-Received: by 2002:a2e:9718:: with SMTP id r24mr3788551lji.287.1585898430600;
        Fri, 03 Apr 2020 00:20:30 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost.localdomain (62-243-86-95-cable.dk.customer.tdc.net. [62.243.86.95])
        by smtp.gmail.com with ESMTPSA id j2sm5368661lfh.70.2020.04.03.00.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 00:20:30 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] glib-2.0: Backport GMainContext fixes
Date: Fri,  3 Apr 2020 09:20:18 +0200
Message-Id: <20200403072018.2952371-1-daniel@qtec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport fixes introduced in 2.63.6 for memory leaks and memory corruption in
GMainContext

Upstream merge: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1353

Fixes SIGSEGV in GStreamer:

    Thread 2 "multihandlesink" received signal SIGSEGV, Segmentation fault.
    [Switching to Thread 0x7ffff6bb9700 (LWP 18045)]
    0x00007ffff7d65992 in g_source_unref_internal (source=0x7ffff00047d0, context=0x55555561c800, have_lock=1) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:2146
    2146    ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c: No such file or directory.
    (gdb) bt
    #0  0x00007ffff7d65992 in g_source_unref_internal (source=0x7ffff00047d0, context=0x55555561c800, have_lock=1) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:2146
    #1  0x00007ffff7d65bb6 in g_source_iter_next (iter=iter@entry=0x7ffff6bb8db0, source=source@entry=0x7ffff6bb8da8) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:980
    #2  0x00007ffff7d67ef3 in g_main_context_prepare (context=context@entry=0x55555561c800, priority=priority@entry=0x7ffff6bb8e30) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:944
    #3  0x00007ffff7d6896b in g_main_context_iterate (context=context@entry=0x55555561c800, block=block@entry=1, dispatch=dispatch@entry=1, self=<optimized out>) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:3900
    #4  0x00007ffff7d68b4c in g_main_context_iteration (context=0x55555561c800, may_block=may_block@entry=1) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gmain.c:3981
    #5  0x00007ffff6be4482 in gst_multi_socket_sink_thread (mhsink=0x555555679ab0 [GstMultiSocketSink]) at ../../../gst-plugins-base-1.14.4/gst/tcp/gstmultisocketsink.c:1164
    #6  0x00007ffff7d8fb35 in g_thread_proxy (data=0x55555565c770) at ../../../../../../../repo/workspace/sources/glib-2.0/glib/gthread.c:784
    #7  0x00007ffff7841ebd in start_thread (arg=<optimized out>) at pthread_create.c:486
    #8  0x00007ffff7aa12bf in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
    #8  0x00007ffff7aa12bf in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 ...-GSource-iterator-if-iteration-can-m.patch |  43 +++++++
 ...-memory-leaks-and-memory-corruption-.patch | 109 ++++++++++++++++++
 ...e-mutex-unlocking-in-destructor-righ.patch |  36 ++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |   3 +
 4 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch b/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
new file mode 100644
index 0000000000..3aae6f0c8c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
@@ -0,0 +1,43 @@
+From ef2be42998e3fc10299055a5a01f7c791538174c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 3 Feb 2020 15:38:28 +0200
+Subject: [PATCH] GMainContext - Fix GSource iterator if iteration can modify
+ the list
+
+We first have to ref the next source and then unref the previous one.
+This might be the last reference to the previous source, and freeing the
+previous source might unref and free the next one which would then leave
+use with a dangling pointer here.
+
+Fixes https://gitlab.gnome.org/GNOME/glib/issues/2031
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/b06c48de7554607ff3fb58d6c0510cfa5088e909]
+
+---
+ glib/gmain.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gmain.c b/glib/gmain.c
+index af979c8..a9a287d 100644
+--- a/glib/gmain.c
++++ b/glib/gmain.c
+@@ -969,13 +969,17 @@ g_source_iter_next (GSourceIter *iter, GSource **source)
+    * GSourceList to be removed from source_lists (if iter->source is
+    * the only source in its list, and it is destroyed), so we have to
+    * keep it reffed until after we advance iter->current_list, above.
++   *
++   * Also we first have to ref the next source before unreffing the
++   * previous one as unreffing the previous source can potentially
++   * free the next one.
+    */
++  if (next_source && iter->may_modify)
++    g_source_ref (next_source);
+
+   if (iter->source && iter->may_modify)
+     g_source_unref_internal (iter->source, iter->context, TRUE);
+   iter->source = next_source;
+-  if (iter->source && iter->may_modify)
+-    g_source_ref (iter->source);
+
+   *source = iter->source;
+   return *source != NULL;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
new file mode 100644
index 0000000000..8c025f7fc6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
@@ -0,0 +1,109 @@
+From 611430a32a46d0dc806a829161e2dccf9c0196a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 3 Feb 2020 15:35:51 +0200
+Subject: [PATCH] GMainContext - Fix memory leaks and memory corruption when
+ freeing sources while freeing a context
+
+Instead of destroying sources directly while freeing the context, and
+potentially freeing them if this was the last reference to them, collect
+new references of all sources in a separate list before and at the same
+time invalidate their context so that they can't access it anymore. Only
+once all sources have their context invalidated, destroy them while
+still keeping a reference to them. Once all sources are destroyed we get
+rid of the additional references and free them if nothing else keeps a
+reference to them anymore.
+
+This fixes a regression introduced by 26056558be in 2012.
+
+The previous code that invalidated the context of each source and then
+destroyed it before going to the next source without keeping an
+additional reference caused memory leaks or memory corruption depending
+on the order of the sources in the sources lists.
+
+If a source was destroyed it might happen that this was the last
+reference to this source, and it would then be freed. This would cause
+the finalize function to be called, which might destroy and unref
+another source and potentially free it. This other source would then
+either
+- go through the normal free logic and change the intern linked list
+  between the sources, while other sources that are unreffed as part of
+  the main context freeing would not. As such the list would be in an
+  inconsistent state and we might dereference freed memory.
+- go through the normal destroy and free logic but because the context
+  pointer was already invalidated it would simply mark the source as
+  destroyed without actually removing it from the context. This would
+  then cause a memory leak because the reference owned by the context is
+  not freed.
+
+Fixes https://github.com/gtk-rs/glib/issues/583 while still keeping
+https://bugzilla.gnome.org/show_bug.cgi?id=661767 fixes.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aa20167d419c649f34fed06a9463890b41b1eba0]
+
+---
+ glib/gmain.c | 35 ++++++++++++++++++++++++++++++++++-
+ 1 file changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gmain.c b/glib/gmain.c
+index a9a287d..10ba2f8 100644
+--- a/glib/gmain.c
++++ b/glib/gmain.c
+@@ -538,6 +538,7 @@ g_main_context_unref (GMainContext *context)
+   GSourceIter iter;
+   GSource *source;
+   GList *sl_iter;
++  GSList *s_iter, *remaining_sources = NULL;
+   GSourceList *list;
+   guint i;
+
+@@ -557,10 +558,30 @@ g_main_context_unref (GMainContext *context)
+
+   /* g_source_iter_next() assumes the context is locked. */
+   LOCK_CONTEXT (context);
+-  g_source_iter_init (&iter, context, TRUE);
++
++  /* First collect all remaining sources from the sources lists and store a
++   * new reference in a separate list. Also set the context of the sources
++   * to NULL so that they can't access a partially destroyed context anymore.
++   *
++   * We have to do this first so that we have a strong reference to all
++   * sources and destroying them below does not also free them, and so that
++   * none of the sources can access the context from their finalize/dispose
++   * functions. */
++  g_source_iter_init (&iter, context, FALSE);
+   while (g_source_iter_next (&iter, &source))
+     {
+       source->context = NULL;
++      remaining_sources = g_slist_prepend (remaining_sources, g_source_ref (source));
++    }
++  g_source_iter_clear (&iter);
++
++  /* Next destroy all sources. As we still hold a reference to all of them,
++   * this won't cause any of them to be freed yet and especially prevents any
++   * source that unrefs another source from its finalize function to be freed.
++   */
++  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
++    {
++      source = s_iter->data;
+       g_source_destroy_internal (source, context, TRUE);
+     }
+   UNLOCK_CONTEXT (context);
+@@ -585,6 +606,18 @@ g_main_context_unref (GMainContext *context)
+   g_cond_clear (&context->cond);
+
+   g_free (context);
++
++  /* And now finally get rid of our references to the sources. This will cause
++   * them to be freed unless something else still has a reference to them. Due
++   * to setting the context pointers in the sources to NULL above, this won't
++   * ever access the context or the internal linked list inside the GSource.
++   * We already removed the sources completely from the context above. */
++  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
++    {
++      source = s_iter->data;
++      g_source_unref_internal (source, NULL, FALSE);
++    }
++  g_slist_free (remaining_sources);
+ }
+
+ /* Helper function used by mainloop/overflow test.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch b/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
new file mode 100644
index 0000000000..b10ba0066e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
@@ -0,0 +1,36 @@
+From 3e9d85f1b75e2b1096d9643563d7d17380752fc7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 11 Feb 2020 09:34:38 +0200
+Subject: [PATCH] GMainContext - Move mutex unlocking in destructor right
+ before freeing the mutex
+
+This does not have any behaviour changes but is cleaner. The mutex is
+only unlocked now after all operations on the context are done and right
+before freeing the mutex and the context itself.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/730a75fc8e8271c38fbd5363d1f77a00876b9ddc]
+
+---
+ glib/gmain.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gmain.c b/glib/gmain.c
+index 10ba2f8..b1df470 100644
+--- a/glib/gmain.c
++++ b/glib/gmain.c
+@@ -584,7 +584,6 @@ g_main_context_unref (GMainContext *context)
+       source = s_iter->data;
+       g_source_destroy_internal (source, context, TRUE);
+     }
+-  UNLOCK_CONTEXT (context);
+
+   for (sl_iter = context->source_lists; sl_iter; sl_iter = sl_iter->next)
+     {
+@@ -595,6 +594,7 @@ g_main_context_unref (GMainContext *context)
+
+   g_hash_table_destroy (context->sources);
+
++  UNLOCK_CONTEXT (context);
+   g_mutex_clear (&context->mutex);
+
+   g_ptr_array_free (context->pending_dispatches, TRUE);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 5ed3b4e871..d496235003 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -16,6 +16,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
+           file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
+           file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
            "

 SRC_URI_append_class-native = " file://relocate-modules.patch"
--
2.25.1

