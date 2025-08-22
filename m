Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84941CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 05:17:41 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2043.1755839851679556452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 22:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MCZmFbRk;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2460757107bso13371685ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755839851; x=1756444651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr/t+crR8/KIqNdWr85/ksGbR6mRZa+Qqni9K9i9RVg=;
        b=MCZmFbRkri8qnjf3tuuaNL/zC5pnZqNbqNxaiuJYrRfepMAnQLsW9FPnzNyrNlnAMF
         n8VWSzLQ70HJi+iK+s1GYeQAqHz1rSWY4UsfaChx37J4FiPKDAF31xwAdKxSHLZbJ5Px
         p/vpKeyT0lrBdTuF+wfjr1q6LqE7NT+d9hrlLe45DbQ6rsTbslhZ8xjllCovy+QQBwXN
         U6F9OdAs8p6AqsH5Zw5TEw/3qJJexxxHF8gPC4M0F9HgB4fq12PKlQcjXOb+VTCNebgt
         0rc+Sdi6tGRKowiNc5PTiAPvhGwRDaz6DmiMt1SECvb8+/IJcHfv8ZPi9oB4e3KSYMiY
         Z6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755839851; x=1756444651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr/t+crR8/KIqNdWr85/ksGbR6mRZa+Qqni9K9i9RVg=;
        b=ScUnEfVqK2sdb5cfLWxbpnUd+VjH/Ot5dlpfMCIWt4vNjmYNW0d6kY5j03Rb5q7vwR
         qWwRr1nL59eqST18ms4eE5Q/ygE9ioWC9APJ5XEcvc+qpgFZpCPzNIUeUdQwrQ0mKcEv
         +6re5d8+F/EO3p5M9UWqm0nFche3YFS8Wx8QZCq3thlTV9hEcyHO/GqErz9BKUHMJnvM
         n/6a/Uq/1zcqcnI7Nf3qxjkk3QwwozPGTp1cIlAfpLhyicJc//sNZz0AXsuxqf1Qk5ln
         SrG409lHyzoVOO02tSzLqWyP48HRPAo05ZXWGMyAsFgXI1zVz7bmC2OCNIMvslBusBrd
         Ew7Q==
X-Gm-Message-State: AOJu0YwHwxx/Dqodqb93a6glZcBF1sQMTAvcsoaTAZDvyp7LcUA8HinO
	TR6Hx70T6Uyx4uMTy8vVsuqamSFIHhNxUBBWvJJqUEZDBZOVhwkH4+tZ7Fp/Zk6G
X-Gm-Gg: ASbGncua4h5hAtGtjb2Pk2sPnFKkxm+LrD8ttTiIB+PikNXRJDWGJ4AYVsixEq8z3Sd
	Mzu1MfVCsiiTmAZAj6JYI3K8CccVP/A5r11ulw8QP8wAEPzvm3WhmXJDqy9ThwgYT5WlK/TymhJ
	oYoRM4UPdeC6maIKs4MmGoZ5BH7IsaTpuUBrsr1Fi/4QUNp0xZu5MHwCWDvPB/2EZSHM9LviGb7
	704bWsKToT6YT7OBYP95wTUsA9xAoUvfH9pgcrRIxyAAq1xZLBTEkMLeewdNACzRvV5XuoNjE3z
	YItfpyeNSgRUvP0Ic5rA9bf5apR+Qi7mUr4jCKaEyouCiVmyJUykJ7wxfasCagDvmd93iZRt/Xf
	QHNtT5XbKC7gMxMcwJuj4LUPQyPGkn+VM6zD9S9Kuxz8zefhO3P0hwzb1PSuu2+9kh1YqPutC7V
	gqb3DPiRf9O74qz/BJXh9UEFSsuGbuQ6JOjYtmXa2ngV+JkkeTsg==
X-Google-Smtp-Source: AGHT+IE1+AXxSi1w8SVnDLLINiCjfAJKlv4uaWA23LuZyU9d6HG5bLFYZr4udabrrFqZ2rdICXMZTw==
X-Received: by 2002:a17:903:186:b0:23f:adfa:3a63 with SMTP id d9443c01a7336-2462edeea05mr29245935ad.16.1755839850593;
        Thu, 21 Aug 2025 22:17:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ebf7dsm71631015ad.120.2025.08.21.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 22:17:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] gettext: Skip test known to fail on musl
Date: Thu, 21 Aug 2025 22:17:24 -0700
Message-ID: <20250822051726.2429206-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822051726.2429206-1-raj.khem@gmail.com>
References: <20250822051726.2429206-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 05:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222304

* Use posix thread on musl and cache
* Force using system posix complaint printf
* Add coreutils to ptest dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-tests-needing-BIG5-encoding-on-musl.patch | 84 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.23.1.bb   |  7 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch b/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch
new file mode 100644
index 00000000000..481bcc0cb27
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch
@@ -0,0 +1,84 @@
+From a6e95c626cd52423ca3ff75d47bb2f08b29ad5c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Aug 2025 13:24:47 -0700
+Subject: [PATCH] Ignore failing tests needing BIG5 encoding on musl
+
+This test fails on Linux with musl libc
+which does not support the BIG5 encoding in 'iconv'.
+
+Upstream-Status: Inappropriate [Musl-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gettext-tools/tests/msgcat-22             | 2 ++
+ gettext-tools/tests/msgconv-2             | 2 ++
+ gettext-tools/tests/msgconv-8             | 2 ++
+ gettext-tools/tests/msgmerge-compendium-6 | 2 ++
+ gettext-tools/tests/xgettext-python-3     | 2 ++
+ 5 files changed, 10 insertions(+)
+
+diff --git a/gettext-tools/tests/msgcat-22 b/gettext-tools/tests/msgcat-22
+index 6047188..abe5877 100755
+--- a/gettext-tools/tests/msgcat-22
++++ b/gettext-tools/tests/msgcat-22
+@@ -6,6 +6,8 @@
+ # Note: This test fails on Linux with musl libc versions that don't support
+ # the GB18030 encoding in 'iconv'.
+ 
++exit 77
++
+ cat <<\EOF > mcat-test22.po
+ msgid ""
+ msgstr ""
+diff --git a/gettext-tools/tests/msgconv-2 b/gettext-tools/tests/msgconv-2
+index d286cda..b02e1be 100755
+--- a/gettext-tools/tests/msgconv-2
++++ b/gettext-tools/tests/msgconv-2
+@@ -7,6 +7,8 @@
+ # Note: This test fails on Linux with musl libc versions that don't support
+ # the BIG5 encoding in 'iconv'.
+ 
++exit 77
++
+ cat <<\EOF > mco-test2.po
+ # Chinese translation for GNU gettext messages.
+ #
+diff --git a/gettext-tools/tests/msgconv-8 b/gettext-tools/tests/msgconv-8
+index 207b0f0..618de0f 100755
+--- a/gettext-tools/tests/msgconv-8
++++ b/gettext-tools/tests/msgconv-8
+@@ -6,6 +6,8 @@
+ # Note: This test fails on Linux with musl libc versions that don't support
+ # the GB18030 encoding in 'iconv'.
+ 
++exit 77
++
+ cat <<\EOF > mco-test8.po
+ msgid ""
+ msgstr ""
+diff --git a/gettext-tools/tests/msgmerge-compendium-6 b/gettext-tools/tests/msgmerge-compendium-6
+index 59eb00e..d1d7f0d 100755
+--- a/gettext-tools/tests/msgmerge-compendium-6
++++ b/gettext-tools/tests/msgmerge-compendium-6
+@@ -10,6 +10,8 @@
+ # Note: This test fails on Linux with musl libc versions and on Solaris 11
+ # (OpenIndiana, OmniOS) that don't support the EUC-KR encoding in 'iconv'.
+ 
++exit 77
++
+ : ${MSGCONV=msgconv}
+ ${MSGCONV} --to-code=UTF-8 -o mm-ko.utf-8.pot "$wabs_srcdir"/mm-ko.ascii.pot
+ 
+diff --git a/gettext-tools/tests/xgettext-python-3 b/gettext-tools/tests/xgettext-python-3
+index 1e13b57..ee1ffee 100755
+--- a/gettext-tools/tests/xgettext-python-3
++++ b/gettext-tools/tests/xgettext-python-3
+@@ -6,6 +6,8 @@
+ # Note: This test fails on Linux with musl libc versions that don't support
+ # the EUC-JP encoding in 'iconv'.
+ 
++exit 77
++
+ cat <<\EOF > xg-py-3a.py
+ #!/usr/bin/env python
+ # TRANSLATORS: Fran���ois Pinard is a hero.
diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-core/gettext/gettext_0.23.1.bb
index c704a3b6d7e..e160d4839dc 100644
--- a/meta/recipes-core/gettext/gettext_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.1.bb
@@ -27,6 +27,7 @@ SRC_URI += " \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
            "
+SRC_URI:append:libc-musl = " file://0001-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch"
 
 inherit autotools texinfo pkgconfig ptest
 
@@ -51,6 +52,10 @@ EXTRA_OECONF:append:class-target = " \
                  gt_cv_locale_de=de_DE.ISO-8859-1 \
 "
 
+EXTRA_OECONF:append:libc-musl = "\
+                 --enable-threads=posix \
+                 gt_cv_func_printf_posix=yes \
+"
 PACKAGECONFIG ??= "glib libxml"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
@@ -174,7 +179,7 @@ do_install_ptest() {
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
 }
 
-RDEPENDS:${PN}-ptest += "make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"
+RDEPENDS:${PN}-ptest += "coreutils make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-gconv-big5 \
     glibc-charmap-big5 \

