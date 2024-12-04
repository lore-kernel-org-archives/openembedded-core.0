Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58901E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.25632.1733345139291882008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NrPDqc76;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21577f65bdeso1991685ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345138; x=1733949938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMFqt1CM9+7zhlSc+UjlIkxc/bUPByGBA7Cy4ZLzWBY=;
        b=NrPDqc76RTdQu50tMV8IzmQrdNnzoR4bdW4vWNfeoMWGlNipecf3DQfgDEMpRRhPSH
         ekNbpsHLziz+mrnUvJciyDHzEX1NpdNKfXkX4GWTRmik6PJNrTl+T3ptcjISauqn4nPY
         5euyowfheVOe0NgaLeiOdtYNLwe8RBTN5Q2gxKgEylq+s72sovzVTITmXss4Xk+hEoT1
         TL5Ua98mKDEthgpEEaBSce2F5KZPFdugCxFdxo24BVQCv0/j9cPnQF5rZSykwSvVqTHX
         aJTnh0VSU3UCP3z/eGoe3byFfe8zRuT3ro90rhB0abJsLJ/qlRSkUKoTrXsSmEtFrAhm
         CsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345138; x=1733949938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMFqt1CM9+7zhlSc+UjlIkxc/bUPByGBA7Cy4ZLzWBY=;
        b=FwDJQlYhkKNwn3/g/DllCoif1TAvC9XF11iwoOLM4xyd34hswKKPX69+4Y/fUIiXj7
         +edOBuYQIKzWOHAyUNkhO1DbZP7bLVpbLEE4i7yc1o6tXLbxjNIzm03juFOI1KCwP4AP
         7U0cS5fpRZE4jDCmDo0sy8ct5KgaX5G6dFY0oUXK0LGaPlHCJ/Q1ngXR+QDdbEB36Bdg
         iU9m0ttpRJFZtB20+jMfzBhZKfmxut0o1PZ7n3u9vVtQnBisWbkg4qHnQrn8mq9nTOmj
         F9NEWoFHJczw2MRnJLPvQciXCiAPrmwukUBR2kPeKN8JuxI/3zQRSoN3iwJ7Ec7/ML/q
         6jGg==
X-Gm-Message-State: AOJu0YzW/nRpcVCy/fc04Qaon3+X3zK9PE1RTVqZltXR4ch5R9qA33Ob
	gJpsDSVwBc2Ru/HGXWhhCE+2xYF2GNoboEM543q2xdYuNDM61qOdvSY1SGUPQ4CYbL/woldSxVg
	S
X-Gm-Gg: ASbGncvewL9zp1vtkaaJOiGTazkR7w/aekHyspxbhSxVvchdN7/0SUns9qVbdMGx+KD
	qprjcI0B/te0r2wzWM3h0alKaNi9r/wCrVBRd+tuoxdfjqwatYsxftMeslHTNqlSRYXQAYnl9DH
	Aa739hu5hP+dtf/GUsQnfz7/cBLY1aEaxWsvUzxwUJdTVMLXD5uJKMT+qRLc7K9P1hQQpbdGGfa
	EevZx68MGnUUClabIE8fycPdemxi1yRTko4fpc=
X-Google-Smtp-Source: AGHT+IHvmzqSGIIRolfKsJ3euLKYnmqCBV+44NZAP9mx/wLwYFxHOQ0Sf2dwleVM+y7iD/6PGtA1eQ==
X-Received: by 2002:a17:902:e884:b0:215:b1e3:c051 with SMTP id d9443c01a7336-215f3c71b11mr12391315ad.11.1733345138582;
        Wed, 04 Dec 2024 12:45:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/14] oeqa/utils/gitarchive: Return tag name and improve exclude handling
Date: Wed,  4 Dec 2024 12:45:17 -0800
Message-Id: <bde2cf92e1a968e7272a194b887c331742f94d5b.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208352

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Tweak the gitarchive exclude handling not to error if excluded files
don't match.

Also return the tagname created so that other code can then use it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1adba3430faffdf6217b6a00533a3b48a9388abc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 10cb267dfa..a826646059 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -67,7 +67,7 @@ def git_commit_data(repo, data_dir, branch, message, exclude, notes, log):
 
         # Remove files that are excluded
         if exclude:
-            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+            repo.run_cmd(['rm', '--cached', '--ignore-unmatch'] + [f for f in exclude], env_update)
 
         tree = repo.run_cmd('write-tree', env_update)
 
@@ -202,6 +202,8 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+    return tag_name
+
 # Container class for tester revisions
 TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
 
-- 
2.34.1


