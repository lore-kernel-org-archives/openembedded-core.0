Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D75E770D19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:08:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F38vuV020821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:08:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 20:08:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 11:09:04 +0800
Message-ID: <4e653dd80b6113ffe5ea7b582f1c6a45d925f0c3.1408071677.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408071677.git.Qi.Chen@windriver.com>
References: <cover.1408071677.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 04/10] update-rc.d: fix logic in populate_packages_updatercd
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
X-List-Received-Date: Fri, 15 Aug 2014 03:08:56 -0000
Content-Type: text/plain

The 'and' logic for the check is wrong. To make things clear, please
see the example below.

Say that we have a recipe A, which has a sysv-init style init script named
initA and no corresponding service file. The recipe inherits update-rc.d,
but it doesn't inherit systemd.bbclass. The DISTRO_FEATURES has 'systemd'
inside it, but it doesn't have 'sysvinit'. Now if we build an image, with
the 'and' logic in the check, the symlinks for initA would not be installed
into /etc/rc?.d directory.
This is incorrect. Because there's no corresponding service. The symlinks
in /etc/rc?.d/ should be created so that the service would be correctly
started at boot time.

The logic should really be 'or' in the check. This is actually what the code
was when it was originally written.

Several different situations are listed below to prove the correctness of the
'or' logic.

If 'sysvinit' is in DISTRO_FEATURES, the initA script would always be installed
with corresponding preisnt/postinst generated and added.

If 'sysvinit' is not in DISTRO_FEATURES, we have three situations.
1) A has initA and A.service.
   In such situation, systemd.bbclass would set INHIBIT_UPDATERCD_BBCLASS,
   so no preinst/postinst about update-rc.d would be added and the symlinks
   for initA would not be created.

2) A has initA, and the functionality of initA is not implemented internally
   in systemd.
   In such situation, symlinks for initA would be installed.

3) A has initA, and the functionality of initA is implemented internally in
   systemd or in some other recipe.
   Examples for such situation are alsa-state and keymaps in OE.
   In such situation, we need to set INHIBIT_UPDATERCD_BBCLASS in the recipe
   so that there would be no preinst/postinst scripts about update-rc.d added.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/update-rc.d.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 19b081d..3c5414b 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -121,7 +121,7 @@ python populate_packages_updatercd () {
 
     # Check that this class isn't being inhibited (generally, by
     # systemd.bbclass) before doing any work.
-    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
        not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
-- 
1.7.9.5


