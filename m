Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CBC02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.42126.1737395476368047327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bXrpDPBb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21628b3fe7dso82313355ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395476; x=1738000276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orU2ezzlNn+4qcuH4MnBXBJELFH3/jnt5jXK8EDLSlQ=;
        b=bXrpDPBbJScP4Hh4coP4LvPrDSTSGfBsyl1WywICkJzYDKsSLjEQivfYfAc0RCwa4O
         +9AHjHspgxxlCP728Iqa68csfaoh09zMztPH8aGM2w7mZK6lS5zLsfN6TQPte47tVIhT
         tMmLS1L/mSiY6VWZu2xsU4B1YwGpPRgbD6znOOP8w7/8rU/x7nnI9w655OGruGUA+pbd
         PUnRxMJh8SH+FRqxxh7HZuWG1wsJPvwhk1v28um8+ox5A4YX5RU5MPTX2RQtpmeRddZ4
         7SEVOD55+sFDRzBs3wbZCYhuei9tGSG46oFWjvIUejzQWL019ndKbtB73Kk/7GZNo6Ux
         o0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395476; x=1738000276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orU2ezzlNn+4qcuH4MnBXBJELFH3/jnt5jXK8EDLSlQ=;
        b=Ck/42R2s/d4SLMhbrXo93fhkELbHzicUgsEXogIKLZ+pK1UVhNizkd6673Ylb/dS/p
         KDS2MC81JFjBVfSceksazFHEYOgpKO2lwyIEBZSgr2/F+76GelYYfT9pun+uCVYVfZ2S
         vw2phTd/cqnI6KlGI9eOWnzGJgCpH9IjgVA0+ZKP6mbzrynCneb8x2g+8GztnKk3AJ+7
         UR64yTE+98Is4i/VeM6JwvE8MIPyFc7iCKTLbVS3UCB/8kH+S+eSBRydQHSaDA0RNLEd
         FBzaKu6jK9/ERnAppoykUfslUe3RHZzBqSHE6QChyxKTE5f93KqDYGc6vybHS8oLyBLS
         iruQ==
X-Gm-Message-State: AOJu0YwJ1lJ5AmNJrAa+52eogndPnd86b1YkIhB575q4Rix8fgvEK6U6
	EIB3rCo7gBSv5ERm/spIejuhpxbI7tr1xEuFgAVh73phv7fRQIRxFqTJ1ZjUBsZAhpYef37RvQj
	5wKg=
X-Gm-Gg: ASbGncuYbC5Ek/PhCuX/vQ3jJUzQjvVbkPnb4q+EfaXxzhg40MMzr3s58PmcJOWuNNi
	ZyaoNOwzuRV5YBjsun5FsN9/pO9q4YLb8EvTTuf0eWSsKOViHAmX81amENxskjm3WOs8Fp44ciD
	K+XC1kBPBZo6ANEYu0WjXGYDklLp1xNQfk6DlAunNezW3H79Tu3wguKjN5qyxwiArGHwzv0M2td
	aPqo7k2pYKJeV/TJeAoQir1jvG+axXSGBhQT/sKHq6PY9uEEA3ttFukPSI=
X-Google-Smtp-Source: AGHT+IFj36hZr7Ij5ighOi6FQCSWi6+OhRyJpdvvLz4T94k47AT0Q2wCOvjMcwjZzR5/nAC4iA8qmw==
X-Received: by 2002:a05:6a20:3d83:b0:1e1:bf3d:a191 with SMTP id adf61e73a8af0-1eb21590339mr21190973637.33.1737395475298;
        Mon, 20 Jan 2025 09:51:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] vte: fix CVE-2024-37535
Date: Mon, 20 Jan 2025 09:50:48 -0800
Message-ID: <132a5168b125d6f4fb9391d982bc64d73429ab8f.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210048

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-37535:
GNOME VTE before 0.76.3 allows an attacker to cause a denial of service
 (memory consumption) via a window resize escape sequence, a related
issue to CVE-2000-0476.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-37535]

Upstream patches:
[https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2]
[https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vte/vte/CVE-2024-37535-0001.patch         | 63 ++++++++++++++
 .../vte/vte/CVE-2024-37535-0002.patch         | 85 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.66.2.bb        |  9 +-
 3 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch

diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
new file mode 100644
index 0000000000..f7c84323fb
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
@@ -0,0 +1,63 @@
+From 036bc3ddcbb56f05c6ca76712a53b89dee1369e2 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] emulation: Restrict resize request to sane numbers
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit fd5511f24b7269195a7083f409244e9787c705dc)
+
+CVE: CVE-2024-37535
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/036bc3ddcbb56f05c6ca76712a53b89dee1369e2]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/vteseq.cc | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/vteseq.cc b/src/vteseq.cc
+index 2c5b1e128..5b3f398e2 100644
+--- a/src/vteseq.cc
++++ b/src/vteseq.cc
+@@ -213,9 +213,18 @@ Terminal::emit_bell()
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
+@@ -4467,8 +4476,6 @@ Terminal::DECSLPP(vte::parser::Sequence const& seq)
+         else if (param < 24)
+                 return;
+ 
+-        _vte_debug_print(VTE_DEBUG_EMULATION, "Resizing to %d rows.\n", param);
+-
+         emit_resize_window(m_column_count, param);
+ }
+ 
+@@ -8990,9 +8997,6 @@ Terminal::XTERM_WM(vte::parser::Sequence const& seq)
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
+GitLab
diff --git a/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch b/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch
new file mode 100644
index 0000000000..c396817060
--- /dev/null
+++ b/meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch
@@ -0,0 +1,85 @@
+From c313849c2e5133802e21b13fa0b141b360171d39 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Sun, 2 Jun 2024 19:19:35 +0200
+Subject: [PATCH] widget: Add safety limit to widget size requests
+
+https://gitlab.gnome.org/GNOME/vte/-/issues/2786
+(cherry picked from commit 1803ba866053a3d7840892b9d31fe2944a183eda)
+
+CVE: CVE-2024-37535
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vte/-/commit/c313849c2e5133802e21b13fa0b141b360171d39]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/vtegtk.cc | 35 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/src/vtegtk.cc b/src/vtegtk.cc
+index 24bdd7184..48cae79c1 100644
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
+@@ -510,6 +542,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_width(minimum_width, natural_width);
++        sanitise_widget_size_request(minimum_width, natural_width);
+ }
+ catch (...)
+ {
+@@ -524,6 +557,7 @@ try
+ {
+ 	VteTerminal *terminal = VTE_TERMINAL(widget);
+         WIDGET(terminal)->get_preferred_height(minimum_height, natural_height);
++        sanitise_widget_size_request(minimum_height, natural_height);
+ }
+ catch (...)
+ {
+@@ -781,6 +815,7 @@ try
+         WIDGET(terminal)->measure(orientation, for_size,
+                                   minimum, natural,
+                                   minimum_baseline, natural_baseline);
++        sanitise_widget_size_request(minimum, natural);
+ }
+ catch (...)
+ {
+-- 
+GitLab
diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.66.2.bb
index af1c47cf80..365e4361cb 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.66.2.bb
@@ -19,8 +19,13 @@ GIR_MESON_OPTION = 'gir'
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
+SRC_URI += " \
+            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch \
+            file://CVE-2024-37535-0001.patch \
+            file://CVE-2024-37535-0002.patch \
+            "
+
 SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.43.0


