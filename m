Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2590F7701F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:13:52 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30545841wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aJANxERUpTig9fB8WnxTQoxwyhFuIXOXDHOlDIMfe9g=;
	b=X97KvNKob+yySk6Gy1wLpIsW4UO7hHi2AJZW3RIwzvbb859iqfb04c6iJyVxLIf/sq
	c2reDERASmKcHC7P6YVslo8uAMtiDhpWOiUrUCAJDVntma6NS2CcEjguP0YYJY4QTKh2
	0X8YeynIdiIHVUvcGVOxJ2ZeNclZXUJw9s6ihRgjdpfTUhG39pRzKAw2ByPfTMcBOKpp
	mO0iWU/L9ZnyUROBb8F7bOfnQDkEKJtn+EFwRSBWpYaGxeBwOpodZBy0AM6aJFs5YPdc
	A9WHfcUuHZ4M/Z4IdgCKtl+Mx8Ssm9v2Z0hEGc77Ed3A5UueKFN9OxFeo9kGGQj6Q90B
	bmwA==
X-Received: by 10.194.7.197 with SMTP id l5mr7939489wja.153.1442582032464;
	Fri, 18 Sep 2015 06:13:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bq7sm8817887wjc.31.2015.09.18.06.13.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 06:13:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 15:14:07 +0200
Message-Id: <1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150918115458.GA11095@jama>
References: <20150918115458.GA11095@jama>
Subject: [PATCH 1/3] insane.bbclass: show PN and relative path in package_qa_check_host_user
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
X-List-Received-Date: Fri, 18 Sep 2015 13:13:54 -0000

* show PN as other QA checks
* strip PKGDEST prefix from shown path as other QA checks

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5c8629a..a35e546 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -980,6 +980,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
         return
 
     dest = d.getVar('PKGDEST', True)
+    pn = d.getVar('PN', True)
     home = os.path.join(dest, 'home')
     if path == home or path.startswith(home + os.sep):
         return
@@ -991,14 +992,15 @@ def package_qa_check_host_user(path, name, d, elf, messages):
         if exc.errno != errno.ENOENT:
             raise
     else:
+        rootfs_path = path[len(dest):]
         check_uid = int(d.getVar('HOST_USER_UID', True))
         if stat.st_uid == check_uid:
-            messages["host-user-contaminated"] = "%s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_uid)
+            messages["host-user-contaminated"] = "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid)
             return False
 
         check_gid = int(d.getVar('HOST_USER_GID', True))
         if stat.st_gid == check_gid:
-            messages["host-user-contaminated"] = "%s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (path, check_gid)
+            messages["host-user-contaminated"] = "$s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid)
             return False
     return True
 
-- 
2.5.1


