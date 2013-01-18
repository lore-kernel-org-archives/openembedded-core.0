Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TwLN3-0007zS-5o
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 00:29:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0INDlKa003230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 15:13:47 -0800 (PST)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 18 Jan 2013 15:13:47 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2013 17:13:37 -0600
Message-ID: <1cabb636ae1640c7d59a9932141fae973ad17985.1358550581.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1358550581.git.mark.hatle@windriver.com>
References: <cover.1358550581.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 1/2] populate_sdk_rpm: Re-add a few system provides to the SDK
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
X-List-Received-Date: Fri, 18 Jan 2013 23:29:27 -0000
Content-Type: text/plain

When building the target SDK portion, we can safely ignore various
package rdepends.  These dependencies are not required on a build
only environment like an SDK.

[YOCTO #3691]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Tested-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index eb80e1d..00a3ab4 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -43,7 +43,9 @@ populate_sdk_rpm () {
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM=""
+	# We don't need any of these runtime items for the SDK, so
+	# just make the system assume they exist.
+	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig"
 	export INSTALL_TASK_RPM="populate_sdk-target"
 	export INSTALL_COMPLEMENTARY_RPM=""
 	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
-- 
1.7.1



