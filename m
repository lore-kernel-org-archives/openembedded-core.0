Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19223EF4EAC
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49603.1775456854939050964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=My6OaRyg;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so36702745e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456853; x=1776061653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=My6OaRygffvbwJ2dORZYrFisnOVm/FxPr4/6FgklHWas81bG4ZqZwQ0Rytmlh6UWar
         mS/KKx9PzHvphipb8n6DrK8NXhGKNf+t6t1CShKS8nviv/3j1N9NMm1vpsVqL8eWafQl
         8DSGSuAcqmEiRl/fJ7SA/kGEX7cbPOA9wI3Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456853; x=1776061653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=ma2Me1jx7Zd2Db2BGcYS2kBk1cxPmRU0XWtgb4RuYGmOymX0OHFUcRv2JxuIHfBgNb
         PpThc1prNXW07oS+/lG0Xi/CU557FRHb2Ken3+mmqaAR70qbQqb79p7MCJQ/40P1lHN6
         7LS5A5JzeuQwRzJZlBxCNZ38Ioy4GSCyvh26ou9z12JbKSdqXAIKwyH/+PFhZHAmCVVG
         A3azQzLpsva4WpUlXMUHF2jkinngnaBxy12AumNH9J7liidwOvNUIkNa2Oz+1vdi18jr
         RksmG4qRLavVIGLbgUN10d0cb4bqI8v+RQbMn3/IQcN+0kl6geNF57Lulo85SVS5U/pJ
         0z9Q==
X-Gm-Message-State: AOJu0YwHL153tqbIs7Eiwurs58Li1hBkIZOb2bjRkpFwXXrUG+GwBwAt
	AY1C6dUP3dT0wPlfyJ+1gmBavzboDE5Da5qdNwKr+bWC5TFUvjNNjc5Cvi30jYNJmiAhsQ0NAAX
	sd77xzn4=
X-Gm-Gg: AeBDiev6PVFDEku5WF5DfHR7FkSVsjT5SE2kvkazKvUTQnI69+9QzZsoZq/GxzX7nl7
	2RB+ZzpEa6zX0EnvtmvOGGdEX9RhfgE1Z4kD9UckcWnagiHi4k3mz+axKQ+85mliVsp29dsR6J2
	P9F6RvAX/nLa9sAduDLenZOed7USiXhwu+62gEZcZUlv6sctz3deV171E4zlO/tIUZIQcngjzZJ
	gnYNlL/sr8mcP2SHUuP5SaGQLEL8FuByr0UC6eagJF9V4g4dLxEORLpD7JJnh3SZ79k1R7etbsv
	s+qrdhJre5QstnI8eoD21Xn+rYjJTnWIaXx7GrX9IG99x/cSfb8c97mF5ITsyzyV+JEJwt7vHDq
	KqEi6zVgQKLYIuAT38O7fw3fHPmPzoEpgKT3GS4mWc8zhjtsci8FIlUI3mB6ECC/wgiPywivjR4
	ENGf7oecQe3+gNfRYQY3CZQqemhBdnnIJnKrnC22f53A9ujZyM26bNKp8WQArEi+Ys6pqQ+s//V
	zbx1LCY1dS57f7DPL0vWQSpvwY=
X-Received: by 2002:a05:600c:5292:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-488997a51b2mr180277875e9.22.1775456852999;
        Sun, 05 Apr 2026 23:27:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/18] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Mon,  6 Apr 2026 08:26:35 +0200
Message-ID: <d40198e70a3b548e5dc7b95dee4fd4b9cb0358bb.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234652

From: Vijay Anusuri <vanusuri@mvista.com>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index bb81d77ccc5..1c08d4b1023 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

