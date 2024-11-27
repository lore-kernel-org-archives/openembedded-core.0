Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579A6D66BA3
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 00:51:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.61973.1732668687121949004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 16:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hlfLhte9;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7252f48acf2so355827b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732668686; x=1733273486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej8QUXPi1rHdQ742Q027REmGZziZpHKnMhCp1Pjj79E=;
        b=hlfLhte9r3FUz7rAEQcjrra8UoxHjz+Mqjra4YTzBf3ymt2tcEwe8lj//8L8i1ht0W
         idbG0tfUunZi1E2ibmyvjMlI0N8Jql3Y5AgZTTFfQNqVmxXcdFeByUsEE6lKlrWMrCtI
         rBbjCLDZM1cXTFxNIuC2zulcIMJZ8Stiqf8K0l02FJND3YoSQkES2VgXc52Tqx9YtEwU
         Awlt23vrGNNAPAg8pjvzEOUeD5w2IZPB7FZ/aVnf/JJtSSh83lf+ue1UP6IQj2AIZMAg
         vc513AeUSRRxrefnS4L8lwlnWmk6Rhp80Uk0+ZsEBTa1QZmnerHw8fYbiZxiGC4bjzmo
         qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732668686; x=1733273486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej8QUXPi1rHdQ742Q027REmGZziZpHKnMhCp1Pjj79E=;
        b=LUOirj3hsK9hyaJlhKimj7/H7GNma7rX22PTsLjkx5DD6ykaVKZEPg8kLuWop9boBM
         xr65QxATzPSNXLufjv/BxrpHbpRHgUqZ7oCvrLVIrF7jZxttVSmdJpIPyGlK7dWbKkz7
         FQXeJYhBzmbbYeeWVBUj8uwWVVFbKg09cTrINZu6ZkwmQVa5FmGDV3T0V4vGy5rCwdMi
         sFCDxe8n626DwmUd/EoiznAPtWtapZKwtakPyXnWPskYfX/42wkdPFdzAMKGddCzSjan
         zJ/dL6sKbSZorX9nMozw44C1iFAUIUv7wQJxUzTzh2LVamdpvkHqZ7Tp+r9HYFj0lF+M
         GmAA==
X-Gm-Message-State: AOJu0YyQqNB0a1HQsQi0fdasVzQb3FRpc57ESzCEigEgvY62kV2oa3mf
	KsCI6d61SJadSsNqNhQB70pMHZ/aPIthRD85aqQ6Q+ZmHZ13ln3xnAMb0Q==
X-Gm-Gg: ASbGncuB30m8CwAd+A+BNth/H7m8iIZivrU2cAo+e5wBhYwJ1rgUU9vdTary0hI1Lkv
	zVnMMw+N6oyn9ub9gia3fkCvP/j5lsvCouE1bz+RAOIplwpD+eTim8AHY7qOECfDZ0VYok8AY5I
	AC4ZCJOS6NFClU5Xh/YHh1yZQVm87heRDUlgjsH7ol3RkKhSYrh+uWGHTPm4teBswt5RhIhaUwK
	lWAkJco7JxKJgfn1kB6Vq0WLgaBovZXD2ZeFIIOEg6K7FXVtkUg
X-Google-Smtp-Source: AGHT+IG5eX03sbIRZUgTzYjE/6I3APczxBuL32VzYLGqIejTjA26Vc2OmThtYZyErkyJwozE0Nea/g==
X-Received: by 2002:a05:6a00:2da2:b0:71e:7674:4cf6 with SMTP id d2e1a72fcca58-7253002489amr2508943b3a.8.1732668685806;
        Tue, 26 Nov 2024 16:51:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e41d7sm8092209a12.23.2024.11.26.16.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 16:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] weston-init: Make weston user member of seat group
Date: Tue, 26 Nov 2024 16:51:21 -0800
Message-ID: <20241127005121.683644-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241127005121.683644-1-raj.khem@gmail.com>
References: <20241127005121.683644-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 00:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207891

This enables weston launch to access the seatd socket
/run/seatd.sock to communicate properly to acquire seat

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 3de697ec34e..52ffba336aa 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -102,6 +102,5 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,seat,wayland weston"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render"
-

