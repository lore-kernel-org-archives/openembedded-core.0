Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A90CC54F5C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2702.1785277330226432052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1rN9MWeb;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so3459795e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277328; x=1785882128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GoSksiwtMHerYcP+4wPmoPZOANXvr37gBJhQ+P6izEs=;
        b=1rN9MWebafVnNSxBLqQnsmVbkdqraLrZiX+KFzeSWnrUCCGOG6J/JuWY6F+J4yWWPC
         xIlElEpMNwWs4JplA6jc5G/WiLakkWEoqK81hcBwPZS5CraEFBe4AIrUZjvQIihLt2qk
         /W9YpQWf1DhSx8jk+lwuhSL8lNhHSCi1+wC6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277328; x=1785882128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GoSksiwtMHerYcP+4wPmoPZOANXvr37gBJhQ+P6izEs=;
        b=O/eiLcn8AwF8VCXo6H2f6oAVf4sgY5YtV5Hgc9GtsNk1Qhw5nlPMKAq74uGHufM18+
         6PWQ87zCIExMnlaqq8XsnoFhd7hdzNoJJ/hNWKO8l+789o3jhSmpJ9dciJITFlbdt2B8
         WTKY9vGqcNdYyHNT9hwz6CJNrje7xNUNEHTBv+XEFQDOaS5tAy/T25sUUeIzPSGjcuc5
         ZQRL7xOl7CauJumTe/TH7dtIydCCfdy+6G2bJDtUx1C1zTwJW7az04XxF8GupHvly9MO
         x/eB28OtbcaVFsjG96YGJNihMd5iDgiP3PDG0MJwJ6DVY1NWFD0x++IF1KB+NEzLFKiS
         GwPw==
X-Gm-Message-State: AOJu0YxUByrgRDOCS6R5q0grVkS/9yrUxEI8p/Wij1Xug3OHKc/GJWlg
	JnhePXMwXCTH+Dh8iV8fg09yTNIz86j/+gZLRUTEXctQI/t0XIBuAZzzdLsNz/Fu0lEYfDteGxJ
	y6aAkKaE=
X-Gm-Gg: AR+sD13i/igHZGUqWHDkM/HGyys7UmT9AtV86/q8cQeaXIqGRoNQYYpA05ANK0SyfBF
	fP29ChWYMoJVF4ftNWxLFSRr91FsVTSxzPy+TfyXdpYPzrJAXErZnrGg0pImJHQMqrf7Z88hii9
	t6DSTN0voAsoy9RIlfJobCxlPycn8ewaYh45YP1PwT0RMVLcNNi+w91aXdn1RheMsE06peraG7b
	iGnk1E6RiSTyYj2SJFdF/goMP+SStFhwauZ5VKmSmG8eIuXwx8SAA2jnnp6Q8cf2FvGnqS2cGiP
	VlyfuEC/KQWXQxTZWIwXWqjNaWrK9O7p9H3L9ma65XzHiUie7M3ZX3Xlu3AQtJV1uAW8E1mwYLm
	V7N+o7NeIx+5qLhpTvZqFhglNygzo1In5Rhmnfzl9rQ54673JeMxJmKkI4nKFhbgu3QAN9EJC4D
	kQrJGovSln6sHpQH8HJD3ccFAGEN69nK0zB/JXMGwr+LClsC/lvOHk0hIkUCNe8gFbVrZJ2lAzZ
	ZZ/3yVIiRDbnI83/uFuyTxeH/k+v4vRSzGVWaZP62V3YZq4+RsOf08o1yI1rBuZCdVc0jwqPZg=
X-Received: by 2002:a05:600c:5488:b0:496:c967:5f9c with SMTP id 5b1f17b1804b1-496c9675fa4mr30745405e9.33.1785277328510;
        Tue, 28 Jul 2026 15:22:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/19] python3-ply: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 00:21:43 +0200
Message-ID: <069cda2549b0dd841914c5b860f138f6db8b3977.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242211

From: mark.yang <mark.yang@lge.com>

NVD registers ply as dabeaz:ply, so the default python:ply vendor
prefix never matches and no CVEs are reported. Use the exact
vendor:product pair.

CVE-2025-56005 will then show as unpatched; no fixed release exists.

Suggested-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb80fef9a76649fb1144408fbc7e2903439cd556)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index a05bd6702dc..0855c871cf6 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -15,4 +15,6 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "dabeaz:ply"
+
 BBCLASSEXTEND = "native nativesdk"

