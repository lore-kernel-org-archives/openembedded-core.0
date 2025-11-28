Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A2BD116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10260.1764310747672430525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/oDCw0m;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298250d7769so10710885ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310747; x=1764915547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYS4aHQoCTZGV3dnj8/f8qDJ2M2q0dZdcejt+bTtOBo=;
        b=a/oDCw0mPiTRRk0Ew+voSoHc3OhHZGgHwkg3J1M9fFl1v/E+tOGL2WKcu/O4G2xzhN
         KipT0GjsffoKqu8B4aJQGQYwbIjdeRwiRthO34JX1cej128Nhd/7A1Tj8DUoEodCoPpM
         WNSgZLexoS286hAE213nS3G8iLrpWzcDt1CVDmf29jEnwYNOypk/OZZMmI0/4qgUWutD
         F8URb6INwITFQNl6nCCYfinpATmPysETnPHOQCcvZ5DAUVPrC7K5/umltMbYK+CZvq+8
         LBdXNNDCr2Zkyqr4++L3GzTByhuzEMYRuP95RJ9Ws1wEPsOb6BNJmvnxxGH5h37u6IXZ
         1YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310747; x=1764915547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYS4aHQoCTZGV3dnj8/f8qDJ2M2q0dZdcejt+bTtOBo=;
        b=LAaHmSndu+FcNKbWKSGFYbxOyOiFsSw6pAkt/hctItYOsZtqTjfB3D4hrmIYxqFy5O
         FGwsuUhcNDvNEfe9bBJlv15O94xIuP/rhAGpylVk5LKVkWmJLXRD52gt9FP6oKXnZF2B
         C/Z/IYwy7ni5S4Y5yPZnbQtFqHihCx4WNBzCXDKSVYlUwlutacJhH87/0hfPKx6qPPjo
         gJhRx+G2Qp55YDbm+aLbJ+f4dWV4zqrqatabJm991x8mEqmMHGKuPwsqb6y9/MC7QDHg
         Xm9bbVUqPrBVKGkMnEs8LqLn5sL+NJ2hW0QPWoGSJ2szsUXIehg04moC4E8TBRiUBXWx
         KwWw==
X-Gm-Message-State: AOJu0YwxzzulN7FFAMEjIsHul7xrWW0s+xSPgktEUaSijCQ3I3ZNfWEh
	6/oCrbDMmTIZPvzhe4/mOAIg/TFWyZV29vRmlf57q0Rplk9Np9uee7T3kR8C8w==
X-Gm-Gg: ASbGnctsisG7IFWnIEjMZO/pybzjGkbgNzU9WfxCNo2hWXocpQy2YNcjOw+xUvHq4mG
	n9Y0bStMojEWy6Hm7FeheNlN992gxGSM1tXkosDodxLYreFZ5kUU8AJYuI+f9te77bh32AFufcX
	QKncS+Zf3Tmju0+9QZJWb50U7TnA3B++hDDnlUDZqZsCoBw0y1xEKnqfc3KnAju4xvABTXKvEMG
	3VGd3uy5qSDYb7jSM0ZzUvgBz2/jRYOzon68dVHC389jzufSVsFAbMBm97JFqLvUfIEEo8RKmvA
	wyCxvvEpjBQHePesSzUZgpkOesi9ptV6VonUqGo3QHgkombrJ8wUTO/1+QblV7ki/DE2DcqUtyL
	UAGtGDus/Wew1yWzjwAUeA1HMldnofEPY5zWMYYl9kjixbIcDTjT8vwJJn3n3SccsMa5ykXyB+i
	z9QdT6D5FQ7slJqM1hj9nDhH0s1e2PzLAiDr8=
X-Google-Smtp-Source: AGHT+IGRaWxwXSQrYtPXVpxB9+oUDIA4nA9PnOn8zUXxrSwR3NPHgquSSls5e7gNfCOOGq0IvAAwCQ==
X-Received: by 2002:a17:903:198c:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29b6c3e83d7mr264322705ad.16.1764310746972;
        Thu, 27 Nov 2025 22:19:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 06/14] repo: upgrade 2.58 -> 2.59
Date: Fri, 28 Nov 2025 19:18:43 +1300
Message-ID: <20251128061851.1634479-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226889

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gerrit.googlesource.com/git-repo.git/+log/1afe96a7e997ce7748f066b206a85ac648f7a87c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.58.bb => repo_2.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.58.bb => repo_2.59.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.58.bb b/meta/recipes-devtools/repo/repo_2.59.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.58.bb
rename to meta/recipes-devtools/repo/repo_2.59.bb
index 76fb2d214c..e447fd9492 100644
--- a/meta/recipes-devtools/repo/repo_2.58.bb
+++ b/meta/recipes-devtools/repo/repo_2.59.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "38d2fe11b9df521727fcca23c9dac086ce8378d3"
+SRCREV = "1afe96a7e997ce7748f066b206a85ac648f7a87c"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 

