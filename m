Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E251BFF8846
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31999.1777064232725279087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M0gbpHcC;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso113203455e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064231; x=1777669031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUFuJz/S7pxARhMWtSCqWGIg8j1I0uFVCGaHVE6F5mc=;
        b=M0gbpHcCBP2tEN2ZPO8m4yC1l25/axit3xGYHu3tlI6tFowlU1G1CTzPXvZ55VqnPk
         jKzFaBMVdcfrJ/wcR57VfTVDwusXmoQH1MWK/k65hmX2g4X2SKYvPyqkd9s1Nz3F6GiY
         vI/7wmOgu7XbV3UtMDXyRuQQ1CGunvRI9j1zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064231; x=1777669031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IUFuJz/S7pxARhMWtSCqWGIg8j1I0uFVCGaHVE6F5mc=;
        b=YSusK95a94UVExe3TtjeVBRaS/QYFHF3wA6WgMY5sEVInFLZb2rQuPUm0+ZDXLZ0OA
         KDmcufr0uvp7WbXSWU00qqxV50khOBGqQXmVcYIHtZihvDMBJJXCCAO4OhQssTdtxjvD
         rXYsvH5h0ESDT6BOZbVdsxUifJnK1zNHOzhECf285uEoGLFTGT65LQrFnUWvnWfn8P5e
         C/GN1lNRvSLOQie9Yg3g+dR8O2m4UT9sqOHZ3rQysARp6ZJ4Ue6sA15atpWboi8scO2T
         bDy5Lv6DMs/A3fhGLBftXhEczeWURs8S5rz16ezgzliFB7UtjLaA5sMwzZa+A3NL1yoA
         zoaQ==
X-Gm-Message-State: AOJu0Yy60ccPEku1HlvMyvFL4xiYoVLmJyYfwV60wDB1Ni31UJvPPNa5
	JzDt4GF6pWl50wFU0GxAfNnttgEzj1NliYKtDAhB1a73CwA3jECtLRz5CqFMZ251fWFv6OXqMfM
	hBh3oBfS8aWiX
X-Gm-Gg: AeBDieutjMnMmort1aFzRwd6QqAuhdU9qdS+dhVMqKyPufdk7nuLS9z9Ik4OnhkurCl
	bnDSLJqshDI40Jx6racGk8clpop38q3PKwapP6H+4eKsmx3DazfkrR+De2qpdJ1orJrIRwydRye
	VM34Abb5MAPcJFxg2xLY91eVd8+OY1u3MTfPXAnG+h7sdc6IJT9Bh2SJDRRpF0d4GVST8rVCbgt
	J8ri4c4egobyHuLyYmkNuz1yn5k9NhQCisvYAk56jx14TKlKsRhoZvCL1LfZ4AASW2i8uybuw48
	y5ZmI6Z2VKPp6pQ0OG8//NDNHDWcdEDlZSLvLAV1iTO6nGCwsKF1txsJxzhZEtppxro+vHwxoY5
	1h2h0v1BtwE1xE+SstWzYL+ucr7jOYTIoxUr1UK+jtD+VxiYa25qPeix0Zps0NWJ9n0eLUodXqK
	DSjI0XRsd2w0W+4BXAVI5F/Y7Ao7TvLUKr06ErwtwNrpXH18ZBwDSIBdQULelzyLnkb+srh/awm
	AGTg2x6KOp4DbrDx58DAYSOZtbjZXBoHSytiw==
X-Received: by 2002:a05:600c:3483:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488fb7787d7mr457645825e9.15.1777064230821;
        Fri, 24 Apr 2026 13:57:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 59/66] archiver: Don't try to preserve all attributes when copying files
Date: Fri, 24 Apr 2026 22:55:58 +0200
Message-ID: <6ffd2c303d23b51a0a11f56e2e89c5a19596d228.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235932

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similar to https://git.openembedded.org/bitbake/commit/?id=2f35dac0c821ab231459922ed98e1b2cc599ca9a
there is a problem in this code when copying from an NFS mount.

We currently use cp -p, which is a shortcut for --preserve=mode,ownership,timestamps.
We shouldn't need to preserve mode/ownership, only timestamps. Update the code
in the same way the bitbake fetcher was fixed for consistency.

This fixes build failures on OpenSUSE 16.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e8313688fa994c82e4c846993ed8da0d1f4db0e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9d286224d62..9f0a49a418c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -397,7 +397,7 @@ python do_ar_mirror() {
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
-        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        cmd = 'cp --force --preserve=timestamps --no-dereference --recursive -H %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
 }
 

