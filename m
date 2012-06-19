Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgtFC-0005Np-Qh
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 09:52:58 +0200
Received: by werg55 with SMTP id g55so4054639wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JeDNN670/WsTvx+gXR9IoVqmrFflZJixg7czltlD2l4=;
	b=f/fpMoZQbyZVbw6pc0bZym1xaZD2dBV9G3Kf/VyTnwej8DluWCarWXFJ9mG4gKhEQB
	eidMEqp+0fbTUqblqOh8zVha1VSf6XRvImUgVhKxgGOxXqry7QKOtT0dNcl17qz4xMeZ
	4qxkSxn1Cg3MhrX0MV5ypqnAd2nKNHQ7gTY/ngMI8WMxB1v1f2wpNB8ZajMHbxTA/tWw
	gcKLWCy7AEuIFfe4f4PZE/DLagQWKblDHHwKjPi/rTbyNpRpCCIjYJdqseCueteYGW0l
	d+9xyL0zyFsWbfcHXznpAXgMJm1AIEs0vZrx344lapbLes2j3Qg7mKTxO2TZgxdbt27Z
	NZzQ==
Received: by 10.216.202.160 with SMTP id d32mr9549059weo.147.1340091735878;
	Tue, 19 Jun 2012 00:42:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n6sm55966584wie.7.2012.06.19.00.42.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 00:42:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 09:42:09 +0200
Message-Id: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 1/2] opkg-utils: bump SRCREV
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
X-List-Received-Date: Tue, 19 Jun 2012 07:52:58 -0000

* there are 2 small fixes
  python-2.6 compatibility
  missing C option for opkg-build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../opkg-utils/opkg-utils/shr.patch                |   26 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
new file mode 100644
index 0000000..29de962
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
@@ -0,0 +1,26 @@
+diff --git a/opkg-build b/opkg-build
+index 012afd3..485897a 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -160,7 +160,7 @@ outer=ar
+ noclean=0
+ opkext=0
+ usage="Usage: $0 [-c] [-C] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]"
+-while getopts "cg:ho:vO" opt; do
++while getopts "cCg:ho:vO" opt; do
+     case $opt in
+ 	o ) owner=$OPTARG
+ 	    ogargs="--owner=$owner"
+diff --git a/opkg-make-index b/opkg-make-index
+index 22393e8..1c3a8e1 100755
+--- a/opkg-make-index
++++ b/opkg-make-index
+@@ -186,7 +186,7 @@ if packages_filename:
+      gzip_filename = ("%s.gz" % packages_filename)
+      tmp_gzip_filename = ("%s.%d" % (gzip_filename, os.getpid()))
+      gzip_cmd = "gzip -9c < %s > %s" % (tmp_packages_filename, tmp_gzip_filename)
+-     rc = subprocess.check_output(gzip_cmd, shell=True)
++     subprocess.call(gzip_cmd, shell=True)
+      os.rename(tmp_packages_filename, packages_filename)
+      os.rename(tmp_gzip_filename, gzip_filename)
+ 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 1996c75..b193ba4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
 PV = "0.1.8+git${SRCPV}"
 PR = "r1"
 
-- 
1.7.8.6



