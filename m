Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD93C43217
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.24248.1641036608463653382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwS5kzsZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d9so60246661wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w/73wiXP80n4EVJD6lI9SG2JHXZHXhomrm4eKyZD1E0=;
        b=PwS5kzsZaR/0ZJ+sI+JSb1cJf8YssCpJgzwLvE0e+rojtV1+eR1DKOplxpP9GUo/Vk
         3WiMe/NUVtpL0AyGB5knIQn3TmxnS890tnwDqC2AyUegBnaQvw0lqQITGRaa2A4kkT9J
         b1uctYtxMMSqJKGVz5IITPuUvs3ESJqAvXbLH/QqXXB719t7VUvyf2wqaNN5iyaDRKRH
         ttJ+jcOm3cqzvRk0jpTIBfaYfY463a8vAo0Ha9R36gpCMzYSjRmnVkbtGdOL5S/r3WGz
         0GbkJU1RkvwD3cXZl23v8/P68qnuBWt7dd3ajJ9CDQ+0ZqhCUXDZ9AQMh0eAm9o6AudN
         aPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/73wiXP80n4EVJD6lI9SG2JHXZHXhomrm4eKyZD1E0=;
        b=fq+APFt1Fz61UJ/nfqPjByf7pGxLy6zi9+ZYGTlJ9m/sD3zKjQKpEBpSBNx9JJgMyt
         LclXo26yqHyBegrC2EzVliVhCeYMoOzAwADiXhUUTP0wDZfildMJYZxBwJ+siVj1YsT0
         7TO5DcTaVQgS5yJ+JWIyg2ez1XOrreJEfDPsMI4KMOxhwVk+m5v6gPGHbI7lBULAVXzA
         vK1Egm7EMsqaV0U/SMuH+rT/iwzXqegxhDg4O6cYm7piSFqYvPeDhV4k8vkf9GWZ7xdT
         PnymLTy0jktCv7kAwIfBG0KHP8FGdu0WFlPGceOpyFynHPd49eK1/Xi6irRtcsEnXMri
         ayHQ==
X-Gm-Message-State: AOAM531XQC+W1KL/fa9rdHOYNt/3I4WuiftWYeQJTzavZjtU3KXqXBcD
	tPhLOe86noFt5MWqObS989C8LjucyuI=
X-Google-Smtp-Source: 
 ABdhPJw80u8BWGEE6jGbADiAFoxjx/30rlKljZo49Rs/fAfOzPn6TM6eh43IXfyUQ1tQZY0rPaLZ+g==
X-Received: by 2002:a5d:6d8a:: with SMTP id
 l10mr32724546wrs.270.1641036607024;
        Sat, 01 Jan 2022 03:30:07 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] go: additional patches to help reproducibility
Date: Sat,  1 Jan 2022 12:29:58 +0100
Message-Id: <20220101112959.1866747-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220101112959.1866747-1-alex@linutronix.de>
References: <20220101112959.1866747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160098

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/go-1.17.5.inc        |  2 +
 ...not-write-linker-flags-into-buildids.patch | 41 +++++++++++++++++++
 ...ldgo.go-do-not-hardcode-host-compile.patch | 41 +++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
 create mode 100644 meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch

diff --git a/meta/recipes-devtools/go/go-1.17.5.inc b/meta/recipes-devtools/go/go-1.17.5.inc
index baddd3b215..56957f7c6e 100644
--- a/meta/recipes-devtools/go/go-1.17.5.inc
+++ b/meta/recipes-devtools/go/go-1.17.5.inc
@@ -14,6 +14,8 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
+    file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
+    file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
 SRC_URI[main.sha256sum] = "3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d"
 
diff --git a/meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
new file mode 100644
index 0000000000..20b6636f65
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -0,0 +1,41 @@
+From bdd69b55387f80c8df18d0af5008bf5e1a66be6a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 23 Nov 2020 19:22:04 +0000
+Subject: [PATCH] exec.go: do not write linker flags into buildids
+
+The flags can contain build-specific paths, breaking reproducibility.
+
+To make this acceptable to upstream, we probably need to trim the flags,
+removing those known to be buildhost-specific.
+
+Upstream-Status: Inappropriate [needs upstream discussion]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/cmd/go/internal/work/exec.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 696db23..727d40b 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -1136,7 +1136,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+ 	}
+ 
+ 	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
+-	b.printLinkerConfig(h, p)
++	//b.printLinkerConfig(h, p)
+ 
+ 	// Input files.
+ 	for _, a1 := range a.Deps {
+@@ -1418,7 +1418,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
+ 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
+ 
+ 	// Toolchain-dependent configuration, shared with b.linkActionID.
+-	b.printLinkerConfig(h, nil)
++	//b.printLinkerConfig(h, nil)
+ 
+ 	// Input files.
+ 	for _, a1 := range a.Deps {
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
new file mode 100644
index 0000000000..257454a67d
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -0,0 +1,41 @@
+From 2055a46b396e272616c0b2273903e02c3b49a2ff Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 16:33:27 +0000
+Subject: [PATCH] src/cmd/dist/buildgo.go: do not hardcode host compilers into
+ target binaries
+
+These come from $CC/$CXX on the build host and are not useful on targets;
+additionally as they contain host specific paths, this helps reproducibility.
+
+Upstream-Status: Inappropriate [needs upstream discussion]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/cmd/dist/buildgo.go | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
+index caafc13..4eb1c96 100644
+--- a/src/cmd/dist/buildgo.go
++++ b/src/cmd/dist/buildgo.go
+@@ -34,8 +34,8 @@ func mkzdefaultcc(dir, file string) {
+ 		fmt.Fprintf(&buf, "package cfg\n")
+ 		fmt.Fprintln(&buf)
+ 		fmt.Fprintf(&buf, "const DefaultPkgConfig = `%s`\n", defaultpkgconfig)
+-		buf.WriteString(defaultCCFunc("DefaultCC", defaultcc))
+-		buf.WriteString(defaultCCFunc("DefaultCXX", defaultcxx))
++		buf.WriteString(defaultCCFunc("DefaultCC", map[string]string{"":"gcc"}))
++		buf.WriteString(defaultCCFunc("DefaultCXX", map[string]string{"":"g++"}))
+ 		writefile(buf.String(), file, writeSkipSame)
+ 		return
+ 	}
+@@ -46,8 +46,8 @@ func mkzdefaultcc(dir, file string) {
+ 	fmt.Fprintf(&buf, "package main\n")
+ 	fmt.Fprintln(&buf)
+ 	fmt.Fprintf(&buf, "const defaultPkgConfig = `%s`\n", defaultpkgconfig)
+-	buf.WriteString(defaultCCFunc("defaultCC", defaultcc))
+-	buf.WriteString(defaultCCFunc("defaultCXX", defaultcxx))
++	buf.WriteString(defaultCCFunc("defaultCC", map[string]string{"":"gcc"}))
++	buf.WriteString(defaultCCFunc("defaultCXX", map[string]string{"":"g++"}))
+ 	writefile(buf.String(), file, writeSkipSame)
+ }
+ 
-- 
2.20.1


