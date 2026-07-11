Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BAFC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4208.1783773396723242578
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=br+PMrio;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1166902f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773395; x=1784378195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3mgu80o0WATs7xjnQwNBSrhvPd1MRJ4fjxsL/adx1aQ=;
        b=br+PMrioIl+agwcCzY9Y9xDMMNmLB0QQUMwVSLWMg0KuqV5u7whVkbmOCh4Dkf8YiQ
         vj+YwQlGxO8K8EmFwYcYm7VI1Qgg/m2iOnVKyi5y+AawBxuhwQ/X3KUaH+j6Xm6P9Qfx
         RbU321Yi9l9rs+xKMtxaI2JpeTpbtKgHycs90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773395; x=1784378195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3mgu80o0WATs7xjnQwNBSrhvPd1MRJ4fjxsL/adx1aQ=;
        b=oQ99y4GXJ+fUvhTei7FMGqMrQQqk/wn+iLtW4Gz/fckkm1DDBJ2ny1QzOZVQIX8XLv
         4Eu4eNkbtP+tTPNyA8CVZl7nz+Atd4gdixShZQWfVxOiiwc8Dg50qJgoIDMz2jfndI0K
         pT6Fwc2YvoTW7PjtHec2CNhRXFX59DuVvd5+4ejkY1PRzDmBYhxCzwBlCpSXokr1THlA
         3Nbj73pUURhI0dAtgTn4J14B9iE5LxEUlVzSYn3W+jZxuAZ6olxv3LjAQTQeyIB1VWlP
         JFwfBiDE9jf3gBe5d7Z5+fNt3W1kRfPyFynuFus9amEYirzuXXrTTiJP4X7hbruqjncu
         7ubw==
X-Gm-Message-State: AOJu0YxiIYjaxUjBHVZ+QexKXg0W3FjQzeX7adDhi/xdpn5uVICbB21s
	91KW1Q6LVfuftIYHst/Zj0zsj2V7ogSaJbiVFRZAw7cmmrewVMaoWx+kHka8F17vAnWurMBlC5q
	urcDW2u0=
X-Gm-Gg: AfdE7cnwypvsjlCAoEah6i5JGBb8N7diTRU6RMyvJlaFfLO9BGlupoShFSx2C71Gs8X
	9UiIxUquJsCDP0pbbSbo/HtYBaLZcFfxx9dYg/EVX6t0wSJ+xH+C30eLoZJyQvbxpXpxQYyLDHi
	jaS1YjadR6YOKx9hCXbuCKVpsFDBO7jQY8bJPygacOfNB9+5QXM5fMFea6D74kLon9Udy75FnFs
	y/2UAxpSpXrGS8aeXR1vffLM/U/UfN2CcSc96o+uXiPXsgvDrMZxIoQ8UgbWKTUUQ9Oorqnf6tO
	2R4iY/BzV7vbla29jFAvBvw09odlrmBdyUi6B7J53c2QekyT/6GYTiftFTPmui3FKgyiaLwj+on
	8VvzY5s6CZORuv7hfOLkgDYU/bmie6uilnn0Ez34SbjzOB7CBc0s5XuSvxcJTOw7TnjlievTYE9
	mfRScMg3B3mgH+59dfx9WBlGgThF1yU517zEt8llaO/Q==
X-Received: by 2002:a5d:5d0c:0:b0:47d:ec60:6578 with SMTP id ffacd0b85a97d-47f2dcec4efmr2505645f8f.50.1783773394888;
        Sat, 11 Jul 2026 05:36:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] cmake: upgrade 4.3.4 -> 4.4.0
Date: Sat, 11 Jul 2026 13:36:25 +0100
Message-ID: <20260711123626.1583730-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240716

License-update: libuv split a LICENSE file into a LICENSE-extra file but it
is all still MIT. https://github.com/libuv/libuv/commit/61e0bbda6bf2416210b54ad80bb3f19e4876a896

Also copyright year changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_4.3.4.bb => cmake-native_4.4.0.bb}    | 4 ++--
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 .../recipes-devtools/cmake/{cmake_4.3.4.bb => cmake_4.4.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.4.bb => cmake-native_4.4.0.bb} (94%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.4.bb => cmake_4.4.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.4.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
similarity index 94%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
index a859cef1517..840a2fddb99 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.4.0.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmlibarchive/COPYING;md5=7ce08437ff7f5e24d72e666313ae4084 \
     file://Utilities/cmexpat/COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
-    file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
-    file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
+    file://Utilities/cmlibuv/LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
+    file://Utilities/cmcurl/COPYING;md5=0515352b285b9c3f66464b135c9c0fdc \
     file://Utilities/cmcppdap/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f08b0715ba7..85b444d9f92 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda"
+SRC_URI[sha256sum] = "65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.4.bb b/meta/recipes-devtools/cmake/cmake_4.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.4.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.0.bb

