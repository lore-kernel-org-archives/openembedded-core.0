Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92160C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 03:56:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.13226.1690257390207554402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 20:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=P5SAPnha;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8b4748fe4so28545565ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690257389; x=1690862189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARUCFM/ILKZZJDSMOZ/FE2M8M1vOsl9LduRjQNuWxPw=;
        b=P5SAPnhaUaIQvh0xnJoQHhEiBdGReWwQIpwmiGtqS7jfDIpJr+Lr62UQVG79gJbL0T
         FR/1vvsxJBFiT4jUWKVbinepmkHCTAglqKOTRw58nr95xAp0D79iQDNUIL8RDrRGY3qb
         OH2PXpvfXveJXSGvSeGGFaSIAYvMMB1jjLQl6W0JvAyAvltRfLqBzLxEYp5T+IYV+ZG0
         /iIfcoqik1Sm5GWBDLZla8RzmnudUjvNJPp0neS0dCeaJkJsDhN1KT8Vya2giTF19pes
         OeqUyrjCIffY9vpDShfZCYKkVk5hkWoWWDViQ4c4g0OQk+N0bH97hw3+olbZwEmI/nhr
         4MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690257389; x=1690862189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARUCFM/ILKZZJDSMOZ/FE2M8M1vOsl9LduRjQNuWxPw=;
        b=KrODNrRc10Im3kdrwxVcJPHbpkNVYvj4siC5xt/8GbEsIwn+yr/anMGpUTcrgR67uZ
         0thiq/ONJPK7wi8UET6YXoeEygoLA09LE/08IVfIpVZaY+yGI0eKH3D6Sx6R0O7CmVN0
         7GgAPoKM11dBA4kRno/nqjNURrhK44Ix2xmjREq9wR3k8n7OrbKDuD376EelTRuRI/GW
         /AVUexlnDQPoqzDm3nY9vkGTphmtvHUigyJ7+O+QF4IAHjsuPcXYjl51aerjUEZATslM
         d0qttj/bEIYawY6zTjOsXXuceO+cXhS2B62Jj6DaOolXZJfrxPsljayyE+sQxqATqZI3
         usmQ==
X-Gm-Message-State: ABy/qLaL+GP8ek9n3bIcbYne3S/pld5qdtElKSoo47RiLxY/MBNMHFtI
	SLPT7zs9QUIiA9spPboMkQ+l6r+Z9vEKtQ==
X-Google-Smtp-Source: APBJJlFFzkJhanaXYzgt8MkwzbfRodgJEGHtPIQCOQ6FUvuhA5dznTPire37mG6CGt9kzZvMAwscGQ==
X-Received: by 2002:a17:903:11cd:b0:1b8:2ba0:c9c0 with SMTP id q13-20020a17090311cd00b001b82ba0c9c0mr9597316plh.59.1690257389354;
        Mon, 24 Jul 2023 20:56:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6adc])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709029b8700b001b9de2b905asm9808668plp.231.2023.07.24.20.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 20:56:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Enable mathvec when sve is available as tune feature
Date: Mon, 24 Jul 2023 20:56:26 -0700
Message-ID: <20230725035626.984709-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725035626.984709-1-raj.khem@gmail.com>
References: <20230725035626.984709-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184820

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 8ff9801ed4b..4290f3e6e4f 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -85,7 +85,8 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
-PACKAGECONFIG ??= "nscd memory-tagging"
+PACKAGECONFIG ??= "nscd memory-tagging ${@bb.utils.filter('TUNE_FEATURES', 'sve', d)}"
+
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 PACKAGECONFIG[sve] = "--enable-mathvec,--disable-mathvec"
-- 
2.41.0


