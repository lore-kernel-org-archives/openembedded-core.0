Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030CCE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 07:15:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.13808.1736320526665782410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 23:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ndlJnQiU;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3022484d4e4so196809201fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 23:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736320524; x=1736925324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m50cnTA2AG1hB6UXeaLRTWeyZRXgS46a9RENZGmQ5M=;
        b=ndlJnQiUQOj7jxibo9Xn8DGzoMp29XCnkmnLIx5rfHokbaUbXakuRbnrAgAFEUmwtR
         Gs3yd26MJDODpKdKKoRhMluBYgdPD/ZSyzKaIJctDHksp2pT1L1fMV7bMBO0NP3NiQii
         Ee1UFl9mKpErt7ayiuoOhUu6gtDyVnbtZMQQtXcCbR5X78xDHt69Gw5PBAu5QxJy8VdR
         XPYUSaYQhIo26HEhSOHVuxVMQtXktKBtr+MC7qccbV2oK1jhuRWpxY/eLCQUYGAZiUeL
         KlX1gwUZC/Vhtc5wOgD9w8EvySY2Cu4+11vWxJaDjf30yOFmNqCJYcV97QrDh9BMkQLx
         U1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320524; x=1736925324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6m50cnTA2AG1hB6UXeaLRTWeyZRXgS46a9RENZGmQ5M=;
        b=AZgrXv0cq8ogjLYV8O7Ok5bTs7TTjpiEZJjgQUi/Eqf89LWK2aPdtKxvQ166UjL0O9
         BMl77aVFlqGBW1xe+M4ysf0ppvVKMHz1UulpXrpbPpUT9trBgW/XelU9zZw4HVx6+ayI
         Ok7F0iIuHqJW//HBjv5GLBDmK0N8piijDapgLuXlb9Co4wV5FSeeOVc1UJOhgK1jVMWF
         Vpz+U0ZuhoA8DUbSL8SEEbZeKKSuCdCAhaB28i6CeBZzKW+b7guuCHSZRi6lnM8Skzvt
         4kB6ev2ZG6NJhsqzWoqNG+G+fqF5fHrCi81LWgF5GzDg5Clb2kEQJhQmxVJsQLXiY1vN
         MWXg==
X-Gm-Message-State: AOJu0Yzd+63R4nsgTGXo3yZOTI5sOqWQCWUXs6YoWOtmaEszhnT9Vs2o
	iDZ5RYNfLmOS09eMBRJuavYYmsx7FMkBLqPpf2m0ljt78e8WCFcIqtSsDw==
X-Gm-Gg: ASbGncsz5mO+hmfYxPVxwVzhsv26rGu6zEUGWnamUsfq4UM/SbHcJSlM0MHeFBPh3/M
	zLu3YJpHCEZiv7hG9jR6teKWhwTKCt3WFYELHoxI0UDs5cWMEy0NQF/0kEOB1AsmorO5JLhXobj
	ueEgGds+ptvAKIfDxbiLtro0ZqZ5/ECgZjp3p3PzueMo0//ieBCpslLTQHAbd1Yf8V3nzl3bDbz
	ssFNwQvsI2IRU7CWqZ+kPLaekkJb+Z7N5yCd7662iUtckbnYfC9qrB7CXCD
X-Google-Smtp-Source: AGHT+IHggNLRGG0nLRfHrLasmbogPaia8IykOCCGSKI3r0m9h0H9oAKdGbCeq7xj4ASFdsVEY9DbwQ==
X-Received: by 2002:a05:651c:19a6:b0:302:2620:ec84 with SMTP id 38308e7fff4ca-305f452fc75mr3705591fa.7.1736320524024;
        Tue, 07 Jan 2025 23:15:24 -0800 (PST)
Received: from ltbabn.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab988sm61765641fa.51.2025.01.07.23.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:15:23 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 3/4] glibc-package: move ldconfig to ML-specific file
Date: Wed,  8 Jan 2025 08:15:12 +0100
Message-ID: <20250108071513.2807528-3-bbara93@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108071513.2807528-1-bbara93@gmail.com>
References: <20250108071513.2807528-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 07:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209519

From: Benjamin Bara <benjamin.bara@skidata.com>

Otherwise, installing ldconfig via multilib results in overwriting.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ad34b87929..1e7f3753c2 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -28,7 +28,7 @@ INSANE_SKIP:${MLPREFIX}ldso:append = " dev-so libdir"
 FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
 CONFFILES:${PN} = "${sysconfdir}/ld.so.conf"
 RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
-FILES:ldconfig = "${base_sbindir}/ldconfig"
+FILES:ldconfig = "${base_sbindir}/${MLPREFIX}ldconfig"
 FILES:ldd = "${bindir}/ldd"
 FILES:ldso = "${bindir}/${MLPREFIX}ld.so"
 FILES:libmemusage = "${base_libdir}/libmemusage.so"
@@ -123,6 +123,7 @@ do_install() {
         ln -rs ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
         if [ -n "${MLPREFIX}" ]; then
                 mv ${D}${bindir}/ld.so ${D}${bindir}/${MLPREFIX}ld.so
+                mv ${D}${base_sbindir}/ldconfig ${D}${base_sbindir}/${MLPREFIX}ldconfig
         fi
 }
 
-- 
2.47.1


