Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2361FC35FF8
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.31742.1742141592647860410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iY9EmfF3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3147427f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141590; x=1742746390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcFkKCXWaoQrUcmsFkQW6Hkm+RExaQ/EwWx41wRLYxs=;
        b=iY9EmfF3cVKg/Cyd8KCDlU5qS2BCOfC0B94JPh9J1+NnNPiZzYAcDwHlrU87r0CY9b
         /e8rvxcM4Ocjtdx4lCeK1Uqj7xiJ7hfeu32Na/0n4lfePRgycaRSlpodCX+Dk5OwowdC
         u50g2F6AgbqQnJrCvU7LMtPFpwgyvxE5BhTm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141590; x=1742746390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcFkKCXWaoQrUcmsFkQW6Hkm+RExaQ/EwWx41wRLYxs=;
        b=rQ1q4rQtvo3JmNhpZ9Bwxg4A3po0RiWAQsHTNdxuUysG699jm0sfi6Yt6Q+vesNBia
         DKvDPIIx0GDZsRr0QakLhT7mT+oBBxkG28TvaFedqfvTW11QEZgi3a6N4vcAK0KZxGi2
         wXuQKxK7sObaCwfPC2jgehCHTcYDE7ZWhAm8MVgREszcPpuJwJaR0dJ/H1sMTC58kuPB
         o3mO76c4b7Y54Vc6e1yWxLCzt2XyFLGfef/VrYrbq7FnQ2tXAupjXOMR24KmNKlavhUN
         7Qpx/1hYpmqDObPGRQDTDwnni+o2t6IZDgPot4UxW2jjIlvQJEEWUX9iV27ILGPN4VOJ
         bIGQ==
X-Gm-Message-State: AOJu0YyZCOl/Fm7yCN9iXV7XrTF0T0/XE4jyGpcViI3FrYkq9Nk4jYcW
	XI12yKd6k5ffE69UgShEqQAbr8LmhVf/DFIxhK/ukp6fPfneyLurfANz3RTP0Ew5JYR/ePrFuJW
	J
X-Gm-Gg: ASbGnctzDgrcjw+R7/uof6Ot8wVCXuC7ut4NyNvVHWBlQPKKhpnajI12MQ2oSrIv4q/
	pQnJozzOcDZc6JGiogQJxo3OWiN1UaHeNUpLHj0bh/TH8vebzpifYo0d9fTOV033zqxcbENykkA
	x7QUwDp07Rz/jOUpDB+pWDgURcG+Lux7kSrqk4vHt/bWHQ58VwJMJXBwLD0eHAJjtkIYyceF4eJ
	8Qj4ZrrvZlHwzUQvVgYNI57V16ttB3acD9ejd4EaqT2ekRDCrzE9ocqt30jITnmdqosSjlB+3Xu
	4c62hUkiyl7OZtq3d+U2AbJuzSQR71b1ieGAZDyTXJh7ZfVNBaRQROjY1Sw9Tj2cX4M/kv5lSjP
	v+TM2Hju/
X-Google-Smtp-Source: AGHT+IGl4vmeWsdM8NlaYHkpnqXYPrM2h5MM1QBW6bdqCv6KyXY8XGUngRBLqlFRYw2r2MaqempyMg==
X-Received: by 2002:a05:6000:1ac5:b0:397:8ef9:a156 with SMTP id ffacd0b85a97d-3978f08ed1bmr9461171f8f.14.1742141590444;
        Sun, 16 Mar 2025 09:13:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/43] ccache: upgrade 4.10.2 -> 4.11
Date: Sun, 16 Mar 2025 16:12:07 +0000
Message-ID: <20250316161209.3629986-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213044

License-Update: Copyright year and component version changes, no license change

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ccache/{ccache_4.10.2.bb => ccache_4.11.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.2.bb => ccache_4.11.bb} (84%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.2.bb b/meta/recipes-devtools/ccache/ccache_4.11.bb
similarity index 84%
rename from meta/recipes-devtools/ccache/ccache_4.10.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.11.bb
index 361c1643f91..9a305c257f7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.11.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73b86311eaf2b66b0d093ec1a15fa60d \
-                    file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=5389d9f5a88a138e42ba58894bbceeac \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=b98c3470e22877fefa43a01a2dd0669c \
+                    file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
                     "
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87"
+SRC_URI[sha256sum] = "7dba208540dc61cedd5c93df8c960055a35f06e29a0a3cf766962251d4a5c766"
 
 inherit cmake github-releases
 

