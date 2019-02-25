Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 21BFA7C2F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 09:28:08 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n2so9028734wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z4ryU2CMvYeRG7D99JWBY1BniWOfPHi8F8vqdqouZt0=;
	b=U3vr9YS4/kb9Wlh7nZpwVhdyG7CV/G2VtVQtVx6X5gSXryXppEA7sHDybQKI+xzq4h
	pCS3pTNHw6ptV6Jf0SRSTK+zUkAOvEGVNKgzWHR4KlJaPtgi9ExVwgtj5B6dbggg1meC
	ENgIr/VrLw/gW1RyYEzzipVM3romiXTcKx9ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z4ryU2CMvYeRG7D99JWBY1BniWOfPHi8F8vqdqouZt0=;
	b=Nd67W5xvX2dcvPyNF1lrH+aSeGV6zORV5m2++7x4FMcAzLW+GbgsrCba5SvPdxP47W
	tOaVupqgELl5SC2VTcxxDzUDdRVzhvSKuMDM/J6gHBr9uMPuj1jSs+E/Z3jqt4eD88Go
	1OI6G8poxPIF1KZaoVdbYZkPav92MhETZuHvmbGHaqKWeMBua5Jwq0S0eH9iEo5MGvjL
	3TJK6mkNX8qi719in/V/6VNpqzWCr/ZGNYz1nq87aJ0Ao6odXgpNSmv5V+2HvDd8cZaQ
	JfScMX83Mvxm8PMGhHscSVcNDPVT88BEedqmky9TJQet0t5q3Bb+Y7bqAYJCv5TRpSMp
	MSzw==
X-Gm-Message-State: AHQUAuYWAi7JVXTRyXJhoMKrGCFTZcTtnzkHak8VbY3BHOFNHIuHq0iG
	qf8xUAWq7UUntMxtXFt9kvR/c8lyAmw=
X-Google-Smtp-Source: AHgI3IZUiz+E+HEP/o2w9wfAlWBdeV4uV/EPkYsjQUWetMiiw371ty28I0AlAkTuukkifmSim6ftmg==
X-Received: by 2002:adf:a147:: with SMTP id r7mr11348742wrr.5.1551086889433;
	Mon, 25 Feb 2019 01:28:09 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c1sm14655762wrw.7.2019.02.25.01.28.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 01:28:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 09:28:06 +0000
Message-Id: <20190225092806.29171-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/utils/gitarchive: Handle case where parent is only on origin
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
X-List-Received-Date: Mon, 25 Feb 2019 09:28:09 -0000
Content-Transfer-Encoding: 8bit

The parent code currently assumed that any parent branch is locally
checked out which may not be the case.

Use the local branch by default but fall back to the origin. This
also means removing the later saftey check as the branch may not exist
locally.

This fixes the autobuilder resulttool test pushing code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index ff614d06bbf..9520b2e1261 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -80,6 +80,8 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Create new commit object from the tree
         parent = repo.rev_parse(branch)
+        if not parent:
+            parent = repo.rev_parse("origin/" + branch)
         git_cmd = ['commit-tree', tree, '-m', message]
         if parent:
             git_cmd += ['-p', parent]
@@ -93,8 +95,6 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Update branch head
         git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
-        if parent:
-            git_cmd.append(parent)
         repo.run_cmd(git_cmd)
 
         # Update current HEAD, if we're on branch 'branch'
-- 
2.20.1


