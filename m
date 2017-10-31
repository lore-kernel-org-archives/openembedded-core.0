Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBA37017B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:13:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V2DaA8015602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 19:13:36 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 19:13:35 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 10:12:42 +0800
Message-ID: <1509415962-186373-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH v4] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Tue, 31 Oct 2017 02:13:39 -0000
Content-Type: text/plain

When update-alternatives is moved from opkg to opkg-utils, a line in
the file is changed
from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
 in oe-core build by configuring --with-opkglibdir.
opkg-utils can't get the var value in opkg, so here define OPKGLIBDIR to
set the path.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
index 646cc8f..ea32246 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
 PACKAGECONFIG[update-alternatives] = ",,,"
 
+target_localstatedir := "${localstatedir}"
+OPKGLIBDIR = "${target_localstatedir}/lib"
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
@@ -34,6 +36,7 @@ do_install() {
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
         grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
     fi
+    sed -i s:/usr/lib/opkg:${OPKGLIBDIR}/opkg: ${D}${bindir}/update-alternatives
 }
 
 do_install_append_class-target() {
-- 
1.9.1


