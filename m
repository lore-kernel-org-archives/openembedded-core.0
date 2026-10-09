Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA23CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:46:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2854.1791571593026564658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Bv25Ommj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202610091846294429a7178900020752-bl0wq9@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610091846294429a7178900020752
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BkDSl7rQNBhX5HCeEMas50Fvhbb8+0lmvtRcxGaO+ZU=;
 b=Bv25OmmjQPf3m8as3Lq8eEQBtE7Uqegd5QwRebBXTcd9S1H1wM16/yiZygQPSLc8umkFbB
 +J5iy4Zt519VE6OEQd1Gi5/FdpVM800dflENL8pCqz046fqD2K0lo1EhFolXgrpfmomo6GiU
 QLezskFNEV1qq3GaDogO/hWeOTCn3WChrq2e6ZPHN8SE22gVVDA3renIuexDpVs7/aOER9iA
 YfXyAcYd6NDDj0usFALuBj8FB63RAgl439t29u4zIt6eTVBkCg5Hqv5f2J6GPf6bvthTzg/m
 qqHAkP9e2Dtl7zehQHlxjVA7h9rlM6iA5ynNJYMJP7QYcnmxvoeVFMLQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/8] libpcre2: patch CVE-2026-89162
Date: Fri,  9 Oct 2026 20:45:41 +0200
Message-ID: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247476

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89162
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-q7rw-r7qq-2hx6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-89162.patch     | 88 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch
new file mode 100644
index 0000000000..efc6c856b9
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch
@@ -0,0 +1,88 @@
+From edc111a6831591f68b5355a08cc9df8be8f35304 Mon Sep 17 00:00:00 2001
+From: Nicholas Wilson <nicholas@nicholaswilson.me.uk>
+Date: Sat, 25 Oct 2025 10:50:27 +0100
+Subject: [PATCH] Write padding values to ensure pcre2_serialize_encode()
+ outputs defined values (#826)
+
+Fixes low-severity valgrind error reported in GHSA-q7rw-r7qq-2hx6.
+
+CVE: CVE-2026-89162
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/edc111a6831591f68b5355a08cc9df8be8f35304]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_compile_class.c | 17 +++++++----------
+ src/pcre2test_inc.h       | 25 +++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/src/pcre2_compile_class.c b/src/pcre2_compile_class.c
+index 9a1fc022..55b641c1 100644
+--- a/src/pcre2_compile_class.c
++++ b/src/pcre2_compile_class.c
+@@ -1802,17 +1802,14 @@ if ((xclass_props & XCLASS_REQUIRED) != 0)
+       PUT(code, 0, (uint32_t)(char_lists_size >> 1));
+       code += LINK_SIZE;
+ 
+-#if defined PCRE2_DEBUG || defined SUPPORT_VALGRIND
++      /* If we added padding to align the list, initialize the bytes to
++      defined values, so the library is valgrind-clean. It could also
++      be a security concern for clients calling into PCRE2 via bindings
++      from a memory-safe language, if pcre2_serialize_encode() exposes
++      uninitialized memory that may contain sensitive information. */
++
+       if ((char_lists_size & 0x2) != 0)
+-        {
+-        /* In debug the unused 16 bit value is set
+-        to a fixed value and marked unused. */
+-        ((uint16_t*)data)[-1] = 0x5555;
+-#ifdef SUPPORT_VALGRIND
+-        VALGRIND_MAKE_MEM_NOACCESS(data - 2, 2);
+-#endif
+-        }
+-#endif
++        ((uint16_t*)data)[-1] = 0xdead;
+ 
+       cb->char_lists_size =
+         CLIST_ALIGN_TO(char_lists_size, sizeof(uint32_t));
+diff --git a/src/pcre2test_inc.h b/src/pcre2test_inc.h
+index 8124e9ca..c4707417 100644
+--- a/src/pcre2test_inc.h
++++ b/src/pcre2test_inc.h
+@@ -2019,6 +2019,9 @@ uint32_t use_forbid_utf = forbid_utf;
+ PCRE2_SIZE patlen, full_patlen;
+ PCRE2_SIZE valgrind_access_length;
+ PCRE2_SIZE erroroffset;
++int32_t serialize_rc;
++uint8_t *serialized_bytes;
++PCRE2_SIZE serialized_size;
+ 
+ /* The perltest.sh script supports only / as a delimiter. */
+ 
+@@ -2966,6 +2969,28 @@ if ((pat_patctl.control2 & CTL2_NL_SET) != 0)
+ rc = show_pattern_info();
+ if (rc != PR_OK) return rc;
+ 
++/* Verify that the compiled structure can be serialized without generating
++memory errors. */
++
++serialize_rc = pcre2_serialize_encode((const pcre2_code **)&compiled_code, 1,
++  &serialized_bytes, &serialized_size, general_context);
++if (serialize_rc != 1)
++  {
++  cfprintf(clr_test_error, outfile, "** pcre2_serialize_encode() returned %d instead of 1\n",
++    serialize_rc);
++  return PR_ABEND;
++  }
++
++#if defined SUPPORT_VALGRIND
++if (VALGRIND_CHECK_MEM_IS_DEFINED(serialized_bytes, serialized_size) != 0)
++  {
++  cfprintf(clr_test_error, outfile, "** pcre2_serialize_encode() returned undefined data\n");
++  return PR_ABEND;
++  }
++#endif
++
++pcre2_serialize_free(serialized_bytes);
++
+ /* The "push" control requests that the compiled pattern be remembered on a
+ stack. This is mainly for testing the serialization functionality. */
+ 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 70079e0b65..b81480c8ff 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-89162.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

