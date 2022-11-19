Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35553C4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:18 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.26045.1668880093860375860
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vmx1qhIZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so10967918pjs.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5H81qHlpR+SEZl+598nIoGHVm4h6wLbCvol3yVrGWM=;
        b=Vmx1qhIZMg46x9XlDEeFJmaKipTl8Enjq9xVIEWQW2xOjEV4wfgKR4lud5tMdG6IBP
         NyBiCCBaxoEHlOgyYTEJqQTZpg6+OUL8bk4ox8nHnqDieWOA+lSyLwnb1oYk/wvayZ1T
         6y60yDI3Bts1Vm8rUHEhqCKbT/3NVBooXwqIXoApIe5RwKmSr2ipT3FVDBalL4OelMop
         tIVZ+Be6xWQPIX9jJQATGYc89p5gxan1f+1kWs6JQgJ0OXfnuj4dWBDvGBj3rhGXzgQX
         65TGFpNLD8uOtIllEt6KwHzY8vLrweFNpCDbEaLIiwNFKhLahZe1gcss0wIF9Z6321l8
         J3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5H81qHlpR+SEZl+598nIoGHVm4h6wLbCvol3yVrGWM=;
        b=DjwLB9kZRsdPL0acstxC5fQdX2MDu/NN9y3Z4Lk/D8x8gMDsFFgM9oOV9tiXR4YJWn
         qFmSBZ8NwYqT+fxvdnmiQ/CHYqS/I8bMlOTld9hsOLrkxXC6VQh2qJH32D8gidZVtPtB
         LaArgHpPVvZdNGEmHE2lJSsEsyT2Pbr9kyDjdBq6F6ughy8qeGj2CoQ6JQvGLQuaepZr
         sD+F4N8ENe/L0JqjHJlLnSAsTA1KOODBnFQYbWBg78NCMIJEFCNvMRs0yIXBbt9yv20L
         9xHjE9mrxUyTixk5eZDffHxt9ZUebR6iwFSnHHCOSDOGY28CvJ//RkuVAS/Qf9SYYfjl
         kPpw==
X-Gm-Message-State: ANoB5pnX5eGSMHVq7/ckQt365lcdT7V00fVT36fJPhDvsMzDbU1pp+OH
	tQJMjLMUYUDqUbxXdUnnvWCh4T/1lDSrw57cXUE=
X-Google-Smtp-Source: AA0mqf7Cs9JBU/qrz32RonT7jxdBrpKq3vP+RpdiVsKmbidMzx1UqKxPl2ZrlKcvDYbQqu9/bSnx8g==
X-Received: by 2002:a17:902:a503:b0:188:6baf:2011 with SMTP id s3-20020a170902a50300b001886baf2011mr1250051plq.165.1668880092843;
        Sat, 19 Nov 2022 09:48:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/21] golang: fix CVE-2021-44716
Date: Sat, 19 Nov 2022 07:47:37 -1000
Message-Id: <154e1857b8800e3b01c42c3f2313c985e2867f96.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173527

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/d0aebe3e74fe14799f97ddd3f01129697c6a290a]
CVE: CVE-2021-44716
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-44716.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ae2c4746f4..73b981db2b 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -45,6 +45,7 @@ SRC_URI += "\
     file://CVE-2022-2879.patch \
     file://CVE-2021-33195.patch \
     file://CVE-2021-33198.patch \
+    file://CVE-2021-44716.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch
new file mode 100644
index 0000000000..9c4fee2db4
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch
@@ -0,0 +1,93 @@
+From 9f1860075990e7bf908ca7cc329d1d3ef91741c8 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Thu, 9 Dec 2021 06:13:31 -0500
+Subject: [PATCH] net/http: update bundled golang.org/x/net/http2
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d0aebe3e74fe14799f97ddd3f01129697c6a290a]
+CVE: CVE-2021-44716
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+
+Pull in security fix
+
+    a5309b3 http2: cap the size of the server's canonical header cache
+
+Updates #50058
+Fixes CVE-2021-44716
+
+Change-Id: Ifdd13f97fce168de5fb4b2e74ef2060d059800b9
+Reviewed-on: https://go-review.googlesource.com/c/go/+/370575
+Trust: Filippo Valsorda <filippo@golang.org>
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Alex Rakoczy <alex@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+(cherry picked from commit d0aebe3e74fe14799f97ddd3f01129697c6a290a)
+---
+ src/go.mod                |  2 +-
+ src/go.sum                |  4 ++--
+ src/net/http/h2_bundle.go | 10 +++++++++-
+ src/vendor/modules.txt    |  2 +-
+ 4 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/go.mod b/src/go.mod
+index ec6bd98..56f2fbb 100644
+--- a/src/go.mod
++++ b/src/go.mod
+@@ -4,7 +4,7 @@ go 1.14
+ 
+ require (
+ 	golang.org/x/crypto v0.0.0-20200128174031-69ecbb4d6d5d
+-	golang.org/x/net v0.0.0-20210129194117-4acb7895a057
++	golang.org/x/net v0.0.0-20211209100217-a5309b321dca
+ 	golang.org/x/sys v0.0.0-20200201011859-915c9c3d4ccf // indirect
+ 	golang.org/x/text v0.3.3-0.20191031172631-4b67af870c6f // indirect
+ )
+diff --git a/src/go.sum b/src/go.sum
+index 171e083..1ceba05 100644
+--- a/src/go.sum
++++ b/src/go.sum
+@@ -2,8 +2,8 @@ golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod h1:djNgcEr1/C05ACk
+ golang.org/x/crypto v0.0.0-20200128174031-69ecbb4d6d5d h1:9FCpayM9Egr1baVnV1SX0H87m+XB0B8S0hAMi99X/3U=
+ golang.org/x/crypto v0.0.0-20200128174031-69ecbb4d6d5d/go.mod h1:LzIPMQfyMNhhGPhUkYOs5KpL4U8rLKemX1yGLhDgUto=
+ golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod h1:t9HGtf8HONx5eT2rtn7q6eTqICYqUVnKs3thJo3Qplg=
+-golang.org/x/net v0.0.0-20210129194117-4acb7895a057 h1:HThQeV5c0Ab/Puir+q6mC97b7+3dfZdsLWMLoBrzo68=
+-golang.org/x/net v0.0.0-20210129194117-4acb7895a057/go.mod h1:z5CRVTTTmAJ677TzLLGU+0bjPO0LkuOLi4/5GtJWs/s=
++golang.org/x/net v0.0.0-20211209100217-a5309b321dca h1:UmeWAm8AwB6NA/e4FSaGlK1EKTLXKX3utx4Si+6kfPg=
++golang.org/x/net v0.0.0-20211209100217-a5309b321dca/go.mod h1:m0MpNAwzfU5UDzcl9v0D8zg8gWTRqZa9RBIspLL5mdg=
+ golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+ golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
+ golang.org/x/sys v0.0.0-20200201011859-915c9c3d4ccf h1:+4j7oujXP478CVb/AFvHJmVX5+Pczx2NGts5yirA0oY=
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 702fd5a..83f2a72 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4293,7 +4293,15 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
+ 		sc.canonHeader = make(map[string]string)
+ 	}
+ 	cv = CanonicalHeaderKey(v)
+-	sc.canonHeader[v] = cv
++	// maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
++	// entries in the canonHeader cache. This should be larger than the number
++	// of unique, uncommon header keys likely to be sent by the peer, while not
++	// so high as to permit unreaasonable memory usage if the peer sends an unbounded
++	// number of unique header keys.
++	const maxCachedCanonicalHeaders = 32
++	if len(sc.canonHeader) < maxCachedCanonicalHeaders {
++		sc.canonHeader[v] = cv
++	}
+ 	return cv
+ }
+ 
+diff --git a/src/vendor/modules.txt b/src/vendor/modules.txt
+index 669bd9b..1d67183 100644
+--- a/src/vendor/modules.txt
++++ b/src/vendor/modules.txt
+@@ -8,7 +8,7 @@ golang.org/x/crypto/curve25519
+ golang.org/x/crypto/hkdf
+ golang.org/x/crypto/internal/subtle
+ golang.org/x/crypto/poly1305
+-# golang.org/x/net v0.0.0-20210129194117-4acb7895a057
++# golang.org/x/net v0.0.0-20211209100217-a5309b321dca
+ ## explicit
+ golang.org/x/net/dns/dnsmessage
+ golang.org/x/net/http/httpguts
-- 
2.25.1


