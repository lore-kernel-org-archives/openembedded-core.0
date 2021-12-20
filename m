Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED8CC4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 21:58:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3078.1640037530388998325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=PifPo6x4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id CC4BA20B7185; Mon, 20 Dec 2021 13:58:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC4BA20B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1640037529;
	bh=x+wp0K+nMShe8h8AAGkjXJbQiHyqrivTNV8NMKcs+fI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PifPo6x4K7+od6klb1gbhyR6sOCEHsWWHFjP80b8gN6i5dv2ATFAgXIyauM3dE2OS
	 vxh4p4gyqcioAqtdFzcfNmKY9iOoxoJtXvGwcRjHjDrZdN4lRBpKTZamFyTJTVplTk
	 UF+/3P3ZeWDrRYMFSZNZ4g66qDB92fIJyn3l2NLQ=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] classes/qemuboot: allow IMAGE_LINK_NAME to be empty
Date: Mon, 20 Dec 2021 13:58:24 -0800
Message-Id: 
 <d34dfe66963424b77fe8913df8da60d884f5a43e.1640036988.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
References: <cover.1640036988.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 21:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159901

From: Paul Eggleton <paul.eggleton@microsoft.com>

If IMAGE_LINK_NAME is empty (supported everywhere else) then do not
create the symlink for the .qemuboot file.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/qemuboot.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 8cdb544..95cd1d6 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -118,7 +118,10 @@ python do_write_qemuboot_conf() {
     import configparser
 
     qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_NAME'))
-    qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+    if d.getVar('IMAGE_LINK_NAME'):
+        qemuboot_link = "%s/%s.qemuboot.conf" % (d.getVar('IMGDEPLOYDIR'), d.getVar('IMAGE_LINK_NAME'))
+    else:
+        qemuboot_link = ""
     finalpath = d.getVar("DEPLOY_DIR_IMAGE")
     topdir = d.getVar('TOPDIR')
     cf = configparser.ConfigParser()
@@ -153,7 +156,7 @@ python do_write_qemuboot_conf() {
     with open(qemuboot, 'w') as f:
         cf.write(f)
 
-    if qemuboot_link != qemuboot:
+    if qemuboot_link and qemuboot_link != qemuboot:
         if os.path.lexists(qemuboot_link):
            os.remove(qemuboot_link)
         os.symlink(os.path.basename(qemuboot), qemuboot_link)
-- 
1.8.3.1


