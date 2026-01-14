Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C681D39012
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:55:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18034.1768416939937601719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MU+0Gokw;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so1398335e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416938; x=1769021738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S/Z3CFLXWb0zdsMUS/hHcAyrdwwwoC7n0a5vE+Ft/A=;
        b=MU+0GokwhAsldROxwz0G/iL4nHuw846Y9SpyX7iFq9ILl1pOTAbgrOQk7q3H+S/mt6
         v4j6thcFgdakUx2thyz8iRi95zknwTJ63LjAd71AnXUJpJyKS3LllIQCAd1ltxUljw/u
         2H0ja+1QQ3S1rLjMwtJkuWH8i0xT8V5b2069mVvm8PPsPAgtHcfA9YBGDHnQ5lzJqzfw
         EbbgXqGUX0mukqSuhnTit6QrJGTezg/9jaI0aun8/r3S5wGWBETFxTPEvCl8d5xspp4s
         0y07qk6++w7YmAh0I27f+pZyAUkQrY89IdwFYqLW19p7wtctc5vHxklS3JKb5NbgDda0
         zf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416938; x=1769021738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7S/Z3CFLXWb0zdsMUS/hHcAyrdwwwoC7n0a5vE+Ft/A=;
        b=LnyadE6d9BBKd/AE5ClTUOfRpbkYnnkRkcbI/gmsY3f+VPTafSCMKbmSqrXNrQyiqW
         3LilUZzZ38ZsHaIHcrBNc4qu7KVUhYqndKmFhnnFY7I3sXVArl0wrY+GZMod0cpi8iNu
         sG7gfJDrL1Tg0p/rBwCUfQj38pk9Qy+oFFLt+q6x9A2szGygRjhYMnhldK78iz9/yGmB
         Eu0i98q5afgbcvQRYV2QzzbIPV32o1zr/FGNdCd8euLhcaAFCIPTomGEnP1/UmPKQmHo
         vszmEs9IaupPagq8dsgZ+W0cHbz19HXU1LfrgUsbHqEPYkDb2jlVXG9V60EFmyjKasGB
         zAug==
X-Gm-Message-State: AOJu0YwH5gMlEakb0hcRlkYPtxQceXPCNk70uS/nL4967mINJy2ijZHg
	ZS94hx+ndPqNGClKPs83m+bPjHAJhkK5hxSIXpx2Sd7qIfib/Ymle5Zp5+dTeSBS
X-Gm-Gg: AY/fxX4i+ugbqAwmQXnNTSbuOZrvTcDBJ4IJwFcXKZGqAzc7VIe7g9lCyWn6MIvwjcg
	R27QFDghjgO9zN2A/TzAA1h7F/y8ajzD05VDbpn9m7f/Gtq40vuJvYCZoTwFZxXy55MfTUOmVOa
	gj54kUhdiiUP1CxD4L+ifWKu6IQSbWurvH9M9DpDCF+KdlO5S3Rn3i0UBPUiYEtmggB3JJTpwX7
	ehE4SJSvAvTcOr5Tk2G6k9itHZNsx7c3pEq2NRx2X+0HQvrK/eQwgEMVfa/sVuZWCnXRenxaU6f
	VBYSb8q7rMrtmde/8JqZssMo9RCClahnO21IYhXD14J1N4d+ltOCogvhN+73yfrctIWeeWFs07b
	Qg37fgKtK4pUum0RQ7W6tSUZosR+H1frerkmEB/Pm0M5qhb8FMOwEfCHhV31zuB4zVMkNKD5neH
	aawIr0zzBazkBv
X-Received: by 2002:a05:600c:548c:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47ee3371876mr49079985e9.17.1768416937739;
        Wed, 14 Jan 2026 10:55:37 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428be2b6sm5586085e9.9.2026.01.14.10.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:55:37 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 1/3] overlayfs: Fix the QA skip for ignored mounts
Date: Wed, 14 Jan 2026 18:54:12 +0000
Message-ID: <20260114185508.380709-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114185508.380709-1-uvv.mail@gmail.com>
References: <20260114185508.380709-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229369

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The supressing of QA check for mounts should happens twice, at parsing stage
and at rootfs postprocessing. If the mount point is configured to be skipped,
but it is still present in the configuration (machine or distro), then the
parsing would complain.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oe/overlayfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 5a5ea03d45..3805746d90 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -33,7 +33,8 @@ def unitFileList(d):
     # check that we have required mount points set first
     requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
     for mountPoint in requiredMountPoints:
-        if mountPoint not in overlayMountPoints:
+        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
+        if mountPoint not in overlayMountPoints and not "mount-configured" in qaSkip:
             bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
 
     for mountPoint in overlayMountPoints:

