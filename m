Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C4CA9ED2
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23445.1791708082665486611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eKXrqe4V;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso6665725e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708081; x=1792312881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VAJScOss0VUVQMgPsM8KCuFQ668tr4/nE6Kh0T1bJjA=;
        b=eKXrqe4VVcYEuIA+8llNh/yWOTm4KI1zyP1jeKEOckZ0SM512JN5JZjMi/oLHnonUA
         LBbDj1dQkWd8WPNLyab7Hf3d3/GLNnU6oxr7jgfaXQDFfroHmuBTasBX+XFUANazhSjF
         m8p3BuxtA3rPY/zv582cHGlWjKfQgapHff1Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708081; x=1792312881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VAJScOss0VUVQMgPsM8KCuFQ668tr4/nE6Kh0T1bJjA=;
        b=LaSrqEzAbEUPfyMqwX2OGKGotiRXEawUuKXhfJAkSDq/90aB66hSFQlyvQgaZ052LE
         Hi9SkfiM+kkUS+7HCZWTCxr4TxPMsF4/JvQ1WS9Xw+MCZ6qDKWCYNGaCSHBU4yoDUsQA
         t00bT+Lp9FBAE1SATdYIkF3ketQi6FzX8eBj7t6lhfo3/8EIaGZHQiz71bUWbLIVZOxt
         mhNAHjL62Ulr3UOqMB+0wG9cBMNEUM1EvCjDw/t0iwVSrtk6IVWgjPE1iZAbwZ4DdQXi
         pEnnzATOT2+MZFftAd4m8UFc88cdomgpSwX/OpCEBPXxKMh5e6GP7pIt766hA9R6BRLm
         VjAw==
X-Gm-Message-State: AFq9FYJqwjY1v9XYSPZDspQDabVv/ATeRnoKI/ZK2J3BAguVmpfWhJ7o
	P0f5EDpv8KTEQi6+yVyao3Ul/BkHkol10kJ3Yydtti07HPSvyZqLGXwi7UIT7UMjjPntjoM5cZC
	QXW/noxI=
X-Gm-Gg: AYBFou2ewGli1xmJC2cYZptAlNaGdiFi3uFTcHRtUsmMBu5oIgGXXxCahrhu3XCRL/E
	yh9TtkbPa1nYDrODo70LimqpJ4Ieze4nzffMXYkhld922+CGnjPnUg9S4OObqVAlVM4Z3fZ+4Dn
	y1O09OutqxVxvIEnPTQVFTJRuYOAXvq4r2BZhVRNfz8fyHJ2hJHbJKS3sZsAGK3mqHJ/ocpFQva
	2tDhP/Si5NXH5C+95qMweD2Hdxms8Q+n6DfwgyA1nKmJaasCDPWzajvDgVPuNy/6B51utggS6rS
	waLzOAnSdscyuaGnZUuj0RKjWzrQsJEu4fNCoiAoxbQfyDlWIIgHeBD6XsaELgvDrbVPznKpV9r
	URypt7gtw+Z6S5/KfGxLuWKGHkz4q1jDp4nOBDBScx0ef+RUWooY9pgMrGdCWeWpRNcOpdarg03
	UqP4s8xTrg/rAJHAmnwdtwIv3LfW01doENj7FvhIVdAmiTc3xqUTeNaSYltow/E+xGaQRDkEH6K
	+AUHVbDpthUFo4sZwB1Pk8cYr/rhkb/QetKWKSkxxftcufDi1oNlMlUQaC8VnMq2MT7oecd7A==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr120178435e9.27.1791708080538;
        Sun, 11 Oct 2026 01:41:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/60] devtool: standard: fix update-recipe/finish --initial-rev override
Date: Sun, 11 Oct 2026 10:40:04 +0200
Message-ID: <81a3c5764376bc36e9f0c22a43869b5fdd41efc5.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247540

From: Babanpreet Singh <bbnpreetsingh@gmail.com>

Since 900129cbdf ("devtool: add support for git submodules") the
--initial-rev option of update-recipe and finish has been broken: the
parse loop in _get_patchset_revs() deliberately skips the recorded
"# initial_rev ." entry from the workspace bbappend when an override
is passed, but the override value itself is never inserted into the
initial_revs dict. For a recipe without submodules the dict therefore
ends up empty and update-recipe/finish fails in patch mode with:

  ERROR: Unable to find initial revision - please specify it with
  --initial-rev

i.e. passing --initial-rev produces the very error message that
instructs the user to pass --initial-rev. Before 900129cbdf the passed
value simply took precedence over the one recorded in the bbappend.

Seed initial_revs with the override before parsing so the option
behaves as documented again; recorded values are still used for
submodules and for the main repo when no override is given.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62abb60b899e63ea6db5c745f4b1b6af0d4b40f1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 42fb13872d3..e2f5c28f8b6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1200,6 +1200,10 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     commits = {}
     patches = []
     initial_revs = {}
+    if initial_rev:
+        # A user-specified override applies to the main repo ("."); the
+        # parse loop below leaves it in place of the recorded value
+        initial_revs["."] = initial_rev
     with open(recipe_path, 'r') as f:
         for line in f:
             pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'

