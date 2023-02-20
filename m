Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8590C64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:21:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.28072.1676931649220526811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jrLh9oJs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id e5so4042551plg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6VkclOIpPDRiD86UiuJ5LytlToGujKk1DrtwNMwbsk=;
        b=jrLh9oJs+vpku/9a08oAi8dy/GpJmo5lM2uclL3Op6camVd+b03GhzKFZ45xGaAgnl
         RlGfaWcUOwA48ZTPZIyJKGUyAOBAZTHhZVkFmAIOQCB0/5vM2+qsBhdrGjsHM1+5DH+r
         SPok8gdQotqFiJLlsRgqinRs2jZPdYoyLzvtcrUXdnH8+u5ebrj4KkdNNxSHL+gpmtfS
         hY0xu8DKBmUvvcm3Sgjs34ZrGmaynQThXGiXMx2vH/kCQrnIO2vJm8oSSEGGSkeQu7GE
         wFES63bP1+0sjZRyloCL2lSooirvhjUuZOM1wZ55+Mf7shJum2AnhZRloj8+AYO2Z1Ur
         OgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6VkclOIpPDRiD86UiuJ5LytlToGujKk1DrtwNMwbsk=;
        b=OPc+C9WGkOwnVKuWFtIr51TkPvzCgyPVilQ93GESjpnDa+xzL80tNIMebJdZwDuso7
         HNha3qhKMgrln1a3cVSVudL5UbOecpe/YJrgQgS6h9Bp963QbbuXnrRzRSrKLAtRgzpf
         ftl/9WIpvB9SvA7SmPvkvgZ4dz7Ew4NtHOU4Veg77j18jZEO0VYBRitDEb4xoIv59B90
         k6UCUy7kwYGFehc6vxG1g37QB18AmPX12Gl6dG8HFajQuTJi1ahrYxQHRDyw7/isFfZt
         k4YQQcVyNtlsYnwYOO2vn9gvjdSf0iF0FmTkq+zGok0bcVVqponALNjKeFyIICkjSLjg
         v1MQ==
X-Gm-Message-State: AO0yUKUOnAiJxz3WpCIuSFLR6XtKPERYpZxUWqa62m5+YLozDEzC54rG
	GlSF/FpzxIVUPB4uxiJPpxNPaNiYu2TfgQYrijo=
X-Google-Smtp-Source: AK7set9TFEWAhpXfK4dr18OnULyWh6vH3rcU6/oksAl75F3DvRDJYt0sbmkJJWhWJl5xwLPJn6OE8Q==
X-Received: by 2002:a17:902:dac1:b0:19a:9055:6658 with SMTP id q1-20020a170902dac100b0019a90556658mr5427379plx.18.1676931653528;
        Mon, 20 Feb 2023 14:20:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] libc-locale: Fix on target locale generation
Date: Mon, 20 Feb 2023 12:20:20 -1000
Message-Id: <63141bd8c19285bbef33f3d32a89ca127da0c658.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177473

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If on target locale generation is used, it fails at first boot showing
errors about a missing directory. Ensure the directory exists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2844c9f1bbb729562063d96a3d1cc9d44dafa0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 1143f538d6..72f489d673 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -45,6 +45,7 @@ PACKAGE_NO_GCONV ?= "0"
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 locale_base_postinst_ontarget() {
+mkdir ${libdir}/locale
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
-- 
2.34.1


