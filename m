Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467A6CD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71827.1781274412055020920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zYNoZiZa;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1388195f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274410; x=1781879210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jDlfinNwsUs/H21qX+ht4dsLL0Enh2f1WxdyRrdygM=;
        b=zYNoZiZa0/mUPCgNZu/LoYgX70JnXoyr9+l9+PNrYra23kk2Vp4g5FNUDlImI44li+
         r0+fEbTY0z0ywdnGpS5vX8NuS/cKgsKx9kBKNwPv8xZMSrNUeWJvw9+r7PLOi2y9wntT
         IY1QUaQcCcIznYh97dLkLAcyIvtP7POrZkuWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274410; x=1781879210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jDlfinNwsUs/H21qX+ht4dsLL0Enh2f1WxdyRrdygM=;
        b=biuyN2pRNdIkJ+sDH9xhRNW0BP0082+MkdInWx/BdAhH6qsRbj/iXokWnMj79IlgYC
         BnLItT0Gf3CYC0ktzw0K7+F0BH5em61N41XPqFAsxDW1tXXBYB6k/WGQMsy5rhhR52PU
         7hqZyO8j/dR+OMuyEstNMbYhqOfraRjGVeN6uvVPIdG0xA7bJ/qhXmrZgnouKZgqqSeu
         pBpT6XdDRbQWDoqrAPbEOHHDo68ymmzPJVuwwKb3MT9KxZOyUkY6VH1u8NKL19SOAWhJ
         q3/tDJNo/VsdlXNzijuoO2gWc2s7Yadok7xlBFLmCfR8AvZzvO2LfGF+B9v934QU+5p8
         CuPA==
X-Gm-Message-State: AOJu0YwZyX0UmTLZecZ9HCas1e2uS9zt/n6hTp/HfOh/zVDOexjNpdz5
	lPgz7URkWePPk3QupWiUYDSS7SY2YEvF7PkjtB4DT1asE4aDxxI3NUGNiMoJhay0oVMYK4KaaqP
	eCsdtJw==
X-Gm-Gg: Acq92OGLyyRUJmbhvk6ZFZwPaldCdAA11cX7VI5vRKMs3W/ZFFOGrq3A+blZrNTXZ4P
	uKgs1Dd7svQS0PgPW0jQzNfB2J2QMA7pHjlMTES2POi9C5j9S0uAI9WRCRqU2FzARhwiqR6Wunk
	wtiee6/a4rx/QEzlZWbPjorjjr7zmT2Y895wqk96A/IwVtNa1cFd/n60Jh40lAuVgI7t3F7ua+I
	SQ9PB9cU+wsf2cEnbEaechFxSk/TijAVgiJVhYViAkwJXumRGJqwP/G3SFJ3oJXfWnjlVwRN/UR
	CzvYDtyZ1Ack/AxB687FbuqGLlcS1XgO1YIBl6VBJz/dimnfocboBMHI6WpyTSRKTiVBQSvhR9P
	wjndplVrIr7yiutJG0MDTkYYrUpdTeECltOrS2BXnBA9XUE3ZPEjnfQ1fMvkVo+hj7/8xz9/93m
	Y04ex2N0xIcRjK5Ob7v5Bcwpc=
X-Received: by 2002:a5d:64e4:0:b0:45e:f387:77a0 with SMTP id ffacd0b85a97d-4606d143d7cmr4617744f8f.31.1781274410180;
        Fri, 12 Jun 2026 07:26:50 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:49 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 18/21] go: patch CVE-2026-42501
Date: Fri, 12 Jun 2026 16:26:08 +0200
Message-ID: <679a95d6aaaef526ca2905a8cbf4a16aff600d7b.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238640

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/775321

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-42501.patch                | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42501.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 85f75f0d89..03a1a81fc3 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -52,6 +52,7 @@ SRC_URI += "\
     file://CVE-2026-39825.patch \
     file://CVE-2026-39826.patch \
     file://CVE-2026-42499.patch \
+    file://CVE-2026-42501.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42501.patch b/meta/recipes-devtools/go/go/CVE-2026-42501.patch
new file mode 100644
index 0000000000..82b2fa02a1
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42501.patch
@@ -0,0 +1,127 @@
+From 52d8958ce7e102a5ebd3b4748aa03989b5469084 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 30 Apr 2026 13:10:49 -0700
+Subject: [PATCH] cmd/go: reject sumdb response lacking module hash
+
+Report an error when a sumdb /lookup/ request does not
+include a hash for the requested module, rather than
+silently proceeding.
+
+Previously, we would verify that a returned sum matched
+the expected module hash, but did not verify that the
+response contained a sum. This permits a malicous
+proxy to serve a corrupted module along with a
+valid-but-irrelevant sumdb response for some other
+module. We now ensure that the sumdb response contains
+a valid hash for the module we are validating.
+
+Thanks to Mundur (https://github.com/M0nd0R) for reporting this issue.
+
+Fixes CVE-2026-42501
+Fixes #79070
+
+Change-Id: I7d9a367deb237aa70cade2434495998f6a6a6964
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/4340
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/775321
+Reviewed-by: Michael Pratt <mpratt@google.com>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-42501
+Upstream-Status: Backport [https://github.com/golang/go/commit/1a9af07120312d368815712a4dce2dd2070342e5]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/cmd/go/internal/modfetch/fetch.go         | 15 ++++++++++++++-
+ src/cmd/go/proxy_test.go                      | 17 +++++++++++++++++
+ src/cmd/go/testdata/script/mod_sum_absent.txt | 17 +++++++++++++++++
+ 3 files changed, 48 insertions(+), 1 deletion(-)
+ create mode 100644 src/cmd/go/testdata/script/mod_sum_absent.txt
+
+diff --git a/src/cmd/go/internal/modfetch/fetch.go b/src/cmd/go/internal/modfetch/fetch.go
+index eeab6da62a..75769d7c61 100644
+--- a/src/cmd/go/internal/modfetch/fetch.go
++++ b/src/cmd/go/internal/modfetch/fetch.go
+@@ -740,7 +740,7 @@ func checkSumDB(mod module.Version, h string) error {
+ 			return module.VersionError(modWithoutSuffix, fmt.Errorf("verifying %s: checksum mismatch\n\tdownloaded: %v\n\t%s: %v"+sumdbMismatch, noun, h, db, line[len(prefix)-len("h1:"):]))
+ 		}
+ 	}
+-	return nil
++	return module.VersionError(modWithoutSuffix, fmt.Errorf("verifying %s: checksum missing from sumdb response"+sumdbAbsent, noun))
+ }
+ 
+ // Sum returns the checksum for the downloaded copy of the given module,
+@@ -931,6 +931,19 @@ have intercepted the download attempt.
+ For more information, see 'go help module-auth'.
+ `
+ 
++const sumdbAbsent = `
++
++SECURITY ERROR
++This download does NOT match one reported by the checksum server.
++The checksum server has provided checksums, but the checksums do
++not contain an entry for the download.
++The checksum server may be malfunctioning, or an attacker may have
++intercepted the checksum request.
++The download cannot be verified.
++
++For more information, see 'go help module-auth'.
++`
++
+ const hashVersionMismatch = `
+ 
+ SECURITY WARNING
+diff --git a/src/cmd/go/proxy_test.go b/src/cmd/go/proxy_test.go
+index cb3d9f92f1..88e5052b89 100644
+--- a/src/cmd/go/proxy_test.go
++++ b/src/cmd/go/proxy_test.go
+@@ -172,6 +172,23 @@ func proxyHandler(w http.ResponseWriter, r *http.Request) {
+ 		return
+ 	}
+ 
++	// Request for $GOPROXY/sumdb-redirect/module@version:/lookup/...
++	// performs a lookup for module@version rather than the requested module.
++	if strings.HasPrefix(path, "sumdb-redirect/") {
++		redirect, rest, ok := strings.Cut(path[len("sumdb-redirect"):], ":")
++		if !ok {
++			w.WriteHeader(500)
++			return
++		}
++		if strings.HasPrefix(rest, "/lookup/") {
++			r.URL.Path = "/lookup" + redirect
++		} else {
++			r.URL.Path = rest
++		}
++		sumdbServer.ServeHTTP(w, r)
++		return
++	}
++
+ 	// Request for $GOPROXY/redirect/<count>/... goes to redirects.
+ 	if strings.HasPrefix(path, "redirect/") {
+ 		path = path[len("redirect/"):]
+diff --git a/src/cmd/go/testdata/script/mod_sum_absent.txt b/src/cmd/go/testdata/script/mod_sum_absent.txt
+new file mode 100644
+index 0000000000..c2dd814542
+--- /dev/null
++++ b/src/cmd/go/testdata/script/mod_sum_absent.txt
+@@ -0,0 +1,17 @@
++# When the sumdb returns a response which does not
++# include a sum for the requested module,
++# we should report an error.
++# Verifies CVE-2026-42501.
++env sumdb=$GOSUMDB
++env proxy=$GOPROXY
++env GOPROXY GONOPROXY GOSUMDB GONOSUMDB
++
++# /sumdb-redirect/ causes the sumdb to return /lookup/ responses
++# for rsc.io/quote@v1.0.0, not for the requested module.
++env GOSUMDB=$sumdb' '$proxy/sumdb-redirect/rsc.io/quote@v1.0.0:
++
++! go get rsc.io/fortune@v1.0.0
++stderr 'SECURITY ERROR'
++! grep rsc.io go.sum
++-- go.mod --
++module m
+-- 
+2.43.0
+
-- 
2.53.0


