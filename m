Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A087E6402E
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.10482.1732226081752053587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sMxUv/7i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso1154085a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226081; x=1732830881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFqPA8iQabHJfu8ZiG6+BBo6gmR7U6cVUM3KSAJiadI=;
        b=sMxUv/7ibmZQM2/6FCyYn/pRzliEmbTcnWB3KFB5eX45aAbokz1sIx6IgGZYRyOI2B
         nT2uXxL7Cr+yFcFM4UzIlg7a0x6zDnebnboJuMz2H2JedY1Q6vArCKbJmsafHJ+s57Yt
         /EUy0euCDlHdw3wPHdAPHq/NycKiHQFkhAZmZC1nax8oVLYPqDOK/tBPLJNBXAOgfCu5
         eD+uwkp65e61LDaRBet4P//KNtj08giRKG5aYWxm21Ff95ifFkn54roRorTo4W4y7sQz
         hb5NjWH921dtHoW02mp/NPLCiUJtXaCEpnlLDC7BK3fCH2uvRLW1VTBX/mG4agOSEaJ9
         VOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226081; x=1732830881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFqPA8iQabHJfu8ZiG6+BBo6gmR7U6cVUM3KSAJiadI=;
        b=uHivKQfymZwiGnC87iRXOQAqBpluF2E64yUFSpLILEHeoIcl2F7aPShTf7ViWm/sgS
         4q06Bdej+UWV0bHZHCR2nWf/IJrdihfirlpKMVJCOHupaRAHyF6P6l+aN3FhRCZObAFx
         St/bJfPCdFFUtxkNoysSF6p7aFm6rUSyp3sQMAnsUGMulnvg2MUBaO7XFSv4ZeWtlKiN
         iiHr9rxN9XVS9IOUTsM5umvSH6VDi4XMFER3OtVWljzUsifOFWyrnq/CDIwBgiFuOHIz
         ba/mmARIdG2YEtmpYmUMbPWhzvETldnABriWl25ZTUOjHAjzCipZgHpNSK+zT9Ok6OM2
         hVKw==
X-Gm-Message-State: AOJu0YxK/kPAABBsLbE9crOEPQWWGb1johVeb1WN1O2VL9/hGYwsv+Qv
	MtX/C4mAXafkvLtPEqnr5Q2U67mMedP3b+qNZJRquM+zdTOPl7aEZSRVyhB7PvV4LJwaA5SKxdC
	a
X-Gm-Gg: ASbGncu8r3olmDiOdrk79uX+S7hIT6XcBz6G4oHH/fUz8nsKWhFdV3gAF720sKGh/AF
	DNhPpYgP5Otjsnh67mT63XfXgSJWxB6Vmm4aDqXKl4tIITo3hLK5Kh9vOgdDke7X7QUFy0yFUgq
	uAWwYdMEPnY3CxUeKqqwGMT5CDs41MJoWpGqv3pQgtD3a8Nq3YDVHscFIlaVybRrqthJafPw7EA
	1dza1HUUJJfFP4rWOPsF2QnEDJ/tngxzUGCqWI=
X-Google-Smtp-Source: AGHT+IFGRRtYr8g7WB5gl/d115cVXyRJxyfX/CXid67txNhSUWwfPwQ6LyJNPOnR8YXO7YNyzD3DOQ==
X-Received: by 2002:a05:6a21:339f:b0:1db:db2f:f3a5 with SMTP id adf61e73a8af0-1e09e44ab69mr587342637.21.1732226080964;
        Thu, 21 Nov 2024 13:54:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/27] package_rpm: use zstd's default compression level
Date: Thu, 21 Nov 2024 13:54:03 -0800
Message-Id: <27395ae862a1beed067a944cbf8622fba31f8566.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207568

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
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2e3e4e8c79..9a5d04c472 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.34.1


