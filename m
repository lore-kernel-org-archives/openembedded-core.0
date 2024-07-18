Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0A9C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.15459.1721310356337709621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M/L+ZDq+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc2a194750so8243755ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310355; x=1721915155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFCxNlNOdyrzB0lOFJxSxsgcSR9Log1ga0siY3/a16E=;
        b=M/L+ZDq+GF9v5ev1nOrkbhLXSO9un3aQ2qngHgS2SU0WQjaa47xfKyWZgxn7XdlmtW
         qjL6RFx4dwpuQalSySHQkp/NHhlxKbJO41uCNo81NYvoOIOUzZkJAhyfadj9gmrb+YO1
         9IoUHmKepyS5B4fInjQ43uJCntHT7rkBkH3x7/yvdcozVPKMNyrKO4EpvIESAVmLTJ4r
         8vJLDMrtIQZDTVo+0KDNTpbrbSOV4i/x5cppSrZLq3yFx5B6LyLx50xDjFqGkm+UFENs
         MUcNN/szxePfubJUYsggPKHRdfH/T//rmrSDPTRDWvjP30DQNlEVzYG0oexvDeOcPH1G
         KcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310356; x=1721915156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFCxNlNOdyrzB0lOFJxSxsgcSR9Log1ga0siY3/a16E=;
        b=XBrQU5BsFuBZ3jZuiZozC8C9cjzGvFviu39tc2l6wO/Gkzl8y3slX8vV7lJY694Ppe
         DPV0bvVg8pvbwisXAwA4mO+yVUCBq6so7UShKdXJ9KP0Sc3PjxGbKk74tOLCTdKhn4by
         I0Ex40KQQ0AEMe2ClqSZn2C15n1OrVtRFD7TvHPzjT2eLbNZQ63IRBcX8BPOJBts7/my
         zII9qm4M2f1dmEstuaeE2fhKHeaWjBrFsKdUNTBTP2vHDGAfWn1ISC+/112hL3VohKF4
         XcPNy/mUJfYrHXOXOX6vlvi7vvbO7FhHry9fohpA6OJXPj8YV9m3b8KBKArzTTnEiOVu
         s+5w==
X-Gm-Message-State: AOJu0YziylVDXtTZIeVA2/2mneI9uP6ONvBmqruixJaffKy3xoBZ9iHm
	sSHhw9nuSSaHJ2HF4Nza/HJax2AV5oXSyoRkKHtVMheys6TDhfkXQNgx5KCq59rDkLdTANYWFtS
	x
X-Google-Smtp-Source: AGHT+IF1TwIA5k5aIwxByXsEyyEHgxtyY1SaIqcZIyJTyJhjj6vfJQp0n073xhoDacCyvZ2LTXZyKA==
X-Received: by 2002:a17:902:c40a:b0:1fb:72ea:376 with SMTP id d9443c01a7336-1fc4e70b9cdmr35588995ad.65.1721310355515;
        Thu, 18 Jul 2024 06:45:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.45.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:45:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] vte: fix CVE-2024-37535
Date: Thu, 18 Jul 2024 06:45:32 -0700
Message-Id: <dd5482d64587124bd5060c7b3532f0e90b94c367.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202216

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2 && https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vte/vte/CVE-2024-37535-01.patch           | 64 ++++++++++++++
 .../vte/vte/CVE-2024-37535-02.patch           | 85 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.74.2.bb        |  5 +-
 3 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-01.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-02.patch

diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-01.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-01.patch
new file mode 100644
index 0000000000..d18a3380af
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-01.patch
@@ -0,0 +1,64 @@
+From 036bc3ddcbb56f05c6ca76712a53b89dee1369e2 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] emulation: Restrict resize request to sane numbers
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit fd5511f24b7269195a7083f409244e9787c705dc)
+
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2]
+CVE: CVE-2024-37535
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/vteseq.cc | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/vteseq.cc b/src/vteseq.cc
+index 8d1c2e1..1c73dad 100644
+--- a/src/vteseq.cc
++++ b/src/vteseq.cc
+@@ -208,9 +208,18 @@ Terminal::emit_bell()
+ /* Emit a "resize-window" signal.  (Grid size.) */
+ void
+ Terminal::emit_resize_window(guint columns,
+-                                       guint rows)
+-{
+-        _vte_debug_print(VTE_DEBUG_SIGNALS, "Emitting `resize-window'.\n");
++                             guint rows)
++{
++        // Ignore resizes with excessive number of rows or columns,
++        // see https://gitlab.gnome.org/GNOME/vte/-/issues/2786
++        if (columns < VTE_MIN_GRID_WIDTH ||
++            columns > 511 ||
++            rows < VTE_MIN_GRID_HEIGHT ||
++            rows > 511)
++                return;
++
++        _vte_debug_print(VTE_DEBUG_SIGNALS, "Emitting `resize-window' %d columns %d rows.\n",
++                         columns, rows);
+         g_signal_emit(m_terminal, signals[SIGNAL_RESIZE_WINDOW], 0, columns, rows);
+ }
+ 
+@@ -4457,8 +4466,6 @@ Terminal::DECSLPP(vte::parser::Sequence const& seq)
+         else if (param < 24)
+                 return;
+ 
+-        _vte_debug_print(VTE_DEBUG_EMULATION, "Resizing to %d rows.\n", param);
+-
+         emit_resize_window(m_column_count, param);
+ }
+ 
+@@ -8917,9 +8924,6 @@ Terminal::XTERM_WM(vte::parser::Sequence const& seq)
+                 seq.collect(1, {&height, &width});
+ 
+                 if (width != -1 && height != -1) {
+-                        _vte_debug_print(VTE_DEBUG_EMULATION,
+-                                         "Resizing window to %d columns, %d rows.\n",
+-                                         width, height);
+                         emit_resize_window(width, height);
+                 }
+                 break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-02.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-02.patch
new file mode 100644
index 0000000000..032e00fb5c
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-02.patch
@@ -0,0 +1,85 @@
+rom c313849c2e5133802e21b13fa0b141b360171d39 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] widget: Add safety limit to widget size requests
+
+https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit 1803ba866053a3d7840892b9d31fe2944a183eda)
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39]
+CVE: CVE-2024-37535
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/vtegtk.cc | 35 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/src/vtegtk.cc b/src/vtegtk.cc
+index 0f4641d..060d27e 100644
+--- a/src/vtegtk.cc
++++ b/src/vtegtk.cc
+@@ -91,6 +91,38 @@
+ template<typename T>
+ constexpr bool check_enum_value(T value) noexcept;
+ 
++static inline void
++sanitise_widget_size_request(int* minimum,
++                             int* natural) noexcept
++{
++        // Overly large size requests will make gtk happily allocate
++        // a window size over the window system's limits (see
++        // e.g. https://gitlab.gnome.org/GNOME/vte/-/issues/2786),
++        // leading to aborting the whole process.
++        // The toolkit should be in a better position to know about
++        // these limits and not exceed them (which here is certainly
++        // possible since our minimum sizes are very small), let's
++        // limit the widget's size request to some large value
++        // that hopefully is within the absolute limits of
++        // the window system (assumed here to be int16 range,
++        // and leaving some space for the widgets that contain
++        // the terminal).
++        auto const limit = (1 << 15) - (1 << 12);
++
++        if (*minimum > limit || *natural > limit) {
++                static auto warned = false;
++
++                if (!warned) {
++                        g_warning("Widget size request (minimum %d, natural %d) exceeds limits\n",
++                                  *minimum, *natural);
++                        warned = true;
++                }
++        }
++
++        *minimum = std::min(*minimum, limit);
++        *natural = std::clamp(*natural, *minimum, limit);
++}
++
+ struct _VteTerminalClassPrivate {
+         GtkStyleProvider *style_provider;
+ };
+@@ -497,6 +529,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_width(minimum_width, natural_width);
++        sanitise_widget_size_request(minimum_width, natural_width);
+ }
+ catch (...)
+ {
+@@ -511,6 +544,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_height(minimum_height, natural_height);
++        sanitise_widget_size_request(minimum_height, natural_height);
+ }
+ catch (...)
+ {
+@@ -748,6 +782,7 @@ try
+         WIDGET(terminal)->measure(orientation, for_size,
+                                   minimum, natural,
+                                   minimum_baseline, natural_baseline);
++        sanitise_widget_size_request(minimum, natural);
+ }
+ catch (...)
+ {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/vte/vte_0.74.2.bb b/meta/recipes-support/vte/vte_0.74.2.bb
index d8eafde2fb..af9ff1bb1d 100644
--- a/meta/recipes-support/vte/vte_0.74.2.bb
+++ b/meta/recipes-support/vte/vte_0.74.2.bb
@@ -18,7 +18,10 @@ GIDOCGEN_MESON_OPTION = "docs"
 
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://CVE-2024-37535-01.patch \
+            file://CVE-2024-37535-02.patch \
+            "
 SRC_URI[archive.sha256sum] = "a535fb2a98fea8a2449cd1a02cccf5190131dddff52e715afdace3feb536eae7"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.34.1


