Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B38CCCF2C8
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5946.1792189490734374227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jIvBIM8l;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df8fe8513so200923f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189489; x=1792794289; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1rWKNnxVgt4K7wyz/nw1bRaVPx0hAXnEib9b7ZWGyE=;
        b=jIvBIM8lZ69wuUXK44VyxkmedjJDIBLCnbYGzLSOnThtLIc3Rsjd2N9mTQoUTja9lC
         IXjbj+H3beQ4J3B20AxBhHh+Yg5txSuRyh4jAgkXNkOIb3v4XGq47XkTcfV0Yc7Q7A4W
         pzxoPemCYkYaJTu0Etvd3NhfZAvz0Ypb7iPoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189489; x=1792794289;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1rWKNnxVgt4K7wyz/nw1bRaVPx0hAXnEib9b7ZWGyE=;
        b=JEWYPT22YwsiurAXc2Tg6BGJtpf1WZOeF8es35ZU+QvZwQ4EFDKzSfvG/Jz88GyXNG
         4MT+Y5T7UYsz1ayfwdKnWcfhqfk3bbr7jG2EGgmRbsKHo7EmKvug5VoIv+GjIWsfKuSu
         aa1foKhWi2r2M71vuPmwLnyA3Zs9eUBdlKH8m1U2KKnmozm3M1DgoJLRBrmXYErYKMpo
         LeBEYsflC9+bHKk8Zf0TRE9flBRMzc1mOZzdVAk1Y+V4NxSDBAi0vVY1Bgv/MnQ1gq7J
         kEvMirfj3FjNE7UXpIxTqGYjMXtUY7H0JAt/Qnbyq//4Lfs+Uf5ElFx0ptlx9ysoMalr
         wTzw==
X-Gm-Message-State: AFq9FYKB+ms3kpC3Xi15IP9B3BCwdSLD+YmUiRgxxNe0egRagJLl/hZp
	Bng5w3eFAxwzUTayFp/VN+iXwetgFRAcG337N8fm+uCQi5OX98uolEbIsYEoq41oXFoJyCHP7YC
	S7bR626s=
X-Gm-Gg: AYBFou1Soy9CeU/eMnzvFbne+z6UqfZWxPXlD2MYT5drXk1esdvRx3JeqOpufvYUnqQ
	CMvWFgBStXUowzucPJIPcSk5KorsrT0Ik9Pk/iS8sx9Z7iB8C0bfEXW4iFMm2wEqjCFiGpmdRXi
	C/kkoHhwdQmYOsuLxtF3QVphxx0hHifyyFS7w7strUKhtwrgezFyucw+1EI94QiAupQNt9n09Hc
	yGlv43/aCQzwKuymIVPQAOPi5j++0kxFFohgbUYwBhqQLEsCWpAsCpiMajTrg4K77EAMp50wr1w
	T3K2laAyY4+qTd3XRpsqI92Sc5uY6MZOOzBz+74TOK+20/FsRU86S1gVj3ZLgInPj8sTtn/rSNH
	86yCeO39V7IfKSkvFeIhPOGNs4OZv63a1ULR5Tm3avvXtcKuKtfRSCSsmqH4ya9Tmpm2aSWLkgV
	GqM0MbQB7mOBC5Xpbj0fc9OtCzu0Yhv8MhAA/Qrl7oWlBbAW+YL2yjQhvCHIbY7XspxuoP4oqlj
	NNulqHsqMNWZdCE449rj3PIzMCKeW6QSQ++Ol3aAuNpztq4odwhPcI5apUi99EHTigVfNd2gbx8
	p2UL3uSl
X-Received: by 2002:a05:6000:4288:b0:48a:fbf7:15c9 with SMTP id ffacd0b85a97d-48e079888a1mr1972224f8f.1.1792189488898;
        Fri, 16 Oct 2026 15:24:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 15/17] libpcre2: Remove testoutput3C file
Date: Sat, 17 Oct 2026 00:24:17 +0200
Message-ID: <1069cee3c257c713e868e037470c4d588caf62a6.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248065

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

This file had to be added to fix an issue with version 10.48. Said issue
is no longer present in version 10.49.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2964318001151716b0d50b4533af15e46bf0de78)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/testoutput3C             | 174 ------------------
 .../recipes-support/libpcre/libpcre2_10.49.bb |   2 -
 2 files changed, 176 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/testoutput3C

diff --git a/meta/recipes-support/libpcre/libpcre2/testoutput3C b/meta/recipes-support/libpcre/libpcre2/testoutput3C
deleted file mode 100644
index 2af67a8d036..00000000000
--- a/meta/recipes-support/libpcre/libpcre2/testoutput3C
+++ /dev/null
@@ -1,174 +0,0 @@
-# This set of tests checks local-specific features, using the "fr_FR" locale. 
-# It is almost Perl-compatible. When run via RunTest, the locale is edited to
-# be whichever of "fr_FR", "french", or "fr" is found to exist. There is
-# different version of this file called wintestinput3 for use on Windows,
-# where the locale is called "french" and the tests are run using
-# RunTest.bat. 
-
-#forbid_utf
-
-/^[\w]+/
-\= Expect no match
-    �cole
-No match
-
-/^[\w]+/locale=fr_FR
-    �cole
-No match
-
-/^[\W]+/
-    �cole
- 0: \xc9
-
-/^[\W]+/locale=fr_FR
-\= Expect no match
-    �cole
- 0: \xc9
-
-/[\b]/
-    \b
- 0: \x08
-\= Expect no match
-    a
-No match
-
-/[\b]/locale=fr_FR
-    \b
- 0: \x08
-\= Expect no match
-    a
-No match
-
-/^\w+/
-\= Expect no match
-    �cole
-No match
-
-/^\w+/locale=fr_FR
-    �cole
-No match
-
-/(.+)\b(.+)/
-    �cole
- 0: \xc9cole
- 1: \xc9
- 2: cole
-
-/(.+)\b(.+)/locale=fr_FR
-\= Expect no match
-    �cole
- 0: \xc9cole
- 1: \xc9
- 2: cole
-
-/�cole/i
-    �cole
- 0: \xc9cole
-\= Expect no match
-    �cole
-No match
-
-/�cole/i,locale=fr_FR
-    �cole
- 0: \xc9cole
-    �cole
-No match
-
-/\w/I
-Capture group count = 0
-Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
-  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x y z
-Subject length lower bound = 1
-
-/\w/I,locale=fr_FR
-Capture group count = 0
-Starting code units: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P
-  Q R S T U V W X Y Z _ a b c d e f g h i j k l m n o p q r s t u v w x y z
-Subject length lower bound = 1
-
-# All remaining tests are in the fr_FR locale, so set the default.
-
-#pattern locale=fr_FR
-
-/^[\xc8-\xc9]/i
-    �cole
- 0: \xc9
-    �cole
-No match
-
-/^[\xc8-\xc9]/
-    �cole
- 0: \xc9
-\= Expect no match
-    �cole
-No match
-
-/\xb5/i
-    �
- 0: \xb5
-\= Expect no match
-    \x9c
-No match
-
-/�/i
-    \xff
- 0: \xff
-\= Expect no match
-    y
-No match
-
-/(.)\1/i
-    \xfe\xde
-No match
-
-/\W+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<< 
- 0: >>>\xba<<<
-
-/[\W]+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<< 
- 0: >>>\xba<<<
-
-/[^[:alpha:]]+/
-    >>>\xaa<<<
- 0: >>>\xaa<<<
-    >>>\xba<<< 
- 0: >>>\xba<<<
-
-/\w+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<< 
-No match
-
-/[\w]+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<< 
-No match
-
-/[[:alpha:]]+/
-    >>>\xaa<<<
-No match
-    >>>\xba<<< 
-No match
-    
-/[[:alpha:]][[:lower:]][[:upper:]]/IB
-------------------------------------------------------------------
-        Bra
-        [A-Za-z]
-        [a-z]
-        [A-Z]
-        Ket
-        End
-------------------------------------------------------------------
-Capture group count = 0
-Starting code units: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
-  a b c d e f g h i j k l m n o p q r s t u v w x y z
-Subject length lower bound = 3
-
-# End of testinput3 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.49.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
index 5fa7c3db3b4..8e0c44fb4c4 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.49.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
-           file://testoutput3C \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
@@ -64,7 +63,6 @@ BBCLASSEXTEND = "native nativesdk"
 do_install_ptest() {
     t=${D}${PTEST_PATH}
     cp -r ${S}/testdata $t
-    cp ${UNPACKDIR}/testoutput3C $t/testdata/testoutput3C
 
     for i in pcre2posix_test pcre2grep pcre2test; do
         "${B}/libtool" --mode=install install "${B}/$i" "$t"

