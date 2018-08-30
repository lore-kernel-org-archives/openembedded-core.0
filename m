Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C498F79373
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 04:58:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U4wwjl015025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 21:58:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 21:58:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 13:03:40 +0800
Message-ID: <c3d10184871157151bfd2f0b6ed95fff6cb69845.1535605397.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535605397.git.Qi.Chen@windriver.com>
References: <cover.1535605397.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: warn if perms conf file does not exist
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
X-List-Received-Date: Thu, 30 Aug 2018 04:58:58 -0000
Content-Type: text/plain

It's possible that the perms conf file specified by FILESYSTEM_PERMS_TABLES
does not exist. Currently, this situation is silently ignored, which
is likely to lead to further do_rootfs failures.

So fix to output a warning, telling user that the specified file
in FILESYSTEM_PERMS_TABLES cannot be found.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9cfe43c..0b6f65a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -774,7 +774,11 @@ python fixup_perms () {
         bbpath = d.getVar('BBPATH')
         fs_perms_tables = d.getVar('FILESYSTEM_PERMS_TABLES') or ""
         for conf_file in fs_perms_tables.split():
-            str += " %s" % bb.utils.which(bbpath, conf_file)
+            confpath = bb.utils.which(bbpath, conf_file)
+            if confpath:
+                str += " %s" % bb.utils.which(bbpath, conf_file)
+            else:
+                bb.warn("cannot find %s specified in FILESYSTEM_PERMS_TABLES" % conf_file)
         return str
 
 
-- 
1.9.1


