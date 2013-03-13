Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFrF1-0005lK-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 20:21:48 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so638413eek.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3djJc5TcAO77eQdEGmuX458wkMuaVHlLGzPanoxIoFA=;
	b=PPLx9jDDZgu7zV11rv9wif24VYLtrK5zCmBVozEH2rvBDSk7+jTC4QyzyHRnAWWqRA
	sC0p6/G/SyiQFU9qMq+528HNKGPQ/QVaePeKF3no7AXrt7kCwq0iYsFJ6d84xd/pW1Bd
	gm5oTuuJikAXC+hu6y1ol4C/kK8wWvLiEhIDU0BM+dfpjJTjssIO6ZzVKTdoQOFsvg1l
	ZHMrFFufg3Ucz5/428eyHmm2QiUVnEd1V2brYQ/E79CEiX+nY6+MrmU3Ig0ZrBMVZS4R
	UB9cMD4ZJzU9QFouY7T2/XjqFymn0BXZdSAG1EAOS6hVxzRGRUAXlDkdqdio3ux3VvMd
	Eesg==
X-Received: by 10.14.4.69 with SMTP id 45mr62684257eei.0.1363201494356;
	Wed, 13 Mar 2013 12:04:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm37811994eem.9.2013.03.13.12.04.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 12:04:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 20:04:51 +0100
Message-Id: <1363201491-27766-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] icecc: improve interaction with sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 19:21:54 -0000

* exclude ICECC_PARALLEL_MAKE (like PARALLEL_MAKE is)
* add ICECC_DISBLED to be able to disable whole icecc functionality
  while keeping icecc enabled. This is useful when you want multiple
  builders sharing same sstate-cache, but only some of them using icecc.

* inheriting icecc changes all checksums because of do_*_prepends calls,
  but because icecc should not influence binary output of task we should
  get same checksums for tasks build with and without icecc

* ICECC_DISABLED when set (to any non-empty value will disable icecc env
  modifications but while keeping same sstate checksum

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index ae74050..f3e89a9 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -26,6 +26,8 @@
 #Error checking is kept to minimum so double check any parameters you pass to the class
 ###########################################################################################
 
+BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED"
+
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
 def icecc_dep_prepend(d):
@@ -160,6 +162,10 @@ def icc_get_tool(bb, d, tool):
         return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
 
 set_icecc_env() {
+    if [ "x${ICECC_DISABLED}" != "x" ]
+    then
+        return
+    fi
     ICECC_VERSION="${@icc_version(bb, d)}"
     if [ "x${ICECC_VERSION}" = "x" ]
     then
-- 
1.8.1.5



