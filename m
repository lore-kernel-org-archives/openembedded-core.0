Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSDVd-0004NZ-KX
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:29:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49KJNAa008328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 13:19:23 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 13:19:23 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 15:19:21 -0500
Message-ID: <dc093825d1d099dcf0d221c651aba5bf54231623.1336594657.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1336594657.git.peter.seebach@windriver.com>
References: <cover.1336594657.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: Detect empty $PATH components too
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
X-List-Received-Date: Wed, 09 May 2012 20:29:28 -0000
Content-Type: text/plain

Empty components in $PATH have the same effect as a . in $PATH,
and are a common side-effect of inserting a misspelled or unset
shell variable in $PATH.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/sanity.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 687ddeb..1384592 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -298,8 +298,9 @@ def check_sanity(e):
         if not check_app_exists("qemu-arm", e.data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-    if "." in data.getVar('PATH', e.data, True).split(":"):
-        messages = messages + "PATH contains '.' which will break the build, please remove this"
+    paths = data.getVar('PATH', e.data, True).split(":")
+    if "." in paths or "" in paths:
+        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
 
     if data.getVar('TARGET_ARCH', e.data, True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
-- 
1.7.0.4



