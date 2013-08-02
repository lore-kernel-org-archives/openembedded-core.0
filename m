Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E34356B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 09:46:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r729kl8d022021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 02:46:47 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 02:46:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 17:46:40 +0800
Message-ID: <0dcd18de7a77c7395798b87f6833b388f3e0bb6c.1375436283.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1375436283.git.jackie.huang@windriver.com>
References: <cover.1375436283.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass: Expand the WHITELISTs with multilib prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 09:46:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

fix the following failures:
ERROR: Nothing PROVIDES 'virtual/lib32-i586-pokymllib32-linux-compilerlibs'
ERROR: Nothing RPROVIDES 'lib32-update-alternatives-cworth'

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/multilib.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index b04825f..dac160e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -50,6 +50,13 @@ python multilib_virtclass_handler () {
     e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
+    # Expand the WHITELISTs with multilib prefix
+    for whitelist in ["HOSTTOOLS_WHITELIST_GPLv3", "WHITELIST_GPLv3", "LGPLv2_WHITELIST_GPLv3"]:
+        pkgs = e.data.getVar(whitelist, True)
+        for pkg in pkgs.split():
+            pkgs += " " + variant + "-" + pkg
+        e.data.setVar(whitelist, pkgs)
+
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
     if newtune:
-- 
1.7.4.1


