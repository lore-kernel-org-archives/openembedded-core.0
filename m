Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6BC7D299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:22:25 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d18so4555899lfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cDH3f22NkcexLN7dqIOFS9yEWVEbZwsyg918fb0RGKA=;
	b=CHQc0Z3CC0os9m5PhzcnS0+C1fdMfl6YCZsSLgj0LNnpK1V2XRZghyzZPkd2TH5eIs
	N0QvAmoyGPIm9jGVU3Hn7UdOwDutVF7lxzD3k9r6vG7KG2DOyiS53WWbbpNIygXT7lWZ
	joTLEHukJYxNV/ntiDp98aWgRzb5LxbefpVG30uhjlq/E3AZFtlKUcgR/pLtjH9d+c4K
	Rgx6NAA+V9ZDIMq1HijzXwqK8en9bu+sWb4BONwydsI1Y1YDPXdge9uYrN/13Y/KkZp9
	gstvMCQhnqTSkv5f/x4xuYv0VHFf26gu0MQQGzBKF27VYAKiWIs/1LjysrHUB1x9JAUd
	f35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cDH3f22NkcexLN7dqIOFS9yEWVEbZwsyg918fb0RGKA=;
	b=eiYXn1LC4h3DeHP7/rf1Wj0b8G9GQ6s41f7i0U7EdV6/TvCkpikkj95ToxTHH8UDuG
	eZOUK6igqnbjjORveFao3bgMqecilSFWGPx67tKnSR3hB5FY3c13wh9iz6Rr1lxIe8w0
	VicyxRXmE8u4uNja7OkxqUCuRLGyYezycjw0PnfKB1kyNnFrURDGX3ziLDEhczuB2jar
	712yZo3CYMbyRkRH0hh+tKsP5MnY5ly+qtLm1GWmE+2jf7gArfnv9ZzPHpGf3wOuMrCs
	/KSRZ8ppyfVoqIVarifT/rnuvbPnHyRJrzpwFZiaTO7dvpGvXQjdyZpFKmyNrPwzScJM
	4Jmw==
X-Gm-Message-State: APjAAAW5TGL0Wq75JRtVSvIv2setGDDvhUtxf7+nOd6E0yKBzRQT/aZA
	IfwVfYZNRQ3Go8x1JOiZObHko4V7atU=
X-Google-Smtp-Source: APXvYqzhgob+JiHPbDlbjlwP858pe4rEJk34+aD6qQJ5ndD216tQ336zIsXtdObLo+PSOEkZEXUjUQ==
X-Received: by 2002:a19:6619:: with SMTP id a25mr7214558lfc.21.1554474146324; 
	Fri, 05 Apr 2019 07:22:26 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-244-185.cust.tele2.se. [77.218.244.185])
	by smtp.gmail.com with ESMTPSA id
	v13sm4824185lje.84.2019.04.05.07.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Apr 2019 07:22:25 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2019 16:22:15 +0200
Message-Id: <1554474135-15120-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [thud][PATCH] opkg-utils: backport a patch to fix a sstate timestamp issue
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
X-List-Received-Date: Fri, 05 Apr 2019 14:22:26 -0000

From: Ming Liu <liu.ming50@gmail.com>

When using sstate, two parallel builds can produce two packages
with the same mtime but different checksums. When later one of
those two builds fetches the others ipk, the package index does
not get udpated properly (since mtime matches). This ends up with
messages such as:
  Downloading file:/../tmp/work/../image/...ipk.
  Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk

However, in that case, ctime is different. Use ctime instead of
mtime to prevent failures like this.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...pkg-make-index-use-ctime-instead-of-mtime.patch | 59 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils_0.3.6.bb                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
new file mode 100644
index 0000000..19778ac
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-make-index-use-ctime-instead-of-mtime.patch
@@ -0,0 +1,59 @@
+From 0cd38bb1bdcdbfc091014a1f39d015a1586a33e6 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan.agner@toradex.com>
+Date: Fri, 19 Oct 2018 17:38:21 +0200
+Subject: [PATCH] opkg-make-index: use ctime instead of mtime
+
+Upstream-Status: Backport
+
+When using sstate, two parallel builds can produce two packages
+with the same mtime but different checksums. When later one of
+those two builds fetches the others ipk, the package index does
+not get udpated properly (since mtime matches). This ends up with
+messages such as:
+  Downloading file:/../tmp/work/../image/...ipk.
+  Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk
+
+However, in that case, ctime is different. Use ctime instead of
+mtime to prevent failures like this.
+
+Suggested-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Acked-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ opkg-make-index | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/opkg-make-index b/opkg-make-index
+index 3227fc0..db7bf64 100755
+--- a/opkg-make-index
++++ b/opkg-make-index
+@@ -115,12 +115,12 @@ for abspath in files:
+      pkg = None
+      fnameStat = os.stat(abspath)
+      if filename in old_pkg_hash:
+-          if filename in pkgsStamps and int(fnameStat.st_mtime) == pkgsStamps[filename]:
++          if filename in pkgsStamps and int(fnameStat.st_ctime) == pkgsStamps[filename]:
+             if (verbose):
+                sys.stderr.write("Found %s in Packages\n" % (filename,))
+             pkg = old_pkg_hash[filename]
+           else:
+-               sys.stderr.write("Found %s in Packages, but mtime differs - re-reading\n" % (filename,))
++               sys.stderr.write("Found %s in Packages, but ctime differs - re-reading\n" % (filename,))
+ 
+      if not pkg:
+           if (verbose):
+@@ -137,7 +137,7 @@ for abspath in files:
+      else:
+           old_filename = ""
+      s = packages.add_package(pkg, opt_a)
+-     pkgsStamps[filename] = fnameStat.st_mtime
++     pkgsStamps[filename] = fnameStat.st_ctime
+      if s == 0:
+           if old_filename:
+                # old package was displaced by newer
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index 4c41774..41cf11c 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://threaded-xz.patch \
            file://pigz.patch \
            file://0001-update-alternatives-Fix-link-relocation-support.patch \
+           file://0001-opkg-make-index-use-ctime-instead-of-mtime.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.7.4


