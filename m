Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DADF8E482
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28273.1776378802671155783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Psup7E9i;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so604255e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378801; x=1776983601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whCwqBJh3d3qNfBeye3GzVfXJB2JnvzIkn5icCEhv/g=;
        b=Psup7E9iKCps9GE/qNACUixjSduDGM7FMsPKKY3xiNWp5/PJ9dEv3zh7CHH0+IcMil
         h940Wy+YbcZFbs082S9pgA+FF+OzsHbmqLjkMYYexgdxpFFys+JZF2p7HxfUsSGCvSdy
         S2AnrAkX+O+OELsYH6nQk88BHnxU/0D0w8oi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378801; x=1776983601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whCwqBJh3d3qNfBeye3GzVfXJB2JnvzIkn5icCEhv/g=;
        b=dDbtcWXwAXpZOrjrg97dhFuo5WrAje72i/ZkKdb3or35bWlLQw5hu8RrWj45ycd1nX
         qudOQMtejUBJId6yxiPq0URCHvXmoI9i3VLJwyrX0LK7OdBvrsKaceu48NuSeBY7Jwq9
         qCsR/7XWY/PistqykuvQCxm+3ec5L/Flja/lvlf06xnFfzSwOdmJV0eycf7dlsHVKWge
         Nf+tDVj9+/VQnUtx4sG+XKWqJYRP7sz4R1qBSTdEArg4ox0AxNQj4HiNToWKS5RdXUYy
         D2UxWHkLzSfcQd08l//eJgPbcRgmVWqkOIrNVehEfj5Ey5cVV7Dk4Ay/46X/54eaxy3c
         GbGA==
X-Gm-Message-State: AOJu0Yx4swC9TxqtJFRZRAkXnv9NOXjcCe6UyJvQrecRpAzcCX6XTFnF
	8grx9Z/sxYF9utCytRnJ4mcHfBlh99zBKysFzTaLQpx9rizuUdAwKTTAOoZ1GpVFoD6uRO/8UUh
	8ZtdBxjfQArSR
X-Gm-Gg: AeBDiev320ym/QIhx4qSxE86BXknhurLefJsYnSObQiftfU6O+7ba1RSLX0IQhEbPZ4
	sN7lPhf2JO+HXgw4DZDJb5ON9/TaqYmmrGl8RH64l2ZYTbu0sordkxZQgRHopCOM5ZcL5URRGIz
	rceuGuoxIM+VHos/dR59KqA5oPmpIY0sB++G+il9iMQzXPH60PfYHaVHMFofBPLbUn/lM8Ehinr
	I7xIJxT8muIsZWDU1S51yrRkQfFF4n/SPpgqIuyPj8rKOuEBIvlFD08v2WmA6zge/6KC8O63MNJ
	H2m5oGi7ID4/jKGVPFJG8puJ8G3roWsVRWq8SYWG8FWRoH0DzbhuiNEuzy/RC4ikTg+we8rZFoo
	pByJKjuKE0STk7AeACN8B3Bw4E7H6wclJaXxTxTcVYI7qqHhL7UZt2XMidLIYJxcAH9jVNw6eAY
	bi3D9uB/rLbFLCByRUu65Erq285ioG8MEnViCb9p5d4osPLTO4QK5bu60KYH/YSrqnL+DeAQvqP
	go4FjNzpVFPwteLD+38hL27FVGjZadpln0Ln1xEgCwc4Clc
X-Received: by 2002:a05:600c:1390:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-488fb78ea6fmr4810405e9.29.1776378800848;
        Thu, 16 Apr 2026 15:33:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 35/51] archiver: Don't try to preserve all attributes when copying files
Date: Fri, 17 Apr 2026 00:30:18 +0200
Message-ID: <b437e124689520579f4859401a1b0a5a4930d5c1.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235464

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
index a95c899a0f8..a48dd259fa6 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -398,7 +398,7 @@ python do_ar_mirror() {
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
-        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        cmd = 'cp --force --preserve=timestamps --no-dereference --recursive -H %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
 }
 

