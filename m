Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D0AC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.17.1676236302499036227
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jgaO7S6Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id pj3so10163418pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epAO2EG8Q+yCBh9i+dO5JtNWsxsXr+yoTlOwZxxSwdY=;
        b=jgaO7S6Qmsd5NVAIoA5pT7UG2y/LAP6WjCHazrnjZr636Hq7y/BDU0r2YKrnGaXPkM
         wDoETwZ5so2KBtg/d9Eec1rfWPGSaWYiY886YfnTB25X/c6GCtlEV+Xpu4M649DKBO/j
         EEiezgP5A18j+AoaEtIF8bPufaU8fKfmHC1Nq75WVdDf5yCq/CWo+Q7OgrgcClfL805V
         wuGKma/jBiFCljhFb67lmYtot1JK56So5ekR0mw7WAlqQIUS0fxwOWpbqAJe1sB6tkM+
         WsmC6mNu+yg4Jft9pkDkwvlwp75aQrE86e5DxYm5WotHIrRDd4hLMIk8PtetKnGE9uiW
         YY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epAO2EG8Q+yCBh9i+dO5JtNWsxsXr+yoTlOwZxxSwdY=;
        b=2XRO0TjSWCuMvclpTIndJM9CbE0N3iyLmUUGNgN/BK7FNhVVMo5R7kVWgFE5dn9JzC
         x31NfyoWHW5Gfuu3iwSLYjJ0vuLzMsoJc/DT2eET1RucP4Yx0W4XKdx0pJKU8Q5nyZw1
         lX1qNQ2vzJk5Oe8WmYkudu/tuOIaNU+nemYTQMm1syKqEyVF2KqWxnsrQkIaFMLpR6mY
         tTpJDCfmSRSY6+9Z+E0sgSSXM3ucQ1+J8U0PlyFFZ9gGh4qH/mGxNVvTvq9IKdqsOB2O
         8sxu3jWyJipm0uOusKgxfGu5N8GGzr8PqdtAsCQUqLkxDLnIsdQ4AsdHlpd+D/b4AEMe
         hBnQ==
X-Gm-Message-State: AO0yUKXZuSkoNRpk1/s6lUPAToKseyKtx8P0jSozBz4L5NdPn+63QtDl
	ZiCxXRFSBeWT/Wu3C6R5RowlcC7CeEZGWnmsczQ=
X-Google-Smtp-Source: AK7set8Kdu697MgTiK0ljUQGXF6sRpy4i9Stasls90llOClAv/elybyL6aQrBupOrwN3jAzA+MJk8g==
X-Received: by 2002:a17:902:cad4:b0:19a:8378:bde2 with SMTP id y20-20020a170902cad400b0019a8378bde2mr4220525pld.39.1676236301465;
        Sun, 12 Feb 2023 13:11:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/27] oeqa context.py: fix --target-ip comment to include ssh port number
Date: Sun, 12 Feb 2023 11:10:43 -1000
Message-Id: <54c30e509074073b99a7a8890482ba1af2abbab9.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177070

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Providing ssh port number is supported too with
"--target-ip 192.168.0.10:22".

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 637919b9df0abc06da5b2f9b389cf25376bd6b7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 8092dd0bae..0c5d1869ab 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -67,11 +67,11 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address and optionally ssh port (default 22) of device under test, for example '192.168.0.7:22'. Default: %s" \
                 % self.default_target_ip)
         runtime_group.add_argument('--server-ip', action='store',
                 default=self.default_target_ip,
-                help="IP address of device under test, default: %s" \
+                help="IP address of the test host from test target machine, default: %s" \
                 % self.default_server_ip)
 
         runtime_group.add_argument('--host-dumper-dir', action='store',
-- 
2.34.1


