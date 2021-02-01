Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.36632.1612196844615629975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DZTV7oaw;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id m13so19354806oig.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jYJROwyVd56YblL5/t+jggjb3z361Cj43cqCACCMvTQ=;
        b=DZTV7oawuU0raigScgLm5T4aezRgB+sOR+C1UKMjioIRe9Rhd70PHM4JQPnUlymgBV
         sEHOUJ70CHx+p0Qc1ZZOzxp7iume++PISggAQS0vQ1WuhUcvSp7+Gb86cQ8sIfgcev3I
         zOS/VeBWRDlI6jh6kkHozrIk26JT+hSkzPSveFiS4WPXdGddjHMQEnCvltihSN27y603
         1lz3yu28v9aKUONqb2T30lbtCAwDhOUOREtTBmQzklbl6/DZ7KsAsgKxxuZc3b+S+3bu
         hmbcYDArrxlOs72KXIc64zZKW3wyNrhis3XO/jnJ7dbtZMxdCfiQAYcsXF4lYHI4yS5a
         8GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYJROwyVd56YblL5/t+jggjb3z361Cj43cqCACCMvTQ=;
        b=qWY+EK87KBKX81a8TXirkhS3YrbEPEN282uqoAtOC5kT8OpYz9ko49Uf5zxG/Qm/IJ
         NkHvC0ydLZkbuYFSADOwlYaaeVPi3OEIr9WD0GIGZpZLcOQ5UhfvNirdgr41hGk2S8Aw
         n9iB5PqSiW1on3h4QaU2jKnwlXHhQrCUK1p29ag1hQGgDSB6+9OcslPsDR6chMpyBuCD
         5da3hepn2vJhBjLOkdItNVSjWrubhwQZRQOLysLnBnEcTHUVKnw8FVSaWSP1nb3L9hQ/
         Y8WjqgAlK2n3j2HSGFBFmuxZrTWQtwq+xA5vVfvGPCNa9CpAQp1othZqNxHNidGKQE2G
         gqfQ==
X-Gm-Message-State: AOAM533WZDs920cTYCuggKyO80N2ETT2c+CYVajZEgA4735P8IcnCkxp
	JIpNvn3mJP0KDEayMfPwfcsKMfrcwUFDbQ6f73s=
X-Google-Smtp-Source: ABdhPJwbfXFQBCIO+GDqna1LVDXCUZyPVoOTVgoLoof246ExopAb1/x7OpXPRzhnfPjD+pYt0ORx/Q==
X-Received: by 2002:aca:add7:: with SMTP id w206mr11432557oie.86.1612196843543;
        Mon, 01 Feb 2021 08:27:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.27.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:27:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/21] staging: Clean up files installed into the sysroot
Date: Mon,  1 Feb 2021 06:24:52 -1000
Message-Id: <e0cd2e1f9ae956d72b8033ce1c4403d8bd99d3d5.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are a variety of files being installed into $datadir which we
don't need. Pick the top "offenders" which amount of thousands of files
and simply don't install them. These include things like test data,
terminfo data, locale data for native tools and so on. This saves
copying these files into native and target sysroots and should improve
performance (smaller sstate, fewer files to copy around).

With this and the python recipe change, alsa-tools went from:

recipe-sysroot: 18357
recipe-sysroot-native: 14129

to

recipe-sysroot: 10809
recipe-sysroot-native: 8079

which is a decent improvement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366c72941fe1c24d0b1d96df46e13cb9eb4e79d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 5b04f88b2d..506ce0665e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -27,11 +27,15 @@ SYSROOT_DIRS_BLACKLIST = " \
     ${mandir} \
     ${docdir} \
     ${infodir} \
+    ${datadir}/X11/locale \
     ${datadir}/applications \
+    ${datadir}/bash-completion \
     ${datadir}/fonts \
     ${datadir}/gtk-doc/html \
+    ${datadir}/installed-tests \
     ${datadir}/locale \
     ${datadir}/pixmaps \
+    ${datadir}/terminfo \
     ${libdir}/${BPN}/ptest \
 "
 
-- 
2.25.1

