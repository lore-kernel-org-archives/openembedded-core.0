Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCB6EA8550
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:08:28 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40931.1773151698222184109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 07:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=IMN3F1az;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-456497-20260310140815bb7097012b000207c2-gybibi@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260310140815bb7097012b000207c2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Mar 2026 15:08:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=I5L9nhkAJmXu1cQcwLCPyuAcSzsC0GUpnN4+jgkMQqA=;
 b=IMN3F1azKBp4w8Kh4vmvlJrweFzKgUsFHgtRa8gqJynQar3bGGeXcNHTyYE16xkNd/Dzfa
 bkGGW/+BW5fQiE9OAL//f0ytQrQlao0mpAu/jtfn7nkdvVKUVyujkWbJcJw5NSIjXhp+4RHo
 1B2I62/U7+uIu2tb/lbcgi7c/VWd8WBuvY/ErT6bItN216p/dETLYcjqPAFIU/fJkBbPc5R8
 KY1rtJ/jExim8CKNuQyucDNAX6Y/eKyxhoYMSkAKxWg+HRJG7gcxQMHImZ7AB4JoEgcq/Ozl
 /CDqlOLUcjCRNyX17UGJZEcTSAZTbZZ8IIXqha1AeMCLBGaMY4DEGFDg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux: cve-exclusions: Add --always to git-describe
Date: Tue, 10 Mar 2026 15:07:46 +0100
Message-ID: <20260310140753.2618851-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232787

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Otherwise https://git.kernel.org/pub/scm/linux/security/vulns.git cannot be
used:

subprocess.CalledProcessError: Command '('git', 'describe', '--tags', 'HEAD')' returned non-zero exit status 128.

Original error from git:

fatal: No names found, cannot describe anything.

The change will at least produce an abbreviated SHA1 hash as {data_version}.

Fixes: 5e66e2b79fae ("linux/generate-cve-exclusions: show the name and version of the data source")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index dfc16663a5..5139b11055 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -97,7 +97,7 @@ def main(argp=None):
     version = args.version
     base_version = Version(f"{version.major}.{version.minor}")
 
-    data_version = subprocess.check_output(("git", "describe", "--tags", "HEAD"), cwd=datadir, text=True)
+    data_version = subprocess.check_output(("git", "describe", "--tags", "--always", "HEAD"), cwd=datadir, text=True)
 
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-- 
2.52.0


