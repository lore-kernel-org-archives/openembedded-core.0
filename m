Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TzAco-0003ol-Uh
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 19:37:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0QILVO1015591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2013 10:21:31 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Sat, 26 Jan 2013 10:21:30 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jan 2013 12:21:28 -0600
Message-ID: <be4befa9da5a0d36c54f05badd37123d7098bf05.1359224379.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1359224379.git.peter.seebach@windriver.com>
References: <cover.1359224379.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: Allow per-package SKIP_FILEDEPS
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
X-List-Received-Date: Sat, 26 Jan 2013 18:37:11 -0000
Content-Type: text/plain

The existing check for SKIP_FILEDEPS can be overridden per recipe
using SKIP_FILEDEPS_pn-${PN}. However, there's no mechanism for
letting a single package within a recipe use SKIP_FILEDEPS.

This patch adds SKIP_FILEDEPS_<pkg>, by analogy to FILES_<pkg>.
Note that it only works one way; if the recipe has SKIP_FILEDEPS = 1,
the checks for individual packages will never be reached.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e8d7aef..3ed048e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1310,6 +1310,8 @@ python package_do_filedeps() {
 
     # Determine dependencies
     for pkg in packages.split():
+        if d.getVar('SKIP_FILEDEPS_' + pkg, True) == '1':
+            continue
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
             continue
 
-- 
1.7.0.4



