Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC5527FD7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 01:31:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8I1VbZO000702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 18:31:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 17 Sep 2019 18:31:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2019 09:31:25 +0800
Message-ID: <1568770285-205402-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] report-error.bbclass: add local.conf/auto.conf into error report
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
X-List-Received-Date: Wed, 18 Sep 2019 01:31:57 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

sometimes, it is not enough to reproduce a failed build with current
info on error reports web, add local.conf/auto.conf into error
report to make it more easier to reproduce failed build

Note: this need work together with change in repo error-report-web,
which will display local.conf and auto.conf as Error Details

[YOCTO #13252]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/report-error.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 1c55abf..ea043b2 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -25,6 +25,19 @@ def errorreport_savedata(e, newdata, file):
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
+def get_conf_data(e, filename):
+    builddir = e.data.getVar('TOPDIR')
+    filepath = os.path.join(builddir, "conf", filename)
+    jsonstring = ""
+    if os.path.exists(filepath):
+        with open(filepath, 'r') as f:
+            for line in f.readlines():
+                if line.startswith("#") or len(line.strip()) == 0:
+                    continue
+                else:
+                    jsonstring=jsonstring + line
+    return jsonstring
+
 python errorreport_handler () {
         import json
         import codecs
@@ -51,6 +64,8 @@ python errorreport_handler () {
             data['failures'] = []
             data['component'] = " ".join(e.getPkgs())
             data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
+            data['local_conf'] = get_conf_data(e, 'local.conf')
+            data['auto_conf'] = get_conf_data(e, 'auto.conf')
             lock = bb.utils.lockfile(datafile + '.lock')
             errorreport_savedata(e, data, "error-report.txt")
             bb.utils.unlockfile(lock)
-- 
2.7.4


