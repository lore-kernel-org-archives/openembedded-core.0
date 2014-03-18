Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id C42CF6F910
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:05:59 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id pa12so7347481veb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zsh4QItvUP3Tn13G4g03zeJVjIgS5Zxn7CcV1nef3T8=;
	b=iGC2Bj//32yFAT+eSuaxm8Iqp0Y1W60/csfmPt+v0iV10nsZ6/AZ6H/yi5cWn9JFp3
	RZGMQgY4A58t/ivdlE/S68+kuPBJbAz4a2sEMs9qxbiXTCz5T39Tn7OiX61x4zK0CrI8
	MiKUgjC6p1LAyl1ivvdkghANmVoVQ7EDi5v9gCA97garZSImIBPMmWXxIqWYAgYXU/gW
	6W+gyTKx2ORcTu8tnutJU3UdiGKGLlE/6USVPpZ819zo48DHC0EtaFwcHjcxAl6UPMbY
	o4qI/t5CVShF783qWX06GIn+vvpV+YVZ+hgNkquRpYcfyQkHGxIxoUe/VuBOvPcwXsPG
	n1Mg==
X-Received: by 10.58.221.102 with SMTP id qd6mr876079vec.47.1395158760358;
	Tue, 18 Mar 2014 09:06:00 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id v20sm4467408vdj.0.2014.03.18.09.05.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Mar 2014 09:05:59 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:05:45 -0300
Message-Id: <1395158745-9424-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
References: <1395158745-9424-1-git-send-email-joaohf@gmail.com>
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH] wic: Add SD/MMC-Cards support to '--ondisk' param
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
X-List-Received-Date: Tue, 18 Mar 2014 16:06:02 -0000

The special case when wic is set up to use SD/MMC-Cards in place
of sdX disks is not handled properly.

Append 'p' to the rootdev when disk is SD/MMC-Cards fix this situation.
---
 scripts/lib/mic/imager/direct.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index f8c300c..1f2f8fc 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -345,10 +345,14 @@ class DirectImageCreator(BaseImageCreator):
         parts = self._get_parts()
         for num, p in enumerate(parts, 1):
             if p.mountpoint == "/":
+                part = ''
+                if p.disk.startswith('mmcblk'):
+                    part = 'p'
+
                 if self._ptable_format == 'msdos' and num > 3:
-                    rootdev = "/dev/%s%-d" % (p.disk, num + 1)
+                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num + 1)
                 else:
-                    rootdev = "/dev/%s%-d" % (p.disk, num)
+                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num)
                 root_part_uuid = p.part_type
 
         return (rootdev, root_part_uuid)
-- 
1.8.3.2


