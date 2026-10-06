Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FB2CA600B
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48820.1791301589972510631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yrBkT5BH;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0584ad71so699250f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301588; x=1791906388; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLshmaqadcAN9SyI+ulcVX5LFGf9BwDaRBpX82jzluE=;
        b=yrBkT5BHknsJrETsO0h+zrWTRrLRnCbg4F5vSqaM5TFfGnU9NYwyxbRPK+JlXD5zsm
         kf/vUn2z2QrUnZAu4rRhHI/ptZOZAw6htWHJtfeD09/bEnF5QCqHEpaqqoDxkymbCq7e
         iiKtlM9ofRXVCTYPdn3DHawEppk+MCDO6T5mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301588; x=1791906388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLshmaqadcAN9SyI+ulcVX5LFGf9BwDaRBpX82jzluE=;
        b=1I2ky0TU7MjbtbRfQP2wM6Y97XzRBMO/T60mDzwMfCfujK99ZWE3yV6HfcvtpEtV5G
         odYy4ziTpaIa9FV08ZGgELRhQrKydDAwjF82v3oC6NQ78RCATGIbvCjdjRZRyPivLpr3
         h7dAJDQe1TNHmxcfF/VOOHIR2GS30RT/gd4qj8rSQSZ/MMiQ1aC/mEMe3wgkyYTSEzN9
         E20uOhI9XV4VGnar/zBhq2zUaNcE+/bnij3U+UP7r9MydJUNXCMB7hN4rieR/vg5/jIG
         vP3rstUoWGNWiOPsPsaQleqymD5Y2Sn8EEXQBuKpi/rJnvVsOGth59ShRvIGUf1Fezpt
         41UQ==
X-Gm-Message-State: AFq9FYLwKe8SmosZrVgfjFZmy4J/9mIUBaxvGdM20PQ6O7ew9jAKI2Qo
	Y8DSfFdUJHPTuiHzajAYoAuL8zxUzwX7/GGs2zedj2xvA/+mVHl4VilnRn/gTXbxKNMJJfp8S8u
	03g16q1Y=
X-Gm-Gg: AYBFou12QM0uvVkLlesXOuWBjM3z/CJiXxi9l/HIKsK1S4DuaorUThWSOicovUf7AdK
	XIzE7tSt4vDtTMSsThoOUXkqTxB0y3+FFkxjf9unfoMg+n15NGtapB7nn3Utm0euFtEwtphDRIo
	X9VZmtMmU9BL8iej+ildf+wPvssZSqgUZDnexozpLUbUFXovXlAH6TBnmHgaJNwyiDiiSGfuoCJ
	MEBrB3+AxZ0aSUta3K52e9gPofoxjMDzitBflhX7BDfMjesOnfhcx7es1320VHpzTMMcl5aofFM
	36WMBKrOmHLZv4+BzsmzEb4uedA18kgf+G5wA2617PX0rmTWjPldtFhZdGuSuNj9SRjGLTTLfCx
	M5Aq24aS165u9j+fUQAY3axsDpKx55xWWmCeWb+7J9TzeR6Yyatwxsv7GFGsnWs5eFPFH2r2S3r
	lsm2WdDrUmr00A4RgzBsaew2Yxyc3Y20B5gJmTsAU3P6C8ZblbtWLnV2n1T1gEZflhVJxWJbiq9
	tM8v0hvhnAjowi+L+YyXehVANlsoZue1LYJmf+UgAmbiazcO6oQtM0meFdJqR4ONZIWDo9PRzQQ
	8Ohk9BRmkPcLF1SF
X-Received: by 2002:a05:6000:2512:b0:48b:1119:5756 with SMTP id ffacd0b85a97d-48c6d1563ecmr3183711f8f.17.1791301587336;
        Tue, 06 Oct 2026 08:46:27 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 06/19] libpcre2-ptest: add testoutput3C for locale variant
Date: Tue,  6 Oct 2026 17:45:52 +0200
Message-ID: <fa8d7ef597d9016673d5838e2c58483effb0e7b4.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247295

From: Bhavikkumar Girishbhai Ronvelia <BhavikkumarGirishbhai.Ronvelia@windriver.com>

Test 3 (locale-specific features) fails because testoutput3C is missing
from the PCRE2 10.48 release tarball. It exists on upstream main branch
and will be in the next release. This carries it until OE bumps to that
version.

On systems where glibc fr_FR locale does not classify extended Latin-1
bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic, none of the existing
expected outputs (3, 3A, 3B) match, causing Test 3 to fail.

testoutput3C was generated on the target by running:
  ./RunTest 3
  cp testoutput8/testoutput3 testdata/testoutput3C

The file is installed into the ptest testdata directory at package time,
following the same pattern as the existing run-ptest file.

Signed-off-by: Bhavikkumar Girishbhai Ronvelia <BhavikkumarGirishbhai.Ronvelia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c447001749427b151dc2e6f08c790bac77b1c43)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/testoutput3C             | 174 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.48.bb |   2 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C

diff --git a/meta/recipes-support/libpcre/libpcre2/testoutput3C b/meta/recipes-support/libpcre/libpcre2/testoutput3C
new file mode 100644
index 00000000000..2af67a8d036
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/testoutput3C
@@ -0,0 +1,174 @@
+# This set of tests checks local-specific features, using the "fr_FR" locale. 
+# It is almost Perl-compatible. When run via RunTest, the locale is edited to
+# be whichever of "fr_FR", "french", or "fr" is found to exist. There is
+# different version of this file called wintestinput3 for use on Windows,
+# where the locale is called "french" and the tests are run using
+# RunTest.bat. 
+
+#forbid_utf
+
+/^[\w]+/
+\= Expect no match
+    �cole
+No match
+
+/^[\w]+/locale=fr_FR
+    �cole
+No match
+
+/^[\W]+/
+    �cole
+ 0: \xc9
+
+/^[\W]+/locale=fr_FR
+\= Expect no match
+    �cole
+ 0: \xc9
+
+/[\b]/
+    \b
+ 0: \x08
+\= Expect no match
+    a
+No match
+
+/[\b]/locale=fr_FR
+    \b
+ 0: \x08
+\= Expect no match
+    a
+No match
+
+/^\w+/
+\= Expect no match
+    �cole
+No match
+
+/^\w+/locale=fr_FR
+    �cole
+No match
+
+/(.+)\b(.+)/
+    �cole
+ 0: \xc9cole
+ 1: \xc9
+ 2: cole
+
+/(.+)\b(.+)/locale=fr_FR
+\= Expect no match
+    �cole
+ 0: \xc9cole
+ 1: \xc9
+ 2: cole
+
+/�cole/i
+    �cole
+ 0: \xc9cole
+\= Expect no match
+    �cole
+No match
+
+/�cole/i,locale=fr_FR
+    �cole
+ 0: \xc9cole
+    �cole
+No match
+
+/\w/I
+Capture group count = 0
+Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
+  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x y z
+Subject length lower bound = 1
+
+/\w/I,locale=fr_FR
+Capture group count = 0
+Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
+  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x y z
+Subject length lower bound = 1
+
+# All remaining tests are in the fr_FR locale, so set the default.
+
+#pattern locale=fr_FR
+
+/^[\xc8-\xc9]/i
+    �cole
+ 0: \xc9
+    �cole
+No match
+
+/^[\xc8-\xc9]/
+    �cole
+ 0: \xc9
+\= Expect no match
+    �cole
+No match
+
+/\xb5/i
+    �
+ 0: \xb5
+\= Expect no match
+    \x9c
+No match
+
+/�/i
+    \xff
+ 0: \xff
+\= Expect no match
+    y
+No match
+
+/(.)\1/i
+    \xfe\xde
+No match
+
+/\W+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<< 
+ 0: >>>\xba<<<
+
+/[\W]+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<< 
+ 0: >>>\xba<<<
+
+/[^[:alpha:]]+/
+    >>>\xaa<<<
+ 0: >>>\xaa<<<
+    >>>\xba<<< 
+ 0: >>>\xba<<<
+
+/\w+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<< 
+No match
+
+/[\w]+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<< 
+No match
+
+/[[:alpha:]]+/
+    >>>\xaa<<<
+No match
+    >>>\xba<<< 
+No match
+    
+/[[:alpha:]][[:lower:]][[:upper:]]/IB
+------------------------------------------------------------------
+        Bra
+        [A-Za-z]
+        [a-z]
+        [A-Z]
+        Ket
+        End
+------------------------------------------------------------------
+Capture group count = 0
+Starting code units: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
+  a b c d e f g h i j k l m n o p q r s t u v w x y z
+Subject length lower bound = 3
+
+# End of testinput3 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipes-support/libpcre/libpcre2_10.48.bb
index d5daff03c0e..56791171c23 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.48.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
+           file://testoutput3C \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
@@ -63,6 +64,7 @@ BBCLASSEXTEND = "native nativesdk"
 do_install_ptest() {
     t=${D}${PTEST_PATH}
     cp -r ${S}/testdata $t
+    cp ${UNPACKDIR}/testoutput3C $t/testdata/testoutput3C
 
     for i in pcre2posix_test pcre2grep pcre2test; do
         "${B}/libtool" --mode=install install "${B}/$i" "$t"

