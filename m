Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F832D6D221
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.78794.1732733428000664042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dnK8Jp6e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724f1ce1732so92038b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733427; x=1733338227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT9puL6y6aM1sBVdaPhgBW2nfnIf/ojv6Kr4z6juhj0=;
        b=dnK8Jp6eg3BymBLgg5mk82zz7qbe4RoOJLIYe30cv15RceWQL3lZiwFRmJstNkAblJ
         DZQSUubI9j4oWtuLZ4N3Sn9Tel0Ton0kIo04awHAQjUl7EdcUYWdVmo0B4KK0S5s0PnA
         q3Ol6roWPj5DVq5mGRaUf2JzCZAYNFtmnH8k0dsNEHtCPyypllZ0QSoGg4PDS+GV/I/x
         y13PGlzcENwIFqgsrVgH+ZqE8Uv0IEv3livfC9zHX6QqKlBOeh8IV5czR3tyCPs6NkFT
         KZOhJNN5x9t11MweoRDsBqX0B6nakB0RTNqXDAg6ppc5xvRN3exDk6Vbx1RTFhejnVdj
         txfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733427; x=1733338227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gT9puL6y6aM1sBVdaPhgBW2nfnIf/ojv6Kr4z6juhj0=;
        b=GX1MNOR182mRcG5h3s8y66UxBbMvE/K7S4He5NBDCr4PxwyKlhH4FGXaW9yULoAdNK
         VTlIibg1hM0tiM0zuGFK5LrY95Q9Q7GkA834QPoqe4ZugzKG8NT/TIjuEl++J3PHo5oc
         Rvr2AITT5GCqsQbYgmXuQJNM9Ll+vXnNz+ZO4IncKEAbdJlSGgyuf2iKukaQ99L91xl1
         YTDWHpYy5McgLm+CU6VSuuwK982TdofDUWi/Kxkvz7AV2bjuZh5tZd7vgNOm+L7yGW8f
         5Bf/InucuLClzjMPvcituTHf+Oy+2u5twKePq53Tku7m74XUqi/6yuHRVzJWVoKmgpUS
         hALw==
X-Gm-Message-State: AOJu0YyFLkgGRnLIzsfS3y1gZKPo2jL0MjABWYD5Ok4FUCLeEZbLeI6A
	17BgrwlCAlQ3slt0h28YOOjOMgRAkeDOgRO4Xj3Ut8woJkDe0ZWZYva8qLYk4sWwRhjsRBMYehV
	h
X-Gm-Gg: ASbGnctM8C6DYgereUPGGWzIWkFNUKdK9reRDxJgyzPXLSCr++JntsTGMejjF+zsmpJ
	t8v3Kqeh2pzxPvGwRfLOYjbRWPk5kgQFm53NYTDfXrgfpnbOX8Ubz2xVKqer3JGRqZ0VZMOusDC
	yLV+LOz/DaZh75dljWCw69vEgeBwGa96ICBSEnYgJD6V+Ui8ht0RNAirtjA5Ydi6MRVa+B61ARG
	bBAJ0HRhMLwsRn3JEVgLdliXGJ+jBeGrzcL8gs=
X-Google-Smtp-Source: AGHT+IE2uwj05dNfz9SlVgilztQZ2TBpSmRVOKo0n0rfiNcIYnCqVGp345+AheZFZbjsl5Ae5dpGEw==
X-Received: by 2002:a05:6a00:1492:b0:71e:59d2:9c99 with SMTP id d2e1a72fcca58-7252ff9f26emr5647283b3a.4.1732733427212;
        Wed, 27 Nov 2024 10:50:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/14] package_rpm: use zstd's default compression level
Date: Wed, 27 Nov 2024 10:50:04 -0800
Message-Id: <c377ced95ef7fd060316db1325529826d0985790.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207953

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f403af5343..198a6d0afd 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -4,7 +4,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM="rpm"
 RPMBUILD="rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.34.1


