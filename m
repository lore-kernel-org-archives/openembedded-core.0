Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E071EC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:20:49 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1798.1790148044954507177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 00:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q5/iRNcR;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.98, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-482f633cd78so369429f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790148043; x=1790752843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6hWaD4waqCr6P3Ba2DbFFhu437cwIJCP0PpkJ0LwfM=;
        b=Q5/iRNcRHn4crVhKIa5xJTZbfx6BZDZznldIQkV4N6T51W8+3bZRkp5alPZEwWbJt8
         Usrrv1nK2Hb8sGM3bpkmFdGSyY4Om00J1SdWJRuQkkYxWfIDfeO63IFV5FxZfeO5GTST
         OpxvQsxWgy9gEptzLdtjVPH20AUN42nLxdeV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148043; x=1790752843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c6hWaD4waqCr6P3Ba2DbFFhu437cwIJCP0PpkJ0LwfM=;
        b=ZLGtgoLriiSGPAUt8PO2gnYIWejcD9EzeeG1gjQ8oA2xYhMDGTfQTkuYwoicXzexs+
         5VA9l8iWqiIi8e61xZJBddmEVyRTasY9kWFb7VZmDdRoIKKBQyuIEFsSV0clPV6uesLX
         vAWQC0Ngj90y+jdaYJdTm/VsQ1WjZJQscI6ZL3i5INmk7S3LKh9/eHMXDwlrdzYBiakj
         Ao3ZZ2FLyDnw/YR85C47kJD7LvlACuLx8sPImZcTjGfDw+fQgXMFgAIBGbdqp97M9VIz
         pD8LvbfbKfVhu+cV+VtfVhcBXZw+QIb3cy6wFrCJe1A1CJU5aaSs3hLkhvXaJjcLFWaX
         taKA==
X-Gm-Message-State: AFuF++nRoigitJlqXHOmLzM9lhwhljuIPO3j9BiiidOC0sIPy1FtpzMn
	kf5FZeOU5nwFMOD7Kr/kAi0qgk7lJF3bax/qdr0P75s182jLbuH3h3FjKcJKJSIR9tetuA9jTcA
	jCDJU8u0=
X-Gm-Gg: AYBFou2laAvZ5GYQOP1w/TSq5mSR60k0NEgnCJIshKV8tVWoDZuD1QRj2xQXlpkMjYQ
	IK2hEHSpxReh+pvZbEH6Ltz4kxW0pbDgBhMNRrPqaAFm2sXbPKzHkuybTr3r1WKqhSEb4WuPXDs
	/YExVAMZzN2MBBov0mmslT//8/pYG/kmyWJXpgOAdxUWh6WOrGWaLPqt2STgwZhzNmshYPFKkTM
	yiRlasPaMkuWeF7U37SzZZN+a8ZvaO/aRuyR3AX2fiAgoQur/PSAwCBJdT6L8JH02Q/Y3S9vrLn
	t7y8tU1hmdouhkV3vCaMeQWR2tE5bKgab6BVg55JVaIrDf6goBFYEs5weUw0mDwo0UyYE2LbTux
	Zk39Rd/UQ09hXe4ozCA05abHPAKvhGqPKRwl0NoNHcV7JQLu7nq4wv9gCO/cOpDyqvStOJO2u40
	LL2QPFA7Th68SdT2J5W13msj2HKvXVThM2e4jk4jXrxyQve3yexMZM+xczW3xy5E51Xa0IwPuwi
	x9JXirAIMSFE5Gchyr8p8iK+Bg=
X-Received: by 2002:a05:6000:2307:b0:486:ed36:b9c with SMTP id ffacd0b85a97d-488670af854mr2807302f8f.29.1790148042667;
        Wed, 23 Sep 2026 00:20:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f510:706d:14a9:45ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm5427800f8f.14.2026.09.23.00.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:20:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] diffoscope: upgrade 329 -> 330
Date: Wed, 23 Sep 2026 08:20:35 +0100
Message-ID: <20260923072039.3153452-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246453

Version 330 includes the following changes:

  [ Chris Lamb ]
  * Don't Build-Depend on apksigcopier as it has been removed from testing.
    (Closes: #1146852)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_329.bb => diffoscope_330.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_329.bb => diffoscope_330.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_329.bb b/meta/recipes-support/diffoscope/diffoscope_330.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_329.bb
rename to meta/recipes-support/diffoscope/diffoscope_330.bb
index f8033216318..87c20546d85 100644
--- a/meta/recipes-support/diffoscope/diffoscope_329.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_330.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "940ee30d8d98231f4d4855e36caf96e9eec9ec3d3cb359b744687b369b2b54d9"
+SRC_URI[sha256sum] = "92fb70b930077282ceaf104b4eb02c6368c860b0c89d6aab98f0a55682ee0361"
 
 RDEPENDS:${PN} += "\
         binutils \

