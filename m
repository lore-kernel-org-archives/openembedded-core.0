Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9D466A4AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 09:28:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r569SI3O012101
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 02:28:18 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 02:28:16 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 17:28:10 +0800
Message-ID: <1c14aa64c8618df5c99815044972621a418e4a46.1370510036.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370510036.git.wenzong.fan@windriver.com>
References: <cover.1370510036.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] chkconfig: fix QA warning about unsafe references in binaries
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
X-List-Received-Date: Thu, 06 Jun 2013 09:28:16 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This test is disabled in oe-core by default, but if we enable it, we'll
get following warnings:

  + WARN_QA = "unsafe-references-in-binaries unsafe-references-in-scripts"

WARNING: QA Issue: chkconfig: /sbin/chkconfig, installed in the \
base_prefix, requires a shared library under exec_prefix (/usr): \
libpopt.so.0 => /usr/lib64/libpopt.so.0

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 4c6985f..c6f8b1d 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -43,7 +43,8 @@ obey_variables () {
 }
 
 do_install() {
-	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' install
+	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' \
+		'BINDIR=${sbindir}' install
 	install -d ${D}${sysconfdir}/chkconfig.d
 }
 
-- 
1.7.10.4


