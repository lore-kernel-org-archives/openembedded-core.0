Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9946460EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:28:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2P8SQZO016325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 01:28:26 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 25 Mar 2014 01:28:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 16:34:14 +0800
Message-ID: <790da89f24d3ff4dc3964ff5ce4b479cbb709366.1395736394.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395736394.git.liezhi.yang@windriver.com>
References: <cover.1395736394.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tcl: fix path in Config.sh for sstate
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
X-List-Received-Date: Tue, 25 Mar 2014 08:28:27 -0000
Content-Type: text/plain

We need fix the path in tclConfig.sh, tdbcConfig.sh and itclConfig.sh
for sstate, otherwise there would be build failures when use the sstate
across different builds.

e.g., when building expect:
[snip]
tmp/sysroots/qemuarma9/usr/include/tcl8.6
checking for Tcl private include files... configure: error: Cannot find private header tclInt.h in
/path/to/another/build/tmp/sysroots/qemuarma9/usr/include/tcl8.6.1
Configure failed.
[snip]

[YOCTO #6035]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 79a3f08..9d35da1 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -90,3 +90,6 @@ do_install_ptest() {
 	cp -r ${S}/../library ${D}${PTEST_PATH}
 	cp -r ${S}/../tests ${D}${PTEST_PATH}
 }
+
+# Fix the path in sstate
+SSTATE_SCAN_FILES += "*Config.sh"
-- 
1.8.3.1


