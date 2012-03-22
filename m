Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAX30-0007za-4V
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 02:42:38 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900LJ0IZ7VSS1@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:33:08 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EA6B820120; Wed,
	21 Mar 2012 21:33:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 21:33:03 -0400
Message-id: <1332379983-2512-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] bitbake.conf: fix distro-less failure expanding FILESPATH
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
X-List-Received-Date: Thu, 22 Mar 2012 01:42:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

If DISTRO is not set, FILESPATH becomes littered with directories like
files/${DISTRO} etc. It won't bomb until you try to eval it - i.e.
manipulating FILESPATH directly with .= works fine, but calling e.g.
base_set_filespath() throws this:

ERROR: Failure expanding variable FILESPATH, expression was ${@blah} which
triggered exception SyntaxError: EOL while scanning string literal (FILESPATH,
line 1)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 17d2f26..16e72e4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -637,7 +637,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
-DISTROOVERRIDES ?= "${DISTRO}"
+DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
-- 
1.7.8.5



