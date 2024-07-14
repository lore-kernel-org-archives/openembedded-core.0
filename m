Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F8C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.15463.1720960762546914996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WxOqlt8H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70af81e8439so3006488b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960762; x=1721565562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+IRQEXzbOlHKUNgXhlrVr/gvrOqDogXxG3oe9ydRIw=;
        b=WxOqlt8HPw8vF4n+eFd+7Xw1I/2rXOn5bUA14CKBIXA/2NxKb/Bg1mBRKQCg4EXhd0
         FtKTWd7A/ov2JxI6HYG2z8cl/hEsNf02Lf3MAZNW5rTpX0yz/hSrPxAmqXhe0hNcvKzh
         ttRZ4/CPmia7VPJFVQuquNAQEc6yH+c0XOYtXzYchkkIyYH8aLOOROdBZRlblZlPoXoR
         sMbMbpUDJzlKoE49+ZZIXiiO2WJ2xQCB0k6JysxHJjncs1Od9Dd9AqzXYxPI3mktkt7j
         liJovyqzs82th9ic+n5w2M1QsZGc/cwuW1D4cxzTLd+88UTw7otqGTNskUQu3pckNMGY
         gUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960762; x=1721565562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+IRQEXzbOlHKUNgXhlrVr/gvrOqDogXxG3oe9ydRIw=;
        b=AVcaHi4g5IUG5VQl6bqbdSKKeNd7CSUB0IeJZDa9WFQ0JWS5uX2PauCjQYArynJOI1
         uq+TJ/gVt69Wv8md+Pxj26OONgxth2MT/gIUY8K88MzPPTfvj0PAnQ9Q9Z6ckIzHpd9W
         4IIOkgEwe8cewRk5jrKut0TYdexLhy+eTrSRXRHPcyQbAiNyd89gWEZW83Q+uhgM3kWl
         AZ3xBYp4Mdofuou0gll8GYrpTlVkjK8h/EjcFmtXaBOUGLQ9Y6JLvkOlE8ldtju9h5uy
         +gmtqKWd2SNVOyopEeIjIGlx0lKkB3POeiUSpQPUwKwFU5P8TjWoDzrH+c9CakIhjJlm
         I5Sg==
X-Gm-Message-State: AOJu0YzWDXvTDCwCOC1F2PS2LcfgdoCVfSz3QdrQxSAM/2xl3SisYQuT
	2RjMLDHN1Fm+SLpNzXCJM9fdOCRao89KJ67jqono+t9gRJU1rhDe4/2vEqQP4ubAxUGE2Hxo0da
	kopY=
X-Google-Smtp-Source: AGHT+IEH6QyhAgt63s4CTU/89t2npGfhYhkUtFlIzC7p9jsv30VuxuvjBDcPsDNG6lDKDCbDlwpogQ==
X-Received: by 2002:a05:6a20:3d84:b0:1c3:b102:bfd2 with SMTP id adf61e73a8af0-1c3b102c10emr14388811637.14.1720960761855;
        Sun, 14 Jul 2024 05:39:21 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/27] wic: engine.py: use raw string for escape sequence
Date: Sun, 14 Jul 2024 05:38:37 -0700
Message-Id: <ab3ed4270af1c8d4a4dd15b8c6998182801d4bce.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201867

From: Enrico Jörns <ejo@pengutronix.de>

Fixes:

| poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape sequence '\/'

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e33d7241f6c2897e930aff41e18b154891197ab9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 674ccfc244..ce7e6c5d75 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -359,7 +359,7 @@ class Disk:
         Remove files/dirs and their contents from the partition.
         This only applies to ext* partition.
         """
-        abs_path = re.sub('\/\/+', '/', path)
+        abs_path = re.sub(r'\/\/+', '/', path)
         cmd = "{} {} -wR 'rm \"{}\"'".format(self.debugfs,
                                             self._get_part_image(pnum),
                                             abs_path)
-- 
2.34.1


