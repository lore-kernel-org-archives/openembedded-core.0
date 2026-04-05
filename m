Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855EBF3D5E2
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 13:41:28 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35319.1775396482968120216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 06:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=d1ytGQo6;
 spf=pass (domain: madison.systems, ip: 74.125.82.41, mailfrom: matt@madison.systems)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1274204434bso3355993c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google; t=1775396482; x=1776001282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ng+JT84gwO4DHho5zYr2j1t8ApgCQNh4hCWLaaqXq14=;
        b=d1ytGQo6if+kE8mF+8+UtPxbd84DGqe/6iZSTBCaRbiEIXDhlVabpTTbs3aWKLyg3H
         pcd5ByAIKTV9b1i+FrxY5YK0UaliPnyF9cZkYQLPFIOEcq3NMzEwjfcC//qnlEn2MtCQ
         YpgkPBCGPerHry3A8Vc2qiAl7cIcNuJgBS/8l96D7QDBxJeJ8t7boLlRd8Hpotj6OuZR
         yT18dCNugosTyPBqbMcqAG8iddMn1Kup0GJgsF9xP5CSvLFL9fnfau0j5mwhTZk2K/tM
         UpFDWo0GYTXIzje2GfQtyIa5NGlrxL74sTGrJWf/hVRfSGgfmCGTv25qfWli/Ldogi28
         M4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396482; x=1776001282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng+JT84gwO4DHho5zYr2j1t8ApgCQNh4hCWLaaqXq14=;
        b=Q5nE5GrXdoipPmK8nQ/P1tabMvx99Aej9dTZgfHKtwyVNSwSvMm5DRFh9gONlZCtT9
         so54VEva4zu3S6vRD5ix8MSwAQ3BcPK6uZ3GgEIgW9Qx4lbcgqRTbT5w/GcqUhDM31Rm
         KMlgfcsEckNA8XcEXrIPlgZnGBpD4JAMu0QEDIH2DOeNWTJ8Tc0O+DQntKaD+GwOsE1h
         FOlojwgVszkxoDNsCg8ahqIwOsUGo+Bcy1Lom9xAugqNWCRQL/EiNhWKDSOxVbaIBhvr
         phWBXFG9s9dXxbncAgXWyYD+PoAk0PiD9jgxSZIosU6RegoMLZFQghOubeLSd2j9KsTI
         SPJA==
X-Gm-Message-State: AOJu0YxMtuYFtBkJchan4ju7nO/MW5vsgH74OtdVFd2Joebpubu08aN/
	id5IO9362Gs0u8YwpGbqrHhauaSIAxw4cJ1SK7HDLoxoAeynOQAKioK9Ehya39YReVkNeH0P0OU
	LRC+H
X-Gm-Gg: AeBDieuSmGyUaufBzdbl/7aU7GoV7pO0on4TJqpFpRX+eri8RK/XxQoHCySlPV1aZkn
	GiYNmAweIHl/57qoV8TNJkdmy95Xv2nMec2aN98MRSgGeNX43qw+/1kF8fKQ7d/w0wZ/LIFC7iY
	ATUKShedixrhEhqNjmAjSrOI3XIoQr0zg8/uHVWdHkVWiImuT7fJQy2iV6bqaR5vxcD2HsNvk4S
	EOfAJBx8t8sUC59NPUxNoixT60fp2PhmTkGpKkd1k16qAIuIK2YlpyOCTddZPXEF3lV7DxBZyke
	ozdQ9SujeUYZn9D+SbjpwJcmJq6DUgB/6Lv8lx5Fx15dLemO+/0mFuwjcmhnow6Tw8zsjjn1fCn
	LDnhlFvt02Vm0qR8UH+p4WwOookouLW7S8hYAZh5HfmhTYXRMU40tSaMuN6F6otax3cr+oMNU5Q
	0OH8NCFMxmB8tyRajXFUgtvzQ=
X-Received: by 2002:a05:693c:300c:b0:2be:acac:af7f with SMTP id 5a478bee46e88-2cad6ab1abfmr4650979eec.7.1775396481651;
        Sun, 05 Apr 2026 06:41:21 -0700 (PDT)
Received: from visar.local ([76.209.242.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ed3sm10203538eec.6.2026.04.05.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:41:20 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Matt Madison <matt@madison.systems>
Subject: [PATCH] systemd: fix packaging of 'run0'
Date: Sun,  5 Apr 2026 06:40:49 -0700
Message-ID: <20260405134049.1985666-1-matt@madison.systems>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 13:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234627

The 'run0' command was introduced with systemd v256. Its
implementation is in the 'systemd-run' program, with
${bindir}/run0 installed as a symlink to that program.

However, when the upgrade to v256 was done (in commit
89b75b46371d5e9172cb496b461824d8551a2af5), the run0 symlink
wasn't packaged into systemd-extra-utils (where systemd-run
is packaged), introducing a hard RDEPENDS from systemd ->
systemd-extra-utils due to the symlink.

Fix this, and return to the softer RRECOMMENDS dependency
between systemd and systemd-extra-utils, by packaging run0
into systemd-extra-utils.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index c3cb605b4d..2ad0fc490c 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -561,6 +561,7 @@ RRECOMMENDS:${PN}-container += "\
 FILES:${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
+                        ${bindir}/run0 \
                         ${bindir}/systemd-detect-virt \
                         ${bindir}/systemd-dissect \
                         ${bindir}/systemd-path \
-- 
2.43.0


