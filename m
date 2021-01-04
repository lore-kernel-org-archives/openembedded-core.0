Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12332.1609760422312500073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 03:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqCjAx6H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id y17so31837009wrr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DsTAYg0RcThQVgxmLDtlpLa2x2BOwvCmLjhlG+6hEtI=;
        b=CqCjAx6HJ+DVFobwXZocGoeiNYHbkkbcjtk0m4AlpzNveIx6esVJyxo1BYVsPDncmJ
         6FTt9Ys26czSGbSuRuYwR+JyqBvd+txPqVVFo+n4vwNJjK0Q1Z9vETTZzUH/WUldBzDg
         bZYRskQRIHnsXyWckXVGIdLNWuuLq/q+VWnyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DsTAYg0RcThQVgxmLDtlpLa2x2BOwvCmLjhlG+6hEtI=;
        b=qzzSdjKCUs2i6uAOyFImMuLhrWwuseVXGDFoU5Su4vesFFuYiE/twSwHrIz+oimOUx
         WIFBERwRidetnFuGAePcixZsMXxNzkdZz2gGHHZfmKEoGIxu8/nVBtK2/+Mv+dUzzar/
         76to+KZKB4kLCopVq5SlDcW8vPjTG2Y4n7ztAXQs+lvyX2/BNt9Pa3I/cuqWoo7HdE7R
         xccAzOv/MYA042yhH9m+w9LDj2Lhwe7KFQX13ALolfbmbNT/cGkYvjYc05YzSXewdIi1
         D2lsY078kNqZxYdZnBMULog0uAO/PT4asLvUm673jdetuhU44BppuhvE76D21pYhGTin
         r5dQ==
X-Gm-Message-State: AOAM532vc8Md0LREq+wuzQ3Rn4pzUE4bg5DoJFRQsNL7Y0iPE0mAwR/N
	6lCcwPC+lN7slDHg9WwsKwUkEQ==
X-Google-Smtp-Source: ABdhPJzLHrz6XFGmp2Y/MZVkiBdQd4/+uusLGNZSgxRzkP3SjbBTRcUQbdloVhaJWJo/HzLU6smJTA==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr79671969wrl.104.1609760420787;
        Mon, 04 Jan 2021 03:40:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id h29sm101334869wrc.68.2021.01.04.03.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:40:20 -0800 (PST)
Message-ID: <121a341052f289cb7d3233dcdcb1e62fc0473284.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: support for building nativesdk of mingw
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Date: Mon, 04 Jan 2021 11:40:19 +0000
In-Reply-To: <20210104081324.32745-1-changqing.li@windriver.com>
References: <20210104081324.32745-1-changqing.li@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 16:13 +0800, Changqing Li wrote:
* add support for mingw32
* Engines are installed in a slightly different path, which is
  urgly, patch it to make the path shorter

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ile.tmpl-don-t-add-prefix-for-libdir.patch | 32 +++++++++++++++++++
 .../openssl/openssl_1.1.1i.bb                 |  9 ++++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/files/0001-unix-
Makefile.tmpl-don-t-add-prefix-for-libdir.patch

diff --git a/meta/recipes-connectivity/openssl/files/0001-unix-
Makefile.tmpl-don-t-add-prefix-for-libdir.patch b/meta/recipes-
connectivity/openssl/files/0001-unix-Makefile.tmpl-don-t-add-prefix-
for-libdir.patch
new file mode 100644
index 0000000000..028431b1b2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/files/0001-unix-Makefile.tmpl-
don-t-add-prefix-for-libdir.patch
@@ -0,0 +1,32 @@
+From 8fe5c9421acfaff35b637e7ad55d1df598bb7081 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 22 Dec 2020 09:22:10 +0800
+Subject: [PATCH] unix-Makefile.tmpl: don't add prefix for libdir
+
+we pass libdir to Configure, don't use prefix again to
+avoid engineer dir set to:
+/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
mingw32/usr/opt/poky/3.2+snapshot/sysroots/x86_64-w64-
mingw32/usr/lib/engines-1_1
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Configurations/unix-Makefile.tmpl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-
Makefile.tmpl
+index bbafb98..eecb63e 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -244,7 +244,7 @@ LIBDIR={- our $libdir = $config{libdir} || "lib";
+           File::Spec::Win32->file_name_is_absolute($libdir) ? "" :
$libdir -}
+ ENGINESDIR_dev={- use File::Spec::Win32;
+                   our $enginesdir =
+-                      File::Spec::Win32->catdir($prefix,$libdir,
++                      File::Spec::Win32->catdir($libdir,
+                                                 "engines-
$sover_dirname");
+                   our ($enginesdir_dev, $enginesdir_dir,
$enginesdir_file) =
+                       File::Spec::Win32->splitpath($enginesdir, 1);
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index c63ba3c8e7..9465166ab1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -22,6 +22,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-
${PV}.tar.gz \
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
+SRC_URI_append_mingw32_class-nativesdk = " \
+           file://0001-unix-Makefile.tmpl-don-t-add-prefix-for-
libdir.patch \
+           "
 
 SRC_URI[sha256sum] =
"e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
@@ -116,6 +119,9 @@ do_configure () {
        mingw32-x86_64)
                target=mingw64
                ;;
+       mingw32-i686)
+               target=mingw
+               ;;
        esac
 
        useprefix=${prefix}
@@ -198,8 +204,7 @@ FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf
\
                       ${libdir}/ssl-1.1/openssl.cnf* \
                       "
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-# ${prefix} comes from what we pass into --prefix at configure time
(which is used for INSTALLTOP)
-FILES_${PN}-engines_append_mingw32_class-nativesdk = "
${prefix}${libdir}/engines-1_1"
+FILES_${PN}-engines_mingw32_class-nativesdk = "${libdir}/engines-1_1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-
setup.d/openssl.sh

I'm not really sure we want this kind of patch in OE-Core, it might be
more suited to meta-mingw. I suspect it will be a bit of a maintenance
nightmare there too though. Adding Joshua to cc to see if he has any
thoughts...

Cheers,

Richard


