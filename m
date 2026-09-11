Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220D8C88E5E
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:50 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50888.1789164947700555776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ltSQ6/Rw;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so1073525e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164946; x=1789769746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ElfScPHC87//Dcs0OkdqU7g4oK52PnO5brnPF7HoZ8=;
        b=ltSQ6/RwZlN3WEPDh6+Py2t8fy4wOMGmpJWluBfRi/MSKfG2fbzACZYQ6OLp69Mlvj
         kRvVFF/foFhWaxNyoFkphwvd44GHRx4Ixy8gNq/m1TR4GyqOJDdgfmCYVKGGLqXlCwgA
         7sbEEmUio2ZWoFW0HkvolOIt6+wIUitwfR9WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164946; x=1789769746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ElfScPHC87//Dcs0OkdqU7g4oK52PnO5brnPF7HoZ8=;
        b=gWOiXxRrJSLCU3Sxi86mT4fjOwWRG1z53MrAGouNtvbsCluopWqyAIVdZHFiMhwK85
         PbldEoEIk/F1Aeb6i7AW0ZKLX6H4+UhMn5yFCvyj6aG5esTNhUypKWHjBWohtE23a5pa
         L7JpWA6ERAsTe5CgPl30dhQYARf+x6L097OGWltDHGCZwt7O65YX1P+me978FHa25GiI
         2kakLOZWzQ7UtCot+QCDucke2h8Q4pGYKXduHo7ZBbmk9nxz1ZNLfdKOCHCLpqeR8yon
         f03uvAsoAINnqNP+dQjrwZ787SWbC2SQLe1mNGS+M9SHsyrUHF6Kkws+XtDz6WUuPcsq
         xPtw==
X-Gm-Message-State: AFuF++n8Q6HlrgVDzZs9ln2pnNJLhexcJp6avftr37s03TBtc0jZ8nwU
	V7koo6L4JZlOiMW5Oenth+vnTqXhHe4rawM2MJU4hcBfD78oe++GVR/6NpcoEfgpKIL/AwlYp2J
	foAxypMo=
X-Gm-Gg: AYBFou2m7W2CusCJe9RZognCy2ZvjqTUO0PWPNMhzaOQHI5PpUp8RlB335s2Lh+5DZ/
	DLdXE6pVb45xyoWO8qBABlSuZoWDEBaSNb8DvbXIjv1rPpBXafiaW15RVUNySo6WmNTKgeaoD1U
	yY3fpWjjQP+0eVbvKQzV5xf8XLHzCgCx+ZfZGfaICsQJXiKeAP2OWsgRkpiSOQQmJAlH4suAqJt
	THXKd75hZs6TfQiaC8YPXUXNtRA4GPKgYnysPv0S115TJ6S//BzLJ45fcg+aHkr5A5Js48+oVR4
	oBJqZJRHYQVidIx5mSChzBwJv/GcwaScpXD2zIjRiiidXE1fCiS5UWqL9TlV7rtktQ3MpofgPSy
	ku+T4KWudNZU5h7oTO8cHTo/PN32JsvCOLwsdJqsCLzEF1Xu3MWYGabbMovqytgeo9oZaxTSIKr
	YIHrKi5ZKsQio8F6hDa1mCkDpUqqnAm8T9Hd6TQaOCat72yLCOYiw52v/NJ5JH02ecNpGrCsP6M
	+R5jkpMeh+ADZ0rmcCcL2q2ylpov4FA8seZafI4w/4Arn33l7lyoufkXvHOxQ1MIHQ5BiWCejQ=
X-Received: by 2002:a05:600c:4f47:b0:49c:fa21:e748 with SMTP id 5b1f17b1804b1-49e619dbd2bmr83452125e9.30.1789164945887;
        Fri, 11 Sep 2026 15:15:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/13] go: Fix CVE-2026-33814
Date: Sat, 12 Sep 2026 00:14:59 +0200
Message-ID: <4fe1f459482cfc54333b4cb90bb822a901822e28.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245675

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f
[2] https://pkg.go.dev/vuln/GO-2026-4918

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-33814.patch                | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 99c5f8b63b6..ee2f5ca2777 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -62,6 +62,7 @@ SRC_URI += "\
     file://CVE-2026-25679.patch \
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
+    file://CVE-2026-33814.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-33814.patch b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
new file mode 100644
index 00000000000..8265bf205f6
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-33814.patch
@@ -0,0 +1,44 @@
+From 825d42a14d8ffbdbdda87a39e78795eb17e4f0f2 Mon Sep 17 00:00:00 2001
+From: Mark Freeman <mark@golang.org>
+Date: Fri, 17 Apr 2026 16:28:03 -0400
+Subject: [PATCH] [release-branch.go1.25] all: update x/net to a9171bc8
+
+Fixes #78477
+
+Change-Id: I0a4c8e25f569fc1bfb8ac39ff728bfe7300b751f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/768323
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-33814
+Upstream-Status: Backport [https://github.com/golang/go/commit/9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f]
+
+Backport Changes:
+- Omitted src/go.mod, src/go.sum, and src/vendor/modules.txt because
+  their x/net version updates are not required for this focused backport.
+- Omitted removal of the SETTINGS_ENABLE_CONNECT_PROTOCOL-specific
+  s.Valid call because Go 1.22 does not contain that setting case; validation
+  is added at the start of the settings callback instead.
+
+(cherry picked from commit 9024c3f6b150fb1349d8a5dc5e9aa31d7896f67f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/net/http/h2_bundle.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index c1a2e76ea4d..2f5a6d3d5a2 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -9910,6 +9910,9 @@ func (rl *http2clientConnReadLoop) processSettingsNoWrite(f *http2SettingsFrame)
+ 
+ 	var seenMaxConcurrentStreams bool
+ 	err := f.ForeachSetting(func(s http2Setting) error {
++		if err := s.Valid(); err != nil {
++			return err
++		}
+ 		switch s.ID {
+ 		case http2SettingMaxFrameSize:
+ 			cc.maxFrameSize = s.Val
+-- 
+2.35.6

