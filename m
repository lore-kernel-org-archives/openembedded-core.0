Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3201CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5167.1791319458948495471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wR6eSps5;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so9444095e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319457; x=1791924257; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLshmaqadcAN9SyI+ulcVX5LFGf9BwDaRBpX82jzluE=;
        b=wR6eSps5f/cbHRFYsnEC8DC70m4OH9M0OB5pA6hpk076/5L0V4KSYcSSOn9f+mKCE8
         Uor+Nf5+8YzSpgRUTgjJyf/RB3sG9pfTPWG6+FclaR8hkmjjBosoo2BLNRfhg+imsMZG
         nL2GIPHPwmyTJJYo6AJCkyLmPXTjkvXzUcv1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319457; x=1791924257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLshmaqadcAN9SyI+ulcVX5LFGf9BwDaRBpX82jzluE=;
        b=ZU39F5PqEouWFi316ZGTEj++C8Aiv3yoRsX+PIzPvuZbCnTkoHz13q3UZIXkhIWzmt
         FIhDNRh1GtECzFI/xhV51W83HxXobNSzPY1AMByp5vfwhCZjCXY3U0mTaL+3AB/f/gRM
         StKkrR1nf5n7MxW2KPoppIN+OEdMjtOgkpElUtWv0BO3UpbAGVDtM8BXv5OC7gyi9aNm
         En+WdsboXklBjXwiueCXJPLFB0m2PP2al3bNo07Xk0I34veWJ1ZG/i5c9pGkFQlWArhy
         3eazvngUlvN4l8iGSsWTpyue+Dge/nDQ2txbz4Bfe+OR7MjjNc32eFPygdpeDy8UA12Y
         l9Gw==
X-Gm-Message-State: AFq9FYKrrwB9yKyLjcAnfvkZlfecZqu/mZY+H2+kfezvRmrbPYTnLDnI
	54EfbiSprtl9pQ51Z3QVA4nBmTa8g2hx9lSj0xEphYl91N/5Euvkk9OuXW4EtXJVnXnxsrbFYOh
	OaJ+fAG0=
X-Gm-Gg: AYBFou0SE+CUV5kh48VfiDedp3Y7eySB2bbpbbFVMT7Rs1DNtvsS5G7O2OanQTS4Q33
	WTIwhGf3VuM+xlky/2FB0hBWfl69P/TZ4PHOLVsuv6asONWToVYD581UUYN3W22wJCiwa47VlIY
	WKxl0XRwu0mZKKbg8f6wdgkQg4HiNeoEqaaXvUfI6VZcBDyGGd18SvwNq+mhcnF2ioa6U98RNKN
	j171JtbVKt6xP8rIaTHC5cGAW1Xq4dEbilFFueeHZkmvXcsWCPukHMn/Ng9QjkVa902dfONbgZz
	eZnUTPGWfz8wS4U4oAqO62CVPr5tjEtO5pB6L84i8DzG6Jv1K3ylvZA+aRY3S5r9mBzjZfjjb5G
	UI6R6XZK7kka0rgYB8Kxw/YRjROIK4P5wRpPyrKNFn7uRaqaPDpyrSQlbXJrSXWwV7hh+qNHQDg
	5L4vmfOJcl95fGVFD5NeKkmLy5devJ7xxUG+kU9hFi4UBVAC3Uxx8ImoqYOb8UIKEBibqwtXYJZ
	OIkPvXlmvEdphglDF3p2Hfbuh/iCrkEATnSrkDTRhrB2JcrlYL0eAsGvAT2xqiLSw0=
X-Received: by 2002:a05:6000:2002:b0:488:8cf8:14 with SMTP id ffacd0b85a97d-48c72583a2cmr941889f8f.0.1791319457099;
        Tue, 06 Oct 2026 13:44:17 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 05/18] libpcre2-ptest: add testoutput3C for locale variant
Date: Tue,  6 Oct 2026 22:43:40 +0200
Message-ID: <521c3f838baa688119fc0369cdaee6861980a36c.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247342

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

