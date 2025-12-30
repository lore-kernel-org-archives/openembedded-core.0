Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58100EE49B0
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71734.1767125548511378024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EIKLNd0v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d6f647e2so166143855ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125548; x=1767730348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhzYwHGSMXb+8Hk2YIBMTvQIodezoXQlR+q0FRbVbwI=;
        b=EIKLNd0vcQIUGzleDsB1ZEuDuJcr7CLK4KyRjLXgPng9qiaPBtfiP4tcd8+3uPCzW1
         yntUuW6K8r8zEtDW74ErlAHDylcZcptoAMVp9sZTqpDU+BINuTHCFRE5CyFpJhWB5vpD
         NFCJGv5PgMplmfVdYVUDpEnV7sI0TvxPohYgRVUaLUYJxjP4u7pOi2Pl5L6SKcCZc1Us
         xSyegoIkmzej0WpURrEnNz1+wq8TZ/K9rLkRYuWeFtgyacqApcQpvok5PjN3vuAVNxGH
         WZQCMpe0SF7AmcDxWt0uvSyd5iVdgw2FNpC2HmAVz0lX49vYOJkasLYZBXTuT7cOH6QV
         UZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125548; x=1767730348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhzYwHGSMXb+8Hk2YIBMTvQIodezoXQlR+q0FRbVbwI=;
        b=RIHErt5eSnEHcfwe7vn/gSEZB42gD5ZsxDtC5uxDlWzwnFdt1C6FFChAXak199rQil
         H4oaiQh7NK9QGQBMjDZWCuIv3YRZJnDU4AFjj2DaJ7HGSnJ3pXj2Tiw85xsJByeR73/C
         tE6/qhuIS/Ry4S7v7WTPVMeU71cyjE+SHhw9qBS+EXCo5FeE8LBfUOAUYcgDa0K9+b2F
         gDHLtl6Ocb4TmuqiytR3FhCXdmu00xFIe5+vjH8i0DUQfzF9OSpHZlsG41bQ8uA38Z+7
         dvUCvzxb7LtbO8SKivZMgpaJtvLPXYkKCqvkAOE3YtMTG2+YJE0jfg3dib0Rrnu0+3nW
         q+3g==
X-Gm-Message-State: AOJu0YyBz1zzk1ZuWHcqSUQnispKyDeTOJA4QBVgDmaaSfQRTLuA9yc8
	D5Ts1eXr8Pbvbva4s7vCb6BgyP/e3P7i80h2chNybV/PnPmw6uXTAohZmU8mHaL72uVWMd3xvGy
	ifPOG
X-Gm-Gg: AY/fxX58l4VtdEOXsudGBs5gKZJVdoRmisukZx8tRYRP/Xb21E9H/D/oPKG6cgLP/cW
	EhKWIn4fQiFkEk39ABYREjQAl59sPOKH7quHIkNve3AEUyUP6mQsniqykhLAr0RH+uFkOFY6ryP
	r3tJSL6Ih5Kdvwv/QyGq4TWvLAwx+09dhgzPKjSSN41LHEDaEqlL1z8fxQz11wVArAc9TJ2+YBH
	kDL8m4WwZAR8rmMSPGgm268oCPCw++/2qr0U7MU5ZGwRc6hXCHnwUPW4XgroA3fzxAOVT8SGQbo
	aQm3hQ1CceHkm86zAYp5L3Fo6LD6UQHTX0pJsgnEzjvKQiOJ83q1eLZWkBmO0Iq/M53PUG+kAcB
	74Pw6/nTxzLyjBXF5bt5ED6jWT1sm2Usy2rvg7KYcU8lniBHR4CKwU9lUyFFnUjXFMLEWiHqkQD
	xPAQ==
X-Google-Smtp-Source: AGHT+IGFWw2LVAHeStzEylfTE7lL2XEZf/YGvQ4isaY/n3rzG4DFEFavl2WEKoWluFt6riFWOYJF1g==
X-Received: by 2002:a17:902:cecc:b0:2a1:5785:4417 with SMTP id d9443c01a7336-2a2f273800cmr294840825ad.34.1767125547766;
        Tue, 30 Dec 2025 12:12:27 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/29] gst-examples: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:41 -0800
Message-ID: <71c728176301ecfbe37b9b1d3ce46d2fd21ffe1b.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228703

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 5d45726d07f049be7d131b4fa0ed1b2716060dff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
index 2fa4ef11fe..6790f0b038 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
+SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


