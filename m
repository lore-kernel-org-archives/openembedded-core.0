Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 099396011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 18:44:45 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so11648470wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 10:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=B06uDIJln0kJ87ViOKQD8nWIiyXzrnFOg4VKZwfGHKE=;
	b=Q8r/QL9PhRNcpKaAQq3WcpmVUqvrcB/cMVgk4RnmSXI43KGXwEY4FgRl8rVW0LtyfN
	lVh+i1yK7MIBeiU+vwqkkHXQg/1v/TPV49uXu6uLmH/W77p+UleDvXzgyMtx8e0kohAV
	m5FxZ4RoB9jldu4kYJPhr3X5L6ZT5tbcckCLr2ENkQXgPLThgrh49i4+X5bV8TyEZQe4
	gLIL9uC3mjng3kHH/tAVcImThx/saMGK/ZIV8t4BsNek+1WBXrwdxvpTnTwC3PG2/B4F
	YQdSAmioal+HYKuDaStw4GH43YdwzIUDeGsm223S01riNUCQVbQMVnxS3chDji0LzdcA
	ylvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B06uDIJln0kJ87ViOKQD8nWIiyXzrnFOg4VKZwfGHKE=;
	b=GtGTOPMuaxt+UEvKGuacB+qv5oeo1bof3h6XTUVCyB25Jy0RBX47xo01zbjzdqgcKC
	jyBykSjfJxOut9+6AE/yHlMn8QUnKMXFt9AkdOeuheWB+RUUlAvwmnTJHDlRzCwXbM7l
	ZXFRtAqvPSMIAND+RKFHPCNfHPLSOO8IEz+JeHhsy5m6uWkKKDx3/DAdH+Ts1nsa5oQ0
	aqpGg5GM6xFOoa8wbgvaogzn9vpvhTAqEIzM7tBrZYqVbV7zQpBuzggA5RNJHJpTUibe
	1AipW4oN94njYlypnTlHwIf7kXyq/1GHBGP5jfhclJcWBL18yq0o+k6kwSA/DQb6yjxM
	z8yg==
X-Gm-Message-State: ALoCoQmFvEdYk/bNNTwbXu1B1O+VsC9ILyC8V3aDJP9JrP8KfkFPt2EOnWcZvs5a6A/rXy1N88pu
X-Received: by 10.194.52.68 with SMTP id r4mr20677222wjo.8.1448131485529;
	Sat, 21 Nov 2015 10:44:45 -0800 (PST)
Received: from Blackadder.home
	(host86-164-154-14.range86-164.btcentralplus.com. [86.164.154.14])
	by smtp.gmail.com with ESMTPSA id
	143sm5323286wmv.18.2015.11.21.10.44.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 Nov 2015 10:44:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 18:44:37 +0000
Message-Id: <1448131478-38698-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.4.9 (Apple Git-60)
Subject: [PATCH 1/2] base: decode SRC_URI before adding implicit fetch dependencies
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
X-List-Received-Date: Sat, 21 Nov 2015 18:44:46 -0000

To avoid false positives such as a SRC_URI for http://foo.xz/foo.zip gaining a
dependnecy on xz-native decode the URI so that precise tests can be done.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index eb5edef..c7db81a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -527,38 +527,37 @@ python () {
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
     srcuri = d.getVar('SRC_URI', True)
+    (scheme, _ , path) = bb.fetch.decodeurl(srcuri)[:3]
     # Svn packages should DEPEND on subversion-native
-    if "svn://" in srcuri:
+    if scheme == "svn":
         d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
     # Git packages should DEPEND on git-native
-    if "git://" in srcuri:
+    elif scheme == "git":
         d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
     # Mercurial packages should DEPEND on mercurial-native
-    elif "hg://" in srcuri:
+    elif scheme == "hg":
         d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
     # OSC packages should DEPEND on osc-native
-    elif "osc://" in srcuri:
+    elif scheme == "osc"
         d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
-    # *.lz4 should depends on lz4-native for unpacking
-    # Not endswith because of "*.patch.lz4;patch=1". Need bb.fetch.decodeurl in future
-    if '.lz4' in srcuri:
+    # *.lz4 should DEPEND on lz4-native for unpacking
+    if path.endswith('.lz4'):
         d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
 
-    # *.xz should depends on xz-native for unpacking
-    # Not endswith because of "*.patch.xz;patch=1". Need bb.fetch.decodeurl in future
-    if '.xz' in srcuri:
+    # *.xz should DEPEND on xz-native for unpacking
+    elif path.endswith('.xz'):
         d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
-    # unzip-native should already be staged before unpacking ZIP recipes
-    if ".zip" in srcuri:
+    # .zip should DEPEND on unzip-native for unpacking
+    elif path.endswith('.zip'):
         d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
     # file is needed by rpm2cpio.sh
-    if ".src.rpm" in srcuri:
+    elif path.endswith('.src.rpm'):
         d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
 
     set_packagetriplet(d)
-- 
2.4.9 (Apple Git-60)


