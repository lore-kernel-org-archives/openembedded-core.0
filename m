Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0FED1D462
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:46:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7898.1767883555812168937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y5LbiBO/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E7734E42001
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23560606B6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6299D103C889D;
	Thu,  8 Jan 2026 15:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767883553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMNyAT6/w11l9iezrGckheRcvnN7FBV16n7DUQ/qDao=;
	b=y5LbiBO/QU3eHF/xgBXagPiGSlpldvh7rVZIy0gQN7HcpFL+KlUJDcBzIRo3xEVQ0L558r
	YdhS6+xHeHppVchCXAady7gW992yHNrKhODXnFwn90R0HqmtIU7VDsPBpGXtzAnvTeo/wc
	DAJhQEuj6CXBklXF0vVOtLcRG7dMxIk9euYdx423TdpMXV0QBRfxPFxyxzWavm1vZ6tztX
	3GlShkcThqh6xYkUIN06pA/Er5yaMhA8nifnQ6PuW1LB7ksb5DicT8uUm8DCyZkm5uIzd8
	mSmSqZ/bISDvP0Ji470ImWoQ/Vlp7i20WfHSg33/ETMbw4EY6EMPSPJZPSKCaw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 08 Jan 2026 15:45:43 +0100
Subject: [PATCH v2 2/2] oeqa/gitarchive: Push tag before copying log files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mathieu-fix-15696-v2-2-fbb0967fdfed@bootlin.com>
References: <20260108-mathieu-fix-15696-v2-0-fbb0967fdfed@bootlin.com>
In-Reply-To: <20260108-mathieu-fix-15696-v2-0-fbb0967fdfed@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767883551; l=2670;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=WlBu6G4em83+DKQU6Vj7YEbAjUQ/gEDMYyjUr7OFnUk=;
 b=JKbfrrYSbYed8C83A4lyp231rMp/tOdHpPQu2ymlMbtFtKAvIv1+Fll60howmkQVnrKLrcvlC
 AXuAALDALFrD8MQrP39UjtMBU9AdYIcF6OxQBSuKNY/dNxmKyM8oxAt
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229078

Resulttool creates a git tag in the yocto-testresults git and then
copies log files to a newly created folder on the NFS share, whose name
is controlled by the name of this git tag. As tags are unique, the
folder name is also unique, preventing any clash between different
builds.

Today, the tag is pushed from the calling script, so after the folder is
copied. This can lead to some issues if for any reason the tag is not
pushed. This might also lead to some race condition. Allow to push the
tag before coying data, in order to prevent these issues, and add a
warning if the calling script choose to not push the tag but still copy
the log files on the NFS share.

Fixes [YOCTO #15696]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 scripts/lib/resulttool/store.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index f3caafaff822..dc2c259331b2 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -82,9 +82,14 @@ def store(args, logger):
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  excludes, [], False, None, keywords, logger)
+                                  excludes, [], args.push_tags, None, keywords, logger)
 
             if args.logfile_archive:
+                if not args.push_tags:
+                    # As no tag was pushed, we can't guarantee there "tagname"
+                    # is uniq and so we might have several builds trying to use
+                    # the same "logdir" target.
+                    logger.warning("Archiving log files but the %s tag was not pushed: this may result in target folder conflicts")
                 logdir = args.logfile_archive + "/" + tagname
                 shutil.copytree(tempdir, logdir)
                 os.chmod(logdir, 0o755)
@@ -123,3 +128,5 @@ def register_commands(subparsers):
                               help='only store data for the specified revision')
     parser_build.add_argument('-l', '--logfile-archive', default='',
                               help='directory to separately archive log files along with a copy of the results')
+    parser_build.add_argument('-p', '--push-tags', action='store_true',
+                              help='push created tags to remote git')

-- 
2.47.3


