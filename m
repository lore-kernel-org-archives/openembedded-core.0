Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C216D74945
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:56 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9327.1766114571043014457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IpAfMjNw;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1345100b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114570; x=1766719370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9cq2KcotP8SVkNT2TAANE+oncCrASHk/hNpeNp9M/0=;
        b=IpAfMjNwMwutprmz6mV9geeUYeDLYu+vdmgiHiMKs+menH1NM9GOKLfSftyDk7Wu2s
         d3ogXSD7Aj8eGcpv0GiuurL5mtKHLUOt5FGFoMdeHzVcayeNRsYM+2ccceqTb9jwFxoK
         3k6Ky54sHzOg+sOyixCV/2Wo4G9/6rPwwc7sbUd73TO+Or2nJMTog6LmKCdWNayhsw6b
         c24ibG1UEjQGxWyHaIanJglgBSbvyNDJInxtL44TaseQPfjKNmyUx6ycTmTTqlMBFNrI
         IY0Y3gOW/WBtNSDLXw49uOpDUeWSX/L0lPhS0NROprW2Qh9ay1M6hOQA4YZSAFBpU5DI
         pyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114570; x=1766719370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9cq2KcotP8SVkNT2TAANE+oncCrASHk/hNpeNp9M/0=;
        b=U6AydQHicbcvzhDSl+LRxkSgrZcQ82GOVerOY5RTjoHg6hKzS3/MsZFJtJiL3NM++t
         8TgfAfbkNz3eARv3ABgWOFlBVKE2Bm65rvBNjm91kWSmiRipEwNqMAEIMGtX/5SIrlWg
         g5NEHHz+PCJygpfUMMBvziVCbzx0fAz1/jO48QwR6j+N9Qaerr0YayFw8obR+LlCjIrX
         8KHdci4QGAdLQp7T1up0Hqt/CVfQWlyC5QbCJWsPd7EKCvqKCL/Ljxcs1Eube72/tFiO
         zf3h9NzutBhKEL859o+qzj6exaVoK8XJGrjOyyHCOjHNJ/AjdXpvvTPLk97XenBhIK4l
         BTng==
X-Gm-Message-State: AOJu0Ywnj28OoUpqb0jnDJPIpuzsDrbeKflRhIICxhJqE8jLx4O11qbu
	F/avt5GS/Gb9KxW5ZpxDCh5HlKWoMvgLEh1tFkm8HX2DjpyJpeRzjR95wxulKw==
X-Gm-Gg: AY/fxX4KihEFTMOFGS1XVMl+zk60bHf1PsFYozDcaHPxhisN5aUNQw4hfloB1VTaL3o
	HXzDYV8vmBLtge9b1//J4ZRuN6yA8zxXnvIG//Vm4xxKXO+bTJonUalWtziPJ/Uzn/Boa0/XwKO
	fCxQTFJZOshg/CpkB6NKVOkXc4xfF3YzW6lnwIbXFoTIAYyHo2txp3T6d6mjh7G/j4SvCZigUth
	NH7PNcdsKoeYLv3oWcLGuNWCjsKuZSM9Btj2ZQhDuaZSXHLFiXcsqpzdm6ypGmFzKcy0+hd44UN
	9/w88Rk+HpYpF9bKqZVtCrohSKW2azrBAQriC8HZkpcgHo86eg3jplUB++EvlSRGZGarcvAi/vh
	stO63ntK4xYkDgCZwnsLP3yKZhuVfY32jJOGWPeDsHDrlzu/E6BI077+adF1YOba0IAFP6xcwgK
	JDjmNHdxn8Cdf/Ws1I3RssxoNj
X-Google-Smtp-Source: AGHT+IFy5q5JogzqkbcCLvKeat5TuCKfg+bq9//YzCR04iv8wttwnJEpObo8fw62sJ2xISo/H4BbBw==
X-Received: by 2002:a05:6a00:9089:b0:781:be:277e with SMTP id d2e1a72fcca58-7ff64401115mr1402048b3a.4.1766114570148;
        Thu, 18 Dec 2025 19:22:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 13/29] gstreamer1.0-python: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:52 +0530
Message-ID: <20251219032209.960840-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228181

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8a5ea8bc63b33408642600886936c79a96bd898a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...reamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.5.bb => gstreamer1.0-python_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
index 12340245e8..9a3a86fcbb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "86e2fe2b1bba7ffc18b1d4abe1035fe1c33b20fe4e077cce2f90dbfa445b2341"
+SRC_URI[sha256sum] = "7a544b7968b181c2965e979f2ce889db36397790de9a7c312cf468b51d26428c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

