Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRm-0004lb-94
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTO000226;
	Fri, 1 Feb 2013 06:02:42 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:34 -0500
Message-Id: <40ccd0046e4d1425dd4cd51a16e192af688c36c1.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] guilt: remove GIT_EXEC_BASE export
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
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

git-core provides the following routines (among others): git-sh-setup,
cd_to_toplevel, die, and more.  But it is not always in the same location
relative to the guilt binary if git is not part of a 'host tools'
sysroot. Modern git versions don't need this, so commenting it out (until it
breaks again) is the solution to the problem of it not existing, and the
library routines will sourced and provided by git itself.

Since bitbake.conf has git-native as ASSUME_PROVIDED, this means that
when the system git binary is used, errors such as this can be seen in
failed patch logs:

| /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/guilt: line 29: /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/../libexec/git-core/git-sh-setup: No such file or directory
| /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/guilt: line 717: cd_to_toplevel: command not found
| error: patch failed: Makefile:2
| error: Makefile: patch does not apply
| /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/guilt-push: line 137: die: command not found
| [ERROR] unable to complete push
| pending patches are:
| /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/guilt: line 29: /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/../libexec/git-core/git-sh-setup: No such file or directory
| /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/guilt: line 29: /opt/poky/build/tmp/sysroots/x86_64-linux/usr/bin/../libexec/git-core/git-sh-setup: No such file or directory
| links/linux-yocto-custom/0001-linux-version-tweak.patch
| ERROR. could not update git tree

With the export removed, we have a normal "clean" failure message when
the sysroot or system git is used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-devtools/guilt/guilt-native_0.33.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 6652ab6..d4dd616 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
 PV = "0.33"
-PR = "r3"
+PR = "r4"
 
 inherit native
 
@@ -18,7 +18,6 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/g/guilt/guilt_${PV}.orig.ta
 	   file://guilt-push-no-series.patch \
 	   file://make_git_commands_conditional.patch \
 	   file://improve_auto_header_gen.patch \
-	   file://guilt-set-git_exec_path.patch \
 	   file://guilt-bash.patch \
 	   file://guilt-update-supported-git-versions-to-1.8.x.patch \
 	   file://optional_head_check.patch"
-- 
1.7.10.4



