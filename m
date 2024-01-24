Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4899C47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:38 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.23133.1706104892667853939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2FBSkoQ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e0af93fdaaso4853192a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104891; x=1706709691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlXf7MFZws3PcqtCgVNNCQ+er2Wt2IIqbXrmHft/5JM=;
        b=2FBSkoQ2roJ5pn67Zhbfi2QgJbJ6+U2OXysaJcM5KA49UbfnaTqphI3tKwX5t+cekW
         96g1a6l+Q40mGQy8Yu8P2lYDQDNtjHAc8Ar3EaQVXrMxq7xjKrTeGKdlQKbStai+xao6
         e1jWuDfvmPH8Eiwu9nl6Ib1CDpcJN+NySn2zT75ED0F/jBOrOvMkSyNmohhXa9uesp3H
         /f1kNNqcvuO0Q4ClXGu/WXH5YW2edUgF7oV86dGwBwkVvUxGQneNqVCyoSrKcUc3QPHg
         Tn0Z8cx+nssWK6SzA201fZiaBsmMW+/GrtCeH3jqvc7WYgeIV/1GhOgxLCDydx0+B2xr
         JOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104891; x=1706709691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlXf7MFZws3PcqtCgVNNCQ+er2Wt2IIqbXrmHft/5JM=;
        b=ndrrXZ9lRsdM/RO6k8RLVE0xe+fpVtQ+9Jt/zxPptbP+QxLQbbZayULOZ4UuTiCO5d
         nrBBT3c2BY2ZAiokpVWhonKN4aiOrMaEZ8Ntih0c7XES6cShNo5Y8ENjHMjowI8a+4/V
         nlxpif5VAlp+8Nvb0wgGkZqF2/+40uq728CI4Ne2lkDEu1ITKh9QSjIo1HA5XV+SJB3L
         EWRx1hwSa8qk04w2NiQwCbrxH7JRF9K0fNR/GoqaFKHb37yIA/h/gVnohbb7/gprpRgJ
         +FOG7sdUvlR3uu0N320ksmWtqTgxIPn7weCGMBv41XZ2KmLdmijo8bfdiPYJ+4KAz0e+
         B2JQ==
X-Gm-Message-State: AOJu0Ywo47mL9R/UhUksNtFWhNwjVzaDOogJecrNHCvQ5clAqap51qG/
	CdT2nXyKiLYJVclGnljzFCRk2U1xtP2udgdvZ4DKiQcitimJzINJdz52C8IYaH41Bw+2NcJeAp9
	QiMc=
X-Google-Smtp-Source: AGHT+IEOP/W1NfT5Gmyi4uN22x7WmMm79hgEBnUg54N3tz1f9cMP/l0tzlptdBXNiLRHhaEPr4Dm7A==
X-Received: by 2002:a05:6358:6384:b0:176:7c1e:c7ab with SMTP id k4-20020a056358638400b001767c1ec7abmr2559152rwh.50.1706104890739;
        Wed, 24 Jan 2024 06:01:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/12] base-passwd: upgrade 3.6.2 -> 3.6.3
Date: Wed, 24 Jan 2024 04:01:07 -1000
Message-Id: <a13fd3a4182a97ee0c8a2b49519e897b92f3a987.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194280

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74d165f5baacd0cd94eb90396b0a3119281df91d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
index bb4b49e6ab..9d7703b1c0 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
+SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.34.1


