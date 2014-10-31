Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 421F871F2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:46:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V9kUvw006356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Oct 2014 02:46:30 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 31 Oct 2014 02:46:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<Martin.Jansa@gmail.com>
Date: Fri, 31 Oct 2014 17:46:24 +0800
Message-ID: <65b3eb26c24648674ec3deb4da87f4933c2c0f21.1414748681.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414748681.git.hongxu.jia@windriver.com>
References: <cover.1414748681.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Fri, 31 Oct 2014 09:46:31 -0000
Content-Type: text/plain

While a pkg name (such as python3) not existed in variable
PACKAGES, but provided by another pkg (such as python-core),
in this situation, rpm based do_rootfs could not search it in
the feeds.

The fix is to invoke 'smart query --provides' to do the search
if the feeds search failed. We don't drop the feeds search,
because the smart query search is too slow, and the feeds
search is fast and could work well with most pkgs.

[YOCTO #6918]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ffb83b2..a0ecf3a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -671,6 +671,22 @@ class RpmPM(PackageManager):
 
         return ""
 
+    def _search_pkg_provider_in_smart(self, pkg, feed_archs):
+        output = self._invoke_smart('query  --provides %s' % pkg) or ''
+        for provider in output.split('\n'):
+            # Filter out the line which is empty or start with space
+            if provider.strip() == '' or provider[0] == ' ':
+                continue
+
+            for arch in feed_archs:
+                arch = '@' + arch.replace('-', '_')
+                if arch in provider:
+                    # First found is best match
+                    return provider
+
+        return ''
+
+
     '''
     Translate the OE multilib format names to the RPM/Smart format names
     It searched the RPM/Smart format names in probable multilib feeds first,
@@ -691,7 +707,8 @@ class RpmPM(PackageManager):
                 # if the pkg in this multilib feed
                 if subst != pkg:
                     feed_archs = self.ml_prefix_list[mlib]
-                    new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
+                    new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs) or \
+                        self._search_pkg_provider_in_smart(subst, feed_archs)
                     if not new_pkg:
                         # Failed to translate, package not found!
                         err_msg = '%s not found in the %s feeds (%s).\n' % \
@@ -709,7 +726,8 @@ class RpmPM(PackageManager):
             if pkg == new_pkg:
                 # Search new_pkg in default archs
                 default_archs = self.ml_prefix_list['default']
-                new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
+                new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs) or \
+                    self._search_pkg_provider_in_smart(pkg, default_archs)
                 if not new_pkg:
                     err_msg = '%s not found in the base feeds (%s).\n' % \
                               (pkg, ' '.join(default_archs))
-- 
1.9.1


