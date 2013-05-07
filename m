Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj3-0007kf-Hc
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgdD005214; Tue, 7 May 2013 13:58:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lHVOzvntx7NI; Tue,  7 May 2013 13:58:51 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CweNT005194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:41 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRI-0005cX-4C; Tue, 07 May 2013 13:56:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:56:04 +0100
Message-Id: <1367931368-21504-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/15] image/kernel-module-split/eglibc-ld.inc: Remove has_key() usage
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
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000

The has_key() attribute has been removed in python 3 since there is better
syntax available. Use the improved syntax.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass               |    2 +-
 meta/classes/kernel-module-split.bbclass |    2 +-
 meta/recipes-core/eglibc/eglibc-ld.inc   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 979921f..251bc9a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -368,7 +368,7 @@ for dir in dirs.split():
       key=str(os.path.join("/",os.path.relpath(item,dir)))
 
       valid=True;
-      if files.has_key(key):
+      if key in files:
         #check whether the file is allow to replace
         if allow_rep.match(key):
           valid=True
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 45639c6..23714d5 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -109,7 +109,7 @@ python split_kernel_module_packages () {
         # instead is prefixed with /lib/modules/${KERNEL_VERSION}
         file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
-        if module_deps.has_key(file):
+        if file in module_deps:
             dependencies = []
             for i in module_deps[file]:
                 m = re.match(pattern, os.path.basename(i))
diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc b/meta/recipes-core/eglibc/eglibc-ld.inc
index e596b55..b1701f00 100644
--- a/meta/recipes-core/eglibc/eglibc-ld.inc
+++ b/meta/recipes-core/eglibc/eglibc-ld.inc
@@ -1,7 +1,7 @@
 def ld_append_if_tune_exists(d, infos, dict):
     tune = d.getVar("DEFAULTTUNE", True) or ""
     libdir = d.getVar("base_libdir", True) or ""
-    if dict.has_key(tune):
+    if tune in dict:
         infos['ldconfig'].add('{"' + libdir + '/' + dict[tune][0] + '",' + dict[tune][1] + ' }')
         infos['lddrewrite'].add(libdir+'/'+dict[tune][0])
 
-- 
1.7.10.4



