Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnDzt-0004YM-43
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 21:15:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66J3tRY021584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:03:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:03:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 14:14:00 -0500
Message-ID: <ba80d76cae689a4023327da4e38a83e1c5c88306.1341601764.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341601764.git.mark.hatle@windriver.com>
References: <cover.1341601764.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/3] multilib: Enable multilib remapping for SDK generation
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
X-List-Received-Date: Fri, 06 Jul 2012 19:15:41 -0000
X-List-Received-Date: Fri, 06 Jul 2012 19:15:41 -0000
X-List-Received-Date: Fri, 06 Jul 2012 19:15:41 -0000
Content-Type: text/plain

Enable the remapping for SDK generation, this is required to be able to
create an SDK that targets an alternative multilib.  Note, this work does
not finish SDK/multilib support, but it is one more step toward making
it work properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f3e7618..b92a3ff 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -54,6 +54,12 @@ python __anonymous () {
         d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
+
+    if bb.data.inherits_class('populate_sdk_base', d):
+        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK")
+        clsextend.map_depends_variable("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY")
+
+    if bb.data.inherits_class('image', d) or bb.data.inherits_class('populate_sdk_base', d):
         return
 
     clsextend.rename_packages()
-- 
1.7.3.4



