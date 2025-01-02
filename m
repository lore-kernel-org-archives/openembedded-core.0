Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C91E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5194.1735810877063096564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EOG2yRJf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so5642573f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810875; x=1736415675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrmxZthgf602tbqUAQHkCjKnxgCfcVvrrFDqw4t2LsQ=;
        b=EOG2yRJf4dYZI/Puxcn3lrCkc9jGqih3DmLoU0sKaLjH0unFE5t3BUBZ87tid//dZ8
         wHljxuQm8qE/qxE9D34tyGml+BO8m1fs24MBGyWVSvMfXuLFdwOGQJxBEgp1ckk5P2w6
         EmACz7BgKyk/5qLWcwKOZhzFWPCNH4ZW40YYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810875; x=1736415675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrmxZthgf602tbqUAQHkCjKnxgCfcVvrrFDqw4t2LsQ=;
        b=nNOF3GNWujWKUKEI8l0zz/0cLJ/ZnucqXjlrLld/xFGVkwtPK2ZsOzAMeUWxk0On0T
         Zh7lRnrehnvzGX72tAlz652HQc8aLsFpC2993Daw17YpElw8q3PiW4q13cG4mV1OCzfw
         A4gqNTDSstz7smAtGQrGYO94YZmTsygVAKAC5WSi/b4sYUfB8Q0IcT7qRwQFSMTSgw5w
         f/CpIg03F+pmnF1h0bF96DpxHfVPCW1qptpYNqXrIcnxvizbT12JxtMGiWNyLeUj3TCk
         mJFHA6s1JI+8ozDpGSNbdTj4LpaQ/EmXPL2qfkMK2klD6WXsQ70twPoK/ew2MP8Xh/TN
         UZdA==
X-Gm-Message-State: AOJu0YyGoyPqLTLbEyfadfMJc6GYB0qpqH9gUpSwzhA0VxGpR35sKyM+
	5EqbunE8f132/aKWnEO2vRqncIGevNMnR3vg6+t6An4kWnucDPbWFsr5K5xD7grHtFl9mR3PkOJ
	OG7A=
X-Gm-Gg: ASbGncvATC+7iw2dN7JUll4SoWifsVu4B/gQjstMxXIp0MIWBF58+rcFS3hqmKvejfm
	MLK4cilScsH9MXVTjVGNJAOWA3RoGZanr01xlOwcEOEYCJQHyGleJcqNAIoNn6AtxzgwpB3/tm9
	N7FHQMqdxvhblpMklPUkFIN0lB7vpMSGfWiMZnyyjGVZb7UpAHZZ6izY7iAG2zeTgs/wk/qJtNE
	ZWeLZxoc45AqUXrj5cF1QO6ZJnIuFrlz0reFUXCMZmuKc31WdipvJTOAHqwTtNjz73OZHMlUQYn
	IXHv1/MmVA==
X-Google-Smtp-Source: AGHT+IFonCZthUBkmVwrJJ0lJzmQXK1mKr53jprO6NclUAp4YqPIt2FJdq7MsvaX/RvPgs2I76FTwA==
X-Received: by 2002:a05:6000:1ac8:b0:385:faad:bfb9 with SMTP id ffacd0b85a97d-38a221e1827mr38783935f8f.8.1735810874813;
        Thu, 02 Jan 2025 01:41:14 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/21] libical: upgrade 3.0.18 -> 3.0.19
Date: Thu,  2 Jan 2025 09:40:41 +0000
Message-ID: <20250102094059.322187-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209270

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-cmake-Do-not-export-CC-into-gir-compiler.patch    | 7 ++-----
 .../libical/{libical_3.0.18.bb => libical_3.0.19.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.18.bb => libical_3.0.19.bb} (96%)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 3841c060eeb..0a7c6965302 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,4 +1,4 @@
-From c06d8a8990c996cbb854508a944202ba70ba7a7c Mon Sep 17 00:00:00 2001
+From 145a0f3919f6884c377a9e6b8a03de707feb45fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 3 Mar 2022 20:10:04 -0800
 Subject: [PATCH] cmake: Do not export CC into gir compiler
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/cmake/modules/GObjectIntrospectionMacros.cmake b/cmake/modules/GObjectIntrospectionMacros.cmake
-index 83aff931..d7d3f898 100644
+index 83aff93..d7d3f89 100644
 --- a/cmake/modules/GObjectIntrospectionMacros.cmake
 +++ b/cmake/modules/GObjectIntrospectionMacros.cmake
 @@ -50,8 +50,7 @@ macro(gir_add_introspections introspections_girs)
@@ -28,6 +28,3 @@ index 83aff931..d7d3f898 100644
                ${GObjectIntrospection_SCANNER_ARGS}
                --namespace=${_gir_namespace}
                --nsversion=${_gir_version}
--- 
-2.35.1
-
diff --git a/meta/recipes-support/libical/libical_3.0.18.bb b/meta/recipes-support/libical/libical_3.0.19.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.18.bb
rename to meta/recipes-support/libical/libical_3.0.19.bb
index 052ca57cfb0..1ee39aa94ff 100644
--- a/meta/recipes-support/libical/libical_3.0.18.bb
+++ b/meta/recipes-support/libical/libical_3.0.19.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c"
+SRC_URI[sha256sum] = "6a1e7f0f50a399cbad826bcc286ce10d7151f3df7cc103f641de15160523c73f"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 

