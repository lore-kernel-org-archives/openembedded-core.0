Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BF0C2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.70016.1718966582234322609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXmidSPG;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so1025403a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966580; x=1719571380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E4DbSCEm/iWbCf3JV/zUfFKEOzkjLcsQbJXJXMY1Yc=;
        b=aXmidSPGnN6L5h8GCOlWzaVoEFT4gosoDOTj90TvUtiIZgz38mLe/wxLhWFICVMo1U
         tIBdFCclb5vipuuVs85ZKidIKX7+X8tYaovo64AqNir/ZeerFqkLN0UiTjMUqa/miJ1R
         NgooxgqDo7k2MlBLOjH9hoW6/Bv+py5fwffpys7aP+akmpjFDjxDjJgDqKTfb5AsBkje
         vSQF1z7DPLj5I5YaCI4HHPqkL7dK35deJLGS5rbwC3q1kmZcTZlyjry3vl5FnkJ7gqC4
         hqvkfgucBKcJLTEglFs/pNqfT6FASFBdEhlj3W5KaDqOIuh6ybs1h3TFYrEt01F8kMBg
         23OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966580; x=1719571380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E4DbSCEm/iWbCf3JV/zUfFKEOzkjLcsQbJXJXMY1Yc=;
        b=Dc4e6kmKjgSpBXRkZMGCaICpQF2V2qqB9b8a7khMxn+gVNGGDy/MPVrCZBYj2dkawm
         4/aDqQ8jSNH6Vu5WnpN97yXhyc9F1fSnuHl0Z/I303Gcl9H3KPiQUjVM6Xba+uXNO/GM
         e04NavVWaVadTrKZCJw1oj1ik5xETW/nW6ly2XsXvhGyDHlPp68G0hyDaVcsrRF0r/Xy
         vJa8MLNhsv24IYDU08Yp2Ro6bsvLqVfMO1oojGEliB7gK9kmJwHvGE17UC3iVESH9plr
         cfRSts2taiVtd4EZSQ96a2LPXieUr8pVtXi1GSdzoA7ZuSlhYj5tmNJJnT0nE7O0MWrb
         5bGQ==
X-Gm-Message-State: AOJu0Yy6/dZdeHGzsNwd+tJlMktu0AgCAquSv0A3JsQ7gjX6+R0BmazP
	NVn51N2kRgdSEDrh/m8fh3N3PMOW/VJvmUsZNS7iXOtYOAu7n3daHrk2ew==
X-Google-Smtp-Source: AGHT+IHKTXPIpAAOV+mndul2WWBZAr+0S4K9M9GVmo/ZWT1PitCl5wG6ipCO7k+lE6R4Puftlwjt4w==
X-Received: by 2002:a05:6402:947:b0:57d:10c7:96b0 with SMTP id 4fb4d7f45d1cf-57d10c7983cmr5218444a12.38.1718966580374;
        Fri, 21 Jun 2024 03:43:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/11] qemu: rename qemu-native and qemu-system-native recipes on version upgrades
Date: Fri, 21 Jun 2024 12:34:09 +0200
Message-Id: <20240621103414.2842509-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201011

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/qemu/qemu_9.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_9.0.0.bb b/meta/recipes-devtools/qemu/qemu_9.0.0.bb
index dc1352232ef..da9b5bc679d 100644
--- a/meta/recipes-devtools/qemu/qemu_9.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_9.0.0.bb
@@ -25,3 +25,6 @@ PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie slirp \
 "
 # ppc32 hosts are no longer supported in qemu
 COMPATIBLE_HOST:powerpc = "null"
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "qemu-native_{pv}.bb qemu-system-native_{pv}.bb"
-- 
2.39.2


