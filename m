Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.315.1595568380407180922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 22:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovpka0Ti;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id rk21so8715631ejb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 22:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oB6GWXo9tMr9At0tlMHDKxoQ8QEsNiGaHo/M0HX4AWk=;
        b=ovpka0Til/BGkMXqF16Wx7urfUBh9nVj2W8Z41MYLa0mQwftYaX9OKpfCKgIAgKD5p
         dxJv6qLJh0Exyme07KDWApt1GeBPr63osGkkLVwDVW3fMihzPGVKkFAPwthC1nIrCBmG
         Qyq82hvXCBZWRUo5ymxwKpPeeQO3kYLU1wxTT1ZUsb3Xxqc2QCHs2w557M5snOO70g3e
         8KvhZTSBzm4k0gU9f9CWd61V3hhPADOJCpKM0kUfwdjjOD2W5362Q8a3X63ykDE3sdvD
         GNzfIs0Uu4dGUxeoqvld600I7GW96YmAE3omaXn3VbZLF0wf6AKXKB3/ygh5Sh2g62cN
         VWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=oB6GWXo9tMr9At0tlMHDKxoQ8QEsNiGaHo/M0HX4AWk=;
        b=SMSW15Wz/AgvWHoQXEwBy9CGzTKeUZqNxsCEMMyoBQqBZ85jMmEfFgGWNpHR/uLNoX
         hMTyAteXbb1FAANYE6ctW713jRo/cEMgb/g1bVUIRDFDLRuOKpxAup2DUxNgvnpM4sd5
         8vPlPlf7Zx2WWydbt5vOy9V5glvNK5jpoFyTy/G76RcAWK8knHGIV2p6algEIYxAsWO6
         llkauDmbbaVqGAS/iiEBrp0UUCFIjAOII3ZBstOB8oWqZ2DbVO4O9EmthjRSZeRoCI7n
         cABKOAHZvtpRKPKge6AJO/MafrOX4tdP1bHjyw42NqomgVleeLpfK2bMDuZ2RcxE5Q+r
         96YA==
X-Gm-Message-State: AOAM532KzethJC16J42/nbYhYSBvuc+XuMDRkVMxkOY5F2mJ90CgWG9f
	q7MbSQxs0NxlR3kJO690zOcKGGRF
X-Google-Smtp-Source: ABdhPJzIQGuhqrs+LAYYf3wkHo8TE1r07er8yFi17zuqpahqjwCcY3MaVt9MT7wJrnhd7p6p6ntCqQ==
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr7911009ejk.290.1595568378706;
        Thu, 23 Jul 2020 22:26:18 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de ([91.37.185.204])
        by smtp.gmail.com with ESMTPSA id d19sm3451397ejk.47.2020.07.23.22.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 22:26:17 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v2 2/2] buildtools-tarball: eliminate overwtiting OPENSSL_CONF
Date: Fri, 24 Jul 2020 07:26:06 +0200
Message-Id: <20200724052606.6726-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724052606.6726-1-sno@netbsd.org>
References: <20200724052606.6726-1-sno@netbsd.org>

Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clarify
whether nativesdk-openssl installs wrong content or buildtools-tarball:
    (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
    (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index d0f8dd7d7c..02e662b5cc 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,7 +75,6 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
-- 
2.17.1

