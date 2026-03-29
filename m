Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1CFF3D607
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29636.1774792065675705550
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=N9e2gyXb;
 spf=pass (domain: essensium.com, ip: 209.85.221.50, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfce3a195so116739f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792064; x=1775396864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7Nl74kfpQmCaKbHROzqIV+fTTBgAJkRL7+Rn7wDsqo=;
        b=N9e2gyXb7oSVOb0gahJNb7HJrfjO4/hA+g5Jt5hYc8E8Mr9+cQODVWxvtZLBoMcRTw
         oW42BC6/0R8sqPDVwgD3CP/VF3LDkb/NSy5Rd1CxIWjmB44qjolaRc78uLtcusIvUVjq
         LDCfYyoOlsushMUjw0A0eHiPfwNXvx3QFFqov//tX8fp0OgfOmBe+qyLPNrY9UBubYNP
         n2Mljb0LDFBB0mJ0Q6yEK4k3FzMEEFPiBEvZN6B7t+XerCJrPXJXsxLOhkGyvjKB+cZi
         RP8ncXOQY58+d9e6f/p2uLgwne35VnVJivsdqciDyk1QNf/FXDL0ibBGxX3PFUg/ybAZ
         Dqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792064; x=1775396864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7Nl74kfpQmCaKbHROzqIV+fTTBgAJkRL7+Rn7wDsqo=;
        b=fuX9ZUVu3D3todzgMCFSvmqhh2/+kO2Iy+0G4ciYdVFnsI8rTS5j7syVlezG/mA3e0
         EAaKudOuKk1qU8oGa9PMcPCWW8VliCYx2lyBO3jkzCmnIeJ9xpvBiX1xI7OxHhhQzsp2
         gPc2BretdcvEQKJWHFqmHRGXCyB6tg1TA24bTCQ1jCAnoIrAvZGr/8KqiDxV6Kp9S9ib
         7OtEsGtRxZn8QxgdaEByMSrblKBuSTU3wtb/+Mc1qB2s25zxPksvutwMqVRAwlWG2nfL
         yGaOiXniffEljJyOmhDYPIgMruDM0W2Y8W3gDKwN00l1W+pXb08DXw8CkTFzDcs+YFXy
         KD9Q==
X-Gm-Message-State: AOJu0YwmFAzxIEGhWDeDPLZPbtezcqpw0zMuTmMtok2B+EjY/CwsWq//
	QkuBYr8cTFpvhL85J48ebqwK3BJV4R0/dd4sDUNrdQY7pf9IX/GWLzbzpRnYArd0oHeLpqVFpAf
	cuy5F
X-Gm-Gg: ATEYQzwHrGIOz6L/RNsqw74MZcMVc0PNdjVNceQfnxoLSJygA9RsjDesVDKiUefQNm5
	JUPdfAi+z802Snj5cKlAokTn+qVjFwqYuhDFqPDjv5gaE+Ei1jXzc0aYg/xsebvTD0RSFnhnkTK
	avG++kWPTOAlLhhI/cejo2RaQEMUimOKncRV7gKy6GNRPSCtXkD7+nun+RHPcB9zu0ieszUUQ6b
	Eg4H0uf9XsdqF+zurJbwZ7txNWNYg0XmwY8H+DuwyAqujQLBjpih9soUDxLk37ONdS6zfnKIUmt
	UTYsmBzf9DR0NhtiEM2C7fQQJIsyW3EsfU++rsH6JGCb+Wulg4IQ5BBvMBSXRPeoQsew1UPI1af
	L59Bd4pd1xlpnIbMCiI1RwyUiqWEQcRI0i75lq1xOc+f//WNcyZiLUen06x1Xa4CIONQ+C1P3YZ
	ra+Fx6FVEM71CjbKrq1nILsNm/jfiG4fCpLYm4SYJqnfutE26EjnBJ+w==
X-Received: by 2002:a05:6000:40db:b0:43c:fbcd:4b65 with SMTP id ffacd0b85a97d-43cfbcd5421mr3105064f8f.50.1774792063879;
        Sun, 29 Mar 2026 06:47:43 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:43 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 1/5 v4] image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype value
Date: Sun, 29 Mar 2026 15:47:11 +0200
Message-ID: <20260329134716.3185469-2-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234144

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

It returns 0 if the variable is not set for this filesystem.

In case of fixed partitionning where the rootfs partition can't exceed an
amount of bytes, there is currently no automatic and no generic way to have
this requirement met in any case.

Until now, ROOTFS_SIZE value got from directory_size() does not takes into account
the size of required metadata for the filesystem itself (and does not work well
for other block size than 4k BTW).
Obviously it's a difficult task which depends on rootfs size and filesystem type.

The workaround was to set IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
to add the required extra margins. But when the final rootfs is closed to the
maximum size, it's difficult to adjust them correctly. And if you remove
or add new recipes in your image, you've to recompute these margins to have enough
space for these metadata when the rootfs is small, and to not have too big final
image when the rootfs is big.

It's cumbersome and error prone to just have a build failure when the final output
can't be flashed into the partition.

The solution is to follow how it's implemented in buildroot by having a
specific variable, here IMAGE_FILE_MAXSIZE, to create the final sparse file
and trying to fill it with the content of rootfs. If there is enough space,
margins are well compressed and does not consume space in the filesystem.
If there is no enough space, an error is triggered to warm the developer before
trying to use it in the device.

If IMAGE_FILE_MAXSIZE is not set, the idea is to keep the previous behaviour
for compatibility reason and to met other requirements.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index e6ef0ce11e..2905c23d4e 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -54,6 +54,13 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
+def get_max_image_size(d, fs):
+    max_size = d.getVar("IMAGE_FILE_MAXSIZE:%s" % fs)
+    if max_size is not None:
+        return max_size
+
+    return 0
+
 XZ_COMPRESSION_LEVEL ?= "-6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
-- 
2.53.0


