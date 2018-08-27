Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC0B27545B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:31:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7RFVVC9029280
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 08:31:31 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 08:31:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 27 Aug 2018 23:31:26 +0800
Message-ID: <1535383888-28979-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] nss :improve reproducibility
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
X-List-Received-Date: Mon, 27 Aug 2018 15:31:31 -0000
Content-Type: text/plain

- Explicitly requests the newer database `sql:' rather than
  retrieved from NSS_DEFAULT_DB_TYPE

- Removes build path prefix from pkcs11.txt

Refers certutil manual:
[certutil manual]
-d [prefix]directory
 Specify the database directory containing the certificate and key database files.
 certutil supports two types of databases: the legacy security databases (cert8.db,
  key3.db, and secmod.db) and new SQLite databases (cert9.db, key4.db, and pkcs11.txt).

 NSS recognizes the following prefixes:
  sql: requests the newer database
  dbm: requests the legacy database
 If no prefix is specified the default type is retrieved from NSS_DEFAULT_DB_TYPE.
 If NSS_DEFAULT_DB_TYPE is not set then dbm: is the default.
[certutil manual]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/nss/nss_3.38.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
index f3e5170..904b621 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -215,9 +215,11 @@ do_install_append_class-target() {
     # Create a blank certificate
     mkdir -p ${D}${sysconfdir}/pki/nssdb/
     touch ./empty_password
-    certutil -N -d ${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
+    certutil -N -d sql:${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
     chmod 644 ${D}${sysconfdir}/pki/nssdb/*.db
     rm ./empty_password
+    # Remove build path prefix
+    sed -i "s:${D}::g"  ${D}${sysconfdir}/pki/nssdb/pkcs11.txt
 }
 
 PACKAGE_WRITE_DEPS += "nss-native"
-- 
2.7.4


