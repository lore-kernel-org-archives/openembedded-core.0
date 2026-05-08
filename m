Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2508BCD37B0
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8153.1778224334629781654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FZITgOwf;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1001517f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224333; x=1778829133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwEGFUCnEYSoR6SkU+6QfRp67/oV8LhCGjrbhU5hzhU=;
        b=FZITgOwfA97H0ya/1mIfS5AfU7G8OKWEmtaa4EkVrJ3R65nr8k+h4dH3QxZk2i1cFg
         v6kFNkX+IjWB4Shb8Q3LFvfzwhMBJLdBoja0Ibfi2fiH3eSQfDfx/jt9+5mYTfekY4us
         3k4SwS7cmpFCbEle6RTVDYoliWPRjr4fOJtvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224333; x=1778829133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iwEGFUCnEYSoR6SkU+6QfRp67/oV8LhCGjrbhU5hzhU=;
        b=GTcTKiZuaLwLsxoblP+ZlnE2JgBzbQZXT3wiFEQ8mVS5k12IFkkbAAnKMcnwBYBvt9
         zFbapgr8ra0X6ZC9fwyvski8PB7fA8Z7igcIJl41Q9Uzy68WN8hCe5JWUAv/6oeTW+Ch
         lRMKHiwpgL+qztsxgo6C68EZOSLBV/LgnpsdRz8IvjgXI8h3heSSvysv+810jJCjncuL
         /VY37PTqWC+/t8EQSG+Og9lE86EO6DO0YuIrtPpEDcrtDlZX5zW12d0LDZsrGNRnnU9d
         4coYH8N1S58MGF2xSkvzchLesCt/y/L5ejokNGd0IT5dz6VSTP5wLzXwVJG02kDlF7km
         d+aA==
X-Gm-Message-State: AOJu0YwM3qDa0DLPlzsdqhpfBYGTaOwfpchemJ5y6K/uIaGsH+2GPzzP
	xql3qcOKTgenRuCVJfx3i5j7E+n4JF7zwbjiC+Xqntj6tzEg57P4sU1fBi4VYR4+ew4ffpQg/7r
	w59rIABk=
X-Gm-Gg: Acq92OHekIScGA2Np399A85r9/T1bNwQtONJJPItPo1/eumdXbO+GD6v17gmT9KZxDP
	b4V/nmW6AkzoLSF8lWgSsn2oNYn2M0WnqMlJGG6iZU2mN8/LxcbdlOaZNyUiT5Ylk8H7jpNkwuz
	/8v56nkm6WfO2432O3wggcsjUMz19j08V5bAPLQF2ItNb/ZhmLgK7x/tRusclT2ds93SUNzmwzx
	52IfQvHSB2tznXXa71HMOHOocljoOIOtey5rPPxvkvYytd8T8dTs4FsQ4FGEpKKfijOwE9dTTIH
	kjunnlaBKnOOs1By+1ERpuCDqNfsQW8zzKF8miStYOoh3uXFV11qXW6PVE2Aty3NJtofFs9u+VO
	z59dqsytrNfGTleLeJpNaAUsQzOz8HAwQP3qfVsHvAPQZEWnfaYHG9aCZ62NPqZxTcXph6vQGyy
	JV99Y01apOistKNVbPw05GZIIyovb3sPW+sa9Oe7AbTzBoix9dBYhpBsyL8jMrDvPKouEuyNn5x
	9xXENznORpigKAfnpSgFE7i8c0=
X-Received: by 2002:a05:6000:2387:b0:43d:6e0:9458 with SMTP id ffacd0b85a97d-4515da97835mr17385595f8f.39.1778224332500;
        Fri, 08 May 2026 00:12:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/52] libva: set status for CVE-2023-39929
Date: Fri,  8 May 2026 09:10:58 +0200
Message-ID: <b53adeffb73d0a2164031148a808b934029ae576.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236647

From: Peter Marko <peter.marko@siemens.com>

This CVE is reported as open because NVD has no cpe and cvelistV5 has
unparseable "version": "before version 2.20.0".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bfb379ea1a9cae0ce1c4c387d1803b740d4056ad)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/libva/libva_2.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libva/libva_2.23.0.bb b/meta/recipes-graphics/libva/libva_2.23.0.bb
index 63dc5af8f29..39a80db7f86 100644
--- a/meta/recipes-graphics/libva/libva_2.23.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.23.0.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN}-glx =+ "${PN}-x11"
 FILES:${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
 FILES:${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
 FILES:${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
+
+CVE_STATUS[CVE-2023-39929] = "fixed-version: fixed since 2.20.0"

