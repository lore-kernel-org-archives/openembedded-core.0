Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C1C6369B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.8110.1650463761109420334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RcBhkopm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso2142437pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t1OWUsvW2VXUFLIa8kmXgv7r/FJJm81kZPCsNQ6HM+4=;
        b=RcBhkopmXKFcv0In7Y59nOKDZfvK8HsUAaATLdCPC45EMzxTZu6mFuW4a26j7a5eFn
         PmHRDf0Bex5VLo9h2iV9G5K8doa/VCK3v/a3q1ZYOBGwmxovDBXkEK79FaGbXEVT6nv0
         BCzATgGvBWWDRzbov11agPF3nLLkztW91Dq/BLXOLZvR2dXRqxPtR7BHPVByGkkdq7qU
         MdM6IaC1tMN4A/rKt/n2rHnq60witgvzrIRc6k7s4oEr+eJMogJVh00HgytBT2hyGn48
         Aaga/l6qroDiUKoqrv72+A2iqoiGaJrZcF2DbwkrWKuP8Z4HyI+km1/xS5lHQyYpf0Wi
         byxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1OWUsvW2VXUFLIa8kmXgv7r/FJJm81kZPCsNQ6HM+4=;
        b=ZCdo+4hqAufRzlgdR4q8tqOG6F652vAxcn7IxgHFMN/JGbMkhlbgavuzz9rFRutAH2
         aP/cZXFnF4ozJ6l5SsBSRufowHPQCofZ3Bv5/G+i4PJxfkg5cCtkawg1ifUKbPtK0ZsU
         z95T5J9ZbnvGADtpjrNEAVERKCc0o9u+urE+WYm7arCRGKkDUTCfOE9uGrTRsc5YJ5iZ
         q3hCg/EdqxBl1anhIVjI3OgojGUl1V/jiShberzEGglLYnkIq+V387+ujf1yymSn00TG
         2fzkV2eYRxlZfMA/OYEXZXT+swnufafKFCVW/BVaqie6UqVyetfCe6mdOh8oiJHq+MkB
         thVA==
X-Gm-Message-State: AOAM533vtgDJ4tRIrb03TmnkEl8nxwI5finxuugLY3X3twE2/VtW3Gg6
	zzMdGdcOszkRqhGngDsolQ8ynli5DEZGdYf/Mlc=
X-Google-Smtp-Source: 
 ABdhPJy+shXWIx9p/2f3wqOg7G5zSdLk6Kf2HWT6lUJplGAwNF1Fc8cRjjkLzaUMvIo/7idbyow0WQ==
X-Received: by 2002:a17:902:c104:b0:158:8b31:781b with SMTP id
 4-20020a170902c10400b001588b31781bmr21072624pli.67.1650463760183;
        Wed, 20 Apr 2022 07:09:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/27] u-boot: Inherit pkgconfig
Date: Wed, 20 Apr 2022 04:08:05 -1000
Message-Id: 
 <969ef8800e13ffe78c88f2fdc26dec76d52d75df.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164685

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

pkg-config is used by the Makefiles, and thus pkgconfig needs to be
inherited.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6148ac9bc5d3e0d0ffdbbd6695acd96ca1836b78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 488b923737..d366f10398 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,4 +18,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
+
+inherit pkgconfig
+
 do_configure[cleandirs] = "${B}"
-- 
2.25.1


