Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF22CA9ED6
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23447.1791708083315965392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=24p2Kv5I;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so487159f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708081; x=1792312881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JcMASnky9rXchH/awBt0pVIQOymnxJBTmPQUsv3Tc64=;
        b=24p2Kv5IT5KPowX0+sFKBQ71j1LxsrZFF7/wKMxfCUXf5jqy+nwh5hu0/RWywirbl2
         QetxA5+VcdmaQJp8WiGNOtFrqh9DiYIp7ZlDzb6jrbqY9Xo93PgBJRJd/5nkTxdZeY31
         rSyPdZ6p2HlXT2spDOG8KOuGGdD5Skf1hsFNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708081; x=1792312881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JcMASnky9rXchH/awBt0pVIQOymnxJBTmPQUsv3Tc64=;
        b=f9DhdhvKMVNdNTBHgzayLMZeTEBSrHSh0Fq6elD6MG7/nB0FzHzfuOxKRDBEUAxJGh
         TZmymCpOJDMuhKvc1Ara0cDR5x7Fed+COPdSvaeHLc8FTEJCPJ2h9O8lSiEMP55BHg4B
         xIKq3nfXW0v897k/P+CxkP2Qc90Xrw1H8f71Ih57QXf7M/Bw5uGdnZlN8vDDd4UiLVUi
         3Ejbm2EIVC4GjTdiPsFp19uTvV6CW5pp6gpMs37Q4009gOoxln5Lj2E67dXjRemQQHUV
         JOrdFrfru1yn0ncxh6ADdWwo4/t/wTCrWaoNrHqnyX6rC4IKMaO7j8pXIjWQUyX0r3Ox
         t2fw==
X-Gm-Message-State: AFq9FYJOyorydNqBh/F8XwXKXvojbDCBqHtsdesLwadcc8qpZuZc2a3+
	VZOy/ofEkd5aM0Bn2xLP9AdwQHqqKKwD2KcRda2V+X/1nNQqgYmOwebeZ5O1hJ9+seHKndSLO9x
	wYc0YVe8=
X-Gm-Gg: AYBFou1a+lb7kgmIszLbt34tvPYT+Je+9Tim5Ko2s4CCljCcy7jBh0OyFqXG4n1Fo1V
	y0Cqb/st+yo/mpdq/IirXxDPo2ixykGurtUUPmWm7Dw0ycp4/6r3J3dN4nZerLjteRFxY2K3Rj2
	KRzbQvQewDLnWQ7fB2ZPjXRR53mfydIZytNHp7hJGEe6fMuWq8XeTGx+AWaB6n4/up/EYeca4Gd
	VQi1+QIPUgahC5xdQt14aNk1YaC+RMuxCDjR1lKsPWjmMH0zb0dpgt1QbVZNMb44W6kJgIgzch+
	gg7bIZBgNhrlKpUcMCpIigvngknqhfeqqp7oOsrVvENEHjXIqPNJQ3DI7JAyxt4um097RAkKjPT
	xDtJMfAS6wrHGq16E4w/G0QCG0KcasbonkELe3QTDBRgvRc1gh9tkKRtf687Nk2myAV6t3+HQCE
	unbX7sxHk7MvhDsrNywPs3Ug8fJsjJ3WH7oVvkRiHmlKaGkHwJGnH1ev9tCao63rE4EvgoFR9gp
	APBUgDb/F+OKDPgyndBXFqEz9RJXUWbtCIOtrQxeSEVEc0ToFBLfCfnLpFwo62VFqVyLfphpg==
X-Received: by 2002:a05:6000:4541:b0:48c:7161:43e3 with SMTP id ffacd0b85a97d-48dbacfa612mr6901256f8f.54.1791708081028;
        Sun, 11 Oct 2026 01:41:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/60] oeqa/selftest/devtool: cover update-recipe --initial-rev
Date: Sun, 11 Oct 2026 10:40:05 +0200
Message-ID: <e125b42ec400cae83660e04aaff663031cb457a0.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247541

From: Babanpreet Singh <bbnpreetsingh@gmail.com>

The --initial-rev option had no selftest coverage, which let the
regression fixed by the previous commit go unnoticed since 2023.
Extend test_devtool_update_recipe to run update-recipe twice more with
--initial-rev: once with the recorded initial revision, which must
produce the same result as not passing the option, and once with a
revision in the middle of the local commits, which must export only
the commits after it.

Without the fix in the previous commit, the first --initial-rev
invocation fails with "Unable to find initial revision - please
specify it with --initial-rev".

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 171af3b2915dd076c8d1b205ff75eac1ebd5a586)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5ed69aee1b1..b485d752e7b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1219,6 +1219,28 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         result = runCmd(cleanup_cmd)
         self._check_repo_status(os.path.dirname(recipefile), [])
+        # Now try the same passing --initial-rev: the recorded initial
+        # revision must give the same result as not passing the option, and a
+        # later revision must export only the commits after it
+        result = runCmd('git rev-parse devtool-base', cwd=tempdir)
+        initial_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (initial_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Change-the-README.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        midpoint_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (midpoint_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions

