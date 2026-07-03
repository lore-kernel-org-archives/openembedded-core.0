Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96003C44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88743.1783067404752381694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U50IBiRq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4631679f204so842018f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067403; x=1783672203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inK/lhIzMyc+jp3+zWdzIxyRJgFmFTElRI/wYuOYw2w=;
        b=U50IBiRqPmDOUz3s/2jP0pm0BLb59qIBZl6srCxOhUIKHXza+f8VOvJAEZaKSHOEJm
         Jt8tvMtKXuLULNTT9H6uIzpnIqjeRy/8gxSGmSxI38DDtFEWxmE358/VAzojU5dWg3tM
         s0yt4AKZxFVi0zzAlZgiFraCh+PgojbQnr3CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067403; x=1783672203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inK/lhIzMyc+jp3+zWdzIxyRJgFmFTElRI/wYuOYw2w=;
        b=ANrjhyG6sCtNH0fmtwKSXdDUpKM/ZGVAz6IehUNOfog0Ea4o/BX+MWEGIPwig009VY
         k/bXyYIBq0uxLGYPPxEC4n/MvGW44tqZuYyJh0/dhe17MF/fvrP8TWKv/L7pLwxXZ7l1
         +O7M2KVxnyrnbVNELOpP2X9IaYAPVRMLTXyXmWhc2tPHIcTHGPpDgRTGxFLFTFH9hh7J
         UPa04ysv3CzR5/GrKG7bFPxUmcBEC3noUNWksb/e+h2X3eZXeWUnTw7JcNWCk3nV+t9j
         I7cPsN5PngzYss8ITfd6PZfWoQ+tZXkwAXHA1kAFbVLLb2jI08jCdtOKe6m7Ur0boUi0
         DtCA==
X-Gm-Message-State: AOJu0Ywz+d4HDM8l+L8abnu2eRbv81L+0FqylfhIZ8iKtZDaxtUnds4H
	n5nN3IWhiVwHxHMWKtTcXG4ixYoZSmSXx+ypOLsqjF4r075jFndpbBOdohftTte5+L0jYYgz3Al
	e6Te+CMo=
X-Gm-Gg: AfdE7ckW4sajfWuDc8bWYb6xsr4BUzlvWeYe5TK2+6NPBRWw8816R5aZRph3YCKvk++
	mPiF1ueVkYvZ3Dx9QHTsiR1axzOYzkA8+41Zj4AEcbc1d6dWpMt/pm4te6QynBxNv0ndMInpuAJ
	A26zbLaCF0BjNOWHDvNnudFQ2c2bJ7vgGejEZQpifhbkzVulNqBZmI2RAdb0lLEAvHHcFdblrm7
	AGj7msW22AOdGCHFXxiEReczaoySH3uur77cV5uoPrdw8TfNFnoll8Dj4ZWOtbtpZ9QrrRCdKq5
	U3kMn42x8/oz+OAeQ+pBXLcmAHSMqwF+b4LiLSZeXQpO477oXkKfg7rwc8/c4UvatdAQexcLmEc
	rcXOhUP+yaXo755gVctY0bodgTMV0aOketI5XEQ+dtc1MVHhlE9YYDlO+xdSpxgMW7RaG6/A53b
	be+4UeNRYBbuOZyWesOelML6uk6EuVg1X3vFVJgVhfqQ==
X-Received: by 2002:a05:6000:18a5:b0:475:da0e:744d with SMTP id ffacd0b85a97d-47934d74197mr4739659f8f.8.1783067402910;
        Fri, 03 Jul 2026 01:30:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/15] diffoscope: upgrade 319 -> 323
Date: Fri,  3 Jul 2026 09:29:46 +0100
Message-ID: <20260703082955.1585712-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240088

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_319.bb => diffoscope_323.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_319.bb => diffoscope_323.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_319.bb b/meta/recipes-support/diffoscope/diffoscope_323.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_319.bb
rename to meta/recipes-support/diffoscope/diffoscope_323.bb
index 258dab9027a..dcc144775d8 100644
--- a/meta/recipes-support/diffoscope/diffoscope_319.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_323.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "990d8ac71a5e7045c8ad6c66353f6a0dcbf5537ab323295e31bd795b043aa916"
+SRC_URI[sha256sum] = "28a1bff945de1d160efff07200f1d79e7890320913e1871f114bb697a52dbfcd"
 
 RDEPENDS:${PN} += "\
         binutils \

