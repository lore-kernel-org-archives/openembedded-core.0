Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6DEEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:24 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.7292.1687919419009931136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pBiGH/IF;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-55e1ae72dceso3768620eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919418; x=1690511418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7cLlLOISkwyxASrQTUVQ2pZUjp5i/so7k8eCBWtnR0=;
        b=pBiGH/IFW2DS/QrKY7wIVWNped6cEaeP8L23HLSq54sO/IhFboyuRy6SgkEKKY2I//
         zLvt8UEHwVshbLYydg0ISaVYYplWteqU8bWPz7qNVKaOOJRb9svByeZjgOmRFb3OFUrw
         PKwl6xTp30aQZp9aa4MgxGrBVWeL00l4qYu4ESQ53d9MCWE+LAqm96B3W3tzPTS0zkLE
         LorVwyL747QHz7ngzThQ6fROeLqr2DxpiEJI95GUpFXljzL1/B+Lw5tOqxsLMxALyOIY
         bW87Sv+hHCh1huDeiXlUbr7QzTpO8GV6nv30V8xNwwBijeWbUCAKzy81/6f6Ew/8Io+c
         QSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919418; x=1690511418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7cLlLOISkwyxASrQTUVQ2pZUjp5i/so7k8eCBWtnR0=;
        b=fkmx96U44MRNJe3QYVSKu85fpLFILW8Ud9KoHdaaEx24B8Qdxd+mfh63+DKIySrzgT
         0pQ2YFBQTtqhQzppoYkgRzIKBuj5aOdhahKSolTb/1yB5svi0HQXyExwEdAYZVsTd4iD
         yNpqOst77k7ckabgzVRSATVHShf32QqdUBKuE3cS9g8B2fiGA1PrCkhHlOSchM0amQpO
         AJlPWTpKKqH3bj9KiaGjCO+AWACm69h7GlR57E9L7oi7I2AM5G8+MRH1BeTc+T13pUya
         HJIReRLfSeK6xgbQzAFucY9yhbispSzkFjlkC1QETaAaaSJfVHA3sesN+co3sNdY1TNy
         cT3Q==
X-Gm-Message-State: AC+VfDxm+I6P0uEx1ejuwJbwqGj1sSeU4jTmWc00i8FhNeUFu43apqvS
	PRk8VEr5vomnYlTRYnnaxNn6ZTXqfNL5cwdeZ3uHgg==
X-Google-Smtp-Source: ACHHUZ7MXS4sjHFzJoB4anMgXfQaugK0kkk4WHBKb5GmFZvZwPNvkncBLHNEVhT/K6UeYfrUCF1CIg==
X-Received: by 2002:a05:6358:1aa8:b0:134:d559:2590 with SMTP id gm40-20020a0563581aa800b00134d5592590mr1434357rwb.14.1687919417685;
        Tue, 27 Jun 2023 19:30:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/30] go: Upgrade 1.20.4 -> 1.20.5
Date: Tue, 27 Jun 2023 16:29:30 -1000
Message-Id: <1234971eea7b07e89efaf20055ba9580fbe2cb08.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183523

From: Sakib Sajal <sakib.sajal@windriver.com>

Upgrade to latest 1.20.x release:
go.git$ git log --oneline go1.20.4..go1.20.5
e827d41c0a (tag: go1.20.5) [release-branch.go1.20] go1.20.5
c0ed873cd8 [release-branch.go1.20] cmd/go: disallow package directories containing newlines
356a419e2f [release-branch.go1.20] cmd/go: enforce flags with non-optional arguments
fa60c381ed [release-branch.go1.20] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
36144ba429 [release-branch.go1.20] runtime: implement SUID/SGID protections
5036ba77eb [release-branch.go1.20] net: skip TestFileFdBlocks if the "unix" network is not supported
b249ec5655 [release-branch.go1.20] cmd/go/internal: update documentation of go test and go generate
4b95fc1e6c [release-branch.go1.20] cmd/go: save checksums for go.mod files needed for go version lines
31a1e19a59 [release-branch.go1.20] net, os: net.Conn.File.Fd should return a blocking descriptor
450c8021a5 [release-branch.go1.20] runtime: change fcntl to return two values
22741120ee [release-branch.go1.20] runtime: consistently define fcntl
9270e3be8f [release-branch.go1.20] os: if descriptor is non-blocking, retain that in Fd method
600636e931 [release-branch.go1.20] crypto/rsa: use BoringCrypto for 4096 bit keys
afbe101950 [release-branch.go1.20] cmd/compile: fix bswap/load rewrite rules

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ea1e9e9d7385c78bdd513e44cea5c36444529b2)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc}   | 2 +-
 ...o-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} | 6 +++---
 ...cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} | 0
 .../go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb}           | 0
 .../go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb}     | 0
 .../go/{go-native_1.20.4.bb => go-native_1.20.5.bb}         | 0
 .../go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.4.bb => go-native_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.4.inc b/meta/recipes-devtools/go/go-1.20.5.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.4.inc
rename to meta/recipes-devtools/go/go-1.20.5.inc
index 05bc168e0c..4e4e57d5cb 100644
--- a/meta/recipes-devtools/go/go-1.20.4.inc
+++ b/meta/recipes-devtools/go/go-1.20.5.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6"
+SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.5.bb
index 87ce8a558f..a98be4af1b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
-SRC_URI[go_linux_arm64.sha256sum] = "105889992ee4b1d40c7c108555222ca70ae43fccb42e20fbf1eebb822f5e72c6"
-SRC_URI[go_linux_ppc64le.sha256sum] = "8c6f44b96c2719c90eebabe2dd866f9c39538648f7897a212cac448587e9a408"
+SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
+SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
+SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.4.bb b/meta/recipes-devtools/go/go-cross_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.4.bb b/meta/recipes-devtools/go/go-native_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-native_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.4.bb b/meta/recipes-devtools/go/go-runtime_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.4.bb
rename to meta/recipes-devtools/go/go_1.20.5.bb
-- 
2.34.1


