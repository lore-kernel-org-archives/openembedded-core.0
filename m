Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4561BD5AE5E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:39 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2979.1765620035781902426
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wjk7gJ8s;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-295548467c7so23742035ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620035; x=1766224835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRQoFD3EqGX0XKuIqJKWfYqPowOj7zw3DV//yJQOG9I=;
        b=Wjk7gJ8sbtb7iJ35k/m73yZubgA4LVFD2hQLQcyEVoKU3YutAroxcelgcot771B/tC
         LSNEXyzRlhR7rKfMpQYgyv8x4J33HrZ4w6jourE1taTybMAhdr6VbL+COZKypLgFu1pb
         O0B4AdVBlpPoxYVMEkH2jBEM13t5N82Zl0t47/5AuKCrfjcq2HyAL0UlUnC9R0AuEaEV
         kuokhQheQJFavbSfbCD1191wZw7KqQcG2j94hrDFjOyAuP3iNoSk7OjehpGezi+TMbGi
         5RS8EORb/59AQCd1vB7s+cxJFprk2lv9LSnYUG0tuqo9kK1YdWabSlDzEfencebNlQ9B
         IHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620035; x=1766224835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRQoFD3EqGX0XKuIqJKWfYqPowOj7zw3DV//yJQOG9I=;
        b=qLZpYj3sIsjqkI4QXaFTWqDK1puv09pC3lRVTvFu6F1aSivD8hx+XQr19LeVNRFhGn
         mFiR+u9IVyXIXZ4RduXK6/XOKMmyjY/ZOCLtplzsh/lFv6CKHnpp2sIbu1tsUQFqoftO
         TZaDIZBv64mLFjnezSxqil1COlaS4bNyEmEuIzIDOzCJ3fQBiHCgM6AGwtIJ8HpNya6E
         BU/uMp2lDrtG1onjg6Vtsa7eJzcW4l3A3kYNjMAvacIavrSW4qjPwaEPdWs/oCzD5qsY
         PjY0M+rfSqonM3ZBkxCafE/P6LdWTyDFZAoZc+YfBxYgLCpVRa4h3McnFmWYqWR7rtB1
         QMWw==
X-Gm-Message-State: AOJu0Ywg5YNcPHmMTunpfZCLV+ebAtELGV7McjQBEUPsIVYDqfnjiakA
	vizgbe6HwduuOEr7LprbhpXxeOsgby43IAmcmdNKVujD4bByR6YOq3ppz6EuWkt4
X-Gm-Gg: AY/fxX6mHZZAX0kMgQLODttbLDUUi2ZR9fUjGLyHLoK/NzCQqoK8bLpP7L3x7xCOqww
	WBeohOahQJ7mSDj/YSAP2yysO03mIfBeCK+vS/2ox0gdhYPg9sX2U/HbEDPHdRNHobPh0tcGe/6
	MMpBpq3UcuSllkiQgyP/siUqlTGVC+ZfADbxcYtoY3rCgMGW0myT0K2TgL9xuFMLVyNhq5ueM3J
	LQWgL7nEYVtnczBdc9WvEDNkzD0XNxyirLm88yxEwWgEIUiHc2f009/Z0/fnkSPrYeyoZeVcvc2
	XsX1+r+0Db/qYKTXTlbeSw2HDViP7KQkerbY9cC0NFgzp+E43rIPNA/2uUoWj3uGJp2tPlK4M1p
	gXmMgkfZ8BXG61xARsL9EKGkZCdxjK8ldbTMGCwCbDnoT/zi/MRWfujsFmEtH+nN8zLZnjrMqT1
	C7vWvvXSKD9kUk/FJ2hBFWMz/q
X-Google-Smtp-Source: AGHT+IG8azt2v8ilUQ/OGOm+LD0lSKi/xzdJq4Qu0Hly8buhNYb0gThfi6qAxWCnv6eqm95UrMyfxw==
X-Received: by 2002:a17:902:e847:b0:29a:5ce:b467 with SMTP id d9443c01a7336-29f26eff383mr59593305ad.54.1765620034953;
        Sat, 13 Dec 2025 02:00:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 21/67] less: upgrade 679 -> 685
Date: Sat, 13 Dec 2025 15:28:45 +0530
Message-ID: <20251213095931.2571498-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227639

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://greenwoodsoftware.com/less/news.685.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 3c330116c1988b2b07d59c06bc879be1c4cd1a9f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/less/{less_679.bb => less_685.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_679.bb => less_685.bb} (95%)

diff --git a/meta/recipes-extended/less/less_679.bb b/meta/recipes-extended/less/less_685.bb
similarity index 95%
rename from meta/recipes-extended/less/less_679.bb
rename to meta/recipes-extended/less/less_685.bb
index 613c71f571..904980a72f 100644
--- a/meta/recipes-extended/less/less_679.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
+SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 

