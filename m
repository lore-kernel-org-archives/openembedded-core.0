Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SklUC-00043Y-DV
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 02:24:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5U0DVBc009516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 17:13:31 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 17:13:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 19:22:38 -0500
Message-ID: <d729af808158e72db4df3488f7352a99598bff2d.1341015667.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341015667.git.mark.hatle@windriver.com>
References: <cover.1341015667.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] package.bbclass: Allow a package to skip per file dependency generation
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
X-List-Received-Date: Sat, 30 Jun 2012 00:24:28 -0000
Content-Type: text/plain

Most of the time skipping per file dependency generation is a bad idea, but
when building a nativesdk or similar you may be required to pickup host
dependencies.  These host dependencies can not always be reconciled within
the scope of other nativesdk components, so if we skip them we can facilitate
this unique situation.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 10c2f0a..db7b9ca 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1154,6 +1154,9 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LI
 python package_do_filedeps() {
 	import re
 
+	if d.getVar('SKIP_FILEDEPS', True) == '1':
+		return
+
 	pkgdest = d.getVar('PKGDEST', True)
 	packages = d.getVar('PACKAGES', True)
 
-- 
1.7.3.4



