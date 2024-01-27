Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EA8C48286
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:37:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8357.1706323065143411273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jGkg10+k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d89518d3b1so6427575ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323064; x=1706927864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z36RdMV1Ie+lNiIpBREqvs69DZLBf0ohXvQzUBwJ0nw=;
        b=jGkg10+klj96763RdjIKMSLlUvm4ZVSKcAfwEnuh74xgaBl5yQKZyFhA5sbXq5qmUu
         pB7J5C9Sar6sf7Uk7IpSlIJ4+P2pBDtA14ZIaFaDpss1Z0RFeFn0H88siP8QbNVVd0Ke
         NXrcwbCQY0Pggw69MHXYlVPaFNndSdYohMT3KDmu7fJBJwqKAuDfgg5pYHUNl6JQZr7V
         n7VPOTtY7FZjA04sMDQ5cAvTTFDdc+tszSjslTSpsZDAsXJ7+R/PliwYKyO5huPej8gs
         myRWLobcicNrz5+QsjQxdrIH3hg/O0FAAFxNzKvoJNREgZZ1fkrpJuD0sPRUKZz52msc
         lGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323064; x=1706927864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z36RdMV1Ie+lNiIpBREqvs69DZLBf0ohXvQzUBwJ0nw=;
        b=TSMkDL8JVY84I/f/7N7PrAeSQejL8ve/1YZ5a/PNEMRrQryntQ6DYPcjnqDezFxLHZ
         oQf8C75JZ8IMGHXVFJgzdlFn8+i087nTQc/Mahtvkil/RSHzSSV97uWKFkZ+R0crYTn7
         R5DjgcfFCfu9b1mKopNyJ+puD+aNY56haGptPDUAPww3tmNYcRJpQFkmBoiTKNqYALHs
         CXMulXue76VTwM67jdx1o8NtF7eoPYWCgagXIRbDxJlYyjYA5xqgH+8K5qVliakDQMq9
         nYhsPSJ2R5MsKtNTPDL2cp9B8/wUnzD/Hn82ZdbGfFujje/0LN3MDNfptoveiz8ptnKm
         sXNQ==
X-Gm-Message-State: AOJu0Ywp/trQLakHGGLg3QmaHl7/MO5TZtaHuTHtR59vFPW52vsX29mO
	ipYF69oa0RH+GOo1vZv4Jijp48Ql99wuXodHrDn6e6yOKe+DsVyr6dhiU/9n31BB2qdSFsRenJT
	6/ZKRXg==
X-Google-Smtp-Source: AGHT+IEhEStWuF1Y8YUwTXtYRA74oWGA3GAWl8BJwM0JaF15BTCLuuQCWBRV2vHmijoWnmKkJlv5Yw==
X-Received: by 2002:a17:903:2343:b0:1d7:787:19ad with SMTP id c3-20020a170903234300b001d7078719admr2155510plh.3.1706323063798;
        Fri, 26 Jan 2024 18:37:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:37:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/23] libadwaita: update 1.4.0 -> 1.4.2
Date: Fri, 26 Jan 2024 16:37:11 -1000
Message-Id: <45e035fd044491fbd88aedf6b99ae6eddf1611f5.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194412

From: Markus Volk <f_l_k@t-online.de>

=============
Version 1.4.2
=============

- Really fix build with libappstream 1.0

=============
Version 1.4.1
=============

- Fix build with MSVC
- Fix build with libappstream 1.0
- AdwCarousel
  - Fix carousel scroll behavior with page reordering
- AdwComboRow
  - Fix focus when opening the popover
  - Set the correct state on the selected checkmark
- AdwNavigationView
  - Fix a warning message
- AdwTabOverview
  - Allow child focus on out animations
- AdwTabView
  - Keep view alive during ::page-detached
  - Fix crashes when using :pages
- Docs
  - Fix erroneous <child> use in breakpoints migration guide
- Translation updates
  - Russian
  - Serbian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7c02a1169197fd5452d5b323dd523f6712245cb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.0.bb => libadwaita_1.4.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
index d8aa2cd697..64b7473b0a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "e51a098a54d43568218fc48fcf52e80e36f469b3ce912d8ce9c308a37e9f47c2"
+SRC_URI[archive.sha256sum] = "33fa16754e7370c841767298b3ff5f23003ee1d2515cc2ff255e65ef3d4e8713"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.34.1


