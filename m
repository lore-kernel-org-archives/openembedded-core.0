Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 113896065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:49:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2013 01:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,769,1363158000"; d="scan'208";a="309960381"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.217])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2013 01:49:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 09:49:15 +0100
Message-Id: <1369903755-6114-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2] python-smartpm: add gettext-native to DEPENDS
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
X-List-Received-Date: Thu, 30 May 2013 08:49:20 -0000

Fixes the following failure at do_install building python-smartpm-native
if gettext-native has not already been built and gettext tools are not
installed on the host:

| compiling locale/it/LC_MESSAGES/smart.po -> locale/it/LC_MESSAGES/smart.mo
| sh: msgfmt: command not found
...
| creating $D/usr/share/share/locale/it/LC_MESSAGES
| error: can't copy 'locale/it/LC_MESSAGES/smart.mo': doesn't exist or not a regular file

Note that we need gettext-native in DEPENDS and not "inherit gettext"
here because for native variants, gettext.bbclass instead adds
gettext-minimal-native to DEPENDS and that does not provide the msgfmt
command.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index cfa2dba..0cf3847 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -8,7 +8,7 @@ SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "python rpm"
+DEPENDS = "python rpm gettext-native"
 PR = "r9"
 SRCNAME = "smart"
 
-- 
1.8.1.2


