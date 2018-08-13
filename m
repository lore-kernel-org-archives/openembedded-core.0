Return-Path: <konstantin.shemyak@ge.com>
X-Greylist: delayed 2542 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Aug 2018 08:06:32 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 489B86E650
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:06:32 +0000 (UTC)
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
	by m0048275.ppops.net-00176a03. (8.16.0.22/8.16.0.22) with SMTP id
	w7D7N5VP047089 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:24:11 -0400
From: Konstantin Shemyak <konstantin.shemyak@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 10:23:28 +0300
Message-Id: <20180813072328.107451-1-konstantin.shemyak@ge.com>
X-Mailer: git-send-email 2.10.1
X-GEHealthcare-MailScanner: Found to be clean
X-GEHealthcare-MailScanner-From: konstantin.shemyak@ge.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-13_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1807170000
	definitions=main-1808130083
Subject: [PATCH] cve-check.bbclass: do not download the CVE DB in package-specific tasks
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
X-List-Received-Date: Mon, 13 Aug 2018 08:06:32 -0000

Disable downloading of the vulnerability DB in do_check_cves() task.

When invoked in this task, cve-check-tool attempts re-download of the CVE DB
if the latter is older than certain threshold. While reasonable for a
stand-alone CVE checker, this behavior can cause errors in parallel builds
if the build time is longer than this threshold: 
* Other tasks might be using the DB.
* Several packages can start the download of the same file at the same time.

This check is not really needed, as the DB has been downloaded by
cve_check_tool:do_populate_cve_db() which is a prerequisite of any do_build().
The DB will be at most (threshold + build_time) old.

Signed-off-by: Konstantin Shemyak <konstantin.shemyak@ge.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 4d99838..12ad3e5 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -179,7 +179,7 @@ def check_cves(d, patched_cves):
     cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
     cve_cmd = "cve-check-tool"
-    cmd = [cve_cmd, "--no-html", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
+    cmd = [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
-- 
2.10.1


