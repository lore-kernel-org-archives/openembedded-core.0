Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BF1D3B9BD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:27 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.64678.1732680738477532029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sq64G9D+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f8b37edeb7so5519046a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680738; x=1733285538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSamagVjNvA8/jA2D8jx8hVF1kVQsEeqECk/DpIUGeE=;
        b=sq64G9D+zTfpMTqeGDpa9H4C2zg8FX8u02MXw7PlPr7/N6D2FeGcx83puBcnZcYBuy
         /oAu6rG0BawxbeysdjbHTVnjtefuIcqYoFd5cnB8cA/e/Gk205dcpJJamchwKmy10McD
         snOmNyIskSLOMLCk1JRQ0urcsvzsTYkAmTZzL1HpxMH3fRh1nJY1SPmxW2dwlx6Yf5dH
         UAIrJNmg7aulV6JgGlXFwJVbmYePYHuNAYCbAOtqSQib5VXNi6C4Kvk8C3SyELPvuNL3
         wrtxKVu0YT+4QxCeWvWlPFjOERrF9EwkHisUQe49LtFZ5QvrRaYA0fKpFUX68bPPV0yR
         03bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680738; x=1733285538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSamagVjNvA8/jA2D8jx8hVF1kVQsEeqECk/DpIUGeE=;
        b=k9MPMgvJw5Zy84f7+pO/d04okvUPJ7ERSrASzxfxRPAqkFL/TLClUmfcXxof4q38Ox
         Fmx2RpmSUk0YYgI8Gntsp6hKlaOjh1EwGf8M0AmSxV+u1bZcd2eil1r/jEcYeFs6+iqF
         XeOCPdke01Xf48+7QzVrBAgMLYCPvl8HL/306TIjiZ/E4s9VRY7F6RZleNJ+4PGSefho
         iC9VFBAn4D+hc0Ge8N/u1bkaJZ+VZh2lCOEXxzbs/fbLFS6+I2WX1VgFaxk8Rsv4NuWe
         lN+p6zHqlDvXZBqRPv9LA8W7FbloWN8GDpkfBaKpVkPdoM9d6sImYaJVvnVmhMtQaIcw
         1T4Q==
X-Gm-Message-State: AOJu0YxzQmGriz74H2RwIx52GVkJGDfVowC7tCKpYupmYX8hnlJ+ok5/
	I5eB04cLRJFqSYao15r05Lqej+KKjkfSMzOeL0EZ91r8fUbQGNQ4nlgWo4g2haTuc/l+wguWDLA
	9
X-Gm-Gg: ASbGnctzL60bOactp9lYeqYHLdnGCeMw62JpgVlW0uTlRMe31T5NdrL9Ex6T7xt/oVi
	ruEbFg+11cJFoN4vHTplkvKxd0GH3cujRQmMiDZmSG0icknNkhRFH+iKHwy94JludMUsB+qGGFx
	P9OwM9jM6obw+qv3+CDgkVE7zmBw/NC1BqtNhU1AY6DheZjcsYCyJxARID+KbGywq0vRi0mcyr6
	YHkqeQeyOHtWzEKLGIV44siZPMUagsnEZmOh1o=
X-Google-Smtp-Source: AGHT+IH/xSV4z7SO4/EeTJdvqMse4jWxv+AMqPOoXm2xeZ5lgKq50uf6yaskMe8GyYRevk1E6lnRmQ==
X-Received: by 2002:a05:6a20:7349:b0:1e0:c8d9:337a with SMTP id adf61e73a8af0-1e0e0b4b612mr3222800637.27.1732680737698;
        Tue, 26 Nov 2024 20:12:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 17/18] package_rpm: use zstd's default compression level
Date: Tue, 26 Nov 2024 20:11:37 -0800
Message-Id: <9ec8b99470ed744c8eca0b23f99ba54210984080.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207911

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index ddc4bf3a6a..b2b7fafa17 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.34.1


