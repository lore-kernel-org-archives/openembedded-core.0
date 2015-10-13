Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D9DA365C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:19:29 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so197047532wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SkfkgY07/+M7GPr3H5zyfZsnWrtXafQ2/Dttcz3z9vk=;
	b=hWdUtm44yeClpvBbUwoo2triPfF16+JZ/gelSWdKn9wfVRBKOyLW0VZXIRIaiwch5e
	MkNMXQu8H9xhsV1KaFvmPVU6L8isADtT6dANxQxV44f5gnO6hQDM8FqsjvR0vdzfd6X8
	o+YUr7B3L7HNJN0/ltvxoY5fze0k66TucgRLRoK/9KV1/B7F1NgToQwtlw3B3g/E8O8/
	X00ZrAxr+ajYovLmner+8/TDQRgCIcO0QKnDOs/iv3XX1KVJ79lAL33DHPqPUQbqdAur
	XM96IKg+8ZGhnek5rDiseZ94309ZeIOlZa/YFWvyegHkDPyf2RAdNC5GUdB+HYElRuJb
	7AKQ==
X-Gm-Message-State: ALoCoQkxUaF8+9uFa5URw9hozELMgwy+zpDeQ9beI6t8YkzySfgqaYIYk4f4QpqGvDlLrPIi+CP1
X-Received: by 10.194.22.69 with SMTP id b5mr36540977wjf.157.1444749545753;
	Tue, 13 Oct 2015 08:19:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	wt4sm4257960wjb.29.2015.10.13.08.19.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 08:19:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 16:11:39 +0100
Message-Id: <1444749099-24780-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] metadata_scm: rewrite git hash logic
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
X-List-Received-Date: Tue, 13 Oct 2015 15:19:30 -0000

The code to get the git and branch hash for the current commit in a specific
repository was quite complex and prone to breakage, replace it with subprocess
and git rev-parse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/metadata_scm.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 237e618..64465fa 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -65,18 +65,19 @@ def base_get_metadata_svn_revision(path, d):
     return revision
 
 def base_get_metadata_git_branch(path, d):
-    branch = os.popen('cd %s; git branch 2>&1 | grep "^* " | tr -d "* "' % path).read()
+    import subprocess
 
-    if len(branch) != 0:
-        return branch
-    return "<unknown>"
+    try:
+        return subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"],
+                                       cwd=path).strip()
+    except:
+        return "<unknown>"
 
 def base_get_metadata_git_revision(path, d):
-    f = os.popen("cd %s; git log -n 1 --pretty=oneline -- 2>&1" % path)
-    data = f.read()
-    if f.close() is None:        
-        rev = data.split(" ")[0]
-        if len(rev) != 0:
-            return rev
-    return "<unknown>"
+    import subprocess
 
+    try:
+        return subprocess.check_output(["git", "rev-parse", "HEAD"],
+                                       cwd=path).strip()
+    except:
+        return "<unknown>"
-- 
2.1.4


