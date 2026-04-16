Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8C7FA0C4E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:06 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26350.1776373737401838474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NpWKBM5P;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so82654825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373735; x=1776978535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=NpWKBM5PyuoKzyEwPZo6KMVHymxZfE+ewdPIwGXPkfdthPdRcVXi/UccvZ5MDYrEID
         Afohxd2B5SPXJkVXIxHNOJIvcHd6cG0EwfECnT/1q0AIapGYXamBVCs6vacDut3eHG9v
         RmHTy6MIbVgyA0QoDU3TJUNp4rZcGk2RJhJzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373735; x=1776978535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9Nnrvx4/eK/kurTiCBxu/SuYuMbkiFrB430vDHwplU=;
        b=pWl3EDMzFIZlHBmXDqrX2+0LVbBh2D2B9Ie8rrU3R6XVPqNcL1xbIu6jmqu11aegRv
         /EJN/1KA8WwvU2/VBbe+wzJJ0kEP1XxQDppy6IzZ9FEkRmeDNJsRcViobBV2uIlJsLtC
         ZvkiihDGQXt7lbPnKtUGJocnjF28XvbCduZ1Ir5BaEF248DUkGPhvJqEynI+CpI4tUMb
         mj9SekZTwHfcguyyrmpes3+qpDHGvF0428p2DuK3yvXSY4D6DIhhad7wy9+9nppHSLbi
         0CVf6YeHZzz8bdJ+ZPUP+pVa23R92xUHscEasqNzqjQPH4ejIe1q2rjHxFqiY30batRL
         WxMA==
X-Gm-Message-State: AOJu0YwKVjS/CknpdgZCZJGTBwKqSiorbnskyjP1J7s7LEdE1UcNa7wN
	LaEbrQ/L5XtyPihnSeZ0rP2K+hLw/hbzovAnKtuBlEVxXS4ZtNJuZQ7LvFd2Np9qWxMMJl4RDtm
	6x74RrHXoe3iG
X-Gm-Gg: AeBDiesduvG3gEtXBha1jNjBVSPGhL2XGUt1eEoucHUx6bE6OABqvSoNsgo9nRcdAAv
	dwzhWt7glZxqZPVR/OSLRUex5kooo/+8HTEsUWunt2iQ++DMQ7acZkR4VYWpHKqD+4zJLKnHcqY
	xN5wAKWv6SgzopHELQp4ngGteQC1xDc8uPDxKKm+qP87j3VeYuMLQyM/h21hCJF+F9IFP9l5SwS
	GCcNYdkwlUwsbyqc67wH3xU/iF0w+CvJDIqHsFkCI3E98YP7F071Ujus7EHhKL1Yfyepjf9MDxP
	1kEmB1TTcNDiNp58WDu2XMMv4fwSApUQ3IdleG3NZ8ubg9IoDzN61qREKShBI1xtUmbfkyQe9yU
	/ermLWTDKcygnu8xzMdq/rtTDnjE5scdN8mM7FNR6O2rmS0ogsX1Glt5o2iMiO8YVXlAPBfspXP
	/4B5Cz+XV0Pd9cdCMfUAjMqdrM8LiDRBQOEuAqjq+qvLlfxd+Z4IrOFMpApcEtCNAKi99Uj+VdF
	enJvhGwJ8flqJW9R7b9Ue+OefoxWBvnObBUcA==
X-Received: by 2002:a05:600c:5492:b0:488:b1c7:b432 with SMTP id 5b1f17b1804b1-488fb787a6fmr2807045e9.24.1776373735412;
        Thu, 16 Apr 2026 14:08:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 5/8] oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 23:03:58 +0200
Message-ID: <20260416210836.1336162-6-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235422

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

