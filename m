Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9686EC44509
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6517.1783510832195471382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BMqV2CjM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so4429045e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510830; x=1784115630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=krfguc4cuGLzV8SYx9zTzbXTKcMLBIhgJvuzgv/eGlI=;
        b=BMqV2CjMz/5IR2XAtk10GRi0XWJXc78zZL8ez2R0KNTpwh5AEkEN26ZWDFHWp12NZL
         jAzLW7fe5h0gNqrLnqr6TUCirvuN7Vzq8hZt+v/N23BVmOaDGyWTAf5qwixEorlH05NN
         h1nwPz5kh4Je9BMDwlt0LZTQB6/gVlNAr7+XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510830; x=1784115630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=krfguc4cuGLzV8SYx9zTzbXTKcMLBIhgJvuzgv/eGlI=;
        b=A0a3jBddbwprp6H0stBqvjZlq32uHJLdci6ZHIitNdZhaP8pyT6ySLvIr0BQQLXTUK
         9HZHPS6uMJLdaOjrGQhZweImK819cfqZcO59DBfkEKWxhUGFQMDtmhUpap1nVzi8gza8
         fmLDXEpPtwzZeNzW7PTru6hyxiQ0ioBgXhL9iLPQQq+rPOO2a1cjHm7wOsxF5CGm9Fd1
         iEOrLmFTZiNzrabBT0XCCzaAvR8TDbnLqqQkgHS0iqdwurJFR/YsgzUFwbLF1MnwnwD6
         0W7hSGK+CE5dm6zC5Pdo3FZbm/TqeV1z42fve9C1r1sqw+e7ccax5BxGvX9UWwwp42W+
         13Eg==
X-Gm-Message-State: AOJu0YxzcuVAXz3bLXOPlxMDiIUpoGahFh+ovMcB25wiAbwNZcqieAJB
	y08tE6k8r8SBykJOebeKyXxsOenrmJDGkbnNJawuAJhhnvhUVxPSYuFAkBAIoK5cgT3PC75M8Cb
	fKbJPA1g=
X-Gm-Gg: AfdE7cnGV+Pzn5PAJMi4JNzSyHXTRhwrwKD7xuPn47DQ85ZWOdh8uV/qx5/6/56dzW5
	66EvQALYc4dsX7JKa/wsozUP2kk8n6jm1iWK0ZTs9VOE7fGE20UdzZZh7tQM6N1dPSRPCL1hKFS
	7Ck7myp5Fz2dnC7/hIE5qHhFSeEL7Wf0noAp6gZ8hjm50FVF0SyagLXzjBvM7mqLUuI5V3LF8aO
	WxNjjdZGuRowfAkahq57ZLsNab0Ub1emBh3ieY9pKhm/zAML/1Lw0NKm2cp5s8gRZqXJRm+JyXP
	/cjZjBN8Ut1Wh38E30gQZsaEKPHIbmKjOFepL8FWQ/5+ygVXo2XISoF9qFOpRsQbmxbKsMKoPMt
	hd3sBHNwyectlqm2MQnEH9xt9RxWa6ydqmAj+VwQ3Yl1dpXcNOFSEtRLmonD3nOSf5aV2Y4l25U
	uoeOhr21+vAfChXgSrlDi5DkPYCvUcFD1vdAk/NLEaFw==
X-Received: by 2002:a05:600c:3f0a:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493e68e8195mr21821265e9.29.1783510830315;
        Wed, 08 Jul 2026 04:40:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] xwayland: upgrade 24.1.12 -> 24.1.13
Date: Wed,  8 Jul 2026 12:40:17 +0100
Message-ID: <20260708114021.3484868-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240470

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
index 52572bfd21c..41bf1687a28 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
+SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

