Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mw-0001n3-VO
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DtdV020474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:14 -0500
Message-ID: <7dc9277c4987b8e0278cfe958e7b2f56e2707a99.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 08/12] multilib: Move redefinition of STAGING_DIR_KERNEL
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:51 -0000
Content-Type: text/plain

If the STAGING_DIR_KERNEL is set in the multilib.conf, then it may be
set incorrected.  The evaluation happens before TMPDIR and LIBC are
defined in other components.

Moving the definition process to the multilib.bbclass ensures that
everything has been loaded before it is set.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib.bbclass |    2 ++
 meta/conf/multilib.conf       |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index fb03fca..8187e18 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -7,6 +7,8 @@ python multilib_virtclass_handler () {
     if cls != "multilib" or not variant:
         return
 
+    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR', True))
+
     # There should only be one kernel in multilib configs
     if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ea5ed71..b22a4cb 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,7 +6,6 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
 
 MULTILIBS ??= "multilib:lib32"
 
-STAGING_KERNEL_DIR := "${STAGING_KERNEL_DIR}"
 STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 
-- 
1.7.3.4



