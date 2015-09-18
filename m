Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 397AD60125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 03:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I3SV9x003193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:28:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 17 Sep 2015 20:28:31 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Sep 2015 11:22:23 +0800
Message-ID: <49a75fb1c8a88fbaf77f9b19b054802cc21559d6.1442546459.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1442546459.git.kai.kang@windriver.com>
References: <cover.1442546459.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bind: 9.10.2-P4 -> 9.10.3
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
X-List-Received-Date: Fri, 18 Sep 2015 03:28:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade bind to 9.10.3 to fix CVE issues.

* update context of 0001-build-use-pkg-config-to-find-libxml2.patch for
  new version.

[YOCTO #8281]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-build-use-pkg-config-to-find-libxml2.patch  | 20 ++++++++++++++------
 .../bind/{bind_9.10.2-P4.bb => bind_9.10.3.bb}       |  4 ++--
 2 files changed, 16 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P4.bb => bind_9.10.3.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
index cb5251d..7f2f514 100644
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -4,15 +4,18 @@ libxml2.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Update context for version 9.10.3.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- configure.in | 18 +++---------------
- 1 file changed, 3 insertions(+), 15 deletions(-)
+ configure.in | 23 +++--------------------
+ 1 file changed, 3 insertions(+), 20 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index d566e1c..c9ef3a6 100644
+index 0db826d..75819eb 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -2102,21 +2102,9 @@ case "$use_libxml2" in
+@@ -2107,26 +2107,9 @@ case "$use_libxml2" in
  		DST_LIBXML2_INC=""
  		;;
  	auto|yes)
@@ -22,8 +25,13 @@ index d566e1c..c9ef3a6 100644
 -			libxml2_cflags=`xml2-config --cflags`
 -			;;
 -		*)
--			libxml2_libs=
--			libxml2_cflags=
+-			if test "$use_libxml2" = "yes" ; then
+-				AC_MSG_RESULT(no)
+-				AC_MSG_ERROR(required libxml2 version not available)
+-			else
+-				libxml2_libs=
+-				libxml2_cflags=
+-			fi
 -			;;
 -		esac
 -		;;
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.3.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
rename to meta/recipes-connectivity/bind/bind_9.10.3.bb
index efae289..1d3c6ff 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3.bb
@@ -22,8 +22,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            "
 
-SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-SRC_URI[sha256sum] = "c00b21ec1def212957f28efe9d10aac52d6ec515e84fbf2c42143f5d71429cb8"
+SRC_URI[md5sum] = "d8cbf04a62a139a841d4bf878087a555"
+SRC_URI[sha256sum] = "9ac33bd8754ab4b6ee449b1b2aa88e09f51cda088486f4ab1585acd920b98ff0"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-- 
1.9.1


