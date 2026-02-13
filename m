Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C78EF48DF
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67365.1770970230885236680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dQO6mj/W;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso4728295e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970229; x=1771575029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Liwcje/Z9Lx3AK5pmnlgytbBGwQshpvm0q8FNBZl+uE=;
        b=dQO6mj/WPqff7DEjCC6fTUnLSVRGkmNTx9fSdAAsz1yc3ZM38S6PB+H/Xa4ysKv8DZ
         Qg4HhQ0QPFVpsnjLgaM0eNN8tImVm9WyryuFhY4o5WJTAqlqXx9zT0oyOJMUAamO1mqe
         YZsbUEnNAaiY+e5a+NPTmtQbNvca2Ks9Unq8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970229; x=1771575029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Liwcje/Z9Lx3AK5pmnlgytbBGwQshpvm0q8FNBZl+uE=;
        b=PuEKPD2Xl1KK9KytYwxTG71LGc6RJZ4KacGdQyhRmVjDk/sQ1rbquIqKCKso5cn0FS
         oMisUCYSaNWAIAEwo2elcX/BH8K7lLcFdJgtB/h6xg9Vwwv/8ZyBv7qkHpvQMn4jxzHQ
         wneGlj3VRq5XAZ8siDBCHRM/dItPrI/R2HnJeWBk/O4beaT0vofVZuCxTSpS++MtMxQ4
         OYGr7dOzkwXw8irdYmnzI5FbEViVGybSOiR5R/KBEiA6938aHpGgOXdOAiMjWzOWHJcY
         k5o0VDR9EHPkhba8EVnELTF9usd8+ro49rZF1HpMT6BvW4wOwAAfrgQeS+IypQ15bz1M
         Femg==
X-Gm-Message-State: AOJu0YzU3n3kTTO2nb/DpeuC3j0vMjT4MgPsLlutUdhHeAyqWT+dnwN6
	EV917rmzsEecg5Gsk9Jxuaao4UWfkx1O1RcK5VRBFEebfWa/NMc6OpwdDqyd7rL5yaptTSpiZEr
	cgwVA
X-Gm-Gg: AZuq6aKN3JUkv59LEKxZXF/MArEGrOLxdTVnGuk1rUeAoUJyqi3OGMdi2Fp8HGiskhl
	6HYkgRXB6hO8YQ5RDRrFcNz7NHbs3tY3tS6QOqvrTkXJbu4zUc6xCvtSkoF/NTczjRoCQH1NK8E
	W71NX14EJNx+i9FtJD7aDCZpyLtcKnkMM0cTLdi+woDKkKfXckirCMKUfczupUxLqGYK/sCbW+X
	LAgAqyM/XLvUMyx6BAIfrzRPDOxKQHk9qWok2Pua+Z0xkScidjYuNKyt7YucPLH+R+2yAk28j/V
	DHV8PFaaKskSI+JdxacoZSer2ojKS52LSjOGYcboyvQQ8auS6uQEFEUq8JtDtfGrQlrNIq0C3Mm
	9XVSMQWwuKH5XAbhuaDAOHw7/0QMzTaHEPYZHqNH54bmCCFptqJGtlcjtUmgQSSN7XNGFxoGOsc
	TzxqYR28OXa3wYCDr0mar9uHe0ZSuyj22Y3wv+qAkYE+aTNLdsSpi+raNEWV7OVttkmU/GHMLBh
	8Qz3zhgH5ylUr4R/EIzcyZ/VFQ=
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48373a5d6d5mr12263485e9.23.1770970228891;
        Fri, 13 Feb 2026 00:10:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 17/19] go: upgrade 1.25.6 -> 1.25.7
Date: Fri, 13 Feb 2026 09:08:35 +0100
Message-ID: <5d4e9c0ef45a6ebfe2b9eb57ed654829068b520d.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231100

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.6..go1.25.7
eaf3bc799a (tag: go1.25.7) [release-branch.go1.25] go1.25.7
c7d189e65c [release-branch.go1.25] crypto/tls: document resumption behavior across Configs
4512014530 [release-branch.go1.25] crypto/tls: revalidate whole chain on resumption on Windows and macOS
d5987bff8a [release-branch.go1.25] crypto/tls: check verifiedChains roots when resuming sessions
c2d04c0994 [release-branch.go1.25] crypto/tls: add verifiedChains expiration checking during resumption
6b1110a40f [release-branch.go1.25] Revert "crypto/tls: don't copy auto-rotated session ticket keys in Config.Clone"
0765a9d624 [release-branch.go1.25] crypto/x509: fix single label excluded name constraints handling
b19100991a [release-branch.go1.25] cmd/go: remove user-content from doc strings in cgo ASTs.
738bc3a33c [release-branch.go1.25] cmd/compile: during regalloc, fixedreg values are always available

Fixes CVE-2025-61732 and CVE-2025-68121.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.6...go1.25.7
[2] https://groups.google.com/g/golang-announce/c/K09ubi9FQFk

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a5237b7ae557136eee9ff3f98e2b0a74f39ebb7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.25.6.inc => go-1.25.7.inc}   | 2 +-
 ...o-binary-native_1.25.6.bb => go-binary-native_1.25.7.bb} | 6 +++---
 ...cross-canadian_1.25.6.bb => go-cross-canadian_1.25.7.bb} | 0
 .../go/{go-cross_1.25.6.bb => go-cross_1.25.7.bb}           | 0
 .../go/{go-crosssdk_1.25.6.bb => go-crosssdk_1.25.7.bb}     | 0
 .../go/{go-runtime_1.25.6.bb => go-runtime_1.25.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.6.bb => go_1.25.7.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.6.inc => go-1.25.7.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.6.bb => go-binary-native_1.25.7.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.6.bb => go-cross-canadian_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.6.bb => go-cross_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.6.bb => go-crosssdk_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.6.bb => go-runtime_1.25.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.6.bb => go_1.25.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.6.inc b/meta/recipes-devtools/go/go-1.25.7.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.6.inc
rename to meta/recipes-devtools/go/go-1.25.7.inc
index 2c31c4a235d..ab58f712ef1 100644
--- a/meta/recipes-devtools/go/go-1.25.6.inc
+++ b/meta/recipes-devtools/go/go-1.25.7.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059"
+SRC_URI[main.sha256sum] = "178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.6.bb b/meta/recipes-devtools/go/go-binary-native_1.25.7.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.7.bb
index 6429bb385b5..19951344810 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a"
-SRC_URI[go_linux_arm64.sha256sum] = "738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5"
-SRC_URI[go_linux_ppc64le.sha256sum] = "bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73"
+SRC_URI[go_linux_amd64.sha256sum] = "12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005"
+SRC_URI[go_linux_arm64.sha256sum] = "ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129"
+SRC_URI[go_linux_ppc64le.sha256sum] = "42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.6.bb b/meta/recipes-devtools/go/go-cross_1.25.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.6.bb
rename to meta/recipes-devtools/go/go-cross_1.25.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.6.bb b/meta/recipes-devtools/go/go-runtime_1.25.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.7.bb
diff --git a/meta/recipes-devtools/go/go_1.25.6.bb b/meta/recipes-devtools/go/go_1.25.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.6.bb
rename to meta/recipes-devtools/go/go_1.25.7.bb

