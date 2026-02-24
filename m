Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB18BE9B27B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21475.1771943587097550386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mgI06dzg;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483abed83b6so22424385e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943585; x=1772548385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qbc8+HSFCTLphLzH933222PqsIizqSct2BRkmBDeux4=;
        b=mgI06dzgMyQLQWVM+ChSVO21aOu8Aacrrb8BYyoRaRxZUrQJjlaQMu4P/WztOirVtO
         pa/vdYYwPbK7+AwKjhwBtyxMJnKI8nu4FwrHPOlnu8iZZYt0+na3IYArGXbkNr2C5fAM
         F8ZinqjRBXBUxHap7cAcFdy68+G1125CC1H/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943585; x=1772548385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qbc8+HSFCTLphLzH933222PqsIizqSct2BRkmBDeux4=;
        b=F4lsLohT57zlqgsJMTw6l8LDzA34dZXPHXs9BD5MqMXY3pikmmWYqqAhSLjm1LIkG3
         kQJ4C7TPLZW20GYRBB8pNhqybj+9U/PqsjKIcIhYmpI0cYW6d8g7sAc7I2YvhziOqfHS
         L5hjHbsROXb9tMYhLeIlgPBhvjT7vMuBDKNfI3Rq5UopMMOdlnLP2rNZJAnZOtHSdtd3
         6fQrfd0/cgqoxnBcmy5gb4cdQMldUGyKOOU1Qy2HseDLo/Es5jojTzPntcFQmgR7pn1O
         f98vDQRsJV1inlzziZ1rdb8BKOot3H0xWtB7yKjOG+iXPN02J0DcjD2ShXjfgLw0LtBq
         WVmg==
X-Gm-Message-State: AOJu0YwFjZYByN7K95VRIF6Ev3Mspp623JbLnPavLjeVqrsUE0o221IV
	ISwfGNdaq8J8XM1ugr7M3h8VMCO1+V+89ay1+fdRwGC4ss/4vPW2cOBtbVS1IAsIBOE/sYGth7V
	uVaas
X-Gm-Gg: AZuq6aJfaE8RdtXUezYaaqUZQclXr081EYGtTVC+vTai+FePbFBUDqZd6nkzojFzJ2G
	6dHsMLEip92BxG5PeubY+E/ePSf9c+3+ONl1+w5B0be5yBTPk1yF1I08Y8YysvyxV1lATVg+N3p
	FELIE73j7KNY0U/kCfP5w+Y+Dqnl9Npvae/j5v2JOkAKZ40dIxcsXP9O9XTfbBJKChaxQbxVatJ
	FgHuWUMhhMywBXYEUVS3MbgPAQVpIejZY/o2hWIx9DDgsSftSMWi2nTEQ1GOzLBeKKHg1RHvIpl
	69zFVENkrLzDxGif0Mu9J8hiuGSgp80ED7c10RR43SH2iKMO1qV3m2TDqaBcFpa50gTECBoAFIY
	PCqeb9yNL3Pwyoqok8jNiuCulQ96yA9HJl3gAK4aoc8aQgoTwdSjZqT+lb0ylL0VYejI5GmJ4GA
	tAvIpVDHPeNsUoCy4mRKtI4i8hMFiPv6PuE8EG8wrk+58aPIUHuh07P7moK5lELe3C/Demqn2xd
	ndiOklMNLMu+tzOLU/zcpE+MWNioXy7pA==
X-Received: by 2002:a05:600c:1d0e:b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-483a95bd940mr210251585e9.12.1771943584969;
        Tue, 24 Feb 2026 06:33:04 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/44] go 1.22.12: Fix CVE-2025-61731
Date: Tue, 24 Feb 2026 15:31:51 +0100
Message-ID: <73ae906130c039f6d7de467821104fec9309d95f.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231830

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61731
Type: Security Fix
CVE: CVE-2025-61731
Score: 7.8
Patch: https://github.com/golang/go/commit/00b7309387a1

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-61731.patch                | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61731.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 04e380c821e..82019f25dd7 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -34,6 +34,7 @@ SRC_URI += "\
     file://CVE-2025-61730.patch \
     file://CVE-2025-61726.patch \
     file://CVE-2025-61728.patch \
+    file://CVE-2025-61731.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61731.patch b/meta/recipes-devtools/go/go/CVE-2025-61731.patch
new file mode 100644
index 00000000000..a4589daade9
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61731.patch
@@ -0,0 +1,70 @@
+From ab266ccbc19789c52dcb1dc6e8e71d2f4fd545ff Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Thu, 4 Dec 2025 12:30:39 -0500
+Subject: [PATCH] [release-branch.go1.24] cmd/go/internal/work: sanitize flags
+ before invoking 'pkg-config'
+
+The addition of CgoPkgConfig allowed execution with flags not
+matching the safelist. In order to prevent potential arbitrary
+code execution at build time, ensure that flags are validated
+prior to invoking the 'pkg-config' binary.
+
+Thank you to RyotaK (https://ryotak.net) of GMO Flatt Security Inc.
+for reporting this issue.
+
+Fixes CVE-2025-61731
+Fixes #77100
+
+CVE: CVE-2025-61731
+Upstream-Status: Backport [https://github.com/golang/go/commit/00b7309387a1]
+
+Change-Id: Ic51b41f1f7e697ab98c9c32c6fae35f217f7f364
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3240
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3344
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/736701
+Auto-Submit: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+(cherry picked from commit 00b7309387a171bcba37382e7ed96b473df04917)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/go/internal/work/exec.go     | 8 ++++++++
+ src/cmd/go/internal/work/security.go | 1 +
+ 2 files changed, 9 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c8f297cbe9..815942a703 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -1684,6 +1684,14 @@ func (b *Builder) getPkgConfigFlags(a *Action) (cflags, ldflags []string, err er
+				return nil, nil, fmt.Errorf("invalid pkg-config package name: %s", pkg)
+			}
+		}
++
++		// Running 'pkg-config' can cause execution of
++		// arbitrary code using flags that are not in
++		// the safelist.
++		if err := checkCompilerFlags("CFLAGS", "pkg-config --cflags", pcflags); err != nil {
++			return nil, nil, err
++		}
++
+		var out []byte
+		out, err = sh.runOut(p.Dir, nil, b.PkgconfigCmd(), "--cflags", pcflags, "--", pkgs)
+		if err != nil {
+diff --git a/src/cmd/go/internal/work/security.go b/src/cmd/go/internal/work/security.go
+index 568eecd325..79724ed04a 100644
+--- a/src/cmd/go/internal/work/security.go
++++ b/src/cmd/go/internal/work/security.go
+@@ -122,6 +122,7 @@ var validCompilerFlags = []*lazyregexp.Regexp{
+	re(`-pedantic(-errors)?`),
+	re(`-pipe`),
+	re(`-pthread`),
++	re(`--static`),
+	re(`-?-std=([^@\-].*)`),
+	re(`-?-stdlib=([^@\-].*)`),
+	re(`--sysroot=([^@\-].*)`),
+--
+2.35.6

