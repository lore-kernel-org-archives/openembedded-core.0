Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D43C61DD3
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:16:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16444.1771661813998445344
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HZb6irHW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-436356740e6so2967795f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771661812; x=1772266612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZhLSc3cN2YvvMikAXam11QxxGXf/wss0mYwxWaur3U=;
        b=HZb6irHWBwms5G7T/v/gqQLJk3R+JKari+0hx4CG3HqiZq3pN1aKzExg55SSDD5j4j
         w88VKoHJpNCnfIoz8A7kuSDbSpj47PO3L3DFEpAeDPHJCX3PYEKuo3odUFWPwVTYyQy2
         JtKGZylSrCmjt5xaVVkMOG9AG8oyjSdLc/Ezc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771661812; x=1772266612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZhLSc3cN2YvvMikAXam11QxxGXf/wss0mYwxWaur3U=;
        b=pxOY1lN77V+Sj73xZYvKaU4wOSRA0WaIwCnP8T2mVhYR/MMvWj+eVsKP4bc1SNV9FD
         g2aHKYS0kr3EiXPKzjABpCu4YM7YDsG4TOdl4U+qYw9a5HKSq+eJCC6sKRaVxgVxzDr1
         BFCGpoeAPzTzXxDBq2NJ5aj2J1tBnyzcBWLrJcnRkxghU1hJ55NrjeVY70imd2fGj931
         eYcjy+pqjGxl5ICvDD5dV/XVw2tvdLqLzSOJRTDwjcpKRoOmGPpTvWIOKgFFnpzs0EJr
         Ol35IeU8uoZ8Igp8Cd9qmSzqHYwzIutUedBDPE5NoABb2GiAYG7VXCJPKUtKfUc2pOkX
         5Hdw==
X-Gm-Message-State: AOJu0YwC1CBjfe2384FlY4hB8HPkpLMvCFt1YHvwXaDlvIYyb3FJoc3I
	NqQTBKNBJ/L/awD5iubPruX2mOiMHJtYKD2OA4Iv8KNgFGTt07OeP44Q5nKc8RzkcQo0GOS51pR
	dmkQGoe0=
X-Gm-Gg: AZuq6aL7CPKJi7gheanFK4R9CBvI2srkA8gLwSyCUt1cbKVAQr/sgrpr5OHHRbJY0Ky
	p+UMP1k1MgRlS/WNoZ6sbry64HQkXGGQzZbO4+SJOe3TRtRW+WxDOMuHvrmH/M053c/0MQv2QYZ
	tLUdRlzzq8gT6VkkyypOM9qvXS8tUrjQPCEUzhQJ0JXjvTC8a+auoqLB/Y2s8xdwchsdqhQxt4R
	xt1anjPNcjvUeqh06p+2g9F5l+vrSDf9YDoHa8AuUkyVfyuujTTezh3N7Iqg9WegXZkMUNgcgBQ
	W2NkUtuIKNuAnxtVVrv4d/u8wQ3eLkMlzY864Ez3MhJUCYmyglhrhgaIKJKqgKcMjRtn6lqNmqg
	+bsuvDXEhDyghyjEScps78kAmsblNiQTXSbpl5oKjgZ1kZ7I/2w7OMc76sPk0wE1uS9Dq6yWA6b
	wZa3LHDkKi+6+0ab0XUG8Z+ySaMgVJcevbT+JxD4NSTYogR0SJM80=
X-Received: by 2002:a05:6000:184d:b0:436:3563:49a2 with SMTP id ffacd0b85a97d-4396f17a6b8mr4302511f8f.37.1771661811930;
        Sat, 21 Feb 2026 00:16:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm3455846f8f.26.2026.02.21.00.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:16:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] conf/distro: Drop default-versions.inc
Date: Sat, 21 Feb 2026 08:16:47 +0000
Message-ID: <20260221081647.3216983-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221081647.3216983-1-richard.purdie@linuxfoundation.org>
References: <20260221081647.3216983-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231604

This conf file used to be useful when we had multiple versions of recipes
but we no longer do that and the file is empty. Remove it as obsolete and
not needed anymore.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf            | 1 -
 meta/conf/distro/include/default-versions.inc | 3 ---
 2 files changed, 4 deletions(-)
 delete mode 100644 meta/conf/distro/include/default-versions.inc

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index e1024528e4e..c6be00e80cf 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,5 +1,4 @@
 include conf/distro/include/default-providers.inc
-include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include_all conf/distro/include/maintainers.inc
 include conf/distro/include/time64.inc
diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
deleted file mode 100644
index a88b65a74ce..00000000000
--- a/meta/conf/distro/include/default-versions.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-#
-# Default preferred versions
-#

