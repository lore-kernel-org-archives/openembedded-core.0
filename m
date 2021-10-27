Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C33C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9243.1635325664779249894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iiZCx/JQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id p14so2839187wrd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o3QPcRKtvQD17cOg6AVIPXl8PzaN/QwmjeZmFrCF3QY=;
        b=iiZCx/JQZZVtgKEh4cZJTTvA7F/pnPUqJF4UAJPOUkwiwCSJmNjZYTMboZ3GLJeSMf
         FAXx6KmFoal8xMyBYiCDzNNZUGe4QodKeakZD1rtZaIcLgo8uZTjfWT0lkYWMe+x1Z+F
         swe4PXEfSwZ3gMubjg20UABFebfR5FTAaU5i60hfs+rrdylq2j2z5iVdOJ9pW+TSI8l/
         8zKK6ZUgeELg936ETB5qiWgRKqHTNHszaaf+Lun6M3iE5IuorL5Hbfx7c2uHs4abZ1xq
         eXIJpltX4g2n5Z0d5d2AMKfFVCGLnnHzzlX0KYGp6WTb57b3+SNZ3/c7CjEYPOtHpkvE
         rnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o3QPcRKtvQD17cOg6AVIPXl8PzaN/QwmjeZmFrCF3QY=;
        b=DHlkCqNRZ+u4f/UYO8Eh4ILQv0ujwohz+Oc1L4OQ3/Oc5jID0kf3SInKw+6eD/C9PL
         wBn8r/5t3fwvYp6Gxk4MyY8Jsnu9bKVPOVgjlWYHZYlF2DAS+57nLGgImswURqpFDyzh
         KNVTjIDDDydCF/zgzSScmV/+GHVjXZlu6C/vislVkFlH66ZYVWND9h4KtfyzQlt73857
         LBRCYhAI2GPcytspLbv/cpppaVsf1SNWNsJOBNqt8Xe68xSWXCti3YD/9zf/1mHyaX58
         +Kew1AmURc87OR/iFlxQzmr+U9KqVFyS54nqrsn2S85hw7IxvTJNnN599QYQoH7Vjieb
         sDGA==
X-Gm-Message-State: AOAM5326vMqpLZPPCs8Yq249X4bCRmlWzCka5eqM4V39yQUeGXkc++iH
	lRtjmgROef6IpZPeZm92Cor56UW8F+A=
X-Google-Smtp-Source: 
 ABdhPJwgh9fWqlV52GDLE40K1stgxhUNtGdMVZlCbwKGM5K6MZnWxA5J/8WToxEK++R4kCCulmLxQw==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr38035448wrs.436.1635325663457;
        Wed, 27 Oct 2021 02:07:43 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/30] msmtp: upgrade 1.8.17 -> 1.8.18
Date: Wed, 27 Oct 2021 11:07:14 +0200
Message-Id: <20211027090736.2546759-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157484

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.17.bb => msmtp_1.8.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.17.bb => msmtp_1.8.18.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.17.bb b/meta/recipes-extended/msmtp/msmtp_1.8.18.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.17.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.18.bb
index b451ff7f28..1a6cf72392 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.17.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.18.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0fddbe74c1a9dcf6461b4a1b0db3e4d34266184500c403d7f107ad42db4ec4d3"
+SRC_URI[sha256sum] = "14fc62af37ebdcc5ed19a245a05eb8376efe7016118f00c9c594bc999d5560a5"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.20.1


