Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6232C6D2C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 03:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M3C70q004293
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:12:07 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 20:12:06 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 11:12:00 +0800
Message-ID: <1382411521-8350-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1382411521-8350-1-git-send-email-ming.liu@windriver.com>
References: <1382411521-8350-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 2/3] bash: dynamically add or remove a entry to/from /etc/shells
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
X-List-Received-Date: Tue, 22 Oct 2013 03:12:05 -0000
Content-Type: text/plain

1 Add base-files to RDEPENDS.
2 Use ${base_bindir} in regex to match bash path.
3 Add pkg_postrm to remove the entry from /etc/shells that added by
pkg_postinst.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 64b476f..99875bf 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -17,6 +17,8 @@ ALTERNATIVE_PRIORITY = "100"
 
 export AUTOHEADER = "true"
 
+RDEPENDS_${PN} += "base-files"
+RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
 
 do_configure_prepend () {
@@ -44,7 +46,9 @@ do_install_ptest () {
 }
 
 pkg_postinst_${PN} () {
-	touch $D${sysconfdir}/shells
-	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
-	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
+	grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
 }
-- 
1.8.4.1


