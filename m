Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EE5CD4F38
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:20 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.62089.1725485592057666535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0PvXP3vr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d88c5d76eeso20228a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485591; x=1726090391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF1OJeu0fqxU0AppkZDvIk5br+qZPYlzWLmPzzDxj64=;
        b=0PvXP3vrg2pleL/QtfK/Sr6Cj4RWGIXlZJsaSfAqhj5ZMhWg0s2h6QBiSuNcDPH4o4
         QVNQCWsTePLZckMqCqJ5otgjnqrvlUmFw1rc+/oECEi8mdLOtiN+oRQyi1dGh/3UM3IY
         owVKAhn27PNsSrSlooK6HUIc+CnvWOmsP3Dh+XxlqPVkMTyN2/8XwV1pFeFhdDJXztZq
         IeWeUd4OUjUtVUrS88oQDix/ii6ol95T5lswbfILr4s+OFt6i29GTEJOz8huoP24+isF
         0cxnyiLf00trHqUan9ObPCSwOTqb/Qs/1sIuICZfNq2tvXKLUVurEbn/Pi/UqeGLXLD1
         haYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485591; x=1726090391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF1OJeu0fqxU0AppkZDvIk5br+qZPYlzWLmPzzDxj64=;
        b=kU/wR7oZApAD2tc6WbVPvxMrd1dFpJZEOjBPa27qJrWH9g/Rragsawb4UqBagy2MJ7
         AV+jhxjy0aP9l51/m4sw2nB3sUs7rebuDEMCwVN1Joj+DRuEaY0OFyNxmj0yiGqT2JgE
         qEALor2g7fog1W503h3tgyPqOYkxUjOaY7vIk4LSoHo8zSDNoPGHX+2K98LiFDg/GY22
         8Ttn5eVTJPQhm2g0nMxaPHVYx3KM/hVzvY1JXpgMaxFG1FH1jFWlwJxojGxqhD7RFOk5
         wnF2jaTSUFWxPPv/UdLNVvxf3KSgkOyUu3QCJAt/SNM7oiyG099Xi2JAsB0RHRnJjgH9
         V7IQ==
X-Gm-Message-State: AOJu0YyGg1XuUcJcryaVtdtukQpUTFr7bfnVQLflN4Gvo/DjZxYyfteE
	0s6jBTM4h5mrXMTjgXJSbePIxyDe/C+pIxdSmwyA06A3Eo+ls3YGTTIb+bvQjSRfwcSx1H6C1Ql
	Jojs=
X-Google-Smtp-Source: AGHT+IF9L/jJxfO9sAu42Q+PQ7geNPLmRZNSud10EdHUht7PQmWvi/2da/Ao4+Qmk+drG4LC3M2esw==
X-Received: by 2002:a17:90a:6fa1:b0:2cb:4c32:a7e4 with SMTP id 98e67ed59e1d1-2da55950c60mr8999304a91.15.1725485591287;
        Wed, 04 Sep 2024 14:33:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/14] xserver-xorg: fix CVE-2023-5574 status
Date: Wed,  4 Sep 2024 14:32:45 -0700
Message-Id: <9965028d74b3c480f7556d299d616999822b79bf.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204216

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

If XvFB is enabled, the CVE_STATUS for CVE-2023-5574 should be
'unpatched' rather than the empty string. Otherwise SDPX checker
complains:

xserver-xorg-2_21.1.13-r0 do_create_spdx: Unknown CVE status

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ec5dcbdd7c922df25ce90b04902d9c7c749a8c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 22f7d9a8ad..e2754426cf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -176,4 +176,4 @@ python populate_packages:prepend() {
     d.appendVar("RPROVIDES:" + pn, " " + get_abi("video"))
 }
 
-CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', '', 'not-applicable-config: specific to Xvfb', d)}"
+CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
-- 
2.34.1


