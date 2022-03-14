Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5DCC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.3342.1647298138697966646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R9QP+c6N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id q20so10199104wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRYw9tUM1sX7J5slhUdCKihwdrJ+IZVTdJWGyzeV7Sg=;
        b=R9QP+c6NkbIZh5Bn2VJ2gwfsNxCgqwJhwnxnv30ZbZkebrw308VlkUg4gJMmvKNkvU
         +P3ihDbxZIc2zSRgVZmQhrU8yKn4MQ+N6z3/exdX2Bxo2P6nWtIlIigSmGN//YV48Cxl
         lRQo4hWFRCLYPP/L8i7owcPI/trxUaQn41S1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRYw9tUM1sX7J5slhUdCKihwdrJ+IZVTdJWGyzeV7Sg=;
        b=FnqlEJSO8ku2AAsP6Rl/gqGaEMZ5HRliawdUKcLtyKV/s8HuunOtM5tNQSnkjk7yiW
         duS33LDF8ooCw7E92TY7RRTgRpjNcfpN4HoNwwW+UEk+UnKwjQ2x5HLPjEvCZOCNnWIx
         PlQsh7T4xUNouvWXZsH63d+MMr1X0U3zmNVWl+IW+/dSHRrWUc/AMyZMj1sTW05KGia2
         rQGmrbiJNclo8vf1k6zMCdBHV6bZECBGUyoFUxnC4KbedLJb4yuSVVc3vYgyeMNKgFre
         Et/TyUtXyXzwunJeHztufTSYp4ex+8FRFr2PKSwYZizODBayTAQizGPo6nji3iT9Mish
         fI1g==
X-Gm-Message-State: AOAM530SrSBGRk443b4WemVaNqY+q1rqxF5vu75H4LJ0PteTQmieqt9y
	Azr+oyRy28pgkJK80DD68THVuMra1VHW/coV
X-Google-Smtp-Source: 
 ABdhPJydu9HOSf/F0t5EA8aW4ZZEquunbiL0t9m+b0KUL+dZDoTNCrcI9goEDrt40/hVvHq3X+JBLw==
X-Received: by 2002:a05:600c:19d1:b0:389:d567:e9a0 with SMTP id
 u17-20020a05600c19d100b00389d567e9a0mr929426wmq.137.1647298136832;
        Mon, 14 Mar 2022 15:48:56 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 18/33] python3-typing-extensions: move from meta-python
Date: Mon, 14 Mar 2022 22:48:22 +0000
Message-Id: <20220314224837.834776-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163184

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-typing-extensions_3.10.0.0.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
new file mode 100644
index 00000000000..a5f491c7700
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
@@ -0,0 +1,12 @@
+HOMEPAGE = "https://github.com/python/typing"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
+
+# The name on PyPi is slightly different.
+PYPI_PACKAGE = "typing_extensions"
+
+SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


