Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.1669.1614033678214159435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 14:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pJ/DpkGD;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id r11so16295244ljk.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 14:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Z/Oz9gFe7YSuCqdvjvc+vt7LdwMk1zMqGkRZsrmdpY=;
        b=pJ/DpkGDIQxosK+hF7JFa1XKG+CmiqtlZ0bprXuz5zC/1Zlee659VghpggFofxk0Cj
         7XPDFLQDdj6c/RThpERD0XsdyDlbb9EiWpo7PF2y/TymtALivjr2h318Cc+Ox/BNtcln
         gX3JNAS0AasUqhOkjAKdQK2Q3wvgvkh1EK9brpW7HnoH0JJgSLszjXvM/eGsegKEMxbU
         Hy9QtfSdm4LvXOJbN91A9dQB5ILrlseP9JJ3Oc3gNkPYtTVNPCqrJioGpgB5SwV2M6Pi
         1YTcF0c8oIWdeTjuvwa0jfs35rVsdHCD6TS8QPAkOLulxoNTrXcFPoDhHZ0iBiiClWR9
         LY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Z/Oz9gFe7YSuCqdvjvc+vt7LdwMk1zMqGkRZsrmdpY=;
        b=Its7H3+jwX/yH/dnd/9MX7XHDknE3yJfk4SZdoAgPnDK6U1wtyZsRlZZHuh9d+M2No
         vCuOMs+Be0hv63GzAWC76xd065muKZw6ihSz3xMQVAMBFQcWb4Mb7KTmSri9bVCy5X1r
         MQTLdHJsNcFZfomBYGqvWcbHmRhMNXTKD8qeeMC6Fn7PuooFNGIL1l8/nxMRQMpeBTZw
         miGGkq6HcYcnF194q/gIuitbshFNuqsuA4HlgFyliFZiYpnycW0K9LCh3quwSjWeQDBf
         oLmiFZsEbHJwiMTQLTljuoNB+wJeiue/pb0XR36HOnTSOCtOzRUYSJ3KMz0HPinO27ql
         Ps8A==
X-Gm-Message-State: AOAM530t6voslJxcgfUQvUPEswgjIw4Hh4SkvLc3jI8PB8KN2eOcxNfm
	LCX37SWmkH4wzPi7H2ZKl9ogZgrKcYYSwQ==
X-Google-Smtp-Source: ABdhPJxMVYnYcuWaAP93SIWz1GjFCZPttG5GzKQXc8dwxFKYQJoqbedHkRGi1JkdO+sGGblrUbkWow==
X-Received: by 2002:a05:651c:96:: with SMTP id 22mr14832568ljq.435.1614033676012;
        Mon, 22 Feb 2021 14:41:16 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id j2sm1388164lfe.47.2021.02.22.14.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 14:41:15 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: kergoth@gmail.com,
	richard.purdie@linuxfoundation.org,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] bitbake.conf: Introduce FAKEROOTLOGS variable used by bitbake to print pseudo.log
Date: Mon, 22 Feb 2021 23:44:01 +0100
Message-Id: <20210222224401.18956-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitbake depends on this variable while looking for pseudo.log file in
case of fakeroot task failure.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

--- v2 remove PSEUDO_LOGFILE variable, it seems it's not needed
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 375467d155..ffb45ee97d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -694,6 +694,7 @@ FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
+FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 ##################################################################
-- 
2.30.1

