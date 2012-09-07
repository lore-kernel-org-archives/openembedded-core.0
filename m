Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TA6q7-0006rC-Ap
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 00:15:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q87M3OnQ003435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Sep 2012 15:03:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 7 Sep 2012 15:03:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2012 17:05:43 -0500
Message-ID: <cace43d80670231e0f389f8e8920d534f53c4606.1347055413.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1347055413.git.mark.hatle@windriver.com>
References: <cover.1347055413.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] image.bbclass: Enable the complementary install to be called w/ globbing params
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
X-List-Received-Date: Fri, 07 Sep 2012 22:15:51 -0000
Content-Type: text/plain

If the image.bbclass is called with arguments, and these arguments are not
"populate_sdk", they will be passed in as the expected GLOBS.

This enables external components and scripting to use the
rootfs_install_complementary code.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2e95556..9433d48 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -329,8 +329,10 @@ rootfs_install_complementary() {
     list_installed_packages arch > ${WORKDIR}/installed_pkgs.txt
 
     # Apply the globs to all the packages currently installed
-    if [ "$1" = "populate_sdk" ] ; then
+    if [ -n "$1" -a "$1" = "populate_sdk" ] ; then
         GLOBS="${SDKIMAGE_INSTALL_COMPLEMENTARY}"
+    elif [ -n "$1" ]; then
+        GLOBS="$@"
     else
         GLOBS="${IMAGE_INSTALL_COMPLEMENTARY}"
         # Add locales
-- 
1.7.3.4



