Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDF39784F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:10:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FGAsgS019310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:10:57 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 09:10:51 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 09:10:51 -0700
Message-ID: <20170815161051.70202-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] openssl10: Fix conflict between openssl and openssl10 man pages.
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
X-List-Received-Date: Tue, 15 Aug 2017 16:10:56 -0000
Content-Type: text/plain

The package resolver failes to assemble images because some of the man
pages in openssl10 conflict with the openssl package.  In the case
where you want openssl, openssh and the documentation installed in the
same system you will see the failure.

The work around is to rename all the openssl10 man pages and symlinks
to have a prefix of openssl10-.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index c93d5d8738..54cf4598e1 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -199,6 +199,16 @@ do_install () {
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
 	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
+
+	# Rename man pages to prefix openssl10-*
+	for f in `find ${D}${mandir} -type f`; do
+	    mv $f $(dirname $f)/openssl10-$(basename $f)
+	done
+	for f in `find ${D}${mandir} -type l`; do
+	    ln_f=`readlink $f`
+	    rm -f $f
+	    ln -s openssl10-$ln_f $(dirname $f)/openssl10-$(basename $f)
+	done
 }
 
 do_install_ptest () {
-- 
2.11.0


