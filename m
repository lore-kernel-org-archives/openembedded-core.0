Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5606C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 04:22:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.5067.1713414138188149116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 21:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=G35lidhm;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so496191b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 21:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1713414137; x=1714018937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spSoDJS5AYfoLX2zfxL5s0MW1lO/gcZ1EVpRqpfEgdw=;
        b=G35lidhmXOSn3zCRWw+Mu0erUMBO6WB8FpSPMowOAQD+F/Pc3A9etWRGLimz/MKJI1
         apdvpB2y+MAQXR5m9TH+8ihedHkJ6g4YKWTY98jzLnRaXvrW3N1ZvgrzBciTQAb4Wj6v
         dl/TXwAJKkw0cZd7b6bWAdLSUpqfk/Cd0XtfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713414137; x=1714018937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spSoDJS5AYfoLX2zfxL5s0MW1lO/gcZ1EVpRqpfEgdw=;
        b=c9BY1ZbZEVGhDanlqMXGjoFBnE23LJHayQqr7BZAzHK4NsLxhfkmpHSvDpk4qRcLaN
         Zk/J1SX9DQm4MqznvMr35191YQwYgeBXcsjOTw1wW9r5SQFir0P29RnSbJ4REXQTqGLc
         Gv1j2roG8QiovD+/OBoyN3F1JfNXIQ37ifyMVmOwYo45xyyLhGaQdexT/LaM+k4hvbZX
         wQdk7F2QFsBVywPeOWpbX95rnUEI8G6iZC/KVWxqFmFKvxDT8kuzb5j2OZhMHt6pn0Ll
         YHY4mFRMtk3Jgef1H1GTxebVjHRtthW85r7l5DBWj3EG+CDdE3dbX2C04M3rvsxXWVmN
         5pBg==
X-Gm-Message-State: AOJu0YytTvmnB8lTjHGFNH0YCwgRqKOSKq2Uk8ipPavyTSWwKA6WyRhW
	Hq4QsnLEp7K0EBf6ECVQAORIDOeA6nULYTaZ3CFQzfSQ8o0LveW3ryfyALwoWav7m+vUuPBNtaW
	cZeA=
X-Google-Smtp-Source: AGHT+IFp0g11/+5SVMN8ETThGIP2Qk6alfyCd+as3UpVY13R4iOvIHEKLpBvb3nrJKMwzGEHBhXgWA==
X-Received: by 2002:a05:6a00:3a0c:b0:6ed:d164:3433 with SMTP id fj12-20020a056a003a0c00b006edd1643433mr2150726pfb.14.1713414136589;
        Wed, 17 Apr 2024 21:22:16 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:710d:e2e4:6a53:c4ce:6f08])
        by smtp.gmail.com with ESMTPSA id j14-20020a62e90e000000b006edec30bbc2sm500961pfh.49.2024.04.17.21.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 21:22:15 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: Fix for CVE-2023-45288
Date: Thu, 18 Apr 2024 09:52:01 +0530
Message-Id: <20240418042201.152935-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198495

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-45288.patch           | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 768961de2c..95fb572362 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2023-45290.patch \
     file://CVE-2024-24784.patch \
     file://CVE-2024-24785.patch \
+    file://CVE-2023-45288.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch
new file mode 100644
index 0000000000..741e7be89a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch
@@ -0,0 +1,95 @@
+From e55d7cf8435ba4e58d4a5694e63b391821d4ee9b Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 28 Mar 2024 16:57:51 -0700
+Subject: [PATCH] [release-branch.go1.22] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+Fixes CVE-2023-45288
+For #65051
+Fixes #66298
+
+Change-Id: I5bbf774ebe7651e4bb7e55139d3794bd2b8e8fa8
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2197227
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/576076
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9b]
+CVE: CVE-2023-45288
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  1 +
+ src/net/http/h2_bundle.go                | 31 ++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index d48d43f..250bde4 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#65051): 1.22.2 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
+ 
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 9d6abd8..10ff193 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -2842,6 +2842,7 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+ 		if size > remainSize {
+ 			hdec.SetEmitEnabled(false)
+ 			mh.Truncated = true
++			remainSize = 0
+ 			return
+ 		}
+ 		remainSize -= size
+@@ -2854,6 +2855,36 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+ 	var hc http2headersOrContinuation = hf
+ 	for {
+ 		frag := hc.HeaderBlockFragment()
++
++		// Avoid parsing large amounts of headers that we will then discard.
++		// If the sender exceeds the max header list size by too much,
++		// skip parsing the fragment and close the connection.
++		//
++		// "Too much" is either any CONTINUATION frame after we've already
++		// exceeded the max header list size (in which case remainSize is 0),
++		// or a frame whose encoded size is more than twice the remaining
++		// header list bytes we're willing to accept.
++		if int64(len(frag)) > int64(2*remainSize) {
++			if http2VerboseLogs {
++				log.Printf("http2: header list too large")
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
++		// Also close the connection after any CONTINUATION frame following an
++		// invalid header, since we stop tracking the size of the headers after
++		// an invalid one.
++		if invalid != nil {
++			if http2VerboseLogs {
++				log.Printf("http2: invalid header: %v", invalid)
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
+ 		if _, err := hdec.Write(frag); err != nil {
+ 			return nil, http2ConnectionError(http2ErrCodeCompression)
+ 		}
+-- 
+2.25.1
+
-- 
2.25.1


