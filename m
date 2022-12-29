Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA792C3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.208334.1672329680168272226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CC4Wehu8;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso10343538wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gomC9DY43aEhfC6+vh+ahgnqtI9gz9G9n8QKZmOyXE=;
        b=CC4Wehu8xWdCAl1pXpRfc/ORPEjlRpEutkQxfVFJUsfMEg/bUA8a3O58GtGcRzpNuu
         l3j1EvOgzzR02PnHrK/pOyf8uKAzie0bH53sZcbui15k6sxKsYsLinTfZiChl7GN/Di9
         trFFFgPLUvvus36jOjyKJJ2B+xfhUS5qScAr4aVpctmi7N3Y+3hoxhBCU3pjmVBEsjnn
         0PEAxnruMT6XqoA0HRfXptVf6cePR0UNUwA8VSDzYO7dDzEzCuwP/2M1HrXEczSEnBWV
         P7Rrh8ZA52OPKoH/ssEpe1u9xLR4E2Y29KWklnvLjAPPn4S0On/2Ze3vNK2N1htRbHe8
         gYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gomC9DY43aEhfC6+vh+ahgnqtI9gz9G9n8QKZmOyXE=;
        b=UwJEnkVZsr5uztbZcilo/JGUyiO4TENeMTlVlRc49FM0l0srIjIWdYvIdLWAQ6e8hX
         MDSXin1ZFlTC/JITwccBNVhA3reD6u8lOgyOsDlNM0+wF5bHhtojwGAsNwvkaHsu/re6
         sYsfJRFlg9xiXlG35Ak8Q3Lk0N4t+cF4bc397q9hiBsMG6pWkfn45gixdvcfUH2NNm1/
         0qXuutBeX8nq0Ox0aeVg47WVYpCH4iNcSCiVBIqZkHpyob0MHUDREObZvSanTa9Z3iLk
         EGkhauJqVyakhTO01Vuq3oQHLs500d+Notcz4Pc4UCvgUstDSVhwdwLUtzOt9ezSybxK
         khSQ==
X-Gm-Message-State: AFqh2koMbdgIDts1rVJ2w+qoH2NdoO8+CNmoHZh53aeKMQw9JuvBDrcw
	TSiMb1hO0rQ6+fllCnnoB2ZR4H8Jowk=
X-Google-Smtp-Source: AMrXdXvkC366UWzHHSbacJe7Uw8ZZhyJEvP73hmqR4gqVU1+74Zj6Zi2Shg3u/O1/SgZvw3bUronBA==
X-Received: by 2002:a05:600c:22c7:b0:3d1:cf66:3afa with SMTP id 7-20020a05600c22c700b003d1cf663afamr20829668wmg.19.1672329678197;
        Thu, 29 Dec 2022 08:01:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/10] devtool: process local files only for the main branch
Date: Thu, 29 Dec 2022 17:01:01 +0100
Message-Id: <20221229160110.255775-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175107

devtool modify/upgrade are not currently equipped to handle conditional local files
in SRC_URI, and provide only the main no-override set in a workspace under
source/component/oe-local-files/ (this is done via meta/classes/devtool-source.bbclass).

On the other hand, updating the changes from workspace into a recipe
is run iteratively against all overrides; this works for patches (as they
all are directed into their own override branches in the workspace
git source tree), but breaks down when trying to match local files
in a workspace against local files in overridden SRC_URI lists, resulting in
bad recipe breakage.

Implementing multiple sets of local files is significant work; let's for now
simply not touch local files in recipes except when on the no-override variant.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f46ce34ad1..f3349f98e9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1409,6 +1409,18 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
+
+    # Get current branch and return early with empty lists
+    # if on one of the override branches
+    # (local files are provided only for the main branch and processing
+    # them against lists from recipe overrides will result in mismatches
+    # and broken modifications to recipes).
+    stdout, _ = bb.process.run('git rev-parse --abbrev-ref HEAD',
+                               cwd=srctree)
+    branchname = stdout.rstrip()
+    if branchname.startswith(override_branch_prefix):
+        return (updated, added, removed)
+
     local_files_dir = os.path.join(srctreebase, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
-- 
2.30.2


