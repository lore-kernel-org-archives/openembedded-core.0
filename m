Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.36654.1598811511268126382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Aren+ZsY;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id c6so4682452ilo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RyCYNGQbY1kWN2oRCR/bXYwe78d/kXT+SE0pK+SapTw=;
        b=Aren+ZsYowkakf2fG1nmhhKtEuUMD5t8j4BlO82aAuxFw3G/1NuODqkOSpk1Jljb6k
         NJB5qe+RV7J3nk/hvOdDHdAdB32Ua6d4PEnIFj2JLV2arC1OPstyTA6FVejIse6kUx8v
         fiR1WEMmp8CHlk7293FImA72WVE5+zC4HF3QPwxrnWVpDtQlFwny09FSZm1JFR00Rtr1
         Iac3FdGr5TXwXYBf7mc6y7KQJLJi1whXEo3VxPXxqKK5uKb//2ybn9kglcXZCGygl93F
         8FfH5A0RUX1LOHNZ4xaJellCfjZLH6futRvIIIcE4k+K+KZs3W03OFPbsbQp/2nN8QGK
         L4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RyCYNGQbY1kWN2oRCR/bXYwe78d/kXT+SE0pK+SapTw=;
        b=pPg1MVF5yskdPktdQJdEx9sqSjANfii/qszBxCoqrFVYBg8Aef3ZErkkhfbCSiPa98
         mzL+OYEFazYDq51oRd1zGM8VxNzkp6IPPu3m1aXJnrCvHrk2YVBk8Ft9PJpKqa5peNHF
         xOmKbRQV4rTW534Kes986J+Yf8NlT6pZ+1EFtkLUAmB3cMUyDOfecWMMkTlTWGtVRDQM
         hN/05nbfRW7gzdE8buNNQWGRzG7NtpoWGp3BcHeR0b9WvpYSDLcUIwnIfMef7Cmb6R04
         dfnaQPXhyvmbOwytjdAyMO10YL3nZVlbktOGzdZf33TIuqKzPQcrGZgHdaN9RqfMNKBY
         0kzg==
X-Gm-Message-State: AOAM530E3BqoKjROA4Rli7Ht1dHeyu+59hetkWY9+gXQ2nFXetZcPIiE
	OOGTNykdzSREwoGiEiIZsTE3xBHOT71v+msvCac=
X-Google-Smtp-Source: ABdhPJzGz2LpC+VIXoyFXcO2uBcqiDmrEevc9nIH9lbQGAnUHbLM/OJDb+sZmoGhK47MO1ZIwtbrhQ==
X-Received: by 2002:a05:6e02:1343:: with SMTP id k3mr6061834ilr.217.1598811510218;
        Sun, 30 Aug 2020 11:18:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/25] gpgme: fix multilib header conflict
Date: Sun, 30 Aug 2020 08:16:05 -1000
Message-Id: <70831ab10dd9e3241d0304a9fe6a5fb1a2024a6e.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

part of diff:
-#if 64
+#if 0
 #ifndef _FILE_OFFSET_BITS
-#error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.
+#error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see the section "Largefile support (LFS)" in the GPGME manual.
 #else
-#if (_FILE_OFFSET_BITS) != (64)
-#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 64, please see the section "Largefile support (LFS)" in the GPGME manual.
+#if (_FILE_OFFSET_BITS) != (0)
+#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 0, please see the section "Largefile support (LFS)" in the GPGME manual.
 #endif
 #endif
 #endif

LFS support is enabled by default, and this header is generated during
build according to current configure

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd056f9c4c22740a4f7ede00c758a21037eae5ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..b51534351d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
@@ -83,3 +83,7 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
-- 
2.17.1

