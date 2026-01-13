Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C39D29DF4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:33:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55513.1768296779941163023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kaG2Kxyd;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3710085f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768296778; x=1768901578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxq9btN/1cBcHLn0rYr2w/iM+9gBQoek/psVBfmmug4=;
        b=kaG2KxydGCPtFL788hQFQaXELuanQII+TGrR08Lyj0gbJ8fR9v4SoPdvtOK4xhfRIx
         334/fnqJLU9W56tSVyznlSYXZEb5sSQ5zFXtEDoc5XuKzktJLKgKm39XN8NqP2eWx2UC
         Tqa216Gk4ISl5AG5LKVosBE0c/1ahf3uU1qUSdhD9sx5GLC00rRYMnGs0mlhIEeLvqA2
         rnruVl0gQtSaWv9tVXqOZxMTRArmK+5dEU/y6vBohhH7sabk2CufHZtzHMbewjCKY4Xa
         sjA36TkkGhzhctIjq1JDNz/Wf2bkOVijggp93PPv0/D1FR3QGkIY7QzQd+XPlsajWwDy
         fBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296778; x=1768901578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dxq9btN/1cBcHLn0rYr2w/iM+9gBQoek/psVBfmmug4=;
        b=sYmjfmbspbM2/1bdzGwzIpOv+c9wrqBijC13bj5/mIgzQB0BX/qabnkuTdA+1bO1yY
         j8bkr2ChO+Jx50MvMVTNEIs6bBSZrYwG0p5wsbUQxEHkdZ0lMt5vPPxXrHiiJfGm2ZAr
         B7y48JPzQm90jfC+7uPN9tCVg24Jnk+/H+4nzPE2l/p80LaojesumwL57OhNR2y8x+9+
         6n5oXJyGlIBFUljbLFUgHm7LwJEdjRkNgZetH/x0Pqxm7kmOaNGCkL5kopSkxTwlUc9T
         qtEE3VRCwJMD2uVYj3PCVUdSbhXsSfSKX/pXY6YkaivoudxTu6ZXtSdg6wTfKg0bHWis
         dnEg==
X-Gm-Message-State: AOJu0YwzpNXj+EcOvhraGUPjerO0afB2GKZT8PALtX6N4f+JUMZGPnss
	hp2oUJ/kfwu2I+oPBL6seTxN8j+nbYPCxRXkh3sgox3V81A/h3xReQRBqDxKlg==
X-Gm-Gg: AY/fxX4VzSK01V0fWiuY6mMMt4ohn2yyN/OmNHgXASUWHQrl+mGQjRN+pDX6mrCupX2
	IC/YKrxJA6oFbYn46JFFpIbCtDszQOu2VlDv55BWFFh5Uzh9gu+P7USgz5EsnbN49vsGwVikGjT
	8xA1c8mKRjULV034Nm6BcQNzQLGIFi7P9+5zWr57LoLy+VmRvf1HP3I5hL+wpZY4JcxfHOiR87B
	qge8gkFa+1G56u0zYwf8+jT66BFJtc3juC1SHXCJloYnM9rWAAGRCTQjif6YXldiBh39rcDiFRU
	nPj/TxCYwwRMy9fadywKD1wev9FEs2NKfJrk1Tkj6wrQrORmPJ1D+EOSDijHu2VXFQhMCqHTzw2
	zHDZGTfMtlY2DWkNusqRDIxP97m/OGWcECs8dGH8YTmVBujBhavmqR+KW8cGFMQ7i/dD3eOj7dE
	YtXh9uvhC+skfNzeyMxqVWHAo=
X-Google-Smtp-Source: AGHT+IGJ1ZFDaJQlpx3Of08tHkAxTfiXKLlmh44LkssxdrthMwYOyLIgH1tY118UD/Z++Xw4xf9ttw==
X-Received: by 2002:a05:6000:2510:b0:431:342:ad42 with SMTP id ffacd0b85a97d-432c379b6f9mr27925133f8f.44.1768296777685;
        Tue, 13 Jan 2026 01:32:57 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm45675317f8f.24.2026.01.13.01.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:32:56 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3] overlayfs: Fix the QA skip for ignored mounts
Date: Tue, 13 Jan 2026 09:32:18 +0000
Message-ID: <20260113093218.348105-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05b0f313e8a3d069054657d2293393d3cd76bc49.camel@pbarker.dev>
References: <05b0f313e8a3d069054657d2293393d3cd76bc49.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229235

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

