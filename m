Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.33809.1607949315667147906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOqL4vCv;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id a6so13480299wmc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 04:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l0WwUw9jy1gTJw4oNt5SkQJThQFgFdcv+R26RY6VR0g=;
        b=rOqL4vCvqssnEQ15nkIpe2YW+HdJji+PkU7TzGrug7pm1GWTvvBQHQ2GW1tuA5X3nt
         z9P7IHz3XJYb/NWQyMpl7o6dzgS+PyS1buJ0xQA9jgmuk0MJi5TUj3aJXUR5AmudqIh9
         Au2d/s6trCZqFxAq6KSV1sBheE1+ZZ9wt9/XHUzQAgu1ONGd09bRhbWiwdlvAXuDOSWN
         WDlQNCe35BOWTszb2IqrHBN+3nVAYp5+1GG6qj9lZQmITz6Exua/2QtcA1RET/Tpqf2X
         A46pTK9DDNIa3gsjHk9NOUEAK8XO7B1GZuCLV9vg+XKRAuH8Pzf6tLbTBIpptXmgXM4M
         K63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l0WwUw9jy1gTJw4oNt5SkQJThQFgFdcv+R26RY6VR0g=;
        b=OXzcZ/RRjwzMi6m0/FHCKVJM8fqHlHsE2dK95mUWcYZIycsTTBcCboQ0nr7qg72mIe
         V4WZlDnCxyLjb55fgoZenZs7mx6ATmRGcYZIPOurL9yLqdTXrLWHsuKg3Ww8KGQaRw99
         MPDK72+MG5A/OOQOUNQvNIIIDavH1gLX1pUuBGogtMjhFKX30HKmQSW7F1lkM/qvGmm7
         nwYj0iRW72l92m1GOU1UeiVPQICCblGBuUfUOvmOhKFWNrYXT7enI5LGzSB4/D2JMn8h
         HtfLfM7gehToN5Q0rhfvGjxo9QBcReqT9d8yTqGQ8NoVPRZiMKhnVoX1lChZFk2EHhss
         sNVA==
X-Gm-Message-State: AOAM531wSXJQ1oQHWnGSVGnSH+q9itLY97neS/C4sRRWIrv9B1P5poW0
	FKs58oS09Q/Aa0xGYnyxzYH84ZViJOnOwA==
X-Google-Smtp-Source: ABdhPJyDCWrvp3L1X/OLxEJSexC6gbrqqtwcNIMwDErHknLNilJSiy49heYAyLdSurowppo0OU85uA==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr27924706wma.7.1607949313697;
        Mon, 14 Dec 2020 04:35:13 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id i18sm29248075wrp.74.2020.12.14.04.35.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 04:35:12 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
Date: Mon, 14 Dec 2020 12:34:57 +0000
Message-Id: <20201214123457.122655-5-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214123457.122655-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201214123457.122655-1-luca.boccassi@gmail.com>
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

 meta/recipes-core/systemd/systemd_247.1.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index f20e86d94b..8814677bf2 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -111,6 +111,9 @@ PACKAGECONFIG_remove_libc-musl = " \
 
 CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
+# Some of the dependencies are weak-style recommends - if not available at runtime,
+# systemd won't fail but the library-related feature will be skipped with a warning.
+
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
 # systemd-serialgetty.bb - not enabled by default.
@@ -123,7 +126,7 @@ PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
 PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
 PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
 PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
-PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup"
+PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true,-Defi=false"
 PACKAGECONFIG[gnu-efi] = "-Dgnu-efi=true -Defi-libdir=${STAGING_LIBDIR} -Defi-includedir=${STAGING_INCDIR}/efi,-Dgnu-efi=false,gnu-efi"
@@ -144,8 +147,8 @@ PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
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
@@ -163,7 +166,7 @@ PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
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

