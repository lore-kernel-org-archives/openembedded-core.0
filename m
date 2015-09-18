Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CB95F72A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 15:14:58 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so36773598wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u7erHy3m6EUdkZZ25ktJQ+bPDvpV/1i4gamIMzfEsqo=;
	b=G5FwQHSJbZKjM7241VKdxNsBiTzq7yLTHaGIXQnaSyEcduCE67Fkrc3Kv60xrU/upl
	dEA/FlnYBSv2FA6GWWJVaCZM0opm0bMFbPa2am4KASg3AsLh82O0XvMTjmoyOXqQzzpS
	7vQ+v+QnmopMe3wdxgUdeAMXl7RR0JVG7VWJ1qVZaaMbcRUs0+50m4rLy0303G8I1C9y
	Rw35dHMmd9cxHYf7VZCDqGgbqjB3L8EwehBupvFVT6CQCWHyBOH0vDWGIg8scAuknqcU
	ESmwE1lvO66VUDAiq21oHYS+YI/rXlM61ppvOTSThOQXz1xX1EmKH2l+GLYuy9mkssmc
	xWCA==
X-Received: by 10.180.188.211 with SMTP id gc19mr17841194wic.81.1442589298743; 
	Fri, 18 Sep 2015 08:14:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id hk5sm9376805wjb.6.2015.09.18.08.14.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 08:14:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 17:15:22 +0200
Message-Id: <1442589322-12110-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <55FC149B.80800@topic.nl>
References: <55FC149B.80800@topic.nl>
Subject: [PATCHv2 1/3] insane.bbclass: show PN and relative path in package_qa_check_host_user
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
X-List-Received-Date: Fri, 18 Sep 2015 15:15:04 -0000

* show PN as other QA checks
* strip PKGDEST prefix from shown path as other QA checks

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5c8629a..c984fae 100644
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
+            messages["host-user-contaminated"] = "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid)
             return False
     return True
 
-- 
2.5.1


