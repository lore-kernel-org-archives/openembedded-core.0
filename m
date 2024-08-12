Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA46FC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 10:32:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.43255.1723458727751837826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 03:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q2hWUdoS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280bca3960so32398365e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723458726; x=1724063526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9ecYh78E6XEndJ6TbLSUUSkg986ztYYULruK0bdg6g=;
        b=Q2hWUdoSkgHNrt2FLX4G9g+2wV3g0Ddkgk/UwBObuB7TfYw70BdUsFnNHValvqht2e
         QKjS0/Xen8/tkKSTHZkruidKU4pQfMkd7BpiYmfekV6tgvvWbClQ/IERZuNIZaqHr37Y
         /RjJ5Okc3Z8l3yDXNa6VYfg941ZEIIPcxURvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458726; x=1724063526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9ecYh78E6XEndJ6TbLSUUSkg986ztYYULruK0bdg6g=;
        b=IYuu134XrfJ+jWTa+tRudiNNZtOkr7z1oabb2AU0lkU7iqW3/dTfuQyS7ZMb+AwUv7
         aQm5B5Kn10R2McpGHDlZqK0S95+4+7YFNJQxJ+ki93DxIL521Tl5yNY9eeo6GbqPGvwZ
         cuDm1ccGyvVw8hQEX09qju0Wr0ieE3Mt7CYrfCf4hGeVOVUGrOeUK1fzcKXWMklYzGFc
         FVR/8eGc19YYCBQ0OT1CRCBv45h3BFcxip7WfxDzU7VgFr7t25Gk4yasjaFWC3Q1XDjV
         1KeNoZj7MNOTV5ISgFhSmnSbNTiEMM1IxTPbLetcKPWip8dEWei/gz0GsVAca/oUNMoU
         UyeQ==
X-Gm-Message-State: AOJu0Yyuqb060rbn7FJUK6CPW5oeBwcDomVbXPB2TWfaoFLBsuUaf2Ql
	mHQaLxrpwZCX3NXkfibsxv4tCYTTGRztDXduI2upslzaq0zOVJF6JHkDb6fVZ3vjrBA1m6mZzog
	YJ0M=
X-Google-Smtp-Source: AGHT+IE7SHlsYE1os7eY3teWu95z2HByHZ2fI94jrbKRWgRtG7Wwn8MdHD+YfUxYdgKMKrtXadOjow==
X-Received: by 2002:a05:600c:458e:b0:428:1ce0:4dfd with SMTP id 5b1f17b1804b1-429c3a5b303mr59282595e9.34.1723458725601;
        Mon, 12 Aug 2024 03:32:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:99e7:4d1b:f9f0:80f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7492cesm182478425e9.20.2024.08.12.03.32.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:32:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Include cve-check-map earlier, before distro
Date: Mon, 12 Aug 2024 11:32:04 +0100
Message-ID: <20240812103204.837158-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 10:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203218

It makes sense for the distro to be able to override "policy" from cve-check-map
which is intented to provide defaults. Tweak the ordering to allow for this,
ensuring it is included before the distro includes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index baa1b2df473..cdc9666723e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -832,12 +832,12 @@ include conf/local.conf
 require conf/multiconfig/${BB_CURRENT_MC}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
+require conf/cve-check-map.conf
 include conf/distro/${DISTRO}.conf
 include conf/distro/defaultsetup.conf
 include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
-require conf/cve-check-map.conf
 include conf/bblock.conf
 
 ##################################################################

