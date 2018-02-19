Return-Path: <konstantin.shemyak@ge.com>
X-Greylist: delayed 1273 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Feb 2018 14:57:41 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5270578289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 14:57:41 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
	by m0047961.ppops.net-00176a03. (8.16.0.22/8.16.0.22) with SMTP id
	w1JEXVrj040098 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 09:36:34 -0500
From: Konstantin Shemyak <konstantin.shemyak@ge.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Feb 2018 16:35:54 +0200
Message-ID: <1519050954-29266-2-git-send-email-konstantin.shemyak@ge.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519050954-29266-1-git-send-email-konstantin.shemyak@ge.com>
References: <1519050954-29266-1-git-send-email-konstantin.shemyak@ge.com>
MIME-Version: 1.0
X-Originating-IP: [3.159.212.191]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=978
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1711220000
	definitions=main-1802190182
Subject: [PATCH 1/1] cve-check-tool: correctly exported web proxies
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
X-List-Received-Date: Mon, 19 Feb 2018 14:57:42 -0000
Content-Type: text/plain

The binary 'cve-check-update' downloads the CVE database from the Internet.
If the system is behind a web proxy, the download fails, as proxy-related
variables are not exported.
In turn, 'cve-check-tool' does not connect to the network and correspondingly
does not need exported proxies.

Exported all proxy-related environment variables to 'cve-check-update' and
removed the unneeded export from 'cve-check-tool'.

Signed-off-by: Konstantin Shemyak <konstantin.shemyak@ge.com>
---
 meta/classes/cve-check.bbclass                               | 3 ---
 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index d8087dd..537659d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -184,9 +184,6 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
-    # It is needed to export the proxies to download the database using HTTP
-    bb.utils.export_proxies(d)
-
     try:
         # Write the faux CSV file to be used with cve-check-tool
         fd, faux = tempfile.mkstemp(prefix="cve-faux-")
diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 7b70daa..1c84fb1 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -41,6 +41,7 @@ do_populate_cve_db() {
     [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
     [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
 
+    unused="${@bb.utils.export_proxies(d)}"
     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
     # --cacert works around curl-native not finding the CA bundle
     if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
-- 
2.7.4


