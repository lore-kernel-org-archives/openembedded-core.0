Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8536E681
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 02:38:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1J2c6Qi019093
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 18:38:07 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 18 Feb 2016 18:38:06 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 10:38:39 +0800
Message-ID: <e74382b4ce479b57ebfd9e68bd75bef1c75eeb78.1455849409.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455849409.git.Qi.Chen@windriver.com>
References: <cover.1455849409.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: make the checking stricter for unsafe references in scripts
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
X-List-Received-Date: Fri, 19 Feb 2016 02:38:08 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Previously, the checking for unsafe references is not strict enough. It
only checks whether '/usr/' is in the script. As a result, any script
containing statements like below will match this check.

	   PATH="/bin:/sbin:/usr/bin:/usr/sbin"

However, as we can see, this is actually not an unsafe reference. What
we really want to check is something like '/usr/bin/tail', so we should
make the checking stricter.

This patch solves the QA warning in gzip and nfs-utils.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index aef08fe..96851a3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -428,7 +428,7 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
         if bool(statinfo.st_mode & stat.S_IXUSR):
             # grep shell scripts for possible references to /exec_prefix/
             exec_prefix = d.getVar('exec_prefix', True)
-            statement = "grep -e '%s/' %s > /dev/null" % (exec_prefix, path)
+            statement = "grep -e '%s/[^ :]\{1,\}/[^ :]\{1,\}' %s > /dev/null" % (exec_prefix, path)
             if subprocess.call(statement, shell=True) == 0:
                 error_msg = pn + ": Found a reference to %s/ in %s" % (exec_prefix, path)
                 package_qa_handle_error("unsafe-references-in-scripts", error_msg, d)
-- 
1.9.1


