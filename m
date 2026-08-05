Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2152DC561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:57:53 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34751.1785913058184688879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AxZzb/rH;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-907ae240ac3so3034646d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913057; x=1786517857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdyaITfbl0R31SLh99Opm/2rN+VXAFYwDNZUMEwlZNw=;
        b=AxZzb/rH2V8CLUg3Rm3VA049Vu5gP6tN9L68zTaCubpYw4G53EZWHCkpzlwnSACbfG
         bCNUdcFwwxRIUj/x0TJ3kxmQtux2QHBDnmNr902FIRcizpEgzVoCecVb+MXiqorhX/Z5
         S0eVqqpG2+rqceSablPnmxfqhhOtMdv8Pr9jvXXGJ8GWdtC8Hf/Dk2Pd4VHQ1H59mMJt
         3Id99bYoUD7TtkH42JnGFs4vWxEfGAgDigEhbRKyLuwsknFd+vuc+MVNtoFo1P/9o+/S
         Aja/LserQepY078lgx50NqYcljOp29Nmmq5+5BCW1b52EFP7siZTcz4g7wZVbp6IYaGK
         eRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913057; x=1786517857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdyaITfbl0R31SLh99Opm/2rN+VXAFYwDNZUMEwlZNw=;
        b=dFLOMxqyJD/8HLkW9UHX7Fa8Vd5cT1bBcjlIVC9V1hktLkjeRZ4PhbHiJdrHOs5Blx
         Wo6Kj/GueKYSRZr55nOkNPC2gNUd/PP0u+rm7EMB1dCjUPxx8sCt/nV7PQq+K9JcD4Tf
         1j7DaJ5QsRE4Ax/UUjL9OcdGKXJvIKPhq7rlbUhEd4Apw5M8ID5ZWhgPl7Om17uOUWjS
         GvyuLRoRsSfwmR+SrEWVtZgtG+i7XD37RBd71zlZFFhhgeDKyT4kveeyB1woVf9OksBU
         9EL67t8/wR6MhcC1hsZYHFWim2GzjEaIYa5LhzUltjkY0JKF8WuT0em7OhywDLi0FnEn
         /YIA==
X-Gm-Message-State: AOJu0YyM7BgD856c5TriVqAqWa6hDOG9nQVasqBbe3O77dlpBFG9FG7N
	tEcLNT1fXnunMM89v50ReMhGTiUTrGI2xc6GwBQk5XnBeKu4J7kKVVfBSaF14Q==
X-Gm-Gg: AR+sD12q4BvGylWJzIZO0KqEVv7sJ9tdm9oPkriKv60gzNudjp7OPa2kaZCi8Y3JqEf
	AifaLSKoPxidtCJ9V8TB6+42A9DiOZjFxXwQXB98+zcsi9QUFHs56yz5w9ct+iYwdy8ZLAZYQMs
	I11GJzRnPMhqZEPZFy6E315clZt8Or+Du2zoNIdkgpvGvXUovYngqJVIC92lfRzHy/ByEaLKpW3
	wm6aRYh1odIs8/3MzhGdJweaYeI6jqoUo2P4u7DYeS9uPfZWYRjIVcSQAhxAX4TnzE80LfRpPUk
	MM1L8t1NSfwQmChZfU7yUa3S5itStyXspvcF+GX6hVHdkRYtSkJVRzEzNFei43MVtzP21d2ZCiJ
	uujh3YVCsqSEzpS8U7InxjiTrvxqvJBOcr+xkV56WS8PLuuhDQSN2H/qNsZZgrT06quSt31tZJF
	u926iS6upotzB4iJAxdZwdqlKHEpINlbUw/TSlayXaGAYFBi1BQ1Gz++QwPV2XvIfPBLw0OotJI
	CbnGRAldlMIHXCMdfXpcUFHRBMxE2Y=
X-Received: by 2002:a05:6214:5d0d:b0:8ff:650d:52d7 with SMTP id 6a1803df08f44-9088125aa48mr59582136d6.18.1785913057050;
        Tue, 04 Aug 2026 23:57:37 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbcc9esm19264546d6.12.2026.08.04.23.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:57:35 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	Harish.Sadineni@windriver.com
Subject: [PATCH 1/2] oeqa/sdk: update cryptodev to a revision that builds on kernel 6.18
Date: Wed,  5 Aug 2026 02:57:17 -0400
Message-ID: <20260805065718.3497815-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260805065718.3497815-1-twoerner@gmail.com>
References: <20260805065718.3497815-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242827

The out-of-tree kernel module test pins a cryptodev-linux revision from
before the 1.14 release, which predates the removal of
crypto_ahash_alignmask() from the kernel and so no longer compiles:

  cryptlib.c:384:28: error: implicit declaration of function
  'crypto_ahash_alignmask' [-Wimplicit-function-declaration]

Move to upstream's "Fix build for Linux 6.18-rc1", which is the revision
that restores compatibility.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
index 0c4d8ddb543f..1be23e994fd2 100644
--- a/meta/lib/oeqa/sdk/cases/kmod.py
+++ b/meta/lib/oeqa/sdk/cases/kmod.py
@@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
 
         with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
             git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
-            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
-            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
+            # This is a known-good commit post-1.14 that builds with kernel 6.18+
+            git_sha = "08644db02d43478f802755903212f5ee506af73b"
 
             sourcedir = os.path.join(testdir, "cryptodev-linux")
             subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
-- 
2.50.0.173.g8b6f19ccfc3a


