Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB7C5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:42:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.16165.1672594970310984035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vtwycK/b;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so26307802pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=575qoAk72rtDnCXLmRci5B57QryLICRrBL/QrIR38DY=;
        b=vtwycK/bjgPiIBCB8pEwWMJEPokuYVF53MOaEmorQFW/CekRsSOn84XqHeYAG6sDU/
         vZW9BC4C/Y1bgqtYfYFpzUo/BcxnSeOBu3RY/OQ4UqM0p5f4LBfM3GX+Qn/0n8GRzHUF
         WTuW+Na3lD13RleNadU69cD0/CdMmo5KSOZ5+89K1GL4ABoabtFB5AamqqeUopp60kC2
         +RDmdNq6+XgetycyoaAJCwBeWokIM8j9YYYh11bwybPhXCqmhw0pOP6elrdkqMlVvP30
         LSQJaU2Zdv6osh95AklQRtE+HaLJrhSoAstHARHkb4fLImn5mb4B+qU1cxUYzWACJ10V
         OA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=575qoAk72rtDnCXLmRci5B57QryLICRrBL/QrIR38DY=;
        b=BSfZPKMUxXXND26bQl6BkCkvu4d8XXpdw8cFtyHeVDM8eYcuESniZCWPU+szINBERa
         Muc5d/v2yXcm6AKnFR7Je6zANzx6enWJRUx7JRHmBrhvgt+2mv3RTywSe4s4l/X+GUSm
         hAJzS2WE+3Wnm0rwV2VPkAGFdJ55tw0cH0DgLnMlOKAWnjdpjo6Aen7ro7xwOcrDeEo4
         1tRchsT1A78VAqs/fGG5KiXEiZR2c5ntRu9EyPyDDEnTnSNABQBld1Z9aqsRPeE8RMaJ
         x/pVBe/cg2KoHKHkNT5dZzQMttbzLJCtFuF6x5wyY8mQD084L4JE22aZkQOFtoR6lJaH
         QodQ==
X-Gm-Message-State: AFqh2kpiMpVyobh2WXf4jFd+Zfv2qFGwj729R3qeHvgX1OY0kb4i/5uD
	bNAURQNqvJ1bukazaMoX0q7MlGWVlgdWJ7kHk4M=
X-Google-Smtp-Source: AMrXdXvXoNEQhP7XwQgK2K5657CkjD5SRVH1fmmM1lcrLh1lyRldwUPjwfFERS7NW4M5f0skoXPyAQ==
X-Received: by 2002:a17:902:e9ca:b0:189:9519:87b6 with SMTP id 10-20020a170902e9ca00b00189951987b6mr40599160plk.5.1672594969317;
        Sun, 01 Jan 2023 09:42:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/18] go: fix CVE-2022-41717 Excessive memory use in got server
Date: Sun,  1 Jan 2023 07:42:18 -1000
Message-Id: <c3abf36e0d2f325e195f0734e060284df18b3697.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175220

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-41717.patch           | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b4a137b8c8..1d97001654 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -50,6 +50,7 @@ SRC_URI += "\
     file://CVE-2022-28131.patch \
     file://CVE-2022-28327.patch \
     file://CVE-2022-41715.patch \
+    file://CVE-2022-41717.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch
new file mode 100644
index 0000000000..8bf22ee4d4
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch
@@ -0,0 +1,75 @@
+From 618120c165669c00a1606505defea6ca755cdc27 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 30 Nov 2022 16:46:33 -0500
+Subject: [PATCH] [release-branch.go1.19] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+For #56350.
+For #57009.
+Fixes CVE-2022-41717.
+
+Change-Id: I5c6ce546add81f361dcf0d5123fa4eaaf8f0a03b
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1663835
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/455363
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Jenny Rakoczy <jenny@golang.org>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27]
+CVE-2022-41717
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/net/http/h2_bundle.go | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 83f2a72..cc03a62 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4096,6 +4096,7 @@ type http2serverConn struct {
+	headerTableSize             uint32
+	peerMaxHeaderListSize       uint32            // zero means unknown (default)
+	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
++	canonHeaderKeysSize         int               // canonHeader keys size in bytes
+	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
+	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
+	needsFrameFlush             bool              // last frame write wasn't a flush
+@@ -4278,6 +4279,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
+	}
+ }
+
++// maxCachedCanonicalHeadersKeysSize is an arbitrarily-chosen limit on the size
++// of the entries in the canonHeader cache.
++// This should be larger than the size of unique, uncommon header keys likely to
++// be sent by the peer, while not so high as to permit unreasonable memory usage
++// if the peer sends an unbounded number of unique header keys.
++const http2maxCachedCanonicalHeadersKeysSize = 2048
++
+ func (sc *http2serverConn) canonicalHeader(v string) string {
+	sc.serveG.check()
+	http2buildCommonHeaderMapsOnce()
+@@ -4293,14 +4301,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
+		sc.canonHeader = make(map[string]string)
+	}
+	cv = CanonicalHeaderKey(v)
+-	// maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
+-	// entries in the canonHeader cache. This should be larger than the number
+-	// of unique, uncommon header keys likely to be sent by the peer, while not
+-	// so high as to permit unreaasonable memory usage if the peer sends an unbounded
+-	// number of unique header keys.
+-	const maxCachedCanonicalHeaders = 32
+-	if len(sc.canonHeader) < maxCachedCanonicalHeaders {
++	size := 100 + len(v)*2 // 100 bytes of map overhead + key + value
++	if sc.canonHeaderKeysSize+size <= http2maxCachedCanonicalHeadersKeysSize {
+		sc.canonHeader[v] = cv
++		sc.canonHeaderKeysSize += size
+	}
+	return cv
+ }
+--
+2.30.2
-- 
2.25.1


