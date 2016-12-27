Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 13C0371951
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 21:10:44 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBRKo3Ka025569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 14:50:03 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 27 Dec 2016 14:50:03 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Dec 2016 14:50:00 -0600
Message-ID: <1482871801-4357-2-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482871801-4357-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1482871801-4357-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-27_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612270333
Subject: [PATCH 1/2] opkg: upgrade to v0.3.4
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
X-List-Received-Date: Tue, 27 Dec 2016 21:10:45 -0000
Content-Type: text/plain

* Add localstatedir and sysconfdir class-native configure definitions to
  override OE default sysroot values.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch | 8 ++++----
 meta/recipes-devtools/opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb}       | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.3.3.bb => opkg_0.3.4.bb} (88%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
index 255021b..e94a412 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -21,10 +21,10 @@ index 7bca948..5a1bc44 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -40,7 +40,7 @@ extern "C" {
- #define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
- #define OPKG_CONF_DEFAULT_CACHE_DIR     "/var/cache/opkg"
- #define OPKG_CONF_DEFAULT_CONF_FILE_DIR "/etc/opkg"
--#define OPKG_CONF_DEFAULT_LOCK_FILE     "/var/run/opkg.lock"
+ #define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
+ #define OPKG_CONF_DEFAULT_CACHE_DIR     VARDIR "/cache/opkg"
+ #define OPKG_CONF_DEFAULT_CONF_FILE_DIR SYSCONFDIR "/opkg"
+-#define OPKG_CONF_DEFAULT_LOCK_FILE     VARDIR "/run/opkg.lock"
 +#define OPKG_CONF_DEFAULT_LOCK_FILE     "/run/opkg.lock"
  
  /* In case the config file defines no dest */
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.3.bb b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
similarity index 88%
rename from meta/recipes-devtools/opkg/opkg_0.3.3.bb
rename to meta/recipes-devtools/opkg/opkg_0.3.4.bb
index bce72fc..5cf2fac 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
 "
 
-SRC_URI[md5sum] = "a4613038c8afc7d8d482f5c53f137bdf"
-SRC_URI[sha256sum] = "19db9e73121a5e4c91fa228b0a6a4c55cc3591056130cfb3c66c30aa32f8d00e"
+SRC_URI[md5sum] = "6c52a065499056a196e0b45a27e392de"
+SRC_URI[sha256sum] = "750b900b53b62a9b280b601a196f02da81091eda2f3478c509512aa5a1ec93be"
 
 inherit autotools pkgconfig systemd
 
@@ -37,6 +37,8 @@ PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
 PACKAGECONFIG[pathfinder] = "--enable-pathfinder,--disable-pathfinder,pathfinder"
 PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
 
+EXTRA_OECONF_class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-- 
2.7.4


