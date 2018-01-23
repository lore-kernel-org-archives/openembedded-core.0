Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 158C67875B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="168456049"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 23 Jan 2018 06:04:13 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E8AE45803BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:45 +0200
Message-Id: <1516716352-32735-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/12] libtasn1: upgrade to version 4.13
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:27 -0000

Remove backported patch:
        CVE-2017-10790.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gnutls/libtasn1/CVE-2017-10790.patch           | 63 ----------------------
 .../gnutls/{libtasn1_4.12.bb => libtasn1_4.13.bb}  |  5 +-
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.12.bb => libtasn1_4.13.bb} (80%)

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
deleted file mode 100644
index be84380..0000000
--- a/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d8d805e1f2e6799bb2dff4871a8598dc83088a39 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Thu, 22 Jun 2017 16:31:37 +0200
-Subject: [PATCH] _asn1_check_identifier: safer access to values read
-
-Signed-off-by: Nikos Mavrogiannopoulos <nmav@redhat.com>
-
-http://git.savannah.gnu.org/gitweb/?p=libtasn1.git;a=commit;h=d8d805e1f2e6799bb2dff4871a8598dc83088a39
-Upstream-Status: Backport
-
-CVE: CVE-2017-10790
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- lib/parser_aux.c |   17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/lib/parser_aux.c b/lib/parser_aux.c
-index 976ab38..786ea64 100644
---- a/lib/parser_aux.c
-+++ b/lib/parser_aux.c
-@@ -955,7 +955,7 @@ _asn1_check_identifier (asn1_node node)
- 	  if (p2 == NULL)
- 	    {
- 	      if (p->value)
--		_asn1_strcpy (_asn1_identifierMissing, p->value);
-+		_asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p->value);
- 	      else
- 		_asn1_strcpy (_asn1_identifierMissing, "(null)");
- 	      return ASN1_IDENTIFIER_NOT_FOUND;
-@@ -968,9 +968,15 @@ _asn1_check_identifier (asn1_node node)
- 	  if (p2 && (type_field (p2->type) == ASN1_ETYPE_DEFAULT))
- 	    {
- 	      _asn1_str_cpy (name2, sizeof (name2), node->name);
--	      _asn1_str_cat (name2, sizeof (name2), ".");
--	      _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
--	      _asn1_strcpy (_asn1_identifierMissing, p2->value);
-+	      if (p2->value)
-+	        {
-+	          _asn1_str_cat (name2, sizeof (name2), ".");
-+	          _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
-+	          _asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p2->value);
-+	        }
-+	      else
-+		_asn1_strcpy (_asn1_identifierMissing, "(null)");
-+
- 	      p2 = asn1_find_node (node, name2);
- 	      if (!p2 || (type_field (p2->type) != ASN1_ETYPE_OBJECT_ID) ||
- 		  !(p2->type & CONST_ASSIGN))
-@@ -990,7 +996,8 @@ _asn1_check_identifier (asn1_node node)
- 		  _asn1_str_cpy (name2, sizeof (name2), node->name);
- 		  _asn1_str_cat (name2, sizeof (name2), ".");
- 		  _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
--		  _asn1_strcpy (_asn1_identifierMissing, p2->value);
-+		  _asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p2->value);
-+
- 		  p2 = asn1_find_node (node, name2);
- 		  if (!p2 || (type_field (p2->type) != ASN1_ETYPE_OBJECT_ID)
- 		      || !(p2->type & CONST_ASSIGN))
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/gnutls/libtasn1_4.12.bb b/meta/recipes-support/gnutls/libtasn1_4.13.bb
similarity index 80%
rename from meta/recipes-support/gnutls/libtasn1_4.12.bb
rename to meta/recipes-support/gnutls/libtasn1_4.13.bb
index 7a7571a..2d22386 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.13.bb
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch \
-           file://CVE-2017-10790.patch \
            "
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "5c724bd1f73aaf4a311833e1cd297b21"
-SRC_URI[sha256sum] = "6753da2e621257f33f5b051cc114d417e5206a0818fe0b1ecfd6153f70934753"
+SRC_URI[md5sum] = "ce2ba4d3088119b48e7531a703669c52"
+SRC_URI[sha256sum] = "7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca"
 
 inherit autotools texinfo binconfig lib_package gtk-doc
 
-- 
2.4.0


