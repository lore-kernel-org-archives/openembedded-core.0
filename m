Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.7698.1608284585858040351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dnDqK+nO;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t16so1437390wra.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OsAtdhZF8gPbx5NSPp4tBfb2wXedxPZyRd3y3N+CWW4=;
        b=dnDqK+nOnqUVGrF/NBLeifPt9vsHHawYV5hGDvJreM+iIMJPJFdfmkc277+PUEDivq
         czSE7uV7endSOvDnIe54NORht47XzQG2tp9XP77PCVsHdMF2wyUqTlvB37nH5MS+sfUy
         DQ7MvK5B46vyzxFICQnWL4UzTH0buOF9P4pdE4wPU1eQjSGka8bX2jX0vwnQudtlcMmZ
         06f8NVLAep3Vasudq5okyHtd1O33v7TeeshW5oDkGE8tJ0ZtXyNXpy74vUrpv/Saoajd
         jSmrFKuPC9cHF23y+taK60po+C6WULncHAYWBsjB4HSvZwyKjfxZgzbI2uVy43tdqQik
         n50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OsAtdhZF8gPbx5NSPp4tBfb2wXedxPZyRd3y3N+CWW4=;
        b=MGUw3ji8XDbnZDinK34FXjYvz9gVdfufkkN910dB34EF91ziYd5rRcuocXun0L3dhy
         R1MZRX16QaxfP3K9o8XniUbUhHrgI68+11F8nImIyeyFGt6m9Iq5CtFxtNm38MoUsro5
         gW5JV+8Timtj4sHAYgCd9qVnJNt5Nb1PEGXAy3A5V+uL+E86S2nOfI9Sl6zYqDZERQz1
         J0E2V4Jn0hjln3TJz49yronTfN/yA38HuwRYZrSuXC3QGkrR1QGL+g83Sbt2GN4IqBu7
         oEdSXSOHde3srksVVKD70Dj+s2U3mas1i0+F7m24Q+KZ3188BG7RhTa2UbQqaf74/01b
         zPfA==
X-Gm-Message-State: AOAM532EKkRjSqUPCypFjV+QBi549SAETMesXkJNVCIpnfjXQ3IhNPdT
	a5UMe7P9i7OQJppm1LVI8qpArOQlc+Saow==
X-Google-Smtp-Source: ABdhPJwCebJ3oNJYr5xdXnMFDcLRjzNCka9oZ4yjTKOmdEB9OTu4WmeaZZdPwoawMwCMivsUqu5P0g==
X-Received: by 2002:adf:ba46:: with SMTP id t6mr3428554wrg.168.1608284584117;
        Fri, 18 Dec 2020 01:43:04 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id c81sm11788116wmd.6.2020.12.18.01.43.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:43:03 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
Date: Fri, 18 Dec 2020 09:42:56 +0000
Message-Id: <20201218094256.3796401-5-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218094256.3796401-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201218094256.3796401-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Some libraries are now dlopen'ed and skipped at runtime if
not available. Add them to the RRECOMMENDS list, to allow
users to exclude them for smaller images even if generally
enabled at build time.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: set the rrecommends directly in PACKAGECONFIG

 meta/recipes-core/systemd/systemd_247.2.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 7055cc9fca..15f8cb3d71 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -110,6 +110,9 @@ PACKAGECONFIG_remove_libc-musl = " \
 
 CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
+# Some of the dependencies are weak-style recommends - if not available at runtime,
+# systemd won't fail but the library-related feature will be skipped with a warning.
+
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
 # systemd-serialgetty.bb - not enabled by default.
@@ -122,7 +125,7 @@ PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
 PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
 PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
-PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
+PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
 PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
@@ -143,8 +146,8 @@ PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
 PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
 PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
 PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
-PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
-PACKAGECONFIG[libidn2] = "-Dlibidn2=true,-Dlibidn2=false,libidn2"
+PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn,,libidn"
+PACKAGECONFIG[libidn2] = "-Dlibidn2=true,-Dlibidn2=false,libidn2,,libidn2"
 PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
 PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
@@ -162,7 +165,7 @@ PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
-PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
+PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
 PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
 PACKAGECONFIG[resolved] = "-Dresolve=true,-Dresolve=false"
-- 
2.29.2

