Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CDDC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:47:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.21702.1673437655690531734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qacr9bv1;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so14165426wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o2DSw/BAJJ6kGXbT7oXmLeEzfT6i+z1y/kVdskPZwI=;
        b=Qacr9bv1gIUiS+oMfW9KQ+OCg18euSWkSzZwpZyrPgfAhb8P5cHdN9odK2E3sZJgID
         CzWo33+VODNyY/qz6lZLrkqqkWUdODli7WPo0sAkToaoLCjT5KCEfdeJCmCjo33PfFBl
         UfRI/Bp8sb9Yw4fznEty5MExpNYndiTZJM311uwBiMlE2oY5C4gL6GNdHA9f+aqjj8gW
         Ej4gFdSTIbS+VdilQDD1ITJIr3lEsDHXULVLyDC71MOGNO/WWYeMBVyF92PNlWvkIIDG
         Zx4764zuLesttNxtaSLzVS1WtGJCxUq7pDr6X21b7czd1ts2TS+6tEXwKXuIaQMbvwAL
         BHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o2DSw/BAJJ6kGXbT7oXmLeEzfT6i+z1y/kVdskPZwI=;
        b=5mqrpimtuSORoWvO6xrFKjU/lmC1Q60GVMqxOSI64/TLsQf0A2wz7nFS8puH0V+1Ug
         8wG7MpAjosqum/IZBh884LrjXEnx/lS/m4SSU1y/nksjxjNoCfM+GIjybOC2QJh8eSzr
         D4ANvmnk4O3ihxVM8GKJfWZdSxI0ZJ95LI6tlDxhaj9rcOEK0c3gXAQ8JCs5QZOByrBK
         1lGwaHXG3XdIo0LiRB+fTFEqHstP8YmdJYnxXydTxdu47Q0K+VLgmavak5ffX6Ww8hxP
         GrGtk3oC64xB2+RKsgfap4YR12AymcF0yV2e3px2z2GlwvGClou+qq3WcPo/VyaXh71a
         VZ4Q==
X-Gm-Message-State: AFqh2kqChZhbFDS5jbwyL8YPG+/kKpEvjPloHgQPr00qJARdIZw4LZU0
	BRQfNe2p8v4G8g/rLjHtR0Xa8bbBxuw=
X-Google-Smtp-Source: AMrXdXt7xgaC05ohjtbAJ344w34JMY8vuJ/kvKT9m/ORuRbqPCGSEzJvqdlfquydEGzReCeVOo5Qxw==
X-Received: by 2002:a05:600c:18a3:b0:3d1:fcac:3c95 with SMTP id x35-20020a05600c18a300b003d1fcac3c95mr52648773wmp.34.1673437653622;
        Wed, 11 Jan 2023 03:47:33 -0800 (PST)
Received: from localhost ([2a01:4b00:d307:1000:f1d3:eb5e:11f4:a7d9])
        by smtp.gmail.com with ESMTPSA id l36-20020a05600c1d2400b003d9fb59c16fsm5267342wms.11.2023.01.11.03.47.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:47:33 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] systemd: refresh patch to remove fuzz introduced by rebase on v252
Date: Wed, 11 Jan 2023 11:47:28 +0000
Message-Id: <20230111114729.395529-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110222227.314983-1-luca.boccassi@gmail.com>
References: <20230110222227.314983-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175735

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 ...binfmt-Don-t-install-dependency-links-at-install-tim.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index a19a025559..2a033b134e 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -29,7 +29,7 @@ diff --git a/units/meson.build b/units/meson.build
 index a9bf28f6d9..11d3644168 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -63,8 +63,7 @@ units = [
+@@ -62,8 +62,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
@@ -64,7 +64,7 @@ diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
 index 96f595ad72..7c010bb224 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
+@@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
-- 
2.34.1


