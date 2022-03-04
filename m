Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07612C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:04:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.7840.1646406292770788095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x5IgWclN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso10817902pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wdxGlIgnJGiz3lGKvCaGxmrdBY7AVdGMNueth6HAC1E=;
        b=x5IgWclNSh8Y59a/tRX/OPLT5Lsxwuq/tDCrBgwZV11LBD8X7PYOdWP4jRYfkitdjm
         U9qTrXks+prmQk4gD2QxUA7g/3G6LClDYV5thYal5t+1Yg2pqRm2eUakztFb/4V+5RAL
         OF/mDPR8+McXTQoN46p9yDe8+ILPx23/5zwzeLEwjGByGbX97Z63+yPpup+JboFC1uGC
         MkpsgoCoe3r2YolEutGCugndFzRKwaK6mX9z+fw3Av0+QwDeti/pK6BBQx1R26vI82Cv
         G6Avj2lcVdC5OS8BWmxgvbyQEt9zQh/Igroey0ng8oqhHq/b/4s5WS58C+DNA8ktpAHc
         oJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wdxGlIgnJGiz3lGKvCaGxmrdBY7AVdGMNueth6HAC1E=;
        b=fjuK+4S7XcS3UhZkE3fLHnM7Lo97BFtgyv/jbka/ZoKIoLriA6ZNbL3+W6KeSBztBd
         TIagM+nhSa4I15qFoNeDtXveUuVjVloQ/DHRAS7FpGWnclm/H6H1OIXnVcxYRG2/PSyi
         trwN+HC6CFJOvG4Zd7LjCGyCx51/5d9YzyITzaRaCSXQQAYjhwJBFakfCVGuHg4FyrOw
         ZxuGeaz+eCvNw/eJMPDDFdnSaqvvuHYlt6akJ+w+hyPEbdY7f+JhC37U6EhLMm2NoM/h
         u0iRiZoUJtIHdQ+VXWri+Q+vPEBwhWj1jZijxQds6kOl8yy+bUOXHeezF2OOHMugSLqS
         M3dg==
X-Gm-Message-State: AOAM530dKo1MSfFELbyi0XlDwzdVWFn5osjYbGFd5ZOcCf9xEwhu2mJW
	3wFja8eG/2jNRTGQEkUF+va38xF89SQF4aDVUd0=
X-Google-Smtp-Source: 
 ABdhPJz4IUzjbG7j20IUBN9lXdM3J275IDFvYejkOL9TLmAsxfPS3AbYBL2gfXDXSM2V1/WZuqu4Dg==
X-Received: by 2002:a17:90a:4146:b0:1bf:2dc8:7407 with SMTP id
 m6-20020a17090a414600b001bf2dc87407mr2201300pjg.76.1646406291731;
        Fri, 04 Mar 2022 07:04:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:04:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] go: fix CVE-2022-23772
Date: Fri,  4 Mar 2022 05:04:11 -1000
Message-Id: 
 <e4d15040f62744265b9236ad7276f3371a9172da.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162722

From: Minjae Kim <flowergom@gmail.com>

math/big: prevent large memory consumption in Rat.SetString

An attacker can cause unbounded memory growth in a program using (*Rat).SetString
due to an unhandled overflow.

Upstream-Status: Backport [https://go.dev/issue/50699]
CVE: CVE-2022-23772
Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-23772.patch           | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index fcb316e09e..9b3c3b30a8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://CVE-2021-33196.patch \
     file://CVE-2021-33197.patch \
     file://CVE-2022-23806.patch \
+    file://CVE-2022-23772.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
new file mode 100644
index 0000000000..f0daee3624
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
@@ -0,0 +1,50 @@
+From 70882eedccac803ddcf1c3215e0ae8fd59847e39 Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Sat, 26 Feb 2022 20:03:38 +0000
+Subject: [PATCH] [release-branch.go1.16] math/big: prevent overflow in
+ (*Rat).SetString
+
+Credit to rsc@ for the original patch.
+
+Thanks to the OSS-Fuzz project for discovering this
+issue and to Emmanuel Odeke (@odeke_et) for reporting it.
+
+Updates #50699
+Fixes #50700
+Fixes CVE-2022-23772
+---
+ src/math/big/ratconv.go      | 5 +++++
+ src/math/big/ratconv_test.go | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/math/big/ratconv.go b/src/math/big/ratconv.go
+index 941139e..e8cbdbe 100644
+--- a/src/math/big/ratconv.go
++++ b/src/math/big/ratconv.go
+@@ -168,6 +168,11 @@ func (z *Rat) SetString(s string) (*Rat, bool) {
+ 		n := exp5
+ 		if n < 0 {
+ 			n = -n
++			if n < 0 {
++				// This can occur if -n overflows. -(-1 << 63) would become
++				// -1 << 63, which is still negative.
++				return nil, false
++			}
+ 		}
+ 		pow5 := z.b.abs.expNN(natFive, nat(nil).setWord(Word(n)), nil) // use underlying array of z.b.abs
+ 		if exp5 > 0 {
+diff --git a/src/math/big/ratconv_test.go b/src/math/big/ratconv_test.go
+index ba0d1ba..b820df4 100644
+--- a/src/math/big/ratconv_test.go
++++ b/src/math/big/ratconv_test.go
+@@ -104,6 +104,7 @@ var setStringTests = []StringTest{
+ 	{in: "4/3/"},
+ 	{in: "4/3."},
+ 	{in: "4/"},
++	{in: "13e-9223372036854775808"}, // CVE-2022-23772
+ 
+ 	// valid
+ 	{"0", "0", true},
+-- 
+2.17.1
+
-- 
2.25.1


