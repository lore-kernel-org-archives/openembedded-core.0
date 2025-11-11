Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ECCCCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19319.1762873140547792734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G3H6n8TQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so3018179a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873140; x=1763477940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTMFUifx+TJfTFU72YaoOWp2HIO61WumH/tcNsD+lpw=;
        b=G3H6n8TQHA22s0rFOuJIMKGJ7Ce/xjiigJWezarFdG28Y5iyCwr0A0ZJxVL7LLnQqM
         mBdjxqsEaO6YM57kCFDLaCsI41875GkPU2LtJhf28zDsdYjUF6BNZyetekf1SXglpWY/
         IMwhOb7pDdP2Vtb9K9Qku/QJsWnKyf8/kpGyHOOI8iBKMB7nzVgGadV7IETgGlEwq3Pa
         2Onz9EVbNNmoj7CyD9lIAs31NeKS0ex0Hf/huQ15onw7Yx0WEyo8meIIeXaDgPrSue47
         GQssiAm4GBkDakvMKl4wrB2UoNhAzwqBq1JqBxgPh1Ei5MbfOSaxUQPVBMWXN8yQwx0I
         s8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873140; x=1763477940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xTMFUifx+TJfTFU72YaoOWp2HIO61WumH/tcNsD+lpw=;
        b=C5v7aUvLPZytgD2aFeCFKLfds+dvIVYM4qrewVqzl6lTsCzkCk8OOI/XEJBtlK+9k9
         tJwx455WZWmIyhmBJ9tCaq+sEK+M+BWydMJi5iJFpYeXflNPhHk5nQYpXhEFGzijLS9i
         3Kwrmz0R5LacLvcHHfRLFyNaHZxK6liwYpesdIDuG0h0zlNE/UJCVVY42B4q+SyOcCWS
         UCd7XSII62ySsZAXY+qJw2O1TK8yi4+RAF+hk2xHvbR9gwNa5e6Agzr0gqdTr44xkuB0
         LidMMvdO12uHtNkyI2PoHASu2nmrVfdGUI+UAz4P3Wyy3K71I+ku/ndZx2YyPivL6xFh
         5Jpg==
X-Gm-Message-State: AOJu0YzGmzHG1+YGTKN1Bo8hrBu8w4rBY4pU2hWHO2banPy6zamjoj4P
	LFhat5zye2Txqh8OjlhREKuAEG6hPx5J1fqCmltsXY8aJB1EJi/1r9HlwFhYTfVnErXORszZDzc
	3MTD0NuQ=
X-Gm-Gg: ASbGncsue+VQcQZZPOeiQwlX6bJaPVCDQ+DGwwnfG5FtHlWEh/6iHzmo7zc17wtVzN3
	edocxfGQ5sHNeQdtv/eLfu3MKEsdoYONj3VYIAdZVZdORObd/O3LsPTyCpYXSVQeVwsZ4FGBInC
	RQ9cmypaktEvZ2k8HBiB4Hbe0fvpIw2zh0BO0EHHhnlj4kklfKLy8/kuYYIvWoVMQVjq+GccIgX
	XOcQ7+DoCuma4yjbE19zXwOM+ijzuyG/kNAp8BJUBTPN7xv+rLV6qUxe4M8cRR3I+zJT4e1qNFk
	obkTV4DioInMjBgWeQ/XnuDYs411ek77DxuUu2kvMVlZAL/j4iZ+eXsj1vbl2n9hIck8OfUTSO1
	/JAfylNOX1WQE7wj3W4b/wuvXzqHSyP3xf54yasAE0qvZ93U0kaX3sKndi79ddXA5uUHGDuhCGk
	Bovw==
X-Google-Smtp-Source: AGHT+IGuYR5uNivn2QPSHtzgej4oJWtfnx80DnqIcZwjPNYZguX2AsMbdKW8oOdkgDpI6BCvqyS+5g==
X-Received: by 2002:a17:90b:3948:b0:341:315:f4ed with SMTP id 98e67ed59e1d1-3436cb89b24mr14820755a91.10.1762873139748;
        Tue, 11 Nov 2025 06:58:59 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/19] ca-certificates: update 20211016 -> 20240203
Date: Tue, 11 Nov 2025 06:58:19 -0800
Message-ID: <63620f034019b3b3585e263bd26b3fadd9a1692e.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226176

From: "Theodore A. Roth" <troth@openavr.org>

The 20240203 version is the same as used in Ubuntu >= 24.04 and Debian
Trixie (testing).

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce19168885a04b0d77e81c1fd1c4262b195a47d4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...mozilla-certdata2pem.py-print-a-warning-for-e.patch | 10 +++++-----
 ...ca-certificates-don-t-use-Debianisms-in-run-p.patch |  6 +++---
 ...ficates_20211016.bb => ca-certificates_20240203.bb} |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20211016.bb => ca-certificates_20240203.bb} (98%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 5c4a32f526..78898f5150 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -19,7 +19,7 @@ diff --git a/debian/changelog b/debian/changelog
 index 531e4d0..4006509 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -37,7 +37,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -120,7 +120,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
@@ -37,9 +37,9 @@ index 4434b7a..5c6ba24 100644
  Build-Depends: debhelper-compat (= 13), po-debconf
 -Build-Depends-Indep: python3, openssl, python3-cryptography
 +Build-Depends-Indep: python3, openssl
- Standards-Version: 4.5.0.2
+ Standards-Version: 4.6.2
+ Rules-Requires-Root: no
  Vcs-Git: https://salsa.debian.org/debian/ca-certificates.git
- Vcs-Browser: https://salsa.debian.org/debian/ca-certificates
 diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
 index ede23d4..7d796f1 100644
 --- a/mozilla/certdata2pem.py
@@ -66,8 +66,8 @@ index ede23d4..7d796f1 100644
          if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
              continue
 -
--        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
--        if cert.not_valid_after < datetime.datetime.now():
+-        cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
+-        if cert.not_valid_after < datetime.datetime.utcnow():
 -            print('!'*74)
 -            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
 -            print('!'*74)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 4a8ae5f4b5..1feefeb96a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -21,14 +21,14 @@ Index: git/sbin/update-ca-certificates
 ===================================================================
 --- git.orig/sbin/update-ca-certificates
 +++ git/sbin/update-ca-certificates
-@@ -191,9 +191,7 @@ if [ -d "$HOOKSDIR" ]
+@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
    echo "Running hooks in $HOOKSDIR..."
 -  VERBOSE_ARG=
 -  [ "$verbose" = 0 ] || VERBOSE_ARG="--verbose"
--  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read hook
-+  eval run-parts --test "$HOOKSDIR" | while read hook
+-  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read -r hook
++  eval run-parts --test "$HOOKSDIR" | while read -r hook
    do
      ( cat "$ADDED"
        cat "$REMOVED" ) | "$hook" || echo "E: $hook exited with code $?."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
similarity index 98%
rename from meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index 99abe60613..b198ea77a9 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
+SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.43.0


