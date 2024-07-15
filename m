Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EB9C2BD09
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 08:12:04 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.33275.1721031117457560744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 01:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DnWdWdku;
 spf=pass (domain: mvista.com, ip: 209.85.219.175, mailfrom: hprajapati@mvista.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso4149774276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721031116; x=1721635916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/loWTadePyO5GP9dG0OPTbill5uvtK+tJe3uSs5YGU=;
        b=DnWdWdkuRs07y/fcdL6trHCc6DGlwk/Bp+yWmyxJkSOIk9CaRV4cQ+yZr3pr6IUDqc
         XS38IBbXSKle6eew9HELj0cvoBah6fxjptM4e1j1Ah3F+cMzSrYMF5f8vliZqE/aOZLj
         wW8txdMfv6C9TUWvywDtzBJTlrHAvtSavU8FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031116; x=1721635916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/loWTadePyO5GP9dG0OPTbill5uvtK+tJe3uSs5YGU=;
        b=rKfkP5lgx6FiFVHhnGNCs8LmDWtfTRf8LsQdv2fmsWjE6OHZlT9bAe+mxVEXxwLOFc
         MWi6JWbCEcBnq/+s81GYCDMhHwc8uyGX/bpzp/CjUqjZm3VscrLEZ0HEHd6TkvsHpufu
         101DwOZnjlj4crxTvqgkRI4J8fmh14mGUy2Hg7jJUt5njVtQLcj5ftCqQbblp9ozwK8M
         Xv7xqLkyEb9o0GwZmwlUuCA/qYEZqfd4tGqVnNw49z6YQ28xI8GjCYt9Ew83WzYQtQl/
         t70hs2tUGcf8gCWXE/PtXdccxt7Juef+85+sH2fZwX88oAg6ltFpzR/NgvCv1DQuYj8B
         RUmA==
X-Gm-Message-State: AOJu0YwKlsvKxVQa42l41ed6aTyqUb1+22QydV88kbN1HdmwKp8dwfiG
	19LpUZmWG/T+ur1WpN3aBhmAfgk+Jf5PcDj/vgNd8qeB+he2YVF6cGF32UM+hO5DKp0s+sS8Twa
	9
X-Google-Smtp-Source: AGHT+IHiFLLomjyP5zh82xdpgfaXo4UKrt46fee8rqrv5RpUtpJg4QlgjTTOZ7uSUU6FL6qOKGVAtg==
X-Received: by 2002:a05:6902:2b8f:b0:e05:a65d:d547 with SMTP id 3f1490d57ef6-e05a65dde63mr5447358276.37.1721031116437;
        Mon, 15 Jul 2024 01:11:56 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.189])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e05a459ccc3sm779848276.6.2024.07.15.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:11:56 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vte: fix CVE-2024-37535
Date: Mon, 15 Jul 2024 13:41:43 +0530
Message-Id: <20240715081143.7397-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 08:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201903

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2 && https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


