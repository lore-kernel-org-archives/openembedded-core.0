Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.5971.1609856656627331421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iVWHklZ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id z12so1777705pjn.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=is2u4O6Rx1t7K2g2eNSo6gBjGyX1hlxTe5S/3/VMWIk=;
        b=iVWHklZ6KLTgCxeiycGV4F89zF+Ic26gzmRaBNtsISe7k8MmblwaBH/PvpneGY919P
         hwr+jN919d44s6MYy/zzirZ+IYPAbeVOAIHEDFRPIMAnBVXWyf7RWSNnUuaY3Rw8YQi9
         ply6IlTofOQW2EAeZ0eFrKsiYfzWhBf4FZhHX27PqPb4EcYkiUGqJymYjlOeuJ5ws+iY
         xrNfgKQJR/2kyE2eC/WNNwW2TnvnlUU+jUuieEIHQMB3ACaufQE+V3I/iKo9ZfADjIRO
         wATv9QNd6uj/g0r7c2IVLd0aD1zEzeKoalTvIC3Mxb90EyU4jDKK5epJMrnm5SSx/7UM
         muNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=is2u4O6Rx1t7K2g2eNSo6gBjGyX1hlxTe5S/3/VMWIk=;
        b=cPUBoin1guB/JsXqvfH2aAdzPQkQXkFlcmGRZhE8aaaprTW10VwdndAt4IHKc2nbma
         tASVghbQQRjT83hQ/9foYO14x86ivM/UwiV4FsDyhinr3dkk55oYB+3zstyJtS8u+eG0
         1knmz1jGe6XPsVtYC8PEzMuHp9kWtsonHeqyPXe2Ydm1mZYf0bwrNPvLoN7T1gCzxQof
         AuAGG9ldMRE6k0Y2nkRGUosskzNGcRy8o5eklhCsLwH9ZNd9ZhJF6o7gSY406g6fLR30
         0etr1UkiQvVQGw8NuQvxA1Oci3n4ze7Hr3Yuh84HPeE79KGK6DrK9i0L8ULPccnY48sb
         O9NQ==
X-Gm-Message-State: AOAM530TRDn+BPjrHttnz5aNprSmSrlZtn31s0Cv6latq1YvS2xCx+j3
	OR3rtJAFSXj2wP95XMhvhB1yLF6Y8I+3Ll1ODp8=
X-Google-Smtp-Source: ABdhPJz+9TIGHu1rKb8w35YWU0Caarj4yNScyw/+0WGVTSnlQ1PekCf9dR6RhV4+RISX+SLXFuDpcA==
X-Received: by 2002:a17:902:123:b029:dc:27b:3c62 with SMTP id 32-20020a1709020123b02900dc027b3c62mr9912plb.16.1609856655644;
        Tue, 05 Jan 2021 06:24:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/30] buildtools-tarball.bb: Fix PATH for environment setup script
Date: Tue,  5 Jan 2021 04:23:27 -1000
Message-Id: <f3c6fd8bbdc8883f86c1472c951aa0725cdd3eac.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Robert Yang <liezhi.yang@windriver.com>

It only added ${SDKPATHNATIVE}/usr/bin to PATH which didn't work when files
were installed to other bin dirs such as /bin or /sbin, for example,
nativesdk-pigz installs the files to /bin, now fix it to keep align with sdk's
PATH.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67cac575a5696af5bad1aab888b65ea2686adff7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 434ffdc334..faf7108a86 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -66,7 +66,7 @@ create_sdk_files_append () {
 	# Generate new (mini) sdk-environment-setup file
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-- 
2.17.1

