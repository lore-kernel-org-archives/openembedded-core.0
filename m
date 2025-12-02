Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DEDD116F9
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:10:01 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9921.1764688195056653886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FcW6ZZ3E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso8915774b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688194; x=1765292994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVdkDLx9WHPbIp+eBVPjfzgzSczMtptBN+9P+4BY12A=;
        b=FcW6ZZ3End7Jowh5Pxrh4HbKP26T1gF3/Q+PyfJr5nqOSLUNBJXVlgOHS/eudaysaJ
         ibmvdszEmRa1a18NZp7DyIMVOjECEm/XBpy511McNNQdD1tCjf+TwnkdJitP0Mr6AW6w
         6RRHoGPW0Ik1rPdcZfFnv9evbJS2UpHIDeIK7vdvH4MVi/NXLt4RNJ7m0QfT9WuluIJ1
         aBUKd4vww9FefOr3VTKQP8OGvjtSRGVdwoUE2VGn21Cc6i1W7eLgbsRPf64UWylWJ9YV
         zCTHdzj2vBiA0rzpjDZVhsoVPm5ESD6ppLgwTpw85dJb8nccevQw1L0yMkyIm4WrZLQH
         gofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688194; x=1765292994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sVdkDLx9WHPbIp+eBVPjfzgzSczMtptBN+9P+4BY12A=;
        b=WjFbQ6d4T/PzNjqSH43KIopKvfTODm/JDHP6fTM3rU6k44PDtpuL4LSvMhyjtBNbSq
         Xn/6vbDHrzyAkA2vBhPuVcwoh/X1mqJutouQEeG7UnbYArIN5/j6InJLY1QZkAfKISTf
         aulOUakUQenVhf1f/jV8sEzzgh7tKYJGD+CqH91JPidjJdEbfcDoOhj5xhH0yMWpn1WY
         JL+yLZuYU5wHT8r7WY5b2qg+PrE6Xo336YxVwpQs3Np25aEFJ1smVKWeAd1Br4SksneD
         ym9q25hC2SJPIstI80eb+ymx5tE8TGuF5SJWPpDXe/1wrT5Sjw+M9fjpKzxes87BZ3gT
         fIOQ==
X-Gm-Message-State: AOJu0Yy5vT3fuDd6hdzc1ZpN3agCVChsiD3qzObL1G6q6fp2IjQKFC4W
	ynbnOrm4CvM5e2+qIqNpLd14vjkhvyMTefJ5UNiKlHSEXfSgqJ740UgXuyk5gfxGknNEHNbn49i
	7qYIt
X-Gm-Gg: ASbGncvcGfafAgffD+5sOWSPNEPv29Jl2u9pLACC0nT2sHR2Uv9LgySs70FkTJt73An
	Z51gpvzY4KfZANJ+UE6I9ocLMGAfaMJYCIT+/mIU7bYe7TJs+Wr1LsXyV3qLRmz6Iwcma/C5jap
	WBoB4Ixqd04koD/C3U7HhqOPrFt4YqagWeH724x+ioykctGn18cyuBM2adyXmE9ihSzymVg+0ux
	CTx3cSvxMNQs06NLanNRla9Wn3D3w8birExIW8EXcMsXwkXsOBUVHp4xB8aBgDOroREYJch1no0
	UnFtPsOHGoUrts/yeGLTYMlQixsMqckrTQHJSitdLwlC2CsadCL36SO8dw+TuA5/Zqwoj10bCQy
	v9vYxyoJ9+7TgO+0qfMSsPZkXOQ+upOMxW0yIDjpOIv4aYDQydsLygJ6PQ8JQBITHvVbS6kS2SC
	vbQA==
X-Google-Smtp-Source: AGHT+IGTS+HOqIFTFi2I2NabmlMphOsH4hx3XL5CX30aOxmHO2QeZhMH9RfD7KWrzxlXJnsuSpQZOw==
X-Received: by 2002:a05:6a00:3cd0:b0:7b8:83fe:7d7b with SMTP id d2e1a72fcca58-7ca8975eed8mr34417934b3a.15.1764688194239;
        Tue, 02 Dec 2025 07:09:54 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] go: fix CVE-2025-58189
Date: Tue,  2 Dec 2025 07:09:30 -0800
Message-ID: <b3f055df67cf345c9a17c5c1c874c778d538ba9e.1764688054.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764688053.git.steve@sakoman.com>
References: <cover.1764688053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227166

From: Archana Polampalli <archana.polampalli@windriver.com>

When Conn.Handshake fails during ALPN negotiation the error contains attacker controlled
information (the ALPN protocols sent by the client) which is not escaped.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2025-58189.patch           | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index c5aa3f9786..61fee12cf9 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -70,6 +70,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47906.patch \
            file://CVE-2024-24783.patch \
            file://CVE-2025-58187.patch \
+           file://CVE-2025-58189.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch b/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch
new file mode 100644
index 0000000000..835f071733
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch
@@ -0,0 +1,51 @@
+From 2e1e356e33b9c792a9643749a7626a1789197bb9 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 29 Sep 2025 10:11:56 -0700
+Subject: [PATCH] crypto/tls: quote protocols in ALPN error message
+
+Quote the protocols sent by the client when returning the ALPN
+negotiation error message.
+
+Fixes CVE-2025-58189
+Updates #75652
+Fixes #75660
+
+Change-Id: Ie7b3a1ed0b6efcc1705b71f0f1e8417126661330
+Reviewed-on: https://go-review.googlesource.com/c/go/+/707776
+Auto-Submit: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Auto-Submit: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+TryBot-Bypass: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+(cherry picked from commit 4e9006a716533fe1c7ee08df02dfc73078f7dc19)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/708096
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2025-58189
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2e1e356e33b9c792a9643749a7626a1789197bb9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/tls/handshake_server.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 4e84aa9..17b6891 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -312,7 +312,7 @@ func negotiateALPN(serverProtos, clientProtos []string, quic bool) (string, erro
+ 	if http11fallback {
+ 		return "", nil
+ 	}
+-	return "", fmt.Errorf("tls: client requested unsupported application protocols (%s)", clientProtos)
++	return "", fmt.Errorf("tls: client requested unsupported application protocols (%q)", clientProtos)
+ }
+ 
+ // supportsECDHE returns whether ECDHE key exchanges can be used with this
+-- 
+2.40.0
+
-- 
2.43.0


