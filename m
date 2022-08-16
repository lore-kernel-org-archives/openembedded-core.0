Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90932C2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.21185.1660683475148208194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fly3yhGR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id f8so314001wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qJiOnzf7X73bMCEUJrk5dBXahx7a7P17btU2xeyyMws=;
        b=fly3yhGRy+/ZX2FfUP2GKCYNP2NA/j4qyfR5MFcXmt6Xyv9csd8aMxujC67FcSaMXD
         QzZWtVTcXyvzKr9Da+YSSmc6oziNqSgEFHjJ6NCIvwHbWW29BSDByKSsipBDK9YNjkAZ
         NjD6aenAmakG3nYsNY7wwURLtdEf8cRJTCVeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qJiOnzf7X73bMCEUJrk5dBXahx7a7P17btU2xeyyMws=;
        b=uu56jxPVrTJxUJRD0wKtBkv3aD7oNMu9Dmc8B9tcEYaSInujAd+wGZnresQALJ9Dpj
         OAWaJSlwH+2OYHi4FtFHpuBvI/mAWtP0tkZthkfP5bJ8D57PYjLf/LBrk87WseeYRKHV
         VeA7TEmEgyE4iRz0gtJIK+G1aOxtMEz5FPpn2CupxzhUQGxuzM4gVQSkn82gC9Qhk/fW
         anywe+j/T7DOde+eJgO5txQG4anXozrai/iCooDB7+V7CmpVD7Z7eusZAhbKqfk7coiA
         KJ2Ic4EWQj8rC01Qt5p/R68XsZCLyBU1JDaGdPSimTsf7VaAMD25xDajkCQcfkjTN/KR
         b4fg==
X-Gm-Message-State: ACgBeo1qHzhUKswnoKbOjPGggYmcFrTu3IGjrNNwHSjLX19Kva45RSLs
	i/7s3IifC/KxS6mm1sJr2wq+aUOdb67ntA==
X-Google-Smtp-Source: 
 AA6agR7S2OILZ8jIdICGyfo6BIBC4KBTilHjqNU2UsiGpBz/qxJ2dVfoWZnMO0GM3VgMsEfm/IghGQ==
X-Received: by 2002:a5d:6348:0:b0:220:5edf:c3e8 with SMTP id
 b8-20020a5d6348000000b002205edfc3e8mr12507673wrw.255.1660683473455;
        Tue, 16 Aug 2022 13:57:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] skeleton/service: Ensure debug path handling works as
 intended
Date: Tue, 16 Aug 2022 21:57:46 +0100
Message-Id: <20220816205746.1672987-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169462

DEBUG_PREFIX_MAP uses ${S} but that wasn't set correctly for this
recipe meaning cwd during the build (WORKDIR) was encoded into the
binary leading to buildpath warnings in debug symbols. Set S correctly
to avoid this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-skeleton/recipes-skeleton/service/service_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index d1d8c5f3656..912f6b0f611 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "file://skeleton \
 	   file://COPYRIGHT \
 	   "
 
+S = "${WORKDIR}"
+
 do_compile () {
 	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
 }
-- 
2.34.1


