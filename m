Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60105E6FE3F
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108973.1766524971465175454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M52HDOSQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0bae9aca3so77334385ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524971; x=1767129771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR9+XF88A61xPN7jTv2BsPy82EdgrZo2HPP+YePd52U=;
        b=M52HDOSQnE7AEhUbNqZ+KkzrMXF6vqN+EKz+W07GPI12QFkBGNER7kJJ5yQ/J5RMml
         7lKdc4S/tRPR4YGwaUenoxAEnpV76hv7Qxt7gTjLM4zsaszfQJUZs97UGTb8klJnFtMu
         3Bx6QOpVQWRPlwJdk1XrewKpzP8L4Nu8Tzwg1Wb2VgU2K3hYBZUWJVtNyls8i3ETTd5V
         +iurIJCF69EeQuXsyqEQqq6nDuZZoboWq+ozyCm3f4AYR3sf4Bmz7xryEpnNMAGR1sMI
         DuoR/I0MLyJRN5ww8s7hWXhQ+DSb8w5N7kFxKjHbW9ZdFl/4M5axkzyzRAtB6okiiixI
         UNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524971; x=1767129771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iR9+XF88A61xPN7jTv2BsPy82EdgrZo2HPP+YePd52U=;
        b=CxPdbPMaEG28X1MHHnpa0EYrew9cCQpBzWRky2s5m2hCpZhCSZRYBwoLwcouFCSE2V
         snxhe2IYqhIwv1HlWIJMJ9n6dnDGo8tXBFN69SZsUz2+NHm/VacvQNqnfWVAqwIH9tVv
         EShZB41G1M46bNjG9piBrNw0NE44Qurxo/U2H9+Jzr7A+YaUrpn8t8ekp+8WqnJTKw8N
         otgrw5lNRlbOdSgB38BZytyBr+4LArinpakJQMTl8sWjDJNrSA96VKdanbcSOxg4zPTz
         sN13LPhsqpeGsoWYGzC7zGnNmt2Wm6R59NuksoG0muuO0fUL9IYQmmT8dZj8galwhjOi
         YSLQ==
X-Gm-Message-State: AOJu0Yz8Nnmrls9IbJuUVcJejFe6MCF7zSphcow58pNsVHldo8HfbQzY
	fDRcN6EZwEuvb1UZkXsaF8j/jJB9kDxogiEGEoULkEcsLi6pCu3lM4x7frQA33SStQAzVxL8yVx
	TJkuX
X-Gm-Gg: AY/fxX72FEMRMTfIN7LoLlTmJTf/z/DOE1DGZjf/c4vlWnTd6w8Y6d7Nh0j3+frIrRt
	X6WCturOYcoL5foo3xKSOxToeHT0C2qirm/Fy7/e88AmMSeLuR5AnuG78b1UOnRUWeBxV4o5wiO
	kXoWfvQ/LHzysVkq7LUw3N1AtQoev7eGtc1R2+yzPisfH/sil4foGiJ/2iIu5G75OgTVTnB8ZyM
	xL3qigb7M9Ro+bXRGtUNSpdNwCx6vyyBsG70F2eiOaC/3XTd7BTmpQSae9G4H7RL9w73vz9yGnG
	yOm/khQTnc8aV9jBhrePOBgA5bZR30g0sXo4tU+lFh1+N9M/4eEn0p9GNxM2yyO0/ZDym08Bkfw
	39xBqHX2skd07aE7pSAK5AMpempnR7hQvnyNcObZ6X/wGP0RnhX0SRVnKP1BT1E1+O0AcGaZGyx
	h3xw==
X-Google-Smtp-Source: AGHT+IF4T6wxreDQafPsVNGWYOgqGAU2y2f+EuxEpM0KGS0gxjXkhmIBmjh9A3FRv032BXxH+tlJwA==
X-Received: by 2002:a17:903:2a8b:b0:298:1422:510d with SMTP id d9443c01a7336-2a2f293daefmr148354955ad.48.1766524970715;
        Tue, 23 Dec 2025 13:22:50 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/18] cmake-native: fix CVE-2025-9301
Date: Tue, 23 Dec 2025 13:22:12 -0800
Message-ID: <24f831be7d99d5ea3fe304b9aa2d82e7e2d4a5fa.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228480

From: Daniel Turull <daniel.turull@ericsson.com>

Add fix for native recipe, since previous commit for cmake missed it.
5d8a6fb52c cmake: fix CVE-2025-9301

CC: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
CC: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.28.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
index 376da3254b..7b250752d8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
+            file://CVE-2025-9301.patch \
             "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
-- 
2.43.0


