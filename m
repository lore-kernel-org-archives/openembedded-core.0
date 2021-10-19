Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE92C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.11398.1634657693643858945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VLS+SdGh;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id g2so12486613wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BEvCwMawfGkJS+EXtNV2XRsieWdJ7uHLNKkV5oB8edQ=;
        b=VLS+SdGhPwlmEvXwOK5amZRc9egtuj+quE+m5TvfHDkC5CScWsg6H9TX0DVkXJLZbz
         nYJ1lSZy4oWNwV5nrvh0InHp8uUOVg8fgL7RaTLn9lNQ4VlJGb6F3W5824fNdLFvVRuZ
         3/B8XEowNskr9E4PTGW6MLkFPJIJ0Ba4Xm/71sKgXOmAhdJ9gxXQLwUdS37kKGcua++9
         zMtogP4TQlCDa3s8gpowFA//K6fnQjVVRQ/JdmDHr4ESrh5pRfhGvjo0PvOLKRZ88y12
         01aiF1vHLz92wC8F/joBNuYrOI5NvgPNhtbQi7k5yyiyIhjYUUxfYBpnJv/gYPYu9A2w
         JMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BEvCwMawfGkJS+EXtNV2XRsieWdJ7uHLNKkV5oB8edQ=;
        b=ZPgIaXz2S9YMw0CwvwmeyGB3rxWcbMuR/EUga/ZiQvaVpuHL89kolI9STheAoP8YGT
         4G0A140n1FuHjvPinxynIcWkeTnlz7GA/4w06iTlj4rqPlK0JdS5jQDcB2M0oBLjuyuu
         i4iKt0CsbbXr5SDYCcqMjdxYH0YkVtPQ6srUDNm6BFQWDr0K2u9YKbz/iXuPZJcicpTG
         K+I/poNXkzSyYE36Hu1L4ZHoTCu0BO4750YSGcySRG7cUJj5TFhnzNUQsJX9kYeJDSTD
         q7FJEA0ptMk58HsVmVRJYfX7/Xc6KoYXj7xqVIACi0eXpY51JXpWdolrgNYLoymAgqv6
         LJgQ==
X-Gm-Message-State: AOAM531ezUyZqmbQ7FNNdhjmo0YRDbKvzHKGBvjr+eSBCp8OrRNSSGeg
	+QVcU7Myr9kLyIUadLxs03BIcNGuvyk=
X-Google-Smtp-Source: 
 ABdhPJyZxAPo/HVZtrfHieMQ8ZiR6pL1QJ1l/cl+HP+7hGkNvIQhy29rXY65WPoRAzT36XDDjziKgg==
X-Received: by 2002:adf:bb49:: with SMTP id x9mr45797579wrg.413.1634657692292;
        Tue, 19 Oct 2021 08:34:52 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/65] libarchive: upgrade 3.5.1 -> 3.5.2
Date: Tue, 19 Oct 2021 17:33:54 +0200
Message-Id: <20211019153419.3319802-40-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157159

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.2.bb
index 7d98e573b8..385bcef6e9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a"
+SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.20.1


