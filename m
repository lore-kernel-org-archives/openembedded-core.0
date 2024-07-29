Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A37C52D1E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.55651.1722258789310478673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H5AQ+GI2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c964f5a037so1985377a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258788; x=1722863588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgmcIcL2JzAfeUxHHPkfn/mOVs5rYi8k3cniWZE8EJY=;
        b=H5AQ+GI25ggnQYpkMgK6+HO/j/o4Dnh0nPHQxN9IsziTcY6veGp9WXQ6WPoHOoMXpF
         W0C7GOd2Q0jl0OI5xE7UwhUvpQsOeIv/8ALrVZilx+nLrXCcaJwFPcjyuXoazryo2fDb
         rZj41Y5dnVluhAjRnIWchqx/UvrSp6KO245ubMsYRA/1nVjFsJL0L75/8s4ycYhv4p12
         /oLXhXgPT0ZddDBrU7dmECpAXan5CJ0oX02NOehxr7ZPz3bL0NfooKXFOZjHM4Gm4GNa
         tIgpid5YdG+hr/AwouYl945DeoB7sAD8dmlT/+i6Ng+0UkTCIroUuVeqA/CuhwaFNOEm
         ayFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258788; x=1722863588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgmcIcL2JzAfeUxHHPkfn/mOVs5rYi8k3cniWZE8EJY=;
        b=e0V+cHdDYBZoKO7x7mCfK3CGkYWqM2wWOJwAM8TytI/CYtxFk6jaHStHWE8qFx5o3J
         pt8WEq1KvOrMUogk7NDqxJchj6TWi5ZI3BA04RH4Z1MBrIyme1fMxOei7La2MgyvebVH
         g2NIzk5asffwBTHS7+5HeSMQcME+5UKlQRJ3GakFN/URPtcudGoBX6k6dmbt/Iuwu2uv
         ztVKlv5Y1t6XGO0xJF+oSs9SzvX4OSS/jSSMrsH0VHoH6hdqkmV3V2rgilfOQu4/oVsX
         8sqmtHYXG47dsob3Xo6ektihSkoEXIGmr6cp4yCOuGvDgdNF+4QSWsMWgXxqJLhSVR4b
         mloA==
X-Gm-Message-State: AOJu0YxlaF5XDtkZLIfaRrk54HY6Yt99mn8CKcCRTgvkYNwLsFkF+chj
	KsZmBNrZyPaqciOHQESf+MZcme3x280B1QNAwI51QVqGOc+w6j9bvF/Py0HZArQ79edie7Fi5nT
	jvAVXDQ==
X-Google-Smtp-Source: AGHT+IHP45ReB6UxucrabnF0Jvqa5Oe8rHr4dYbj4qesKuAOs5SAbsIt3gVPqbG/I+InMwfSk7ue/g==
X-Received: by 2002:a17:90a:ac2:b0:2c8:8a5:c1b9 with SMTP id 98e67ed59e1d1-2cf7e1f0075mr6029752a91.13.1722258788562;
        Mon, 29 Jul 2024 06:13:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/37] wic: bootimg-efi: fix error handling
Date: Mon, 29 Jul 2024 06:12:19 -0700
Message-Id: <a1cbf4d5ea5f852144d0cc70be99d6338c618fcd.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202623

From: Enrico Jörns <ejo@pengutronix.de>

If we check for empty variables, it does not make sense to print their
content in case they are empty.

Additionally, the error message in the 'kernel' check attempted to print
the wrong variable ('target') which was not even defined, yet.

Also, raising WicError doesn't require an extra newline.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f31cf475d0235f42d73aeec07694f79b9937fd76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 13a9cddf4e..7cc5131541 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -428,10 +428,10 @@ class BootimgEFIPlugin(SourcePlugin):
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
-                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % target)
+                    raise WicError("Empty KERNEL_IMAGETYPE")
                 target = get_bitbake_var("TARGET_SYS")
                 if not target:
-                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % target)
+                    raise WicError("Empty TARGET_SYS")
 
                 if re.match("x86_64", target):
                     kernel_efi_image = "bootx64.efi"
-- 
2.34.1


