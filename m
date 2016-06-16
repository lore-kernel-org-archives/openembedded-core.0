Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8DF6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5GFaWdV027310 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 16:36:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VcZFh66hqdis
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 16:36:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5GFaRGf027302
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 16:36:29 +0100
Message-ID: <1466091387.13979.273.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jun 2016 16:36:27 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] package_deb: Avoid chdir warnings and restore cwd after packaging
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
X-List-Received-Date: Thu, 16 Jun 2016 15:36:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

dpkg-build needs to be executed in the root of the package, so save and restore
the current directory so this task doesn't modify the state.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index e35f427..8f9b09a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -53,6 +53,8 @@ python do_package_deb () {
     import textwrap
     import subprocess
 
+    oldcwd = os.getcwd()
+
     workdir = d.getVar('WORKDIR', True)
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
@@ -311,6 +313,7 @@ python do_package_deb () {
 
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
+    os.chdir(oldcwd)
 }
 # Indirect references to these vars
 do_package_write_deb[vardeps] += "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN HOMEPAGE"



