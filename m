Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84165CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:21:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.96575.1755076871340894082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hsexXd1G;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b780bdda21so5134641f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755076870; x=1755681670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbBeUlky6B1Ypfx4VcaE0LhnnRRUGRC6WlBQSjgw7n8=;
        b=hsexXd1GJkZohO39VybIcO98IDTyaF8cQplW78aROOTtjWxK2ueJJ4SK3Vr6URU/RE
         oDD9IEfwDHXoZp58PaSFpqZ7DrMWXgU1AEOS2Q/YkjjWnum5QWYHw7ZxyoXynZ06vOOY
         LOmbIjV8EFG/Dq1zEbDF/7LYDXji6/ndm8qoIOu0fPGGRLP1WluFsSzcx1wBHTH8WSYz
         xUesSsR1IyzLzAvEsWZS6nnvNKacXeiFmGf798YUtuxkgK0y6yCQA7pmHEc0TN1Yv1km
         syWDMblBDCbiCkCASjx6PN/nQ+IIG6rS8dNmWHonEq2U2us8p4D+48A4v4e1Up9kBJGo
         KZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755076870; x=1755681670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbBeUlky6B1Ypfx4VcaE0LhnnRRUGRC6WlBQSjgw7n8=;
        b=o6AbX8XJF+uE9UL0y3Gq5xSXs/p4JfxHpjqyYv6JGrjjEfG4bQyI7UBsdTqBmxidOF
         s1AdCs9TQvZYcUc0VcRGO3bKQ7wBgsWPlbGFf7q0sJm7LDSO7zc3HfpKB2CJMjmEJgqu
         7sxedqQXp1Dw83pFrxSX7vyHkTFPRw+1ESyX1zGE6GHCMafznM6AZqzijx/66CrbEJne
         S3389D+cG/yjX9T0UnzvIqjKTzmnIiB8HK9Q6dSVJeM8BDFL55scM/4KTOE4bDU+QgxT
         F2A5oB/rbYas2SrvJ+u7CIdi1ZNTCGLvd/I7Q6LdlFrbhlPsmgm7+LEapggmi0YgRTQm
         urtw==
X-Gm-Message-State: AOJu0Yz8UWJhWRfti1XrjKMhP8FF4jvIHNFgNQy6fTRGgxp9y4S0jG+r
	L4cXfDppB9U5taDhEeQKkKJkiuWiDFSOo53EVSeQ2hXT4Mx4UvK1vCLXCwScfg1H
X-Gm-Gg: ASbGncud8rgi8oVSjKf/nAl9OesmdVV9+SDeE4Ek28ryvKy7CB2AVNxfMt7X0TvKiT3
	GHwT3Da4n0+AoeZjQ9FS4HAwsfrrfSlgP7O32Ch6JECE2YJlgy5nsmW2cq2zZi9NpKjMUon9WFz
	mpDJFuH+pb0CtdU0TV9auYuGqDzX3m2cSru2sloVsKUiROg1S9i4WHe/ThxmZe4kd6nPm7OCg8D
	OOqGh2sexyqt5QpgBpJZmc3CLV8o/7iJlmZos5LgLms8pGguxgMD701p64GR+9ZJqDI+4qjtb7T
	h/LUmy4/AdkntWbNc/c/jBQ2WPw2rgvP+cT9IxF/VzywgUtVoOJZEAteO3zQukEekv0Aka8RnOB
	j4KfbdrA/sIOd7Pzd65IcpSQ9OmgY3wGLCxzu/yvBudK3G8B9te1xPyByQykznuea/vT6KCVzAg
	==
X-Google-Smtp-Source: AGHT+IFKb5Nk31uPLBhN8tN+c5gzCiIr27zfbbEuesfsu6S7KguEr+h2dVp9a1JoKGc/lZab2a7FHg==
X-Received: by 2002:a5d:64cb:0:b0:3b7:8338:d219 with SMTP id ffacd0b85a97d-3b917d1cd5emr1684708f8f.3.1755076869575;
        Wed, 13 Aug 2025 02:21:09 -0700 (PDT)
Received: from debian-workstation-pto.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm49440914f8f.46.2025.08.13.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 02:21:09 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH v2 1/2] devtool: fix upgrade for recipes with git submodules
Date: Wed, 13 Aug 2025 11:20:41 +0200
Message-Id: <20250813092042.247966-2-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813092042.247966-1-pistora.tobias@gmail.com>
References: <20250813092042.247966-1-pistora.tobias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221796

Fixes [YOCTO #15943]

Fixes invalid path argument while calling "git rev-list" from submodule folders.
Replaced the local __run() wrapper function with _run() at "git rev-list" command calls.

Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d9aca6e2db..dda0a58098 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -280,7 +280,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             # note is still attached to the old commit. Avoid this by making
             # sure all old devtool related commits have a note attached to them
             # (this assumes git config notes.rewriteMode is set to ignore).
-            (stdout, _) = __run('git rev-list devtool-base..%s' % target_branch)
+            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
             for rev in stdout.splitlines():
                 if not oe.patch.GitApplyTree.getNotes(path, rev):
                     oe.patch.GitApplyTree.addNote(path, rev, "dummy")
@@ -298,7 +298,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
                         logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
             # Remove any dummy notes added above.
-            (stdout, _) = __run('git rev-list devtool-base..%s' % target_branch)
+            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
             for rev in stdout.splitlines():
                 oe.patch.GitApplyTree.removeNote(path, rev, "dummy")
 
-- 
2.39.5


