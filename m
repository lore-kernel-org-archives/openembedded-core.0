Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CED8D7130F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZaYc021155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:49 +0800
Message-ID: <479939f8aff61e4697df9b04a072a52c9108be7c.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] insane.bbclass: make the checking stricter for unsafe references in scripts
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:35 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

[CQID: WIND00444742]

Previously, the checking for unsafe references is not strict enough. It
only checks whether '/usr/' is in the script. As a result, any script
containing statements like below will match this check.

	   PATH="/bin:/sbin:/usr/bin:/usr/sbin"

However, as we can see, this is actually not an unsafe reference. What
we really want to check is something like '/usr/bin/tail', so we should
make the checking stricter.

This patch solves the QA warning in gzip and nfs-utils.

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3dd2e7f..4dc0220 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -385,7 +385,7 @@ def package_qa_check_unsafe_references_in_scripts(path, name, d, elf, messages):
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


