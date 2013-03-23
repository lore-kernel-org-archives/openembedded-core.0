Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UJQlG-0002vV-Va
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 16:53:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2NFadbD013850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 08:36:42 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sat, 23 Mar 2013 08:36:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Mar 2013 11:14:17 -0500
Message-ID: <1364055257-27870-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] tcl: Fix the location of the installed headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Mar 2013 15:53:43 -0000
Content-Type: text/plain

Having '${S}' in the for loop was causing the headers to be installed
into the wrong location.  Move the 'S' to the install line.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.5.13.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.13.bb b/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
index 01fe36d..be9c61b 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.13.bb
@@ -52,10 +52,10 @@ do_install() {
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	cd ..
-	for dir in ${S}/../compat ${S}/../generic ${S}/../unix
+	for dir in compat generic unix
 	do
 		install -d ${D}${includedir}/tcl${PV}/$dir
-		install -m 0644 $dir/*.h ${D}${includedir}/tcl${PV}/$dir/
+		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/tcl${PV}/$dir/
 	done
 }
 
-- 
1.8.1.2.545.g2f19ada



