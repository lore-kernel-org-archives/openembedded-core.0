Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD2B6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:19:07 +0000 (UTC)
Received: by wmec201 with SMTP id c201so157655260wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dAHn2i3HvX0X3IizG0E2ok/VUZs7URbkEeZGJ/9SI18=;
	b=DZmBO1ZJ+ayAhABc+3viANv7hgL2dLaKzIEzTz7jotRjNEFJAwc7I8yAuAOccnkv7K
	sGGQLkJNk7h8UAknEfmi07GfyXShFuiQvB0g4YgGZmrDPK5PZEXYKhTuqQO2jlfRATMW
	tLgKa1aeBZr79RtfuIFR1forLXLh2y+h+qxjvNtV4/BvQDBXEi0jcK2jUXwuFtY7NWUl
	NdnNemeT1T36FQCPP5aBjnYFM1zI8hFTnGS8qKnawSDRWMk8axOxSa0pFDc9KpAdb0of
	h/QI+iWMuxpjoi1sYGGFF9++i5MmN3agbpg3SxyZXV37kYfj3JDafve4Nyw7s5oVJdXP
	hjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dAHn2i3HvX0X3IizG0E2ok/VUZs7URbkEeZGJ/9SI18=;
	b=adDILi9kvWhcncUV0Nrzbtow38z2jmQXLK5pwpkqKm7a/tFPyZLrMuS5sV8B8EkuNm
	PU2kjXvGe3Pzh59Sc1V2g8lS03VUQn9mpGZKa9HVOrzdToWp2p4nglIgzFBwBlvRrVzl
	FFMM/muDSF6g2acj8IywTw/WcV8FSOEJh0IPngHk3DN3HdFYCyJRPpGpIjSpKxddzuBj
	rYiHwljynCgE5iDFKU55TVNkh3hLZMY1OKDds0OK7bhiiwZn+524PX4f+f48f8lKPjzS
	8F0g4/q7eCCNXt+hhfgiUqjOPUOK74D1Z5nkLJH3Jxacxs2AlotP/EnqbwdqEfBXR3j7
	qEsA==
X-Gm-Message-State: ALoCoQksE01qsLXl0qgJFK0BjNfLFoUR9hn9Efq2SmI0qofIsTWU0eJ7TX8/yzPy6MbPCSG5zwBS
X-Received: by 10.28.93.70 with SMTP id r67mr18086033wmb.16.1448281148125;
	Mon, 23 Nov 2015 04:19:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k125sm6258257wmf.2.2015.11.23.04.19.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 04:19:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 12:10:24 +0000
Message-Id: <1448280627-22439-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] base: decode SRC_URI before adding implicit fetch dependencies
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
X-List-Received-Date: Mon, 23 Nov 2015 12:19:11 -0000

To avoid false positives such as a SRC_URI for http://foo.xz/foo.zip gaining a
dependnecy on xz-native decode the URI so that precise tests can be done.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 67 ++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index eb5edef..64820a7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -527,39 +527,40 @@ python () {
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
     srcuri = d.getVar('SRC_URI', True)
-    # Svn packages should DEPEND on subversion-native
-    if "svn://" in srcuri:
-        d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
-
-    # Git packages should DEPEND on git-native
-    if "git://" in srcuri:
-        d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
-
-    # Mercurial packages should DEPEND on mercurial-native
-    elif "hg://" in srcuri:
-        d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
-
-    # OSC packages should DEPEND on osc-native
-    elif "osc://" in srcuri:
-        d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
-
-    # *.lz4 should depends on lz4-native for unpacking
-    # Not endswith because of "*.patch.lz4;patch=1". Need bb.fetch.decodeurl in future
-    if '.lz4' in srcuri:
-        d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
-
-    # *.xz should depends on xz-native for unpacking
-    # Not endswith because of "*.patch.xz;patch=1". Need bb.fetch.decodeurl in future
-    if '.xz' in srcuri:
-        d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
-
-    # unzip-native should already be staged before unpacking ZIP recipes
-    if ".zip" in srcuri:
-        d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
-
-    # file is needed by rpm2cpio.sh
-    if ".src.rpm" in srcuri:
-        d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
+    for uri in srcuri.split():
+        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
+
+        # Svn packages should DEPEND on subversion-native
+        if scheme == "svn":
+            d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
+
+        # Git packages should DEPEND on git-native
+        elif scheme == "git":
+            d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
+
+        # Mercurial packages should DEPEND on mercurial-native
+        elif scheme == "hg":
+            d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
+
+        # OSC packages should DEPEND on osc-native
+        elif scheme == "osc":
+            d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
+
+        # *.lz4 should DEPEND on lz4-native for unpacking
+        if path.endswith('.lz4'):
+            d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
+
+        # *.xz should DEPEND on xz-native for unpacking
+        elif path.endswith('.xz'):
+            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
+
+        # .zip should DEPEND on unzip-native for unpacking
+        elif path.endswith('.zip'):
+            d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
+
+        # file is needed by rpm2cpio.sh
+        elif path.endswith('.src.rpm'):
+            d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
 
     set_packagetriplet(d)
 
-- 
2.1.4


