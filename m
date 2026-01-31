Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8DAD7974C
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5010.1769846226542442450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xa6R+AES;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4805ef35864so23619715e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846225; x=1770451025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF8dHALoC2vtaipqQDqq8YaFVlDF4xvBFhA3WZ1D004=;
        b=xa6R+AES7s1lGCjVeyDPZqV2Ss2x5A7jNSWEeNS0KuWxfgAuQ28DglW3/WnvlwE3DK
         AWVVwVLOp7HIlhZCsJG84uelK80xgXVCqdNBx+7EJfjX0IawR9SbfeSw5qPa4jVLqcuM
         St60Ry++NqVEQSTwNUXZBy8aYvIRvltCsk8Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846225; x=1770451025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NF8dHALoC2vtaipqQDqq8YaFVlDF4xvBFhA3WZ1D004=;
        b=saPQmoEa19I8+xgz57PNCsk0EFGvynsCkcP+bEp2JBLjt8cpUapOlfD5CnKXRfjwsO
         Fc/Qsz0lvQhALno8mfpKSnHyy0wGXDOLkVMgWTqcz1Uviz1CDshWj4ky0Un7/DJVQGxo
         WPd+hHFEOqQv+uzGJ8J3NA5fowGcNvOfhvSpajYBN0HVwGQvI+qnw62ceHPbbxoP5N4/
         bcNpYjlmNcnQsrWeqmR3AKnfF6unyf1NIIRXvrJ17VqMjS8HU2OdGqI+Ay/TdxzZXhDp
         P0YOBrWZghuhEX0HKYCVBs3OuxOGa3tffbeUIysHJ+U6h7YphwKq2k5C9R3i4hKZRz4J
         Bi7A==
X-Gm-Message-State: AOJu0YyZbhg0COgA1i4Dk/XCFEIadik73I9T+vlt+qcSiT4s9nEvDvxn
	2aqYac4SgQjmFNrngNYrFH2VQD7AJ4h5ZL90sHipJtVGnBvtxUixNJs4kZoE5O+b9zjys0MVPuS
	lrhnHSPo=
X-Gm-Gg: AZuq6aLUOWwZoEsJD6pB1mntdC7ay7Znksoa2TvKB0e7RGkCg4H3vw+3dBoMnAgVAEF
	vjYSDDlrTOET83F+R/qlR5MKQmMfPF8Q0tNUQwsF6+e8pnQTdCHA8ByE/4rZUqZO39j1NG3y+DV
	Nu6ZxcON23DuZdToNFqWwA/I+yqgrg3GMc5l8j0tPakwhpmHZ4keqAnT5WrUzqHIIKdP5oerR3H
	2PR7VNoAPbFaX4l7K3lW3uz6fdr5qAjBqkvQfKodZuI6a+lifmuA4Yot+rx2l0KsuyZeLRdZRXi
	EzVzYx0l+SsKZSMgjGtGlP92kD4/bfLT/m1EABxOP7UKr2IMmRrICSfU6ixKfmlL7teifAyzGA0
	/IS0aqQE56xZdpAwk+5GibEkb4kRYHbV6AygnzKNQ1YOsWMV6x3XJq0ABZRd5MZOTvE1qfwZ+WP
	WTRtEMsp9AbncNp5AjK7JvnRzMpzBKdKAWX+V4uRkPm1f9X4BfOEfGZE6Nd8ku9hZA80abAjGrk
	vun4UVv7eKlYunp
X-Received: by 2002:a05:600c:680a:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-482db45171cmr69155525e9.9.1769846224680;
        Fri, 30 Jan 2026 23:57:04 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 16/22] libtheora: set CVE_PRODUCT
Date: Sat, 31 Jan 2026 08:56:27 +0100
Message-ID: <62a6e93e4ded807cf451a7c390b86f49e8822c1a.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230221

From: Ken Kurematsu <k.kurematsu@nskint.co.jp>

In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8ddda60332e2a3219e905c1545b5da917f855c6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index 04de8507fb1..bacaf3aee66 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe
 
 UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
 
+CVE_PRODUCT = "theora"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples --disable-doc"

