Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A6AC4167E
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.1036.1668704108059738981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CtzOn7NF;
 spf=pass (domain: linaro.org, ip: 209.85.160.173, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f173.google.com with SMTP id h21so1465990qtu.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9PhAPo1Kd15XnHTO5hsldPf4wTIkbUnJs9tMnLUk2I=;
        b=CtzOn7NF053KQAMJlI0Gv4S3sx9IcvGzUITcwI5iOLgU9EUNEogfk+L2lgePBI9ZSH
         kiIlAKl2b1PIZbnz3rJREJiiidvHu6Z3OzPC7YoZIPNzDcNxFGFKNDCCxiJepaNr93p1
         +yCTws4h++birxSMMQdhbTPuOzEftG+bDa0X9GCbT2uiswDU9CPtaPSSwAIo7w6O/bDJ
         ibTctii/L6HxteGaK1MoovsGAK9KxPiHDmANgK1SapxU/Or8YBRIP/chtesFeCZiFini
         las6AMC5OY7N6ZYXabb5rjXdrIqQ/TkGHhCj0srz+Kd3cjvou62P5ylMAQbxh/RjTkI8
         coaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9PhAPo1Kd15XnHTO5hsldPf4wTIkbUnJs9tMnLUk2I=;
        b=C5G4RMHC+d2KLDv4FXtRhhQyQ6wggnt8D19acuZyASMTDV51UbyYNHqOfHYeZ4M42+
         EQpNUwDziP4EtkehchDLYu66zBQ+F2BFwS1vjswg4ts5/riSrEawxsUZTTnmEcnqgx8K
         5AsGcXldtw+AXbat+9oG56o5HqpOC1UA1HA3YFTnPolNFZaucZjyhKeeDev+1tMhk73Y
         p7xNZWv3qNQsqAJKLXDqGf1Y55NjmF8FPztsdAyF6eorJ3ddrCkzQmxyNXdWlvkVPrqi
         TKC3WELKfrdfz9S75gCJSypKw/AQvF9xoL99r22lC2lhKzXHlMzMMamRj+5szZi6mytZ
         pBQg==
X-Gm-Message-State: ANoB5plnYbNqBHJe/dPzl0tJAq2qBOU5Q/j54HQUxGyS+fQjEdnu1Z64
	Rp+dbqRwXcb7ZF9QKs2aZCw3DycQYRkpEA==
X-Google-Smtp-Source: AA0mqf6aVKpn/bEmvPX0InvYORnfb/1qXJ8IAObqE53A2T5he69oSyRhudAqfVKewSd5bKPJrl9BhQ==
X-Received: by 2002:ac8:4d4e:0:b0:39c:bdd5:30b7 with SMTP id x14-20020ac84d4e000000b0039cbdd530b7mr3030891qtv.213.1668704107172;
        Thu, 17 Nov 2022 08:55:07 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:06 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 03/11] golang: fix CVE-2021-44716
Date: Thu, 17 Nov 2022 11:54:48 -0500
Message-Id: <20221117165456.1029099-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173436

Upstream-Status: Backport [https://github.com/golang/go/commit/d0aebe3e74fe14799f97ddd3f01129697c6a290a]
CVE: CVE-2021-44716
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-44716.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 90f483c294..ae3f724c53 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2022-2880.patch \
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


