Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.6971.1628685792007420253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d1svazdZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: gavalcaz@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id c9so2844760wri.8
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5Hbqffmq7qpkvMa9K/qI5ZQQaQ3aedsGbgtfgxoGaQ=;
        b=d1svazdZmQ0Kbcv7s2RjZyeNoKXJcsRyjOMp0aqL/HS76jJiVlqyLiwNUy2AvzHlej
         TKsYBzKP5l99bERcLhBmzknoxcbYxFPnNlH5kc/L7+aggLaO1KpvGqk2Tf/xCKOuumw8
         erWhryySegtvBhS4T/A968ptROzzNKGuJ3S85lon1JLn4bAUggMU4R4zsoWqh5gFiIjl
         n1YwgpSSTwzQrkvbsnLGfJApwqx8TyVEHP6NjOVngRu91Z0/oCO+ghYVeYDtEca/HExl
         G0SqFl9yIjK+Pbcy+xt5zvUFYNCTdURCf1j2U0wmggGD44Q/tkijDMN4KXBqi5XG/azZ
         cqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5Hbqffmq7qpkvMa9K/qI5ZQQaQ3aedsGbgtfgxoGaQ=;
        b=GBhorAkPP/QKgv1ZMwQ3P12ozVw/iZvcDY6SKKIV7VPBbWWFmx4lVrMKNrzPwvZOXD
         Qq8zjx11sz4QqaGPTgz2rJw5jSp+iWuVnJQAQgKyVS61Bw8S5ICdzoef6zmqShoLuuZL
         /MksPbMAf5k9qbqQ79Yl0IqWsaLF+N4aDVAyk5n9/WRTJeNiGNIdtX/HAtnh8siDiyp5
         C/LUdl3IFyOFK6TIt8NqLTTg2ojw09UW0rz/V2WXKpe56zeICK2HJrR1InBlxmDMhVuQ
         oAourUDNje0eANGKQQjzTgf500jpsbDt/RpcWk73of8+42KY8Bqcg3qFqGp2rv5HIoiO
         3AzA==
X-Gm-Message-State: AOAM531EekRj35f/pvC90Xgd1/0UHNJEOCZRLbN4IHlIe3h53fe2tENY
	Gx8R4P5VpMn7FdKoQvHmL1nsavQVSw3h7A==
X-Google-Smtp-Source: ABdhPJx/G2B8xd/NHrMrGgs962ljRLECYEeQsn9S16V7TlBlqJ6Vf1f1xS2ES4cLrYw+sFY02mXTJg==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr36868316wro.207.1628685790035;
        Wed, 11 Aug 2021 05:43:10 -0700 (PDT)
Return-Path: <gavalcaz@gmail.com>
Received: from laptop2-HP-EliteBook-850-G1.home ([90.77.212.118])
        by smtp.gmail.com with ESMTPSA id t8sm28140307wmj.5.2021.08.11.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 05:43:09 -0700 (PDT)
From: gavalcaz@gmail.com
X-Google-Original-From: Gabriel Valcazar <gabriel.valcazar@digi.com>
To: openembedded-core@lists.openembedded.org
Cc: Gabriel Valcazar <gabriel.valcazar@digi.com>
Subject: [gatesgarth][PATCH] glib-2.0: backport 2.65.0 commit to fix intermittent race condition
Date: Wed, 11 Aug 2021 14:43:01 +0200
Message-Id: <20210811124301.17888-1-gabriel.valcazar@digi.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

glib versions between 2.63.3 and 2.64.6 are susceptible to a race condition
that has a low chance of happening, but can cause segmentation faults. For
example, when using NetworkManager 1.22.0 or newer, a segmentation fault can
happen even when running a simple command like 'nmcli'.

Backport a commit from glib 2.65.0 that fixes this issue to avoid unexpected
behaviour.

Signed-off-by: Gabriel Valcazar <gabriel.valcazar@digi.com>
---
 ...-minor-race-between-GCancellable-and.patch | 217 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gcancellable-Fix-minor-race-between-GCancellable-and.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gcancellable-Fix-minor-race-between-GCancellable-and.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gcancellable-Fix-minor-race-between-GCancellable-and.patch
new file mode 100644
index 0000000000..44c824eaa8
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gcancellable-Fix-minor-race-between-GCancellable-and.patch
@@ -0,0 +1,217 @@
+From d7e27bdce2f2f34efd860875e5c01425891aef56 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <withnall@endlessm.com>
+Date: Fri, 21 Feb 2020 14:44:44 +0000
+Subject: [PATCH] gcancellable: Fix minor race between GCancellable and
+ GCancellableSource
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There’s a minor race condition between cancellation of a `GCancellable`,
+and disposal/finalisation of a `GCancellableSource` in another thread.
+
+Thread A                               Thread B
+ g_cancellable_cancel(C)
+ →cancellable_source_cancelled(C, S)
+                                       g_source_unref(S)
+                                       cancellable_source_dispose(S)
+ →→g_source_ref(S)
+ →→# S is invalid at this point; crash
+
+Thankfully, the `GCancellable` sets `cancelled_running` while it’s
+emitting the `cancelled` signal, so if `cancellable_source_dispose()` is
+called while that’s high, we know that the thread which is doing the
+cancellation has already started (or is committed to starting) calling
+`cancellable_source_cancelled()`.
+
+Fix the race by resurrecting the `GCancellableSource` in
+`cancellable_source_dispose()`, and signalling this using
+`GCancellableSource.resurrected_during_cancellation`. Check for that
+flag in `cancellable_source_cancelled()` and ignore cancellation if it’s
+set.
+
+The modifications to `resurrected_during_cancellation` and the
+cancellable source’s refcount have to be done with `cancellable_mutex`
+held so that they are seen atomically by each thread. This should not
+affect performance too much, as it only happens during cancellation or
+disposal of a `GCancellableSource`.
+
+Signed-off-by: Philip Withnall <withnall@endlessm.com>
+
+Fixes: #1841
+---
+ gio/gcancellable.c      | 43 +++++++++++++++++++++++
+ gio/tests/cancellable.c | 77 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 120 insertions(+)
+
+diff --git a/gio/gcancellable.c b/gio/gcancellable.c
+index d9e58b8e8..e687cca23 100644
+--- a/gio/gcancellable.c
++++ b/gio/gcancellable.c
+@@ -643,6 +643,8 @@ typedef struct {
+ 
+   GCancellable *cancellable;
+   gulong        cancelled_handler;
++  /* Protected by cancellable_mutex: */
++  gboolean      resurrected_during_cancellation;
+ } GCancellableSource;
+ 
+ /*
+@@ -661,8 +663,24 @@ cancellable_source_cancelled (GCancellable *cancellable,
+ 			      gpointer      user_data)
+ {
+   GSource *source = user_data;
++  GCancellableSource *cancellable_source = (GCancellableSource *) source;
++
++  g_mutex_lock (&cancellable_mutex);
++
++  /* Drop the reference added in cancellable_source_dispose(); see the comment there.
++   * The reference must be dropped after unlocking @cancellable_mutex since
++   * it could be the final reference, and the dispose function takes
++   * @cancellable_mutex. */
++  if (cancellable_source->resurrected_during_cancellation)
++    {
++      cancellable_source->resurrected_during_cancellation = FALSE;
++      g_mutex_unlock (&cancellable_mutex);
++      g_source_unref (source);
++      return;
++    }
+ 
+   g_source_ref (source);
++  g_mutex_unlock (&cancellable_mutex);
+   g_source_set_ready_time (source, 0);
+   g_source_unref (source);
+ }
+@@ -684,12 +702,37 @@ cancellable_source_dispose (GSource *source)
+ {
+   GCancellableSource *cancellable_source = (GCancellableSource *)source;
+ 
++  g_mutex_lock (&cancellable_mutex);
++
+   if (cancellable_source->cancellable)
+     {
++      if (cancellable_source->cancellable->priv->cancelled_running)
++        {
++          /* There can be a race here: if thread A has called
++           * g_cancellable_cancel() and has got as far as committing to call
++           * cancellable_source_cancelled(), then thread B drops the final
++           * ref on the GCancellableSource before g_source_ref() is called in
++           * cancellable_source_cancelled(), then cancellable_source_dispose()
++           * will run through and the GCancellableSource will be finalised
++           * before cancellable_source_cancelled() gets to g_source_ref(). It
++           * will then be left in a state where it’s committed to using a
++           * dangling GCancellableSource pointer.
++           *
++           * Eliminate that race by resurrecting the #GSource temporarily, and
++           * then dropping that reference in cancellable_source_cancelled(),
++           * which should be guaranteed to fire because we’re inside a
++           * @cancelled_running block.
++           */
++          g_source_ref (source);
++          cancellable_source->resurrected_during_cancellation = TRUE;
++        }
++
+       g_clear_signal_handler (&cancellable_source->cancelled_handler,
+                               cancellable_source->cancellable);
+       g_clear_object (&cancellable_source->cancellable);
+     }
++
++  g_mutex_unlock (&cancellable_mutex);
+ }
+ 
+ static gboolean
+diff --git a/gio/tests/cancellable.c b/gio/tests/cancellable.c
+index cd349a8f3..492704d18 100644
+--- a/gio/tests/cancellable.c
++++ b/gio/tests/cancellable.c
+@@ -228,6 +228,82 @@ test_cancel_null (void)
+   g_cancellable_cancel (NULL);
+ }
+ 
++typedef struct
++{
++  GCond cond;
++  GMutex mutex;
++  GSource *cancellable_source;  /* (owned) */
++} ThreadedDisposeData;
++
++static gboolean
++cancelled_cb (GCancellable *cancellable,
++              gpointer      user_data)
++{
++  /* Nothing needs to be done here. */
++  return G_SOURCE_CONTINUE;
++}
++
++static gpointer
++threaded_dispose_thread_cb (gpointer user_data)
++{
++  ThreadedDisposeData *data = user_data;
++
++  /* Synchronise with the main thread before trying to reproduce the race. */
++  g_mutex_lock (&data->mutex);
++  g_cond_broadcast (&data->cond);
++  g_mutex_unlock (&data->mutex);
++
++  /* Race with cancellation of the cancellable. */
++  g_source_unref (data->cancellable_source);
++
++  return NULL;
++}
++
++static void
++test_cancellable_source_threaded_dispose (void)
++{
++  guint i;
++
++  g_test_summary ("Test a thread race between disposing of a GCancellableSource "
++                  "(in one thread) and cancelling the GCancellable it refers "
++                  "to (in another thread)");
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/issues/1841");
++
++  for (i = 0; i < 100000; i++)
++    {
++      GCancellable *cancellable = NULL;
++      GSource *cancellable_source = NULL;
++      ThreadedDisposeData data;
++      GThread *thread = NULL;
++
++      /* Create a cancellable and a cancellable source for it. For this test,
++       * there’s no need to attach the source to a #GMainContext. */
++      cancellable = g_cancellable_new ();
++      cancellable_source = g_cancellable_source_new (cancellable);
++      g_source_set_callback (cancellable_source, G_SOURCE_FUNC (cancelled_cb), NULL, NULL);
++
++      /* Create a new thread and wait until it’s ready to execute before
++       * cancelling our cancellable. */
++      g_cond_init (&data.cond);
++      g_mutex_init (&data.mutex);
++      data.cancellable_source = g_steal_pointer (&cancellable_source);
++
++      g_mutex_lock (&data.mutex);
++      thread = g_thread_new ("/cancellable-source/threaded-dispose",
++                             threaded_dispose_thread_cb, &data);
++      g_cond_wait (&data.cond, &data.mutex);
++      g_mutex_unlock (&data.mutex);
++
++      /* Race with disposal of the cancellable source. */
++      g_cancellable_cancel (cancellable);
++
++      g_thread_join (g_steal_pointer (&thread));
++      g_mutex_clear (&data.mutex);
++      g_cond_clear (&data.cond);
++      g_object_unref (cancellable);
++    }
++}
++
+ int
+ main (int argc, char *argv[])
+ {
+@@ -235,6 +311,7 @@ main (int argc, char *argv[])
+ 
+   g_test_add_func ("/cancellable/multiple-concurrent", test_cancel_multiple_concurrent);
+   g_test_add_func ("/cancellable/null", test_cancel_null);
++  g_test_add_func ("/cancellable-source/threaded-dispose", test_cancellable_source_threaded_dispose);
+ 
+   return g_test_run ();
+ }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
index ed7b649dc6..2dfca288aa 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-gcancellable-Fix-minor-race-between-GCancellable-and.patch \
            file://tzdata-update.patch \
            file://CVE-2020-35457.patch \
            file://CVE-2021-27219.patch \
-- 
2.17.1

