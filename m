Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405FBC47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.151014.1703864740546097023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m+Gwww5l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d3e84fded7so34837985ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864740; x=1704469540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPCes6MByJtstQjDgUyNzJpBiWPQDftKxOVvWbBrJH4=;
        b=m+Gwww5lLobRi94YRwKrGI3a+q8PLCHGJwtHKKZsZ/K2f6z3C63FC0uyDbSIgF3Ofj
         LEhtSt95IEyOm54PoTQMqT9RacbWRvu1zlBMaDQqxOXdXEqnfproPmWZHuei3/rHbyjn
         eI84vrlf44Jag6HqUJVEOZYdGcwCqct+DRkKhduc4FLuh/BiYjYEECeEYHAKm2mKwKDV
         ZWGYXBBmS+hstVz7sfjGNIQodbudEJ4c8cSdyUY8o+kpndKXiZ+iotkoAAKSCAPJBUJf
         pSZGtoaEerWSD0k+pNhJ4VSjTDqd1e7bhMFOxXDegPiaWnSaRVEPLdxQ6lVJpiFiSJ0K
         OxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864740; x=1704469540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPCes6MByJtstQjDgUyNzJpBiWPQDftKxOVvWbBrJH4=;
        b=decKcPeUr89jaWgncokN5sDt3A79zKaLLiCT5Fs+6ATS/3iHI4UG53rged7/KjUX0S
         2yq5rgPcZMeQ4v3FVQpkhkw7q7kNJ+JiAt9oc62Q7K8dQCbICUQy9ahI/Qv36sk2Zwcy
         YQ67jc3qyxsICMdoG2Ub3NwoC7HidsWLBoTozXmSKpy83qIHkwNdmUTpVJtUIq5mvN90
         9py/M1F+cc0N54TuCUN87OWNmoz7cCvoIJ6yxMziQpypl22OdAfUbKw7/y2RxNii1/J5
         Ajv/EgKXCixJ/k5T9FtCZRERmlyfcLY5actOJPE50OXM0tUK7XyaNqUtkS4JJKy7qKNK
         M8bg==
X-Gm-Message-State: AOJu0Yzj2VMdqdO6xD+FjQF/9yPusftDDjg8vjm5e2fC9ThhPLKPuiMt
	fo2IFRg2Rv/YcJ1mExMABaThhQmOqoO4/4MebC7fatr2yxOBVA==
X-Google-Smtp-Source: AGHT+IE/fCIGlWDcNjOTn23Iovq2WKx32qY/qXtjSQcpD5bmanAFcOGyRtGTur1S9fbVxDucdH8PpQ==
X-Received: by 2002:a17:902:f68c:b0:1d3:6255:6c9b with SMTP id l12-20020a170902f68c00b001d362556c9bmr6586545plg.3.1703864739718;
        Fri, 29 Dec 2023 07:45:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 19/41] libgcrypt: upgrade 1.10.2 -> 1.10.3
Date: Fri, 29 Dec 2023 05:44:33 -1000
Message-Id: <451480be9e8693d026fb408f5bfd1c6c77ad7182.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix public key computation for other EdDSA curves.
- Remove out of core handler diagnostic in FIPS mode.
- Check that the digest size is not zero in gcry_pk_sign_md and
  gcry_pk_verify_md.
- Make store an s-exp with \0 is considered to be binary.
- Various constant-time improvements.
- Use getrandom call only when supported by the platform.
- Change the default for --with-libtool-modification to never.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e21583896116cf37bf6b95aea466854e4fd5e54b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
index 524b06ca22..1c4f4d6038 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"
+SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
 
 CVE_STATUS[CVE-2018-12433] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
 CVE_STATUS[CVE-2018-12438] = "disputed: CVE is disputed and not affecting crypto libraries for any distro."
-- 
2.34.1


