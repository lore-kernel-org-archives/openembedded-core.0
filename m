Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9762F60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 05:54:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T5svdx021391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 22:54:57 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 22:54:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul.eggleton@linux.intel.com>
Date: Wed, 29 Oct 2014 13:54:49 +0800
Message-ID: <738d563d01440ca62b0937352cf79b175e45a6f9.1414561710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414561710.git.hongxu.jia@windriver.com>
References: <cover.1414561710.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] man-pages/shadow: resolve man pages confliction
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
X-List-Received-Date: Wed, 29 Oct 2014 05:55:00 -0000
Content-Type: text/plain

Invoke smart/rpm to install man-pages and shadow-doc, there
is a build failure:
...
|error: file /usr/share/man/man5/passwd.5 from install of
shadow-doc-4.2.1-r0.0.core2_64 conflicts with file from
package man-pages-3.70-r0.0.core2_64
|error: file /usr/share/man/man3/getspnam.3 from install of
shadow-doc-4.2.1-r0.0.core2_64 conflicts with file from
package man-pages-3.70-r0.0.core2_64
...
Use alternatives mechanism to fix it.

As README in man-pages said: "Note that sometimes these
pages are duplicates of pages also distributed in other
packages. Be careful not to overwrite more up-to-date
versions. So we set man-pages with lower priority.

[YOCTO #6769]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man-pages/man-pages_3.71.bb | 7 +++++++
 meta/recipes-extended/shadow/shadow.inc           | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.71.bb b/meta/recipes-extended/man-pages/man-pages_3.71.bb
index 759bad5..225b256 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.71.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.71.bb
@@ -27,3 +27,10 @@ do_install() {
 # Only deliveres man-pages so FILES_${PN} gets everything
 FILES_${PN}-doc = ""
 FILES_${PN} = "${mandir}/*"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "passwd.5 getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
+ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6a769df..20773e7 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -158,6 +158,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
+ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
+ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
 	  rootarg="--root $D"
-- 
1.9.1


