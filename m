Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 903E565C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 07:15:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t247Fbwp017428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Mar 2015 23:15:37 -0800 (PST)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 3 Mar 2015 23:15:36 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 15:15:35 +0800
Message-ID: <1425453335-26755-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] bootchart2: /sbin/bootchartd referencing wrong libdir
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
X-List-Received-Date: Wed, 04 Mar 2015 07:15:36 -0000
Content-Type: text/plain

- During do_compile(), LIBDIR is set with default vaule which
  is /lib. bootchartd will use LIBDIR to comprise the path of
  bootchart-collector when compiling.
  But during do_install(), LIBDIR is set to /lib64. The path
  that bootchart-collector is installed in is under LIBDIR

  So bootchartd can not find bootchart-collector.

  Set LIBDIR to /lib64 during both task to fix this inconsistence

- bootchartd depends the command lsb_release and pidof during
  running, so add sysvinit-pidof and lsb in the RDEPENDS

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
index 04fb901..2c6d0ff 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -120,6 +120,10 @@ do_compile_append_class-native () {
     chmod +x ${S}/pybootchartgui
 }
 
+do_compile_prepend () {
+    export LIBDIR="${base_libdir}"
+}
+
 do_install () {
     install -d ${D}${sysconfdir} # needed for -native
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
@@ -136,6 +140,7 @@ do_install () {
 
 PACKAGES =+ "pybootchartgui"
 FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
+RDEPENDS_${PN} = "sysvinit-pidof lsb"
 RDEPENDS_pybootchartgui = "python-pycairo python-compression python-image python-textutils python-shell python-compression python-codecs"
 DEPENDS_append_class-native = " python-pycairo-native"
 
-- 
1.8.5.2.233.g932f7e4


