Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C665C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:19 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.11886.1651248129935820777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CyIfQbOl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 15so6857670pgf.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gANJRnufMD2gWYq2LFH2Plb67gpHF4TGvFd4vFsOEws=;
        b=CyIfQbOlPmmnU4Z2CGfDXnQAs6dNMHxJFlRPVYU8+w5FcnvFGHwycIa0PbCCxZBIA9
         wsGTVE0hnajjSRnM4BEfGAU2DjbluydiHy4DmSYUkiqs3dOErS3y9zi/Z6MVFTTWGefu
         XPOJAtBLbD9vR7KeYZhtPugBmlwrIoduIHPftr/iCbR5NX53i1nsDrK7qg2+VM7yg4MA
         wXf7zCldzrUPEeagmMoLobOISGJHtmmS7cdr9LQDhTlWoon06nLOkxDt+h901OlVRTQc
         eiQUh26xzgL1dm/1faLUicRqlB7zsL2IyNzdE115HBPmBz3ubuF04Mra3U3nv6E+UIow
         awLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gANJRnufMD2gWYq2LFH2Plb67gpHF4TGvFd4vFsOEws=;
        b=ersgU3REhBRNgfUC1V79Ia07YF3BaGlGYALO1aHvDUg+dSGQef9PgzlWiM39nck/IS
         c0IjmcBennya77r2cIB/kvfyPxWAUuvTj487ip6DwOqUi+G0jRa9FHo8K+vgbCNL4zgo
         Vhy1nOFPsSEJNWTqZv+WZQxFuhVIKP50S06yDVWPcHaDTX1A2TXrUoupDBhdSvPnkK9v
         QCgyO+wTxxhSHaZvLX24zQli6y6SyQkkbso4EXe5Vs/OVS3fagLrf2KgiUv5cpyJ5A0d
         DQkfqQzy45OTFNTH70NCfi9pmodynIuYmQDCt9cy37sI8clf59R9jiS5uDzOBtb0mPFg
         9oEw==
X-Gm-Message-State: AOAM530QJyHUGgJBVd4c9LrBMEuCghIseDMAoG0PylBCbds+s0cF11WB
	qP7mP8PrDBWjhgtwocLhF0EVh2jveEyRZuQzpVQ=
X-Google-Smtp-Source: 
 ABdhPJxG64ydNpN3vdzx2nu905KDzSCMDEFw34B/AVpUZlwCVw3KOgnQFm+q80ib5i1yYE6yBSenXg==
X-Received: by 2002:a65:4789:0:b0:3a2:4866:dc48 with SMTP id
 e9-20020a654789000000b003a24866dc48mr64420pgs.87.1651248128563;
        Fri, 29 Apr 2022 09:02:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/34] gstreamer1.0-plugins-good: Fix libsoup
 dependency
Date: Fri, 29 Apr 2022 06:00:38 -1000
Message-Id: 
 <5820e01f5b1f9ac5f1a803820258e92e7214ad31.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165038

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f66a3123c9ce77e9af538009fc51bf190703433)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
index 08ff5a0bb5..1f61d9a10e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
@@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-
 PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
 PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
 PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
-PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
+# Starting with version 1.20, the GStreamer soup plugin loads libsoup with dlopen()
+# instead of linking to it. And instead of using the default libsoup C headers, it
+# uses its own stub header. Consequently, objdump will not show the libsoup .so as
+# a dependency, and libsoup won't be added to an image. Fix this by setting libsoup
+# as RDEPEND instead of DEPEND.
+PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,,libsoup-2.4"
 PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
 PACKAGECONFIG[rpi]        = "-Drpicamsrc=enabled,-Drpicamsrc=disabled,userland"
 PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
-- 
2.25.1


