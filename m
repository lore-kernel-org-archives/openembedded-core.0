Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E61CA9ECA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23585.1791708097038521589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=abSk/DJK;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so8339845e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708095; x=1792312895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VuLA0mMc5DUSyznsCU4szGXCGr6itUmi9afYjccLrg0=;
        b=abSk/DJK5FrWVHIiYndlgcolpJosm9eCOv9k3BvN4UTcgKR5Ys8l+IpL46tkpC6LfH
         rKCrl9MDxA59KFDbS9lZjsznE6FLrmSCTa+8yqsGt5RXSiGE1NDCexKWRQ/J2viiWJvz
         7F9Dx6/xLgScRQ/vtC0Nh3cNcdZ1NQsU5f9bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708095; x=1792312895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VuLA0mMc5DUSyznsCU4szGXCGr6itUmi9afYjccLrg0=;
        b=XmuKDoLr3vPQv49cEAOmZGss07gJA08Pe0lNGxAhipdp56vNOGrbU7lhSgRfH+FDgX
         utieMIuOn3qNR2cPerEQsyvsdCRTRRhh0bk5xhnBuTOYzRdkW4A0ZyC9ah++7mTH8U/d
         RacsQlMTSc31Vh8PeaRs2FyY/qLXkKuKvHx8+Y13EWv9lsOJr17J7HqUZr6CORb9wxmZ
         kDhO/fesDUfASFSp6yoMcPL4Lc2+VeJatk4rLnrFUfvdy4iB/lex35ojOLNZb5Qf22H9
         Yz1ofAY5Jv+R+uAB42tef82pPpqtGRwMZ5A6VRJ82jmvoeBaP6tIvCvrmmZz6LKNJXhb
         7g1w==
X-Gm-Message-State: AFq9FYIvIyM5bz82TBwnm6XJePMO/I+uG8cRoP96X560znuKhBoOs0qO
	b4UrKSr/HVJxEE6cboG9YHT9qBbC/AyUa0Mq3D1vJr/Ikb9BNbCYJdH+O9H4z2uCW4vuUNYi0Nu
	fU2NEMPE=
X-Gm-Gg: AYBFou3dXnK8P77bBSvnOE6faqic8HkuRrhUD32DZ1ZUqQNUrULfnC03gsAhNgOHJZu
	qpJqj9KafHp9rJLW8kgTkwhY4B4od6/QbwmkYNIWSOtAMqHeGiJRcp/xWGFcf/qMRbnpLly2eIb
	+g9foidNxJt3NQAXZ3LDC+XPuOrH68voH6ngoNBryTcSmTGL7eeQL7qr1w/j5cekfye42lrELe4
	/y9f1dCsXh6mXulIrqtr75rCkf32QhhTyl1Xjlw/eyUh2CIpOgze1r3U70NdsqPHSJYKHEoEPSs
	NS5LL5mbn6gcFTyDXhcaScxs3XMyrOPR0CDssDrNz5+aFhqeB4AzYt6585+WiRYO1LE7iTSA1xy
	v6ZTVAEILSPEx6yNb+ec54+V/N6J+3ITVZJdzR4Pap6quB9Hw7QIbT1R6H/mM2LHKLoc+ae3MJb
	sxobCGGi0kTsRjEwrbjFAc19s/NKSlUaHFMMKciEaP6r8/248d7AO4rC6aB1DMOs+t7filU/2mn
	Vkr6/R0F9xGGL1FNmx6afrzHrlKOMzaT4geKcNt2lGmxm2r9PwTGnzNPR8Uydhtg0iBgOlG3Q==
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id 5b1f17b1804b1-4a196611b9amr40980395e9.32.1791708095116;
        Sun, 11 Oct 2026 01:41:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 53/60] libpcre2: patch CVE-2026-89162
Date: Sun, 11 Oct 2026 10:40:26 +0200
Message-ID: <97f556be4dc13ec70e7b898f44ee7fecdde2e679.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247562

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide it.

[1] https://security-tracker.debian.org/tracker/CVE-2026-89162
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-q7rw-r7qq-2hx6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-89162.patch     | 88 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-89162.patch
new file mode 100644
index 00000000000..efc6c856b98
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
index 70079e0b65b..b81480c8ffb 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-89162.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

