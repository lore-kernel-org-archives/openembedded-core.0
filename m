Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA156002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:45:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0MAjPWb008037
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:45:25 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 22 Jan 2014 02:45:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 18:45:42 +0800
Message-ID: <fbf6ea2201a4e7042980a82b6c342280df2fbbc8.1390387510.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1390387510.git.liezhi.yang@windriver.com>
References: <cover.1390387510.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: check required perl modules
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
X-List-Received-Date: Wed, 22 Jan 2014 10:45:23 -0000
Content-Type: text/plain

Several required perl modules may missing on the host, for example the
Text::ParseWords, Thread::Queue and Data::Dumper are not installed by
default on recent Fedora releases (19 and 20 AFAIK). There would be wild
errors if they don't exist, so check them in sanity.bbclass.

And add perl to SANITY_REQUIRED_UTILITIES.

[YOCTO #5744]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 8531df1..e5bf970 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,8 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
+    gzip gawk chrpath wget cpio perl"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
@@ -378,6 +379,17 @@ def check_git_version(sanity_data):
         return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
 
+# Check the required perl modules which may not be installed by default
+def check_perl_modules(sanity_data):
+    ret = ""
+    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
+    for m in modules:
+        status, result = oe.utils.getstatusoutput("perl -e 'use %s' 2> /dev/null" % m)
+        if status != 0:
+            ret += "%s " % m
+    if ret:
+        return "Required perl module(s) not found: %s\n" % ret
+    return None
 
 def sanity_check_conffiles(status, d):
     # Check we are using a valid local.conf
@@ -488,6 +500,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_make_version(d))
     status.addresult(check_tar_version(d))
     status.addresult(check_git_version(d))
+    status.addresult(check_perl_modules(d))
 
     missing = ""
 
-- 
1.8.3.1


