Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EFEF8E48F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28587.1776378809414199636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IDVQ5KQQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488afb0427eso615575e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378807; x=1776983607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=IDVQ5KQQbrDKhkEqOLSLteEE0vWUJb3450YWQL7mFK7nrHZluCn54KJIbVE/oeXEKY
         u/HMsLicmHRdeslkViupxgFUYbiXlPo3h69cHbBJ+afRI+dtO3rzI168YwJK+b00gP3J
         Mfr3vTpLejHccxa3hqGPwHbEpplMPxbbieotE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378807; x=1776983607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=ptirEmNXC9maP06pFElSUA91G3VAu8HGDDqGAiGQp90udsPmUFZkh7yYORgTcegdpI
         lWSsbPlkwgx0njcCSmiHETLyZy1FGuZeOPp9kbxgYSFIPB+ic2qR9YTLCj6bIG29rkJv
         mjw+1D4fH3gccG0Zwh784+8SKSwS6yRUw+PsEluU01BpF9s08SmAF6+tXYEsjQTLsgbF
         W4/erUyHpaZJl7gTLuYmrbgAtylgVOOCYjCA/QK8Ydzgcb5zexv6pnSoY2XKajitsn8v
         tC7D5m7Hk3oDyUZvxgQYzYbr9b/UT+7ijUJIGZuN/IGv9Dz4pTZZPsCG3Zibuvn8/1uq
         P0FA==
X-Gm-Message-State: AOJu0YyanLHXySLsA0RhQPWlBRE5CkGGwZLCDQuVlB02zHFtwvZqUdgE
	Ijx/lvlefZHe1TKQ2mFEvLd//E7tpqovrz0OCrasKAGqQD4pi8fJX6AIjsNmR3vnhePwH0sWswd
	S39mfmJx5Y+1u
X-Gm-Gg: AeBDievORmLMs7L8ZfN51I16aw9eAteK1Q6Np5NCWE6Zu1Vgw9QPoirScVWkm9LO/e4
	jsQoqS+p7ieg2U3hvZ/ZMO6B2TweZbqpeY0JzznOrZ06YqONoxJn7ukOTcBWwPJ+vo9meNxHxtR
	STLBvCdiKVT8QvPhnOhYTKTxylp0MO0gk/A6CYY96WKK7itrHh69GagFdTBvbHYDrvFv0qERlKW
	S5b9ZiPipLGYtZXwdvPpxrVlL4nS54uNgkk6EjQTey0Ly+2J8Ixwp6YYRzp4F3+d0wQjTHUIKbd
	sxs0Tu4s0/wlrkLHc4RKjPbBrhuXqiJ31Ke7t2H4rWNormq7XlOEiKh3Ul0pJ7WY+PgNR/LTzXM
	CTtVn+w8n6TpwF8Khk81O6mkMGUIw2aEm8KUiRwkSbPmiyqSd/pAnYdkC2K4R7luN3skXES0BFz
	mhfy1sPUjC0EbvADiBavOMX9TiPUYF/My0WtuP/IdMkRVBq90Xhontwvjjfw94jazK9kRr2Mchx
	AgjjhthjJMhANx+wd3mdQpPWcPb7D8AI6qimQ==
X-Received: by 2002:a05:600d:e:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488fb757d23mr5161585e9.12.1776378807536;
        Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 44/51] oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
Date: Fri, 17 Apr 2026 00:30:27 +0200
Message-ID: <bfdb46387297f7538e13929a64a0a7dbfcf56469.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235473

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

