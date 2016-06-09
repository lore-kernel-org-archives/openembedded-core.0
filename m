Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB38F6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 20:14:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2016 13:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,446,1459839600"; d="scan'208";a="716625281"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2016 13:14:33 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 15:15:22 -0500
Message-Id: <1465503322-25530-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] oe/distro_check.py: Fixes for python3
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
X-List-Received-Date: Thu, 09 Jun 2016 20:14:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

create_socket: Use urllib because urllib2 is now urllib in python3
and proxies as argument are deprecated so export them in the environ
instead.

get_links_from_url: Change usage of sgmllib for parsing HTML because
is deprecated in python 3, use instead bs4 that is already imported
in the bitbake tree.

[YOCTO #9744]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/distro_check.py | 82 +++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index f1f1fbb..1d5f1c9 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -1,53 +1,35 @@
 from contextlib import contextmanager
-@contextmanager
+
+from bb.utils import export_proxies
+
 def create_socket(url, d):
-    import urllib.request, urllib.parse, urllib.error
-    socket = urllib.request.urlopen(url, proxies=get_proxies(d))
+    import urllib
+
+    socket = None
     try:
-        yield socket
-    finally:
-        socket.close()
+        export_proxies(d)
+        socket = urllib.request.urlopen(url)
+    except:
+        bb.warn("distro_check: create_socket url %s can't access" % url)
 
-def get_proxies(d):
-    proxies = {}
-    for key in ['http', 'https', 'ftp', 'ftps', 'no', 'all']:
-        proxy = d.getVar(key + '_proxy', True)
-        if proxy:
-            proxies[key] = proxy
-    return proxies
+    return socket
 
 def get_links_from_url(url, d):
     "Return all the href links found on the web location"
 
-    import sgmllib
-    
-    class LinksParser(sgmllib.SGMLParser):
-        def parse(self, s):
-            "Parse the given string 's'."
-            self.feed(s)
-            self.close()
-    
-        def __init__(self, verbose=0):
-            "Initialise an object passing 'verbose' to the superclass."
-            sgmllib.SGMLParser.__init__(self, verbose)
-            self.hyperlinks = []
-    
-        def start_a(self, attributes):
-            "Process a hyperlink and its 'attributes'."
-            for name, value in attributes:
-                if name == "href":
-                    self.hyperlinks.append(value.strip('/'))
-    
-        def get_hyperlinks(self):
-            "Return the list of hyperlinks."
-            return self.hyperlinks
+    from bs4 import BeautifulSoup, SoupStrainer
 
-    with create_socket(url,d) as sock:
+    hyperlinks = []
+
+    webpage = ''
+    sock = create_socket(url,d)
+    if sock:
         webpage = sock.read()
 
-    linksparser = LinksParser()
-    linksparser.parse(webpage)
-    return linksparser.get_hyperlinks()
+    soup = BeautifulSoup(webpage, "html.parser", parse_only=SoupStrainer("a"))
+    for line in soup.find_all('a', href=True):
+        hyperlinks.append(line['href'].strip('/'))
+    return hyperlinks
 
 def find_latest_numeric_release(url, d):
     "Find the latest listed numeric release on the given url"
@@ -162,14 +144,18 @@ def find_latest_debian_release(url, d):
 
 def get_debian_style_source_package_list(url, section, d):
     "Return the list of package-names stored in the debian style Sources.gz file"
-    with create_socket(url,d) as sock:
-        webpage = sock.read()
-        import tempfile
-        tmpfile = tempfile.NamedTemporaryFile(mode='wb', prefix='oecore.', suffix='.tmp', delete=False)
-        tmpfilename=tmpfile.name
-        tmpfile.write(sock.read())
-        tmpfile.close()
+    import tempfile
     import gzip
+
+    webpage = ''
+    sock = create_socket(url,d)
+    if sock:
+        webpage = sock.read()
+
+    tmpfile = tempfile.NamedTemporaryFile(mode='w', prefix='oecore.', suffix='.tmp', delete=False)
+    tmpfilename=tmpfile.name
+    tmpfile.write(sock.read())
+    tmpfile.close()
     bb.note("Reading %s: %s" % (url, section))
 
     f = gzip.open(tmpfilename)
@@ -266,9 +252,9 @@ def update_distro_data(distro_check_dir, datetime, d):
     import fcntl
     try:
         if not os.path.exists(datetime_file):
-            open(datetime_file, 'w+b').close() # touch the file so that the next open won't fail
+            open(datetime_file, 'w+').close() # touch the file so that the next open won't fail
 
-        f = open(datetime_file, "r+b")
+        f = open(datetime_file, "r+")
         fcntl.lockf(f, fcntl.LOCK_EX)
         saved_datetime = f.read()
         if saved_datetime[0:8] != datetime[0:8]:
-- 
2.1.4


