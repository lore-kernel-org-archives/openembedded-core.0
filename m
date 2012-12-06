Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TgiP1-0002Qc-PT
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 21:50:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB6KaEFS010364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 12:36:14 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 6 Dec 2012 12:36:12 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2012 14:51:13 -0600
Message-ID: <1354827073-25487-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/22 v3] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 20:50:40 -0000
Content-Type: text/plain

When using update-alternatives, there should be a runtime dependency on
${VIRTUAL-RUNTIME_update-alternatives}.  Without this, it's possible to
get into a situation where the package is not installable.

(If VIRTUAL-RUNTIME_update-alternatives is not defined, no requirement
is added.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/update-alternatives.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 4e1ff27..a3631ec 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -304,6 +304,12 @@ python populate_packages_prepend () {
             alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
 
         if alt_setup_links:
+            # RDEPENDS setup
+            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
+            if provider:
+                #bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
+                d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)
+
             bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
             postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'
-- 
1.7.3.4



