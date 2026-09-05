Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C695C79FA4
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2581.1788641116659219036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wEOjMgOP;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2712072f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641115; x=1789245915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peBnaLETSgZdTDgcIoWdCy2eygQD2Kqw8OZuv73D87M=;
        b=wEOjMgOP8e8fz+WlMiEiWmObMNK3SRXMAo4ZNT5JEpny+AarSi7Bc4HmE0lnn/92UK
         12HhFpzUPLa93ZX1fm6WnlrUY3Fm//QTjwRUQtF7eH6d0jQTOCmlfeCoO+gW7dwHhAw+
         MHrGRXkkF04rK+2/F39ssIABpzXYKf76Ew2gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641115; x=1789245915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=peBnaLETSgZdTDgcIoWdCy2eygQD2Kqw8OZuv73D87M=;
        b=sjF5nZ37jobAYxa0PlBLpKouCSB2IqEpfYOFc6DmYavXazmJDFdbL6ZAArGUhtm21c
         liL67Bn3Hf5zG+PxbLtGlXNuzDvqgDQPxVHYEBiQ5bR7a/GO4v8/UM7b+XlVd3ox8Y50
         mYu2y5qhDFo0sjaNBcdAvgEklC+l94bqYv2UGd5WngY2F1NQ9ff4BGwpYZOoxD6Bt1MV
         ycNnILxIyx62HhaUWrsg+kUdrMLYkUcZxPuYAnacV7NhzRVfEsHiiY5vJoXl6Q+2G7nK
         ZeGwE4xBYU3iOk5Mw2CzVS+mgaKoEDaBKXFyK/pYcrhZVmOq9DYxNynUqeodlZRHYjpY
         riEA==
X-Gm-Message-State: AFuF++kYYEuJErbERQWNd/K808QoiQK9rCNYl1o3iMb45mURt9o+1coQ
	bzDE/xSlN7qXjFyHFlR2mFNVtwqlIyM6AJ94FxuibRXVNtq3uMGa4u5mZZC0LAPV19m1rxTQqdz
	avatlytQ=
X-Gm-Gg: AYBFou3A5D2/ULzl/5VSvDgBeio1HPGzh/gHOk0zu/HCoKuHOuqgz4bYMjHoCewEa30
	1aVdz0Mrz01WcgclLmWQyG3CRDGMQItcN8Ni1F4hMK8YWSKKJGMLEkUs3kYNHl4fFNttKo91zA1
	RayF0vV0T5fAy52rVguGa1HFZAN+waXNSZyEycHDCX/bZTuz/PqDU7RhygowD+A0WhrUbpE9nxS
	SsNnbkEqJwT+ze3ftkSE6Pdourxp8NqWo0Sq4FMb6qIDFxiCQvomRWgtkUr8/JTuElzo5qasatp
	iR2d9LJ8+3qOnvtzuAYTAAWDOW5vPg82naP/9r1tkiVEAZpogzwtdZYn52gm1w7QVjqm42CyWZz
	XuvIZ+xUoh9HLgXoqOedZj7nWXDjzMhqHFr3x+Fi1LUCcGFyFdE8G2DEUPFTDRtV5rwpVXIUwU1
	zkmmX9hPacVL73kd8MzefZUwTBjkgQGgPej1oIDfRrSKtwdaWj28UsA8Flq/dVwdDpFSDSIhVqp
	V7atRa+xmaHaDlpa+sxpGHJyEEu/UL0BrWDePAYvlWiQjT86Im87Ody99y5mVoo7g==
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr2675856f8f.16.1788641114941;
        Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/40] python3-pycryptodome: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:09 +0200
Message-ID: <0101640bbeb3a093a5b62c230d06752d85836959.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245160

From: Tim Orling <tim.orling@konsulko.com>

With this change, 2 Patched CVEs are properly reported:
* CVE-2018-15560
* CVE-2023-52323

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8a88010edc6edbb168cbc31aa5df847a328661c)
The current pypi default "python:pycryptodome" is deprecated and does
not match current NVD configuration criteria. Use
"pycryptodome:pycryptodome", the active NVD dictionary CPE and
configuration identity for the packaged source, so two patched CVE
records are reported.
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
index 2528162ff8a..1b2a5edd38c 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
@@ -3,3 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
 
+CVE_PRODUCT = "pycryptodome:pycryptodome"

