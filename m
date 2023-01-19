Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AB9C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 07:04:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.40147.1674111860774443955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 23:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SgoTYIyj;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d3so1464990plr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 23:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnAyfZ+EjUwlRjxyPje9gi1/H8rZkRopVIaEdB9uNN8=;
        b=SgoTYIyjjr4W6gHVsXBS1oweJ9ZWaeD/PPVlwusR4Hf4IGV5cysyQIKSG6JA/Y+q1r
         2w8Bv69ojXR5OH9hh8Q647I0CfKZydy2gTsYtfloDnNDz1kYNBedDOss3SmfbEzGNUAw
         EH/1XppRlLyCfvM48UBRhHrty7pTbEQBXzOCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnAyfZ+EjUwlRjxyPje9gi1/H8rZkRopVIaEdB9uNN8=;
        b=DZOpbysTu2coI0xin66mc58RnX5snd9cSGkZh28LtSeq86cbOxh8CKLOyA5bJ0s1+r
         iFcRi0ctpgJ+DhOGTjuWMrf9KdhCOFPucZvCDmvS6KMVUh2BJ11+whMhkXK5r6TyLpJp
         wubEf0ygbrckFJZ3TgyRqZD+LSEt4V9/OoqNuq/KroVTke0NvSpA/e1nTNhTrkQTRwqI
         gGF511SfX5L3AXHrhUhlAtkduuocL9J5U8NSz+gkqX+uZGmcGUwgHZBHzSuT4M3/7/Eu
         Qc2UPUN/MEfRlmD/y910s2w0iK5skBbFe8PQiFbjy8Ore/hIzmUavcN/q6DSL89ieyHT
         FKIA==
X-Gm-Message-State: AFqh2kpk+WY4cRpOrkmVVUrWCNcGqJB0zv6/7HHRztT26B7QmdTfjRpE
	mtEEWMgIxPO87LqQXKeRGx/hWw6Ja0uJW58q
X-Google-Smtp-Source: AMrXdXtMxhyT2rp73yH/UNy+EPDmGspoNN9JCcGR76d5I2ywFxOMt9+QNTL/nktIvMR8Tzcirjlkog==
X-Received: by 2002:a17:90a:be0c:b0:229:d04:ed2 with SMTP id a12-20020a17090abe0c00b002290d040ed2mr9998121pjs.26.1674111859815;
        Wed, 18 Jan 2023 23:04:19 -0800 (PST)
Received: from MVIN00024 ([150.129.170.183])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090a2ac700b00219025945dcsm2384563pjg.19.2023.01.18.23.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 23:04:19 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 19 Jan 2023 12:34:13 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH v2] go: fix CVE-2022-41717 Excessive memory use in got server
Date: Thu, 19 Jan 2023 12:34:12 +0530
Message-Id: <20230119070412.56744-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 07:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176123

Upstream-Status: Backport from https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2022-41717.patch           | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index a1942e9f15..99662bd298 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://CVE-2022-27664.patch \
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
     file://CVE-2022-41715.patch \
+    file://CVE-2022-41717.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
new file mode 100644
index 0000000000..e2ab92ed00
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
@@ -0,0 +1,89 @@
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
+CVE: CVE-2022-41717
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  1 +
+ src/net/http/h2_bundle.go                | 18 +++++++++++-------
+ 2 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 3306e29..d48d43f 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
+ 
+ 	goBin := testenv.GoToolPath(t)
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 6e2ef30..9d6abd8 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4189,6 +4189,7 @@ type http2serverConn struct {
+ 	headerTableSize             uint32
+ 	peerMaxHeaderListSize       uint32            // zero means unknown (default)
+ 	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
++	canonHeaderKeysSize         int               // canonHeader keys size in bytes
+ 	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
+ 	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
+ 	needsFrameFlush             bool              // last frame write wasn't a flush
+@@ -4368,6 +4369,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
+ 	}
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
+ 	sc.serveG.check()
+ 	http2buildCommonHeaderMapsOnce()
+@@ -4383,14 +4391,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
+ 		sc.canonHeader = make(map[string]string)
+ 	}
+ 	cv = CanonicalHeaderKey(v)
+-	// maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
+-	// entries in the canonHeader cache. This should be larger than the number
+-	// of unique, uncommon header keys likely to be sent by the peer, while not
+-	// so high as to permit unreaasonable memory usage if the peer sends an unbounded
+-	// number of unique header keys.
+-	const maxCachedCanonicalHeaders = 32
+-	if len(sc.canonHeader) < maxCachedCanonicalHeaders {
++	size := 100 + len(v)*2 // 100 bytes of map overhead + key + value
++	if sc.canonHeaderKeysSize+size <= http2maxCachedCanonicalHeadersKeysSize {
+ 		sc.canonHeader[v] = cv
++		sc.canonHeaderKeysSize += size
+ 	}
+ 	return cv
+ }
+-- 
+2.25.1
+
-- 
2.25.1


