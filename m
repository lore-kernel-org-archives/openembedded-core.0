Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6381ECD11DD
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:23 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.49392.1710951021192993968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xvr4SqYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1def142ae7bso50463965ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951020; x=1711555820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXVA/Kas/g6x8w966OzTVzjiYcuRQM/h2A3EY717vMA=;
        b=Xvr4SqYGW8PsI1Mlp3+gKiRKzTRooOg9NpIVVHQ/aM5/Rmpx7Cpl+vvH9EcSaVqzxT
         D//8OYD/HluczUrCN8oX/sqHen4FcVsklU2I0aMzOcZBUCuP9se7S1GLHfwmJ10J5MIU
         aBgzuZkBw4ox/P0PmdfNAWrWzTk5Zdw1Om/uarLKw1e23zECk269tiR1FKnlQNZYQZEW
         0YoUySMzFJaoHqNQCM9ogEjSHJ92nU3Bzc4J6aRaexm9bYHvuD25b9ncWD14lwrDKzxQ
         U1nDtB2+pJC71qfDUnERfRIpuwPyIpJZUMe60G+kqlKy30EKLvW2TXmWqgP1MbHF2RPI
         2C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951020; x=1711555820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXVA/Kas/g6x8w966OzTVzjiYcuRQM/h2A3EY717vMA=;
        b=eqUhhzOoo0UOaM7yW8qEGaqE7LDTVBtGT+s1QJpyzk0viDTn9vHFxXiKPRMa18zCyc
         iPfqGBKf5rhcZDdDycBDzLbAAXo/spnsJdLrpyqeS1nzLApHfxLOk83a/McM/Z9CJ8ur
         XGVSa/kZiPG/B506B8lpaSXfq7tcFYgwoZBpl/CfW96/LUM5AquAYOdMSs8XGVTqp4sa
         4qRiPcp12nW7YxN3+cIc4e0wQowcH855d3v0ArNd/2yaYpYL+vH9AIeT1USZTT7DwRk6
         nxd355EIv+5mIN96cY1F2eRcaKjHgLcOIG66KQdizunJthkCgZj3lx9SKYwe61QdTMLl
         WZog==
X-Gm-Message-State: AOJu0Yw6SWjse4BAsQy70ja9fgm0jmBz6OlcmD5AMvCiOhvsZdV+sbPK
	SIxmDDvO+jP3o94gT+jrK7y9g4a4Sot1+Lzb7RMKxuA3yP8otPArbqxf8iGYpm974s7PwYhDCEa
	L3fI=
X-Google-Smtp-Source: AGHT+IGdy1+0vJvnk2HBMmyfZyGTi1cz/PZp6X4DskWO7meLf0U3jZflhDUDblQs26gZQ2m1CDHd6w==
X-Received: by 2002:a17:903:11d2:b0:1dd:a50c:200c with SMTP id q18-20020a17090311d200b001dda50c200cmr21688784plh.50.1710951019626;
        Wed, 20 Mar 2024 09:10:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] expat: fix CVE-2023-52426
Date: Wed, 20 Mar 2024 06:09:40 -1000
Message-Id: <aa20dd9eb68f04a5f1556123ad1b2398de911d93.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197373

From: Meenali Gupta <meenali.gupta@windriver.com>

A flaw was found in Expat (libexpat). If XML_DTD is undefined at compile time, a
recursive XML Entity Expansion condition can be triggered.This issue may lead to
a condition where data is expanded exponentially, which will quickly consume system
resources and cause a denial of service.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-52426
https://github.com/libexpat/libexpat/pull/777

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2023-52426-001.patch      |  35 ++
 .../expat/expat/CVE-2023-52426-002.patch      |  72 +++
 .../expat/expat/CVE-2023-52426-003.patch      |  28 ++
 .../expat/expat/CVE-2023-52426-004.patch      | 429 ++++++++++++++++++
 .../expat/expat/CVE-2023-52426-005.patch      |  34 ++
 .../expat/expat/CVE-2023-52426-006.patch      | 174 +++++++
 .../expat/expat/CVE-2023-52426-007.patch      |  53 +++
 .../expat/expat/CVE-2023-52426-008.patch      |  37 ++
 .../expat/expat/CVE-2023-52426-009.patch      | 354 +++++++++++++++
 .../expat/expat/CVE-2023-52426-010.patch      |  50 ++
 .../expat/expat/CVE-2023-52426-011.patch      |  45 ++
 meta/recipes-core/expat/expat_2.5.0.bb        |  11 +
 12 files changed, 1322 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-003.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-004.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-005.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-006.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-007.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-008.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-009.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-010.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52426-011.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-001.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-001.patch
new file mode 100644
index 0000000000..c38a334540
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-001.patch
@@ -0,0 +1,35 @@
+From cdead241d4f1136c2f38d1b28e95073c59753d30 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 01:40:05 +0200
+Subject: [PATCH] doc/reference.html: Clarify effect of XML_DTD on external
+ entities
+
+Defining XML_DTD emnables support for external parameter(!)
+entities.  External general(!) entities have been supported
+even with XML_DTD undefined.  (Only now with Expat 2.6.0
+defining XML_GE as 0 can take that away.)
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cdead241d4f1136c2f38d1b28e95073c59753d30]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ doc/reference.html | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 8b0d47d..a30e462 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -365,7 +365,7 @@ this is defined, default attribute values from an external DTD subset
+ are reported and attribute value normalization occurs based on the
+ type of attributes defined in the external subset.  Without
+ this, Expat has a smaller memory footprint and can be faster, but will
+-not load external entities or process conditional sections. If defined, makes
++not load external parameter entities or process conditional sections. If defined, makes
+ the functions <code><a 
+ href="#XML_SetBillionLaughsAttackProtectionMaximumAmplification">
+ XML_SetBillionLaughsAttackProtectionMaximumAmplification</a></code> and <code>
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-002.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-002.patch
new file mode 100644
index 0000000000..9aedc3010a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-002.patch
@@ -0,0 +1,72 @@
+From daa89e42c005cc7f4f7af9eee271ae0723d30300 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 00:59:52 +0200
+
+Subject: [PATCH] cmake: Introduce option EXPAT_GE to control macro XML_GE
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/daa89e42c005cc7f4f7af9eee271ae0723d30300]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ CMakeLists.txt       | 9 +++++++++
+ expat_config.h.cmake | 3 +++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2b4c13c..416fe96 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -140,6 +140,8 @@ expat_shy_set(EXPAT_CONTEXT_BYTES 1024 CACHE STRING "Define to specify how much
+ mark_as_advanced(EXPAT_CONTEXT_BYTES)
+ expat_shy_set(EXPAT_DTD ON CACHE BOOL "Define to make parameter entity parsing functionality available")
+ mark_as_advanced(EXPAT_DTD)
++expat_shy_set(EXPAT_GE ON CACHE BOOL "Define to make general entity parsing functionality available")
++mark_as_advanced(EXPAT_GE)
+ expat_shy_set(EXPAT_NS ON CACHE BOOL "Define to make XML Namespaces functionality available")
+ mark_as_advanced(EXPAT_NS)
+ expat_shy_set(EXPAT_WARNINGS_AS_ERRORS OFF CACHE BOOL "Treat all compiler warnings as errors")
+@@ -172,6 +174,11 @@ endif()
+ #
+ # Environment checks
+ #
++if(EXPAT_DTD AND NOT EXPAT_GE)
++    message(SEND_ERROR "Option EXPAT_DTD requires that EXPAT_GE is also enabled.")
++    message(SEND_ERROR "Please either enable option EXPAT_GE (recommended) or disable EXPAT_DTD also.")
++endif()
++
+ if(EXPAT_WITH_LIBBSD)
+     find_library(LIB_BSD NAMES bsd)
+     if(NOT LIB_BSD)
+@@ -274,6 +281,7 @@ endif()
+
+ _expat_copy_bool_int(EXPAT_ATTR_INFO        XML_ATTR_INFO)
+ _expat_copy_bool_int(EXPAT_DTD              XML_DTD)
++_expat_copy_bool_int(EXPAT_GE               XML_GE)
+ _expat_copy_bool_int(EXPAT_LARGE_SIZE       XML_LARGE_SIZE)
+ _expat_copy_bool_int(EXPAT_MIN_SIZE         XML_MIN_SIZE)
+ _expat_copy_bool_int(EXPAT_NS               XML_NS)
+@@ -893,6 +901,7 @@ message(STATUS "    // Advanced options, changes not advised")
+ message(STATUS "    Attributes info .......... ${EXPAT_ATTR_INFO}")
+ message(STATUS "    Context bytes ............ ${EXPAT_CONTEXT_BYTES}")
+ message(STATUS "    DTD support .............. ${EXPAT_DTD}")
++message(STATUS "    General entities ......... ${EXPAT_GE}")
+ message(STATUS "    Large size ............... ${EXPAT_LARGE_SIZE}")
+ message(STATUS "    Minimum size ............. ${EXPAT_MIN_SIZE}")
+ message(STATUS "    Namespace support ........ ${EXPAT_NS}")
+diff --git a/expat_config.h.cmake b/expat_config.h.cmake
+index 78fcb4c..330945e 100644
+--- a/expat_config.h.cmake
++++ b/expat_config.h.cmake
+@@ -103,6 +103,9 @@
+ /* Define to make parameter entity parsing functionality available. */
+ #cmakedefine XML_DTD
+
++/* Define as 1/0 to enable/disable support for general entities. */
++#define XML_GE @XML_GE@
++
+ /* Define to make XML Namespaces functionality available. */
+ #cmakedefine XML_NS
+
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-003.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-003.patch
new file mode 100644
index 0000000000..96a62dcffc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-003.patch
@@ -0,0 +1,28 @@
+From ed87a4793404e91c0cc0c81435fcfcc64a8be9f4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 00:45:23 +0200
+Subject: [PATCH] configure.ac: Define macro XML_GE as 1
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/ed87a4793404e91c0cc0c81435fcfcc64a8be9f4]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d3642de..153bb8e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -295,6 +295,8 @@ AC_SUBST(FILEMAP)
+ dnl Some basic configuration:
+ AC_DEFINE([XML_NS], 1,
+           [Define to make XML Namespaces functionality available.])
++AC_DEFINE([XML_GE], 1,
++          [Define as 1/0 to enable/disable support for general entities.])
+ AC_DEFINE([XML_DTD], 1,
+           [Define to make parameter entity parsing functionality available.])
+ AC_DEFINE([XML_DEV_URANDOM], 1,
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-004.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-004.patch
new file mode 100644
index 0000000000..460113caf7
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-004.patch
@@ -0,0 +1,429 @@
+From 0f075ec8ecb5e43f8fdca5182f8cca4703da0404 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 00:43:22 +0200
+Subject: [PATCH] lib|xmlwf|cmake: Extend scope of billion laughs attack
+ protection
+
+.. from "defined(XML_DTD)" to "defined(XML_DTD) || XML_GE==1".
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0f075ec8ecb5e43f8fdca5182f8cca4703da0404]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ CMakeLists.txt         |  8 ++++-
+ lib/expat.h            |  8 +++--
+ lib/internal.h         |  2 +-
+ lib/libexpat.def.cmake |  4 +--
+ lib/xmlparse.c         | 71 ++++++++++++++++++++++--------------------
+ xmlwf/xmlwf.c          | 18 ++++++-----
+ 6 files changed, 62 insertions(+), 49 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 416fe96..e6939e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -389,7 +389,13 @@ if(EXPAT_SHARED_LIBS)
+             endif()
+         endmacro()
+
+-        _expat_def_file_toggle(EXPAT_DTD _EXPAT_COMMENT_DTD)
++	if(EXPAT_DTD OR EXPAT_GE)
++            set(_EXPAT_DTD_OR_GE TRUE)
++        else()
++            set(_EXPAT_DTD_OR_GE FALSE)
++        endif()
++
++        _expat_def_file_toggle(_EXPAT_DTD_OR_GE _EXPAT_COMMENT_DTD_OR_GE)
+         _expat_def_file_toggle(EXPAT_ATTR_INFO _EXPAT_COMMENT_ATTR_INFO)
+
+         configure_file("${CMAKE_CURRENT_SOURCE_DIR}/lib/libexpat.def.cmake" "${CMAKE_CURRENT_BINARY_DIR}/lib/libexpat.def")
+diff --git a/lib/expat.h b/lib/expat.h
+index 1c83563..33c94af 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -1038,13 +1038,15 @@ typedef struct {
+ XMLPARSEAPI(const XML_Feature *)
+ XML_GetFeatureList(void);
+
+-#ifdef XML_DTD
+-/* Added in Expat 2.4.0. */
++#if defined(XML_DTD) || XML_GE == 1
++/* Added in Expat 2.4.0 for XML_DTD defined and
++ * added in Expat 2.6.0 for XML_GE == 1. */
+ XMLPARSEAPI(XML_Bool)
+ XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+     XML_Parser parser, float maximumAmplificationFactor);
+
+-/* Added in Expat 2.4.0. */
++/* Added in Expat 2.4.0 for XML_DTD defined and
++ * added in Expat 2.6.0 for XML_GE == 1. */
+ XMLPARSEAPI(XML_Bool)
+ XML_SetBillionLaughsAttackProtectionActivationThreshold(
+     XML_Parser parser, unsigned long long activationThresholdBytes);
+diff --git a/lib/internal.h b/lib/internal.h
+index e09f533..1851925 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -154,7 +154,7 @@ extern "C" {
+ void _INTERNAL_trim_to_complete_utf8_characters(const char *from,
+                                                 const char **fromLimRef);
+
+-#if defined(XML_DTD)
++#if defined(XML_DTD) || XML_GE == 1
+ unsigned long long testingAccountingGetCountBytesDirect(XML_Parser parser);
+ unsigned long long testingAccountingGetCountBytesIndirect(XML_Parser parser);
+ const char *unsignedCharToPrintable(unsigned char c);
+diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
+index cf434a2..61a4f00 100644
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -75,5 +75,5 @@ EXPORTS
+   XML_SetHashSalt @67
+ ; internal @68 removed with version 2.3.1
+ ; added with version 2.4.0
+-@_EXPAT_COMMENT_DTD@ XML_SetBillionLaughsAttackProtectionActivationThreshold @69
+-@_EXPAT_COMMENT_DTD@ XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
++@_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionActivationThreshold @69
++@_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b6c2eca..e23441e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -408,7 +408,7 @@ enum XML_Account {
+   XML_ACCOUNT_NONE              /* i.e. do not account, was accounted already */
+ };
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+ typedef unsigned long long XmlBigCount;
+ typedef struct accounting {
+   XmlBigCount countBytesDirect;
+@@ -424,7 +424,7 @@ typedef struct entity_stats {
+   unsigned int maximumDepthSeen;
+   int debugLevel;
+ } ENTITY_STATS;
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+
+ typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const char *start,
+                                          const char *end, const char **endPtr);
+@@ -562,7 +562,7 @@ static XML_Parser parserCreate(const XML_Char *encodingName,
+
+ static void parserInit(XML_Parser parser, const XML_Char *encodingName);
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+ static float accountingGetCurrentAmplification(XML_Parser rootParser);
+ static void accountingReportStats(XML_Parser originParser, const char *epilog);
+ static void accountingOnAbort(XML_Parser originParser);
+@@ -585,7 +585,7 @@ static void entityTrackingOnClose(XML_Parser parser, ENTITY *entity,
+
+ static XML_Parser getRootParserOf(XML_Parser parser,
+                                   unsigned int *outLevelDiff);
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+
+ static unsigned long getDebugLevel(const char *variableName,
+                                    unsigned long defaultDebugLevel);
+@@ -703,7 +703,7 @@ struct XML_ParserStruct {
+   enum XML_ParamEntityParsing m_paramEntityParsing;
+ #endif
+   unsigned long m_hash_secret_salt;
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   ACCOUNTING m_accounting;
+   ENTITY_STATS m_entity_stats;
+ #endif
+@@ -1163,7 +1163,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+ #endif
+   parser->m_hash_secret_salt = 0;
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+   parser->m_accounting.debugLevel = getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
+   parser->m_accounting.maximumAmplificationFactor
+@@ -2522,8 +2522,9 @@ XML_GetFeatureList(void) {
+ #ifdef XML_ATTR_INFO
+       {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
+ #endif
+-#ifdef XML_DTD
+-      /* Added in Expat 2.4.0. */
++#if defined(XML_DTD) || XML_GE == 1
++    /* Added in Expat 2.4.0 for XML_DTD defined and
++     * added in Expat 2.6.0 for XML_GE == 1. */
+       {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT,
+        XML_L("XML_BLAP_MAX_AMP"),
+        (long int)
+@@ -2537,7 +2538,7 @@ XML_GetFeatureList(void) {
+   return features;
+ }
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+ XML_Bool XMLCALL
+ XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+     XML_Parser parser, float maximumAmplificationFactor) {
+@@ -2559,7 +2560,7 @@ XML_SetBillionLaughsAttackProtectionActivationThreshold(
+   parser->m_accounting.activationThresholdBytes = activationThresholdBytes;
+   return XML_TRUE;
+ }
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+
+ /* Initially tag->rawName always points into the parse buffer;
+    for those TAG instances opened while the current parse buffer was
+@@ -2645,13 +2646,13 @@ externalEntityInitProcessor2(XML_Parser parser, const char *start,
+   int tok = XmlContentTok(parser->m_encoding, start, end, &next);
+   switch (tok) {
+   case XML_TOK_BOM:
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, start, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+
+     /* If we are at the end of the buffer, this would cause the next stage,
+        i.e. externalEntityInitProcessor3, to pass control directly to
+@@ -2765,7 +2766,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+   for (;;) {
+     const char *next = s; /* XmlContentTok doesn't always set the last arg */
+     int tok = XmlContentTok(enc, s, end, &next);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     const char *accountAfter
+         = ((tok == XML_TOK_TRAILING_RSQB) || (tok == XML_TOK_TRAILING_CR))
+               ? (haveMore ? s /* i.e. 0 bytes */ : end)
+@@ -2831,14 +2832,14 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
+           enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar);
+       if (ch) {
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+         /* NOTE: We are replacing 4-6 characters original input for 1 character
+          *       so there is no amplification and hence recording without
+          *       protection. */
+         accountingDiffTolerated(parser, tok, (char *)&ch,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+         if (parser->m_characterDataHandler)
+           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);
+         else if (parser->m_defaultHandler)
+@@ -4040,7 +4041,7 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+   for (;;) {
+     const char *next = s; /* in case of XML_TOK_NONE or XML_TOK_PARTIAL */
+     int tok = XmlCdataSectionTok(enc, s, end, &next);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+@@ -4192,7 +4193,7 @@ doIgnoreSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+   *eventPP = s;
+   *startPtr = NULL;
+   tok = XmlIgnoreSectionTok(enc, s, end, &next);
+-#  ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+     accountingOnAbort(parser);
+@@ -4284,7 +4285,7 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+   const XML_Char *storedversion = NULL;
+   int standalone = -1;
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+     accountingOnAbort(parser);
+@@ -4491,7 +4492,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     */
+     else if (tok == XML_TOK_BOM && next == end
+              && ! parser->m_parsingStatus.finalBuffer) {
+-#  ifdef XML_DTD
++#  if defined(XML_DTD) || XML_GE == 1
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                     XML_ACCOUNT_DIRECT)) {
+         accountingOnAbort(parser);
+@@ -4707,11 +4708,13 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+     }
+     role = XmlTokenRole(&parser->m_prologState, tok, s, next, enc);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     switch (role) {
+     case XML_ROLE_INSTANCE_START: // bytes accounted in contentProcessor
+     case XML_ROLE_XML_DECL:       // bytes accounted in processXmlDecl
+-    case XML_ROLE_TEXT_DECL:      // bytes accounted in processXmlDecl
++    #  ifdef XML_DTD
++    case XML_ROLE_TEXT_DECL: // bytes accounted in processXmlDecl
++#  endif
+       break;
+     default:
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+@@ -5648,7 +5651,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+   for (;;) {
+     const char *next = NULL;
+     int tok = XmlPrologTok(parser->m_encoding, s, end, &next);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+       accountingOnAbort(parser);
+@@ -5728,7 +5731,7 @@ processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+       return XML_ERROR_NO_MEMORY;
+   }
+   entity->open = XML_TRUE;
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   entityTrackingOnOpen(parser, entity, __LINE__);
+ #endif
+   entity->processed = 0;
+@@ -5762,9 +5765,9 @@ processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+       entity->processed = (int)(next - textStart);
+       parser->m_processor = internalEntityProcessor;
+     } else {
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+       entityTrackingOnClose(parser, entity, __LINE__);
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+       entity->open = XML_FALSE;
+       parser->m_openInternalEntities = openEntity->next;
+       /* put openEntity back in list of free instances */
+@@ -5813,7 +5816,7 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+     return result;
+   }
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+   entityTrackingOnClose(parser, entity, __LINE__);
+ #endif
+   entity->open = XML_FALSE;
+@@ -5892,7 +5895,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+     const char *next
+         = ptr; /* XmlAttributeValueTok doesn't always set the last arg */
+     int tok = XmlAttributeValueTok(enc, ptr, end, &next);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__, account)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+@@ -5957,14 +5960,14 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
+           enc, ptr + enc->minBytesPerChar, next - enc->minBytesPerChar);
+       if (ch) {
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+         /* NOTE: We are replacing 4-6 characters original input for 1 character
+          *       so there is no amplification and hence recording without
+          *       protection. */
+         accountingDiffTolerated(parser, tok, (char *)&ch,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+         if (! poolAppendChar(pool, ch))
+           return XML_ERROR_NO_MEMORY;
+         break;
+@@ -6042,14 +6045,14 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+         enum XML_Error result;
+         const XML_Char *textEnd = entity->textPtr + entity->textLen;
+         entity->open = XML_TRUE;
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+         entityTrackingOnOpen(parser, entity, __LINE__);
+ #endif
+         result = appendAttributeValue(parser, parser->m_internalEncoding,
+                                       isCdata, (const char *)entity->textPtr,
+                                       (const char *)textEnd, pool,
+                                       XML_ACCOUNT_ENTITY_EXPANSION);
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+         entityTrackingOnClose(parser, entity, __LINE__);
+ #endif
+         entity->open = XML_FALSE;
+@@ -6105,7 +6108,7 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd, &next);
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+       accountingOnAbort(parser);
+@@ -7651,7 +7654,7 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+   return result;
+ }
+
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+
+ static float
+ accountingGetCurrentAmplification(XML_Parser rootParser) {
+@@ -8382,7 +8385,7 @@ unsignedCharToPrintable(unsigned char c) {
+   assert(0); /* never gets here */
+ }
+
+-#endif /* XML_DTD */
++#endif /* defined(XML_DTD) || XML_GE == 1 */
+
+ static unsigned long
+ getDebugLevel(const char *variableName, unsigned long defaultDebugLevel) {
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index 471f2a2..be23f5a 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -1062,9 +1062,10 @@ tmain(int argc, XML_Char **argv) {
+             " (needs a floating point number greater or equal than 1.0)"));
+         exit(XMLWF_EXIT_USAGE_ERROR);
+       }
+-#ifndef XML_DTD
+-      ftprintf(stderr, T("Warning: Given amplification limit ignored") T(
+-                           ", xmlwf has been compiled without DTD support.\n"));
++#if ! defined(XML_DTD) && XML_GE == 0
++      ftprintf(stderr,
++               T("Warning: Given amplification limit ignored")
++                   T(", xmlwf has been compiled without DTD/GE support.\n"));
+ #endif
+       break;
+     }
+@@ -1083,9 +1084,10 @@ tmain(int argc, XML_Char **argv) {
+         exit(XMLWF_EXIT_USAGE_ERROR);
+       }
+       attackThresholdGiven = XML_TRUE;
+-#ifndef XML_DTD
+-      ftprintf(stderr, T("Warning: Given attack threshold ignored") T(
+-                           ", xmlwf has been compiled without DTD support.\n"));
++#if ! defined(XML_DTD) && XML_GE == 0
++      ftprintf(stderr,
++               T("Warning: Given attack threshold ignored")
++                   T(", xmlwf has been compiled without DTD/GE support.\n"));
+ #endif
+       break;
+     }
+@@ -1120,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {
+     }
+
+     if (attackMaximumAmplification != -1.0f) {
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+           parser, attackMaximumAmplification);
+ #endif
+     }
+     if (attackThresholdGiven) {
+-#ifdef XML_DTD
++#if defined(XML_DTD) || XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionActivationThreshold(
+           parser, attackThresholdBytes);
+ #else
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-005.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-005.patch
new file mode 100644
index 0000000000..1e8223fff0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-005.patch
@@ -0,0 +1,34 @@
+From b0975cb73a41869fbecf0fa55afd35b69b64cc50 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 00:47:52 +0200
+Subject: [PATCH] lib: Fail the build if XML_GE is not set to 1 or 0
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/b0975cb73a41869fbecf0fa55afd35b69b64cc50]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e23441e..ac3efe1 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -62,6 +62,14 @@
+
+ #include <expat_config.h>
+
++#if ! defined(XML_GE) || (1 - XML_GE - 1 == 2) || (XML_GE < 0) || (XML_GE > 1)
++#  error XML_GE (for general entities) must be defined, non-empty, either 1 or 0 (0 to disable, 1 to enable; 1 is a common default)
++#endif
++
++#if defined(XML_DTD) && XML_GE == 0
++#  error Either undefine XML_DTD or define XML_GE to 1.
++#endif
++
+ #if ! defined(_GNU_SOURCE)
+ #  define _GNU_SOURCE 1 /* syscall prototype */
+ #endif
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-006.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-006.patch
new file mode 100644
index 0000000000..d1ab52fa32
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-006.patch
@@ -0,0 +1,174 @@
+From 2b127c20b220b673cf52c6be8bef725bf04cbeaf Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 18:32:11 +0200
+Subject: [PATCH] lib: Make XML_GE==0 use self-references as entity replacement
+  text
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2b127c20b220b673cf52c6be8bef725bf04cbeaf]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 79 +++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 71 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ac3efe1..c479174 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -504,9 +504,13 @@ static enum XML_Error appendAttributeValue(XML_Parser parser, const ENCODING *,
+ static ATTRIBUTE_ID *getAttributeId(XML_Parser parser, const ENCODING *enc,
+                                     const char *start, const char *end);
+ static int setElementTypePrefix(XML_Parser parser, ELEMENT_TYPE *);
++#if XML_GE == 1
+ static enum XML_Error storeEntityValue(XML_Parser parser, const ENCODING *enc,
+                                        const char *start, const char *end,
+                                        enum XML_Account account);
++#else
++static enum XML_Error storeSelfEntityValue(XML_Parser parser, ENTITY *entity);
++#endif
+ static int reportProcessingInstruction(XML_Parser parser, const ENCODING *enc,
+                                        const char *start, const char *end);
+ static int reportComment(XML_Parser parser, const ENCODING *enc,
+@@ -5040,6 +5044,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     case XML_ROLE_ENTITY_VALUE:
+       if (dtd->keepProcessing) {
++#if defined(XML_DTD) || XML_GE == 1
++        // This will store the given replacement text in
++        // parser->m_declEntity->textPtr.
+         enum XML_Error result
+             = storeEntityValue(parser, enc, s + enc->minBytesPerChar,
+                                next - enc->minBytesPerChar, XML_ACCOUNT_NONE);
+@@ -5060,6 +5067,25 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           poolDiscard(&dtd->entityValuePool);
+         if (result != XML_ERROR_NONE)
+           return result;
++#else
++        // This will store "&amp;entity123;" in parser->m_declEntity->textPtr
++        // to end up as "&entity123;" in the handler.
++        if (parser->m_declEntity != NULL) {
++          const enum XML_Error result
++              = storeSelfEntityValue(parser, parser->m_declEntity);
++          if (result != XML_ERROR_NONE)
++            return result;
++
++          if (parser->m_entityDeclHandler) {
++            *eventEndPP = s;
++            parser->m_entityDeclHandler(
++                parser->m_handlerArg, parser->m_declEntity->name,
++                parser->m_declEntity->is_param, parser->m_declEntity->textPtr,
++                parser->m_declEntity->textLen, parser->m_curBase, 0, 0, 0);
++            handleDefault = XML_FALSE;
++          }
++        }
++#endif
+       }
+       break;
+     case XML_ROLE_DOCTYPE_SYSTEM_ID:
+@@ -5102,6 +5128,16 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #endif /* XML_DTD */
+       /* fall through */
+     case XML_ROLE_ENTITY_SYSTEM_ID:
++#if XML_GE == 0
++      // This will store "&amp;entity123;" in entity->textPtr
++      // to end up as "&entity123;" in the handler.
++      if (parser->m_declEntity != NULL) {
++        const enum XML_Error result
++            = storeSelfEntityValue(parser, parser->m_declEntity);
++        if (result != XML_ERROR_NONE)
++          return result;
++      }
++#endif
+       if (dtd->keepProcessing && parser->m_declEntity) {
+         parser->m_declEntity->systemId
+             = poolStoreString(&dtd->pool, enc, s + enc->minBytesPerChar,
+@@ -6090,6 +6126,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+   /* not reached */
+ }
+
++#if XML_GE == 1
+ static enum XML_Error
+ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+                  const char *entityTextPtr, const char *entityTextEnd,
+@@ -6097,12 +6134,12 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+   STRING_POOL *pool = &(dtd->entityValuePool);
+   enum XML_Error result = XML_ERROR_NONE;
+-#ifdef XML_DTD
++#  ifdef XML_DTD
+   int oldInEntityValue = parser->m_prologState.inEntityValue;
+   parser->m_prologState.inEntityValue = 1;
+-#else
++#  else
+   UNUSED_P(account);
+-#endif /* XML_DTD */
++#  endif /* XML_DTD */
+   /* never return Null for the value argument in EntityDeclHandler,
+      since this would indicate an external entity; therefore we
+      have to make sure that entityValuePool.start is not null */
+@@ -6116,18 +6153,18 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd, &next);
+
+-#if defined(XML_DTD) || XML_GE == 1
++#  if defined(XML_DTD) || XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+       accountingOnAbort(parser);
+       result = XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       goto endEntityValue;
+     }
+-#endif
++#  endif
+
+     switch (tok) {
+     case XML_TOK_PARAM_ENTITY_REF:
+-#ifdef XML_DTD
++#  ifdef XML_DTD
+       if (parser->m_isParamEntity || enc != parser->m_encoding) {
+         const XML_Char *name;
+         ENTITY *entity;
+@@ -6270,12 +6307,38 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+     entityTextPtr = next;
+   }
+ endEntityValue:
+-#ifdef XML_DTD
++#  ifdef XML_DTD
+   parser->m_prologState.inEntityValue = oldInEntityValue;
+-#endif /* XML_DTD */
++#  endif /* XML_DTD */
+   return result;
+ }
+
++#else /* XML_GE == 0 */
++
++static enum XML_Error
++storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
++  // This will store "&amp;entity123;" in entity->textPtr
++  // to end up as "&entity123;" in the handler.
++  const char *const entity_start = "&amp;";
++  const char *const entity_end = ";";
++
++  STRING_POOL *const pool = &(parser->m_dtd->entityValuePool);
++  if (! poolAppendString(pool, entity_start)
++      || ! poolAppendString(pool, entity->name)
++      || ! poolAppendString(pool, entity_end)) {
++    poolDiscard(pool);
++    return XML_ERROR_NO_MEMORY;
++  }
++
++  entity->textPtr = poolStart(pool);
++  entity->textLen = (int)(poolLength(pool));
++  poolFinish(pool);
++
++  return XML_ERROR_NONE;
++}
++
++#endif /* XML_GE == 0 */
++
+ static void FASTCALL
+ normalizeLines(XML_Char *s) {
+   XML_Char *p;
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-007.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-007.patch
new file mode 100644
index 0000000000..a141bbf915
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-007.patch
@@ -0,0 +1,53 @@
+From d3f7bbd37bef2565d64f31b549e197a3a414574e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 01:39:39 +0200
+Subject: [PATCH] doc/reference.html: Document build time macro XML_GE
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d3f7bbd37bef2565d64f31b549e197a3a414574e]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ doc/reference.html | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 8b0d47d..74ba012 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -359,6 +359,33 @@ and the definition of character types in the case of
+ <code>XML_UNICODE_WCHAR_T</code>.  The symbols are:</p>
+
+ <dl class="cpp-symbols">
++<dt><a name="XML_GE">XML_GE</a></dt>
++<dd>
++Added in Expat 2.6.0.
++Include support for
++<a href="https://www.w3.org/TR/2006/REC-xml-20060816/#sec-physical-struct">general entities</a>
++(syntax <code>&amp;e1;</code> to reference and
++syntax <code>&lt;!ENTITY e1 'value1'&gt;</code> (an internal general entity) or
++<code>&lt;!ENTITY e2 SYSTEM 'file2'&gt;</code> (an external general entity) to declare).
++With <code>XML_GE</code> enabled, general entities will be replaced by their declared replacement text;
++for this to work for <em>external</em> general entities, in addition an
++<code><a href="#XML_SetExternalEntityRefHandler">XML_ExternalEntityRefHandler</a></code> must be set using
++<code><a href="#XML_SetExternalEntityRefHandler">XML_SetExternalEntityRefHandler</a></code>.
++Also, enabling <code>XML_GE</code> makes
++the functions <code><a href="#XML_SetBillionLaughsAttackProtectionMaximumAmplification">
++XML_SetBillionLaughsAttackProtectionMaximumAmplification</a></code> and <code>
++<a href="#XML_SetBillionLaughsAttackProtectionActivationThreshold">
++XML_SetBillionLaughsAttackProtectionActivationThreshold</a></code> available.
++<br/>
++With <code>XML_GE</code> disabled, Expat has a smaller memory footprint and can be faster, but will
++not load external general entities and will replace all general entities
++(except the <a href="https://www.w3.org/TR/2006/REC-xml-20060816/#sec-predefined-ent">predefined five</a>:
++<code>amp</code>, <code>apos</code>, <code>gt</code>, <code>lt</code>, <code>quot</code>)
++with a self-reference:
++for example, referencing an entity <code>e1</code> via <code>&amp;e1;</code> will be replaced
++by text <code>&amp;e1;</code>.
++</dd>
++
+ <dt>XML_DTD</dt>
+ <dd>Include support for using and reporting DTD-based content.  If
+ this is defined, default attribute values from an external DTD subset
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-008.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-008.patch
new file mode 100644
index 0000000000..d07c62ccf0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-008.patch
@@ -0,0 +1,37 @@
+From 2848dc4e7067de503934b388717e7a3d8d0c5bca Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 27 Oct 2023 18:45:50 +0200
+Subject: [PATCH] Simplify "! defined(XML_DTD) && XML_GE == 0" to "XML_GE == 0"
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2848dc4e7067de503934b388717e7a3d8d0c5bca]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ xmlwf/xmlwf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index be23f5a..04ca759 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -1062,7 +1062,7 @@ tmain(int argc, XML_Char **argv) {
+             " (needs a floating point number greater or equal than 1.0)"));
+         exit(XMLWF_EXIT_USAGE_ERROR);
+       }
+-#if ! defined(XML_DTD) && XML_GE == 0
++#if XML_GE == 0
+       ftprintf(stderr,
+                T("Warning: Given amplification limit ignored")
+                    T(", xmlwf has been compiled without DTD/GE support.\n"));
+@@ -1084,7 +1084,7 @@ tmain(int argc, XML_Char **argv) {
+         exit(XMLWF_EXIT_USAGE_ERROR);
+       }
+       attackThresholdGiven = XML_TRUE;
+-#if ! defined(XML_DTD) && XML_GE == 0
++#if XML_GE == 0
+       ftprintf(stderr,
+                T("Warning: Given attack threshold ignored")
+                    T(", xmlwf has been compiled without DTD/GE support.\n"));
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-009.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-009.patch
new file mode 100644
index 0000000000..99460249c0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-009.patch
@@ -0,0 +1,354 @@
+From caa27198637683b15d810737bb8a6a81af19bfa5 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 27 Oct 2023 18:47:37 +0200
+Subject: [PATCH] Simplify "defined(XML_DTD) || XML_GE == 1" to "XML_GE == 1"
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/caa27198637683b15d810737bb8a6a81af19bfa5]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/expat.h    |  2 +-
+ lib/internal.h |  2 +-
+ lib/xmlparse.c | 66 +++++++++++++++++++++++++-------------------------
+ xmlwf/xmlwf.c  |  4 +--
+ 4 files changed, 37 insertions(+), 37 deletions(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index 33c94af..fa2eb45 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -1038,7 +1038,7 @@ typedef struct {
+ XMLPARSEAPI(const XML_Feature *)
+ XML_GetFeatureList(void);
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+ /* Added in Expat 2.4.0 for XML_DTD defined and
+  * added in Expat 2.6.0 for XML_GE == 1. */
+ XMLPARSEAPI(XML_Bool)
+diff --git a/lib/internal.h b/lib/internal.h
+index 1851925..03c8fde 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -154,7 +154,7 @@ extern "C" {
+ void _INTERNAL_trim_to_complete_utf8_characters(const char *from,
+                                                 const char **fromLimRef);
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+ unsigned long long testingAccountingGetCountBytesDirect(XML_Parser parser);
+ unsigned long long testingAccountingGetCountBytesIndirect(XML_Parser parser);
+ const char *unsignedCharToPrintable(unsigned char c);
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c479174..2d8f4c0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -416,7 +416,7 @@ enum XML_Account {
+   XML_ACCOUNT_NONE              /* i.e. do not account, was accounted already */
+ };
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+ typedef unsigned long long XmlBigCount;
+ typedef struct accounting {
+   XmlBigCount countBytesDirect;
+@@ -432,7 +432,7 @@ typedef struct entity_stats {
+   unsigned int maximumDepthSeen;
+   int debugLevel;
+ } ENTITY_STATS;
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+
+ typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const char *start,
+                                          const char *end, const char **endPtr);
+@@ -574,7 +574,7 @@ static XML_Parser parserCreate(const XML_Char *encodingName,
+
+ static void parserInit(XML_Parser parser, const XML_Char *encodingName);
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+ static float accountingGetCurrentAmplification(XML_Parser rootParser);
+ static void accountingReportStats(XML_Parser originParser, const char *epilog);
+ static void accountingOnAbort(XML_Parser originParser);
+@@ -597,7 +597,7 @@ static void entityTrackingOnClose(XML_Parser parser, ENTITY *entity,
+
+ static XML_Parser getRootParserOf(XML_Parser parser,
+                                   unsigned int *outLevelDiff);
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+
+ static unsigned long getDebugLevel(const char *variableName,
+                                    unsigned long defaultDebugLevel);
+@@ -715,7 +715,7 @@ struct XML_ParserStruct {
+   enum XML_ParamEntityParsing m_paramEntityParsing;
+ #endif
+   unsigned long m_hash_secret_salt;
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+   ACCOUNTING m_accounting;
+   ENTITY_STATS m_entity_stats;
+ #endif
+@@ -1175,7 +1175,7 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+ #endif
+   parser->m_hash_secret_salt = 0;
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+   parser->m_accounting.debugLevel = getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
+   parser->m_accounting.maximumAmplificationFactor
+@@ -2534,7 +2534,7 @@ XML_GetFeatureList(void) {
+ #ifdef XML_ATTR_INFO
+       {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
+ #endif
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     /* Added in Expat 2.4.0 for XML_DTD defined and
+      * added in Expat 2.6.0 for XML_GE == 1. */
+       {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT,
+@@ -2550,7 +2550,7 @@ XML_GetFeatureList(void) {
+   return features;
+ }
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+ XML_Bool XMLCALL
+ XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+     XML_Parser parser, float maximumAmplificationFactor) {
+@@ -2572,7 +2572,7 @@ XML_SetBillionLaughsAttackProtectionActivationThreshold(
+   parser->m_accounting.activationThresholdBytes = activationThresholdBytes;
+   return XML_TRUE;
+ }
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+
+ /* Initially tag->rawName always points into the parse buffer;
+    for those TAG instances opened while the current parse buffer was
+@@ -2658,13 +2658,13 @@ externalEntityInitProcessor2(XML_Parser parser, const char *start,
+   int tok = XmlContentTok(parser->m_encoding, start, end, &next);
+   switch (tok) {
+   case XML_TOK_BOM:
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, start, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+     }
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+
+     /* If we are at the end of the buffer, this would cause the next stage,
+        i.e. externalEntityInitProcessor3, to pass control directly to
+@@ -2778,7 +2778,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+   for (;;) {
+     const char *next = s; /* XmlContentTok doesn't always set the last arg */
+     int tok = XmlContentTok(enc, s, end, &next);
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     const char *accountAfter
+         = ((tok == XML_TOK_TRAILING_RSQB) || (tok == XML_TOK_TRAILING_CR))
+               ? (haveMore ? s /* i.e. 0 bytes */ : end)
+@@ -2844,14 +2844,14 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
+           enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar);
+       if (ch) {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+         /* NOTE: We are replacing 4-6 characters original input for 1 character
+          *       so there is no amplification and hence recording without
+          *       protection. */
+         accountingDiffTolerated(parser, tok, (char *)&ch,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+         if (parser->m_characterDataHandler)
+           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);
+         else if (parser->m_defaultHandler)
+@@ -4053,7 +4053,7 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+   for (;;) {
+     const char *next = s; /* in case of XML_TOK_NONE or XML_TOK_PARTIAL */
+     int tok = XmlCdataSectionTok(enc, s, end, &next);
+-#if defined(XML_DTD) || XML_GE == 1
++#  if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__, account)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+@@ -4205,7 +4205,7 @@ doIgnoreSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+   *eventPP = s;
+   *startPtr = NULL;
+   tok = XmlIgnoreSectionTok(enc, s, end, &next);
+-#if defined(XML_DTD) || XML_GE == 1
++#  if XML_GE == 1
+   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+     accountingOnAbort(parser);
+@@ -4297,7 +4297,7 @@ processXmlDecl(XML_Parser parser, int isGeneralTextEntity, const char *s,
+   const XML_Char *storedversion = NULL;
+   int standalone = -1;
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next, __LINE__,
+                                 XML_ACCOUNT_DIRECT)) {
+     accountingOnAbort(parser);
+@@ -4504,7 +4504,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     */
+     else if (tok == XML_TOK_BOM && next == end
+              && ! parser->m_parsingStatus.finalBuffer) {
+-#  if defined(XML_DTD) || XML_GE == 1
++#  if XML_GE == 1
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                     XML_ACCOUNT_DIRECT)) {
+         accountingOnAbort(parser);
+@@ -4720,7 +4720,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       }
+     }
+     role = XmlTokenRole(&parser->m_prologState, tok, s, next, enc);
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     switch (role) {
+     case XML_ROLE_INSTANCE_START: // bytes accounted in contentProcessor
+     case XML_ROLE_XML_DECL:       // bytes accounted in processXmlDecl
+@@ -5044,7 +5044,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       break;
+     case XML_ROLE_ENTITY_VALUE:
+       if (dtd->keepProcessing) {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+         // This will store the given replacement text in
+         // parser->m_declEntity->textPtr.
+         enum XML_Error result
+@@ -5695,7 +5695,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+   for (;;) {
+     const char *next = NULL;
+     int tok = XmlPrologTok(parser->m_encoding, s, end, &next);
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                   XML_ACCOUNT_DIRECT)) {
+       accountingOnAbort(parser);
+@@ -5775,7 +5775,7 @@ processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+       return XML_ERROR_NO_MEMORY;
+   }
+   entity->open = XML_TRUE;
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+   entityTrackingOnOpen(parser, entity, __LINE__);
+ #endif
+   entity->processed = 0;
+@@ -5809,9 +5809,9 @@ processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+       entity->processed = (int)(next - textStart);
+       parser->m_processor = internalEntityProcessor;
+     } else {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+       entityTrackingOnClose(parser, entity, __LINE__);
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+       entity->open = XML_FALSE;
+       parser->m_openInternalEntities = openEntity->next;
+       /* put openEntity back in list of free instances */
+@@ -5860,7 +5860,7 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+     return result;
+   }
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+   entityTrackingOnClose(parser, entity, __LINE__);
+ #endif
+   entity->open = XML_FALSE;
+@@ -5939,7 +5939,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+     const char *next
+         = ptr; /* XmlAttributeValueTok doesn't always set the last arg */
+     int tok = XmlAttributeValueTok(enc, ptr, end, &next);
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__, account)) {
+       accountingOnAbort(parser);
+       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+@@ -6004,14 +6004,14 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
+           enc, ptr + enc->minBytesPerChar, next - enc->minBytesPerChar);
+       if (ch) {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+         /* NOTE: We are replacing 4-6 characters original input for 1 character
+          *       so there is no amplification and hence recording without
+          *       protection. */
+         accountingDiffTolerated(parser, tok, (char *)&ch,
+                                 ((char *)&ch) + sizeof(XML_Char), __LINE__,
+                                 XML_ACCOUNT_ENTITY_EXPANSION);
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+         if (! poolAppendChar(pool, ch))
+           return XML_ERROR_NO_MEMORY;
+         break;
+@@ -6089,14 +6089,14 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+         enum XML_Error result;
+         const XML_Char *textEnd = entity->textPtr + entity->textLen;
+         entity->open = XML_TRUE;
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+         entityTrackingOnOpen(parser, entity, __LINE__);
+ #endif
+         result = appendAttributeValue(parser, parser->m_internalEncoding,
+                                       isCdata, (const char *)entity->textPtr,
+                                       (const char *)textEnd, pool,
+                                       XML_ACCOUNT_ENTITY_EXPANSION);
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+         entityTrackingOnClose(parser, entity, __LINE__);
+ #endif
+         entity->open = XML_FALSE;
+@@ -6153,7 +6153,7 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd, &next);
+
+-#  if defined(XML_DTD) || XML_GE == 1
++#  if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+       accountingOnAbort(parser);
+@@ -7725,7 +7725,7 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+   return result;
+ }
+
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+
+ static float
+ accountingGetCurrentAmplification(XML_Parser rootParser) {
+@@ -8456,7 +8456,7 @@ unsignedCharToPrintable(unsigned char c) {
+   assert(0); /* never gets here */
+ }
+
+-#endif /* defined(XML_DTD) || XML_GE == 1 */
++#endif /* XML_GE == 1 */
+
+ static unsigned long
+ getDebugLevel(const char *variableName, unsigned long defaultDebugLevel) {
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index 04ca759..dd023a9 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -1122,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {
+     }
+
+     if (attackMaximumAmplification != -1.0f) {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionMaximumAmplification(
+           parser, attackMaximumAmplification);
+ #endif
+     }
+     if (attackThresholdGiven) {
+-#if defined(XML_DTD) || XML_GE == 1
++#if XML_GE == 1
+       XML_SetBillionLaughsAttackProtectionActivationThreshold(
+           parser, attackThresholdBytes);
+ #else
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-010.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-010.patch
new file mode 100644
index 0000000000..4b5c5cb2e1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-010.patch
@@ -0,0 +1,50 @@
+From 55fecd6aa4af4a540812b81234679cd6b5714f1b Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 1 Nov 2023 18:24:55 +0100
+Subject: [PATCH] Drop redundant "XML_GE == 1" guards
+
+These are redundant because further out there is a guard
+for "XML_GE == 1" already.  In the visual world, the pattern
+is this:
+
+> #if XML_GE == 1
+> [..]
+> #  if XML_GE == 1
+> [..]
+> #  endif
+> [..]
+> #endif
+
+Spotted by Snild Dolkow, thanks!
+
+Co-authored-by: Snild Dolkow <snild@sony.com>
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/55fecd6aa4af4a540812b81234679cd6b5714f1b]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2d8f4c0..82a8006 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6153,14 +6153,12 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd, &next);
+
+-#  if XML_GE == 1
+     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next, __LINE__,
+                                   account)) {
+       accountingOnAbort(parser);
+       result = XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
+       goto endEntityValue;
+     }
+-#  endif
+
+     switch (tok) {
+     case XML_TOK_PARAM_ENTITY_REF:
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426-011.patch b/meta/recipes-core/expat/expat/CVE-2023-52426-011.patch
new file mode 100644
index 0000000000..d1b0be2aff
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52426-011.patch
@@ -0,0 +1,45 @@
+From 8a6c61de4a425977e357cafd8667a0d7771ce292 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 26 Oct 2023 01:29:03 +0200
+Subject: [PATCH] lib: Add XML_GE to XML_GetFeatureList and XML_FeatureEnum
+ Co-authored-by: Snild Dolkow <snild@sony.com>
+
+CVE: CVE-2023-52426
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8a6c61de4a425977e357cafd8667a0d7771ce292]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/expat.h    | 4 +++-
+ lib/xmlparse.c | 2 ++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index fa2eb45..9e64174 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -1025,7 +1025,9 @@ enum XML_FeatureEnum {
+   XML_FEATURE_ATTR_INFO,
+   /* Added in Expat 2.4.0. */
+   XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT,
+-  XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT
++  XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT,
++  /* Added in Expat 2.6.0. */
++  XML_FEATURE_GE
+   /* Additional features must be added to the end of this enum. */
+ };
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 82a8006..0627d6c 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2544,6 +2544,8 @@ XML_GetFeatureList(void) {
+       {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT,
+        XML_L("XML_BLAP_ACT_THRES"),
+        EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT},
++      /* Added in Expat 2.6.0. */
++    {XML_FEATURE_GE, XML_L("XML_GE"), 0},
+ #endif
+       {XML_FEATURE_END, NULL, 0}};
+
+--
+2.40.0
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index eb7ce1436e..31e989cfe2 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -11,6 +11,17 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2024-28757.patch \
+	   file://CVE-2023-52426-001.patch \
+	   file://CVE-2023-52426-002.patch \
+	   file://CVE-2023-52426-003.patch \
+	   file://CVE-2023-52426-004.patch \
+	   file://CVE-2023-52426-005.patch \
+	   file://CVE-2023-52426-006.patch \
+	   file://CVE-2023-52426-007.patch \
+	   file://CVE-2023-52426-008.patch \
+	   file://CVE-2023-52426-009.patch \
+	   file://CVE-2023-52426-010.patch \
+	   file://CVE-2023-52426-011.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


