Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF08C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:27 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1696.1789682899574561638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PbJNVM/q;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1337085e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682898; x=1790287698; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3Vug3aByeqStDE8G3mfaKXON3fnPDqV2t/hPBa+3bM=;
        b=PbJNVM/qIw5MmnBn/DEHCYE9rQADYQPdsa66XHAar7K3gPNzz4Vdc2+gaFut0z27Ii
         o256TRb5BBPBH8XkELBJMgs6WIWF/o38hdePbDL7+7ZUX1WwrsoNZRKyIVv5V406LzyV
         LrqsleZjRGbtyjz3gr1SfnFN+/4oKWnjjrQW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682898; x=1790287698;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3Vug3aByeqStDE8G3mfaKXON3fnPDqV2t/hPBa+3bM=;
        b=nBAMhhZFECht/r+uTrjyRO+59SLPZN+umBT5Epa+ZSMPCsd5S67SY1UxDq7z8+pfig
         0d4oDF04qysrS4fsWC3M6/Ile6KW7af4pwqscN6+xKvSxOygmG2/xvH4L+YWfWQARnWK
         5lLYyLH4nV6DtZSweaGjU2RR1mh4VLCbNpXegh8aQ7oGBb3RM1nCSUdySTsUExMNz628
         z+Zcd9v7DeivPuJp8EOLL37Dx17UiW3UlPAlco+NWMa/FCPHcAPDR38o0ku1r1vK8yOU
         y2bA7DA/W2TuDKsViQ7tjNyayVq8tDYT9frmaqF/eZkIFCyB6jsVDlVl4nuxmF1a58Gh
         z98A==
X-Gm-Message-State: AFuF++mcjufskfCTBKgPHo3WAr5Ugw+mRc2ZqgxIGq9sWghiE3PfsLZB
	hh6gX2caSNM0DR8H2G45MGOkgdQs9xnBDcWg+gtjwlOOI0v38HiEnf5cCvRHpbguySxj2rQptGY
	NShBXJss=
X-Gm-Gg: AYBFou2Zd3+BcXyEzCRXEdYIwVFvCt2cRxbRwWQZiTwGbMLAUMyUGFXJfIGKqgsR0ha
	EAMx36dg+i6WKoLLs0qt0nc7yz5qFEpw0Y7oqH8RojbFJ5BVOrohYQeTSADACHvQ9dzcjIGuKo5
	XIbGx5ZmJA70U1jgR8mNlC94+tKPTsMcMsRp6HkRuV5Gj2CofDJsVeebQykZnUDtOT67I0Qm0W2
	OESbRGGCgxMLjOzenkgG8kkwiB3n14yuihuz4rdiPGKwUUA54PoRmx0NCaYwlbtj8EOCrG831c2
	mloSxqm2o0JbCmIPzxWttHHcWUbtbEmI1WFEer0hDbb5vDUOBdnS1bm1ns722Ocht6RtFV93Fzw
	qUDX9p4Rs9kYuscuV8VP1LEyEK2A5LM3llsXC0VsO7oW6mQuAkprygtz4SwmyppeSB6OKKQLYFi
	ZfegTwD4JgLttX7snMNGP+mkxjuVGcJEPhEN92gUTcYvboXgzGFKQfEei8fFaoZdqVeuojxshLQ
	kRXUOWi1nKdxPM+WJp6Asz5Mud2L51xWQDInlcTQLYU07Ofdn7O4k8uVDSGggYDhQI5FF1pSfw=
X-Received: by 2002:a05:600c:1c20:b0:49f:bd3c:bc1c with SMTP id 5b1f17b1804b1-49fc5739f3bmr3250155e9.23.1789682896577;
        Thu, 17 Sep 2026 15:08:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 50/79] expat: upgrade 2.7.5 -> 2.8.3
Date: Fri, 18 Sep 2026 00:06:35 +0200
Message-ID: <4eccd2a25b65e095d167b4fd375667f9c3242f82.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246148

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Upgrade to 2.8.3, dropping 26 backported CVE patches (12 CVEs). This
is an exception to the usual stable upgrade policy as we are carrying
a large number of patches that are all included upstream in 2.8.3.

ABI compatibility verified with abidiff between 2.7.5 and 2.8.3 — no
ABI break and no SONAME major bump. Changelog reviewed — no feature
removals or backward-incompatible changes; only opt-in additions
disabled by default.

bitbake world -k built with oe-core + meta-openembedded layers, no
expat-related failures. All direct expat dependents built successfully:
apr-util, avahi, cmake, createrepo-c, dbus, dbus-broker, dbus-glib,
exiv2, fontconfig, gdb, git, graphviz, lftp, libcomps, libdbus-c++,
libsolv, libwmf, libxml-parser-perl, log4c, matchbox-keyboard,
matchbox-wm, mesa, neon, poco, python3, python3-dbus, sdbus-c++,
sdbus-c++-tools, serf, subversion, unbound, wayland, wbxml2, wireshark

Ptests passed on qemux86-64 for expat and its runtime consumers:
  core-image-ptest-expat: OK
  core-image-ptest-python3: OK
  core-image-ptest-libxml-parser-perl: OK

Additionally includes fixes for (not previously backported):
  CVE-2026-50219 CVE-2026-56131 CVE-2026-56412 (2.8.2)
  CVE-2026-72522 (2.8.3)

[1] https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
[2] https://sourceware.org/libabigail/manual/abidiff.html
[3] https://github.com/nordix/meta-binaryaudit

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-41080-1.patch        | 517 ------------------
 .../expat/expat/CVE-2026-41080-2.patch        |  33 --
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ---
 .../expat/expat/CVE-2026-45186-02.patch       | 318 -----------
 .../expat/expat/CVE-2026-45186-03.patch       |  46 --
 .../expat/expat/CVE-2026-45186-04.patch       |  32 --
 .../expat/expat/CVE-2026-45186-05.patch       |  32 --
 .../expat/expat/CVE-2026-45186-06.patch       |  87 ---
 .../expat/expat/CVE-2026-45186-07.patch       |  52 --
 .../expat/expat/CVE-2026-56132_p1.patch       |  90 ---
 .../expat/expat/CVE-2026-56132_p2.patch       |  63 ---
 .../expat/expat/CVE-2026-56132_p3.patch       |  77 ---
 .../expat/expat/CVE-2026-56132_p4.patch       |  63 ---
 .../expat/expat/CVE-2026-56132_p5.patch       |  58 --
 .../expat/expat/CVE-2026-56403_p1.patch       |  83 ---
 .../expat/expat/CVE-2026-56403_p2.patch       |  40 --
 .../expat/expat/CVE-2026-56404.patch          |  47 --
 .../expat/expat/CVE-2026-56405.patch          |  32 --
 .../expat/CVE-2026-56406-dependent.patch      |  58 --
 .../expat/expat/CVE-2026-56406.patch          |  37 --
 .../expat/expat/CVE-2026-56407.patch          |  44 --
 .../expat/expat/CVE-2026-56408.patch          |  36 --
 .../expat/expat/CVE-2026-56409.patch          |  53 --
 .../expat/expat/CVE-2026-56410_p1.patch       |  40 --
 .../expat/expat/CVE-2026-56410_p2.patch       |  41 --
 .../expat/expat/CVE-2026-56411.patch          |  47 --
 meta/recipes-core/expat/expat_2.7.5.bb        |  62 ---
 meta/recipes-core/expat/expat_2.8.3.bb        |  33 ++
 28 files changed, 33 insertions(+), 2158 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.7.5.bb
 create mode 100644 meta/recipes-core/expat/expat_2.8.3.bb

diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch b/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
deleted file mode 100644
index e93ad093f25..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
+++ /dev/null
@@ -1,517 +0,0 @@
-From fa1ebd60bfcc6d32f329803e5e837251e2387ed1 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 30 Mar 2025 19:26:55 +0200
-Subject: [PATCH v2 1/2] expat: fix CVE-2026-41080
-
-The existing hash flooding protection in libexpat (based on SipHash)
-only used 4 to 8 bytes of entropy for a salt, when 16 bytes are
-supported by the SipHash implementation. This allows attackers to more
-feasibly guess the hash salt and craft inputs that cause hash
-collisions, leading to denial of service.
-
-Backport upstream changes that:
-- Migrate hash salt storage to larger struct sipkey (128-bit)
-- Drop unused parameter from generate_hash_secret_salt
-- Drop unneeded void * casts in generate_hash_secret_salt
-- Extract full 16 bytes of entropy for hash flooding protection
-- Introduce internal flag m_hash_secret_salt_set
-- Remove now-dead get_hash_secret_salt function (copy_salt_to_sipkey
-  accesses the struct directly)
-- Add XML_SetHashSalt16Bytes API function
-- Deprecate XML_SetHashSalt
-- Add symbol export in libexpat.map.in (LIBEXPAT_2.7.6)
-- Add backport feature macro XML_BACKPORT_SET_HASH_SALT_16_BYTES
-- Add test_hash_salt_setter unit test
-- Update documentation and Changes file
-
-Squashed backport of upstream PR #1183 commits 909201a8, bc193afc,
-08697a9b, f5eacefb, fa1ebd60, f76124e7, e3349d85, c8c5caf4,
-592d5fa3, 8ad3ef57, ec9fcd2e, and 8017e11e.
-
-CVE: CVE-2026-41080
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1183]
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- Changes             |  17 ++++++
- doc/reference.html  |  55 +++++++++++++++++--
- lib/expat.h         |  15 ++++++
- lib/internal.h      |   2 +
- lib/libexpat.map.in |   5 ++
- lib/xmlparse.c      | 124 +++++++++++++++++++++++++++++++++----------
- tests/basic_tests.c |  25 +++++++++
- 7 files changed, 212 insertions(+), 31 deletions(-)
-
-diff --git a/Changes b/Changes
-index 2b3704a6..1d8227ec 100644
---- a/Changes
-+++ b/Changes
-@@ -29,6 +29,23 @@
- !! THANK YOU!                        Sebastian Pipping -- Berlin, 2026-03-17 !!
- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
- 
-+Patches
-+        Security fixes:
-+       #47 #1183  CVE-2026-41080 -- The existing hash flooding protection
-+                    (based on SipHash) only used 4 to 8 bytes of entropy for
-+                    a salt, when 16 bytes of salt are supported by the
-+                    implementation of SipHash used by Expat. Now full 16 bytes
-+                    of entropy are used to improve protection against hash
-+                    flooding attacks.
-+                      Existing API function XML_SetHashSalt is now deprecated
-+                    because of its limitations, and its use should be
-+                    considered a vulnerability. Please either use the new API
-+                    function XML_SetHashSalt16Bytes (with known-high-quality
-+                    entropy input only!) instead, or leave the derivation of
-+                    a 16-bytes hash salt from high quality entropy to Expat's
-+                    internal machinery (by *not* calling either of the two
-+                    XML_SetHashSalt* functions).
-+
- Release 2.7.5 Tue March 17 2026
-         Security fixes:
-            #1158  CVE-2026-32776 -- Fix NULL function pointer dereference for
-diff --git a/doc/reference.html b/doc/reference.html
-index 5faa8d65..64b9fd67 100644
---- a/doc/reference.html
-+++ b/doc/reference.html
-@@ -404,7 +404,11 @@
-                 </li>
- 
-                 <li>
--                  <a href="#XML_SetHashSalt">XML_SetHashSalt</a>
-+                  <a href="#XML_SetHashSalt">XML_SetHashSalt</a> (deprecated)
-+                </li>
-+
-+                <li>
-+                  <a href="#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a>
-                 </li>
- 
-                 <li>
-@@ -3449,22 +3453,35 @@ XML_SetParamEntityParsing(XML_Parser p,
-       </div>
- 
-       <h4 id="XML_SetHashSalt">
--        XML_SetHashSalt
-+        XML_SetHashSalt (deprecated)
-       </h4>
- 
-       <pre class="fcndec">
- int XMLCALL
--XML_SetHashSalt(XML_Parser p,
-+XML_SetHashSalt(XML_Parser parser,
-                 unsigned long hash_salt);
- </pre>
-       <div class="fcndef">
-         Sets the hash salt to use for internal hash calculations. Helps in preventing DoS
-         attacks based on predicting hash function behavior. In order to have an effect
-         this must be called before parsing has started. Returns 1 if successful, 0 when
--        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</code>.
-+        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</code> or when
-+        <code>parser</code> is <code>NULL</code>.
-+        <p>
-+          <b>Note:</b> Function <code>XML_SetHashSalt</code> is
-+          <strong>deprecated</strong>. Please use function <code><a href=
-+          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> instead for better
-+          security. <code>XML_SetHashSalt</code> only provides 4 to 8 bytes of entropy
-+          (depending on the size of type <code>unsigned long</code>) while the SipHash
-+          implementation used by Expat can leverage up to 16 bytes of entropy — at least
-+          twice as much. Function <code><a href=
-+          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> of Expat &gt;=2.7.6
-+          (and where backported) matches the amount of entropy supported by SipHash.
-+        </p>
-+
-         <p>
-           <b>Note:</b> This call is optional, as the parser will auto-generate a new
--          random salt value if no value has been set at the start of parsing.
-+          random salt value internally if no value has been set by the start of parsing.
-         </p>
- 
-         <p>
-@@ -3475,6 +3492,34 @@ XML_SetHashSalt(XML_Parser p,
-         </p>
-       </div>
- 
-+      <h4 id="XML_SetHashSalt16Bytes">
-+        XML_SetHashSalt16Bytes
-+      </h4>
-+
-+      <pre class="fcndec">
-+/* Added in Expat 2.7.6. */
-+XML_Bool XMLCALL
-+XML_SetHashSalt16Bytes(XML_Parser parser,
-+                       const uint8_t entropy[16]);
-+</pre>
-+      <div class="fcndef">
-+        Sets the hash salt to use for internal hash calculations. Helps in preventing DoS
-+        attacks based on predicting hash function behavior. In order to have an effect
-+        this must be called before parsing has started. Returns <code>XML_TRUE</code> if
-+        successful, <code>XML_FALSE</code> when called after <code>XML_Parse</code> or
-+        <code>XML_ParseBuffer</code> or when <code>parser</code> is <code>NULL</code>.
-+        <p>
-+          <b>Note:</b> Setting a salt that is <em>not</em> from a source of high quality
-+          entropy (like <code>getentropy(3)</code>) will make the parser vulnerable to
-+          hash flooding attacks.
-+        </p>
-+
-+        <p>
-+          <b>Note:</b> This call is optional, as the parser will auto-generate a new
-+          random salt value internally if no value has been set by the start of parsing.
-+        </p>
-+      </div>
-+
-       <h4 id="XML_UseForeignDTD">
-         XML_UseForeignDTD
-       </h4>
-diff --git a/lib/expat.h b/lib/expat.h
-index 18dbaebd..7693f62c 100644
---- a/lib/expat.h
-+++ b/lib/expat.h
-@@ -45,6 +45,7 @@
- #ifndef Expat_INCLUDED
- #  define Expat_INCLUDED 1
- 
-+#  include <stdint.h> // for uint8_t
- #  include <stdlib.h>
- #  include "expat_external.h"
- 
-@@ -917,10 +918,25 @@ XML_SetParamEntityParsing(XML_Parser parser,
-    function behavior. This must be called before parsing is started.
-    Returns 1 if successful, 0 when called after parsing has started.
-    Note: If parser == NULL, the function will do nothing and return 0.
-+   DEPRECATED since Expat 2.7.6.
- */
- XMLPARSEAPI(int)
- XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt);
- 
-+/* Sets the hash salt to use for internal hash calculations.
-+   Helps in preventing DoS attacks based on predicting hash function behavior.
-+   This must be called before parsing is started.
-+   Returns XML_TRUE if successful, XML_FALSE when called after parsing has
-+   started or when parser is NULL.
-+   Added in Expat 2.7.6.
-+*/
-+XMLPARSEAPI(XML_Bool)
-+XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]);
-+
-+/* Backport feature macro: signals that XML_SetHashSalt16Bytes is available
-+   even though XML_COMBINED_VERSION < 20800. */
-+#  define XML_BACKPORT_SET_HASH_SALT_16_BYTES 1
-+
- /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
-    XML_GetErrorCode returns information about the error.
- */
-diff --git a/lib/internal.h b/lib/internal.h
-index 61266ebb..1995c17b 100644
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -113,6 +113,7 @@
- #if defined(_WIN32)                                                            \
-     && (! defined(__USE_MINGW_ANSI_STDIO)                                      \
-         || (1 - __USE_MINGW_ANSI_STDIO - 1 == 0))
-+#  define EXPAT_FMT_LLX(midpart) "%" midpart "I64x"
- #  define EXPAT_FMT_ULL(midpart) "%" midpart "I64u"
- #  if defined(_WIN64) // Note: modifiers "td" and "zu" do not work for MinGW
- #    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "I64d"
-@@ -122,6 +123,7 @@
- #    define EXPAT_FMT_SIZE_T(midpart) "%" midpart "u"
- #  endif
- #else
-+#  define EXPAT_FMT_LLX(midpart) "%" midpart "llx"
- #  define EXPAT_FMT_ULL(midpart) "%" midpart "llu"
- #  if ! defined(ULONG_MAX)
- #    error Compiler did not define ULONG_MAX for us
-diff --git a/lib/libexpat.map.in b/lib/libexpat.map.in
-index 52e59ed3..8527eb54 100644
---- a/lib/libexpat.map.in
-+++ b/lib/libexpat.map.in
-@@ -117,3 +117,8 @@ LIBEXPAT_2.7.2 {
- @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold;
- @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification;
- } LIBEXPAT_2.6.0;
-+
-+LIBEXPAT_2.7.6 {
-+ global:
-+  XML_SetHashSalt16Bytes;
-+} LIBEXPAT_2.7.2;
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index 0248b665..75a7e5d0 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -604,7 +604,7 @@ static ELEMENT_TYPE *getElementType(XML_Parser parser, const ENCODING *enc,
- 
- static XML_Char *copyString(const XML_Char *s, XML_Parser parser);
- 
--static unsigned long generate_hash_secret_salt(XML_Parser parser);
-+static struct sipkey generate_hash_secret_salt(void);
- static XML_Bool startParsing(XML_Parser parser);
- 
- static XML_Parser parserCreate(const XML_Char *encodingName,
-@@ -777,7 +777,8 @@ struct XML_ParserStruct {
-   XML_Bool m_useForeignDTD;
-   enum XML_ParamEntityParsing m_paramEntityParsing;
- #endif
--  unsigned long m_hash_secret_salt;
-+  struct sipkey m_hash_secret_salt_128;
-+  XML_Bool m_hash_secret_salt_set;
- #if XML_GE == 1
-   ACCOUNTING m_accounting;
-   MALLOC_TRACKER m_alloc_tracker;
-@@ -1192,69 +1193,65 @@ gather_time_entropy(void) {
- 
- #endif /* ! defined(HAVE_ARC4RANDOM_BUF) && ! defined(HAVE_ARC4RANDOM) */
- 
--static unsigned long
--ENTROPY_DEBUG(const char *label, unsigned long entropy) {
-+static struct sipkey
-+ENTROPY_DEBUG(const char *label, struct sipkey entropy_128) {
-   if (getDebugLevel("EXPAT_ENTROPY_DEBUG", 0) >= 1u) {
--    fprintf(stderr, "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n", label,
--            (int)sizeof(entropy) * 2, entropy, (unsigned long)sizeof(entropy));
-+    fprintf(stderr,
-+            "expat: Entropy: %s --> [0x" EXPAT_FMT_LLX(
-+                "016") ", 0x" EXPAT_FMT_LLX("016") "] (16 bytes)\n",
-+            label, (unsigned long long)entropy_128.k[0],
-+            (unsigned long long)entropy_128.k[1]);
-   }
--  return entropy;
-+  return entropy_128;
- }
- 
--static unsigned long
--generate_hash_secret_salt(XML_Parser parser) {
--  unsigned long entropy;
--  (void)parser;
-+static struct sipkey
-+generate_hash_secret_salt(void) {
-+  struct sipkey entropy;
- 
-   /* "Failproof" high quality providers: */
- #if defined(HAVE_ARC4RANDOM_BUF)
-   arc4random_buf(&entropy, sizeof(entropy));
-   return ENTROPY_DEBUG("arc4random_buf", entropy);
- #elif defined(HAVE_ARC4RANDOM)
--  writeRandomBytes_arc4random((void *)&entropy, sizeof(entropy));
-+  writeRandomBytes_arc4random(&entropy, sizeof(entropy));
-   return ENTROPY_DEBUG("arc4random", entropy);
- #else
-   /* Try high quality providers first .. */
- #  ifdef _WIN32
--  if (writeRandomBytes_rand_s((void *)&entropy, sizeof(entropy))) {
-+  if (writeRandomBytes_rand_s(&entropy, sizeof(entropy))) {
-     return ENTROPY_DEBUG("rand_s", entropy);
-   }
- #  elif defined(HAVE_GETRANDOM) || defined(HAVE_SYSCALL_GETRANDOM)
--  if (writeRandomBytes_getrandom_nonblock((void *)&entropy, sizeof(entropy))) {
-+  if (writeRandomBytes_getrandom_nonblock(&entropy, sizeof(entropy))) {
-     return ENTROPY_DEBUG("getrandom", entropy);
-   }
- #  endif
- #  if ! defined(_WIN32) && defined(XML_DEV_URANDOM)
--  if (writeRandomBytes_dev_urandom((void *)&entropy, sizeof(entropy))) {
-+  if (writeRandomBytes_dev_urandom(&entropy, sizeof(entropy))) {
-     return ENTROPY_DEBUG("/dev/urandom", entropy);
-   }
- #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
-   /* .. and self-made low quality for backup: */
- 
--  entropy = gather_time_entropy();
-+  entropy.k[0] = 0;
-+  entropy.k[1] = gather_time_entropy();
- #  if ! defined(__wasi__)
-   /* Process ID is 0 bits entropy if attacker has local access */
--  entropy ^= getpid();
-+  entropy.k[1] ^= getpid();
- #  endif
- 
-   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
-   if (sizeof(unsigned long) == 4) {
--    return ENTROPY_DEBUG("fallback(4)", entropy * 2147483647);
-+    entropy.k[1] *= 2147483647;
-+    return ENTROPY_DEBUG("fallback(4)", entropy);
-   } else {
--    return ENTROPY_DEBUG("fallback(8)",
--                         entropy * (unsigned long)2305843009213693951ULL);
-+    entropy.k[1] *= 2305843009213693951ULL;
-+    return ENTROPY_DEBUG("fallback(8)", entropy);
-   }
- #endif
- }
- 
--static unsigned long
--get_hash_secret_salt(XML_Parser parser) {
--  const XML_Parser rootParser = getRootParserOf(parser, NULL);
--  assert(! rootParser->m_parentParser);
--
--  return rootParser->m_hash_secret_salt;
--}
--
- static enum XML_Error
- callProcessor(XML_Parser parser, const char *start, const char *end,
-               const char **endPtr) {
-@@ -1323,8 +1320,10 @@ callProcessor(XML_Parser parser, const char *start, const char *end,
- static XML_Bool /* only valid for root parser */
- startParsing(XML_Parser parser) {
-   /* hash functions must be initialized before setContext() is called */
--  if (parser->m_hash_secret_salt == 0)
--    parser->m_hash_secret_salt = generate_hash_secret_salt(parser);
-+  if (parser->m_hash_secret_salt_set != XML_TRUE) {
-+    parser->m_hash_secret_salt_128 = generate_hash_secret_salt();
-+    parser->m_hash_secret_salt_set = XML_TRUE;
-+  }
-   if (parser->m_ns) {
-     /* implicit context only set for root parser, since child
-        parsers (i.e. external entity parsers) will inherit it
-@@ -1612,7 +1611,9 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
-   parser->m_useForeignDTD = XML_FALSE;
-   parser->m_paramEntityParsing = XML_PARAM_ENTITY_PARSING_NEVER;
- #endif
--  parser->m_hash_secret_salt = 0;
-+  parser->m_hash_secret_salt_128.k[0] = 0;
-+  parser->m_hash_secret_salt_128.k[1] = 0;
-+  parser->m_hash_secret_salt_set = XML_FALSE;
- 
- #if XML_GE == 1
-   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
-@@ -1779,7 +1780,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
-      from hash tables associated with either parser without us having
-      to worry which hash secrets each table has.
-   */
--  unsigned long oldhash_secret_salt;
-+  struct sipkey oldhash_secret_salt_128;
-+  XML_Bool oldhash_secret_salt_set;
-   XML_Bool oldReparseDeferralEnabled;
- 
-   /* Validate the oldParser parameter before we pull everything out of it */
-@@ -1825,7 +1827,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
-      from hash tables associated with either parser without us having
-      to worry which hash secrets each table has.
-   */
--  oldhash_secret_salt = parser->m_hash_secret_salt;
-+  oldhash_secret_salt_128 = parser->m_hash_secret_salt_128;
-+  oldhash_secret_salt_set = parser->m_hash_secret_salt_set;
-   oldReparseDeferralEnabled = parser->m_reparseDeferralEnabled;
- 
- #ifdef XML_DTD
-@@ -1880,7 +1883,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
-     parser->m_externalEntityRefHandlerArg = oldExternalEntityRefHandlerArg;
-   parser->m_defaultExpandInternalEntities = oldDefaultExpandInternalEntities;
-   parser->m_ns_triplets = oldns_triplets;
--  parser->m_hash_secret_salt = oldhash_secret_salt;
-+  parser->m_hash_secret_salt_128 = oldhash_secret_salt_128;
-+  parser->m_hash_secret_salt_set = oldhash_secret_salt_set;
-   parser->m_reparseDeferralEnabled = oldReparseDeferralEnabled;
-   parser->m_parentParser = oldParser;
- #ifdef XML_DTD
-@@ -2327,6 +2331,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
- #endif
- }
- 
-+// DEPRECATED since Expat 2.7.6.
- int XMLCALL
- XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
-   if (parser == NULL)
-@@ -2337,10 +2342,46 @@ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
-   /* block after XML_Parse()/XML_ParseBuffer() has been called */
-   if (parserBusy(rootParser))
-     return 0;
--  rootParser->m_hash_secret_salt = hash_salt;
-+
-+  rootParser->m_hash_secret_salt_128.k[0] = 0;
-+  rootParser->m_hash_secret_salt_128.k[1] = hash_salt;
-+
-+  if (hash_salt != 0) { // to remain backwards compatible
-+    rootParser->m_hash_secret_salt_set = XML_TRUE;
-+
-+    if (sizeof(unsigned long) == 4)
-+      ENTROPY_DEBUG("explicit(4)", rootParser->m_hash_secret_salt_128);
-+    else
-+      ENTROPY_DEBUG("explicit(8)", rootParser->m_hash_secret_salt_128);
-+  }
-+
-   return 1;
- }
- 
-+XML_Bool XMLCALL
-+XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]) {
-+  if (parser == NULL)
-+    return XML_FALSE;
-+
-+  if (entropy == NULL)
-+    return XML_FALSE;
-+
-+  const XML_Parser rootParser = getRootParserOf(parser, NULL);
-+  assert(! rootParser->m_parentParser);
-+
-+  /* block after XML_Parse()/XML_ParseBuffer() has been called */
-+  if (parserBusy(rootParser))
-+    return XML_FALSE;
-+
-+  sip_tokey(&(rootParser->m_hash_secret_salt_128), entropy);
-+
-+  rootParser->m_hash_secret_salt_set = XML_TRUE;
-+
-+  ENTROPY_DEBUG("explicit(16)", rootParser->m_hash_secret_salt_128);
-+
-+  return XML_TRUE;
-+}
-+
- enum XML_Status XMLCALL
- XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
-   if ((parser == NULL) || (len < 0) || ((s == NULL) && (len != 0))) {
-@@ -7842,8 +7883,10 @@ keylen(KEY s) {
- 
- static void
- copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
--  key->k[0] = 0;
--  key->k[1] = get_hash_secret_salt(parser);
-+  const XML_Parser rootParser = getRootParserOf(parser, NULL);
-+  assert(! rootParser->m_parentParser);
-+
-+  *key = rootParser->m_hash_secret_salt_128;
- }
- 
- static unsigned long FASTCALL
-diff --git a/tests/basic_tests.c b/tests/basic_tests.c
-index 02d1d5fd..26662fee 100644
---- a/tests/basic_tests.c
-+++ b/tests/basic_tests.c
-@@ -204,6 +204,30 @@ START_TEST(test_hash_collision) {
- END_TEST
- #undef COLLIDING_HASH_SALT
- 
-+START_TEST(test_hash_salt_setter) {
-+  const uint8_t entropy[16] = {'0', '1', '2', '3', '4', '5', '6', '7',
-+                               '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+
-+  // NULL parser should be rejected
-+  assert_true(XML_SetHashSalt16Bytes(NULL, entropy) == XML_FALSE);
-+
-+  // NULL entropy should be rejected
-+  assert_true(XML_SetHashSalt16Bytes(parser, NULL) == XML_FALSE);
-+
-+  // Setting should be allowed more than once
-+  assert_true(XML_SetHashSalt16Bytes(parser, entropy) == XML_TRUE);
-+  assert_true(XML_SetHashSalt16Bytes(parser, entropy) == XML_TRUE);
-+
-+  // But not after parsing has started
-+  assert_true(XML_Parse(parser, "", 0, XML_FALSE /* isFinal */)
-+              == XML_STATUS_OK);
-+  assert_true(XML_SetHashSalt16Bytes(parser, entropy) == XML_FALSE);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
- /* Regression test for SF bug #491986. */
- START_TEST(test_danish_latin1) {
-   const char *text = "<?xml version='1.0' encoding='iso-8859-1'?>\n"
-@@ -6292,6 +6316,7 @@ make_basic_test_case(Suite *s) {
-   tcase_add_test(tc_basic, test_bom_utf16_le);
-   tcase_add_test(tc_basic, test_nobom_utf16_le);
-   tcase_add_test(tc_basic, test_hash_collision);
-+  tcase_add_test(tc_basic, test_hash_salt_setter);
-   tcase_add_test(tc_basic, test_illegal_utf8);
-   tcase_add_test(tc_basic, test_utf8_auto_align);
-   tcase_add_test(tc_basic, test_utf16);
--- 
-2.34.1
diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
deleted file mode 100644
index 0410f8b070f..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8 Mon Sep 17 00:00:00 2001
-From: Christoph Reiter <reiter.christoph@gmail.com>
-Date: Wed, 10 Jun 2026 21:27:51 +0200
-Subject: [PATCH 2/2] cmake|windows: add missing export for new
- XML_SetHashSalt16Bytes
-
-A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
-wasn't added to the def file, so the export is missing when building
-libexpat on Windows with cmake.
-
-Add the new symbol to the .def template.
-
-CVE: CVE-2026-41080
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8]
-
-Signed-off-by: Christoph Reiter <reiter.christoph@gmail.com>
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
----
- lib/libexpat.def.cmake | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
-index 9b9e22cb..948135a5 100644
---- a/lib/libexpat.def.cmake
-+++ b/lib/libexpat.def.cmake
-@@ -83,3 +83,5 @@ EXPORTS
- ; added with version 2.7.2
- @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
- @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
-+; added with version 2.7.6
-+  XML_SetHashSalt16Bytes @74
--- 
-2.34.1
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
deleted file mode 100644
index 478978f4ca2..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From b659bf974f29b991870ba1f66af687c73e07fbf8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
-Date: Fri, 13 Mar 2026 13:26:45 +0100
-Subject: [PATCH 1/7] Make "counting_start_element_handler" count default attrs
-
-(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/0802a5892030610144b736dec6e2f63e8600fe85]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- tests/basic_tests.c | 8 ++++----
- tests/handlers.c    | 2 +-
- tests/handlers.h    | 1 +
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/tests/basic_tests.c b/tests/basic_tests.c
-index 02d1d5f..8c025a2 100644
---- a/tests/basic_tests.c
-+++ b/tests/basic_tests.c
-@@ -2466,9 +2466,9 @@ START_TEST(test_attributes) {
-                          {XCS("id"), XCS("one")},
-                          {NULL, NULL}};
-   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
--  ElementInfo info[] = {{XCS("doc"), 3, XCS("id"), NULL},
--                        {XCS("tag"), 1, NULL, NULL},
--                        {NULL, 0, NULL, NULL}};
-+  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
-+                        {XCS("tag"), 1, 0, NULL, NULL},
-+                        {NULL, 0, 0, NULL, NULL}};
-   info[0].attributes = doc_info;
-   info[1].attributes = tag_info;
- 
-@@ -5543,7 +5543,7 @@ START_TEST(test_deep_nested_attribute_entity) {
-            (long unsigned)(N_LINES - 1));
- 
-   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
--  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
-+  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
-   info[0].attributes = doc_info;
- 
-   XML_Parser parser = XML_ParserCreate(NULL);
-diff --git a/tests/handlers.c b/tests/handlers.c
-index e456df2..bd1b54e 100644
---- a/tests/handlers.c
-+++ b/tests/handlers.c
-@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const XML_Char *name,
-     fail("ID does not have the correct name");
-     return;
-   }
--  for (i = 0; i < info->attr_count; i++) {
-+  for (i = 0; i < info->attr_count + info->default_attr_count; i++) {
-     attr = info->attributes;
-     while (attr->name != NULL) {
-       if (! xcstrcmp(atts[0], attr->name))
-diff --git a/tests/handlers.h b/tests/handlers.h
-index fcde27a..27a53f2 100644
---- a/tests/handlers.h
-+++ b/tests/handlers.h
-@@ -88,6 +88,7 @@ typedef struct attrInfo {
- typedef struct elementInfo {
-   const XML_Char *name;
-   int attr_count;
-+  int default_attr_count;
-   const XML_Char *id_name;
-   AttrInfo *attributes;
- } ElementInfo;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
deleted file mode 100644
index 6c90e15b47d..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-From 32848241057dfaa4c68fae475f51fbe1a182c004 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
-Date: Fri, 13 Mar 2026 13:27:31 +0100
-Subject: [PATCH 2/7] test(attlist): Cover duplicate attribute names
-
-Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
-(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 282 insertions(+)
-
-diff --git a/tests/basic_tests.c b/tests/basic_tests.c
-index 8c025a2..83c453c 100644
---- a/tests/basic_tests.c
-+++ b/tests/basic_tests.c
-@@ -2489,6 +2489,279 @@ START_TEST(test_attributes) {
- }
- END_TEST
- 
-+START_TEST(test_duplicate_cdata_attribute) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one definition is provided for the same attribute of a given
-+    element type, the first declaration is binding and later declarations are
-+    ignored.
-+  */
-+
-+  const char *text
-+      = "<!DOCTYPE doc [\n"
-+        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ignored'>\n"
-+        "]>\n"
-+        "<doc/>\n";
-+  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
-+  ElementInfo info[]
-+      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_id_attribute_1) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one definition is provided for the same attribute of a given
-+    element type, the first declaration is binding and later declarations are
-+    ignored.
-+  */
-+
-+  const char *text
-+      = "<!DOCTYPE doc [\n"
-+        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQUIRED>\n"
-+        "]>\n"
-+        "<doc/>\n";
-+  AttrInfo doc_info[] = {{XCS("identifier"), XCS("expected")}, {NULL, NULL}};
-+  ElementInfo info[]
-+      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_id_attribute_2) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one definition is provided for the same attribute of a given
-+    element type, the first declaration is binding and later declarations are
-+    ignored.
-+  */
-+
-+  const char *text
-+      = "<!DOCTYPE doc [\n"
-+        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unexpected'>\n"
-+        "]>\n"
-+        "<doc/>\n";
-+  AttrInfo doc_info[] = {{NULL, NULL}};
-+
-+  ElementInfo info[]
-+      = {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one AttlistDecl is provided for a given element type,
-+    the contents of all those provided are merged.
-+  */
-+  const char *text = "<!DOCTYPE doc [\n"
-+                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
-+                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
-+                     "]>\n"
-+                     "<doc/>\n";
-+  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
-+  ElementInfo info[]
-+      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one AttlistDecl is provided for a given element type,
-+    the contents of all those provided are merged.
-+  */
-+  const char *text = "<!DOCTYPE doc [\n"
-+                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
-+                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
-+                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
-+                     "]>\n"
-+                     "<doc><tag></tag></doc>\n";
-+  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")}, {NULL, NULL}};
-+  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
-+  ElementInfo info[] = {{XCS("doc"), 0, 1, NULL, doc_info},
-+                        {XCS("tag"), 0, 1, NULL, tag_info},
-+                        {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one AttlistDecl is provided for a given element type,
-+    the contents of all those provided are merged.
-+  */
-+  const char *text
-+      = "<!DOCTYPE doc [\n"
-+        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
-+        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
-+        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' attribute CDATA 'ignored_doc'>\n"
-+        "]>\n"
-+        "<doc><tag></tag></doc>\n";
-+  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")},
-+                         {XCS("second_attribute"), XCS("second_expected_doc")},
-+                         {NULL, NULL}};
-+  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
-+  ElementInfo info[] = {{XCS("doc"), 0, 2, NULL, doc_info},
-+                        {XCS("tag"), 0, 1, NULL, tag_info},
-+                        {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
-+START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
-+  /*
-+  https://www.w3.org/TR/xml/#attdecls
-+
-+  Test the following statement from the linked specification:
-+    When more than one AttlistDecl is provided for a given element type,
-+    the contents of all those provided are merged.
-+  */
-+  const char *text = "<!DOCTYPE doc [\n"
-+                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
-+                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'>\n"
-+                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
-+                     "]>\n"
-+                     "<doc identifier='doc_identity'><tag></tag></doc>\n";
-+  AttrInfo doc_info[]
-+      = {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
-+  AttrInfo tag_info[]
-+      = {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
-+  ElementInfo info[] = {{XCS("doc"), 1, 0, XCS("identifier"), doc_info},
-+                        {XCS("tag"), 0, 1, NULL, tag_info},
-+                        {NULL, 0, 0, NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  assert_true(parser != NULL);
-+
-+  ParserAndElementInfo parserAndElementInfos = {
-+      parser,
-+      info,
-+  };
-+
-+  XML_SetStartElementHandler(parser, counting_start_element_handler);
-+  XML_SetUserData(parser, &parserAndElementInfos);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      != XML_STATUS_OK)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
- /* Test reset works correctly in the middle of processing an internal
-  * entity.  Exercises some obscure code in XML_ParserReset().
-  */
-@@ -6374,6 +6647,15 @@ make_basic_test_case(Suite *s) {
-   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
-   tcase_add_test(tc_basic, test_set_base);
-   tcase_add_test(tc_basic, test_attributes);
-+  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
-+  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
-+  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
-+  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attlistdecl);
-+  tcase_add_test(tc_basic,
-+                 test_duplicate_cdata_attribute_multiple_attlistdecl_2);
-+  tcase_add_test(tc_basic,
-+                 test_duplicate_cdata_attribute_multiple_attlistdecl_3);
-+  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
-   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
-   tcase_add_test(tc_basic, test_resume_invalid_parse);
-   tcase_add_test(tc_basic, test_resume_resuspended);
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
deleted file mode 100644
index f3b0614b8df..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 468d6f44264e7ad73f3045f6487baccc846014e6 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Mon, 20 Apr 2026 13:44:43 +0200
-Subject: [PATCH 3/7] tests: Define .attributes the first time around
-
-(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- tests/basic_tests.c | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/tests/basic_tests.c b/tests/basic_tests.c
-index 83c453c..810ff5e 100644
---- a/tests/basic_tests.c
-+++ b/tests/basic_tests.c
-@@ -2466,11 +2466,9 @@ START_TEST(test_attributes) {
-                          {XCS("id"), XCS("one")},
-                          {NULL, NULL}};
-   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
--  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
--                        {XCS("tag"), 1, 0, NULL, NULL},
-+  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), doc_info},
-+                        {XCS("tag"), 1, 0, NULL, tag_info},
-                         {NULL, 0, 0, NULL, NULL}};
--  info[0].attributes = doc_info;
--  info[1].attributes = tag_info;
- 
-   XML_Parser parser = XML_ParserCreate(NULL);
-   assert_true(parser != NULL);
-@@ -5816,8 +5814,8 @@ START_TEST(test_deep_nested_attribute_entity) {
-            (long unsigned)(N_LINES - 1));
- 
-   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
--  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
--  info[0].attributes = doc_info;
-+  ElementInfo info[]
-+      = {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
- 
-   XML_Parser parser = XML_ParserCreate(NULL);
-   ParserAndElementInfo parserPlusElemenInfo = {parser, info};
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
deleted file mode 100644
index d30ffa3f512..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0582bcabb773d4600d7c85516132b016f0163deb Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Mon, 13 Apr 2026 01:34:03 +0200
-Subject: [PATCH 4/7] tests: Make counting_start_element_handler enforce
- complete attribute lists
-
-(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- tests/handlers.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/handlers.c b/tests/handlers.c
-index bd1b54e..8cda3a8 100644
---- a/tests/handlers.c
-+++ b/tests/handlers.c
-@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const XML_Char *name,
-     /* Remember, two entries in atts per attribute (see above) */
-     atts += 2;
-   }
-+
-+  // Self-test that the test case's list of expected attributes is complete
-+  assert_true(atts[0] == NULL);
- }
- 
- void XMLCALL
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
deleted file mode 100644
index 6d98a3cd091..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ebe5486739006105629b0bca6022f664566e56de Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 8 Mar 2026 22:14:41 +0100
-Subject: [PATCH 5/7] lib: Extract a constant for upcoming reuse
-
-(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/fb35f2d2040d114f355bae8a7450942533237530]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- lib/xmlparse.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index 0248b66..e833520 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -7719,8 +7719,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
-       newE->prefix = (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
-                                       oldE->prefix->name, 0);
-     for (i = 0; i < newE->nDefaultAtts; i++) {
-+      const XML_Char *const attributeName = oldE->defaultAtts[i].id->name;
-       newE->defaultAtts[i].id = (ATTRIBUTE_ID *)lookup(
--          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->name, 0);
-+          oldParser, &(newDtd->attributeIds), attributeName, 0);
-       newE->defaultAtts[i].isCdata = oldE->defaultAtts[i].isCdata;
-       if (oldE->defaultAtts[i].value) {
-         newE->defaultAtts[i].value
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
deleted file mode 100644
index 1b47776a172..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 41f9f3c8479e8f8547d5bce6355b0484c2744d1e Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 8 Mar 2026 23:05:49 +0100
-Subject: [PATCH 6/7] lib: Introduce ELEMENT_TYPE.defaultAttsNames
-
-(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- lib/xmlparse.c | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index e833520..b7e2d72 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -388,6 +388,7 @@ typedef struct {
-   int nDefaultAtts;
-   int allocDefaultAtts;
-   DEFAULT_ATTRIBUTE *defaultAtts;
-+  HASH_TABLE defaultAttsNames;
- } ELEMENT_TYPE;
- 
- typedef struct {
-@@ -3853,6 +3854,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
-                                          sizeof(ELEMENT_TYPE));
-     if (! elementType)
-       return XML_ERROR_NO_MEMORY;
-+    if (! elementType->defaultAttsNames.parser)
-+      hashTableInit(&(elementType->defaultAttsNames), parser);
-     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
-       return XML_ERROR_NO_MEMORY;
-   }
-@@ -7561,6 +7564,7 @@ dtdReset(DTD *p, XML_Parser parser) {
-     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
-     if (! e)
-       break;
-+    hashTableDestroy(&(e->defaultAttsNames));
-     if (e->allocDefaultAtts != 0)
-       FREE(parser, e->defaultAtts);
-   }
-@@ -7602,6 +7606,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
-     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
-     if (! e)
-       break;
-+    hashTableDestroy(&(e->defaultAttsNames));
-     if (e->allocDefaultAtts != 0)
-       FREE(parser, e->defaultAtts);
-   }
-@@ -7695,6 +7700,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
-                                   sizeof(ELEMENT_TYPE));
-     if (! newE)
-       return 0;
-+
-+    if (! newE->defaultAttsNames.parser)
-+      hashTableInit(&(newE->defaultAttsNames), parser);
-+
-     if (oldE->nDefaultAtts) {
-       /* Detect and prevent integer overflow.
-        * The preprocessor guard addresses the "always false" warning
-@@ -7730,6 +7739,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
-           return 0;
-       } else
-         newE->defaultAtts[i].value = NULL;
-+
-+      NAMED *const nameAddedOrFound = (NAMED *)lookup(
-+          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAMED));
-+      if (! nameAddedOrFound) {
-+        return 0;
-+      }
-     }
-   }
- 
-@@ -8474,6 +8489,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
-                                sizeof(ELEMENT_TYPE));
-   if (! ret)
-     return NULL;
-+  if (! ret->defaultAttsNames.parser)
-+    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
-   if (ret->name != name)
-     poolDiscard(&dtd->pool);
-   else {
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
deleted file mode 100644
index 5551d10243c..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 141a3c12639f9a4066293e81dbedde4c15b0881f Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 8 Mar 2026 23:06:29 +0100
-Subject: [PATCH 7/7] lib: Leverage ELEMENT_TYPE.defaultAttsNames for attribute
- collision detection
-
-.. to resolve quadratic runtime behavior
-
-(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
-
-CVE: CVE-2026-45186
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
-Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
----
- lib/xmlparse.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index b7e2d72..04195cb 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -7189,10 +7189,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
-   if (value || isId) {
-     /* The handling of default attributes gets messed up if we have
-        a default which duplicates a non-default. */
--    int i;
--    for (i = 0; i < type->nDefaultAtts; i++)
--      if (attId == type->defaultAtts[i].id)
--        return 1;
-+    NAMED *const nameFound
-+        = (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->name, 0);
-+    if (nameFound)
-+      return 1;
-     if (isId && ! type->idAtt && ! attId->xmlns)
-       type->idAtt = attId;
-   }
-@@ -7239,6 +7239,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
-   att->isCdata = isCdata;
-   if (! isCdata)
-     attId->maybeTokenized = XML_TRUE;
-+
-+  NAMED *const nameAddedOrFound = (NAMED *)lookup(
-+      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
-+  if (! nameAddedOrFound)
-+    return 0;
-+
-   type->nDefaultAtts += 1;
-   return 1;
- }
--- 
-2.43.0
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
deleted file mode 100644
index a413bf0acd0..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 2e5920edcbc77bf29ce8575bd38ed2886408f4af Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Thu, 4 Jun 2026 17:01:02 -0700
-Subject: [PATCH] lib: Remove reuse of `m_groupSize` to count `m_scaffIndex`
- allocation
-
-The sizes of the two arrays `m_groupConnector` and `scaffIndex` need to
-vary independently. This change is a step towards allowing this.
-
-Anthropic: ANT-2026-00037
-Anthropic: ANT-2026-03621
-Anthropic: ANT-2026-03867
-Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
-
-CVE: CVE-2026-56132
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3a4eaf47af8fd7abda38ea2c08308c91152061f3]
-
-(cherry picked from commit 3a4eaf47af8fd7abda38ea2c08308c91152061f3)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 8e90fea8..d4864af8 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -424,6 +424,7 @@ typedef struct {
-   unsigned scaffCount;
-   int scaffLevel;
-   int *scaffIndex;
-+  size_t scaffIndexSize;
- } DTD;
- 
- enum EntityType {
-@@ -5995,7 +5996,6 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-              * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
- #if UINT_MAX >= SIZE_MAX
-             if (parser->m_groupSize > SIZE_MAX / sizeof(int)) {
--              parser->m_groupSize /= 2;
-               return XML_ERROR_NO_MEMORY;
-             }
- #endif
-@@ -6003,10 +6003,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-             int *const new_scaff_index = REALLOC(
-                 parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
-             if (new_scaff_index == NULL) {
--              parser->m_groupSize /= 2;
-               return XML_ERROR_NO_MEMORY;
-             }
-             dtd->scaffIndex = new_scaff_index;
-+            dtd->scaffIndexSize = parser->m_groupSize;
-           }
-         } else {
-           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
-@@ -7587,6 +7587,7 @@ dtdCreate(XML_Parser parser) {
- 
-   p->in_eldecl = XML_FALSE;
-   p->scaffIndex = NULL;
-+  p->scaffIndexSize = 0;
-   p->scaffold = NULL;
-   p->scaffLevel = 0;
-   p->scaffSize = 0;
-@@ -7627,6 +7628,7 @@ dtdReset(DTD *p, XML_Parser parser) {
- 
-   FREE(parser, p->scaffIndex);
-   p->scaffIndex = NULL;
-+  p->scaffIndexSize = 0;
-   FREE(parser, p->scaffold);
-   p->scaffold = NULL;
- 
-@@ -7801,6 +7803,7 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
-   newDtd->scaffSize = oldDtd->scaffSize;
-   newDtd->scaffLevel = oldDtd->scaffLevel;
-   newDtd->scaffIndex = oldDtd->scaffIndex;
-+  newDtd->scaffIndexSize = oldDtd->scaffIndexSize;
- 
-   return 1;
- } /* End dtdCopy */
-@@ -8331,6 +8334,7 @@ nextScaffoldPart(XML_Parser parser) {
-     dtd->scaffIndex = MALLOC(parser, parser->m_groupSize * sizeof(int));
-     if (! dtd->scaffIndex)
-       return -1;
-+    dtd->scaffIndexSize = parser->m_groupSize;
-     dtd->scaffIndex[0] = 0;
-   }
- 
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
deleted file mode 100644
index 6fb8f6078ba..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2b6ebe08e4b6b3dd4d0f4f197dac18eecef16e6e Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Thu, 4 Jun 2026 17:01:02 -0700
-Subject: [PATCH] lib: doProlog: Fix out-of-bound scaffolding index store
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The scaffold backing array is reallocated using the caller parser’s
-per-parser `m_groupSize`, but the DTD struct (which carries
-`scaffIndex`) is shared between a parent parser and any external
-parameter-entity sub-parser created via
-`XML_ExternalEntityParserCreate(parent, NULL, …)`. A sub-parser whose
-group nesting is shallower than the parent’s can `REALLOC` the shared
-`scaffIndex` down to its own size; when the parent resumes and parses a
-deeper element content model, its bounds check passes (its private
-`m_groupSize` is still large enough), the doubling-grow path is skipped,
-and the next write lands past the shrunken buffer.
-
-Anthropic: ANT-2026-00037
-Anthropic: ANT-2026-03621
-Anthropic: ANT-2026-03867
-Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
-Reported-by: Trail of Bits, in collaboration with Anthropic
-
-CVE: CVE-2026-56132
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/58400483d7c97be316d7a77739c0a6af5d55932e]
-
-(cherry picked from commit 58400483d7c97be316d7a77739c0a6af5d55932e)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index d4864af8..b528c9bc 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -6022,6 +6022,21 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-         if (myindex < 0)
-           return XML_ERROR_NO_MEMORY;
-         assert(dtd->scaffIndex != NULL);
-+        if ((size_t)dtd->scaffLevel >= dtd->scaffIndexSize) {
-+          /* Detect and prevent integer overflow */
-+          if (dtd->scaffIndexSize > SIZE_MAX / 2 / sizeof(int)) {
-+            return XML_ERROR_NO_MEMORY;
-+          }
-+          assert(dtd->scaffIndexSize > 0);
-+          const size_t new_size = dtd->scaffIndexSize * 2;
-+          int *const new_scaff_index
-+              = REALLOC(parser, dtd->scaffIndex, new_size * sizeof(int));
-+          if (new_scaff_index == NULL) {
-+            return XML_ERROR_NO_MEMORY;
-+          }
-+          dtd->scaffIndex = new_scaff_index;
-+          dtd->scaffIndexSize = new_size;
-+        }
-         dtd->scaffIndex[dtd->scaffLevel] = myindex;
-         dtd->scaffLevel++;
-         dtd->scaffold[myindex].type = XML_CTYPE_SEQ;
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
deleted file mode 100644
index 5405224ec38..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 22805ecc87ba8f66b693220442408a6f7c7e741d Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Thu, 4 Jun 2026 17:01:02 -0700
-Subject: [PATCH] tests: Add a test case for scaffolding array limits in shared
- DTDs
-
-This test case provokes the bug fixed in the previous commit.
-
-Anthropic: ANT-2026-00037
-Anthropic: ANT-2026-03621
-Anthropic: ANT-2026-03867
-Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
-Reported-by: Trail of Bits, in collaboration with Anthropic
-
-CVE: CVE-2026-56132
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/353919b3b9f2174073a557ac7d517a5f3cd0cbbf]
-
-(cherry picked from commit 353919b3b9f2174073a557ac7d517a5f3cd0cbbf)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/tests/basic_tests.c | 33 +++++++++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/expat/tests/basic_tests.c b/expat/tests/basic_tests.c
-index 02d1d5fd..53b920da 100644
---- a/expat/tests/basic_tests.c
-+++ b/expat/tests/basic_tests.c
-@@ -4091,6 +4091,37 @@ START_TEST(test_skipped_external_entity) {
- }
- END_TEST
- 
-+START_TEST(test_scaff_index_shared_across_external_entity_parser) {
-+  const char text[]
-+      = "<!DOCTYPE doc [\n"
-+        "<!ELEMENT a "
-+        "((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((b))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))>\n"
-+        "<!ENTITY % e SYSTEM 'ext'>\n"
-+        "%e;\n"
-+        "<!ELEMENT c "
-+        "(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((d)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))>\n"
-+        "]>\n"
-+        "<doc/>";
-+  ExtOption options[]
-+      = {{XCS("ext"),
-+          "<!ELEMENT x "
-+          "((((((((((((((((((((((((((((((((y))))))))))))))))))))))))))))))))>"},
-+         {NULL, NULL}};
-+
-+  XML_Parser parser = XML_ParserCreate(NULL);
-+  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
-+  XML_SetUserData(parser, options);
-+  XML_SetExternalEntityRefHandler(parser, external_entity_optioner);
-+  XML_SetElementDeclHandler(parser, dummy_element_decl_handler);
-+
-+  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
-+      == XML_STATUS_ERROR)
-+    xml_failure(parser);
-+
-+  XML_ParserFree(parser);
-+}
-+END_TEST
-+
- /* Test a different form of unknown external entity */
- START_TEST(test_skipped_null_loaded_ext_entity) {
-   const char *text = "<!DOCTYPE doc SYSTEM 'http://example.org/one.ent'>\n"
-@@ -6448,6 +6479,8 @@ make_basic_test_case(Suite *s) {
-   tcase_add_test(tc_basic, test_trailing_cr_in_att_value);
-   tcase_add_test(tc_basic, test_standalone_internal_entity);
-   tcase_add_test(tc_basic, test_skipped_external_entity);
-+  tcase_add_test__ifdef_xml_dtd(
-+      tc_basic, test_scaff_index_shared_across_external_entity_parser);
-   tcase_add_test(tc_basic, test_skipped_null_loaded_ext_entity);
-   tcase_add_test(tc_basic, test_skipped_unloaded_ext_entity);
-   tcase_add_test__ifdef_xml_dtd(tc_basic, test_param_entity_with_trailing_cr);
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
deleted file mode 100644
index 0cef4df4527..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 36df125531dab7e0dc640b341d07b4b1f5ede37b Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Thu, 4 Jun 2026 17:01:02 -0700
-Subject: [PATCH] lib: Remove unnecessary `scaffIndex` expansion
-
-Following the previous changes, all locations that append entries to
-`scaffIndex` handle expanding the array if it is not already large
-enough. So this extra expansion code is no longer necessary. In some
-cases such as processing siblings with alternating scaffolding counts,
-this logic would actually _shrink_ the array only to then later
-re-expand it.
-
-Anthropic: ANT-2026-00037
-Anthropic: ANT-2026-03621
-Anthropic: ANT-2026-03867
-Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
-
-CVE: CVE-2026-56132
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/bca93b4ba9e15fd84425568d772b69baebf790e4]
-
-Backport Changes:
-- Remove the expanded Expat 2.7.5 scaffIndex resize block, including its
-  branch-specific integer overflow guard.
-
-(cherry picked from commit bca93b4ba9e15fd84425568d772b69baebf790e4)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 20 --------------------
- 1 file changed, 20 deletions(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index b528c9bc..e59ad556 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -5988,26 +5988,6 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-             }
-             parser->m_groupConnector = new_connector;
-           }
--
--          if (dtd->scaffIndex) {
--            /* Detect and prevent integer overflow.
--             * The preprocessor guard addresses the "always false" warning
--             * from -Wtype-limits on platforms where
--             * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
--#if UINT_MAX >= SIZE_MAX
--            if (parser->m_groupSize > SIZE_MAX / sizeof(int)) {
--              return XML_ERROR_NO_MEMORY;
--            }
--#endif
--
--            int *const new_scaff_index = REALLOC(
--                parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
--            if (new_scaff_index == NULL) {
--              return XML_ERROR_NO_MEMORY;
--            }
--            dtd->scaffIndex = new_scaff_index;
--            dtd->scaffIndexSize = parser->m_groupSize;
--          }
-         } else {
-           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
-           if (! parser->m_groupConnector) {
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
deleted file mode 100644
index 8655298b65f..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From c6256eca63fe36d4ef26fd59cbcaab7b72e1d6f2 Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Thu, 4 Jun 2026 17:01:02 -0700
-Subject: [PATCH] lib: Remove indented scoping of `new_connector` local
-
-Following the previous change, the lifetime of `new_connector` as
-constrained by this introduced scope was identical to the parent scope.
-
-CVE: CVE-2026-56132
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5]
-
-Backport Changes:
-- Keep the Expat 2.7.5 unsigned-int overflow guard while removing the
-  redundant new_connector scope.
-
-(cherry picked from commit 08baa7ef9d168b99094249998fd78f8d190526e5)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 22 ++++++++++------------
- 1 file changed, 10 insertions(+), 12 deletions(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index e59ad556..e8d6fc3a 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -5974,20 +5974,18 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-     case XML_ROLE_GROUP_OPEN:
-       if (parser->m_prologState.level >= parser->m_groupSize) {
-         if (parser->m_groupSize) {
--          {
--            /* Detect and prevent integer overflow */
--            if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
--              return XML_ERROR_NO_MEMORY;
--            }
-+          /* Detect and prevent integer overflow */
-+          if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
-+            return XML_ERROR_NO_MEMORY;
-+          }
- 
--            char *const new_connector = REALLOC(
--                parser, parser->m_groupConnector, parser->m_groupSize *= 2);
--            if (new_connector == NULL) {
--              parser->m_groupSize /= 2;
--              return XML_ERROR_NO_MEMORY;
--            }
--            parser->m_groupConnector = new_connector;
-+          char *const new_connector = REALLOC(parser, parser->m_groupConnector,
-+                                              parser->m_groupSize *= 2);
-+          if (new_connector == NULL) {
-+            parser->m_groupSize /= 2;
-+            return XML_ERROR_NO_MEMORY;
-           }
-+          parser->m_groupConnector = new_connector;
-         } else {
-           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
-           if (! parser->m_groupConnector) {
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
deleted file mode 100644
index 4cf5c3bd54d..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 4a264be1794368a1acc08476058b6cf087686d11 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Wed, 20 May 2026 12:12:10 +0200
-Subject: [PATCH] lib: Protect function `storeAtts` from signed integer
- overflow
-
-CVE: CVE-2026-56403
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648]
-
-Backport Changes:
-- Retain the Expat 2.7.5 binding URI reallocation and active tag pointer
-  updates while using the overflow-safe localPartLen calculation.
-
-(cherry picked from commit 12dc6d8d3d65f79471a94d8565f6bf1cf245f648)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 30 ++++++++++++++++++++----------
- 1 file changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 0248b665..e441ff7f 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -4235,26 +4235,32 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
-     return XML_ERROR_NONE;
-   prefixLen = 0;
-   if (parser->m_ns_triplets && binding->prefix->name) {
--    while (binding->prefix->name[prefixLen++])
--      ; /* prefixLen includes null terminator */
-+    size_t candidateLen = 0;
-+    while (binding->prefix->name[candidateLen++])
-+      ; /* candidateLen includes null terminator */
-+    /* Detect and prevent integer overflow */
-+    if (candidateLen > INT_MAX)
-+      return XML_ERROR_NO_MEMORY;
-+    prefixLen = (int)candidateLen;
-   }
-   tagNamePtr->localPart = localPart;
-   tagNamePtr->uriLen = binding->uriLen;
-   tagNamePtr->prefix = binding->prefix->name;
-   tagNamePtr->prefixLen = prefixLen;
--  for (i = 0; localPart[i++];)
--    ; /* i includes null terminator */
-+
-+  size_t localPartLen = 0;
-+  for (; localPart[localPartLen++];)
-+    ; /* localPartLen includes null terminator */
- 
-   /* Detect and prevent integer overflow */
--  if (binding->uriLen > INT_MAX - prefixLen
--      || i > INT_MAX - (binding->uriLen + prefixLen)) {
-+  if (localPartLen > INT_MAX || binding->uriLen > INT_MAX - prefixLen
-+      || localPartLen > (size_t)INT_MAX - (binding->uriLen + prefixLen)) {
-     return XML_ERROR_NO_MEMORY;
-   }
- 
--  n = i + binding->uriLen + prefixLen;
-+  n = (int)localPartLen + binding->uriLen + prefixLen;
-   if (n > binding->uriAlloc) {
-     TAG *p;
--
-     /* Detect and prevent integer overflow */
-     if (n > INT_MAX - EXPAND_SPARE) {
-       return XML_ERROR_NO_MEMORY;
-@@ -4282,10 +4288,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
-   }
-   /* if m_namespaceSeparator != '\0' then uri includes it already */
-   uri = binding->uri + binding->uriLen;
--  memcpy(uri, localPart, i * sizeof(XML_Char));
-+  /* Detect and prevent integer overflow */
-+  if (localPartLen > SIZE_MAX / sizeof(XML_Char)) {
-+    return XML_ERROR_NO_MEMORY;
-+  }
-+  memcpy(uri, localPart, localPartLen * sizeof(XML_Char));
-   /* we always have a namespace separator between localPart and prefix */
-   if (prefixLen) {
--    uri += i - 1;
-+    uri += localPartLen - 1;
-     *uri = parser->m_namespaceSeparator; /* replace null terminator */
-     memcpy(uri + 1, binding->prefix->name, prefixLen * sizeof(XML_Char));
-   }
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
deleted file mode 100644
index 62fdff79e3c..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Fri, 22 May 2026 00:43:52 +0200
-Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer overflow
-
-CVE: CVE-2026-56403
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
-
-(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/xmlwf/xmlwf.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
-index 2d0c4f8e..934473ce 100644
---- a/expat/xmlwf/xmlwf.c
-+++ b/expat/xmlwf/xmlwf.c
-@@ -305,13 +305,18 @@ processingInstruction(void *userData, const XML_Char *target,
- static XML_Char *
- xcsdup(const XML_Char *s) {
-   XML_Char *result;
--  int count = 0;
-+  size_t count = 0;
-   size_t numBytes;
- 
-   /* Get the length of the string, including terminator */
-   while (s[count++] != 0) {
-     /* Do nothing */
-   }
-+
-+  // Detect and prevent integer overflow
-+  if (count > SIZE_MAX / sizeof(XML_Char))
-+    return NULL;
-+
-   numBytes = count * sizeof(XML_Char);
-   result = malloc(numBytes);
-   if (result == NULL)
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
deleted file mode 100644
index 6bca7cf961c..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56404.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8cb4583ac3204175a03c8ea8e371adee583b0bec Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Thu, 28 May 2026 12:44:11 +0530
-Subject: [PATCH] lib: protect function addBinding from signed integer overflow
-
-CVE: CVE-2026-56404
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164]
-
-(cherry picked from commit babfc48090977cbf7be24b2c48f6053dca75c164)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 53f842d1..33b92c9c 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -4485,6 +4485,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
-   }
- 
-   for (len = 0; uri[len]; len++) {
-+    /* Detect and prevent signed integer overflow */
-+    if (len == INT_MAX) {
-+      return XML_ERROR_NO_MEMORY;
-+    }
-     if (isXML && (len > xmlLen || uri[len] != xmlNamespace[len]))
-       isXML = XML_FALSE;
- 
-@@ -4525,8 +4529,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
-   if (isXMLNS)
-     return XML_ERROR_RESERVED_NAMESPACE_URI;
- 
--  if (parser->m_namespaceSeparator)
-+  if (parser->m_namespaceSeparator) {
-+    /* Detect and prevent signed integer overflow */
-+    if (len == INT_MAX) {
-+      return XML_ERROR_NO_MEMORY;
-+    }
-     len++;
-+  }
-   if (parser->m_freeBindingList) {
-     b = parser->m_freeBindingList;
-     if (len > b->uriAlloc) {
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
deleted file mode 100644
index c850801c1ac..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56405.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 73209f445f0265b203829fa7873caa78ca83cefe Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Fri, 29 May 2026 11:45:17 +0530
-Subject: [PATCH] lib: Protect function getAttributeId from signed integer
- overflow
-
-CVE: CVE-2026-56405
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
-
-(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 1b7e289f..ec707336 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -7324,6 +7324,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
-     } else {
-       int i;
-       for (i = 0; name[i]; i++) {
-+        /* Detect and prevent signed integer overflow */
-+        if (i == INT_MAX) {
-+          return NULL;
-+        }
-         /* attributes without prefix are *not* in the default namespace */
-         if (name[i] == XML_T(ASCII_COLON)) {
-           int j;
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
deleted file mode 100644
index 6ef7c42298c..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4f828b7ee9d6efef618e8a99a0392acbb95e84f2 Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Wed, 27 May 2026 17:01:44 -0700
-Subject: [PATCH] lib: Make `XML_Index` overflow check more intuitive
-
-In fixing a bug, 7e5b71b748491b6e459e5c9a1d090820f94544d8 introduced a
-magic number `2` in this code that made it difficult to understand the
-rationale for this overflow check without reading the commit log. This
-change introduces some more readable constants to use in these
-situations.
-
-CVE: CVE-2026-56406
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd]
-
-(cherry picked from commit 252ff1a307b1490ce0f430632791e7e52d7e43fd)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 96127bf8..5ecea7a8 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -101,7 +101,7 @@
- #include <stddef.h>
- #include <string.h> /* memset(), memcpy() */
- #include <assert.h>
--#include <limits.h> /* INT_MAX, UINT_MAX */
-+#include <limits.h> /* INT_MAX, LLONG_MAX, LONG_MAX, UINT_MAX */
- #include <stdio.h>  /* fprintf */
- #include <stdlib.h> /* getenv, rand_s */
- #include <stdint.h> /* SIZE_MAX, uintptr_t */
-@@ -209,6 +209,12 @@ typedef char ICHAR;
- 
- #endif
- 
-+#ifdef XML_LARGE_SIZE
-+#  define XML_INDEX_MAX LLONG_MAX
-+#else
-+#  define XML_INDEX_MAX LONG_MAX
-+#endif
-+
- /* Round up n to be a multiple of sz, where sz is a power of 2. */
- #define ROUND_UP(n, sz) (((n) + ((sz) - 1)) & ~((sz) - 1))
- 
-@@ -2395,7 +2401,7 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
-     int nLeftOver;
-     enum XML_Status result;
-     /* Detect overflow (a+b > MAX <==> b > MAX-a) */
--    if ((XML_Size)len > ((XML_Size)-1) / 2 - parser->m_parseEndByteIndex) {
-+    if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
-       parser->m_errorCode = XML_ERROR_NO_MEMORY;
-       parser->m_eventPtr = parser->m_eventEndPtr = NULL;
-       parser->m_processor = errorProcessor;
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
deleted file mode 100644
index 4077b9946a9..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56406.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6e52f18aded0a76cf89f191d7810bc04287f5337 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Sun, 31 May 2026 15:18:58 +0200
-Subject: [PATCH] lib: Copy overflow check from `XML_Parse` to
- `XML_ParseBuffer`
-
-CVE: CVE-2026-56406
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d]
-
-(cherry picked from commit 99d8454fdf900a6d00c2a52748e6c0eeb507574d)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 5ecea7a8..71fe2c79 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -2518,6 +2518,14 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
-     parser->m_parsingStatus.parsing = XML_PARSING;
-   }
- 
-+  // Detect and avoid integer overflow
-+  if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
-+    parser->m_errorCode = XML_ERROR_NO_MEMORY;
-+    parser->m_eventPtr = parser->m_eventEndPtr = NULL;
-+    parser->m_processor = errorProcessor;
-+    return XML_STATUS_ERROR;
-+  }
-+
-   start = parser->m_bufferPtr;
-   parser->m_positionPtr = start;
-   parser->m_bufferEnd += len;
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56407.patch b/meta/recipes-core/expat/expat/CVE-2026-56407.patch
deleted file mode 100644
index 5a2a22e0172..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56407.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7216b3584bcfb2d415026d16b8902ee7eacad5ca Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Tue, 2 Jun 2026 11:59:01 +0530
-Subject: [PATCH] cap entity textLen against signed integer overflow
-
-CVE: CVE-2026-56407
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13]
-
-(cherry picked from commit 30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index 71fe2c79..8e90fea8 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -5684,6 +5684,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
-             parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
-             XML_ACCOUNT_NONE);
-         if (parser->m_declEntity) {
-+          /* Detect and prevent signed integer overflow */
-+          if ((size_t)poolLength(&dtd->entityValuePool) > (size_t)INT_MAX) {
-+            return XML_ERROR_NO_MEMORY;
-+          }
-           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
-           parser->m_declEntity->textLen
-               = (int)(poolLength(&dtd->entityValuePool));
-@@ -7099,6 +7103,11 @@ storeSelfEntityValue(XML_Parser parser, ENTITY *entity) {
-     return XML_ERROR_NO_MEMORY;
-   }
- 
-+  /* Detect and prevent signed integer overflow */
-+  if ((size_t)poolLength(pool) > (size_t)INT_MAX) {
-+    poolDiscard(pool);
-+    return XML_ERROR_NO_MEMORY;
-+  }
-   entity->textPtr = poolStart(pool);
-   entity->textLen = (int)(poolLength(pool));
-   poolFinish(pool);
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
deleted file mode 100644
index b8c43636cc0..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56408.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b0cf9e9b0f5dfdd938148931a4605a0fd6b917a7 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Thu, 23 Apr 2026 10:31:45 +0200
-Subject: [PATCH] lib: Waterproof `copyString` from integer overflow
-
-CVE: CVE-2026-56408
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
-
-Backport Changes:
-- Adapt the fix to Expat 2.7.5, which calculates charsRequired using
-  an existing loop instead of xcslen. The upstream string helper
-  refactoring is not required for the overflow guard.
-
-(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/lib/xmlparse.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
-index e441ff7f..4ff5e33b 100644
---- a/expat/lib/xmlparse.c
-+++ b/expat/lib/xmlparse.c
-@@ -8505,6 +8505,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
-   /* Include the terminator */
-   charsRequired++;
- 
-+  /* Detect and prevent integer overflow */
-+  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
-+    return NULL;
-+
-   /* Now allocate space for the copy */
-   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
-   if (result == NULL)
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
deleted file mode 100644
index ff0e650a2ab..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56409.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 10938bc2cef7573087566b5b1c948061baa68b98 Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Mon, 1 Jun 2026 11:53:19 +0530
-Subject: [PATCH] xmlwf: protect output path join from integer overflow
-
-CVE: CVE-2026-56409
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
-
-Backport Changes:
-- Adapt the allocation hunk to the explicit cast used by Expat 2.7.5.
-
-(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
-index 06416454..6a0a707a 100644
---- a/expat/xmlwf/xmlwf.c
-+++ b/expat/xmlwf/xmlwf.c
-@@ -1236,8 +1236,26 @@ tmain(int argc, XML_Char **argv) {
-         }
- #endif
-       }
--      outName = (XML_Char *)malloc((tcslen(outputDir) + tcslen(file) + 2)
--                                   * sizeof(XML_Char));
-+      const size_t outputDirLen = tcslen(outputDir);
-+      const size_t fileLen = tcslen(file);
-+
-+      /* Detect and prevent integer overflow in the addition (without
-+         risking underflow) and the multiplication, mirroring the guards
-+         in xcsdup() and resolveSystemId() */
-+      if (outputDirLen > SIZE_MAX - fileLen
-+          || outputDirLen > SIZE_MAX - fileLen - 2) {
-+        tperror(T("Could not allocate memory"));
-+        exit(XMLWF_EXIT_INTERNAL_ERROR);
-+      }
-+
-+      const size_t charsRequired = outputDirLen + fileLen + 2;
-+
-+      if (charsRequired > SIZE_MAX / sizeof(XML_Char)) {
-+        tperror(T("Could not allocate memory"));
-+        exit(XMLWF_EXIT_INTERNAL_ERROR);
-+      }
-+
-+      outName = malloc(charsRequired * sizeof(XML_Char));
-       if (! outName) {
-         tperror(T("Could not allocate memory"));
-         exit(XMLWF_EXIT_INTERNAL_ERROR);
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
deleted file mode 100644
index aa4378f1b77..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 759b77a8439bcbf57c86900bc472d46d8ef70c92 Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Fri, 29 May 2026 17:51:25 +0530
-Subject: [PATCH] xmlwf: protect resolveSystemId from integer overflow
-
-CVE: CVE-2026-56410
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
-
-Backport Changes:
-- Adjust the removed allocation line for Wrynose's explicit malloc cast while
-  keeping upstream's overflow checks and final allocation logic.
-
-(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/xmlwf/xmlfile.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
-index c4eb839f..31a40209 100644
---- a/expat/xmlwf/xmlfile.c
-+++ b/expat/xmlwf/xmlfile.c
-@@ -138,8 +138,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
- #endif
-   )
-     return systemId;
--  *toFree = (XML_Char *)malloc((tcslen(base) + tcslen(systemId) + 2)
--                               * sizeof(XML_Char));
-+  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
-+
-+  /* Detect and prevent integer overflow */
-+  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
-+    return systemId;
-+
-+  *toFree = malloc(charsRequired * sizeof(XML_Char));
-   if (! *toFree)
-     return systemId;
-   tcscpy(*toFree, base);
--- 
-2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
deleted file mode 100644
index 71f3122602a..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f16fa442eaa81bfceec5302d977219959eaac7b7 Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Sat, 30 May 2026 11:28:51 +0530
-Subject: [PATCH] xmlwf: guard each operator in resolveSystemId length sum
-
-CVE: CVE-2026-56410
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea]
-
-(cherry picked from commit cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/xmlwf/xmlfile.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
-index 31a40209..15c69217 100644
---- a/expat/xmlwf/xmlfile.c
-+++ b/expat/xmlwf/xmlfile.c
-@@ -139,9 +139,17 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
- #endif
-   )
-     return systemId;
--  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
-+  const size_t baseLen = tcslen(base);
-+  const size_t systemIdLen = tcslen(systemId);
- 
--  /* Detect and prevent integer overflow */
-+  /* Detect and prevent integer overflow in the addition (without risking
-+     underflow) */
-+  if (baseLen > SIZE_MAX - systemIdLen || baseLen > SIZE_MAX - systemIdLen - 2)
-+    return systemId;
-+
-+  const size_t charsRequired = baseLen + systemIdLen + 2;
-+
-+  /* Detect and prevent integer overflow in the multiplication */
-   if (charsRequired > SIZE_MAX / sizeof(XML_Char))
-     return systemId;
- 
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
deleted file mode 100644
index 884837b61e1..00000000000
--- a/meta/recipes-core/expat/expat/CVE-2026-56411.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e447d5d72884a1246894f111a5b72de4e479152e Mon Sep 17 00:00:00 2001
-From: netliomax25-code <netliomax25@gmail.com>
-Date: Tue, 2 Jun 2026 13:13:34 +0530
-Subject: [PATCH] xmlwf: protect notation list allocation from integer overflow
-
-CVE: CVE-2026-56411
-Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
-
-(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- expat/xmlwf/xmlwf.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
-index 6a0a707a..a9640190 100644
---- a/expat/xmlwf/xmlwf.c
-+++ b/expat/xmlwf/xmlwf.c
-@@ -383,9 +383,9 @@ static void XMLCALL
- endDoctypeDecl(void *userData) {
-   XmlwfUserData *data = (XmlwfUserData *)userData;
-   NotationList **notations;
--  int notationCount = 0;
-+  size_t notationCount = 0;
-   NotationList *p;
--  int i;
-+  size_t i;
- 
-   /* How many notations do we have? */
-   for (p = data->notationListHead; p != NULL; p = p->next)
-@@ -395,6 +395,13 @@ endDoctypeDecl(void *userData) {
-     goto cleanUp;
-   }
- 
-+  /* Detect and prevent integer overflow in the multiplication, mirroring
-+     the guards in xcsdup() and resolveSystemId() */
-+  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
-+    fprintf(stderr, "Unable to sort notations");
-+    goto cleanUp;
-+  }
-+
-   notations = malloc(notationCount * sizeof(NotationList *));
-   if (notations == NULL) {
-     fprintf(stderr, "Unable to sort notations");
--- 
-2.43.7
-
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
deleted file mode 100644
index da35b8f9ff5..00000000000
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY = "A stream-oriented XML parser library"
-DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
-HOMEPAGE = "https://github.com/libexpat/libexpat"
-SECTION = "libs"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2"
-
-VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
-
-SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
-           file://run-ptest \
-           file://CVE-2026-45186-01.patch \
-           file://CVE-2026-45186-02.patch \
-           file://CVE-2026-45186-03.patch \
-           file://CVE-2026-45186-04.patch \
-           file://CVE-2026-45186-05.patch \
-           file://CVE-2026-45186-06.patch \
-           file://CVE-2026-45186-07.patch \
-           file://CVE-2026-41080-1.patch \
-           file://CVE-2026-41080-2.patch \
-           file://CVE-2026-56403_p1.patch;striplevel=2 \
-           file://CVE-2026-56403_p2.patch;striplevel=2 \
-           file://CVE-2026-56408.patch;striplevel=2 \
-           file://CVE-2026-56404.patch;striplevel=2 \
-           file://CVE-2026-56405.patch;striplevel=2 \
-           file://CVE-2026-56410_p1.patch;striplevel=2 \
-           file://CVE-2026-56410_p2.patch;striplevel=2 \
-           file://CVE-2026-56406-dependent.patch;striplevel=2 \
-           file://CVE-2026-56406.patch;striplevel=2 \
-           file://CVE-2026-56409.patch;striplevel=2 \
-           file://CVE-2026-56411.patch;striplevel=2 \
-           file://CVE-2026-56407.patch;striplevel=2 \
-           file://CVE-2026-56132_p1.patch;striplevel=2 \
-           file://CVE-2026-56132_p2.patch;striplevel=2 \
-           file://CVE-2026-56132_p3.patch;striplevel=2 \
-           file://CVE-2026-56132_p4.patch;striplevel=2 \
-           file://CVE-2026-56132_p5.patch;striplevel=2 \
-           "
-
-GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
-
-SRC_URI[sha256sum] = "386a423d40580f1e392e8b512b7635cac5083fe0631961e74e036b0a7a830d77"
-
-EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
-
-RDEPENDS:${PN}-ptest += "bash"
-
-inherit cmake lib_package ptest github-releases
-
-do_install_ptest:class-target() {
-	install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
-	install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
-}
-
-BBCLASSEXTEND += "native nativesdk"
-
-CVE_PRODUCT = "expat libexpat"
-
-CVE_STATUS[CVE-2026-72522] = "not-applicable-config: Needs Expat compiled with 16bit character support , Issue only affects firefox/Windows. \
-EXPAT_CHAR_TYPE:STRING=char is for Yocto builds"
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
new file mode 100644
index 00000000000..79e8c15227a
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -0,0 +1,33 @@
+SUMMARY = "A stream-oriented XML parser library"
+DESCRIPTION = "Expat is an XML parser library written in C. It is a stream-oriented parser in which an application registers handlers for things the parser might find in the XML document (like start tags)"
+HOMEPAGE = "https://github.com/libexpat/libexpat"
+SECTION = "libs"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2"
+
+VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
+
+SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
+           file://run-ptest \
+           "
+
+GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
+
+SRC_URI[sha256sum] = "b4cc2483927d5e90bf8c40b44a6b95b368b42a8a96e25883fce188b48a92b670"
+
+EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
+
+RDEPENDS:${PN}-ptest += "bash"
+
+inherit cmake lib_package ptest github-releases
+
+do_install_ptest:class-target() {
+	install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
+	install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
+}
+
+BBCLASSEXTEND += "native nativesdk"
+
+CVE_PRODUCT = "expat libexpat"

