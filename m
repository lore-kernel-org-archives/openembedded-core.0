Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F1D3B9BB
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:31:53 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.50341.1732638711629461985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ye2GsJSE;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: danismostlikely@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71d551855c2so951352a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638711; x=1733243511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHal6pgYcar+OE945GUhaML0dKiaMeTmmdCm9wlx4FY=;
        b=Ye2GsJSEJtgz02k6BGyvxGCNCg9hDrC0YHP8Gt/Mfd2rHFxYL1ARckXqdRAd5Y8w35
         5qSB2mJnsp5mG/0XpdRUd5Ypesy3A4L2mMmyJ84gIXKuMrj51PUnORs/XwTzxMRvndMK
         w8aa/DcBWVpOo15R8fPtNQeezzKcIR0U6XZYBpdZDx7h6kg3TtQca0Z9mnT0HpvFbmxu
         qJuVuIxnBffYlRV+Bfk6JLKjYOGtBYnzSQ+6P/BItsYl97E9OkqeJ9ubyOMV1d3pb26T
         vDt71klwog/boIvmTPFrFNIOl2KQnFG+hm0BgvvX/9eguDCFqWtISyI2VIdqjd2YkCyc
         CVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638711; x=1733243511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHal6pgYcar+OE945GUhaML0dKiaMeTmmdCm9wlx4FY=;
        b=ZqBmBOCl2tvYFWNvtJZk5xYfE8kpkjgHmoLSyK+073Y64p6CaD32MYGM4kRrizjR8M
         CHsXn8PiIKFWEuIljX50a+pX4sdlkrWVgvOoEDmnFvDThZyCNr5T4ybhYU2Tj095+pFe
         w1TS9WXFiwmi+KWOgCO9oTPZn+t6hbkeBS9fBGU1aHfxJE8CcfCM8AbR2fBUY0tsT59r
         M/HxDxGnShKVR4Di5WUKVpGixYz9W2OJBe2/eUPEKzD6FnLkKDkereCYyYEtNVK6j1en
         dIHIDh4Gzj/i7w22/tZyS9QdagFCmLtpGozoVdCiaKZrumV+LHaN0puTWR35Do68TjbF
         g8UQ==
X-Gm-Message-State: AOJu0YxgYL0vqqrtiT4Al5IKhnmbVv65qp+2r4aWoOEvcmHzqH6Aorn5
	wLZ12so/ZjJ2vmLszjaxD45PuWj+CslUgXCOKi1nOMHRupspi7iUwL6zgA==
X-Gm-Gg: ASbGncvA5y6ocl2/SOLLVrfAKEtruzq3V0+NXrWOf1FitaeS8VdjP+EP0Z7X5VzggJW
	T3IvapbriiwyqD1v1IJ6LyZrWIM1sNt810ZgTYTLJABKhjI6C5rBgrIFKOOgKH+MObn0hqZ6wOy
	xzrGvBM3Si22LCAx1YQhjsgx++XNnsFxtyMYKFWdX1eUkNuntkXXFpY2Y8aLKjChpF69KYPWIi/
	uY6HbfcVdztfNeeA5Q11JTzRSGoEb2YSiwRvX8m71ISzj05EleuW3ustrwzOAzS/bgvpm3uTVV3
	zzTqQA==
X-Google-Smtp-Source: AGHT+IFG5ZyrWan77xYNSoxelSEJRUH1OuhAeHjI9n9nt4w858viIftsuWdSENLPV2uzUab67SXLkg==
X-Received: by 2002:a05:6830:7104:b0:71d:4c7f:cb05 with SMTP id 46e09a7af769-71d4c7fcd61mr10093431a34.21.1732638710619;
        Tue, 26 Nov 2024 08:31:50 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1cfee824fsm2752040173.108.2024.11.26.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:31:50 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH v2] python3: package tkinter's shared objects
Date: Tue, 26 Nov 2024 10:31:26 -0600
Message-ID: <20241126163126.1882570-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207865

From: Dan McGregor <dan.mcgregor@usask.ca>

Seems every time python is updated this gets removed. That's likely
because the tk option can't be enabled in python3-native without
creating a dependency loop.

Instead of manually editing the manifest every time, explicitly
add it in the recipe as suggested by Alexander Kanavin.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/python/python3_3.13.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
index 8db5b813738..497b5fc1744 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -428,6 +428,7 @@ RPROVIDES:${PN}-modules = "${PN}"
 
 FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
-- 
2.47.0


