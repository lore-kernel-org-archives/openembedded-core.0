Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DD2D6ED35
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:42:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10852.1732196547841850881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xcpcibib;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3825c05cc90so405828f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196546; x=1732801346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyQd9edD9v224KMRYgni37ssA5wpXK5AXhO1B4ipv+E=;
        b=Xcpcibib6ir38K+U118kJViom7bFU27hztEn6CglPzUscoz3UsArsgiJJyhPC55U8i
         3iaBiXdWS8zXOrJ0Cyh+Nf45QGbKQROCZAdJzVYGA9Zm1dMTCQL6nZfMuBqIopon96kM
         BTJeYnRcSYGEoaTvtEJzI5Xnpx+xdHJt6toU7/wo+rYM10wsdT7Dij+mgAv5j7qth2Vu
         +3mX7XEoqtrI8haa4viNIQPSXsfcaJz5H4Fegq3fdwpL8LVXIyQNgA2iGwbglDe5l4vQ
         LYjNyjts6KwucOhYkjwvG60c/n8Yv8rFmNJ3B2WzmEMeOs8l22m/Ow6w9ZP4mXvyuL09
         rI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196546; x=1732801346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyQd9edD9v224KMRYgni37ssA5wpXK5AXhO1B4ipv+E=;
        b=IiRSibK0YDu0YOMxsASlQdLShwmyuzVtCDtY50BpegjSliE4TID9yEKHeZ4IFejP+n
         /st3A3jWHXTi4QwEQ5CjJ/hJTOVwK+OgWkCMBfM9NwP8zfgh2iL+hFNC/agcLSINiMPK
         IMJ/Kjj8iJDlgYND2fc15bFsIjozbo6SpN6e+ldwOpHS+SgxXBO4n9oMSnEVywzjKroM
         FCQTuC1cKGl9UN0jVYGm+kO7gyfT6XFzH7gHk03idb7K12xrmCO07IMQv7WqzqkJuuIX
         DLR3P59gLVH2938h/Ibf4kugVMniFgkFeyo24bucYzyMgEdb1t/TsN+wgDUE0hGziMLj
         K+xw==
X-Gm-Message-State: AOJu0YxBQhhgnIqyY/R5SBzZuifDA8pWkkvOshecETG5oSOPBzSc1XvG
	tO/PY3b22Nf2YK+M8DxodOwJ4jNK5YOKqqYX4qGrY+hwk25LQvgKpIAz5w==
X-Gm-Gg: ASbGnct3rHOAKtiZBCi+H4hoErZ2NtiUzeFM0RUy5G7zkmCN2B2FP5t0qMr/we/j2lv
	NOQ54sJkEi2+6rSzqTNSXAUL9z7F5QAWUma4HphfenCOCaWV3MphYUofXpXaIMZckns49U2dk5A
	2Df6MyRZ4P2aUdZ3NnKZNYGSScgMcfO0aqgoNidfPPdmGYMM4Z3+AiYfpS7g8S59ZEXfe7q/RL0
	Ls19pcpNtd3TrghQ6VpxaXAKBc79kOka/Mz7H4sIb7Sap35Y5aJ9jAkcTJDSGS2DkjuTJBwD/FT
	pHxAU0Z6vWs=
X-Google-Smtp-Source: AGHT+IEfZqDy2AjFmKfdRO36Sp3L/YM4BWRtw0UvVdb6Iw6hZ1VeknYtmO4QDZ1QAt0dyOgf/RpUKw==
X-Received: by 2002:a5d:648a:0:b0:382:4eef:26e with SMTP id ffacd0b85a97d-38254b1c86amr5004173f8f.51.1732196546079;
        Thu, 21 Nov 2024 05:42:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549052c0sm5225598f8f.7.2024.11.21.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:42:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [styhead][PATCH 1/2] package_rpm: use zstd's default compression level
Date: Thu, 21 Nov 2024 14:42:17 +0100
Message-Id: <20241121134218.1072729-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207531

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 474d2491eb0..bf74091da43 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


