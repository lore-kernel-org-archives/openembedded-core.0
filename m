Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A11C35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:05:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.5102.1741687507046131873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eK+z0GDR;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so535232a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741687505; x=1742292305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDX4Ian8fi39IArO0I2Dx7D9HkEivku1MT3uaf2A0JE=;
        b=eK+z0GDRnmA1u/LDReHhY6lhQR9486FbtAgBBycS1aiG1temOb1/RJAeD6jK3i0V6L
         L9GJNG3+04zd/Dbga9wg2R2qGqgiD8+3AoKF0Ol1T/97wx4p7U5pZJ3Q2g9/qC2o9xEk
         Sx3EWWITskbf3VTejG44KimlQJ/MtF7gfLJZd1qNDhqPvePE0yKnUU+0GF/mMV1U3oFN
         DZtdDPTVKcw0NSELwoC3K9z0XR9tAtpWESFY6E0NhAG5q1uIGXWSVqTmemh9wdFEg4yD
         dfc+ZX76IVj5hyYYNjKDPbuzxEMYTYGiedzYbYvdpYjSgNz+F1OCtNHzJ6B0MUu/Rx/O
         7P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687505; x=1742292305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDX4Ian8fi39IArO0I2Dx7D9HkEivku1MT3uaf2A0JE=;
        b=tvhZLdQbcMtmtV7x1e40/rfa+USHrUSECLeOX20qeqqFWd8G7yucK0+AEFnvw7iRCK
         8HBCRtoGime6qzims4ypUuPo0N6zg9Lqjnn70FeA+aM/TAbu9cdXXElvJH+fiVXzxF5I
         vDijSHRfEJOc+UFFhYcXgo0J+JV5sZNU3nHVMecmhcYYgFbf7zMxTtETE9TKzLR2kwfn
         jvsxPWQbwZF/CqeCfCP1Nc15GR2MIJV9vb3FUK2486VUYoKjR7hWzwXEkWCbxAXv6g5L
         jW/Ghda5hOAb3D7e5Sil/Ow7U3/BaLezGM91wuTBO6AH+Pi4SY0i+msdWDchD5iVUbYp
         +dCA==
X-Gm-Message-State: AOJu0YxElhw7g5Lwi76ez125V+Wk4+h6Txqp+8r4BWncSJLeUgXK4pNz
	mb8VK3UnWMZryfRaOUARGE73HQBgcd4ByKnN5XiEN3l89i78vyMgExh19w==
X-Gm-Gg: ASbGncvUB4up16F03t0JVX+7vkNvdo1nE7gXmySE2H5j0O9FTeJdfEKBRljVgIJPcbI
	QMZcjS7Po85Pj/8d6jBO9TwtNd7FdXgLYW+pg7ToFqp7hYHijtuGsvIfW6bXccqp+yw00eelaSI
	xRcyC7fGatM9TIQWfjSMcNgYhn9WcnOX+6jncQrk5Dk1XIVO4ooSwFCzt5udmJgKRA1nJ/bWMPT
	GYb08uPtKF1Jz8ERaHMsAyFlzxKMef/jurT3AgukcUbo542IZoJIP1pV0VhYL6rjZwAjjb2CEGK
	sVpNfs2xmwADLpKGkXteO9Is//kr5hBdqDXE+jJQm7RQRiBDZ1Ugd94jTDmP7k+PVXjqB1X6k0a
	LybpHbg==
X-Google-Smtp-Source: AGHT+IFU6MK9T+Elmzb29OFFuFcRnX42O31AlpaqQHcW3bEknprrDsETLm6QOhDCJv2zmk0/gi+9mA==
X-Received: by 2002:a05:6402:274d:b0:5e5:c5f5:f4b with SMTP id 4fb4d7f45d1cf-5e75f5a34c4mr3874905a12.22.1741687505080;
        Tue, 11 Mar 2025 03:05:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8074949a12.23.2025.03.11.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:05:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] python3-roman-numbers-py: correct upstream version check
Date: Tue, 11 Mar 2025 11:04:58 +0100
Message-Id: <20250311100500.355914-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311100500.355914-1-alex.kanavin@gmail.com>
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212551

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
index 2f22f15d698..9a76df0de26 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
 SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
 PYPI_PACKAGE = "roman_numerals_py"
+UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
 
 inherit pypi python_flit_core
 
-- 
2.39.5


