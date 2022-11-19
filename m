Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3BCC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:08 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.26039.1668880082241181972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GBEJJyiV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id f3so7683615pgc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfQgRLUijI/VHAAqENJBkHD48BaaU9IDiUBit2ygm/w=;
        b=GBEJJyiVyb7qQitdsp5LZXpQlrcIdn0iyWM5jhI46jjQqJ9r7QTQofQ8Hdh/1czuXM
         ZASseLBMfFMHgcffHC3OByqWvrCmFR5Ut36lPgxcJGV1mP63fdDiy0Gwp820n2VLQ6Zp
         E536rGnteu/iLOlQ4jd1FjMbfwpVAJ4tkBdNh5vonDrs6b7LJ0+vuGegT0K8b8uG9lCY
         0A9MC0v+TKf3TQDKM2n0FQHiAbjIkGnmJB3d/BvhEUbOyhRuYfc3jUpkmrcb1vH3ET8w
         qj0OsWfQLyXo9jHPe6bHFjvs1l2CBOT4svMC6E9puSRP1/Yfwc9XadUusWnGDt0Bfs5C
         vqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfQgRLUijI/VHAAqENJBkHD48BaaU9IDiUBit2ygm/w=;
        b=3zyx8LwrzRo6LqAKyML3oBex+Xhseuu+WKVeZQ5XzqFaI5NpF9u2r/4cqyK6SAR3HF
         Ckig79ZfNiAxTSJ7ErKquBHixe+UPD7yeCGsENxnVt0zCzZNZZ90JxNUSnPTuhTWnXxU
         +BqdI0LO5MH3xFqorCDddr1mkpDMSKYy9RraeqbOkQCPfaNxVFP7j4nf/hEJfDFX5q9+
         RRgIOkOnD/qmx/L55HRahGUKhmM5LWeGoWAUQM3UKrzHrVA8v1Y749U0TUnx7B0i2TCC
         MugAtKm3dxtyTwKML0NR9wWaGITI/Dxi5fGBWjIlx+O82jmevPRm4qWgu9VJnC/dDeSg
         WxvQ==
X-Gm-Message-State: ANoB5pm9mD47RBBJuhnAcji4GAp9BHo0SO+M3s/ZoBDJRYdkwjCfvfKy
	xcKb4tvlWSql24egMdTVa/hKVXnw5glNt8gZy3g=
X-Google-Smtp-Source: AA0mqf6uanJqr/eYmqVXynN2nOgG3Zg2IzNbV33rZ33SqaNnFgXFpzFkkFSZQOBYaGP04Tk3a+C+/w==
X-Received: by 2002:a63:134a:0:b0:476:bfca:112d with SMTP id 10-20020a63134a000000b00476bfca112dmr11611562pgt.574.1668880081146;
        Sat, 19 Nov 2022 09:48:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/21] python3: Fix CVE-2022-45061
Date: Sat, 19 Nov 2022 07:47:31 -1000
Message-Id: <a9167a588b3579c37412359a3e13a68b809b0c2d.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173521

From: Omkar <omkar.patil@kpit.com>

Fix CVE-2022-45061, referenced as
https://github.com/python/cpython/issues/98433
patch taken from
https://github.com/python/cpython/pull/99231/commits/064ec20bf7a181ba5fa961aaa12973812aa6ca5d

Signed-off-by: Omkar <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


