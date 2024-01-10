Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB84CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 04:49:55 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.5432.1704862185635219649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 20:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpEC/Uk0;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso2681936a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 20:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704862185; x=1705466985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVPgozf378l8LSSHJ66gvz+bYLnvJ1UFC4zdYWQyiFI=;
        b=FpEC/Uk08pud3lohGx4+FeWhA0c4bABY+3ctmqb50jB6oYytmpmZCSIfH9tPCY82pm
         q692TxlojLGC3qbZgybeHJuIDvJ83EonQn5ra4g95wuOatpW2M0EMcOGeY6qaxeJkh0f
         j4/6AKhq8xfwHitVs6FecwyUNXsHktNmNJhVOSalwAKeJljBgwR2UuZ49KbxIRXy0iyN
         8W1hhN5att4eVTyMB3Xqw2qYklYD/1DHxWEOMTJHGpE91SZutZRQDgWklr8l3fQtzVnu
         Qm4hhBGpgXj7Y9C6m7HyipN/lS0ctxprE0JVKSyZtr65QlCn+xcTuYA6WyA2JCBp6/fm
         hgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704862185; x=1705466985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVPgozf378l8LSSHJ66gvz+bYLnvJ1UFC4zdYWQyiFI=;
        b=GYRuF5og9GOl0767l0w1KqcvyidA27FQ/diEUpNQbqHSMyHZ5LNfjfj7bG3MkEEbbN
         WDlhCKIB+f38rkCa2gSNVaMVl4UEV879iYaQpPHbyx5maXRMxOVRHLot4sO6G89Pti5A
         mtqG+H7WoiEwKG91JkE+5miOJlU2deUDwT2+jllFpAYfP13zFWGVzxCBkzx4GraHt1Gg
         wmmHw+yYhreDyvJo+BHtDX5llS5fnZXilvn66SRdRQ3ADLtbK3QVBXH0wnzUpVD7wK0W
         o77ZUBsLV9dfKUTNdwPfFViq6ZOr6YYktVjo0UbL9CHBMqwljk3Q75zIWj5Se5djddgf
         YnhQ==
X-Gm-Message-State: AOJu0YxkP4p+h4ZWVOzZxshHXwkwHvDcvyHx7YbONSUv/peafp4BKjES
	CPg/9avioeokSCkKbuokxn0gJy8ENn+Cvg==
X-Google-Smtp-Source: AGHT+IF20rh8VbpawgluT1i6N3Q6XjZXVq+M9viDMPs3uh7MPqWzLwGIJ10157JRMoP6ADooEuWRSA==
X-Received: by 2002:a05:6a21:998d:b0:199:6496:290f with SMTP id ve13-20020a056a21998d00b001996496290fmr446140pzb.73.1704862184558;
        Tue, 09 Jan 2024 20:49:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3c3a])
        by smtp.gmail.com with ESMTPSA id oh15-20020a17090b3a4f00b0028c1a5aafe5sm389430pjb.14.2024.01.09.20.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 20:49:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] coreutils: Ignore line-bytes.sh and no-allocate tests on musl
Date: Tue,  9 Jan 2024 20:49:41 -0800
Message-ID: <20240110044941.3134791-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 04:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193488

bash fails in xmalloc when running these tests. More thorough
investigation may reveal real cause, however, it seems to fail on
other musl distros as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index e3e27e099d0..c0ca150253b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -210,4 +210,10 @@ do_install_ptest () {
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
+do_install_ptest:append:libc-musl () {
+    # these tests fail due to bash on musl systems
+    # xmalloc: cannot allocate 16146 bytes
+    sed -i -e '/tests\/dd\/no-allocate.sh/d' ${D}${PTEST_PATH}/Makefile
+    sed -i -e '/tests\/split\/line-bytes.sh/d' ${D}${PTEST_PATH}/Makefile
+}
 FILES:${PN}-ptest += "${bindir}/getlimits"
-- 
2.43.0


