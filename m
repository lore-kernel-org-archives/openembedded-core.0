Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B60560088
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 01:54:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t611sZG0018782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 18:54:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 30 Jun 2015 18:54:35 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 09:54:14 +0800
Message-ID: <1435715654-11793-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] bootchart2: add runtime dependency
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
X-List-Received-Date: Wed, 01 Jul 2015 01:54:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Bootchartd needs the command lsb_release and pidof to run, pidof maybe
provided by sysvinit or procpus;
To native bootchart2, only pybootchartgui is used, and which is not needed
both pidof and lsb_release

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
index 5fc7211..ea9f179 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -143,6 +143,8 @@ do_install () {
 PACKAGES =+ "pybootchartgui"
 FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
 RDEPENDS_pybootchartgui = "python-pycairo python-compression python-image python-textutils python-shell python-compression python-codecs"
+RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
+RDEPENDS_${PN}_class-target += "lsb"
 DEPENDS_append_class-native = " python-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
-- 
1.9.1


