Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.7907.1611915864013055016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YvXkKODw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f50.google.com with SMTP id by1so12259584ejc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4QhVNr//01FMDB8qUsGiyTbOZo/UP+ZxjwqQIHBFWVs=;
        b=YvXkKODw59rX1disS0rOuCUi4Zc+IeCK1n8w149/SJYOQKtkEuqAFxRqSOVkqrF5hL
         DM1v56WpAcgtkUVspvFaBgQ/uSLes6mt4xtmkbY4f8MrWHaSaU7MQI+da6isOHnqymh8
         dTTeFJNLm9etgy4hIdNoXqD7q3vHYjhWeYgug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QhVNr//01FMDB8qUsGiyTbOZo/UP+ZxjwqQIHBFWVs=;
        b=eHzU/qD7rh8kBNZoYxpHI41JcixN8gNuYjsg9KDNSto6KAwxq+ny1dYJEzjkaGSrzl
         FTMcGt05jSxWg0a38GWv4fjQicsdUPxPBFDVIt6iMS7DX/3fAFU6krSsltWhp2ZJ7LnU
         f1H0lcuMhn+ldpTViB5Is6lymA7hSJao6SmxYVXceuJzY9WIrK/5ih4tbRxBLS/IDlqL
         Szhy0sJ/Y09ecm2FKpzpw38UapfpND9FtevBI5tdkvhMA46ydNXw3XN6ehv6Lvy+8YzR
         hQZfeoLaxCi6c1uxjT6pRSjpG2VIFuxiSmGRpgPTxBIQ14lVPBa3UPuPcVvHfzLKmQer
         PxAw==
X-Gm-Message-State: AOAM531cV1ZtIRKl9yfVMvGcGMdvlhyXsfTeHiQEuRkBVxXW9RUqVdCm
	toNtPi+mGQ03Jh6zl8OznlVdtUP3vy9ZpQ==
X-Google-Smtp-Source: ABdhPJyvp8bNaSQOYoF8vBYdcBqLPMtBIbKNxuTKaD+qp8qUz0DNJRlWGT/EQffXxW/VTAjsVKZtug==
X-Received: by 2002:a17:906:b219:: with SMTP id p25mr3695927ejz.430.1611915862344;
        Fri, 29 Jan 2021 02:24:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:21 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/13] bitbake.conf/python: Drop setting RDEPENDS/RPROVIDES default
Date: Fri, 29 Jan 2021 10:24:10 +0000
Message-Id: <20210129102419.1360572-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We never recommend setting RDEPENDS or RPROVIDES without a package name
against them. The default in bitbake.conf is legacy only, drop it.

The python recipe was trying to add to the empty variable in the native case
fix that too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                        | 2 --
 meta/recipes-devtools/python/python3_3.9.1.bb | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af1b3b8c3e2..790859e8ae1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -272,10 +272,8 @@ DEPCHAIN_PRE = ""
 DEPCHAIN_POST = "-dev -dbg"
 
 DEPENDS = ""
-RDEPENDS = ""
 PROVIDES = ""
 PROVIDES_prepend = "${PN} "
-RPROVIDES = ""
 
 MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
 
diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
index a89122f9494..a2dc572672c 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -240,7 +240,7 @@ python(){
     # First set RPROVIDES for -native case
     # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
     pn = 'python3'
-    rprovides = d.getVar('RPROVIDES').split()
+    rprovides = (d.getVar('RPROVIDES') or "").split()
 
     # ${PN}-misc-native is not in the manifest
     rprovides.append(pn + '-misc-native')
-- 
2.27.0

