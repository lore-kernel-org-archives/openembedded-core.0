Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 238B06C0EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 09:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9A92rTV006291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 02:02:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 10 Oct 2019 02:02:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Oct 2019 17:02:51 +0800
Message-ID: <1570698171-431116-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python: Fix CVE-2019-10160
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
X-List-Received-Date: Thu, 10 Oct 2019 09:02:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python/python/bpo-36742-cve-2019-10160.patch   | 81 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch

diff --git a/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch b/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
new file mode 100644
index 0000000..b704aa9
--- /dev/null
+++ b/meta/recipes-devtools/python/python/bpo-36742-cve-2019-10160.patch
@@ -0,0 +1,81 @@
+From 5a1033fe5be764a135adcfff2fdc14edc3e5f327 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 10 Oct 2019 16:32:19 +0800
+Subject: [PATCH] bpo-36742: Fixes handling of pre-normalization characters in
+ urlsplit() bpo-36742: Corrects fix to handle decomposition in usernames
+
+Upstream-Status: Backport
+
+https://github.com/python/cpython/commit/98a4dcefbbc3bce5ab07e7c0830a183157250259
+https://github.com/python/cpython/commit/f61599b050c621386a3fc6bc480359e2d3bb93de#diff-b577545d73dd0cdb2c337a4c5f89e1d7
+
+CVE: CVE-2019-10160
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Lib/test/test_urlparse.py | 19 +++++++++++++------
+ Lib/urlparse.py           | 14 +++++++++-----
+ 2 files changed, 22 insertions(+), 11 deletions(-)
+
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index 1830d0b..857ed96 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -641,13 +641,20 @@ class UrlParseTestCase(unittest.TestCase):
+         self.assertIn(u'\u2100', denorm_chars)
+         self.assertIn(u'\uFF03', denorm_chars)
+ 
++        # bpo-36742: Verify port separators are ignored when they
++        # existed prior to decomposition
++        urlparse.urlsplit(u'http://\u30d5\u309a:80')
++        with self.assertRaises(ValueError):
++            urlparse.urlsplit(u'http://\u30d5\u309a\ufe1380')
++
+         for scheme in [u"http", u"https", u"ftp"]:
+-            for c in denorm_chars:
+-                url = u"{}://netloc{}false.netloc/path".format(scheme, c)
+-                if test_support.verbose:
+-                    print "Checking %r" % url
+-                with self.assertRaises(ValueError):
+-                    urlparse.urlsplit(url)
++            for netloc in [u"netloc{}false.netloc", u"n{}user@netloc"]:
++                for c in denorm_chars:
++                    url = u"{}://{}/path".format(scheme, netloc.format(c))
++                    if test_support.verbose:
++                        print "Checking %r" % url
++                    with self.assertRaises(ValueError):
++                        urlparse.urlsplit(url)
+ 
+ def test_main():
+     test_support.run_unittest(UrlParseTestCase)
+diff --git a/Lib/urlparse.py b/Lib/urlparse.py
+index 54eda08..e34b368 100644
+--- a/Lib/urlparse.py
++++ b/Lib/urlparse.py
+@@ -171,14 +171,18 @@ def _checknetloc(netloc):
+     # looking for characters like \u2100 that expand to 'a/c'
+     # IDNA uses NFKC equivalence, so normalize for this check
+     import unicodedata
+-    netloc2 = unicodedata.normalize('NFKC', netloc)
+-    if netloc == netloc2:
++    n = netloc.replace(u'@', u'') # ignore characters already included
++    n = n.replace(u':', u'')      # but not the surrounding text
++    n = n.replace(u'#', u'')
++    n = n.replace(u'?', u'')
++
++    netloc2 = unicodedata.normalize('NFKC', n)
++    if n == netloc2:
+         return
+-    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
+     for c in '/?#@:':
+         if c in netloc2:
+-            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
+-                             "characters under NFKC normalization")
++            raise ValueError(u"netloc '" + netloc + u"' contains invalid " +
++                             u"characters under NFKC normalization")
+ 
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index 5b856a5..64684b3 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -30,6 +30,7 @@ SRC_URI += " \
            file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
            file://float-endian.patch \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           file://bpo-36742-cve-2019-10160.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


