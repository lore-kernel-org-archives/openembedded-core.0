Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREQ-0007b5-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPFQ3026678
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:15 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:05 -0500
Message-ID: <b18d9b4122913f6c5e039f2d90e8575fe68122a3.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 11/40] classes/package_rpm.bbclass: Enhance diagnostic messages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 17:28:50 -0000
Content-Type: text/plain

We clearly state now if we are:
  * Skipping an empty package
  * Creating a (full) package
  * Creating an empty package

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d8e86c5..9a854f3 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -486,7 +486,10 @@ python write_specfile () {
 				spec_files_top.append('%files')
 				spec_files_top.append('%defattr(-,-,-,-)')
 				if file_list:
+					bb.note("Creating RPM package for %s" % splitname)
 					spec_files_top.extend(file_list)
+				else:
+					bb.note("Creating EMPTY RPM Package for %s" % splitname)
 				spec_files_top.append('')
 
 			bb.utils.unlockfile(lf)
@@ -569,11 +572,13 @@ python write_specfile () {
 		if not file_list and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
 			bb.note("Not creating empty RPM package for %s" % splitname)
 		else:
-			bb.note("Creating RPM package for %s" % splitname)
 			spec_files_bottom.append('%%files -n %s' % splitname)
 			spec_files_bottom.append('%defattr(-,-,-,-)')
 			if file_list:
+				bb.note("Creating RPM package for %s" % splitname)
 				spec_files_bottom.extend(file_list)
+			else:
+				bb.note("Creating EMPTY RPM Package for %s" % splitname)
 			spec_files_bottom.append('')
 
 		del localdata
-- 
1.7.3.4



