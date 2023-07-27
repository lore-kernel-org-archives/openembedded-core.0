Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26366C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.16769.1690487073744520215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xztJ1Qj6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-26813478800so851652a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487073; x=1691091873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Jpd/OkzfqiNOCitgJzcAfxCj7LunRw7xyN6ZreMCdE=;
        b=xztJ1Qj6nUZwSGEmVqJZ9F7SGh5Scom2FHXRfNAwfFjk/VG1pfd3CIdmlzmtmo5mVb
         6ly8gsm9Tswn41E772M4eJky3tGO9w7qs5VrfWKYGN8Oy3DUzrfVSoVdfN9pAojTo+1z
         FNdIUTK7l0uLPE6e3FkNuDpv3MdXLBoVDR2cwBoW0hKLLsrvIdpr8Zgr4n04bSUdA6vk
         9HrhNL2r/k50wkIGIOvZq82xUVZnrBIrqBgo8TuZEYbHWUMEoSfM+WbQrGNVogLUebIJ
         kDFoUd/keJXAaXqAB2ctTqw+cfZA5hdcUnO4c98K2GlGXG8bIHW9eHdMYdSJlCpVS4R/
         J8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487073; x=1691091873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Jpd/OkzfqiNOCitgJzcAfxCj7LunRw7xyN6ZreMCdE=;
        b=G74eWJpNW31WsMCfu9534oVciehLXTcWJAGGf9WQ+Dt1rYErDsDvsAdbn5eAO0XpS1
         qv/GgwKl5+bZ8iV3+w7NYltaNZbFKDLvGPNqZWlNofR2hcAVJSqd0hxZ7pmacxX6J2g8
         2j97t9I/CgjkSs4szv2CElSqK1GS6iMUTdXUNxZuadbUU+NRitldArrH7XcztyQi3EYt
         1biUAgXc2hcLhNUz3RZlkMEmrg0cQ7I7ibDssN3CFjdP9a2glK1WbIC8iHooh2O1MhFx
         N4eZBmdgXwyNzTuKn7e8JjASlclzIG8d+ua/E4oIYRco36aknv+JzYYqYLd2CalNSwly
         588g==
X-Gm-Message-State: ABy/qLarph9LbDzs/fFK6SD2JiuarRMf7C7e86JLb4EjtjW+g+hOh1IC
	95Yema6WXX0SYLtxxQp0TpGj4Cp5XZgYrri2lj0=
X-Google-Smtp-Source: APBJJlH1JzT2yQEFo676IDM7CosbnKXo7TiC7Fb0xOQvEHZNFzDycEKaVYtlx/N7q4uhTRsjF3rjAw==
X-Received: by 2002:a17:90a:dc0c:b0:268:2f2:cc88 with SMTP id i12-20020a17090adc0c00b0026802f2cc88mr289732pjv.12.1690487072881;
        Thu, 27 Jul 2023 12:44:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/27] systemd-systemctl: fix errors in instance name expansion
Date: Thu, 27 Jul 2023 09:43:39 -1000
Message-Id: <70107f1bc33b45da794b7a24b7325eb476516fdf.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184996

From: Yuta Hayama <hayama@lineo.co.jp>

If the instance name indicated by %i begins with a number, the meaning of the
replacement string "\\1{}".format(instance) is ambiguous.

To indicate group number 1 regardless of the instance name, use "\g<1>".

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d18b939fb08b37380ce95934da38e6522392621c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 514f747fe6..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -202,7 +202,7 @@ class SystemdUnit():
         try:
             for dependent in config.get('Install', prop):
                 # expand any %i to instance (ignoring escape sequence %%)
-                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
+                dependent = re.sub("([^%](%%)*)%i", "\\g<1>{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.34.1


