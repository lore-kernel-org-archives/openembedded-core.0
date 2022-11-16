Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A1CC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 05:20:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.3393.1668576047472381131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 21:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K9GH5K7Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id l2so15397031pld.13
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 21:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQPt9KGh797qv9qSZ+sUjsMNCZ/LWEw52tsQ+vz5UJQ=;
        b=K9GH5K7YLFR1/MFTflHw/KjBon8oVVE0BMoW/cgDP6MOGK50kN0nw3jujaLh0f3gbV
         XbQQgzz7ZCo+WpcUMcH5qCpN8PsGjcsQpXjxk9nwAtvhtXtTTT3ucQCWJs21qzt/PozK
         ndbTOLWXvyCzqC9RvZPMbNaFmgVLjVgOBIbAOYleVGNSiSfEs0Jc/4Nsomey61dQ5DmU
         2WmHaKX6I3fhN76A95lWuvxT7a+5d2s8lMcscbE9dQGwJq1UcUK/T2ex4CJ+9+O/Lj9o
         sPv4iKtqt7C5eQOgZY/x8S7zkFliJkbfm7II93kKH/nnVd2QueGJClZKtZbxNqBO/yxh
         b14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQPt9KGh797qv9qSZ+sUjsMNCZ/LWEw52tsQ+vz5UJQ=;
        b=0PSdEY5vXtCG87mCeh2V0DRRzUXUttRHJz57Ljh2RAmJACDXtdajEz70jNCthPDUxV
         QrRJN9+kxnUOiz6CzKDoUykHeaiBeFhAadHIJ46/918dyzLGp/E0K7GMqpOVWWIA+bln
         oQw0dLQ4rDTrfRDYKAypXwHOxz1L9Po7xdYmfWxg9mwTKlJiBL2aBrBiEf97NCrili8J
         Xem6Im1NkO6yfr68iNIIm4iRjdfPmEHGDVWlquyW2aeTQveOmYrHWAKlRLmsvmJMUTmp
         LhHvNNkxX3+GFMCaeakaj4mRlPWQaUF9oqR0wgADfstEanRfKWWTf5yKnJbm230ci7Y+
         DjPA==
X-Gm-Message-State: ANoB5pnpyDSlwz2GOmCGbSNF2KM1fYDIEoSIfH0eM23yl7xA+yfF7G7A
	sLoJjfmQrd8t7xu5Uaoly8HB48DMyVk=
X-Google-Smtp-Source: AA0mqf4FKS7f5kn6yKP+lWWCwAkX02Z3Mv96FBXcVn/6f7DYLfUxUr7ER3pOCrh091WnmUqP4s2AcQ==
X-Received: by 2002:a17:90b:188a:b0:213:16d2:4d4c with SMTP id mn10-20020a17090b188a00b0021316d24d4cmr2035967pjb.70.1668576046201;
        Tue, 15 Nov 2022 21:20:46 -0800 (PST)
Received: from localhost.localdomain ([2409:4042:4e02:b7cf:7864:cc87:c985:cfd1])
        by smtp.gmail.com with ESMTPSA id cq17-20020a17090af99100b0020aaa678098sm509364pjb.49.2022.11.15.21.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 21:20:45 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar <omkarpatil10.93@gmail.com>
Subject: [OE-core][dunfell][PATCH] python3: Fix CVE-2022-45061
Date: Wed, 16 Nov 2022 10:50:36 +0530
Message-Id: <20221116052036.13669-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173377

From: Omkar <omkar.patil@kpit.com>

Fix CVE-2022-45061, referenced as
https://github.com/python/cpython/issues/98433
patch taken from
https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d

Signed-off-by: Omkar <omkarpatil10.93@gmail.com>
---
 .../python/files/CVE-2022-45061.patch         | 100 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch

diff --git a/meta/recipes-devtools/python/files/CVE-2022-45061.patch b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
new file mode 100644
index 0000000000..647bf59908
--- /dev/null
+++ b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
@@ -0,0 +1,100 @@
+From 064ec20bf7a181ba5fa961aaa12973812aa6ca5d Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 7 Nov 2022 18:57:10 -0800
+Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
+ (GH-99222)
+
+There was an unnecessary quadratic loop in idna decoding. This restores
+the behavior to linear.
+
+(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
+
+(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
+
+Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+CVE: CVE-2022-45061
+Upstream-Status: Backport [https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d]
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ Lib/encodings/idna.py                         | 32 +++++++++----------
+ Lib/test/test_codecs.py                       |  6 ++++
+ ...2-11-04-09-29-36.gh-issue-98433.l76c5G.rst |  6 ++++
+ 3 files changed, 27 insertions(+), 17 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
+
+diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
+index ea4058512fe3..bf98f513366b 100644
+--- a/Lib/encodings/idna.py
++++ b/Lib/encodings/idna.py
+@@ -39,23 +39,21 @@ def nameprep(label):
+ 
+     # Check bidi
+     RandAL = [stringprep.in_table_d1(x) for x in label]
+-    for c in RandAL:
+-        if c:
+-            # There is a RandAL char in the string. Must perform further
+-            # tests:
+-            # 1) The characters in section 5.8 MUST be prohibited.
+-            # This is table C.8, which was already checked
+-            # 2) If a string contains any RandALCat character, the string
+-            # MUST NOT contain any LCat character.
+-            if any(stringprep.in_table_d2(x) for x in label):
+-                raise UnicodeError("Violation of BIDI requirement 2")
+-
+-            # 3) If a string contains any RandALCat character, a
+-            # RandALCat character MUST be the first character of the
+-            # string, and a RandALCat character MUST be the last
+-            # character of the string.
+-            if not RandAL[0] or not RandAL[-1]:
+-                raise UnicodeError("Violation of BIDI requirement 3")
++    if any(RandAL):
++        # There is a RandAL char in the string. Must perform further
++        # tests:
++        # 1) The characters in section 5.8 MUST be prohibited.
++        # This is table C.8, which was already checked
++        # 2) If a string contains any RandALCat character, the string
++        # MUST NOT contain any LCat character.
++        if any(stringprep.in_table_d2(x) for x in label):
++            raise UnicodeError("Violation of BIDI requirement 2")
++        # 3) If a string contains any RandALCat character, a
++        # RandALCat character MUST be the first character of the
++        # string, and a RandALCat character MUST be the last
++        # character of the string.
++        if not RandAL[0] or not RandAL[-1]:
++            raise UnicodeError("Violation of BIDI requirement 3")
+ 
+     return label
+ 
+diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
+index d1faf0126c1e..37ade7d80d02 100644
+--- a/Lib/test/test_codecs.py
++++ b/Lib/test/test_codecs.py
+@@ -1532,6 +1532,12 @@ def test_builtin_encode(self):
+         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
+         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
+ 
++    def test_builtin_decode_length_limit(self):
++        with self.assertRaisesRegex(UnicodeError, "too long"):
++            (b"xn--016c"+b"a"*1100).decode("idna")
++        with self.assertRaisesRegex(UnicodeError, "too long"):
++            (b"xn--016c"+b"a"*70).decode("idna")
++
+     def test_stream(self):
+         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
+         r.read(3)
+diff --git a/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
+new file mode 100644
+index 000000000000..5185fac2e29d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
+@@ -0,0 +1,6 @@
++The IDNA codec decoder used on DNS hostnames by :mod:`socket` or :mod:`asyncio`
++related name resolution functions no longer involves a quadratic algorithm.
++This prevents a potential CPU denial of service if an out-of-spec excessive
++length hostname involving bidirectional characters were decoded. Some protocols
++such as :mod:`urllib` http ``3xx`` redirects potentially allow for an attacker
++to supply such a name.
diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
index 035eda9ecd..cbf57684ca 100644
--- a/meta/recipes-devtools/python/python3_3.8.14.bb
+++ b/meta/recipes-devtools/python/python3_3.8.14.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
+           file://CVE-2022-45061.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


