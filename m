Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7D4o-00087q-Rc
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:42:16 +0200
Received: by gwb11 with SMTP id 11so130190gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=/tPekkdn0yKjy4vbMtREkKr0/5JijRVDSv8t+GjsOZ0=;
	b=Lx0JdAtGvyG/aU/BK49bGN7LC7StAg2RHz+hPhn/aat74tSyi6ZOF5AP77Y3gPH6py
	E/b57QwtSBUiE8ccMmWQHhYTM5DvA8054BosG/yLZHbxE+BhczQYqOTg0Muo5ui67ujE
	Ak5H6ORrgOv3bgEQXjEHsA7uYBBDQUwtf2wXI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=up8TAKqJ/oRdRQBYU/lmS8/RvhtKVmbZwFEXWtfJsZTgdtCNu2ntzLinVemOOXt/gM
	gZJgRhUkLvP+GcMSQDHFRdCZxUL9xWONth8seqW7zenA5phzXA8bw+eB8KIerf3Vknda
	wJanAtR0oXeo9K/RXBJrYp+g5RWWwpmjUEosc=
Received: by 10.150.176.9 with SMTP id y9mr966858ybe.429.1302036003308;
	Tue, 05 Apr 2011 13:40:03 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id p28sm288105ybk.0.2011.04.05.13.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:40:02 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:39:55 -0700
Message-Id: <4dc13ab4a1b05f64c2bf59b29b0611471f0baa5a.1302035800.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] oe.fetch: add module with uri convenience code
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
X-List-Received-Date: Tue, 05 Apr 2011 20:42:16 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf |    1 +
 meta/lib/oe/fetch.py   |   87 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/fetch.py

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 27b8a6b..27b4f74 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -527,6 +527,7 @@ AUTOREV = "${@bb.fetch2.get_autorev(d)}"
 SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
 SRC_URI = "file://${FILE}"
+SRC_URI[type] = "list"
 
 # We can choose which provider of fake root privileges to use
 # default is fakeroot but in Poky we use pseudo
diff --git a/meta/lib/oe/fetch.py b/meta/lib/oe/fetch.py
new file mode 100644
index 0000000..c99adcf
--- /dev/null
+++ b/meta/lib/oe/fetch.py
@@ -0,0 +1,87 @@
+import oe.data
+import urlparse
+from collections import namedtuple
+
+class MissingScheme(Exception):
+    def __str__(self):
+        return "Missing scheme in uri '%s'" % self.args[0]
+
+def src_uri(d):
+    return [uri(url) for url in oe.data.typed_value('SRC_URI', d)]
+
+def uri(url):
+    import urlparse
+
+    scheme, netloc, path, params, query, fragment = urlparse.urlparse(url)
+
+    if scheme == 'file':
+        if netloc:
+            path = netloc + path
+            netloc = ''
+    elif not scheme:
+        raise MissingScheme(url)
+
+    if ';' in path:
+        path, params = urlparse._splitparams(path)
+
+    params = parse_params(params)
+    query = urlparse.parse_qs(query)
+
+    return Uri(scheme, netloc, path, params, query, fragment)
+
+def parse_params(params):
+    values = {}
+    if params:
+        for param in params.split(';'):
+            try:
+                key, value = param.split('=', 1)
+            except ValueError:
+                key, value = param, True
+            values[key] = value
+    return values
+
+class Uri(namedtuple('Uri', 'scheme netloc path params query fragment'),
+          urlparse.ResultMixin):
+    """Representation of a Uniform Resource Identifier"""
+
+    __slots__ = ()
+
+    @property
+    def querystring(self):
+        """Reassembled query string"""
+        if self.query:
+            query = ';'.join('%s=%s' % (key, v)
+                             for key, value in self.query.iteritems()
+                             for v in value)
+            return query
+        else:
+            return self.query
+
+    @property
+    def parameterstring(self):
+        """Reassembled parameter string"""
+        if self.parameters:
+            parameters = ';'.join('%s=%s' % (key, value)
+                                  for key, value in self.parameters.iteritems())
+            return parameters
+        else:
+            return self.parameters
+
+    def join(self, otherurl):
+        """Join this url to a possibly relative URL to form an absolute
+        interpretation of the latter."""
+        return uri(urlparse.urljoin(str(self), str(otherurl)))
+
+    def unsplit(self):
+        """String version of URL without parameters"""
+        components = (self.scheme, self.netloc, self.path, self.querystring,
+                      self.fragment)
+        return urlparse.urlunsplit(components)
+
+    def geturl(self):
+        components = (self.scheme, self.netloc, self.path,
+                      self.parameterstring, self.querystring, self.fragment)
+        return urlparse.urlunparse(components)
+
+    def __str__(self):
+        return self.geturl()
-- 
1.7.4.1



