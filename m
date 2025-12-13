Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50466D5AE62
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:59 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2885.1765620050222329396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fmv6py5M;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29812589890so25550735ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620049; x=1766224849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQw7CIST8rm7H08RPs9/B+ds/P5E8XOilBwUOg+20Nk=;
        b=Fmv6py5MuQyw63ECjBM1SvO5rq5Rh5z3WEW3LYgGXL1NuPucfONUQl8vcml54/6jFj
         ypDFCWKmRPYIgv7IAkT8xq3CuhAJi6tdfaJVLpZSEsRYW2P09dpoynUcsEZdm8XlAzgS
         w9HbUzZdNT3UKScV7I+uQ/Q5Q74j+S4CDFSWuWMIwyewWvsmMg6hLFC4rGXorKRuNzf8
         /BCSAQRfJdZIK7UpcsLqDB4kyZgEI7cOXZmvJnKCfc+bgrSmLA2EPNz+QTH1jjT+TQ5H
         c59wG+ggQcOrdcVIslmFpHu4A3h/SiZ2aKf6U6w4v7vlbWgn8NjQxGsmHYXFbMNjS2o6
         sC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620049; x=1766224849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQw7CIST8rm7H08RPs9/B+ds/P5E8XOilBwUOg+20Nk=;
        b=DO6f8YX4AUOqsZXKLlD7cmTMSDh86/4ELbgtoE6fiQvEwgKkVIV+JcMy0+0NjjISoq
         yOBVbnM7iO94YvZLI8CwuZRAmPxVqZVrFOEhDVeII1p85TmREfmkBLMvPdgRg4bg9116
         Pc5F0fwhZzDDm1C4NhIstuhO896feyAtzYIoNN2eYriPaQK7t2EzJQh4Y+1vUk+vgjU0
         BJIehMSABFEVlIiZQXmedWkQ2N2UJADFZ8Vi+cRCUEIjd57grkDiK7u1fflgqXZmhQTo
         MlyD3F66YFC+wOHo6pJRaPZiivSIP6d+svZu55x31HH77yTtjT3D71o6Lo7wA8kh1F/a
         jDzw==
X-Gm-Message-State: AOJu0Yz3HH6yCskmq1JAF5XMzBfFHk0aylL+flQuU+l+GXsXAWpw+cfo
	fWTc8lObVVnbb/aIMHDA15TzgUo0O0YrkkXPa6Ib6Z97ANwuu46A2aKRUmGF28b8
X-Gm-Gg: AY/fxX7zO4FDJoKNo/NjIfoDUBfO6yPFxni7VdbOdv2zNrVhd0er2cHWQSgPlhtyH+p
	F7DmlbWmeNqs1EqfHMjZh66wohl8PdaFTGlJaiXNh9J7X+P5qzM03BGI0t9Rr9DlXmu6wxXwsV1
	gTsZuzRoX6ZmdiHFpgeXjwC3okcLz2ub2l8aEqS8xQO9XAnaKTs2HmcyaL9II6+1xjf14FhnFtq
	bdOe8g6K6dlfQzHxK+qU1TRlM9L6G+p5jsdDvcgsFvkY1B3Y2hhZTNthjMqL5nvio81zGhmRDdt
	+b/7CvNGznpM6o2d0j/HMMQLIJVKekixarPAjBbifLmiyem8Myxh8itH414fbq3pVVB7HF8NW/a
	ts3GeFZrrdHE0m+T4SCGMokEecmISo5usSnasJLYr7m42qJOcSTq5PnIcytox1tXleXiVn3pzMk
	jbv8Xo3LMBZ5kEUNcUR+/Ba64NgRj0irc3ZDs=
X-Google-Smtp-Source: AGHT+IHCcmhIGQDbx4+SYbJd7LYZEp9769d+cWK4jZs6AUo4nibdlVRE48NxszguzV/fSrKPABLStA==
X-Received: by 2002:a17:902:e551:b0:295:9b3a:16b7 with SMTP id d9443c01a7336-29f26ce9dd2mr43328725ad.4.1765620049435;
        Sat, 13 Dec 2025 02:00:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 26/67] gst-examples: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:50 +0530
Message-ID: <20251213095931.2571498-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227644

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 5d45726d07f049be7d131b4fa0ed1b2716060dff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.5.bb => gst-examples_1.26.7.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
index 2fa4ef11fe..6790f0b038 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
+SRCREV = "c5a5c302f5e7218182c0633decec16b25de82add"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 

