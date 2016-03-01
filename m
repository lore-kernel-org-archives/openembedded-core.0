Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE0B1605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 04:14:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u214EaAl016686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:14:36 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 20:14:35 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 22:14:21 -0600
Message-ID: <bfea42a26ba9bd0d4312c8ae8465893a9379a946.1456805149.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456805147.git.mark.hatle@windriver.com>
References: <cover.1456805147.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] rpm: Enable specific crypto and digest settings via variables
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
X-List-Received-Date: Tue, 01 Mar 2016 04:14:36 -0000
Content-Type: text/plain

Allow the user to set the specific digest and non-repudiable signature
algorithms.  This should be done on a distribution wide basis.

See recipe for exact instructions, but values are now set using:
RPM_FILE_DIGEST_ALGO (default 1 - md5)
RPM_SELF_SIGN_ALGO   (default DSA)

Also, change the PACKAGECONFIG to define the default crypto engine for
RPM5.  Not just the available crypto engines.  If a crypto engine is not
selected, the system will default to the internal beecrypt version.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb | 81 ++++++++++++++++++++++++++++++--
 meta/recipes-devtools/rpm/rpm_5.4.16.bb  | 81 ++++++++++++++++++++++++++++++--
 2 files changed, 152 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index c966a1f..28851fe 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -165,6 +165,68 @@ rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macro
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
+# Set the digest algorithm used for verifying file integrity
+# If this value changes, and two different packages have different values
+# the "same file" validation (two packages have a non-conflict file)
+# will fail.  This may lead to upgrade problems.  You should treat this
+# value as a distribution wide setting, and only change it when you intend
+# a full system upgrade!
+#
+# Defined file digest algorithm values (note: not all are available!):
+#       1       MD5 (legacy RPM default)
+#       2       SHA1
+#       3       RIPEMD-160
+#       5       MD2
+#       6       TIGER-192
+#       8       SHA256
+#       9       SHA384
+#       10      SHA512
+#       11      SHA224
+#       104     MD4
+#       105     RIPEMD-128
+#       106     CRC-32
+#       107     ADLER-32
+#       108     CRC-64 (ECMA-182 polynomial, untested uint64_t problems)
+#       109     Jenkins lookup3.c hashlittle()
+#       111     RIPEMD-256
+#       112     RIPEMD-320
+#       188     BLAKE2B
+#       189     BLAKE2BP
+#       190     BLAKE2S
+#       191     BLAKE2SP
+RPM_FILE_DIGEST_ALGO ?= "1"
+
+# All packages build with RPM5 contain a non-repudiable signature.
+# The purpose of this signature is not to show authenticity of a package,
+# but instead act as a secondary package wide validation that shows it
+# wasn't damaged by accident in transport.  (When later you sign the package, 
+# this signature may or may not be replaced as there are three signature 
+# slots, one for DSA/RSA, one for ECSDA, and one reserved.)
+#
+# There is a known issue w/ RSA signatures that if they start with an 0x00
+# the signing and validation may fail.
+#
+# The following is the list of choices for the non-rpudiable signature
+# (note: not all of these are implemented):
+#       DSA             (default)
+#       RSA             (implies SHA1)
+#       ECDSA           (implies SHA256)
+#       DSA/SHA1
+#       DSA/SHA224
+#       DSA/SHA256
+#       DSA/SHA384
+#       DSA/SHA512
+#       RSA/SHA1
+#       RSA/SHA224
+#       RSA/SHA256
+#       RSA/SHA384
+#       RSA/SHA512
+#       ECDSA/SHA224    (using NIST P-224)
+#       ECDSA/SHA256    (using NIST P-256)
+#       ECDSA/SHA384    (using NIST P-384)
+#       ECDSA/SHA512    (using NIST P-521)
+RPM_SELF_SIGN_ALGO ?= "DSA"
+
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
 PACKAGECONFIG ??= "db bzip2 zlib openssl libelf python"
@@ -194,10 +256,17 @@ PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
 PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
+# This switch simply disables external beecrypt, RPM5 always uses beecrypt
+# for base64 processing and various digest algorithms.
+# Beecrypt is only the preferred crypto engine if it's the only engine enabled.
 PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--with-beecrypt=internal,beecrypt,"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
+
+# --with-usecrypto= setting defined the item as the preferred system
+# crypto engine, which will take priority over the included beecrypt
+PACKAGECONFIG[openssl] = "--with-openssl --with-usecrypto=openssl,--without-openssl,openssl,"
+PACKAGECONFIG[nss] = "--with-nss --with-usecrypto=nss,--without-nss,nss,"
+PACKAGECONFIG[gcrypt] = "--with-gcrypt --with-usecrypto=gcrypt,--without-gcrypt,gcrypt,"
+
 PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils,"
 PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
 
@@ -442,8 +511,10 @@ do_configure() {
 }
 
 do_install_append() {
-	# Preserve the previous default of DSA self-signed pkgs
-	sed -i -e 's,%_build_sign.*,%_build_sign DSA,' ${D}/${libdir}/rpm/macros.rpmbuild
+	# Configure -distribution wide- package crypto settings
+	# If these change, effectively all packages have to be upgraded!
+	sed -i -e 's,%_build_file_digest_algo.*,%_build_sign ${RPM_FILE_DIGEST_ALGO},' ${D}/${libdir}/rpm/macros.rpmbuild
+	sed -i -e 's,%_build_sign.*,%_build_sign ${RPM_SELF_SIGN_ALGO},' ${D}/${libdir}/rpm/macros.rpmbuild
 
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index f190cc0..4ca0997 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -158,6 +158,68 @@ rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macro
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
+# Set the digest algorithm used for verifying file integrity
+# If this value changes, and two different packages have different values
+# the "same file" validation (two packages have a non-conflict file)
+# will fail.  This may lead to upgrade problems.  You should treat this
+# value as a distribution wide setting, and only change it when you intend
+# a full system upgrade!
+#
+# Defined file digest algorithm values (note: not all are available!):
+#       1       MD5 (legacy RPM default)
+#       2       SHA1
+#       3       RIPEMD-160
+#       5       MD2
+#       6       TIGER-192
+#       8       SHA256
+#       9       SHA384
+#       10      SHA512
+#       11      SHA224
+#       104     MD4
+#       105     RIPEMD-128
+#       106     CRC-32
+#       107     ADLER-32
+#       108     CRC-64 (ECMA-182 polynomial, untested uint64_t problems)
+#       109     Jenkins lookup3.c hashlittle()
+#       111     RIPEMD-256
+#       112     RIPEMD-320
+#       188     BLAKE2B
+#       189     BLAKE2BP
+#       190     BLAKE2S
+#       191     BLAKE2SP
+RPM_FILE_DIGEST_ALGO ?= "1"
+
+# All packages build with RPM5 contain a non-repudiable signature.
+# The purpose of this signature is not to show authenticity of a package,
+# but instead act as a secondary package wide validation that shows it
+# wasn't damaged by accident in transport.  (When later you sign the package, 
+# this signature may or may not be replaced as there are three signature 
+# slots, one for DSA/RSA, one for ECSDA, and one reserved.)
+#
+# There is a known issue w/ RSA signatures that if they start with an 0x00
+# the signing and validation may fail.
+#
+# The following is the list of choices for the non-rpudiable signature
+# (note: not all of these are implemented):
+#       DSA             (default)
+#       RSA             (implies SHA1)
+#       ECDSA           (implies SHA256)
+#       DSA/SHA1
+#       DSA/SHA224
+#       DSA/SHA256
+#       DSA/SHA384
+#       DSA/SHA512
+#       RSA/SHA1
+#       RSA/SHA224
+#       RSA/SHA256
+#       RSA/SHA384
+#       RSA/SHA512
+#       ECDSA/SHA224    (using NIST P-224)
+#       ECDSA/SHA256    (using NIST P-256)
+#       ECDSA/SHA384    (using NIST P-384)
+#       ECDSA/SHA512    (using NIST P-521)
+RPM_SELF_SIGN_ALGO ?= "DSA"
+
 # Note: perl and sqlite w/o db specified does not currently work.
 #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
 PACKAGECONFIG ??= "db bzip2 zlib openssl libelf python"
@@ -187,10 +249,17 @@ PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
 PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
+# This switch simply disables external beecrypt, RPM5 always uses beecrypt
+# for base64 processing and various digest algorithms.
+# Beecrypt is only the preferred crypto engine if it's the only engine enabled.
 PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--with-beecrypt=internal,beecrypt,"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
-PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
+
+# --with-usecrypto= setting defined the item as the preferred system
+# crypto engine, which will take priority over the included beecrypt
+PACKAGECONFIG[openssl] = "--with-openssl --with-usecrypto=openssl,--without-openssl,openssl,"
+PACKAGECONFIG[nss] = "--with-nss --with-usecrypto=nss,--without-nss,nss,"
+PACKAGECONFIG[gcrypt] = "--with-gcrypt --with-usecrypto=gcrypt,--without-gcrypt,gcrypt,"
+
 PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils,"
 PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
 
@@ -435,8 +504,10 @@ do_configure() {
 }
 
 do_install_append() {
-	# Preserve the previous default of DSA self-signed pkgs
-	sed -i -e 's,%_build_sign.*,%_build_sign DSA,' ${D}/${libdir}/rpm/macros.rpmbuild
+	# Configure -distribution wide- package crypto settings
+	# If these change, effectively all packages have to be upgraded!
+	sed -i -e 's,%_build_file_digest_algo.*,%_build_sign ${RPM_FILE_DIGEST_ALGO},' ${D}/${libdir}/rpm/macros.rpmbuild
+	sed -i -e 's,%_build_sign.*,%_build_sign ${RPM_SELF_SIGN_ALGO},' ${D}/${libdir}/rpm/macros.rpmbuild
 
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__perl_provides,#%%__perl_provides,' ${D}/${libdir}/rpm/macros ${D}/${libdir}/rpm/macros.d/*
-- 
2.5.0


