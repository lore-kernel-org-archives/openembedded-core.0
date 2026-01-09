Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4734D26D60
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11925.1767971219933520296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xwpmtcgx;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee1939e70bso44168601cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971218; x=1768576018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=xwpmtcgxd5YCM9QNtscJ33zfjWxc4IEzes7KlNYwOv2KtA5XZ+g7drYaWoyv6Q5/cm
         g0RKDA1yLU0YaZJ/xkW6bf5X6QLePLnptVtVFGJ05Ft9CxKtGz9mK/10430ybkB8HbkT
         8xKuFn1v6ZVydjDV8hFawVqFyX/zmzSVwNZgkRLOCQv77aNrM0eWoaxl9tTVnodPjHu5
         I6HFqUsgzBz5bJXldFeVAvcKOvVXm8THsxD9bd+9cHiZSKQLmVE26/WF0thxg2eZVHOY
         MHm3XihTYP/C5bQlOINylhN8+qi4Dknkdljd88p+VrKIdN7dtAeTsmlUeIdPfBWQ7z0x
         7TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971218; x=1768576018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=IaM9VcfG0wl4/bFohFRy5EehC/lumuqtxTEmkOyM59DAZgLOuRvXZ4HLkWfimpCurx
         IPcCiNUC4nRByWDTII16dBZS0Q4yppZSKgyhmnMFF7fJpnMmvMOmUOWZRWM14pMNk64t
         HbR2ix9C/rhua3ekDQRZP7o8o9NHOZ2O4NVf4i4oo4S/LVbsolzuuL+7A3WXy/0FCR2R
         HgRcrH2MoswMeqlK0T3QlQyuF2v8RepSp499IqgZ+0P4HhErFNUVAj8KR5hsXRGPOTXd
         gf0Qe98s96NeLuLZ+QplfRH4vD59YdDeB5phgGpbCs9YTSsgd00Vm9S+JDUC/shrdzJf
         zJqQ==
X-Gm-Message-State: AOJu0Yyor47fQ/lXZKzCL4EY0qLxTaYcyuBsBrPcr4M3WCl+skfnxN3C
	N2xsz3YV6t/zbILeijqG0EbJU1T0R3jG3jGE6RAd4wQwVAiylgYmlSKECKFEH8K6CxoXVMUO810
	A/iw9eck=
X-Gm-Gg: AY/fxX5C9OryvjCClCSDpE9+oZt7d43j/rbT2PTi8UCx9eCUfx58t0Zijic1A9QcYSY
	0R1Sw4Jx4/P8QsuxwPyOHllfp9E2/T4Yqxp8yDrzEsaLTm3eliX5f/1pYR6cob1aIpHNg3daQUw
	xVVKwzV20OVMkxXxQbb/LzJo5fLAQTfj1+pitx5Mf7DMQG395AeOxUAOmSRAUMWsbe/+BaxCAuk
	AJTn7BwQhU8y7D94M8bpOzgNhnNrMXCW/tU9XYzFCpVVllkAC4wz3//QQTYfpa6oHbeM71b/75K
	jPHaU+3maDWMQq3ffLiwL27SNPWHtltuRXM/YTEA7pZOkTl/Pf8qEPcbzU48oNJw+W5N47bsdqJ
	uSsBwxfOhCgl2qx6uwSpmKUshALNkJw4fLq5D0DyJvxLMAjI4/p8tIvdea2B16GVwE1V8w2WXgB
	eFIy5Du7hYtPX0EQY=
X-Google-Smtp-Source: AGHT+IHNTbVmu+azuzD2a3VWjJESunNjjYKr7oTDdxNIYIUnBc2LLe/WUtlPeYMqTP2+PuMdquVyJA==
X-Received: by 2002:a05:622a:1186:b0:4ee:87a:4d10 with SMTP id d75a77b69052e-4ffb4a26249mr127150081cf.78.1767971218071;
        Fri, 09 Jan 2026 07:06:58 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffaac486efsm69193611cf.27.2026.01.09.07.06.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:06:57 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6 v3] python3targetconfig: export _PYTHON_PROJECT_BASE
Date: Fri,  9 Jan 2026 10:06:47 -0500
Message-ID: <20260109150651.469332-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229128

See: https://github.com/python/cpython/commit/2950bc50af8f

As of 3.14.0, Python's sysconfig module looks for _PYTHON_PROJECT_BASE
to be set when cross-compiling, or otherwise it'll find and use the
native interpreter's paths when calling get_path() and filling out
_CONFIG_VARS. Set _PYTHON_PROJECT_BASE to "${B}" in
python3targetconfig's setup_target_config() to help avoid issues with
incorrect paths in rpm and other recipes that depend on this class.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 08bc619398..2877665737 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,6 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export _PYTHON_PROJECT_BASE="${B}"
         export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
-- 
2.52.0


