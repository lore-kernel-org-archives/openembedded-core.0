Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F67C35FF3
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15403.1741961426662292983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aKuMN3Ty;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2232aead377so47386135ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961426; x=1742566226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUdJJhy52cBwDNVk1yIf4ypBfZ1byn86XhyEkRwA4Og=;
        b=aKuMN3TyX0a6nzEjw0CqvFtqLFdDkuv4lItKLkqUwcbeYtGT7XKDpvJgEdRG/4Aqbc
         eWs2QsTG5Bj7h90hNiw3ltlFikEpGiRHUQ9Bmbdpv9r+q1vtzoMr7rLl/Ru82I25ygoH
         FmUzaChLJYWjSY3ft7RfDYRVTYRADfxk8wq8SEpElRAsQ7Rdo3S2k1CUwI8dbP4VWoIY
         kjp8dTTUIouT62RLbu0YxEVEyFo7LOkDwRwe+L6mok7486jhJp78Xg3NRG2vZrq39+SA
         R1MBXvVlwjdAfliN/FuM37PMbtt6J7vUFF3Xp2eyzzHTPlAWXIH2driyfrkphl6uFkXw
         WMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961426; x=1742566226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUdJJhy52cBwDNVk1yIf4ypBfZ1byn86XhyEkRwA4Og=;
        b=iC2jt9cUObyThh6cs+mLf/RtKO1NEWFjZfTyuf/gvVrzcSWITiHrTCzCYyrg3+55kZ
         KoiuS61SVGAn+yqMnUfGPWeC0D6+lcAOsk2E+YSBFIkj0cWD/HnTa0+JYBMwH8S6BsUS
         0pgBKZY8SdRRqs6IIj4K7WoD5x24Dhx72DxLIbTNxUjvALgb5ALm1K4H+D67dx9jv7GE
         xSRr6OyadHZ4FpTCNmMCnaRVRDpyFEUUkFfQ+GgVxBrr/LFpLnsMsYPU8L/dU/kOnt1q
         x44CPEQQfTKHJnXEUwzSXolAAKozAJWg9iHws91SdhxexnsSu8+V/JiNdwybibV4LWNM
         5LoQ==
X-Gm-Message-State: AOJu0Yx6NZOW2Vblzco3B0SLfMXsA01tzcCh27Bv3fix3ulV5kMkn3Rx
	yONMU5Em/0pV5DeG4o3gomhsv2c7tPgK2y9hOysJ69o2srdX4AJFVb40FZyBL9uz+KCzeNaDet6
	A
X-Gm-Gg: ASbGncufeNhzmVwHrttKFaZX82Yf/5E5IZ9fWM3qSEL31FjIK3T+Ymn6ADqYqL+YGub
	XyWyri3dFT78i1zo3YJYU+z2xXgNCiLgdv1CPjZf2t908Nxxx6zVGySFLIFKqx0Qz04SPrlHYR4
	n154Iy3PQJ+7ylsW6GxnzUMO2v7JXHNYSH/StsL8619Viekfopu1tv5xTz8Srb0Nyk2yOYyOGIk
	KJn631aovS1aiFhRvcfv7tjcaS1GRc6lyk6AmGY39honcKmNIwRHShlvwnX988WTkn71keLG+4o
	xtlAUDS9CNqiTJfzzUgz54zqBqitCs5u1/Gk
X-Google-Smtp-Source: AGHT+IEvl3oYlEq282XpGScDHHIZyisPb1HXsjeZLHm1zpO6LwxeRW+yoUjITo+8+G6YAhumUA7bmg==
X-Received: by 2002:a05:6a21:328e:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-1f5c12c8bf3mr3649332637.34.1741961425870;
        Fri, 14 Mar 2025 07:10:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] ruby: Fix CVE-2025-27219
Date: Fri, 14 Mar 2025 07:10:07 -0700
Message-ID: <31d67739490ec2abf92328b3f0ceff22ce5d4974.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741961309.git.steve@sakoman.com>
References: <cover.1741961309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212851

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2025-27219.patch            | 31 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
new file mode 100644
index 0000000000..7813a6143c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
@@ -0,0 +1,31 @@
+From 9907b76dad0777ee300de236dad4b559e07596ab Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 16:01:17 +0900
+Subject: [PATCH] Use String#concat instead of String#+ for reducing cpu usage
+
+Co-authored-by: "Yusuke Endoh" <mame@ruby-lang.org>
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/9907b76dad0777ee300de236dad4b559e07596ab]
+CVE: CVE-2025-27219
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ lib/cgi/cookie.rb | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/cookie.rb b/lib/cgi/cookie.rb
+index 9498e2f..1c4ef6a 100644
+--- a/lib/cgi/cookie.rb
++++ b/lib/cgi/cookie.rb
+@@ -190,9 +190,10 @@ def self.parse(raw_cookie)
+         values ||= ""
+         values = values.split('&').collect{|v| CGI.unescape(v,@@accept_charset) }
+         if cookies.has_key?(name)
+-          values = cookies[name].value + values
++          cookies[name].concat(values)
++        else
++          cookies[name] = Cookie.new(name, *values)
+         end
+-        cookies[name] = Cookie.new(name, *values)
+       end
+ 
+       cookies
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index ac9dec3514..76e5ac81ed 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-49761-0009.patch \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
+           file://CVE-2025-27219.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.43.0


