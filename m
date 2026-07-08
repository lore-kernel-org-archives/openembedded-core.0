Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFC1C44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6515.1783510829992405527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZMKTyYtW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4068865e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510828; x=1784115628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j4deg2OqNuNt7pY4ZSnkdnNvvZpqhxCcdEL8QZVrwo8=;
        b=ZMKTyYtWV63t9tyoOKWOCf+mavGLqZkxxNfBWRrT035ljiH2nKYwfo5B3J2PINYV7A
         t8ZWkWeq0/6Zt40wnT2MF1wudnIaSoHm9d3SQeXD3Q2iJriT2rX9Zg5EW/+c5pzNjgpQ
         7D7CrkQKk6dsaBzrWYgrWtxa7GvmlyGYJbcEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510828; x=1784115628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j4deg2OqNuNt7pY4ZSnkdnNvvZpqhxCcdEL8QZVrwo8=;
        b=o7Gvqpc9OCahg+1hHXUv4Ymmoajpy/3oG3Z1qf2pnXIq6NaoWSBXSn0/zrCODyuq+L
         DIwOdazK+yoWBdwOF4W500a2lbyRPJdscduVJhHqc7zaCC+i2Q82g8+WJaOkVe6YoUHq
         rWTw/+IrnUGMvo0zIBjb+bqdqMQefIMTZYblQQXjkRmhkhOvaIZLWBCqjXJFf/Ib0VRd
         hROO9acMie9DZ6bLDe0Yui17yglSGDfX8KLvNOrsoRiKdDATwpG3yRrxrZ06JpwpWVLu
         Zk26AmLwSnWwsLWOiLFA8K1aUooMY4pvqwBBVsINJArpe4jNGIlDgUo8WmTPBPl0naNE
         Nj5w==
X-Gm-Message-State: AOJu0YzHdCHDNB23gEDpfiCa26L/Ob7S9mpVwWmuYIFgj/TepDZNMRWl
	0y5iZ79OfNkqLfQOUFJZZrldGOQzH5ITzRQ1tHBmIJJ6mqoRuL+56e4VZLZLF0Ot7qArAYEa5Si
	32U/fh5I=
X-Gm-Gg: AfdE7cluBnxr/JS3GSYmQ7oVvFngmFQ19Yxdvq4BL6P60zHGrfhNBv5h4G3fxABl1FF
	g2JY3oww/YoQATmI5jndOGYpe/5/do5UK+gVnm/X8w7R3q6do0BgYb1THoQnq4YJP78Ni1AtRmA
	uV1v6QuVCY/tO+hB0gj+LAu+PULn4//1xuZIjbgWiqtxieL8nCQCUWYGsZcYRCJVYQC+YjO/xs2
	cjU9N4Mqs1GWjYMhy8CRFSYY9njcHxh22uTzI4/XWQyYrat+L22DFbsczUtI7Re6kROkEnaqApv
	jVRLisK/oKKb86IsBggDoOChj733O7FZsTM3JbmU2Xhgqkh1XShMr6bmP7dR8fCs2VExmrqGsG4
	WE2OS/xIaJBPk91plJxD/mIi+zRJGCl6Md1Y6ays8Oh9KTz+0+RPoyCgVHu0UlXa7796p1Zzzdo
	UoN9wJ9APXHF/nSdqNrhuCLZ7soOmkp4l6EcXKKhMS3Q==
X-Received: by 2002:a05:600c:3552:b0:493:c337:db19 with SMTP id 5b1f17b1804b1-493e8992e65mr5804755e9.17.1783510828220;
        Wed, 08 Jul 2026 04:40:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] scdoc: upgrade 1.11.4 -> 1.11.5
Date: Wed,  8 Jul 2026 12:40:15 +0100
Message-ID: <20260708114021.3484868-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240468

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb} (91%)

diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
similarity index 91%
rename from meta/recipes-extended/scdoc/scdoc_1.11.4.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.5.bb
index 059150df468..4e0231dadf2 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 DEPENDS = "scdoc-native"
 
 SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
-SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
+SRCREV = "24be30ef17d5ca0162f11b35258c8fa2413d556a"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install

