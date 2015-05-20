Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6044865D19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 01:31:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4K1Vgjd008200
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 18:31:43 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 19 May 2015 18:31:41 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 May 2015 09:31:15 +0800
Message-ID: <1432085475-24806-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Wed, 20 May 2015 01:31:45 -0000
Content-Type: text/plain

When update-alternatives is moved from opkg to opkg-utils, a line in
the file is changed
from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
 in oe-core build by configuring --with-opkglibdir.
opkg-utils can't get the var value in opkg, so here define opkglibdir to
set the path.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2800a5d..fc12d91 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -22,8 +22,11 @@ PYTHONRDEPS_class-native = ""
 PACKAGECONFIG = "python"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
 
+opkglibdir = "/var/lib"
+
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+	sed -i s:/usr/lib/opkg:${opkglibdir}/opkg: ${D}${bindir}/update-alternatives
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
1.7.9.5


