Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZpeD-0005AO-Th
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 21:33:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5NJTToS019724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 12:29:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 12:29:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 14:41:08 -0500
Message-ID: <9a7361e1ba80742eff46f9d4d3b972b805a5a184.1308857981.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308857981.git.mark.hatle@windriver.com>
References: <cover.1308857981.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/9] native.bbclass: Add a simple chown intercept command (v2)
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
X-List-Received-Date: Thu, 23 Jun 2011 19:33:06 -0000
Content-Type: text/plain

During native recipe processing we want to intercept any calls to chown
and do nothing.  This prevents errors and allows the same recipes to be
used for both native and target recipes.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/native.bbclass    |    2 ++
 scripts/native-intercept/chown |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100755 scripts/native-intercept/chown

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 90fcd13..11ec6dc 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -85,6 +85,8 @@ EXTRA_NATIVE_PKGCONFIG_PATH ?= ""
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
 PKG_CONFIG_SYSROOT_DIR = ""
 
+PATH =. "${COREBASE}/scripts/native-intercept:"
+
 python native_virtclass_handler () {
     if not isinstance(e, bb.event.RecipePreFinalise):
         return
diff --git a/scripts/native-intercept/chown b/scripts/native-intercept/chown
new file mode 100755
index 0000000..4f43271
--- /dev/null
+++ b/scripts/native-intercept/chown
@@ -0,0 +1,2 @@
+#! /bin/sh
+echo "Intercept $0: $@ -- do nothing"
-- 
1.7.3.4



