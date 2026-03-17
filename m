Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCB8FF6E84
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:18:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57.1773782272665434479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 14:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rn7Cppmv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so56158635e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773782270; x=1774387070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw/JlwMgqyLX20AfwjllyEamoeCb6yJu2ooBi0N26XQ=;
        b=Rn7CppmvZy9EA8p/HAQw7AGwimGga8U3rv7JSDM8i6/CAqt35FWWgLt937xDEmRfUo
         P9OvM/eGuVlyVFA9UCZTy8WCiSi/R3E+0M+2u/515umPbpwD+S2BAef0s7fpc9FnOVfm
         zKtL7vScSUjQSo1kfCMgchpzYHUt68vgyERNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782270; x=1774387070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw/JlwMgqyLX20AfwjllyEamoeCb6yJu2ooBi0N26XQ=;
        b=M0YkRcP4zw7DSp0P9LYWiYHBuK1hX0QXieiYym3PjcxFOF3j8I2Gyni6pD9Q5jIZ0i
         5WdRseuqSzXvYS15DSDF9QIgOPWTsuk9DEns/EmOVICf37WOviOHJNWn3f8oPzUlbZ4L
         4CeKuXSRHIMCFtR/DkRTwcJUpSybv3anyBYvzIPnFDFn9aeV9XC90EmFP/NZ6Tjbg0IP
         0vsG3+mcyHXsV4waX6FY3tdcEC1zehUCf5otPJk6cvXQbzhhrbjguRpfPJ/Qni5B+EjZ
         pPLeeeWS5RX5nobwJnsZoR1MHUEnGsevsq0xb6kUaClYKnp8FInuNkd7S6VI8oL0WtF7
         gQBg==
X-Gm-Message-State: AOJu0YzEhCfECz2UYiNxTreSY548LOqH6hxDdCoQN/K/9gPrI/nKUH4+
	aokVbj8jkaZ36W+6WkLNfve4UsIjLloCxTDU413ysm11akppb7oTXMUTinEoXZttTdV0ukbnEq8
	py6nGl3E=
X-Gm-Gg: ATEYQzzpct4pU+ovUwV78wNdJwVZMJ8tyB+rBqYzLOneuf09NurdGcc3zD3a1yltlXo
	x2CSPe/lu1YZlsw0vTZycELxcZX5H0wZoYJLznSyd6giPXvR/LKebD/gNXvNkAAWa1UMBGn3VPz
	h95ZO/5btnE3kNiAqhRGxUpPatXGzOGNmvG1wfkkImma/5SGTeUxqNi9HFZKldzikqXyeLmlv4G
	Vu21sq+A9/Iq6vPaS1/P/4qj4HSoqQE5OIwczbLrSBpyziHBVkjF/hoo0OywwamPk+YS4DdbNT9
	nCsOQXyarntw1UYfqQB5EJgx2H1PTdksAouoK7tp8pIjYMXDvxmh9Xo1h3m6RfJ4ZTM2pvsEArZ
	MsY6WTdHkAUjnCN7VR9ORoWSfeEDGd9ydhN3pMD1oby6NqHvP01SWrhj1CptIWmfZbDcCAR0HS5
	MnMb6mt1AOUl0UDFLePNANKCVtLIZcgXG5cHCHRS77M/HCG2JRWcs=
X-Received: by 2002:a05:600c:34cf:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-486f444108emr16186175e9.17.1773782270211;
        Tue, 17 Mar 2026 14:17:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e931:c430:a510:1d6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f442d5c5sm14119175e9.10.2026.03.17.14.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:17:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to wrynose
Date: Tue, 17 Mar 2026 21:17:48 +0000
Message-ID: <20260317211748.1035170-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 21:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233352

Prepare for the next release and update to the new wrynose release series.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index de7d6340eda..ff14960bab0 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,6 +11,6 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "whinlatter"
+LAYERSERIES_COMPAT_selftest = "wrynose"
 
 OE_FRAGMENTS_BUILTIN:append = " selftest-fragment:SELFTEST_BUILTIN_FRAGMENT_VARIABLE"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 43ef90a9f0b..a36211a8c9a 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "whinlatter"
+LAYERSERIES_COMPAT_skeleton = "wrynose"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 9c801532338..a7d44a55912 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "whinlatter"
+LAYERSERIES_CORENAMES = "wrynose"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "15"
-LAYERSERIES_COMPAT_core = "whinlatter"
+LAYERSERIES_COMPAT_core = "wrynose"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 

