Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3539FC87FC6
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net
 (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web09.23434.1650557166094315855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 09:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1
 header.b=ShxSg+pO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225,
 mailfrom: fm-72506-2022042116060212d2425a5e1e02129f-bibmgz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id
 2022042116060212d2425a5e1e02129f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 21 Apr 2022 18:06:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XMc/D1O/LM60TMjjg/0ozkrSI3p4G0FIPH6BSnt9Rvg=;
 b=ShxSg+pOpxZ4PR4206KzpnqEz9/1FxZFgYItXXCvkPK5YrHsD8Vxx8bj65sUr3IyeAvkx9
 31xp+i2zeV9kXIeqVKPYyMXtIKwwnaKdNfYD/vWu8XVImLfbEHjtY2gqeEndx3LfuecVOJ9Z
 5eu4mRR6RoNzBc2td1dsXt6C7KEcc=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	adriaan.schmidt@siemens.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [PATCH 1/1] Fix permissions when splitting rootfs folders across
 partitions.
Date: Thu, 21 Apr 2022 18:05:43 +0200
Message-Id: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164764

This patches ensures that the file database containing the file and
folder usernames and permissions is always located relative to the
source and not to the appended rootfs-dir.

Prior to this patch, the database was not found when using -rootfs-dir
in the WIC script, leading to erronous file permissions and ownership.

Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 2e34e715ca..efcc220c48 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
         part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
-        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
+        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
         if not os.path.lexists(pseudo_dir):
             logger.warn("%s folder does not exist. "
                         "Usernames and permissions will be invalid " % pseudo_dir)
-- 
2.30.2


