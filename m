Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41650745FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 16:43:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c8-v6so7321126plo.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mcUFX9Bj4S7aix2PZO+jRZI1hEXzr7hbgsV/s3R/dfw=;
	b=JhmuGLJhXDTSfQL+1ppFUngWAImW+bvHAUCnq40nRY87ypFKOvrAmM62C0ue8XYwwI
	f6RmCKE4CtxzcjvfMmyUuHpEe3rI/fdeCtnhQJ+oYKU1VggvziS8gwcnOeLW5hG6vZVo
	dkjE2EYX8hgWJ0YRRe2jyXMDSmgMP6CKgehnZNeXZAlIamCqFZ5jmV7/Tvs/NDbsvCpl
	eeMr9RVm1S2o2oVT/XCtEYwE5qFGCZGett9T+gTh9q0kSrjG1i8M8Ol164QgmMtJKAHL
	y9iGDmfyz6wIyEpr8lee254MSsVEcatTAljKS/XX1XX9McMmf6PHvyBbGu2AIHuae8Nr
	Yuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mcUFX9Bj4S7aix2PZO+jRZI1hEXzr7hbgsV/s3R/dfw=;
	b=uZ8QgVjmRmWK4wtT4aGabIhimyPbm235GjiKvR4QtCuKFF45sAMTKy0++PTCAX5rH9
	xweOIgbdfhGEThXrPo5JrY0zvuLkgCM0SX27V+ew1bFj+ZBF74PSxoZAlMqifcES0wYl
	qYxjuj8SDoPYPMPl7g5BSrvJwqUndj/eVIPEWVVwgWbBuCYYZ2vgf0ECHR1Id4rsfL9m
	gHEUZWwKwQ/lH1TW+829qysJ5sW/0QwEVFMsqb7ayyVzaP8UFMHJMqleDMtptcOMbw56
	8u+q3hALVGhPfETf02sYBVzYM2BUVhqCEujYIRBZs+Uso08toXVJIJQ6Wnv2kxha/ghb
	/olQ==
X-Gm-Message-State: ABuFfohEROGpxgliTuo14Dqmw7jGfaT0+tiCtBHt64P6uboiAmQm4ods
	6Idz4uBVAqs7eSheRTvUbf0IG+tZ
X-Google-Smtp-Source: ACcGV60er1Vp++Z/NfKW6uR+xI0wC/wXNcZGWtI0sDHqlNiF8i8Crj1n+Df2TW7ICFVCNzaZ2JeOwQ==
X-Received: by 2002:a17:902:4222:: with SMTP id
	g31-v6mr10632578pld.281.1539449006928; 
	Sat, 13 Oct 2018 09:43:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	a5-v6sm6247346pfo.53.2018.10.13.09.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Oct 2018 09:43:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Oct 2018 09:43:18 -0700
Message-Id: <20181013164318.5559-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH V2] glibc: Do not use thumb1 ISA on armv6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Oct 2018 16:43:26 -0000
Content-Transfer-Encoding: 8bit

This does not work and is unsupported so lets compile glibc in ARM mode
always on armv6 SOCs

Fixes [YOCTO #12929]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: mark glibc extra recipes with same ISA settings as glibc

 meta/recipes-core/glibc/glibc-collateral.inc | 1 +
 meta/recipes-core/glibc/glibc.inc            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index aa871ac83d..536edfb040 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -9,6 +9,7 @@ HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 deltask do_fetch
 deltask do_unpack
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index ddf0c6b80e..99c92ce46e 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -56,6 +56,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv6 = "arm"
 
 # glibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
-- 
2.19.1


