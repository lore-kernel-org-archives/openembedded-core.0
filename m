Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EED77319E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 01:17:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBM1Hm3M027541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 17:17:49 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 17:17:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Dec 2015 09:04:54 +0800
Message-ID: <ae50974df4666ad722e5989b1b617e9d660978d9.1450746244.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1450746244.git.kai.kang@windriver.com>
References: <cover.1450746244.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bind: 9.10.2-P4 -> 9.10.3-P2
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
X-List-Received-Date: Tue, 22 Dec 2015 01:17:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade bind from 9.10.2-P4 to 9.10.3-P2.

* update context of 0001-build-use-pkg-config-to-find-libxml2.patch
* add PACKAGECONFIGs readline and libedit. They provide same library, so
  should not be set at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-build-use-pkg-config-to-find-libxml2.patch  | 20 ++++++++++++++------
 .../bind/{bind_9.10.2-P4.bb => bind_9.10.3-P2.bb}    |  9 ++++++---
 2 files changed, 20 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P4.bb => bind_9.10.3-P2.bb} (90%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
index cb5251d..805cbb3 100644
--- a/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-build-use-pkg-config-to-find-libxml2.patch
@@ -4,15 +4,18 @@ libxml2.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Update context for version 9.10.3-P2.
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
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
similarity index 90%
rename from meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
rename to meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
index 1e1e726..875a0c8 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P2.bb
@@ -23,8 +23,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
            "
 
-SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-SRC_URI[sha256sum] = "c00b21ec1def212957f28efe9d10aac52d6ec515e84fbf2c42143f5d71429cb8"
+SRC_URI[md5sum] = "672dd3c2796b12ac8440f55bcaecfa82"
+SRC_URI[sha256sum] = "4a6c1911ac0d4b6be635b63de3429b6c168ea244043f12bbc8a4eb3368fd6ecd"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
@@ -35,8 +35,11 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                "
 inherit autotools update-rc.d systemd useradd pkgconfig
 
-PACKAGECONFIG ?= ""
+# PACKAGECONFIGs readline and libedit should NOT be set at same time
+PACKAGECONFIG ?= "readline"
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
+PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
-- 
2.6.1


