Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE2FC64EC7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.19511.1676150683607870020
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KE8Osa0K;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id a23so5906656pga.13
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvZ9JYTquZNBdcndhod1/lw4reSFnDYFeYJd7NWzXto=;
        b=KE8Osa0KSpJxAlW5n46qLGxTS+RpreIA5zOYPezrlIJ5E0zj55zbhdzkgMLQVtU3/E
         pp1MnxovYWndcXT21eF6gERnWDyvbmZi+OuBI6IfVS5fHeCU0kU5xjedd7FHB0xBr9m2
         E8b1NNN1vLxQi9XAFcqMjhhskO45D+cBBhenBHqlnstPIfGqQD/POFTJ+kOOHzQ8D7nx
         GDemgxZMpc3YLM5DbzIcyxEx4OLd3DgUkO7sHr38dbq26UPH864XyyJhfgO2ppsTDcNu
         dHS0RaStGRMvbqfh/NVtsIR0VR1ucKNVKi9kRPsmb2itjnJoPt/j86xPbgBFYBjMusCZ
         haVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvZ9JYTquZNBdcndhod1/lw4reSFnDYFeYJd7NWzXto=;
        b=hPWTk41U1XJeDQRnqH88SiIslAEpEKOH52gHNuL26uz/duE5SRo0ZRl/WOdhoIYJ1E
         aqHdfvPm4Y2q1CmhYQcGCsSOu2br8yTkGkxvvuYSAiNzKzv+6PL8yYjni4GrV5nXHVL6
         hwsFSUdyUgpOZGR6DII0h3faaYpLbqYt0sbpcyNOsIYvurfTI1aqlklG3QtBtq8OFF+c
         NFuKnnzsFtaRgOZXgSqsxgUg1UtNrveW95NvhQMdgLDbvzWViwiqNiV5PZoM8gK2dp/X
         Lsn/HkIEwl3SWv7AaiaViVRzuwHHfa/vEdSeRIsp0qJ26u+Vs9zmwoa56EmZ8Z1RfrU0
         +bBg==
X-Gm-Message-State: AO0yUKXSw88b14yzd07sqHQXYmT6sRDCK9/m7k3lG4O3wcp60fBr9thL
	TsgVagsKHDTN5O5bJ6kEBXqusrBM0eyin26yPOo=
X-Google-Smtp-Source: AK7set/Pzb7i9EHCobvtfQtKC4+xeP0ue6xK1D5o8itPrAmK+UrIx/DPsdjPXNvUWKJsAdqQK/ICuQ==
X-Received: by 2002:a62:1e86:0:b0:593:b13a:c4f5 with SMTP id e128-20020a621e86000000b00593b13ac4f5mr16708726pfe.29.1676150682639;
        Sat, 11 Feb 2023 13:24:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/28] recipe_sanity: fix old override syntax
Date: Sat, 11 Feb 2023 11:23:49 -1000
Message-Id: <6779319cfae0ea75cba3419f0aedf94838ccf80f.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177036

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18eeea6fcd8ade49390a978134f51646da2f7764)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/recipe_sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 1c2e24c6a1..a5cc4315fb 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -16,7 +16,7 @@ def bad_runtime_vars(cfgdata, d):
     for var in d.getVar("__recipe_sanity_badruntimevars").split():
         val = d.getVar(var, False)
         if val and val != cfgdata.get(var):
-            __note("%s should be %s_${PN}" % (var, var), d)
+            __note("%s should be %s:${PN}" % (var, var), d)
 
 __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = ""
-- 
2.34.1


