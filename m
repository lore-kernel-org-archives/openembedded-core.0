Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F7BCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 22:55:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16021.1763402485180354412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 10:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ES8xP32w;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: veereshkadasani88@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b1f2fbaed7so366040885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763402484; x=1764007284; darn=lists.openembedded.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfLXDka4+5B6uRmlg7XtOHGc90G9XTkeIVmI0DvTCgE=;
        b=ES8xP32w37LV9cXLlBgAE3342OlwNHCe32cq0YkuYaH34nPFDN7gV+sILI8aNJP5RC
         /6YtpIKsF3RHwOoz1Hril6OvHiGPBxJAwXeEOpYzBzp2JkmIuIXJyCtRdd8z3DLBxV0x
         2OH4rJfeBUQ9VwJxy2ylgjGcLgP1H3vQt7K8316IdeBr4gQrbZa3ZyscM14TkPfUExMT
         5IDhgRFJzJ+GM88hJ2rZ574jMkIj3+QcxCTnhpm6+dWw9+oZYZ52fivr7qmKUEoL7//L
         8+XvBhimYI0YU3HiE2qHQFmpWvePkE1qvYdd4uD0gJHdPKQMg1TQJMB8GeuPKp9wevuw
         f6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763402484; x=1764007284;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfLXDka4+5B6uRmlg7XtOHGc90G9XTkeIVmI0DvTCgE=;
        b=RLIJxPCMUMktw72/M8j7nrXcQsb3tTthTWZfAlXa4moT7cyZhNsVOegXCBBNac3H5t
         ZrGDfZuEQU3so31UdX7xW0wWDjzdIttF7BbZxIy/i92v7j94apeMf6OETSOMEKnrJS/9
         z4+Y1Y/ow3xGPjvAcnemWRW/qOvUdLedzcdiBlQKuu5Hesf8WhyelD9AMmmFShm1CQ1A
         gsn+yDYSWMT/kfkrm1tvLuEdU8yPWkvfP2iH8Z0Nwy/r69Er2ZJJ8PWHdTxkUWbXr796
         T4S9oN178G2FYaNrH1tNgzHy1HcAj5VCe2OI68q/bcpU1/sS9HuylWVA+yW9uu6y2HEL
         CqrA==
X-Gm-Message-State: AOJu0Yz5rEE3WtQTGlGd3S+WgjBIX8iDcD6eWJx6P4KUmJRdZV/cq/1V
	o3m/AqvrqfY0nz80cUXhIqaSOH3c1eBPpu08rPPV8QzUvBkyDEyfLIF+XNLhTQ==
X-Gm-Gg: ASbGncuajB+FINNBX40BwMGYXWjfcdsSh9tMzSu/8jnHT5RwxP7UbptAgUSiWBU1F6P
	gMWcX0DvnxSUBFyMkxEslHFL9O7aiUy7dQxyErFaPqkhziA9d2DY7lz9GqoAuWfKl6eF1heVVFL
	W8+rOUFYeKWS+qLyz1MAiri3E5p25yc63C52xVzC4iwE+qm0o+MWFHuGLG9whGMYAo4fv4ETUZm
	0EC2iMN2KPT1hh9gTF/xcj57DSc4GMfV/iOTcgv7Z6PFZT7a2jF5IU6XX9GA1NPypC6jLxBEzGB
	3s6FQmJpssGPYag+14eqrh/R7NcqzRa/umc1qnu64u74F4PvrMjE5ZX4ft3CVuehxD568EH4jba
	gqpX4S5YtBCb9fOQC32ZUSOkifH+h6gdl8MSMY0ewDzdTvxN7zLqewpYNa/HXn0rGbfdHitJdjH
	pmPgmyY+tiV4OKWacP6FOBZm8HDQPUBZvloN2D3ZdIHg==
X-Google-Smtp-Source: AGHT+IE1cI5GpAMEvjOVBHchXhu+0M7qZUZ5D9h3SnoY4bE2Xg+rPV/Us0Fz0lrOreMSbKyUyB2rpg==
X-Received: by 2002:a17:90b:4c0d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-343f9eaddb1mr14682620a91.10.1763402071285;
        Mon, 17 Nov 2025 09:54:31 -0800 (PST)
Received: from localhost.localdomain ([171.76.82.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc3761d0109sm12782993a12.27.2025.11.17.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:54:30 -0800 (PST)
From: Veeresh Kadasani <veereshkadasani88@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: veereshkadasani88@gmail.com
Subject: [PATCH v2] weston: Add PipeWire as runtime dependency
Date: Mon, 17 Nov 2025 23:24:22 +0530
Message-Id: <20251117175422.3421-1-veereshkadasani88@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251110162331.6287-1-veereshkadasani88@gmail.com>
References: <20251110162331.6287-1-veereshkadasani88@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 22:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226508

- Add pipewire as a runtime dependency in PACKAGECONFIG[pipewire].
  This ensures the PipeWire backend is properly enabled and the
  runtime dependency is present when selected.

Signed-off-by: Veeresh Kadasani <veereshkadasani88@gmail.com>
---
 meta/recipes-graphics/wayland/weston_14.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index 451fb961a1..73c9ce38bf 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -90,7 +90,7 @@ PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
-PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
 # VNC remote screensharing
 PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
 

