Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNKyr-00036M-BX
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 12:31:49 +0200
Received: by mail-pb0-f50.google.com with SMTP id jt11so769797pbb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DEA21NmiHOFtvbSUafctdq9acM8voqCH1DjPoJxBZkQ=;
	b=TU2QdrC+34HWYLPERIXm7Dek/N0RSvCLiideERYQqF4gGZop3YoIyn0AS/xhmEoKr/
	LhpfU28G95E5kLXt+HB/sE/7fMDMyL0YKIY24E1REcM2rWDbxUWg4gKlcYpS0r8o+RwI
	P8++7XG1BMy6ySHeBIyVv42+pTiO7l2YecjqewXthHLcCd+l4K+qdvXhimrU0d6DB856
	vn/A+axSKLNt0Ui4EBymQJDkULHvoHp/kejG0FAgfl5LVgL45cQ7SZKvnwjzItmSmnD1
	nkIIJsDWYNumLsQ4nrkuvG9YCu4j8T3JeUsthl4O6A9joTdlqyJ3JDwb71chbMkHuwyA
	N/2Q==
X-Received: by 10.66.221.226 with SMTP id qh2mr2280313pac.62.1364984077549;
	Wed, 03 Apr 2013 03:14:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id to7sm6395946pab.0.2013.04.03.03.14.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 03:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 12:14:33 +0200
Message-Id: <1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <20130320202206.GD3220@jama>
References: <20130320202206.GD3220@jama>
Subject: [RFC][PATCH 1/2] packagedata: show error when there are multiple pkgdata directories
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
X-List-Received-Date: Wed, 03 Apr 2013 10:31:49 -0000

* when PACKAGE_ARCH is changed e.g. from MACHINE_ARCH to TUNE_PKGARCH
  get_subpkgedata_fn is still reading old MACHINE_ARCH directory instead of newer with TUNE_PKGARCH
---
 meta/lib/oe/packagedata.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 62fd718..2533700 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -34,11 +34,18 @@ def get_subpkgedata_fn(pkg, d):
     dirs = all_pkgdatadirs(d)
 
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
+    found = None
     for dir in dirs:
         fn = pkgdata + dir + pkg
         if os.path.exists(fn):
-            return fn
-    return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
+	    if found:
+                bb.error("More then one pkgdata dir found for pkg '%s' ('%s', '%s'), returning first" % (pkg, found, fn))
+                continue
+            found = fn
+    if found:
+        return found
+    else:
+        return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
 
 def has_subpkgdata(pkg, d):
     return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
@@ -68,6 +75,7 @@ def read_subpkgdata_dict(pkg, d):
     return ret
 
 def _pkgmap(d):
+    import bb
     """Return a dictionary mapping package to recipe name."""
 
     target_os = d.getVar("TARGET_OS", True)
@@ -85,6 +93,7 @@ def _pkgmap(d):
             continue
 
         for pn in filter(lambda f: not os.path.isdir(os.path.join(pkgdatadir, f)), files):
+            bb.warn("Trying path '%s'" % os.path.join(pkgdatadir, pn))
             try:
                 pkgdata = read_pkgdatafile(os.path.join(pkgdatadir, pn))
             except OSError:
-- 
1.8.1.5



