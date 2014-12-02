Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66EE4605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 10:25:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB2APjHk023398
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Dec 2014 02:25:45 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 02:25:44 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 18:26:06 +0800
Message-ID: <d25f21723889062609cbb41db864b69e3e784f6e.1417515914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417515914.git.Qi.Chen@windriver.com>
References: <cover.1417515914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bootchart2: fix to find collector correctly in case of multilib
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
X-List-Received-Date: Tue, 02 Dec 2014 10:25:45 -0000
Content-Type: text/plain

This patch fixes the following error of being not able to find the
bootchart-collector program when using bootchart2 in multilib system.

In order for bootchartd to correctly find the collector program, we need
to set several vars while compiling.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
index 04fb901..5fc7211 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
@@ -120,6 +120,12 @@ do_compile_append_class-native () {
     chmod +x ${S}/pybootchartgui
 }
 
+do_compile_prepend () {
+    export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
+    export BINDIR="${bindir}"
+    export LIBDIR="${base_libdir}"
+}
+
 do_install () {
     install -d ${D}${sysconfdir} # needed for -native
     export PY_LIBDIR="${libdir}/${PYTHON_DIR}"
-- 
1.9.1


