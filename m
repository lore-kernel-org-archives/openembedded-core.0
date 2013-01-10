Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TtE4j-0006bB-3v
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 10:05:27 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so132738eek.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 00:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZOmTmRR2LciWF4wwld1QfqlQWxItdNl1ShzLEa7w/aE=;
	b=ZI/s54w36jFzmmNhJoYjM4LOP6fX8oNBfiuDM+Ek/WKeUNRFupBarf+uL4zkrubF2z
	UxOzs1rvsKHdif/uv9m1k1WjuAf9Et23zLRGr3BAE0lhWuLpIkdnBsxKaawQeOwXGv6B
	vTtVlhgFiQziT98VE0+/neJPp3giMbBBhJaT6VZ4R8Qq791SvxgRWJgpgOdViyDXsXZk
	28nh8w9TSF7T+l2tiAwf9Xcl6DV9RBE6pjJ5kFxajVfqX2Qg+DSAtM6NwvwSrjYMHlWl
	+ZlIpaEY4XUfMbAMX+Ju8tZiPel7QwXVo4DyqGHY1zrdsUnahqJ6qAjb8/OPNfoL2IFn
	o36g==
X-Received: by 10.14.194.4 with SMTP id l4mr190747096een.42.1357807812062;
	Thu, 10 Jan 2013 00:50:12 -0800 (PST)
Received: from dhcp-10-54-86-82.cisco.com (64-103-25-233.cisco.com.
	[64.103.25.233])
	by mx.google.com with ESMTPS id 44sm1908196eek.0.2013.01.10.00.50.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 00:50:11 -0800 (PST)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 09:50:02 +0100
Message-Id: <1357807806-31720-1-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.10.2 (Apple Git-33)
Subject: [PATCH 1/5] sanity: Make the required utilities more platform specific.
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
X-List-Received-Date: Thu, 10 Jan 2013 09:05:38 -0000

This might make us able to build on mac os X.

Signed-off-by: Martin Ertsaas <martiert@gmail.com>
---
 meta/classes/sanity.bbclass |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0ffa52d..03651be 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,9 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk wget cpio"
+SANITY_REQUIRED_UTILITIES_Linux ?= "${SANITY_REQUIRED_UTILITIES} chrpath"
+SANITY_REQUIRED_UTILITIES_Darwin ?= "${SANITY_REQUIRED_UTILITIES} install_name_tool"
 
 python check_bblayers_conf() {
     bblayers_fn = os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
@@ -340,6 +342,10 @@ def check_sanity_validmachine(sanity_data):
 
     return messages
 
+def get_required_utilities(sanity_data):
+    import platform
+    sanity_var = 'SANITY_REQUIRED_UTILITIES_%s' %platform.system()
+    return sanity_data.getVar(sanity_var, True)
 
 def check_sanity(sanity_data):
     import subprocess
@@ -444,7 +450,7 @@ def check_sanity(sanity_data):
     if not check_app_exists('${BUILD_PREFIX}g++', sanity_data):
         missing = missing + "C++ Compiler (%sg++)," % sanity_data.getVar("BUILD_PREFIX", True)
 
-    required_utilities = sanity_data.getVar('SANITY_REQUIRED_UTILITIES', True)
+    required_utilities = get_required_utilities(sanity_data)
 
     if "qemu-native" in assume_provided:
         if not check_app_exists("qemu-arm", sanity_data):
-- 
1.7.10.2 (Apple Git-33)



