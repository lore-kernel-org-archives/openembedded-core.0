Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBE79751CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 07:22:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4A7LwZF016606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 00:22:13 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 00:21:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2018 15:23:38 +0800
Message-ID: <89c4498417109b230e759f869309561b93f796df.1525936967.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1525936967.git.Qi.Chen@windriver.com>
References: <cover.1525936967.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool/upgrade: fix the order of license checksum representation
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
X-List-Received-Date: Thu, 10 May 2018 07:22:23 -0000
Content-Type: text/plain

In most recipes in OE, beginline and endline are before md5 checksum.
We should obey this tradition in devtool's upgrade. Otherwise, we might
see meaningless change just because of the order change.

e.g.
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
-                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
-                    file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
-                    file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
-                    file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
-                    file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
+                    file://plugins/sudoers/redblack.c;md5=805782a8466975716f8376b2be9aedde;beginline=1;endline=41 \
+                    file://lib/util/reallocarray.c;md5=85b0905b795d4d58bf2e00635649eec6;beginline=3;endline=16 \
+                    file://lib/util/fnmatch.c;md5=67f83ee9bd456557397082f8f1be0efd;beginline=3;endline=27 \
+                    file://lib/util/getcwd.c;md5=449af4cc57fc7d46f42090608ba3e681;beginline=5;endline=27 \
+                    file://lib/util/glob.c;md5=5872733146b9eb0deb79e1f664815b85;beginline=6;endline=31 \
+                    file://lib/util/snprintf.c;md5=c82c1b3a5c32e08545c9ec5d71e41e50;beginline=6;endline=34 \
+                    file://include/sudo_queue.h;md5=449af4cc57fc7d46f42090608ba3e681;beginline=5;endline=27 \
+                    file://lib/util/inet_pton.c;md5=3970ab0518ab79cbd0bafb697f10b33a;beginline=3;endline=17 \
+                    "

After this change, it becomes:
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
                     file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
                     file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
                     file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
+                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
+                    "

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/upgrade.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c3fd866..1dde166 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -420,7 +420,10 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
                 logger.info('Source subdirectory has changed, updating S value')
 
     if license_diff:
-        newlicchksum = " ".join(["file://{};md5={}".format(l["path"], l["actual_md5"]) + (";beginline={}".format(l["beginline"]) if l["beginline"] else "") + (";endline={}".format(l["endline"]) if l["endline"] else "") for l in new_licenses])
+        newlicchksum = " ".join(["file://{}".format(l['path']) +
+                                 (";beginline={}".format(l['beginline']) if l['beginline'] else "") +
+                                 (";endline={}".format(l['endline']) if l['endline'] else "") +
+                                 (";md5={}".format(l['actual_md5'])) for l in new_licenses])
         newvalues["LIC_FILES_CHKSUM"] = newlicchksum
         _add_license_diff_to_recipe(fullpath, license_diff)
 
-- 
1.9.1


