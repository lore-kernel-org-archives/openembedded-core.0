Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.98.1623872393570440803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 12:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JYf9M+Hz;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso4159470pjx.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVsGdZvbYFMsfBvmHqoVTodRgPsWshOrNKvfZ8oIQvE=;
        b=JYf9M+HzkV3bBhNenS0agerfoLjAGTLto0cQtmEYQSRcPNCXIDTp+corcyPQrIFRiA
         Cw6Mba88kqqyMh9E+h3wlinWQWcpV5smph2QR/sSV5QxhV3Rj1Z5601GJJWmTOQ4CuUX
         VYFPJkFAvD7OvGiwUvE07EZmrME6N2t1jndovqpW9l0mWO3Mbk2O3kDxcWuNvM8MsNEL
         9D0g5sM1mr5WFmUaRmYzWyscn5klgFFkGP2jxVKRkNnes6tf6KlmHDmh4NrUn8v43j6B
         i6o1l2nZl8SWr29FkQnZbg5VoALcvvKhKvwt5gdJ5yoNW0yQKcvsKh83ZsUMvLSpbTlK
         XOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVsGdZvbYFMsfBvmHqoVTodRgPsWshOrNKvfZ8oIQvE=;
        b=LuPCDksIZVMHgnX9hjLlIEs+lM8fwfy6UNi0d1+awToDNdunHEX9XP32hVJcVDv3Bv
         GwYiwELsnkqWesGkzDmRFgNAPGfIdoBswoKEUXVf1oMrwRtdZJkIohGp1lEJjSPBPC96
         D833OsLUiM5GrKfRWDmPFiwYmBJVnfCEh5yJZy1xCYSAS0JOOFMNo6iLoGIg9q81HBOr
         1FxZhHHFjkv7iBKC1tx1EyY6G9zb0FreINTg3KNQr2YxqcYprhXSiEvVtPp4cpQEglL9
         TIGkVSZjuiotTIyfgviuE5lkAYHMB2i+NVPN+f9HSxR+VRSnww3RmxxpzXGmjLzHc6Zv
         Zv9Q==
X-Gm-Message-State: AOAM532pIxOiS1FnHBehvtXLQkW+L2HZpFoP4H9yejqE+06jZ2VTVh++
	7Jp+5U6gqfdJJEbRqR7cKncc0Nn96yhNRA==
X-Google-Smtp-Source: ABdhPJy8561Qik62DoyXc8vjoqBfuftKmE7Ns574lI/6IyMPPRWDV7YRZzXLz/FoPWm501G3Fd8tZQ==
X-Received: by 2002:a17:90a:4490:: with SMTP id t16mr7927855pjg.183.1623872392832;
        Wed, 16 Jun 2021 12:39:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id t13sm2963405pfh.97.2021.06.16.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 12:39:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gcompat: Create symlinks to glibc ldso locations
Date: Wed, 16 Jun 2021 12:39:49 -0700
Message-Id: <20210616193949.1153981-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616193949.1153981-1-raj.khem@gmail.com>
References: <20210616193949.1153981-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures the glibc based binaries can find it in right place

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/gcompat_git.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index e1ae052c44..863ba8dbf0 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -14,14 +14,16 @@ SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig linuxloader
+inherit pkgconfig linuxloader siteinfo
 
 DEPENDS += "musl-obstack"
 
 GLIBC_LDSO = "${@get_glibc_loader(d)}"
 MUSL_LDSO = "${@get_musl_loader(d)}"
 
-EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} LOADER_NAME=`basename ${@get_glibc_loader(d)}`"
+EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} \
+                LOADER_NAME=`basename ${GLIBC_LDSO}` \
+                "
 
 do_configure () {
 	:
@@ -33,8 +35,16 @@ do_compile () {
 
 do_install () {
 	oe_runmake install 'DESTDIR=${D}'
+	if [ "${SITEINFO_BITS}" = "64" ]; then
+		install -d ${D}/lib64
+		lnr ${D}${GLIBC_LDSO} ${D}/lib64/`basename ${GLIBC_LDSO}`
+	fi
 }
 
+FILES_${PN} += "/lib64"
+
+INSANE_SKIP_${PN} = "libdir"
+
 RPROVIDES_${PN} += "musl-glibc-compat"
 #
 # We will skip parsing for non-musl systems
-- 
2.32.0

