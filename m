Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA6C560017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 09:30:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s639U4AF028288
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 02:30:04 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Jul 2014 02:30:03 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 17:30:00 +0800
Message-ID: <1404379801-16174-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH 1/2] groff: Fix build on Fedora 17 for 1.18.1.4
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
X-List-Received-Date: Thu, 03 Jul 2014 09:30:04 -0000
Content-Type: text/plain

The commit 79fc5576:
[ groff: Fix build on Fedora 17 ]

was applied to 1.22.2, but it's also needed by 1.18.1.4 to solve a same
issue.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/groff/groff_1.18.1.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index 85357c5..6871949 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -26,6 +26,14 @@ do_configure (){
 }
 
 do_install_append() {
+	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+	for i in afmtodit mmroff; do
+		if [ -f ${D}${bindir}/$i ]; then
+			sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/$i
+		fi
+	done
+
 	mkdir -p ${D}${sysconfdir}/groff
 	cp -rf ${D}${datadir}/groff/site-tmac/* ${D}${sysconfdir}/groff/
 	cp -rf ${D}${datadir}/groff/site-tmac/* ${D}${datadir}/groff/${PV}/tmac/
-- 
1.8.4.1


