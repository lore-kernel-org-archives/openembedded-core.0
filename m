Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D43E6749A
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:39:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78510.1766403537406595680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9CoSI3f;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2211396f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766403535; x=1767008335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9f/Tx0AROa3eWwm2R5HZI9DWrnOi5C9ZSVDkIMq9+Uo=;
        b=S9CoSI3fWY2mkmmusxDP3C8cQRfn1NYokwDlhSca19ZsohJ9US/zVCNoYQQ9xZvSAB
         xRrPXJI82iHtwuxTy6f8kisEzbYwvIKUrBHTSZ9e43AGoLIs8tcNI8UL0jjHVgYLJWM6
         DlRUUGeh0tJutQvJRGPpawLahkZgTQxJyyrBjWfRwqYNij/RK2BgYNJubRv8+FJ5hd1D
         1b/EwDf6Zvu6K/IRvlQWQrLOX0OddkAD7eTDnbGiT8VuLOid2qWKji92U8mm4ucHFPrj
         ZyNjW1r442s2R8/pM6nkHkA/nVn+/uQTS+bAfL8jJbdxo9wQb1FraM3ykb9Mnwx+5bMS
         LzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403535; x=1767008335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f/Tx0AROa3eWwm2R5HZI9DWrnOi5C9ZSVDkIMq9+Uo=;
        b=v9TawiHk/NTUtvXLq3NRqRaA7Z/aLjfeLOfPwW1VgjMZJb7UePCoSfax2qFVNxgrMA
         IEoogTV1PpiOZb9pwZ3gDsQdtXDzfpgjhdV4hX2qor5n1g8Zr0SzxKEztQr3YUfOBPJr
         LCIwtJyMn/3psTT9ZPRZdujSm8LU9b9tNI+B5dB5MxMhs30WU5rlUWctOqtgd/GBiOCo
         HEoDVUDuUZPYK9ai18GpNl7qfYornFSQAlD4gGFhFuI22QUetKGwddkQMuzUJfoL8fpF
         rYqkY69l10oiAX1wjriEZ3iVI70Cuz58OcdagZgd5sC6bEdgtXS8jr/vX+ZRU2NxLfI3
         oWyg==
X-Gm-Message-State: AOJu0YyM+1s6OHdEUPm2vkVL2JowfhfAdG4QnrYvmqL1HLT6Xbvcv97b
	yZ1Ke9KGEmfVg99pI731ybEbDO0Zz7O0+/QZMjg95ctuErKWtAFbNrzTgCkAjEzGw/4=
X-Gm-Gg: AY/fxX69Kxe90Ii7QTrvalXA1cpJT1RIzENpqmxpmOF4bbMBpbr29vTORT9wM6TqeBS
	YF2jRLSXLffM/Dft1/ZAYnWardcNY4P4fgEDRXWmb+709vCl7B/MsTyV2tcXj3icatmCwBPJ5Da
	RdoJQdbS05xpKp+r5g5elUW57M6nRr0cJ5RHK/6yUb6YSObz69ITbWz8sri9iRR0MU742lDFMt0
	N2/5ychRPWoSRrx7T7fuJjeyi3rPkupowRuu0As2unJz08gvCKM+BumT0kPo8NY5cA+NY8yGPf0
	Gb+fTlqUQrrOcQ+x7hpsaDo/52QY/paTJQd4LwJsj52dNG0G5QyGgWNO5b5WS9vDMIWlnEuZTwf
	C72tWFcTmOCSnrptfZ6gALijt/m5qZhEvD4pmZnV7ojKbERjXBnKNbTFgjrjd7f6ECiC5Jfgnlg
	LI5GC63lPIrml0Grnbk5S6d+c=
X-Google-Smtp-Source: AGHT+IG+7dy98FYZjYbZksZ++uuHRyEg0UF86EfhKay/96wmIP6MK1On/Vm3r/KFeDhkHlBHTzUCYg==
X-Received: by 2002:a05:6000:604:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-4324e50e0eamr12129854f8f.48.1766403535102;
        Mon, 22 Dec 2025 03:38:55 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm21720373f8f.29.2025.12.22.03.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:38:54 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 1/4] overlayfs: Fix QA failure
Date: Mon, 22 Dec 2025 11:38:37 +0000
Message-ID: <20251222113840.2163929-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228297

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The QA check for skipped mounts happens twice, at parsing stage and at
rootfs postprocessing. Fix the former, because it didn't happen properly.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oe/overlayfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 8b88900f71..dbfed317c0 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -36,7 +36,8 @@ def unitFileList(d):
     # check that we have required mount points set first
     requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
     for mountPoint in requiredMountPoints:
-        if mountPoint not in overlayMountPoints:
+        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
+        if mountPoint not in overlayMountPoints and not "mount-configured" in qaSkip:
             bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
 
     for mountPoint in overlayMountPoints:

