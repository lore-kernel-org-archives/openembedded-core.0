Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE1DF88078
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7736.1776322130346096756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JhWtOdD2;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5430930f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322128; x=1776926928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDKd2bbbfFIyySKfofCK/Fc2GManWznOSa76B3168KU=;
        b=JhWtOdD2G91oYdbn0g0TOosqPkQB4o7bC6M1FFlIYe8gwTRWe4d8AxpVkXhRrCQhF6
         EvEIj9ouHosFS2RF6MvAMm+QQTe6GwOiD39hHfyUNGLei62szNAENghsM0DB3Wnst77t
         NkP/l/9hbq+KUJqjSFxzUmoNwgNlvYXlBColc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322128; x=1776926928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDKd2bbbfFIyySKfofCK/Fc2GManWznOSa76B3168KU=;
        b=kSUmQLqCXf7yQ8LUcaMcWH34BZOFckbtFcZpDo6wAZjHlmyCt3wh1DDVL9vQ/z9+2d
         jnUrRUElquVJj1KwHu2i+LiTlZqYBKElGnbyH04vi4cY9+pbxjbcTa4N1SrztTiNFmVN
         UYtv8dglSkJ6Rm+XLpV6FwS6OZ1A15+VXDCFav82d7rVfwjw7ESzgXZH4caf9Dccs8JY
         R/FnRgTrXhwcF4NyvXYPBlBGmYZVlggSxwIiptQcOtYIX5KK72MjiaiS9NUBvIJe4tZ4
         q0TyjBhteJ+PKJHzLU9Ko4MxIyx2qY0UYeDjDVLazxge09KkpAAI/Ptx4eU0hsQ7p45t
         h8/Q==
X-Gm-Message-State: AOJu0YzoohH0Qw9cgd1aZ+HYkm0zdn7KxF+H8Zs9S3FUDNiJ11mFWAkU
	TR3J6KMTQPYYDeMnvMx/cT6X2+HJDwpXfCEmWRSCvDJfIXmSyy3mthhtFxc3ERNeFSrF6AjuoTO
	ckAGKxjNEO0e8
X-Gm-Gg: AeBDieuRwk8dAwvnyhAqH7XkRECslNThXLcXGhC8RYJwbde3Ptp+82nt/bu8FlCMF8B
	6jDjafKr9IRVgwx4kqBQShqBzfT5kA/zu8srhu8YdoYdY1SOCoH2Wh91C5azPyOS2JmP7Mp7FEL
	T1iObv/hndZyImhLx9o6F2/kgClGG0CUMuQRaIb6lGoCAEVBXselr7bNvpBzbdUvW7WieAH6HWP
	9SqWZ/Mh/Fht/xPvD6SNifbvKpPlFMh4vRt8GfSXvl17K3CtL2dkLlOTf8kaOMJFOpltc6WONKH
	ExbQpwNkPJgZe/2Oz10fFgN+UtdF5RHn7wMKhtDHzplnG8MLBBLQsttcl1MxacZnSS842RX99jJ
	6qM68CoO71PLrRt9yhGwkY8fqrTmTHMLUQhLMcXhiaJs0PTjE9ocbyZ9Y0RgsW/Gi6ecNuYlHak
	AKS6BCE1Sc+cfoZsAmi9/c+90n5BcKFv9hxpnLtMbrMDV/USJl/H+IlynCKIXJg86ZDdRT2SSOf
	M15MCQd4ypao5+i+Q3g0Vyf4uVEY4Nr3hpWbA==
X-Received: by 2002:a5d:6a90:0:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-43d6fb801bamr18622809f8f.36.1776322128357;
        Wed, 15 Apr 2026 23:48:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 45/47] meta/files/layers.example.json: switch to https clone URIs
Date: Thu, 16 Apr 2026 08:47:46 +0200
Message-ID: <70cb257f3f81da851157b209731fada79cd476e2.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235387

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

