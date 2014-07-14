Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54A5E61585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 06:31:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E6VKP8021622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jul 2014 23:31:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 13 Jul 2014 23:31:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 14:31:12 +0800
Message-ID: <c36d415106e1210c21f520017b52b0ce84e064f3.1405319307.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405319307.git.Qi.Chen@windriver.com>
References: <cover.1405319307.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base-files: stage the /home directory
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
X-List-Received-Date: Mon, 14 Jul 2014 06:31:20 -0000
Content-Type: text/plain

The /home directory might be needed by packages that inherit useradd.bbclass.
One example is the 'xuser-account' recipe.

Previously, we patched the shadow package to change the behaviour of the
'--create-home' option. This is not appropriate. Instead, we should let
the base-files package also stage the /home directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6d76a2b..fe82d20 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -138,6 +138,12 @@ do_install_append_linuxstdbase() {
         done
 }
 
+sysroot_stage_home () {
+	sysroot_stage_dir ${D}/home ${SYSROOT_DESTDIR}/home
+}
+
+SYSROOT_PREPROCESS_FUNCS = "sysroot_stage_home"
+
 PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
 FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
-- 
1.7.9.5


