Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD947CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 10:03:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.19121.1755165817604311553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 03:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHNwplVZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso5123045e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755165816; x=1755770616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w7nkDWPdBroRoJzdVLA6Q1RWbrVxxjgcRoLZJ5W/mA=;
        b=RHNwplVZGUt/HPpx6KiT74eZNQP3ebv+NsRl6qjFX90PvRKr3lVNKffIaavp8DFHwe
         Hw6Xy+y8EHehge03j+bL+ZKwUv8+jCFqbVUZEQlaOt1IiuqBomKGk0bsrFRCoOttt45N
         z0DLfuuFAW0ZcDsnDuZbekRp+liTa5eL9wfgGCILwb4za3X8C0Pl38NlegUaWdlqBdnS
         EoiHtnfr+qhi8/UIU9x5ASc9Us5op9G3//e+L/wSyHMjMGvA9dnx77qTvOc9OehCD/1a
         EavFcH/O8EmnU2dySO5Gr1M4JpBEMlaKcsWSFQExg7WU9uS1aElHsIkrojY5uDK3YJTT
         djRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755165816; x=1755770616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w7nkDWPdBroRoJzdVLA6Q1RWbrVxxjgcRoLZJ5W/mA=;
        b=OSump+ZRauvvKFGvncqv3s6c0XAh20z8Sk8m5B9pAN7iJi78EwEewh0OQmayfXu8Bj
         gGXJxeZ2wra57M1vuOcXc0EP2J6lH1yHBc0DZv7Q4pyl9e6Bqfjc4gOVWuKw4cLyGaPP
         LEyvJPi8vWbLZ/4JqQP45pHBKnGBTLKo7FdQl/7x5a0iMv/bKYVZOCQgg8bpXlRGCuF9
         qv4UwfvexMqL3Ahu6G/FTjclvjDXOVAJBL4Jk9oehgJL0ov9TtXoE2lkc73HAc7k3TBP
         7koYPkoA39QOhK4qdyfSsh/LSSflHGIZmAsLotoCVvxOaD/zpxehmCc5Sy6Hq/q0FZ5c
         UE0w==
X-Gm-Message-State: AOJu0Yx7tkyBJt3bqz4FEEwrDbggN+Zphku2opJtDBkF4YzegVvaufbv
	iPMjejz6fu02qY1Z3hYHXOkZqZ7yIqd8OXT77ZKexCHziZbDdPq6Qnl+SSJLwA==
X-Gm-Gg: ASbGncvmvwYKWG3T1riAops1/FtBBFHalb+khuPYPer9R5OW1MuPp20n7+rPr3H2iiQ
	9R2WZms/4mNKL2ryYz3CX1BiGyCRXRhmOye/vv3ifAhXvxtTkRquA9+vl/NEU4nmH1mt/jkebpC
	Tkvut/Eg0vwvonuRPr0N/+LiLqD2xo9Y9tFSXFrVM/flTXyiKPjH5ZEh1DPS0+Zf34nf30F4Zha
	ITnIV8zQ76VCD8HGVZAD8CiHdODLK/Gm+z358BqDN1uEQCHp6CggpeY1k0eSBA9ULl/xwoXBMaE
	7RJVuMzq+Uh+qnGAx+9OACUuDi48y5r8V6hB1FP0UEcso2XfgCU4nKCqLhulJ5R/S1snq3qEfax
	p85W4Srp9SwcwtDxffq6sTR3n1veE15VGkEGlocgzfG199U71yeVM8iCNh30=
X-Google-Smtp-Source: AGHT+IFO32lTPshJVJ2t1dj/9o2nJBffPA667lL8pd8VoD1cIbO/bFHbXz2N2daWt7ZTEht2TiyAdg==
X-Received: by 2002:a05:600c:3b1f:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45a1b61ea8cmr21794995e9.10.1755165815842;
        Thu, 14 Aug 2025 03:03:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b90fdc85a4sm11217235f8f.60.2025.08.14.03.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:03:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-coherent-licensed: fix upstream version check
Date: Thu, 14 Aug 2025 12:03:30 +0200
Message-Id: <20250814100330.2163083-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250814100330.2163083-1-alex.kanavin@gmail.com>
References: <20250814100330.2163083-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 10:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221856

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
index 9148fe4e36a..538154118f4 100644
--- a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
@@ -11,5 +11,6 @@ SRC_URI[sha256sum] = "d8071403ce742d3ac3592ddc4fb7057a46caffb415b928b4d52802e5f2
 inherit pypi python_flit_core
 
 PYPI_PACKAGE = "coherent_licensed"
+UPSTREAM_CHECK_PYPI_PACKAGE = "coherent_licensed"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


