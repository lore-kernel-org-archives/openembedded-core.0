Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FEDE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 07:15:38 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.13348.1736320525926299532
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 23:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvUJskIy;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-305d843d925so28878711fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 23:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736320523; x=1736925323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYhLACtAmrSrRPh2NLk76EOS+gPvJtpzTiDY5Yd9hLg=;
        b=QvUJskIyvkGxC25w/0w2CfsgvmBYnbZOUuGSUVBlxIUm7URhXUBD+OE8+iXlE1011L
         xxFgIGqojmRm3C86xDX87wLPhKwathrNPMa22KFMo5gGVsdV8F9gMf0x9U3//ZLIHLu8
         jlP8Xhs/8qc8mOkAoTkU2Lxyu9tzDfE2puPWA4eWY/U3I6Kdgn4kpIIe8RCELKTP9cjO
         HszyalJDHiiJjPiBY3o6HhSnG0ie7uk3CgOCiFGbAcSqHeEiLKsPaSAFOdUztsa/KMnV
         EYcbSJ7W30oorq2GIVGJgw5hvjmeAR9mFKNWQ+g/KW6gYqKxhCTScjtmSyUkyk3kOgIC
         017A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320523; x=1736925323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYhLACtAmrSrRPh2NLk76EOS+gPvJtpzTiDY5Yd9hLg=;
        b=M3CEIPhVmoZ/JJuQGixDls4B7iZ/QWigct/0A0CThgv1u4xwk2Z0p1rcE+4kr045C/
         rc2ECwVJ6KUH37VdtFhSZjq/7v8tBLklK31VXtDzceAeJHXZQdO0HNxYu7Vxz1zneol2
         4O7fvZDZ/mVgXcrw1NG9dmPy5EMVeum7DwcQ/a2u1WEuKt8mjs8QiAMHlvexL2RItPf4
         LYzQYrdco6KMBt4X9H8u2jTwZg/WY4pIYxBE10T9A/45pRlzWEmkGd+gsiT9mDwc8qr9
         TPj7kph2P75FFuJ7J+7b3brOjBSnT5L/c3eT26z+vFCZUWTUHzNseTUQgdCsPze8btXj
         GL5w==
X-Gm-Message-State: AOJu0Yzt99NGHyUxWqVga9p9MOnqSfLlBrbnYs2INlKpk5UDQMulDkOi
	FUp5D2W+GS5lYAVm8u2ShNHbBhisqPTwT+p265/BzXNuIFJnqiFIuQqwQw==
X-Gm-Gg: ASbGncs9AI24m7xXcIr1iN6NOHHia+FPTmPTt6xoB8k/e2RFMWR6nK12/6xfQVe9umX
	yUEFq7O8dKa7s2EudN1kU0VnE9XTqX72KZ3Y9q9qMhbjEm4biQGrWiH1KsphYLs0XhSOwi4xMgD
	WmX9QeYTkx1ZstCA0RnclqunTxUQAPyl0Gk64oHZOITgbPWsJSHc/g/XOhU6FoemUfr6a7u8Vlq
	4t7cjWigGraUADxjTAWDpkpJkDu0DKlCE0A74HfN8f+zrSKTLQYvn3NcrEC
X-Google-Smtp-Source: AGHT+IHq9ifseS15rz3H0Gp0GR1XPLugx9zY21IVbG/icXvB/AHHFLVCvi5Ia3Er7eQ8x6AYoQDczw==
X-Received: by 2002:a2e:a98b:0:b0:300:3de4:ff7f with SMTP id 38308e7fff4ca-305f45300a1mr4157651fa.6.1736320522941;
        Tue, 07 Jan 2025 23:15:22 -0800 (PST)
Received: from ltbabn.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab988sm61765641fa.51.2025.01.07.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:15:22 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 2/4] glibc: set ld.so.conf as conf file
Date: Wed,  8 Jan 2025 08:15:11 +0100
Message-ID: <20250108071513.2807528-2-bbara93@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108071513.2807528-1-bbara93@gmail.com>
References: <20250108071513.2807528-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 07:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209518

From: Benjamin Bara <benjamin.bara@skidata.com>

This enables simple overwriting when multilib is in use.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3352f3e2f5..ad34b87929 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -26,6 +26,7 @@ INSANE_SKIP:${PN}-dev += "staticdev"
 INSANE_SKIP:${MLPREFIX}ldso:append = " dev-so libdir"
 
 FILES:${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
+CONFFILES:${PN} = "${sysconfdir}/ld.so.conf"
 RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 FILES:ldconfig = "${base_sbindir}/ldconfig"
 FILES:ldd = "${bindir}/ldd"
-- 
2.47.1


