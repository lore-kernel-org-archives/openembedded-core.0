Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1112BCC6B3E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32828.1792040637790476174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lpyj0VWx;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48de72fc832so896077f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040636; x=1792645436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=To1oMPf/6qa0YjgsOMK2GSAu8yh5rug3Nv7kqpgGD0U=;
        b=Lpyj0VWxTbE+zK2sX9B0yt430bL9PQYXJtfx3pYPB5mrDpTCf/1ZDx1RAkYAGUEYQp
         KFnz9urs3Rsvr35J65m04f6woX7/vwEks7Cuzk29oqH/oG4lKacnFw83lqpv+jiyf+Pv
         6Wf+O9uDQxZGh0tjWubdxmEiAPfaPf4o7dhp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040636; x=1792645436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=To1oMPf/6qa0YjgsOMK2GSAu8yh5rug3Nv7kqpgGD0U=;
        b=BLodN1t1i4+HEXB/8q14IEBad3URnTUQ+Di/533nyCDnKPbBZHx/GBi2D9Ndr3xrHa
         us6Tk+mome8ylq9mQI0qJCjA0tF5m3VI+xtLfIhj3rrmJXbGkGsF92asN/G12QqittqI
         bJ9OT6CbC8fbu7hEemvpF/skqDJJCPUnmjRYehlex7y9nW8xQ+FrskENImG3BSEnsprO
         YLPn910v+bqr/fNqOEH2sI9lQjpxYUJyXSNeQeVx4EeAdxx9pLDjqNQnTjrs+snqTk4h
         aF7VBKadk4EjNF7/81uJ/ubStQ9bTwy2p/uYSoQ/f/vWtKgBXfpmZCbG8oWu5jwLrKJ4
         vf1Q==
X-Gm-Message-State: AFq9FYLfH492Wk31d7sL9pbD+SXPzSJsSaMmy9sCGpzhCkr4L64v6+yq
	tn1VmUE0rBn2nDVfwcRBShy25LvEGd0WP8KPSKg9JEdIKWke5Ws2fcmhNf3RyBbsi0aPiN8yW3c
	SQ2oxNm4=
X-Gm-Gg: AYBFou3PlQ069AdjKePXkd5Ftr+mOX6W67yQLtHS80cPwhwea7uJD2UfnNusJ7xfJc4
	Os69Wc4h/DLwi+JK7c6CQYe5To1Z5mZHiWkzFLApidIPYbgHTWj6uTzXwg12BF/X6sAsFTTatNr
	8FmWvuaUTu6ieoCQkjaF7kLfmzCBdHqBPVH2Ru42ktPM2GebiQnibxcMcP7RlHadomMhca+4SG1
	SDtMzxLEvYMrFTW4BUoljWYuFj5DG8fZ042TMatrLtLSb2W2eWS2XKuzafn8uxm5qTYq/dg1c8J
	31LBqn8wD716VTtxT4+L7ZEIOlBfktHQMZIzyEM1IiQyyrwA7Q85oPs/kySH0gOn25x7hjvqSyR
	d52hiIwna048SFIBLLUxlJCT97GR1CVCH5cm2gJh+NjAYFB6LQilYF+8uEabDNQDWfFfisIeaoi
	zouJ+aod+IShdBwCnaTOi8Behvyzz26oqq4YK16iMMLk73aBRFuOVhRqlVrKB732CJUfHIOSZXY
	lY/nJuTQmSA6CTxqR0zGoRsUQRkp+NtQ9APiNeIsL7sS2y/zBd/iKG7wcj8YaZve0/Lz/hEyw==
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr371369895e9.35.1792040635940;
        Wed, 14 Oct 2026 22:03:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/55] vim: set CVE_STATUS for CVE-2026-51400
Date: Thu, 15 Oct 2026 07:02:50 +0200
Message-ID: <7851ee1883615e9d8610c44e97eeb51bafbe9f66.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247825

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51400 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51400

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index bd2ce2f6abb..d5fbdd0a590 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -68,6 +68,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
 UPSTREAM_VERSION_UNKNOWN = "1"
 
+CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"

