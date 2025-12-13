Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638EDD5AE68
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2895.1765620070790587552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihPmNRI4;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0ac29fca1so318095ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620070; x=1766224870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRi9jbNrcrRDQGLgzCmEKEM0UC6UK7Q34AiOw3qbgas=;
        b=ihPmNRI4wE67NL4K8HiB+3oec2cPqhNBfRD+W9vbhdPjEmO/CF+I5rNdfPeGEO6ACa
         e1hoY0Ij3Blu6KbOUplbqI4echOPBRS581Xv61uJQtFOBKg/vvI8DW6QtqxMEVSULpfV
         tKZ9+NdpiZ2Lpbj6oFnOsJ3QR7n4VrpEC9WpWUq/cdBOslYKZDp209WNUz6JfETGYNbC
         KsRLVqp2qrcCOZ4YnhuVaCLkLMDtEzDqrKkR2zm6uZydJvVy7JUxt+Zt5jAbGo3OZvL9
         SFJHZumufFGMxO45xpSHWsT7xfMM4F0Dpro8gyoVu9mlJE6qpAY7oinfkYGKHtoH2+OT
         qBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620070; x=1766224870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRi9jbNrcrRDQGLgzCmEKEM0UC6UK7Q34AiOw3qbgas=;
        b=TJyWCNFtZta3WEaKSLYhVjMOfvITpKg6cx8l29zSbSLwi2AyKF6o+PJsVTuX/+etG1
         M432KbE1tpuf4xfvRyL0LObAundmNFIpWhVs497B7Q3QtKc79v9aiPSAGJ7bBqf9F5TZ
         JwhrXmqvHewybfuw6r9jNGPv7KDT2/bb1mK1doPe3xM/hBLWhzY+BcCE2iRUmwmkTGE4
         ND2HDFIZp+C4pGIi7bSfUjH37oT1+0+OKdXjDyg25kgch42whJdAJ/EpB1WyNfyrOZ72
         enK8YzTje2k3Et35uTIGlcdilL56VTK9LNHIuAIuNA/0os2qoamfyU1C0eKMQAJFqgD3
         jMTQ==
X-Gm-Message-State: AOJu0YxgEwoCSM+8ffo4Vijh6w7uMWBW1JwRPv2UxxOcDOza8MP94vDG
	mYiknv5rrpoR9kcWdhAdcytad+IhMeoYimcfwiE3OGAxwwrvFcgYlNF1pNdsC0zS
X-Gm-Gg: AY/fxX7kdK2z/sR3+nqjlvBY5PZl2/jfpnlShV8fl0vT8eMYdOWgxiaJqhH9BHDKhXd
	wBlh8IooTu7P4BqTqnLv53Q0W7297ZBF4C9LhSCuQE4iz2+pRVJsvUBncvb/eJqc1fjrwvKpZEW
	kteBCKZ/UyC3urfB92nuiupK6gukmaDHPGuXrDrHvkHUEKPtGS4PTaXiswnfDbnO7zvE/7RQPR0
	s6ini4A5b35MmJkgR70NcJcAQ0zkd4nrFpy+ypyUphYTLVzTQf+I+5lHci4oib1SY2kbr00g8+1
	9fZSmsTntHJJxafHoaQ2h4Bz9tOCNtHInShZMl6gU+0wTjXeJXavLXzVuCfqDb2kStTZ2sDMNOm
	JnJmTUP6tiCFgEN8SLAHji9u+Yb/ffmpqNvaAN6UDP7ATlcAu+2GC3k4+6U9UpGKkOioi2eCYw1
	Mt9Wu3RGTDMT8nsBi7VWcHeJQu
X-Google-Smtp-Source: AGHT+IGfCC+O9QP44jzxfaQTx0hCWTEFOTOvoIu3owJw9sRvyzhTWQ+ewpSPU4ZYdDdJQXq84QrqkA==
X-Received: by 2002:a17:903:32c8:b0:29d:a26c:34b6 with SMTP id d9443c01a7336-29f23cde641mr38533505ad.50.1765620070017;
        Sat, 13 Dec 2025 02:01:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 33/67] gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:57 +0530
Message-ID: <20251213095931.2571498-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227651

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 03dbfa735eb15295e7d58b2029c1a88cd98c2fd2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
index a6bfd1d2b0..0bc858a03b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "4f234594aea692e3c1bfaa969965039aaf7483bdfc5862b31d614a59e6718abf"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 

