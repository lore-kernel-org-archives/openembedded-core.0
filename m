Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB1B784D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7F9tOMb003377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 02:55:25 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 02:55:23 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 02:55:23 -0700
Message-ID: <20170815095523.20810-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] libtasn1: CVE-2017-10790
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
X-List-Received-Date: Tue, 15 Aug 2017 09:55:24 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The _asn1_check_identifier function in GNU Libtasn1 through 4.12 causes
a NULL pointer dereference and crash when reading crafted input that
triggers assignment of a NULL value within an asn1_node structure. It
may lead to a remote denial of service attack.

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-10790
http://git.savannah.gnu.org/gitweb/?p=libtasn1.git;a=commit;
h=d8d805e1f2e6799bb2dff4871a8598dc83088a39

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../gnutls/libtasn1/CVE-2017-10790.patch           | 63 ++++++++++++++++++++++
 meta/recipes-support/gnutls/libtasn1_4.12.bb       |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
new file mode 100644
index 0000000000..be843808a2
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2017-10790.patch
@@ -0,0 +1,63 @@
+From d8d805e1f2e6799bb2dff4871a8598dc83088a39 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Thu, 22 Jun 2017 16:31:37 +0200
+Subject: [PATCH] _asn1_check_identifier: safer access to values read
+
+Signed-off-by: Nikos Mavrogiannopoulos <nmav@redhat.com>
+
+http://git.savannah.gnu.org/gitweb/?p=libtasn1.git;a=commit;h=d8d805e1f2e6799bb2dff4871a8598dc83088a39
+Upstream-Status: Backport
+
+CVE: CVE-2017-10790
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ lib/parser_aux.c |   17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/lib/parser_aux.c b/lib/parser_aux.c
+index 976ab38..786ea64 100644
+--- a/lib/parser_aux.c
++++ b/lib/parser_aux.c
+@@ -955,7 +955,7 @@ _asn1_check_identifier (asn1_node node)
+ 	  if (p2 == NULL)
+ 	    {
+ 	      if (p->value)
+-		_asn1_strcpy (_asn1_identifierMissing, p->value);
++		_asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p->value);
+ 	      else
+ 		_asn1_strcpy (_asn1_identifierMissing, "(null)");
+ 	      return ASN1_IDENTIFIER_NOT_FOUND;
+@@ -968,9 +968,15 @@ _asn1_check_identifier (asn1_node node)
+ 	  if (p2 && (type_field (p2->type) == ASN1_ETYPE_DEFAULT))
+ 	    {
+ 	      _asn1_str_cpy (name2, sizeof (name2), node->name);
+-	      _asn1_str_cat (name2, sizeof (name2), ".");
+-	      _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
+-	      _asn1_strcpy (_asn1_identifierMissing, p2->value);
++	      if (p2->value)
++	        {
++	          _asn1_str_cat (name2, sizeof (name2), ".");
++	          _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
++	          _asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p2->value);
++	        }
++	      else
++		_asn1_strcpy (_asn1_identifierMissing, "(null)");
++
+ 	      p2 = asn1_find_node (node, name2);
+ 	      if (!p2 || (type_field (p2->type) != ASN1_ETYPE_OBJECT_ID) ||
+ 		  !(p2->type & CONST_ASSIGN))
+@@ -990,7 +996,8 @@ _asn1_check_identifier (asn1_node node)
+ 		  _asn1_str_cpy (name2, sizeof (name2), node->name);
+ 		  _asn1_str_cat (name2, sizeof (name2), ".");
+ 		  _asn1_str_cat (name2, sizeof (name2), (char *) p2->value);
+-		  _asn1_strcpy (_asn1_identifierMissing, p2->value);
++		  _asn1_str_cpy (_asn1_identifierMissing, sizeof(_asn1_identifierMissing), (char*)p2->value);
++
+ 		  p2 = asn1_find_node (node, name2);
+ 		  if (!p2 || (type_field (p2->type) != ASN1_ETYPE_OBJECT_ID)
+ 		      || !(p2->type & CONST_ASSIGN))
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.12.bb b/meta/recipes-support/gnutls/libtasn1_4.12.bb
index cec1a9b156..7a7571ad3b 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.12.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            file://0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch \
+           file://CVE-2017-10790.patch \
            "
 
 DEPENDS = "bison-native"
-- 
2.13.0


