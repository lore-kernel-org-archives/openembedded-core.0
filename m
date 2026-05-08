Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3BECD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8152.1778224333952868148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SWNiU0B6;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe62837baso842649f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224332; x=1778829132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=estr0t8a0j3fmdi6rpwywrcymCX0gJBpTw/ilo2H0cs=;
        b=SWNiU0B6sHbROcBxVfMBS2OB0qHV80nA/NXT1WUBXAxcASi5q8kfZPCC/OcQavxRm0
         U0SinaDR5H4sxSupeFdLtPUcjIoYyODDgpnk8UsXXgCxTb2TvlarHAEEnt875DCq+qS6
         3d3mmEvnKYzmPa0npkjoI998Xk12ISJt1KvTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224332; x=1778829132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=estr0t8a0j3fmdi6rpwywrcymCX0gJBpTw/ilo2H0cs=;
        b=E3rrNT93WX5EAWj09f2+OuSR89vJdF2CZdaOEHnMJJmzfWvxe8Ga7djqFI3DkBUZCy
         OnhnhJPFK3rB4+L97w8Jzoa+9hQIjm1ucBbboGi5NqBxm8nQ4GK0tJj8vhzKLEl2zgBQ
         ycHCt/hUhEDTgMTgIy1ykdza+/aDhJWCR5KYYXd7dxUmbvJhONJ7t3PF80MZc4k26o8o
         TQKE9fR/9ZCIuMbmLRqi5AV6MdcsLeVZS5DrM3jgLUIWYEEixu6R/qidjpOxmHo5BsOY
         YL5dJy+A8LYc2UdxDLqcfWex1um27iWOJXLW50AppL/+PJfxHKyKvWDFKTQzm0LKUqSh
         3/cw==
X-Gm-Message-State: AOJu0YyVd6dLo9QgOcDOWojcabims1vrF4r3SP0VnXibzZWqztbnK3pY
	20u4zQxXC1yxVLwfAWbvdZ/Z6Rk/8WkMlJsWQuLezrqBSI7Qgj67EnUVdD3qQ91/0uhhPUSba4S
	LewNlWTo=
X-Gm-Gg: Acq92OFvOOaghW/TIj8B//1jw8/8pdAiQtLDbCeSX7PiQqEXg7tXyt3MM27vgkGlqIJ
	FWyooq4/tluTAu6YTUKjKvQAfNdTTshpVV2dNLpmYuYhebPhBFwAUdN/p1yQIT9RJhANuT8/W1F
	8ybt5XHhLzpwDCDZiPEwJZf7A2g+AWa24A1bzScuPopDoCperV3JXLkmoWIEc7ICm9FBL6P1f89
	9lZ2lU8pWiYW5PcCAyuHYg5K8QV2qUo6WRvYhZvQB6eyYI8nSk5oj8fhtExV2K+WAyM76F/6Z40
	c50X0qEI8PyqKToDLjAh1p1AgmfjCjKBhgkTtclC4rb1z0Qr2Qbx31L8vcbLzYeQjceU6Vu2kxk
	QbtF9WI9pOQsLDooefRDU8PsvzJZIPZNteleyzTEXDZqtLM11n9jgmF0YvTgoRzKbCbasbXqLWw
	5zZr9wgIUqu/xGkN0bMXLZqqPQyKjuzB7IUusG9GhJ1WzzHBqOh3P2qZ43iT38AWo6SoL7C//ju
	9wEtQ4LOjvmdQNtiBngAn7CoCI=
X-Received: by 2002:a05:6000:2405:b0:43d:7ba4:6b5a with SMTP id ffacd0b85a97d-4515cf12664mr18159285f8f.22.1778224331673;
        Fri, 08 May 2026 00:12:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/52] p11-kit: set status for CVE-2026-2100
Date: Fri,  8 May 2026 09:10:57 +0200
Message-ID: <dab1d9448d0f503cfa8e483127580d6d84a54c19.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236646

From: Peter Marko <peter.marko@siemens.com>

This is a Redhat version-less CVE in NVD DB.
Per [1] this is fixed in 0.26.2.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2100

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 343048c84f5a83c258ea6a5279a9cf2f1de781fe)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
index fa41b45feb6..5f553f11bbb 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -42,3 +42,5 @@ BBCLASSEXTEND = "native nativesdk"
 # git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 # git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 CFLAGS += "-Wno-error=incompatible-pointer-types"
+
+CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"

