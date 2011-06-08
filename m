Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QUJBf-0006TG-MY
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 15:52:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jun 2011 06:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,338,1304319600"; d="scan'208";a="10697538"
Received: from unknown (HELO [10.255.12.221]) ([10.255.12.221])
	by orsmga002.jf.intel.com with ESMTP; 08 Jun 2011 06:48:16 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jun 2011 08:48:11 -0500
Message-ID: <1307540891.2580.2.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH] initramfs-live-install: remove allarch inherit
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
X-List-Received-Date: Wed, 08 Jun 2011 13:52:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

initramfs-live-install is only compatible with i.86|x86_64 so
shouldn't inherit 'allarch'.  This removes it.

More specifically, commit 52295fa3deef3b0374b99829626d524cefae6001
(Improve handling of 'all' architecture recipes and their interaction
with sstate) sets TARGET_ARCH which due to the COMPATIBLE_HOST setting
in the recipe causes it to be skipped and gives the following error
for any -live build:

NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'initramfs-live-install' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['initramfs-live-install']
ERROR: Required build target 'core-image-sato-live' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-sato-live', 'core-ima\
ge-minimal-initramfs', 'initramfs-live-install']
ERROR: Nothing RPROVIDES 'initramfs-live-install'

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index fdda718..6a16f4c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -11,8 +11,6 @@ do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
 }
 
-inherit allarch
-
 FILES_${PN} = " /install.sh "
 
 # Alternatives to grub need adding for other arch support
-- 
1.7.0.4





