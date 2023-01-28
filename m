Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548ABC38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 23:30:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6702.1674948625201548864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 15:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E4DE0MSf;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d3so8272612plr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 15:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pNjNoH6rDgxicxiGTu4MHgZmvtWCDItlpGW+tjidnY=;
        b=E4DE0MSfRx2MHZNDrm4H7Oa7WGS+7OHodKGU60J9BKfGgCqtlLcxoEhrXGXHBNMVAp
         5ILg14A+wxObeitAWGavPS6Fs8R27WHB2a+jiRPShLYcGn0w8Xuu3lfDOzuohYjV6IuS
         hEJVKIipdGN2MEqXF+O0rGsKKU/wthPLx+eYSsdUtACaRmZq5EyiRfD+NrnESi8xnzXl
         /icKFrVDaN7NCZwFk1K+RsgZJmocaw5xEuAZfjB6f9pwM60xmZylGUXYwmamqgN5s1C/
         SQW2MnPt2qwij834TuAosGFLChca1WF+ySa5qMchTMvWPOm7GgECCAMk5YpMy6ebhGVQ
         eZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pNjNoH6rDgxicxiGTu4MHgZmvtWCDItlpGW+tjidnY=;
        b=LTpYxcCGShEV4fCUYZ7f+f6B48Rv2Rrq6Jq27NGfNrt77/Bt1zX0D7/09K+isQsbsm
         7mpRte9hRViKXYdGIaA5fb3eHrMYM1xG1hRPI6KuI9+mePL0Im2xlSo7XTZSfrT2YtsG
         pCBfAZhGLngO4eROapNWKFjyCz7ZjJAXbYHMYhgjDi2Mljd0DkvnpzfG/PgoT3uKhKbH
         WKiQn4cdMLe7+ElAeqltbuHgQaIwn3XhmGcQMSJX6UM+iwKJM4gYhmHOFWV2WGdCIlbn
         j5Kglv9/X5Yo8HbTJ34KPS+jXwJsuCgN/NRF7iM5usJjmYWzC407k2o99FfUHDCWpG0t
         kozQ==
X-Gm-Message-State: AO0yUKWwGkvYDPbQsE0UTMC6GTdYZipI6eUxNlQf3rV1wdhtQA/3tc4o
	L5sawyOzwlPOWtobxMfDeaOHsZD/lbFp0Q==
X-Google-Smtp-Source: AK7set9Zmc9+SwGjnRVqwxD9IJSRPPtjGFkICztSGEh5bdscExK3sAOZkiSKQ798rWj2REmqw/DTTA==
X-Received: by 2002:a17:902:c7d4:b0:196:7237:bd85 with SMTP id r20-20020a170902c7d400b001967237bd85mr1505010pla.44.1674948624154;
        Sat, 28 Jan 2023 15:30:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id z4-20020a170902ccc400b00194ab9a4febsm5026983ple.74.2023.01.28.15.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 15:30:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nghttp2: Always enable python bindings
Date: Sat, 28 Jan 2023 15:30:21 -0800
Message-Id: <20230128233021.2230473-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 23:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176464

This makes the build host agnostic, otherwise on some hosts e.g. (archlinux)
it ends up using cython compiler from build host, mixing python3-native
and cython from host is not a tested combination and can result in
obscure errors. Lets make it use cython from OE native packages and also
enable the bindings explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
index fc1a592200..4402b80d1a 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
@@ -4,6 +4,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
+DEPENDS += "python3-cython-native"
+
 SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
@@ -15,7 +17,7 @@ PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
 # first place
-EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=ON"
 
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
-- 
2.39.1


