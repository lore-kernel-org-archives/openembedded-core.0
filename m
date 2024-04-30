Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5C4C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.257.1714512259607298753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B6uJtcAx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3ff14f249so2135315ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512259; x=1715117059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ+EXJWRO5w3jvDj8zISxMeALJw1Abkb5jHoADN9QNo=;
        b=B6uJtcAxzpePxSaBhbtq+8UuigvQyrY7W83AU+EbOL+O8nbQX5QcxXtQ+OIncP7+rX
         qzZ0lw+yNnrqTmU6LShp2MQJi4esHa5Z2zglekA4h2gBy5ZlWlRdHSI47/SrCSCQ0ugL
         tsbT5HwDn5mkyTkA0Fi1jqkMxpS1khqBW4HXw8vsh8HNhUbCcZMw1e6CN8i8dtep71ue
         k01XrgPkHPz/WULPNQncVz2Us31Tae8C4eYNP/91/aQvhC2kl/widJlVMgpDdgZDMnZc
         kcXH0D8+Wyfel8tdt0Zvvg7aUrwuwdaegTGqOR59PqgeEajAcsmvi/hto8DXC96xsB9l
         PTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512259; x=1715117059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ+EXJWRO5w3jvDj8zISxMeALJw1Abkb5jHoADN9QNo=;
        b=Z6amxfpvXgDNRieRzMadg8AcMpw9xu/RX+YHUv56xrTPZEC7E1TB732++RJQbNAGI1
         WGjIAigYW/H15kIegycGVb/5CQci+zLg8qqA9XL2Bo0MeMQ7F/9ycjHKsArOtIawU6Df
         cfKSEcoCNr+5HVrbr1ngGHxDD+2DwvpQj6bR8q4RS+7vohf2Ya6rMp0kiN3CcRH3Doux
         KmOOh77XrAN2hGSEccZHGheSQDt8aOfLffYuVDad4zz6DR7M1nyKSmn5BdCI6W8r0AKV
         zzu6JG+h2ZNEcpLelyhCdmexEjW6rcXzHvW5phtvDVg1Ho5p+pHd/9kSw4Gn5UVSSicx
         KQlg==
X-Gm-Message-State: AOJu0YzHWVmpv/CwkRRvv5YWG0jtZAV8bxUuYt2FakVOSuLxXOZY4iUn
	gbTHjXy4CxbeflbovoiGGFITcsteCcSQDFCalWa1akXJa7F6j6UJfBUeGvPMqDDGgChrz56B1zy
	ioOY=
X-Google-Smtp-Source: AGHT+IGrPOlat70PyS8YP1whDpBoQOnIpKIndy3flIGhTsB/4cmthTuf/cYgq8JDe1O2kUtMB7s7Vg==
X-Received: by 2002:a17:902:ec8a:b0:1e3:f622:f21a with SMTP id x10-20020a170902ec8a00b001e3f622f21amr5953847plg.24.1714512258791;
        Tue, 30 Apr 2024 14:24:18 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/17] gcr: upgrade 4.2.0 -> 4.2.1
Date: Tue, 30 Apr 2024 14:23:49 -0700
Message-Id: <17b183e5ff70e26108893b379d0da78a7f5f8fbe.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198768

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- gcr-ssh-agent: set 'SSH_AUTH_SOCK'
- gcr-ssh-agent: port avoid deadlock fix
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b98e250d8c04040df1333506b72575d368e6bdc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.2.0.bb => gcr_4.2.1.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.2.0.bb b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.2.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.2.1.bb
index c534e22f0a..26dc1d1bc6 100644
--- a/meta/recipes-gnome/gcr/gcr_4.2.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.2.1.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "e15e31329e0171229d552d25563f176c5b6179795bf91fae2b141f69a9b7c480"
+SRC_URI[archive.sha256sum] = "ed783b5c80373cd058c02ea9e3e2a64e558599ca190a5abd598122e479967de5"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-- 
2.34.1


