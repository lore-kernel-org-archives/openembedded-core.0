Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23415C83F26
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:33:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.15311.1724938378653515160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d07R2GUT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2021aeee5e4so4005445ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938378; x=1725543178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icHvv5UBu31ppil7ClN+DyF27tB2AY5gBmpeXnep5u0=;
        b=d07R2GUTR67CTyeNIzeko5REPOaKqJw7PiPMMBnQdgIsomE+2LQPdFoB2IrxparGDU
         5n2S+w2ScwlEhQ31IRwXlKjyqoSD6Bx1CivsWyD1zDIcTuEyb53RSuaDLLREIUTrJ13e
         9HoE9612QFtUb8aLrfffhYe8uwHeSYA/tBYdw5gwzIMC0fnAMcXTJpAZT/qzNpInvbei
         SgosMU7UIm2LbkXvRNZQwyGlGmC8PIwkocHdtA8E/L/Ukm3cmZoJCmz6KcxALguZAgO/
         jCL6B9TQKPdt+DB4wcb4wcBuDU16xveb35kZ1khIena3MpnpwflDFrTpEEG4JTGDMcqa
         wKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938378; x=1725543178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icHvv5UBu31ppil7ClN+DyF27tB2AY5gBmpeXnep5u0=;
        b=P4GoTJN8OLa/I856P4wBw9cUzvMN7vulCYbfF7WnjNkL8+06iNHtuzUV6EjU25hshw
         go7fJaQ1P0UWgrW/74d1X6/tQSzJBZq0luTJ6TA/MwJb/yA2OqmVlOPNZJlgfARDhv7L
         F+W4+U3yyJxRq8BqyZpC2TMquxIVxeu2DZb2yCSBLXomYgavkrZBPsUdaKsPoxjPI2Ps
         n47yk901ujdvCcYTwD9ZYLbc0awEB+gJlAA/5ZDWQPpNYAJo2uLoCD2DnAGdEjixXzGS
         1X90d5/4bCiMqged0siE1139omxQgNU/g9f6XzBKKxJRcxhMmncZbJVR7DH4sx+EoqTI
         stpw==
X-Gm-Message-State: AOJu0YywxXsmp35AnUuLMZtDpfezBIOwgL7Xw1Eq8STyRan+crD9IlHG
	CSO6DFuC8/S6e3aJXD5WMQdKIsYBvl1mVje5RYOmDkIL64m5OlutCp5KyqF/fzoYTUaOrkEjqIc
	N4GU=
X-Google-Smtp-Source: AGHT+IGAVPggc39xP6mTHQJoUIm/BNPnS880OyXpQO9UZTRlt1NYCzD10GEQlb9F4HBFV9NJoilUIw==
X-Received: by 2002:a17:902:f649:b0:1fc:6b8b:4918 with SMTP id d9443c01a7336-2050c4ba62emr28334445ad.41.1724938377844;
        Thu, 29 Aug 2024 06:32:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] weston-init: fix weston not starting when xwayland is enabled
Date: Thu, 29 Aug 2024 06:32:32 -0700
Message-Id: <ba66fa75e57f94d35bfd703075ea6706879c63cb.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203929

From: Quentin Schulz <quentin.schulz@cherry.de>

When xwayland PACKAGECONFIG option is set, xwayland is enabled in
weston.ini. However, if the xwayland module isn't installed, weston will
refuse to start with the following error message:
Failed to load module: /usr/lib/libweston-13/xwayland.so: cannot open shared object file: No such file or directory

Therefore, whenever the xwayland PACKAGECONFIG is set, weston-init
should depend on weston-xwayland to bring this module in.

Fixes: fdbe559c66c9 ("weston.init: enabled xwayland")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa2314125318634108452af4e40c9eeee260767c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 024e400665..34b7eb78d2 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -83,7 +83,7 @@ USERADD_PACKAGES = "${PN}"
 #
 require ${THISDIR}/required-distro-features.inc
 
-RDEPENDS:${PN} = "weston kbd"
+RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
-- 
2.34.1


