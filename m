Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7A36BF3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 13:25:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id x7so2439093wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/DYb2QSZLk6L1YD/pD1BkI7Qgox9oEZGd5lTmHfhxc4=;
	b=pwEnMJ4VMY1IflJK8IrSmJD7Jjnj5g7kfqwF1N4F0TFuwAp3BIzMz7OZmlUzl4wd2J
	Z3IHJDwKDf11jQVtrEemAQp84n2BPbRSZ8ZHfzNitCm/NdEQOyPWCRlhDEq1SGnTuU5C
	eaEM0QxLntn24eR6fnXKtXDzttcXw58hAyaIoFjh2xrffX0FiPZ1qY39MJ9mh+k1eC6H
	gyXTB9OEfbhU2HTAY9mgx3j9x88NffrTH42pQhgAGTBd6tL1dcYQkKjr0Dtgo3O1kwd8
	23PC64gB6jTbYUAgk65gMN2aZYMvPXmTVySVFN3WdXmBT5+AjeicdyiwUnzb5kj/XZ/l
	M1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/DYb2QSZLk6L1YD/pD1BkI7Qgox9oEZGd5lTmHfhxc4=;
	b=cp0ReD4LyFhatV1R8wmuVQp6MueucnVB6J0MmF2qggMO1iEg4FD5grOJrchz0x0zD8
	ShoPEniOwvTJvSzfea8kCpsQz7nhu2kCe/lMqVFezFnkPXbtmqCm4SJVBOvSRJbV9FLF
	TTI3A7w1Yk3nQWCUnJX1F8I3wWph/hWal/M402pLBuwkya7U4LbQ/GAHTEhj/Fd4pikb
	fxvW+H3Vd66+EGykSKqlRxx+ov0p1sCL/McFDlLxSnKgbFI8CLnPTzVyUDOsx7m8u60a
	d2R1GO4rpQ+MUHMt09fGzGkpttKzD5xrazKqCJMgUQK8SqfEd3X8A1kXAu7/VlyHpWNs
	mAVA==
X-Gm-Message-State: AHQUAubwFrtSnemOmsuxz0ipZnr5nNo3Q+lfd54nnFqQ/AxPTN1mkNsc
	tBF9WdaiABNkSnj+R9nebVxmzUrOXi4=
X-Google-Smtp-Source: AHgI3IYyTNJFdl/yJG2/uf9ud+16mJ5imNck6yv5sz+E5huf/3GCQIKgKepoemwIx0+GyWcJixzDmQ==
X-Received: by 2002:a05:600c:2102:: with SMTP id
	u2mr323459wml.152.1550064357406; 
	Wed, 13 Feb 2019 05:25:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l129sm4517400wml.42.2019.02.13.05.25.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 05:25:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2019 13:25:52 +0000
Message-Id: <20190213132552.24550-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190213132552.24550-1-ross.burton@intel.com>
References: <20190213132552.24550-1-ross.burton@intel.com>
Subject: [PATCH 2/2] gstreamer: improve metadata dependencies
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
X-List-Received-Date: Wed, 13 Feb 2019 13:25:57 -0000

Instead of maintaining its own copy of the 'system' packages, reuse
oe.utils.packages_filter_out_system().

This stops ${PN}-src being added to the meta package, which meant anything
depending on the meta package was also pulling in the sources.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index c995e29e09d..6781e98c319 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -15,17 +15,17 @@ python split_gstreamer10_packages () {
 
 python set_metapkg_rdepends () {
     import os
+    import oe.utils
 
     pn = d.getVar('PN')
     metapkg =  pn + '-meta'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     d.setVar('FILES_' + metapkg, "")
-    blacklist = [ pn, pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc', pn + '-meta' ]
+    blacklist = [ pn, pn + '-meta' ]
     metapkg_rdepends = []
-    packages = d.getVar('PACKAGES').split()
     pkgdest = d.getVar('PKGDEST')
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-staticdev'):
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg not in blacklist and pkg not in metapkg_rdepends:
             # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
             # If this subdirectory is empty, then the package is.
             # Empty packages do not get added to the meta package's RDEPENDS
-- 
2.11.0


