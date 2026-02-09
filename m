Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD49E94620
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:09:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1770678539979644732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HN9N5KOG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so2456995e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678538; x=1771283338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQVWByI7MWCZk6fAVY22/ZpQwXV0qVrkEW935Bet8z0=;
        b=HN9N5KOGvl+QGlpYlhQF+PjYQpYGhmyFq6BoHoB8xj1wrY0LNu/mc24X/xqUW1NhPn
         M02qD7FKhi1rI6Z8U8Sswm7MjfxcQss6I18fxjtaRSYnT8M/A4xZtjQ4xCHW6QV+rFUz
         IpDTuwGSa8fTA9/FgIaqVgeiPo6+Jujx3oCp9lRzdmQHZkaPXC7yyiYmqIaMAMEa2WC4
         b6uu38n4/80XjrA0vIi/02AETUjDfbXVaFYdcGiYyHQhC418E5/yLW+1v2iHgd9LsUAK
         Qb1eTGANZbhtYGVoJ3NvNkC2i0lcPhHafcmSDXknSgF4d+3s6Ly1011CwiosyKXvHmkw
         LAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678538; x=1771283338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQVWByI7MWCZk6fAVY22/ZpQwXV0qVrkEW935Bet8z0=;
        b=GnT6lmdeb43cEqz3hb04Fsa1d4hheaGNLSnxFp20n2qDjOUAN+2WdzdPNkWspRtBah
         9H8dCBoCdiWW/br/fBWeoZRibBpoVBSkIHyGsTINBDh8+RwBupFNo7QLuut4ICCWjsoY
         XlgbBnZHHOnTpu/5HqvRIyUJGcPqdUG9hkF0Jdlcot/H+uW1dqF8A9S8opbHzNuGU8As
         BcNDzOrq2GvttNQzAAZ9ELznybGOueobXyeV1auSXzBCbCDjpexBKA7Uzo0Wxalit+aJ
         DrCg+vaPKf82N/XxutjjOyHzKH9F95D0IxuiC0P9DpU8BLq0S+z/nHOWKfuT+8Db7PbU
         4CqA==
X-Forwarded-Encrypted: i=1; AJvYcCUnsMR6WPFzJLpkx2xfF0azlJX3BEnUDREuP8NfgCPM1PThdnQY4HGfu8jPLSFVJ5jDrJHShQCvMxihWBLpAeFrDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzwbf+1bDUk37pZf81rjd+YBqhLeIpuXUO2m3eejG9mQqnzpntb
	aO8ckL7x+8w00hi9NXTSeLNn4H8XzfAD0/mu72//pI71KRgzv9IIhcui
X-Gm-Gg: AZuq6aJV3ENENY3E9td6kHwK0gBqyWYt4v4o1fi5IhLl8I/xfqSzPOvNbXJ7kUbdJ8B
	0WJaXPYGcdMTLL/Cg2p3QMVdOP6kbTn7XE6rgaB+eotpsAAHB2wwsISghq9fDJdpSEHDq1JF3pm
	3wF+cPEmh3HU4+kJOeF3rbXKxfL/X/JeYt9u7RGfMwXMKz+95M1oI71qfq23+89T+aHMyyklFp1
	OF3UgNB1sWe/R2PgiyzS1nMWErPq+EKHcxOrUPMGmwlBUnU4uaBOJ4wZH+Nwfe0oeJXRwvhSU/s
	gPPHKPbVR1QteTRyDPBbQATyX0OUp4z4S9D/ORNmg26+v5KUHFiv6vszK7l7YPxL7tukoFFt+Ub
	J5h9SknaadWlT7g7DZFdST+v3agv+HWFxn65kkIci+lasaltFXv35qi73cwjOAUwQr+6HxMyHW1
	nQDQQq8AQxMEOXC4x1dnNSZGPxERpN67p7WmZ9HFLfnoNOcEn5hRWW0dPdCXxznaFa5A==
X-Received: by 2002:a05:600c:3553:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-483201dd227mr177949225e9.3.1770678538257;
        Mon, 09 Feb 2026 15:08:58 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e5b63sm168970265e9.1.2026.02.09.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:08:57 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v4] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 00:08:56 +0100
Message-ID: <20260209230856.3790-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209224444.17275-1-logan.gallois@gmail.com>
References: <20260209224444.17275-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230822

Signed-off-by: Logan Gallois <logan.gallois@gmail.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..ab543506451 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


