Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231C6D74946
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9330.1766114578709794715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaRBul3y;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so924301b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114578; x=1766719378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsYDAAkTd3vcRnWwQP2EC1VP+1pjtlh5eEnGxojO4Dg=;
        b=IaRBul3y2VdQMvvsUiJpZJPNi4mDDVWOkPO6+RcpArFGMgpZ5ACgW/0kDXIKlxOI8g
         O1GISZbk3a7T5zXUS1s/zSCe52e8R+Sksr9FdCh7cLxvksX4GJXcNy7IO2XHbSZQJNnT
         h0czASJAE1XMF9dkU/bBhSicZurXmDh/Qnq8Mid17qNH4LiykW/Orsq7qOnIfwXzJS7R
         4x/GVYUVbpqFVf2272P6MywyGH1crx3+sHHII+Hm3IqE6JAGNDwnw54q4UIPQwWwXTNr
         zQd9LfijXszTwb0S9jtpp+eL+Yy2b8p2awJ/irwfzsOHU0DmbMMCLHsnafFaWl53zGnT
         HJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114578; x=1766719378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsYDAAkTd3vcRnWwQP2EC1VP+1pjtlh5eEnGxojO4Dg=;
        b=G6HOysBYJub9zo3Wzg82NPX+GTnekFF07xYwMo6fez4QsE7wkRtjzWQwLI0GeBrvWm
         SEt48J+46wVtaJfdSDu080D3+odPgHF3LfggWTSelo2TE5NBTQlH02DoFFNQ2PBNVIrn
         5/gJIPN1s95CDP/3WcgI6MNHcX8eYjyPda82cM68YptxZQeIPeqFUXBDBSSNXGzEi2/c
         8/SgNGD19MXfDsFWudFn9zAy9iomxX5iOSHOLxqi4j9won+6RSDa/+DU2uiIOE1UnVsJ
         WlXJu9zus15LUe/JnnDLNyCug0qH5HO4R3kEE2rcN7ENm5n37uLOj61d5Yr2poRsA3dm
         RhXw==
X-Gm-Message-State: AOJu0YyWGefVn6Ca5c+0Jr3ikNNP2/oumZ3sTkKEk7sNrQn68Iy1qJGn
	NvhR/C4kRkW3DWa9IZOhSb5CC2D1uq95if5F1yTI7tvpTNJOw+sZDAvFWNteDg==
X-Gm-Gg: AY/fxX6VxNaJbCLvljcvivePTJlghj2E6CSvVA82E5vkxA4rdI0E8VSgp9tS8rTgH7U
	Aq7cdd/ybbQQN4jpf+wiSStrEBjNIwqtovSEo8uOdqhrKUTqz5Nppr4NQck6H5gdNboUO6sJIZ1
	BRfu2sc7TveGQ+cqfQyNTc20OEDU6pSeA+OZGj5QvJSxCM5jWhG5wnD11bXxpqRfG3AhZvMMzax
	6q4cFw/tcgDdEOHhPZqugAByopAgbiTzm/wLugHQ8R3HuoAHrt8cLWHRuhtedkM8/3XexQvbbBf
	hckmDqNo5reGp/F8LMo22YY5/mXPbYwVZwQap3/UMSJveKSRoU4BKbmQP4mW8JNkkpavXHPKiNL
	u96UqjT6NSSAeHhJEizg9tghSOJC+7fMbh0ryWJ8mC3bCHBFshc7bouYlKBs8jFIhLd1Uuv85HY
	Hiuu5WESC1zzYJB4/sTwRHoNe3
X-Google-Smtp-Source: AGHT+IFeWWMOJA2SyKMR4GCcOJxKcUq6p/AU7KuQpos1utu4ApX1134ef6TrGUleK8/jaE+D+MpsUA==
X-Received: by 2002:a05:6a00:4192:b0:7e8:43f5:bd40 with SMTP id d2e1a72fcca58-7ff66d5ff50mr1291850b3a.44.1766114577918;
        Thu, 18 Dec 2025 19:22:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 16/29] gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:55 +0530
Message-ID: <20251219032209.960840-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228184

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 7d2536a8a83aa030c41ebac9ae831220906f41a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...streamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
index f61125105d..e9515405ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b42d44db63f3195a6f33296e1ead32c14d01ef27452b7068f1a2d86624f55ea9"
+SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"

