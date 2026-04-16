Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E19AF8E491
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28588.1776378810044871090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N2wGR/m2;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso431675e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378808; x=1776983608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDKd2bbbfFIyySKfofCK/Fc2GManWznOSa76B3168KU=;
        b=N2wGR/m24WcMRWEp0jxM42VXwzOGI5gigfX7/ojtp6hiuFz6+8z/98qH9p+VdS+xtq
         12dT6IAzbnhubZTHZM/kYMxLdKSHmtei9e1QIbJ0b/euERAkUUqCDIFCBjNiDQXsyE59
         eGmJRpAKuZ+Y0aFlo7xh0xK1QvAy5fHrFCJwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378808; x=1776983608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDKd2bbbfFIyySKfofCK/Fc2GManWznOSa76B3168KU=;
        b=MLNbt0RaToRgoKElwqE/UJcfj2VTKSYwLLE1Hwhx9/bvfFqbtthQZ8AU+vEsXVHMIb
         +ZJtD0XKykWSoWHdTLA91n4HmThTLuS62yitnZO1ocGUop2vrO64GJ/Ej2yg3UqzxUgy
         RPPJd6oVCZjgVACuFKrrh72lvVsxMyAxG02M7hAJWFXQL9Dyln8V+yKNOAM9MWZqWmO2
         d5yd4su8UhuXK0BHgtHmfX/VfFmy6kOrrI56gJ+JJEBiHtyX9QN1vxKMCjeZxO1WxI9U
         HjwY7NADMj0NUEziOaO5ezwa19jVFRyrkGNeRUN75iITe6eUHJlVjHT+QMA8Mwl8CKnG
         ljbA==
X-Gm-Message-State: AOJu0Yw3F39AI6uTdd1JG3rWidX22RrnQwbYkIUBp/frA8DCEpWkvfOG
	AgRe38CuXUh91QfQ3E8f9uc8xaMZIi4VRnqLgtoyJ/LoQqTGP8H1b62/fX6/0hNZ/rpDVS09VB3
	1fENUe9PIj9qU
X-Gm-Gg: AeBDievt7wff1IUVHnV16rLFoKEY/lgHqarf7UhWVKdEWwe4i9FI8WYqGduf9hmzXbL
	y3B/YVLvJB0Aokq87qYcPPP8iSIJf5VrLiHQ0UTrPiJqaPToSbBjFuS+NZrt3NwGHVAbgDWxOGU
	Y8SzLCphRE4F2FFgqZufKcUJ4hpFdWIwWGsQfM8osZgzhhCsSlBHz1nlY8O41G4PafuSIP7C4QZ
	zALyKR5qgZ/XCerLtkBpVok0/53gxoZDk3AYKz2bd/xWl2YGA3mFWdx7NcR3VNTgud1Gih7jNPi
	zSpF/LIFPTbkqTFd9mauIxAOutG2CCTZlY89G9qm6RFCn3H+GnSf8L5cQ7wNuZ2RqTrMom2vwNi
	WRk9cUiSBXzVTkxIKTi9RnjZVQ502UeuIbo6C5eEe3+he0ZbKTJcKk96VWVER8LLpNu5tkg78M7
	lWqoesPRNKVA997QBAO0/5L+ClkzGKno5GlBwvcHVDdCp9CZRLTVq/jBKue1fQBqwy8/FaRnLyr
	NVwr1XX5h9WI+OLJQmwiiHgAwjnKoGQ4iXbxzDxsGNE0Qrc
X-Received: by 2002:a05:600d:8449:b0:488:869c:edaa with SMTP id 5b1f17b1804b1-488fb74e103mr4294745e9.7.1776378807979;
        Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 45/51] meta/files/layers.example.json: switch to https clone URIs
Date: Fri, 17 Apr 2026 00:30:28 +0200
Message-ID: <70cb257f3f81da851157b209731fada79cd476e2.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235474

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/layers.example.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index f3b65220831..8ea1f225e8f 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -20,7 +20,7 @@
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
                 "remotes": {
                     "origin": {
-                        "uri": "git://git.yoctoproject.org/meta-intel"
+                        "uri": "https://git.yoctoproject.org/meta-intel"
                     }
                 },
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
@@ -32,7 +32,7 @@
                 "describe": "4.1_M1-374-g9dda719b2a",
                 "remotes": {
                     "origin": {
-                        "uri": "git://git.yoctoproject.org/poky"
+                        "uri": "https://git.yoctoproject.org/poky"
                     },
                     "poky-contrib": {
                         "uri": "ssh://git@push.yoctoproject.org/poky-contrib"

