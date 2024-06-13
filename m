Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479A0C41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.9960.1718288443136940960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0CzJ0Inh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7043102dcc1so892148b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288442; x=1718893242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9M7OdfAn87gVHZodnM3UOoBQqOD2MMZ35tBmJySbgk=;
        b=0CzJ0InhkW4+Nh/WNCfqviocJYuadDSSU8b64fVG1mf6Sn1eZ7ergl/ur9R1OJFXzW
         /oLpXIRNiizizTIVlSy3YxNvlAA8GQfvrpPW4SLX24YG62qhqa7ozk/vEqgy+e8E0QgO
         V2viSafpGR42OytjZ1/CymXEXDj2BuunuNLi7rwGGHrce4n8czagCwi06Mp+rayo/qi9
         PcumHm4qMv4W9yql7ZJIDeNTDMYvUMZAKqK9b3+K2H82hsOQrTegIIyrFQSTNGEle31N
         ag+j2pzXfbaKqTlDZXKgt0lw/S2usUNxSZKiXpJGmuw5A3PywWA99RYv+ye+x102fHTA
         Qg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288442; x=1718893242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9M7OdfAn87gVHZodnM3UOoBQqOD2MMZ35tBmJySbgk=;
        b=U2RAKJ9PzGrGUJcafs+kYUCPv4mECfTFLdf1cDrZbPHbx5l/LWahJiZbS7CODUCFoi
         96g9nW15oHq+YsPsafjuiDj+ekfUCrBb2FIo4nHYNyfjSu1QOYNBED4g2Tu5ov+fgjiT
         yaZ+7PKiKMLAVaSP+oeiwNpkM7kf2JT7zoe8p+3BCUhub3b7Mm6kqq0BlXr6L6tJ97ZC
         s68nmF7xbo+Eggof4MgYVYwcUtAGfFhPTXU+CrNVyuJcBjsq+kr/uqtprl+HWp4KThM1
         /eqHPhDq78hWT+flHjQA0IEXY2pU8E4gU4SU8/4JzK5KffybgVhIBTYz9KPVhEgg0/kJ
         ldFg==
X-Gm-Message-State: AOJu0YyOfgf7alEJjiCgwqw7GHg7wgIzr6lrf5CFBdCK7ICms/MdZg9x
	H/A1kVA10bpo+qyBaGKEj2fDhEvDs6iaWfXNMqST7kQJ/+fuhDs8A5DckZMRK3dJOfMoY4qgnUs
	W
X-Google-Smtp-Source: AGHT+IGrkuWz3NIMYlfMfovOb9h7LexIdqKvAbtW5Clk7mwgnku7aFHPM0/Mw0P05ulSiqLN6YooRQ==
X-Received: by 2002:a05:6a20:728c:b0:1b4:772d:288a with SMTP id adf61e73a8af0-1b8a9ba7e8cmr6161484637.23.1718288442434;
        Thu, 13 Jun 2024 07:20:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/29] lttng-ust: upgrade 2.13.7 -> 2.13.8
Date: Thu, 13 Jun 2024 07:20:07 -0700
Message-Id: <a249a913f5f1d093e372be2e25f3e38d909d7ce4.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200605

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add close_range wrapper to liblttng-ust-fd.so
* ust-tracepoint-event: Add static check of sequences length type
* lttng-ust(3): Fix wrong len_type for sequence
* Fix: libc wrapper: use initial-exec for malloc_nesting TLS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3dd02f741a151bcc1fe46e7fd6d585ca92c86c60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.7.bb => lttng-ust_2.13.8.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
index 9509185bad..dddd3a5004 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "5fb4f17c307c8c1b79c68561e89be9562d07e7425bf40e728c4d66755342a5eb"
+SRC_URI[sha256sum] = "d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937"
 
 CVE_PRODUCT = "ust"
 
-- 
2.34.1


