Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13556C982F8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:12:57 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5246.1768590772585849357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ai+zGkFS;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-5014549c439so2715641cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768590771; x=1769195571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjUvgrrHdjqTIXXhM1ouGeCZQ2c6p0IJJNjnpdBnWNQ=;
        b=Ai+zGkFSPygJFhuJA9mOCUVc71V053q+1KSUvXCjzm0wzyaVKrTpOQMklinQcN59tW
         gKa7a6jcmk6d0yEqb+AF7M+S+sc/LyoKS7uywC1ZrB0wIKSBooEillaWDI8l4u27ozBq
         E6qMKomvwe/M5+eoZIBDRZSFmzgxr5MJbRLNBQRnrX0ib58ox/VUw4/q9IrPD5YK2yB6
         d30Cnzihp06MZbkEIQ/eW2Vi+F/oVnPcuAYBSNJ4RpV/For6IwaFi9RjWRaewzecNBWQ
         3VLnhp6pV0MtBPeAsMySW04emfO6UlWTPn5Bjga5Lgnq+cenZR6eCKMitqOzaCmrT69J
         1inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590771; x=1769195571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjUvgrrHdjqTIXXhM1ouGeCZQ2c6p0IJJNjnpdBnWNQ=;
        b=OSakRJax9sBd4KPuFzwVr+ZM2q9Zhmjmxyfllr28vqbIuyYmSAksv2uO9xm3sH7tyA
         4Zf/yXakk0wSAlELxSv6g8iT5MtWDFTcuhSmOo1BMhJP3MUZ93qwLuZkg+FwtliRD96o
         vAAcXru2Wp//p3T900OO3208tvQnqLbq499OKKU555j25uCyjtoigXSd0hYCGbnBQYFk
         g17orTAUG/HGmia6MGES+hpYSUTIg6/66QGaul11xzSXdDzsCpPMAujRwgPkTP6MBXzg
         BD9+iIK1IeNq5oIvqUxw2t3SHFpy9IzOzFbBhZR2e/0ha+koMdx+9Qan+bVRjEzGEJ9u
         PPAg==
X-Gm-Message-State: AOJu0YyXtkVXD/n25bn+bnNQiHcMEZleWyW+Cf9GTYqB21SW+id35LYZ
	FawGVaENc0EvfYW943fxJk/qMI4mghuZYDu1qEhPw4RSmCsVFXUCMjvJAOWQ/A+dm4fOHQ==
X-Gm-Gg: AY/fxX7ML4Pg89vPHkJZ6CiXRrd6uTqQOR+CO8XiXvd0QvMZATpMKhhnuAv7/k12X+1
	eFAKyw9tt3U0d4VQAOuS2MSGzPxU2VlCrHigR0MinHUWRVOAdhsl5ZbgqgXQ7UHCvTTkRryqPB8
	7p/JCxa1e6YCAZ/BA/psq30ArMszoSuhHJNjFccpoFq1+XU0IGO/mau0D516tZIlijV3VpjX4GF
	2EEdxDghmYEyWhX6+CAWXuhVZkka80wiW8MF/yKB1izuTNx3rjk6EKjb8IWvu6IO5LxDqhXrrMP
	lHYfCgxSzgKBiouvBS4qI/92JBeIHyI/yDi6wtYCKyglPFeBuiH4YAZ+QDopGQOQWjrOjbxbYjk
	M0OIk3KBz/HyMvMGBeX5+9LUbbscfI0Gti3fYVdNEB5ll6XN+SXEQXhHz3jMNtl5Z1SukKLhMe6
	zF4/zYeHEDJM8d8YcBrHkhLQ/bDJjqcokrH6IWy3AywxxEJ3drNdC4Si0=
X-Received: by 2002:a05:620a:cd0:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6a707dafdmr309255585a.1.1768590771430;
        Fri, 16 Jan 2026 11:12:51 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71bf2b0sm287446685a.12.2026.01.16.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:12:50 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	antonin.godard@bootlin.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v5 0/4] generate-cve-exclusions: Add a .bbclass
Date: Fri, 16 Jan 2026 14:05:16 -0500
Message-ID: <20260116190520.118714-2-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116190520.118714-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260116190520.118714-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229558

Changes since v4:
- Patch 2/4:
  * Renamed the bbclass to kernel-generate-cve-exclusions.bbclass to better reflect its purpose.
  * Add new variable ENABLE_KERNEL_CVE_EXCLUSIONS to enable/disable the
  feature.
  By default, the feature is disabled to avoid unexpected behavior on
  existing builds with linux-yocto.
  * Add new "__anonymous" python function to setup the variables SRC_URI and SRCREV only if
  this feature is enabled with ENABLE_KERNEL_CVE_EXCLUSIONS.
  Also prevent from modifying SRC_URI and SRCREV variables in the default linux-yocto usecase.
  Now, the recipe does not have any impact on the basic "linux-yocto" recipe if the feature is disabled.
  * Add new variables GENERATE_CVE_EXCLUSIONS_DESTSUFFIX and
  GENERATE_CVE_EXCLUSIONS_UNPACK_DIR to customize the working directory path of the
  class.
- Patch 4/4:
  * Update the inherit statement in linux-yocto.inc to reflect the new name of the bbclass with
  "kernel-generate-cve-exclusions".

Changes since v3:
- Patch 2/4:
  * Add variables to control offline mode, source URI and
  SRCREV for deterministic testing (GENERATE_CVE_EXCLUSIONS_SRC_URI,
  GENERATE_CVE_EXCLUSIONS_SRCREV, GENERATE_CVE_EXCLUSIONS_NETWORK).
  * Updated generate_cve_exclusions task scheduling to be executed before
  do_cve_check.

Changes since v2:
- Patch 4/4: Inherit the new bbclass in linux-yocto.inc instead of
  individual recipes.

Changes since v1:
- Patch 2/4: Removed the mandatory execution of the
  generate-cve-exclusions class on every build. It now needs to be
  manually run using:
    bitbake -c generate-cve-exclusions <kernel-recipe>

ValentinBoudevin (4):
  generate-cve-exclusions: Add --output-json option
  generate-cve-exclusions: Add a .bbclass
  generate-cve-exclusions: Move python script
  linux: Add inherit on generate-cve-exclusions

 .../kernel-generate-cve-exclusions.bbclass    | 135 ++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |   3 +
 .../contrib}/generate-cve-exclusions.py       |  64 +++++++--
 3 files changed, 188 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/kernel-generate-cve-exclusions.bbclass
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (71%)


