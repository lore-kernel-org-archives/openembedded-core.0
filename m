Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14012D74941
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:56 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9470.1766114568292700638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LvbJiNjo;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1156897b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114567; x=1766719367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+Ui4QIQKDX6tM6b/383GaEi5OERAp1HaqFmfLKsL1Y=;
        b=LvbJiNjovD3BYeWAdFjHjqZMGb3oO4oC4FP5yUYk5HFHlzR9CAJJLt82VZXGWpn5jm
         nYuaXXa7Ca0lgvMO3f78CqClNqfE4kFYRP8qREUwcEK0L2qXHyIixZyLmQKuYbGrcKfF
         Zr4qiEyC3eIUhQ3x7JwAUNr+nwMmvNMmGa1yxbXquIV/9LzDuQD97IW+CBD1qUr9hF1G
         KYcaf6eH5qpp8DhC0x3G4meHkAiwNRHGciwWztPPC8Ttv0qn6infm1z375/GunjWAos8
         FUpJSL9ZaeQCQstLPEqvd8hqX/jmR1WMN516X9tACnHqBl27CGaDwtWS/y7iuAJyYhXD
         +oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114567; x=1766719367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+Ui4QIQKDX6tM6b/383GaEi5OERAp1HaqFmfLKsL1Y=;
        b=YPmPt+hYd+bTAg6zHtbpwPiwAmxlrJZFOlUeEdykw+qO8/Z9cw8aVUUh/uqK/OSzcF
         cbMF+30Y66K49mCrVHCljSp+R8My7vV2+Wu0f9KbEktcVyRnZcdQ9EZEPTUAIcx1vKBE
         K9A5wEneeEa+wZHbzKD3jguulWK7XmpZq7Da6SWvy+yP6pWZ/yvq9+0AS5EcXMpd5UyB
         28ZjR0k5S9MtAeIGkB9jO4uT6nBLcMRdCM4puB9rnhzBUEUJCoYCDpcJqqVgG8zd47wJ
         vJG9me5cf89Esuy/vpsm9bW4Vjy00xFs1T8DeqqYk7XXniym1H0BMYtQ3GtyJi/4dWBT
         VZgQ==
X-Gm-Message-State: AOJu0YzkTCJ/qy9bn4djOqjuvKVSKPazyGPqjxLK0SMFje2FiO9dN7H5
	trpNS+/f4PF1RDnF4Fswz6+QKbQzRIDJMLn37dHFEAzliV3nPY3cWvuIdTF6yw==
X-Gm-Gg: AY/fxX7fSabWySnDAMMGUzWp9h50l+tj+6E3P+5Xu81SRKiQKbppA2UD0lLTMceXmaq
	IJONDTDaFKLbWLGEXkW0AbLW0httiSm4aWbZ6+t0kQBguimUTu71zDrr0lE8wZPAlxk6updh8fC
	DSUtDXdEwBTc/NiSbFkdsSIx6SK54oD94s0jG6E0vnPHijbJU7dxuDr/xn5uo9tFCkMcLfGIchM
	flik+75w97FOYXCj2kiQGtrtlF6dh10yadywuh1kGQU+72Opy4R37Xcvh6p3hY/K0e6AIWFvUgk
	MT+DUSyhU4JyiYnEN5QKCwRyOWudT0eERbUss1rupNKo7hfzQaf5o3hmIYAyK3tgANq68tmf2cf
	/s9fGzbfkg6qieWZWWpHJtPlhrF9apoT6IPDuDf2OwmpbvuRh5VlajVRLx1g5dHbG9GjN2dHT0T
	aN69nIH9Pn0rVYlskTGvhS2EP2
X-Google-Smtp-Source: AGHT+IGLHkgzjItXbxQsLsIAbNym3JTGJBCUO8cF0WiR2QGh4c2UxcLT9djUpvbLduKSNc2Yzb7fmw==
X-Received: by 2002:a05:6a00:801b:b0:7e8:4587:e8cf with SMTP id d2e1a72fcca58-7ff66a6ea42mr1145874b3a.66.1766114567401;
        Thu, 18 Dec 2025 19:22:47 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 12/29] gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:51 +0530
Message-ID: <20251219032209.960840-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228180

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8d9ba1e3d17294c6df297cb0a200745e3ae76c9b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
index 5583c2f128..fa34912a06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 

