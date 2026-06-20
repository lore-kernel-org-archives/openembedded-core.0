Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A17DCDB478
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6015.1781960428733099455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1/+EDC8m;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2260451f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960427; x=1782565227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbQlGupCgALxJTcilzTeca5bnMl17e1hku8zOAKlCrU=;
        b=1/+EDC8mL3TTPbQpkVRPVnTSMLtDKqkjoOlXgmQx1F1Fu9/EmWNl7cSMyyVsY1wDX/
         Z8JKFLUAqctC0ubMEzDrjHkAZhxF2SI1joswzF7ziyjhm0eIccXRB02KIkQ1YXkz60oD
         j91UUEhNE/dh7hkhGdAbjo9Ht5XBeGZNkyYBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960427; x=1782565227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbQlGupCgALxJTcilzTeca5bnMl17e1hku8zOAKlCrU=;
        b=tHjlG4+l9DuVyyZXOixb9ElXqw9kgOc3zueV+BUjMnZtrIOxSNAjviVfPHxAk99Mep
         fs4j3snPU5PhukxKh1xBMosuXGYBoNWixkdwAjgI0SMRNdMbcKo3Q9YgM/R4c3W0Omcp
         KmjgWtD+nJ0ex8dn0tr4WUzPW/Oj7lp/D/0ZM/gjTT3bBSbNrZy/1dAuWqY4thKJ2mWM
         ltTe+Ruv1hpMgQFFO4mMCNYk3tnCnBCU+vzXhbBcQnaWXNrfxHavm1BN+o2UEzrlPnDB
         Byy7WcimPF1DwrbjuNI6qa4kFe/z7CR5Ml+jNX8DqMtx1VOduUl94H80ab6xvxc4efuN
         hyjQ==
X-Gm-Message-State: AOJu0YxiaQfv4x0KtPuDy2XNA1rrR/0VRvTcWRd3u9latr1Cs223LkAi
	2EDk9GFnNg9ICD3I4FsvDJhP5BeZZBypuHkXcHE12a4mCzpgAqyjmWtohibOAgvhn4oKB6xZcKa
	1R9W/
X-Gm-Gg: AfdE7cnc1tkbYUmxZZjOXyR9tAOFZJfwKwZI7EbuYp8bjJhXkMOwT0HzqB6GeL5zLbh
	RzSBDq4U8oex/7Frp6jy7BeMn4DVH6TWrBjCu5U6RPSKLMRz3NhdY95t4f9eKSre6NRmGVk0akd
	ZCAmVTnH4V5Uwc5YC4nOIGUggTjk6YYjQOEpVSstW3UM2uQHtvL4kf0lMoq3ymNmOqQyjuZcydp
	Nvgo/d25rE7QVT7/sGhj+7+ljwnWN7LYbDhHD+phKmp+WQvDzijRQU7G6qXwJ0oPdEhE0aGlYoP
	EzRdCzgksnHgWpGoWAo9bTg4MKYPVDsyHN8m2JlfP/Dd8LJ3fiYuruiBsUEAgmgiqHZZukVvG+C
	ZE3/0VGVDoA26/x0+k14KYdvhczGTKQ6rLnHvy9n3XyytnZvKTB3l32gYq6yvguW6Zy91sDRmEZ
	X62Bz3AonsS7pPXeUeDxE9QLQoEjmQJcMn5vtzNa2i7LEdVjbQpjfLmd+2jhUlzYMeqfaTSI8ME
	aWZe5A+xVax00Qz
X-Received: by 2002:a05:6000:4712:b0:462:d86:cd8b with SMTP id ffacd0b85a97d-4651dd1d7eemr10196035f8f.18.1781960426972;
        Sat, 20 Jun 2026 06:00:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/36] sqlite3: Use SPDX identifier
Date: Sat, 20 Jun 2026 14:59:42 +0200
Message-ID: <d560c3a0cfda6f6abc498054905099ac1fdc9688.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239237

From: Joshua Watt <JPEWhacker@gmail.com>

SPDX has a license identifier for the sqlite license ("blessing"), so
use it instead of marking it as Public Domain

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e771cbb6b9b0f0d5539dbcf3f5c92946ff065d81)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index ea583e4a427..0a8727e4f2c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-LICENSE = "PD"
+LICENSE = "blessing"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2026/sqlite-autoconf-${SQLITE_PV}.tar.gz"

