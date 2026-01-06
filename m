Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31198CEFCF8
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:10:22 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98064.1767726618576580817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Av1Tkofv;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8c35dfee1caso12517885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726617; x=1768331417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCUKq+laV0J7hfpjN5D9xo1MqMnprB7GG8CZeTaaOYo=;
        b=Av1Tkofv9l2MuTk+/r+UFDI+wZQnQdKM46mmGkYmDmzmadH0tYZx7EgjqAFJ9GZv/4
         oqcgXuy3qzZGafURZG16fmq4/eQYpXnPvnt6nm0mClxnpZc9cGpg2Opf22u00qmOXuEG
         zwf6TRdeGIYay5W9wzRgPRWmzrBOwcKUs/HgETzm41RbYNs0wOU6Pe9nLh+NzJqLXeHx
         zlXX+jWnjMOi412J7eeuj17mN4iHKDD+SGcJHnFvqRN+wYeCmtCj7lZutOFyM5BlzP29
         HHpFWEFT7zojT8Z47idxghIv7tn9TXOgXoBOfydEgtQ7PYsYq2UtTaGERUVTJIgTnlp8
         K3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726617; x=1768331417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xCUKq+laV0J7hfpjN5D9xo1MqMnprB7GG8CZeTaaOYo=;
        b=eri6smGHmNBnbGCefSGjmd0K+WXn9HxSqfEESEuD0vw+zIWar9TdqR3qcX22KIfEOD
         jgLBUa7vs+bA909oQIilCUTfwXjSKPAmVgp6vsyayeQVJTaxIRAJVdmGNsVnd83gxxJp
         jb5y7e06PukUaHCcVG/g4Fp8IMRF5u6BfVLujB7X+3D1qFLaGSMuegEl8cRFg8FbI30C
         Jng1jrCRvIVf9j7dPAb/SOXG5EzE8dQ1VN2Pr0T5RnOFtUJoopG4AyIct3r0a4l7KpFI
         IE8jFdk8sIkKgctav7YBDLNSsDnjB21740BxO768N/PS21exB9h6fxl1gHlhnJFCxnAj
         ifDw==
X-Gm-Message-State: AOJu0Yx0FpWpemiYocD4d8QS+V7EflP3mgqpAU7/zL7vb0AjGrtcYVfe
	aIpUItISbTfPLWZ9FvdKsYrzkSpTqui6XYFiXvAzdwJP6ex40bm9v+QBf0Sf9MIr00w=
X-Gm-Gg: AY/fxX5ZFDtx98bPbyHdLsq0h0chXSsNR/+uf54amglJo7JOTOHCo0P+43Rq9UyXtp3
	oc7eDY0n2rNdbi0HKcHxjnmwosSQagY5tJVN9zum+HKFoBYjcoKyPBzprj1cKtrvnmRweRGb3Mz
	Jd7fjbPiFQidkJV+eN9ajhm169KOHR89AhFjSJh7DUtcIdxjuXdyd6OaUbT1CiggMBEGKi98AFU
	vClYAcH5kPhuCHRzlFY9v5Takw8pULyVoDfGFFEyrYSRxmC/xmJhxOYPt19SBnHNr+rV9PXmr5K
	vjcUv3j9jFCPSuvNM5aghmxW8o1PlUtT61usjrrcBQS9HabGd8xTArRzDuWoX2Z66xmOgRhyimY
	lVtdwC+v71mex/nTWOz2bNRrt+kiV4WViMeqvu0b87k+h8WZnWV08m5HaZ3EFlWohOyvrZpYFQX
	13sCtcx8L62KFWtu2WZKlN49BUXF1S/PyvM6zG/7mWNk5suD4EG4lFuJU=
X-Google-Smtp-Source: AGHT+IE5+tjv9j3UdbbRNMNP58k1bFrfzU6T7LjorwmIGbPIBR/aJXqM5Lb6ZA7ErQ6L13q/7b3D8Q==
X-Received: by 2002:a05:620a:1791:b0:8b2:9aba:e86e with SMTP id af79cd13be357-8c37ebdc347mr395170885a.10.1767726617543;
        Tue, 06 Jan 2026 11:10:17 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51c05csm220480485a.30.2026.01.06.11.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:10:17 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [[PATCH v2] 3/4] generate-cve-exclusions: Move python script
Date: Tue,  6 Jan 2026 14:10:00 -0500
Message-ID: <20260106191001.3385117-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228919

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification
---
 meta/classes/generate-cve-exclusions.bbclass                    | 2 +-
 .../linux => scripts/contrib}/generate-cve-exclusions.py        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
index 254ea5531d..100d2e99b6 100644
--- a/meta/classes/generate-cve-exclusions.bbclass
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -28,7 +28,7 @@ do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://g
 addtask clone_cvelistV5 before do_generate_cve_exclusions
 
 do_generate_cve_exclusions() {
-    generate_cve_exclusions_script=$(find ${COREBASE} -name "generate-cve-exclusions.py")
+    generate_cve_exclusions_script=${COREBASE}/scripts/contrib/generate-cve-exclusions.py
     if [ -z "${generate_cve_exclusions_script}" ]; then
         bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
     fi
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py
-- 
2.43.0


