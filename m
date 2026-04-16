Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E947DF8809B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7735.1776322129770710476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vJhZHrPD;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso2693975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322128; x=1776926928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=vJhZHrPDy0OxU8sP05Mfp8tur3RiU3orYp20TwhqzAy/KjNlqgelKCIZ/eKfGuSm6b
         krh1zHyM35P2aEggMfjJCLwUVMv4UG2O30+Rry8TX4RqjNvVZRkhkY10kiPrkHTZsMBw
         SzygDqhtPtIE9OBh6nq5vOFODseL107+c2HtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322128; x=1776926928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=AHtyRPIMUcAMLVhnMx6DLiTwTzOSzb1tVgJ9jGB5e26GzDFy6emvoTGfSuLWVIh3Eh
         PJNyNvB29LBJcErycKUEdy3MS/EfE9joiuOPFBTQBM71EGvJhq2LgKa9l43uPlrdDx6S
         VN+RsGBvddvgck6rvFqbhvzBXWaO8DBhLfEewRMxYP8pP5qlf/0+V0CirY26N0x295O2
         ujObyJkYrx26r9wwEHev3pcW18Q52J4JUjLBc3ymGksJBKY2UHgRGk8OBRV9zoVFZejW
         A8PJHtP2mWuBLhU8Mgeylkff8pDOgZUXYsD82Py6GJuP1S94MiCcaXivgXJ36nSVYCPh
         75ng==
X-Gm-Message-State: AOJu0YzB5jMXvSEoaVxX0O6OZf9vUvRmMxRox0sqN7ecu1jS6v9XEFYt
	VoUiYY3ElUDq4o3LXZxUcsgKrWb8uElEGXjw5oxeLj7fltn9IR09kTL57gVeASPpzVujCXZxohH
	7Cx/pjal/jniS
X-Gm-Gg: AeBDietCMslElyktbc2jC2aTTDf1tlzLdC2DEA1eRfN4jkMPBhAb0qKU5Co9pdqdg3x
	2IAWjn8ItB2GK5mlUHD6DifEOfPOCa+qvPJU8NvvtBDAB9oH56od18tVz9Ii8O6YSCyWi+GMgXX
	9xdjEXBe9AwM5U9QOoKeAgY69oiKTvFSGIfx8MkrP4O5iTdDNfqryn2B0WH/P9ZaxUHQTx+QOWv
	tZldDhg6s+fGry3fStvOVC8oQpKDraKpYE9Cm66CXoCcYG+uVIw/VMkrtq6lmuASco3BCh1eXvS
	cO17ZbFrx/MNaN9jKOY75+OT5TARsZFpkeANi60UTLHUcjvQ+iqNu2WmBjm2VDbQd/g5BslhLak
	6C1hsSXMCdodvPeR8i6Ct6TtdxNvdsCGZAsClY3Npg/+bZUbumUXV0JXwruF/U3tWs1He98rmAQ
	rh2VCVh/u6zPhzxZvX94+ruXJUd5R/s3dZIfAJYS0jirZzXIYUjFHZktJ7UnxjJCE88+opdazIs
	Bq2SFeu6UePoy1vNmjVg/dWftNl0gqFj2VRvA==
X-Received: by 2002:a05:600c:34cf:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488f47ea338mr29406765e9.7.1776322127651;
        Wed, 15 Apr 2026 23:48:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 44/47] oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 08:47:45 +0200
Message-ID: <bfdb46387297f7538e13929a64a0a7dbfcf56469.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235386

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Use ";protocol=https" for the parent git submodule and, also, update the
SRCREV to point to a commit where submodules are reference through a
https:// URL instead of a git:// one.

Update the expected output of the archiver test.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-test/git-submodule-test/git-submodule-test.bb     | 4 ++--
 meta/lib/oeqa/selftest/cases/archiver.py                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 1c0886dcbe2..09f6b2e4a7e 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -7,8 +7,8 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
-SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master;protocol=https"
+SRCREV = "f280847494763cdcf71197557a81ba7d8a6bce42"
 
 do_test_git_as_user() {
     cd ${S}
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 612ec675a78..82b0293338a 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -335,8 +335,8 @@ class Archiver(OESelftestTestCase):
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC'])
         for target_file_name in [
-            'gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.tar.gz',
-            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.tar.gz',
+            'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar.gz',
             'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
             'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'

