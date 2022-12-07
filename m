Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECB8C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 08:07:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10268.1670400440832476007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 00:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112 header.b=f8Hy4DKq;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.48, mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f48.google.com with SMTP id bx10so26982106wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 00:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ4beAtiRYTKFo3YkrCNSwyq0sSe4IfRkJBEzxwAtj8=;
        b=f8Hy4DKqgs9U86XJAecHOn06TCpPp/nK/cZtAH41n1LErPaCdBjU/ilJtvmLQFOkd9
         xYfGWSyOUuga3mBYuYHhF1pX9p0f3IyZVMkF5YyzGKIL0Tsj/2FWM9rGsZm1Whb809kc
         GkiTdT917rimkT7myBX3R926SRHu81AQTK/8RAjarrJjXvE06yneRsJjqHFWYnbXeL1K
         1FTy7o4nJC6mxauFmkqQZ0DC2xQlpuE99iZEGwBTGkb9MaL1tSMH7jCSPUqIqVcSSIr5
         U1ptlA/vfl5yj4QbfWcaZmJcM6dpitvcTxrOGNw5SMnPpebhYzvdqT8c3pBcVFJNaiPX
         4s/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQ4beAtiRYTKFo3YkrCNSwyq0sSe4IfRkJBEzxwAtj8=;
        b=Z+ziEuRm6XsnkJIdpvC4alRbuxFpJAJf6sA2T+G02pJT7A2UqGIGdSNgHiYdtW72A/
         8+UVEPpmNo0qAe9lRJ7GhLGaMN715i/hpAsWO7Lt9/yh1RD8nBpeVTS4vVfL68Jf5AuH
         kL+J47TFOLdiaIWOtkpzW6o6Y2A3ACQZyWWOfkdddRqD6OnoKRlf1Ajd7+25Tzr/eU1i
         C5aLAF7S+B1BZIxKcC/6Y6582rTjkfmxoiSP1vjBgNKCoc0Akygy1fX4WCCpur97J+8w
         VU8xLIk5e+FPiWZ+GCiQpMluDqb0AVMIaJXkI4tcGMKBZNFLwRAxjMV0UZ3wVcedUUvj
         Pn8Q==
X-Gm-Message-State: ANoB5pkCgnzeIfOG4sIMqlT8RQRSb0zT87oN0EY8IfPKC5d8Kdidg5bZ
	U6w4Gk0Q9E4eWk7rZ1njT537W9whYvJ5Q4bD
X-Google-Smtp-Source: AA0mqf59Tm4tagkMW6YURyX4XTgZrVBHR509BPt6FSMfV76ZEWVSKpH/HPwnCNNgJuMBiUa8FPPf1A==
X-Received: by 2002:a5d:6741:0:b0:242:1dbd:2b19 with SMTP id l1-20020a5d6741000000b002421dbd2b19mr25491559wrw.431.1670400437034;
        Wed, 07 Dec 2022 00:07:17 -0800 (PST)
Received: from WIPC21110265.. ([2a01:e0a:a66:3180:c091:5ea2:164e:f210])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b0024274a5db0asm3954448wru.2.2022.12.07.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 00:07:16 -0800 (PST)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-core@lists.openembedded.org
Cc: open.source@oleksandr-kravchuk.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [dunfell][PATCH] Python3: Update stable branch 3.8.14 -> 3.8.16
Date: Wed,  7 Dec 2022 09:07:00 +0100
Message-Id: <20221207080700.1103676-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 08:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174344

---
 .../python/files/CVE-2022-45061.patch         | 100 ------------------
 .../{python3_3.8.14.bb => python3_3.8.16.bb}  |   5 +-
 2 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
 rename meta/recipes-devtools/python/{python3_3.8.14.bb => python3_3.8.16.bb} (98%)

diff --git a/meta/recipes-devtools/python/files/CVE-2022-45061.patch b/meta/recipes-devtools/python/files/CVE-2022-45061.patch
deleted file mode 100644
index 647bf59908d3..000000000000
--- a/meta/recipes-devtools/python/files/CVE-2022-45061.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 064ec20bf7a181ba5fa961aaa12973812aa6ca5d Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 7 Nov 2022 18:57:10 -0800
-Subject: [PATCH] [3.11] gh-98433: Fix quadratic time idna decoding. (GH-99092)
- (GH-99222)
-
-There was an unnecessary quadratic loop in idna decoding. This restores
-the behavior to linear.
-
-(cherry picked from commit d315722564927c7202dd6e111dc79eaf14240b0d)
-
-(cherry picked from commit a6f6c3a3d6f2b580f2d87885c9b8a9350ad7bf15)
-
-Co-authored-by: Miss Islington (bot) <31488909+miss-islington@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-CVE: CVE-2022-45061
-Upstream-Status: Backport [https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d]
-Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
-
----
- Lib/encodings/idna.py                         | 32 +++++++++----------
- Lib/test/test_codecs.py                       |  6 ++++
- ...2-11-04-09-29-36.gh-issue-98433.l76c5G.rst |  6 ++++
- 3 files changed, 27 insertions(+), 17 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-
-diff --git a/Lib/encodings/idna.py b/Lib/encodings/idna.py
-index ea4058512fe3..bf98f513366b 100644
---- a/Lib/encodings/idna.py
-+++ b/Lib/encodings/idna.py
-@@ -39,23 +39,21 @@ def nameprep(label):
- 
-     # Check bidi
-     RandAL = [stringprep.in_table_d1(x) for x in label]
--    for c in RandAL:
--        if c:
--            # There is a RandAL char in the string. Must perform further
--            # tests:
--            # 1) The characters in section 5.8 MUST be prohibited.
--            # This is table C.8, which was already checked
--            # 2) If a string contains any RandALCat character, the string
--            # MUST NOT contain any LCat character.
--            if any(stringprep.in_table_d2(x) for x in label):
--                raise UnicodeError("Violation of BIDI requirement 2")
--
--            # 3) If a string contains any RandALCat character, a
--            # RandALCat character MUST be the first character of the
--            # string, and a RandALCat character MUST be the last
--            # character of the string.
--            if not RandAL[0] or not RandAL[-1]:
--                raise UnicodeError("Violation of BIDI requirement 3")
-+    if any(RandAL):
-+        # There is a RandAL char in the string. Must perform further
-+        # tests:
-+        # 1) The characters in section 5.8 MUST be prohibited.
-+        # This is table C.8, which was already checked
-+        # 2) If a string contains any RandALCat character, the string
-+        # MUST NOT contain any LCat character.
-+        if any(stringprep.in_table_d2(x) for x in label):
-+            raise UnicodeError("Violation of BIDI requirement 2")
-+        # 3) If a string contains any RandALCat character, a
-+        # RandALCat character MUST be the first character of the
-+        # string, and a RandALCat character MUST be the last
-+        # character of the string.
-+        if not RandAL[0] or not RandAL[-1]:
-+            raise UnicodeError("Violation of BIDI requirement 3")
- 
-     return label
- 
-diff --git a/Lib/test/test_codecs.py b/Lib/test/test_codecs.py
-index d1faf0126c1e..37ade7d80d02 100644
---- a/Lib/test/test_codecs.py
-+++ b/Lib/test/test_codecs.py
-@@ -1532,6 +1532,12 @@ def test_builtin_encode(self):
-         self.assertEqual("pyth\xf6n.org".encode("idna"), b"xn--pythn-mua.org")
-         self.assertEqual("pyth\xf6n.org.".encode("idna"), b"xn--pythn-mua.org.")
- 
-+    def test_builtin_decode_length_limit(self):
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*1100).decode("idna")
-+        with self.assertRaisesRegex(UnicodeError, "too long"):
-+            (b"xn--016c"+b"a"*70).decode("idna")
-+
-     def test_stream(self):
-         r = codecs.getreader("idna")(io.BytesIO(b"abc"))
-         r.read(3)
-diff --git a/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-new file mode 100644
-index 000000000000..5185fac2e29d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-11-04-09-29-36.gh-issue-98433.l76c5G.rst
-@@ -0,0 +1,6 @@
-+The IDNA codec decoder used on DNS hostnames by :mod:`socket` or :mod:`asyncio`
-+related name resolution functions no longer involves a quadratic algorithm.
-+This prevents a potential CPU denial of service if an out-of-spec excessive
-+length hostname involving bidirectional characters were decoded. Some protocols
-+such as :mod:`urllib` http ``3xx`` redirects potentially allow for an attacker
-+to supply such a name.
diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb b/meta/recipes-devtools/python/python3_3.8.16.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.14.bb
rename to meta/recipes-devtools/python/python3_3.8.16.bb
index cbf57684cae8..e338cc017788 100644
--- a/meta/recipes-devtools/python/python3_3.8.14.bb
+++ b/meta/recipes-devtools/python/python3_3.8.16.bb
@@ -34,7 +34,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://makerace.patch \
-           file://CVE-2022-45061.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -43,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "78710eed185b71f4198d354502ff62c9"
-SRC_URI[sha256sum] = "5d77e278271ba803e9909a41a4f3baca006181c93ada682a5e5fe8dc4a24c5f3"
+SRC_URI[md5sum] = "621ac153586a3152e2ab7d3a8614df9a"
+SRC_URI[sha256sum] = "d85dbb3774132473d8081dcb158f34a10ccad7a90b96c7e50ea4bb61f5ce4562"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


