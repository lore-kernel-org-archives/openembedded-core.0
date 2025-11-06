Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D063CCFA1A
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 11:16:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12589.1762427807678722242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 03:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K1EY1Xu9;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2951a817541so10848095ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 03:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427807; x=1763032607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsDJ4ggBvNJPBlivv/3Ad4A6GS1rTQsg48PsVtF6W1E=;
        b=K1EY1Xu9LNMqZKZYpILb0oK/b2IhFhmf0LkheOf5zk4aXTEpq0byTHrT+Jz8/oLS+4
         xc0ICQw/zZg713GFSTI78GLL9MYmdzmXDKzAE8y4FG8FIGBwfxyNdHN/nZMs8U8j3Squ
         FhPAWDDviEAvG7HdB4x1ILEGLJ5A/1yIGz0SzG7e5UzSffL+rrq/bkK9SpGIwmOdv+kl
         1HF+b+/P4R0p2dNxv0fteKOoi9j6y/n3Wy5N0bO2G2KW1stWocKHAG2vxUD+iUJT8+Vu
         eOd6g5sowPkbjeQgsYGISCvKS7Q3wM4lYkz0uwbNW79rGc2q4VY3KolKKxfRLRa4J+e/
         jeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427807; x=1763032607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsDJ4ggBvNJPBlivv/3Ad4A6GS1rTQsg48PsVtF6W1E=;
        b=iyfvEWIlT4mC/vRvtLvW8JRXUWZ1MZXe01w6K5xUwvjLbOv5Z2hubfqIeBxgoHzwca
         WNPCrj9z/h+opWDwXiKwtz66d7Nio/bPs8Szuhxi3zCcbo8yYumyihgZspyRiFbgDlns
         dfwEEj8FSoWuIQcsbnRw3GKkI/p6A5l0dpHujK4R9lJMa62u40ltRZ8ZRqoPcwgMl52v
         2SWkJjqoYwPsFJQSJkM0tyMcg3T9oHCaMMxW2unJiiwAgzu18UJAVCpXDI3+0SXBktZz
         6QIrSOoQ+D5zTyMVoNGWn2viHz0bJtKuCojDivDncag5I4ft+LrrtUH39fkLvwNJ89AD
         Z63A==
X-Gm-Message-State: AOJu0YxhcrlBGfA3sM1WuYGMjFRHchL6ZtRVY5aMcqKfbqogwWRlDonV
	sY1T+PWkjeMq1UJ6vGnqOTGf3FLu99r1+uFpzGID3V4IZiYmS9X4C/lkCulyGg==
X-Gm-Gg: ASbGnctzGB6wdY15ZIGTO1iXTQ6CMgCddFFxFjUK9ws+VmzZTTlxI7fQC2tljRPIu5U
	AGAIPlImKryw1LvojvBQFhVwRnQfzRLH1y5zqMJdrT5d7jcZW9ORcwOxfHZIjfDRLojXZTTweCZ
	Gffj2B7ceVqGNxtKPq3VW5XD/yH7pFnUnFjp8kvAL073XkH6ql+8y0oE43QgndW7wD4jadd0Yy+
	HxKeBdo/WvKr2XFPpqmcy1DqTOWe61ZHlr4zBUKiIViQZze+Xed1K8XGiI5uT51/yQ4Jq2/ucgN
	0Jb+MjjzB/nFn3onpoWNn0TksbskDDtJXYiAlO/8wQdx+49FhXTi0ARMIbvyo7UtNGyxwPfO+zt
	EqXzMgb0xoDDvzzM6Y4XaQ6fIOErYVFQmEyD/U9RIwq4oTcU4mRbxaB2l+zyz3MLpvdS/8l3s3F
	jK5f5cTzMcmF+REw==
X-Google-Smtp-Source: AGHT+IHsi0OTykBBBIib5RsrD6ks0ohJksiS/1CLL6QUc75YVxq8MYBLAN2fIGS0XmwGTz0kj5cjkQ==
X-Received: by 2002:a17:902:f541:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-2962addb63emr93279665ad.61.1762427806855;
        Thu, 06 Nov 2025 03:16:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f201sm25235425ad.55.2025.11.06.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:16:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/5] resolvconf: upgrade 1.93 -> 1.94
Date: Fri,  7 Nov 2025 00:16:24 +1300
Message-ID: <20251106111627.1264723-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
References: <20251106111627.1264723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225972

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.93.bb => resolvconf_1.94.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
index c10c57267a..b2c85f9593 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.94.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
+SRCREV = "505c258d1efb287ffdbf132531a86437d2bf0513"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

