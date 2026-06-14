Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7307CD98DE
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105034.1781424196076495518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=id0mJc7V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b3637b90so16725085e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424194; x=1782028994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XE3JQoIaIykWg4poU781mLCWwsR8QJ0aO++FYMlWkfo=;
        b=id0mJc7Vl5opg+trwPKTXwE6sAa7ITQFYYbLVNTKp30Z8QsBci5HvpkpNAL6YC6Wrm
         Qq/C96epMh0iEABWFcUFZwB4seI4DXyl6b/QkO4SVvTdf3bXofMxxK2NE3Xy4IQa/YF9
         KcN/Z6yfFVqhnCglffrtfwswh6ilBKcgwRVl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424194; x=1782028994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XE3JQoIaIykWg4poU781mLCWwsR8QJ0aO++FYMlWkfo=;
        b=WLToEGI8Mspxb9Clo7+4jJ3K7su9lZMeRjU9Ino0aVSA6d/UpQ3B2YquiYcsbd+2cY
         1ADfG7D30/zcFfLjPmk92jN+Dv3Huy/tIuDF5vkHPH8AX2akuZtHuFDAvRoRP+yVORdc
         K7jZ9vyvnpg/AMaLuBKa/yKJF1JQMev5b/G9cnJdauv9dLchR/6ry5uQeOfVK/4RrGfl
         ycK7MA2H2qHII+iCMhXg0GUDLsyK9g87+ITjpFoFkQaB1gN1AmBn/aexKhs14mN9RKYW
         y+I2Vu4Zxf6e/r9tzxDz+I7dsbjd/RuvpLhGU9kL7yYKDhNn8spzWBfCvOgR3ItJ2Tjj
         E/eg==
X-Gm-Message-State: AOJu0YxptWFpL39CWykPfufoHGr44HhR2Vn11cQ9owLoj1Z9CSqFRwgi
	3MramdZ8TUJ9BluBFbb4cU4ZLjd8iernarRoS0JYlVr1qnKj/2nEMFMGxrdn2tCOk0IXRxDlwgB
	BmTFX
X-Gm-Gg: Acq92OFyzVoqInyh7u2MG5zAA2UnjtRhqdBF1F3hTcB2uY9WknvN0t/TSHmfqTh7SXD
	RwSY02a+QmfKZ751V29aSrAJ5VCWy+4lTPc7z2Qt0f2irntGg0yu60GP+IaQymX7k+1A5rHeT17
	ffTK0FVDbjijhDZookC2Eq7k9SFml429dkURH0gj9VhjHGLYS8aw5i5IsDar0ebqwegdKTRjClV
	PeyjAcM4YqVQL8qpVB0XPqF11zlftA9FLOHvMilmxmobc07F38YTT3a/n3JuUpAmznK41e7xREm
	rTdHeDF6QKV+3VZbOfPMdyUJaqRFNYoZMGpNjajbsNcPRpls6giT08zekQ+LNg4I86gYDdnRMWY
	7+zASp5ASj7h5Bld4iGiYws2vHahNRZOr10e7JanMMNt5IiJP55ZPoYg9aIidrwxCekAXtzIUCh
	oDYAXYACYQ9sn8uYH9fqSEeWXDdmrnZ6f9xj6Y8/nM9pRzpU2/p5HP
X-Received: by 2002:a05:600c:3e06:b0:490:a964:14f8 with SMTP id 5b1f17b1804b1-49220084947mr71541505e9.8.1781424194160;
        Sun, 14 Jun 2026 01:03:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/56] gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.4
Date: Sun, 14 Jun 2026 09:02:14 +0100
Message-ID: <20260614080307.4017177-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238687

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...streamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
index 856c8838167..4898c421905 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8d71223a3043a4e"
+SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

