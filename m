Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4564FD88D1
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 23:33:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8771.1773185596016781296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 16:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ylq4hZbe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485409ab264so2837485e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773185594; x=1773790394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaBuISOMPUNIBq+FwLxs3a5S8DRG+7PDHN708iV8Gsc=;
        b=Ylq4hZbe0AGwpR68QWRItrTEAtVP6gOLCFW/NmXxGlC/s33M2eyQkLSyUcbl7Ivmc2
         bBnE9EjJgvwYm0Okv1EXSc6vbtvQuBJ/5/HbujWcCa7OJ0CEiVRZ7xq1VR25fwlGH1Jn
         e0eX2pHCVHzWUZ4ejYCUVNzOBnDswQpAkGXXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773185594; x=1773790394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JaBuISOMPUNIBq+FwLxs3a5S8DRG+7PDHN708iV8Gsc=;
        b=A6TvLpIXQK9bJ3G/Lhhv2woiaH6QV674LQhvchdcZk+VEGByYjqbLnbYsgkxV+XcVo
         se8AArl8BG6j0g+gGwuadjMd5zlYxpb4Ze+CaSalwbkdqYcPZ6FG3t0KJJaKEIPPm02w
         fTioOtufHGOBgUsXw82w6mMs3KG2iS1yLuM0swhuLLrqeNKqFyO9EJKWn7yS2Aqpf6Kp
         W3NCXHyREmrnNh5mDrtpnUqxCuumKUnTDbwrxB338wrM1N/SqFz+yIy0LAE4471paPAz
         QEyjUZtpkq0khBsmoww9pUmuhpee5w4v5FoKMt2toQ+vFu92KiedatGKUk6SCJXCyn6M
         skiQ==
X-Gm-Message-State: AOJu0YxlyH0ZUSWKaFCNl8rgswoe0zRV26rijKKOlZLkjUtpLwkR+O9U
	0SKej10uNt/5g91pNZ7PWsK3mgl1ztlC0xrFjMkl1464ypILKNolAonAO78yzZ8YkXYJLU5DNZ6
	PqpmFGdc=
X-Gm-Gg: ATEYQzx+mTgW/l8p2CE7zGkLgM4KwH1KpaC7j9xfvKYr3k/wzfOBvN3vxI75nBfCLZP
	Az2kN4DlIKTn1fOGQTAApSHyBykOrjrxUnFH2OzLnm5NKW/nZXGYrPXWVuqMvU8uDx5JerhWOzh
	UjptkcvqQJeRCN+yXhGL26vNSrCr/vhFan8bp3gYuVIzDE3w45GcqjFuYH173nT+RafaLwyB/5N
	hyrxYaZWAHJGTwnVc9QFzGWJNr+H9ruhu3SEQP6QG3Xbro3H1Rv1edxt5lC/WmkT2C3Zjefqwgb
	9Wy0iPES8tkRbXe1HSIzRfGD8ff3BljgBGBh7QwP5UP5NWT2phPuloCov4NNf/7/Oeljd2wUTV6
	GRsP9Yv5A5QqJPvKoOAbBay3yJyspfOjL9ualv6bm6ALJpVz1h09cuolOjWCoKtSJTpegAWg31z
	h6MPoQ2JSuUu93dPjDpXo2rVmK6C1RbElDZvlC+dphciumgbBre8Y=
X-Received: by 2002:a05:600c:4e4c:b0:485:3b4a:f707 with SMTP id 5b1f17b1804b1-4854b288419mr6787475e9.10.1773185593839;
        Tue, 10 Mar 2026 16:33:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4968:9824:44c9:31a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2fd030sm10181445e9.2.2026.03.10.16.33.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:33:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Drop nographic option now runqemu falls back to VNC
Date: Tue, 10 Mar 2026 23:33:10 +0000
Message-ID: <20260310233310.3364647-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org>
References: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 23:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232830

Since runqemu now falls back to vnc or a none display if DISPLAY isn't set,
we no longer need to pass nographic to the qemu commandline and can allow
runqemu just to handle it.

One challenge with nographic is that it changes more that just the display
setting, it can affect the serial and parallel port mappings so this also
makes settings slightly more consistent accross environments.

Ultimately, this allows us to stop requiring X desktops whilst still having
a way to connect to the display over VNC for debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 68e986150d6..57f86970fec 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -172,8 +172,6 @@ class QemuRunner:
                 launch_cmd += ' kvm'
             else:
                 self.logger.debug('Not using kvm for runqemu')
-            if not self.display:
-                launch_cmd += ' nographic'
             if self.use_slirp:
                 launch_cmd += ' slirp'
             if self.use_ovmf:

