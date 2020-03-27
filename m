Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.7469.1585298054419647122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02R8XqtO031802
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 01:34:03 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Mar 2020
 01:33:55 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] libpam: Add userdb packageconfig
Date: Fri, 27 Mar 2020 10:31:56 +0200
Message-ID: <20200327083156.20874-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327083156.20874-1-ovidiu.panait@windriver.com>
References: <20200327083156.20874-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Add userdb packageconfig to control the building of the pam_userdb.so module.
This depends on dbm support being compiled in for the berkley db package.

Also, remove "--with-db-uniquename=_pam" from EXTRA_OECONF. It makes the checks
for libdb fail because it searches for the wrong symbols in libdb (and libdb
was not configured with --with-uniquename=_pam option).

db.do_configure:
    checking if --with-uniquename=NAME option specified... no

libpam.do_configure:
    checking for db_create_pam... no
    checking for db_create... no
    checking for dbm_store_pam... no
    checking for dbm_store... no
    checking for dbm_store in -lndbm... no

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index ac8694ec26..bc72afe6ad 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -35,8 +35,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcit
 
 DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
 
-EXTRA_OECONF = "--with-db-uniquename=_pam \
-                --includedir=${includedir}/security \
+EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
                 --disable-nis \
                 --disable-regenerate-docu \
@@ -48,7 +47,9 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
 
 inherit autotools gettext pkgconfig
 
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
+PACKAGECONFIG[userdb] = "--enable-db=db,--enable-db=no,db,"
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
-- 
2.17.1

