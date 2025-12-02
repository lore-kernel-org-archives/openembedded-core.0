Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B2ACFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:11:27 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.675.1764650564084002834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 20:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=cedric.hombourger@siemens.com header.s=fm2 header.b=ajrAZAIA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1212295-20251202043236ae8456ca9400020748-26dz_h@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251202043236ae8456ca9400020748
        for <openembedded-core@lists.openembedded.org>;
        Tue, 02 Dec 2025 05:32:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=cedric.hombourger@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ca5i1lUrPhrY/FKJZM6t1ppeGTHGPKd7MOW91jVlsRQ=;
 b=ajrAZAIAurpP0IGq04dJMfxAZC6iwKBcDRffpcNqbWFwvxrg6HMEaOCcMwNalY92VUSRtv
 Jw1J0YE1jpCmgUEzs3660rjVb/S+NMK8LAxFhUXmVPiqcmZCkCStakPdch1GcT9e6ROMIzZ0
 oZeKEvdpZy4G4Zu9V+5Lb2LldocFhhP9JociZIaB3a2KBEqE+XySFE2IX3+pXSrFX91WqWxf
 hLjO68UX9SjpCaoXY8lOoQypG4z/BpwKeJr0QL4CDAXLt5fXYxNMGePdBp4K8bLv4S7ujh1v
 5hybkrq5dM81AXchYLO7PBh3xuSMRx+TcEgqxa+J6Sk6twoN1h3nvVVg==;
From: Cedric Hombourger <cedric.hombourger@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: isar-users@googlegroups.com,
	Cedric Hombourger <cedric.hombourger@siemens.com>
Subject: [PATCH] lib/oe/patch: use author date as commit date for "git am"
Date: Tue,  2 Dec 2025 05:32:06 +0100
Message-ID: <20251202043207.1353655-1-cedric.hombourger@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1212295:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227147

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


