Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMHsI-000070-2a
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 12:51:38 +0200
Received: by wye20 with SMTP id 20so286450wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 03:48:44 -0700 (PDT)
Received: by 10.216.152.193 with SMTP id d43mr475324wek.53.1305629324506;
	Tue, 17 May 2011 03:48:44 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o78sm200089wep.24.2011.05.17.03.48.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 03:48:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2011 12:48:29 +0200
Message-Id: <1305629309-16745-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Subject: [PATCH] distro/defaultsetup.conf: Append TCLIBC to TMPDIR by default
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
X-List-Received-Date: Tue, 17 May 2011 10:51:38 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current solutions to share uclibc, eglibc and glibc builds in the
same tree all have various issues associated with them. Appending the
suffix to TMPDIR seems like the best solution since sstate (which
defaults to outside TMPDIR) will allow reuse of any components.

This avoids messy changes to the core with other approaches to this
problem inevitably entail, usually in code where this abstraction isn;'t
logically best placed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf         |    4 ++++
 meta/conf/distro/include/tclibc-uclibc.inc |    6 ------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 8da6c0a..e7636b4 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -14,6 +14,10 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 TCLIBC ?= "eglibc"
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
+# Allow single libc distros to disable this code
+TCLIBCAPPEND ?= "-${TCLIBC}"
+TMPDIR_append = "${TCLIBCAPPEND}"
+
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
 
 USER_CLASSES ?= ""
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 27f6ec6..83418d6 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -20,12 +20,6 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 IMAGE_LINGUAS = ""
 
-DEPLOY_DIR_IMAGE = "${TMPDIR}/deploy/images"
-DEPLOY_DIR_append = "-uclibc"
-STAGING_DIR_TARGET_append = "-uclibc"
-STAGING_DIR_HOST_append = "-uclibc"
-SSTATE_MANIFESTS_append = "-uclibc"
-
 LIBC_DEPENDENCIES = "\
     uclibc \
     uclibc-dbg \
-- 
1.6.6.1



