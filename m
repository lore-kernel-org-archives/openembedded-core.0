Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9C9E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 03:31:08 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.56589.1735529460727528897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 19:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=AmZjgTBl;
 spf=pass (domain: underview.tech, ip: 209.85.219.68, mailfrom: vince@underview.tech)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6dd1b895541so1545276d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 19:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1735529459; x=1736134259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67dypHAk/HBUFhwG/bm030eMoo7uvsxkgxMbtOnyHOE=;
        b=AmZjgTBl/2VXs7pcWdNu9suda7E5mXaeUU1TAxSod5g/bm4ByWM7GNDkOz2iDNsw5c
         qb8b4dF+/5vatTT5tdyXPj1hXc8ZOBVWD3hFb0pvuNkTJ1xkaV6Kf0+i/oU14e5F2o1D
         uFntukM3KJlrlZDl3Nqe6sM327e9Vu52jXESoBEgk6acNHO8FC3suZUlGDlBYa1/6Tkm
         1N6BJOH2Frx0VgVmOKnSy1mmgnNpfyUF9Ah6vqByvU8OEjAPzkCplmsrj4AbHtRHRAry
         0muKW7/mQACz5fcc+VXdAqWQagXh9HUp55aaf9Ly5xtuYb/e8vJyP96hxsE9UQzYRcS+
         BIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735529459; x=1736134259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67dypHAk/HBUFhwG/bm030eMoo7uvsxkgxMbtOnyHOE=;
        b=tWWKfJ5A4r9Wft/WmCSBnRaewRvAytUL75I5Sm9DK5TioDfnNIFKsyUwRXqWnMqxX3
         nHsoxJYppqzmoBLyP8jUeypHiGBK9iI6jUesIMP2H79f/jFOsQuDRImwNXBBoQc82mOn
         5T09OUXiUZkuUeXNUdtlefxwW1fsKpgOUa9VPHPYoSpCVZ2gpsnCjxWq6VsTfl5SFYbl
         b5CsEIMZAQnMzlemOwubWPzr4WQPvK4qRRsedluB0R4e6mNAVA22bDmOb9+nUynB0gnQ
         e3M75+WIr3wFdRKiRU2KwuVpv+iVNy8g5ekbffS92f2iLvgJd4l3BwIFQ7jys/0iTrYd
         bNjA==
X-Gm-Message-State: AOJu0Yy/j6SMndZFVB+BarB/hbIdahz9Ct7PFWk6yuYMPmqdNyRNJ31q
	pm9qp0DfwKUMvebtRNAhOfu4qsgaRL1wYwLt4cnFTIjF8leAGQ5cbarPGlAgopVrJTp6xcw/Bmw
	E1I5wgA==
X-Gm-Gg: ASbGncuxnu8rWwWWLGzyyBgh9ZFZYuYbNUP7SU4nD2IOhjPAem1STlSgY7Wq8DDzB2N
	nuGeGGOv9TrDgewmCR6jpm2xqhP8JZl8W1fM2ibVYEmGOyE0tgUm4szTrxLufHJ2ghstz5aFhQd
	lmRwZxQxFG5GeJQ/yx09FRcj+tkyjEWjJwBMVVZtfYqFlwLAGwjga+c3RpFl58rr1T+5ShWDyDC
	661R+NAd7z3uQRN79NkvYuVYlNwWyuojfZvMHOfEE4J8A8Yahx094IWixPDLPXNpppoHSK5yK/F
	6iO9FQgM6eK6ntwGh1Bcd8BmPu1t
X-Google-Smtp-Source: AGHT+IEreKgF8DAZXkwyvny+6etADEnyxry2/nx0N/ZU+rIlW2Mj2fjgPicHB7m+cTK7xtHjgtzC4A==
X-Received: by 2002:a05:6214:27c2:b0:6d8:e0a0:a949 with SMTP id 6a1803df08f44-6dd2338c4a5mr463003506d6.32.1735529458760;
        Sun, 29 Dec 2024 19:30:58 -0800 (PST)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d01:1820:1fb0:d0ec:3f44:7c90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180ea6a8sm99649756d6.17.2024.12.29.19.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 19:30:57 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] gettext: fix libtool: Version mismatch error
Date: Sun, 29 Dec 2024 22:30:52 -0500
Message-Id: <20241230033052.116763-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 03:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209133

Commit adds in hackish fix for
libtool: Version mismatch.

Along with subsequent errors that occur after fix.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/gettext/gettext_0.22.5.bb | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 0bf2a56e5f..e8ff67d14e 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -122,6 +122,34 @@ FILES:gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${infodir}/autosprintf.info \
                             "
 
+
+# Hackish fix for:
+#
+# libtool: Version mismatch error.  This is libtool 2.5.4, but the
+# libtool: definition of this LT_INIT comes from libtool 2.5.2.
+# libtool: You should recreate aclocal.m4 with macros from libtool 2.5.4
+# libtool: and run autoconf again.
+do_compile:prepend:class-target() {
+    cd ${S}
+}
+
+# Fixes
+# NOTE: make -j $(nproc)
+# make: *** No targets specified and no makefile found.  Stop.
+# ERROR: oe_runmake failed
+do_configure:prepend:class-target() {
+    cd ${S}
+    autoreconf --force --install
+}
+
+# Fixes
+# NOTE: make -j $(nproc) DESTDIR=$D install
+# make: *** No rule to make target 'install'.  Stop.
+# ERROR: oe_runmake failed
+do_install:prepend:class-target() {
+    cd ${S}
+}
+
 do_install:append() {
     rm -f ${D}${libdir}/preloadable_libintl.so
 }
-- 
2.43.0


