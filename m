Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B84FC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:00 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3408.1647298139377442650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ha8TsNmJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b19so3971656wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HgSNipXu32xDQb7Lq57YE/84lzAoKZQRG9IWWx8hMQ8=;
        b=ha8TsNmJaIqGr9Qve5ubecNoGrgX8wXZ8iSiiWvMlYxUX2amWbMZLYnQJLXiZFYCJZ
         q0zYyNJ0AQiGtkksKaRQH5jORXFtwL7xbpCSh0enbcp1k7GDWsJB0Bt4o9s/vPGYmawt
         vCld6A2bOJViE71Pus08DvrKrZILZy+MPuNgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HgSNipXu32xDQb7Lq57YE/84lzAoKZQRG9IWWx8hMQ8=;
        b=gBVohn+2WnCvHAyxUNqWYE8n4NqOYY1cTXsSyIL2QUd5vcIq+Kw7hnopA5w+dbki8J
         X3MGzr/OkOVY0z5Ptct+u94ug8yyOdrKTBqsJA26VOOCF65yNFGB9yS8FRrduurHgkGV
         LJHouPR2/UkBC3Mw1UMfwjmnZZZvbuTL3y0ljf2XYe5ZPmr7EOpmFRAbNKzYMSU6XAJF
         njXdczbr7aX7i2/c55CIRXw8gNrOUPVelSOBwUklQVgtgd60/p9c1YMrdT7rQHELClNH
         TZE/HLqC1Vt1DPgAKP0EXyD1OH/7EDuASGpC8Ze8zc3Qj/Q0IB6rsL2IPE+/8/HUee5M
         4nuQ==
X-Gm-Message-State: AOAM531ss1HFKWD9E25gKEll2hIqoz1W370jifRqitssNoBhNxCdAJtu
	SDD9ifr1Tb/3GVOl1+xBzOCdbEizxmILpWNw
X-Google-Smtp-Source: 
 ABdhPJxkWvXBtgDioxVSNhRmKs3vBOz1Cr9U7O3CYfI1r/ne2O/lwhCIIKNPbW8M3+dWXq4pScucXQ==
X-Received: by 2002:a5d:5982:0:b0:203:812d:f0fe with SMTP id
 n2-20020a5d5982000000b00203812df0femr18315511wri.520.1647298137722;
        Mon, 14 Mar 2022 15:48:57 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 19/33] python3-semantic-version: move from meta-python
Date: Mon, 14 Mar 2022 22:48:23 +0000
Message-Id: <20220314224837.834776-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163185

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-semantic-version_2.9.0.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb

diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb b/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
new file mode 100644
index 00000000000..ee635871bf5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.9.0.bb
@@ -0,0 +1,12 @@
+SUMMARY  = "A library implementing the 'SemVer' scheme."
+DESCRIPTION = "Semantic version comparison for Python (see http://semver.org/)"
+HOMEPAGE = "https://github.com/rbarrois/python-semanticversion"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fb31e3c1c7eeb8b5e8c07657cdd54e2"
+
+SRC_URI[sha256sum] = "abf54873553e5e07a6fd4d5f653b781f5ae41297a493666b59dcf214006a12b2"
+
+PYPI_PACKAGE = "semantic_version"
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


