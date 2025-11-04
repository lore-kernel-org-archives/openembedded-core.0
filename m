Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DABCCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:54:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19806.1762268039765519011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+bB1wPn;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477563e28a3so5958185e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268038; x=1762872838; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlIf0OacRgLeZFVdNmsiaC7NUk6v19a5ymIrmNtTNTA=;
        b=h+bB1wPnqbSifxHmX+L9Bo4kWtyn5bfPBQ0sebDnzNR4RMbKL4uywJo+xQAR1ZY6Bb
         +4gagN32FaaP/61Nia3C9dvMv/tLCtIYUnJCOj2s/+kp5UWl9yKZP5qynIKdgR854vNj
         jmVzmQaXMEQOqp/Bf2+86+guDF5jh68orsziYxJShjd09oBqJtPccUBDSSq1deuTZHkY
         Z8a6RlVUWijry7cipwK7XlC2BKobFD4mQWIH+luFs4pa2xhLAVfbhMTlkNRZmlT6s4xk
         D3voqyYu+4/eUuc10CNnoxmYjij3kcFSZaWIiBlU2bfDDtkNrDaL+6P4I5avs0ABD8Tq
         Xr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268038; x=1762872838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlIf0OacRgLeZFVdNmsiaC7NUk6v19a5ymIrmNtTNTA=;
        b=tXN2T7S9bFKJxpODtLa2LC8jGz4r/QgHcT7T9+yxblOyJuBDcowJrdCtb4gaT5IxGZ
         IX64Uxh4bdw4przJ5qBklKzNGuuCJnRUql4CNwaP0FeTNA/ksK/Mc6jmGxK1U9i/ePEi
         0VsLksVBGltzq1sCxEtzo6N/yQAd6Iw4FZiWpTyMTTjx+YTagsacVLbuE2CO1BrETwGO
         EBoBG7ZSAVH0M6OhXE1PxlC0QX4ku2g8T6J3lV2YkU2yXBJ3VBFSHvpJcLYINa25h2Wq
         w6l1/1A2yl1fO8eGOLz7cyGz7qV7eSMlNUR3zVY0i0Na34ohH/fXkpYrnWbQR3oY+ExX
         nfBg==
X-Forwarded-Encrypted: i=1; AJvYcCUtzhCCNbU5dLV396QX9mnZbDRI3Kt58F/qZg+LOSW2ogh62IinkGcKMOWauYX+3hjNgwkTOAI/9yBQxf6Gk3fixA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw08m89lqwdTk2Zi6cga4cJZDzYKKO40v60+FiXkVnw4pfqCXbP
	Y9LFEyEtXJ7Uyy1wV2jMcAqn75NSXeoNVphtJ/MksI7SzrKpN8xYP9cP
X-Gm-Gg: ASbGncs7PnKIIfjqSuwhEvy6jWLHndoWQU8/eTNV8XIg0M+Hc8IsJE9n3CEtRaBuUwQ
	xhgojk0tpvg4tntzLDwOO9ABNLeF3qOOGnwjl+cKN8zxi4DObbIdXFyt0YKBjk853RnX+zAXMl/
	4mZyqxuGQ0XClPydZ2SM98oHJqoKjVhYKRG9BJzGFQ9hdlE8dDsRLlx3sRMrq5uZKWGksKz/xzy
	Jx7FLg1ypYJ7E9YUwQ7BxldOPfZ9HKZ3OETF9JxaQhFeP9WOTITXubDyobZW+JkoIt2QvyU6X1J
	DuTakSaMiz+j17vREu4B54NdsDBfvApSeIuRgpn8FcgIO6ddVwqZQx8fjYOnsz0Of+1N6slju52
	Gf5ts2MKMwZ1B0b+g9J714ku9ZsQEW/ZSzhwPLNOymACeuyXz7Yz4kOvTbQOBJy7CaI2vb1v3x+
	vG+YyI9CCw
X-Google-Smtp-Source: AGHT+IE4qXhDl/iDrleLUNPxCMm5//znwB/frcniovTFw6uedHyjs60sVU0Etmuh8gLFfPkVjiSD7w==
X-Received: by 2002:a05:600c:37c6:b0:477:4f97:cb31 with SMTP id 5b1f17b1804b1-47754c1fe7fmr36968985e9.2.1762268037946;
        Tue, 04 Nov 2025 06:53:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fdae2sm5168471f8f.41.2025.11.04.06.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:53:57 -0800 (PST)
Message-ID: <d83c4856-628a-4150-978a-d3ea5a107e2f@gmail.com>
Date: Tue, 4 Nov 2025 15:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] libxml2: upgrade 2.14.6 -> 2.15.0
To: hongxu.jia@eng.windriver.com, mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
References: <20251017071908.3574315-1-hongxu.jia@windriver.com>
 <20251017071908.3574315-2-hongxu.jia@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251017071908.3574315-2-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225734

On 10/17/25 09:19, hongxu via lists.openembedded.org wrote:
> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>
> Due to upstream [disable python bindings by default][2] and are
> planned to be removed in the 2.16 release[3][4]. If we still enable
> python bindings by --with-python=yes, due to upstream [doc: Build docs
> with Doxygen and xsltproc][5], build python binding requires doxygen
> otherwise build will fail, and we do not provide doxygen in oe-core,
> so remove python package directly.
>
> Refresh install-tests.patch and run-ptest to not install python test
> cases
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../libxml/libxml2/install-tests.patch        | 20 ++++++++------
>  meta/recipes-core/libxml/libxml2/run-ptest    |  7 -----
>  .../{libxml2_2.14.6.bb => libxml2_2.15.0.bb}  | 26 +++++--------------
>  3 files changed, 18 insertions(+), 35 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (78%)
>
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
> index 4c1faa83cb..9269536af0 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,34 +1,38 @@
> -From 7e99fef6eae0642a3f1e511e4d24abf7d6d28f50 Mon Sep 17 00:00:00 2001
> +From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
> -Date: Mon, 5 Dec 2022 17:02:32 +0000
> +Date: Fri, 17 Oct 2025 14:15:36 +0800
>  Subject: [PATCH] add yocto-specific install-ptest target
>  
>  Add a target to install the test suite.
>  
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +Do not install python test cases
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - Makefile.am | 10 ++++++++++
> - 1 file changed, 10 insertions(+)
> + Makefile.am | 8 ++++++++
> + 1 file changed, 8 insertions(+)
>  
>  diff --git a/Makefile.am b/Makefile.am
> -index 6f98144..ecb3b54 100644
> +index 19ec305..64bf28a 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -26,6 +26,16 @@ check_PROGRAMS = \
> +@@ -29,6 +29,14 @@ check_PROGRAMS = \
>   	testparser \
>   	testrecurse
>   
>  +ptestdir=$(libexecdir)
>  +install-test-data: $(check_PROGRAMS)
> -+	install -d $(DESTDIR)$(ptestdir) $(DESTDIR)$(ptestdir)/python/
>  +	for T in $(check_PROGRAMS); do \
>  +		$(LIBTOOL) --mode=install $(INSTALL_PROGRAM) $$T $(DESTDIR)$(ptestdir) ;\
>  +	done
>  +	cp -r $(srcdir)/test $(DESTDIR)$(ptestdir)
>  +	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
> -+	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
>  +
>   bin_PROGRAMS = xmllint
>   
>   bin_SCRIPTS = xml2-config
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
> index cbbdd5592f..868649240b 100755
> --- a/meta/recipes-core/libxml/libxml2/run-ptest
> +++ b/meta/recipes-core/libxml/libxml2/run-ptest
> @@ -11,10 +11,3 @@ for T in $TESTS; do
>      echo Running $T
>      ./$T && echo PASS: $T || echo FAIL: $T
>  done
> -
> -if test -d python/tests; then
> -    cd python/tests
> -    for T in *.py; do
> -        python3 ./$T && echo PASS: $T || echo FAIL: $T
> -    done
> -fi
> diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
> similarity index 78%
> rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
> rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
> index 6ed8760f4c..6dbe1c16fc 100644
> --- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
> @@ -21,26 +21,18 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
>             file://CVE-2025-6021.patch \

I think this patch ( for CVE-2025-6021) can be dropped. Over time it was
transformed from a CVE-patch into a "missing-header" patch, and the
"missing-header" issue is also solved[1] in this version.
(Sorry for necro-posting, but I just stumbled upon this, and the patch
is still in staging)

[1]:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/3773bb3f89426297dd82d8ad5998059898d5172a

>             "
>  
> -SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
> +SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
>  SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
>  
>  CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
>  
>  BINCONFIG = "${bindir}/xml2-config"
>  
> -PACKAGECONFIG ??= "python"
> -PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
> -
>  inherit autotools pkgconfig binconfig-disabled ptest
>  
> -inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
> -
>  LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
>  
> -RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
> -
> -RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
> -
> +RDEPENDS:${PN}-ptest += "bash make locale-base-en-us"
>  RDEPENDS:${PN}-ptest:append:libc-musl = " musl-locales"
>  RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
>                                             glibc-gconv-ibm1141 \
> @@ -49,10 +41,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
>                                           "
>  
>  # WARNING: zlib is required for RPM use
> -EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
> -EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
> -EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
> -EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
> +EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n"
> +EXTRA_OECONF:class-native = "--without-legacy --with-c14n --with-zlib"
> +EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --with-zlib"
> +EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --with-zlib"
>  
>  python populate_packages:prepend () {
>      # autonamer would call this libxml2-2, but we don't want that
> @@ -61,11 +53,9 @@ python populate_packages:prepend () {
>  }
>  
>  PACKAGE_BEFORE_PN += "${PN}-utils"
> -PACKAGES += "${PN}-python"
>  
>  FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
>  FILES:${PN}-utils = "${bindir}/*"
> -FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
>  
>  do_configure:prepend () {
>  	# executables take longer to package: these should not be executable
> @@ -76,10 +66,6 @@ do_install_ptest () {
>      oe_runmake DESTDIR=${D} ptestdir=${PTEST_PATH} install-test-data
>  
>  	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
> -
> -    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> -        rm -rf ${D}${PTEST_DIR}/python
> -    fi
>  }
>  
>  # with musl we need to enable icu support explicitly for these tests
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224998): https://lists.openembedded.org/g/openembedded-core/message/224998
> Mute This Topic: https://lists.openembedded.org/mt/115803730/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


