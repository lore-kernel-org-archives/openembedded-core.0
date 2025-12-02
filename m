Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9F4CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:56:30 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4024.1764666968837886806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=cedric.hombourger@siemens.com header.s=fm2 header.b=m94OM/mV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1212295-20251202091559c865c7ff4600020726-hyqfma@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251202091559c865c7ff4600020726
        for <openembedded-core@lists.openembedded.org>;
        Tue, 02 Dec 2025 10:15:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=cedric.hombourger@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ca5i1lUrPhrY/FKJZM6t1ppeGTHGPKd7MOW91jVlsRQ=;
 b=m94OM/mVOAg8+n7/dPG3cgjSwQvf3V0n3CQb2PBGErxPSlMNNzQhxPDbxEJKnABermKKKA
 mxhCc/+W+jpT85C+cwTTozRrP8mO/NzFxtzwDNOaBiZjXFcgaLfyrhkWyXxdruyZk85L99sb
 mMU1+ysf6JsfHs72Rvnv+9HZsUE330nnI0Nngx/5to78BuJLXTMfBsdIfjsFTYIsOH3tuDh6
 Yfmy7vfRiPSFIN62YnUoJQTYA2n6c+10dtTpHqD1U8Cef9w4K5YLZm3p9nBFFNth1djSM7eB
 s98476EAZsQx/Op8iXT+I3C0qmQq8eL4B8c/MWcDE/K/cB5aoibE1zSw==;
From: "cedric.hombourger@siemens.com" <cedric.hombourger@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Cedric Hombourger <cedric.hombourger@siemens.com>,
	isar-users@googlegroups.com
Subject: [PATCH] lib/oe/patch: use author date as commit date for "git am"
Date: Tue,  2 Dec 2025 10:15:53 +0100
Message-ID: <20251202091553.1420049-1-cedric.hombourger@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1212295:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227155

By default, "git am" uses the time of commit creation as the committer
date and is therefore "unique" to each build.

Use the --committer-date-is-author-date option for git to use the author
date as the committer date to get deterministic meta-data and therefore
commit hashes (which may end-up in sources or build in the form of e.g.
localversion file).

Cc: isar-users@googlegroups.com
Signed-off-by: Cedric Hombourger <cedric.hombourger@siemens.com>
---
 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 77b166cfa3..246fc6221f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -626,7 +626,8 @@ class GitApplyTree(PatchTree):
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
-                shellcmd += ["am", "-3", "--keep-cr", "--no-scissors", "-p%s" % patch['strippath']]
+                shellcmd += ["am", "--committer-date-is-author-date",
+                             "-3", "--keep-cr", "--no-scissors", "-p%s" % patch['strippath']]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
-- 
2.47.3


