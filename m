Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4FB160167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 01:28:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s891SJWT025793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 18:28:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 18:28:18 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:22:22 +0800
Message-ID: <563bac1cd65228d68f8d74b92f3ce21ccccee421.1410225676.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410225676.git.Chong.Lu@windriver.com>
References: <cover.1410225676.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/1] perf: fix issue about package splitting
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
X-List-Received-Date: Tue, 09 Sep 2014 01:28:21 -0000
Content-Type: text/plain

Currently, perf can't split to perf-archive, perf-tests, perf-python and
perf-perl. All files are included in perf package. Change the perfexecdir
variable to make split successfull. Add python to RDEPENDS_perf-tests.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ebfedb9..24c7388 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -125,7 +125,8 @@ do_configure_prepend () {
     # config/Makefile.
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
         # Match $(prefix)/$(lib) and $(prefix)/lib
-        sed -i 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
+        sed -i -e 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
+               -e 's,^perfexecdir = \(.*\),perfexecdir ?= \1,' \
             ${S}/tools/perf/config/Makefile
     fi
     # We need to ensure the --sysroot option in CC is preserved
@@ -155,6 +156,7 @@ RDEPENDS_${PN} += "elfutils"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
+RDEPENDS_${PN}-tests =+ "python"
 
 RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
1.9.1


