Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A11CD37B6
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8238.1778224351425873885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mgJZ0BEC;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a5174670eso1015321f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224349; x=1778829149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrwReiX+QIi8oPJeTptbUWL/wxK08lFg0+43UTtg/6k=;
        b=mgJZ0BECOdl+GggjB/lbhKTyOcB7Hi5bBqdMhENzg1qgHDR4VCrDf/2NVrDxUdDHnk
         miwba+8lXTStEBqSvIZFu+nAR/JzDNAvfsrXNE7BM0alNa0TWATrx0B9d8gkTmJk8pLX
         Dspl5D1hk58HyOXC1xkebcKCPe+tfoTMlcA3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224349; x=1778829149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrwReiX+QIi8oPJeTptbUWL/wxK08lFg0+43UTtg/6k=;
        b=OTRNh25SJNhZqXGDB0yxNA+Rc/6Irh9vKptFC7u5pSLz4mQ/Dc/fwOh8/sBut9G1DG
         M6LH7G4L1qhJbiDIjth25lm89hgK6zbLuATw/25slIhxkkf1TmfvPafNXnGXNxGUbLvW
         Gx5jukrt8II5qlvGPFpPBjD9BTIOAKVywd8BhEf8Hr6jjtkfszcsm1dtw7K+nvvCY9hk
         5PsKH8BMRrNc9Fl+GhxoxGSNQ7I6FRWaFscoB6a6NPRGGxBisUeSzvJ5Mxny0aNHo+12
         qsQUanVcZx45WNgABh7hHIRluf2FXW0C+ef5bHyIslH5xmAtJQqAQmnkOrj/JRvJe/nU
         bXYg==
X-Gm-Message-State: AOJu0Yz1Skw7BXOLnlQkl+NalyU3XDBUDB7vprVU81TNEZZByH1TgnA8
	dzbpYGn7SbU3NwSphShxc6x0bj2ahjIJbcafBNkZU+VvuuelJIFZJvlaZscEI4rYCNfMqt6WN6i
	nYYlZHvQ=
X-Gm-Gg: Acq92OFJo2h3my+kFRuv79i33PUUcsB2m+peEoNuidU1Rizr+Wc2705EqGputb7kk3a
	f5Oh/skXtt/85pwQUcqB6THnjXnL+3qeyXCO/OT5+ACi/UfsUkNhHCdk7j1rCBktwjIFXFuVVGL
	H6joL0fP3xwyyfIMajdI4jTP5mMGaO0eCNdTNoRYs5X9UlaaglVlrZKKEZ92heJRIKammheiGFG
	x40dts06QHK3YrqUC/b0zj9tjxoKVZzLaOUStBhMWwbblpNrP0i07MBXhHE4xhzhb6Q182e6NLK
	bZOSgUVlJhwB6qRK7fhNRXNKgqmWAMUW0xBdfSIlRkcqFCxk10usvGo8y1ey95A7q9qkGMoid35
	LbMhOvDRw99e7EnGgwn6pcSGoc04zf3CeYRyChcGJqmvW6rrXzHc3XWER0GgWpU44p2XtNxC8i6
	kAqjDH8K5NzGc/LzV21ft/RyFWk5w4a0oIVlcGcZsLZhrxWy74M15voWUECUqRvK7NV92Lv+qJy
	1tdoO6ROhrPxkXPzlQtbEEmrUo=
X-Received: by 2002:a05:6000:4188:b0:452:79c0:f7f1 with SMTP id ffacd0b85a97d-45279c0f880mr8715969f8f.0.1778224349231;
        Fri, 08 May 2026 00:12:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/52] hwdata: upgrade 0.405 -> 0.406
Date: Fri,  8 May 2026 09:11:19 +0200
Message-ID: <483df8aaac5e2c4019e68280fe08547fe8287ae9.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236668

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit be9612dbde517e78e18dc886b32d0afbcdba2e4f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.405.bb b/meta/recipes-support/hwdata/hwdata_0.406.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.405.bb
rename to meta/recipes-support/hwdata/hwdata_0.406.bb
index 7247e9f3658..602ab7c9e21 100644
--- a/meta/recipes-support/hwdata/hwdata_0.405.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.406.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "be46d7186e918e62eb75de399e800145a781c8db"
+SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
 
 inherit allarch
 

