Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C730C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13816.1699451232874118043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zvhj3Xfx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so5278154b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451231; x=1700056031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53bEA/XVQ6hmeKggOPFNw8XtPe8xy9jDqn9ibWbavMg=;
        b=Zvhj3XfxTTgAEIoclLqesvaSEOM/Esbkv2vXFkEL/EeIRWjSXcCvzy1zhwB3D4X8yX
         Ea1gZwurCNDPf6hVYyqcjM07YkOi6s/aqdCjeLc+iD/EM27Fk3wYK2G2sUtCnw5pcjFe
         EaES7WEDBkvc1FFlMGpDF2U0CYRlQX7vdajxOpCRXe9hNVTnAmFuDr8QLiyIXJauautf
         j/+SWMW+mjl942OLoUMLJsFuqFS+ek8Gga2gK9204HV2k1AWJyzWB/lx/7IaAM+zlicd
         qkHeFzfvy9NypzCQ7WHzfH6lHzs1Jb2224/I9sGVqmA4XzfJMPEiWDLfl/JED9fRs8aU
         hDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451231; x=1700056031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53bEA/XVQ6hmeKggOPFNw8XtPe8xy9jDqn9ibWbavMg=;
        b=Af2TL518j8+C/Nj4chK/GxSK+4kTsVTurDuMUXIxSPnUsxrV6e7d13cWlV/dU1dG+Q
         ScGCnWUIkmjK1K62lGZRYF713hvyQMtr8b2QfgGrnaVTJI5pZym+jeDf+v2O4e+qMzdz
         2w8iwAdQwOjFAcAQtBA0oeHVa/d4UahfL2jkDZI+r4B2so9w9kNtL+nUD0k2NaJRYBam
         gRmktwc7RYg2F4848ig9adztgDET2hTaT/XOMCitjo7IJJRL2B39UouUOc2dC+xKODvK
         ifi4AYITtfFtRtG7kE5X6v1gd3cw/uvNMS0TwUv0Nvsl2BZYkNCMu3yxhxN7vQizbFHc
         lJZw==
X-Gm-Message-State: AOJu0YwhViKPkEYI6B+sBWxuIs0wapb6Gm59C3HMzjOZaLnFtj9Lp7/X
	xST/MtlRWVjsXPzWdV1hmnCWuukssaG9v1JGjXipRA==
X-Google-Smtp-Source: AGHT+IEkyHK6tqKXI2dcOCQGDv52u3xrcE15Z4LygFIfFbq3V+czMLNKEhoV9zYytCCKxdAFVm3E1g==
X-Received: by 2002:a05:6a21:47c1:b0:181:3adf:6309 with SMTP id as1-20020a056a2147c100b001813adf6309mr2104072pzc.18.1699451231565;
        Wed, 08 Nov 2023 05:47:11 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/10] openssl: Upgrade 3.1.3 -> 3.1.4
Date: Wed,  8 Nov 2023 03:46:49 -1000
Message-Id: <914f5ed4cfcc5f05fc04ec990128803a8d108fd1.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190334

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-313-and-openssl-314-24-oct-2023

Major changes between OpenSSL 3.1.3 and OpenSSL 3.1.4 [24 Oct 2023]
* Mitigate incorrect resize handling for symmetric cipher keys and IVs. (CVE-2023-5363)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.3.bb => openssl_3.1.4.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.4.bb
index ff9df693b8..72338b0022 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
+SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


