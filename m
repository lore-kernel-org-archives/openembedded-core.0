Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CA3D5AE52
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2957.1765620005479596616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mg71OxQw;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29efd139227so22938735ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620005; x=1766224805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bdpDOT+iDCqggngCl3/b0vNrHNrx+C57dvupgzkPfE=;
        b=Mg71OxQwhWgMiEM2OtQpPpIpPLi/1XyxqTFvsrnsBUPbuE0al3o52r24ZTemJLnbBz
         ebspRd2aV6hN0CLaF0FCozkEMqV3HlXCFEWJDVqyaJk4QlQcHqrBEE1dvJ+BhC5DfChQ
         sxvkWGpkqIX79bZPYXGIrn+DIEEJQVwdxfRHnM0myzw25swt41YdMVlE1Qgx2yB+FSux
         SQ0ie3Ex6Ry9eC5YErS0ZtrPWCLq34eUkSWpQNydZ8rsiiBQ1gNDqjgj007PuxkyJfoi
         AA4hTHli3NSKcvAbZPGqyNczOXvuhRQ6Bjg+uRRCzDSwsaRLnkE2X0kkrg2mZLVOuWaR
         5Ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620005; x=1766224805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bdpDOT+iDCqggngCl3/b0vNrHNrx+C57dvupgzkPfE=;
        b=dMWvLuDvOb9mnrk4afU0UHWq0tbrU5sBf0QtIIwGpAvkJP4PNoTVuGXnu1brhfaFXw
         lh+9vH/aVFYYhkFv6xPfT5JEplSUcpuAQPz/t6wN2YEaLMrp4jZqtF/hjGaG57ZTX/aQ
         A1AShE7e+5jp1e35BsvNE3nb6xJKIvNHpAS/C/mFBBXmjsTIiB2bn8sxcADFlp2S5bGg
         nZbeAC4Ls3qa9iCuYvr3DN53TiGnEKZOr09E20Zs0SNppzQbiGl2s/WsCdtbrR4bnGuK
         tREDeOYWywrXn0h/CzaUOr8yjymJKhEgXjJi4Oko82DHFOsTtXv7pVgxe9ws/Vibkh74
         XZhw==
X-Gm-Message-State: AOJu0Yxyhs74M+Z/Na7OQf1EriZfGEcstMsmgyuH7N52xigoFWI0IRML
	n+IRr1nArhTD2wwyVCcEeLkUV38zIkLrYpeQ+UCJBvJcqTwYuRcwTTXQzYt4NjaR
X-Gm-Gg: AY/fxX6zcHMhtONqcmE7EW+gOYiWdElZab0iJlHXc20E8GrAp1XSJ8bbDdtO0VDXWhp
	Ak2hAl3FtNUGVAWjMrivJTeXLPClzFmXG9Vp8kIr2OAUCyDv4+sMgW9sCcaet0zxhcbG6V/RiT0
	ffbY2YUo7FiUBXUxihZr6ukCpRe5M/8gJKPiZxVCHfjVShQHRKM+YtgkatxzCw+eS6Mm0kIiO5T
	MbKHjYQKWW3VDcjgk7Kwu1aQh8Gh1HhxyR6XTd7qtxvwAT8rQLj2zvepNqNDxuUGvv+rkcMF4zp
	hFpkJrk1jEc7z5xvfHL1BzJk9bjbFqF8hQQ2SR57cYlym44uGI/DiH/3LNFOophycroI0+TiKpN
	fyUC1vlv9nICkEyZPlaNalS9YcvXX6M5yHsD+ZDD32YzjqUVnGu09ODhtZygbZTCsYvTjWNBuAu
	VvsF50N6IBK5+A7QVHlpV6FhEgZxFBwlZmZuk=
X-Google-Smtp-Source: AGHT+IFGjPWEjwSSBEKKDkP2OLNp3I1Jax6hSjxJeCljRcq6Zlp6yzzhdumhYjLeEQe4Mh3/v9Qikw==
X-Received: by 2002:a17:902:e78d:b0:29e:a615:f508 with SMTP id d9443c01a7336-29f23c7b05emr48071315ad.28.1765620004693;
        Sat, 13 Dec 2025 02:00:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 10/67] systemd: use "+=" to set PACKAGE_BEFORE_PN
Date: Sat, 13 Dec 2025 15:28:34 +0530
Message-ID: <20251213095931.2571498-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227628

From: Ming Liu <liu.ming50@gmail.com>

This avoid overridding the original PACKAGE_BEFORE_PN value could be
set in bbclasses.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 85eb46d62f81a1618b5d16863808a5ddb248fcf3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/systemd/systemd_257.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-core/systemd/systemd_257.8.bb
index 549eb7fb29..20fe77fb13 100644
--- a/meta/recipes-core/systemd/systemd_257.8.bb
+++ b/meta/recipes-core/systemd/systemd_257.8.bb
@@ -412,7 +412,7 @@ python populate_packages:prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
-PACKAGE_BEFORE_PN = "\
+PACKAGE_BEFORE_PN += "\
     ${PN}-analyze \
     ${PN}-binfmt \
     ${PN}-container \

