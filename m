Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 282CE6D80D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:29:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA95T4eE015875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:29:04 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:29:03 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:56 +0800
Message-ID: <764c24934d2e1e7be976bf602cc4158155383738.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] insane.bbclass: make the checking stricter for unsafe references in scripts
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
X-List-Received-Date: Sat, 09 Nov 2013 05:29:02 -0000
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


