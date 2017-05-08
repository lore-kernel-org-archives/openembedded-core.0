Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5811360111
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:33:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18569937"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2017 09:33:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B32F647C6783
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 09:33:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 8 May 2017 09:33:14 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 18:16:57 +0800
Message-ID: <1494238617-8419-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: B32F647C6783.A9FFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [morty] [PATCH] rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Mon, 08 May 2017 01:33:14 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug

When use bitbake to build a SRPM package, some sections of SRPM can't be displayed normally.
For example:
$ rpm -qpi zlib-1.2.8-r0.src.rpm
warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
Name        : zlib
Version     : 1.2.8
Release     : r0
Architecture: i586
Install Date: (not installed)
Group       : ﺩ
Size        : 633007
License     : Zlib
Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
Source RPM  : (none)
Build Date  : 2017年04月22日 00時38分03秒
Build Host  : force
Relocations : (not relocatable)
Packager    : Poky <poky@yoctoproject.org>
URL         : http://zlib.net/
Summary     : ¨¯
Description :
ﺩ

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 162 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
new file mode 100644
index 0000000..85c48ac
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
@@ -0,0 +1,162 @@
+Subject: [PATCH] Fix the Bug of SRPM String error
+
+Upstream-Status: Backport from rpm 5.4.16
+$ rpm -qpi zlib-1.2.8-r0.src.rpm
+warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962a6: NOKEY
+Name        : zlib
+Version     : 1.2.8
+Release     : r0
+Architecture: i586
+Install Date: (not installed)
+Group       : ﺩ
+Size        : 633007
+License     : Zlib
+Signature   : DSA/SHA1, 2017年04月22日 00時38分03秒, Key ID bc5e0520e64962a6
+Source RPM  : (none)
+Build Date  : 2017年04月22日 00時38分03秒
+Build Host  : force
+Relocations : (not relocatable)
+Packager    : Poky <poky@yoctoproject.org>
+URL         : http://zlib.net/
+Summary     : ¨¯
+Description :
+ﺩ
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ rpmdb/header.c  |  8 ++++----
+ rpmdb/rpmtag.h  |  1 +
+ rpmdb/tagname.c | 61 ++++++++++++++++++++++++++++++++++++++++-----------------
+ 3 files changed, 48 insertions(+), 22 deletions(-)
+
+diff --git a/rpmdb/header.c b/rpmdb/header.c
+index 5d6c6cf..5a80df0 100644
+--- a/rpmdb/header.c
++++ b/rpmdb/header.c
+@@ -32,7 +32,7 @@ GENfree(HeaderIterator)
+ #endif	/* __cplusplus */
+ 
+ #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+-extern void tagTypeValidate(HE_t he)
++extern void tagTypeValidate(HE_t he, unsigned int flags)
+ 	/*@*/;
+ #endif
+ 
+@@ -2281,7 +2281,7 @@ int headerGet(Header h, HE_t he, unsigned int flags)
+ /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+     if (rc)
+-	tagTypeValidate(he);
++        tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+@@ -2304,7 +2304,7 @@ int headerPut(Header h, HE_t he, /*@unused@*/ unsigned int flags)
+ #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+ /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+-    tagTypeValidate(he);
++    tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+@@ -2329,7 +2329,7 @@ int headerMod(Header h, HE_t he, /*@unused@*/ unsigned int flags)
+ #if defined(SUPPORT_IMPLICIT_TAG_DATA_TYPES)
+ /*@-modfilesys@*/
+     /* XXX verify that explicit and implicit types are identical. */
+-    tagTypeValidate(he);
++    tagTypeValidate(he, flags);
+ /*@=modfilesys@*/
+ #endif
+ 
+diff --git a/rpmdb/rpmtag.h b/rpmdb/rpmtag.h
+index ffce678..8f6a2bf 100644
+--- a/rpmdb/rpmtag.h
++++ b/rpmdb/rpmtag.h
+@@ -868,6 +868,7 @@ int headerGet(Header h, HE_t he, unsigned int flags)
+ 	/*@modifies he, internalState @*/;
+ #define	HEADERGET_NOEXTENSION	(1 << 0) /*!< Extension search disabler. */
+ #define	HEADERGET_NOI18NSTRING	(1 << 1) /*!< Return i18n strings as argv. */
++#define HEADERGET_SIGHEADER     (1 << 2) /*!< Override signature tag data. */
+ 
+ /** \ingroup header
+  * Add or append tag container to header.
+diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c
+index cfd1459..374ad77 100644
+--- a/rpmdb/tagname.c
++++ b/rpmdb/tagname.c
+@@ -515,28 +515,53 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, size_t dbiNTags)
+  * Validate that implicit and explicit types are identical.
+  * @param he		tag container
+  */
+-void tagTypeValidate(HE_t he);
+-void tagTypeValidate(HE_t he)
++void tagTypeValidate(HE_t he, unsigned int flags);
++void tagTypeValidate(HE_t he, unsigned int flags)
+ {
+-    /* XXX Re-map RPM_I18NSTRING_TYPE -> RPM_STRING_TYPE */
+-    if (he->t == RPM_I18NSTRING_TYPE)
+-	he->t = RPM_STRING_TYPE;
+-
+-    /* XXX Arbitrary tags are always strings. */
+-    if ((he->tag & 0x40000000)
+-     && (he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE))
++    /* XXX Skip RPMSIGTAG_* validation. */
++    if (flags & HEADERGET_SIGHEADER)
+ 	return;
+ 
+-    /* XXX Make 0x3fffffff disappear for now. Signature? */
+-    if (he->tag == 0x3fffffff && he->t == RPM_BIN_TYPE)
++    /* XXX Arbitrary tags are always STRING or STRING_ARRAY. */
++    if (he->tag & 0x40000000) {
++	if (!(he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE)) {
++	    rpmTagType tagtype = RPM_STRING_TYPE;
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
++	}
+ 	return;
++    }
+ 
+-/* XXX hack around known borkage for now. */
+-if (!(he->tag == 62))
+-if (!(he->tag == 261 || he->tag == 269))
+-if (!(he->tag == 1000 || he->tag == 1004 || he->tag == 1007))
+-if (!(he->tag == 1029 || he->tag == 1086 || he->tag == 1087))
+-if (he->t != (tagType(he->tag) & 0xffff))
+-fprintf(stderr, "==> warning: tag %u type(0x%x) != implicit type(0x%x)\n", (unsigned) he->tag, he->t, tagType(he->tag));
++    switch (he->tag) {
++#if defined(SUPPORT_I18NSTRING_TYPE)
++    case RPMTAG_SUMMARY:
++    case RPMTAG_DESCRIPTION:
++    case RPMTAG_GROUP:
++#endif
++    case RPMTAG_FILESTATES:	/* XXX either CHAR or UINT8 */
++	break;
++    case RPMTAG_PREINPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_POSTINPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_PREUNPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_POSTUNPROG:	/* XXX either STRING or STRING_ARRAY */
++    case RPMTAG_VERIFYSCRIPTPROG:/* XXX either STRING or STRING_ARRAY */
++	if (!(he->t == RPM_STRING_TYPE || he->t == RPM_STRING_ARRAY_TYPE)) {
++	    rpmTagType tagtype = RPM_STRING_TYPE;
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
++	}
++	break;
++    default:
++      {	rpmTagType tagtype = tagType(he->tag);
++	rpmTagType type = (tagtype & 0xffff);
++	if (type && he->t != type) {
++	    rpmlog(RPMLOG_WARNING,
++		_("tag %s(%u) type(0x%x) != expected type(0x%x)\n"),
++		tagName(he->tag), (unsigned) he->tag, he->t, tagtype);
++	}
++      }	break;
++    }
+ }
+ #endif
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 497af8e..2bfe455 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -120,6 +120,7 @@ SRC_URI += " \
 	   file://0001-system.h-query.c-support-nosignature.patch \
 	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
 	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
+           file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
 "
 
 # OE specific changes
-- 
2.7.4




