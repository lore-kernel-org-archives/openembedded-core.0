Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F07C4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.3577.1652871540591041818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y1kuJyYC;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n23so2553534edy.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TYF7nbInCWBlFbcfe1q/7pCeWYyXbAziQ14H939icH0=;
        b=Y1kuJyYCFnYvPYnqNA4oU0a3JOky/5Ody6g8v1onB8LHGPy9I/WA+J0dRKN9m1hC+S
         zM9H5OUMC4Q/hOmJRQytLhSrD3iowmRlcLwNSN1UDLiklNw6ipM5sfc510ucAL0IQOzd
         TteKw+CeDx9KAGMp2wzEOMxBgzVbqnvKj74t8gzPKOOBRSDoFnPq/qB4KqO3PrmhXPmH
         v2MVYmzrK5wBvV3VBxqVnrTyaAASfSxPe9CROLMefbAD+E4UZhu3O21aEF8XpZfUDIOl
         yktgN+FKrCc8LuU7AA51WKXSiW4IpUIoj3Swy25m/HcHYOB5DuPsjszK3pDHenMFePeM
         MK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TYF7nbInCWBlFbcfe1q/7pCeWYyXbAziQ14H939icH0=;
        b=i39Jgdtb9xEbzlzIdjp+90LClQf2NwlNXd7UJN+N+Uq6ktYiaudbW63oG0fezx/h0i
         vXrY6ffyWtLpZbPODuXg/w2nLiW8UYrmTn+S3Y8Z49p3qAx/rjJMAv812/8CbNghsXz8
         8zfpOWDHjFqNXKyA3RuCFOdwNm45ETqKg0DY9jqpbD7IJYUctBvglq//8G+IfAMnLRWd
         LXjLY5Y2nI5fMsotcC/o/8QET9H40jbiWMLgD53wUQCXRA3l5sELzr/atR4hbQpZBNEv
         i1vjD1N+VIrVy2ew8e+XzJVWLou2q85gPiuHDvzf0LY36McHpKfp6QOIfHRUE5avYSV2
         79eg==
X-Gm-Message-State: AOAM5330mdPadgHm+GpdmYA+PSmQ8ec3NpCEEaHcmjVkeAvjRtQUnbuS
	BZI+3nL4bbb3MAbyl+OkGAetKDgsgmg=
X-Google-Smtp-Source: 
 ABdhPJzKmvr2MzMaI+c/E5W1+AQ1gEYwUVukynZZaNrRUVfNQYwQJHm//ATF7+6JobaO3rmdd4RRyg==
X-Received: by 2002:aa7:d486:0:b0:42a:b40a:beee with SMTP id
 b6-20020aa7d486000000b0042ab40abeeemr14837269edr.281.1652871554730;
        Wed, 18 May 2022 03:59:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/49] gstreamer1.0-vaapi: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:21 +0200
Message-Id: <20220518105843.3299331-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165824

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...streamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
index 48b571f563..40dc21cf45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
+SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.30.2


