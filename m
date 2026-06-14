Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E509CD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105049.1781424237987762114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TJGth3qd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490be03d47bso23100865e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424236; x=1782029036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9II40uU9PWWsFZPDE1os7aDWZ1cnnDtpccko0dIf5Ns=;
        b=TJGth3qdaYE1kNeztCVDOeOSyHSsjtlQUGjp5INCQcpCmLVijJLRuiO5qeDlg9YU9b
         x62BqOfMVcQkgBfGtTkygipxTpTAeGNxsWLBM2eT8LbtPGFcgtXSAjWmB6qsrsP7HC6o
         X+sotB9OduP0aUnvvZw+YuCX5LtDPv3byFWUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424236; x=1782029036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9II40uU9PWWsFZPDE1os7aDWZ1cnnDtpccko0dIf5Ns=;
        b=l0idRiopKyW2kkPxYF8pG8iOpHGjqDcr5cv0MGtF6bThyOZXdfhD3B3LPzPUcT0Tne
         X1QfzDWWVh7pJOTQX8jIob+oRWQbQMG6r4aQ3xVrhOqeQfzlt5mSSlsGuwLoO/iZFNel
         JYMZ0FGd46xZCP5v9mTJ2V6LjNGFKoMBuYKmEliIvTHbMjoGQc7x2oVOLgNvuL2ZAte/
         aOq6hH8eNC5LXEJIExsCMt5Tu/tNBDldPrcCTFS/Rb5dApQ+qPy+tZICv5VWpx9UbvF6
         eszP29YdcMEEz5zw4quCNjcDG6BCKreLDmA92/775S4dZi/5FuhYTQd0KqoLbFTHrqK5
         QppA==
X-Gm-Message-State: AOJu0Yy4l0Ou1wg9raXRTm5Gn+kFGHRJ8tvEoEgrVqp6TGAiPQagxZG2
	zWxujksnB1ErkiV+NsGKBgMpfKxYoRbEx5kA5SMPyPSKC+3uzsiAxBF+CHVJ4jIiep6RpWHlj8f
	An6zU
X-Gm-Gg: Acq92OE5koFevJjGwLMQg8ytt6r6lafHr34gWH8HLcZGu81G7vbdpsRm91W3Ni24YM/
	rtizr5y4HXmJRHG8YbODjvwF+9f61/19G2SWrGWYPfcP3M+OA78k0jWYvuCSq/JAyrQ3fcLkYfp
	EAqN2Ydlxs/ZD6LNPctUcapn11nsiE1acM0WZPEKlIzcgYtNZlkzYQ5SD6oK4tZlIQE0ZD4a5h1
	G0JigtAhvdnwvsXCUvYaEnJ0agsJNPz6CwTUTcX8+Y6amIv/2tlXrU+LmgWAgC6HSgA8IVdImyo
	zePR/RoqMbQa5KXvc4mtarGA4NgoQWfXG1GTl2jdDqrMczLhZo09hvqFzuJEeV8KVmqm1BXFHKy
	wGnjftr0mKQS9GRBpNdodOPnqSg/zMlnMmgXmxnD1YtiAirevB2IuhVTISjrNEcKNzdBnpucB2d
	j9wMb6i1/hOmpPa2Hr5G6waN9GK4lTqpJpfABkTJS2r1jetZIkOqUcU7XntJgKhx4=
X-Received: by 2002:a05:600c:214e:b0:490:e180:2ed with SMTP id 5b1f17b1804b1-490ec4bfe4cmr72132785e9.4.1781424236190;
        Sun, 14 Jun 2026 01:03:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/56] python3-hatchling: upgrade 1.29.0 -> 1.30.1
Date: Sun, 14 Jun 2026 09:02:40 +0100
Message-ID: <20260614080307.4017177-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238713

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.29.0.bb => python3-hatchling_1.30.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
index 080a954f7fd..23067e3e58f 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6"
+SRC_URI[sha256sum] = "eee4fd45357f72ebb3d7a42e5d72cfb5e29ed426d79e8836288926c4258d5f2e"
 
 BBCLASSEXTEND = "native nativesdk"

