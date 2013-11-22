Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCB16D128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 21:18:59 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so726307eaj.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T5uB7I7QnT8tfJgM6ufhKiTKb32qZ81nxjmZINjOfNE=;
	b=enU7MmR/ErVXechi3HNPQMKINa4e0LQHOlBKBMb6q6LNAjt9RWAG9JfHCFLxqvA+0U
	3aF77IBYSSFhyDT08VmRUGmC91e52uP5DY/gnwhdb0o7yHBRo6ujUuPHSH4OLxiyBNrs
	uOgaZqStbJPi6fOuF1w49USzofM+nDcGOHCZe2AllFZn07BYicW1gHrke7nQOldrqa+d
	+cz85Vg2VIqmraX8EfgoQiIb5WsJQ0LK/espH439AiBwZOSmYU5oSxQjAyubezvQd58H
	6KcjtG1EnHY2PUuTmBRVS8017JrG7XvuNRcmRAhjWsDZoBszOXpRVzZPjqcxwIMUHAzh
	C7cA==
X-Received: by 10.14.149.139 with SMTP id x11mr156910eej.35.1385155138484;
	Fri, 22 Nov 2013 13:18:58 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm80425093eew.18.2013.11.22.13.18.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 13:18:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 22:19:03 +0100
Message-Id: <1385155143-31331-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] base.bbclass: Set umask 022 also for do_unpack task
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
X-List-Received-Date: Fri, 22 Nov 2013 21:19:00 -0000

* when git checkouts files from fetched clone it respects system umask
  and creates files with different permissions, if such files are copied
  to packages, resulting target images have also different permissions
  on them.
* we need reproducible builds across different builders with different
  system umask, so set 022 umask

[YOCTO #5590]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 93bc700..189143f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -485,6 +485,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.setVarFlag('do_unpack', 'umask', 022)
         d.setVarFlag('do_configure', 'umask', 022)
         d.setVarFlag('do_compile', 'umask', 022)
         d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
-- 
1.8.4.3


