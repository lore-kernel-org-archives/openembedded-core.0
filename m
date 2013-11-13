Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACA36D95F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:23:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6N9Md001351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:09 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:07 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:07 +0800
Message-ID: <7fc0bd55dfd2feece904f1ce764174f08b9df62f.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384323613.git.Qi.Chen@windriver.com>
References: <cover.1384323613.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/7] insane.bbclass: make the checking stricter for unsafe references in scripts
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:06 -0000
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
 meta/classes/insane.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index eb440c2..281af95 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -367,7 +367,7 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
 		if bool(statinfo.st_mode & stat.S_IXUSR):
 			# grep shell scripts for possible references to /exec_prefix/
 			exec_prefix = d.getVar('exec_prefix', True)
-			statement = "grep -e '%s/' %s > /dev/null" % (exec_prefix, path)
+			statement = "grep -e '%s/[^ :]\{1,\}/[^ :]\{1,\}' %s > /dev/null" % (exec_prefix, path)
 			if subprocess.call(statement, shell=True) == 0:
 				error_msg = pn + ": Found a reference to %s/ in %s" % (exec_prefix, path)
 				package_qa_handle_error("unsafe-references-in-scripts", error_msg, d)
-- 
1.7.9.5


