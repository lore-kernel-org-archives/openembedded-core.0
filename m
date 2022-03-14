Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4C2C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.3341.1647298137381933964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NMrIA9I3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so415894wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VdDcJbagI+Zb9MVh6OGe/zAJ9pVnZiLFskUQUJ+3zXE=;
        b=NMrIA9I3Lc8a41olV19eTfxhA9d/N2je1/0ortstgQvJkzZG2JqRw2rmAFKQcr2MhK
         JzRHqVTU3mNuOVOaIg9bzCcuhDPYV7v5i7rlpInyNhx4eo73K01E1elZMuVPHpKgUzXs
         CtO8z3gI2yyOURldo5fpyzswwNw4DxkAxrthw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VdDcJbagI+Zb9MVh6OGe/zAJ9pVnZiLFskUQUJ+3zXE=;
        b=nES+CPRDPjfNj0/4BORDmzwpT/4/WSqFnlPm8YDAd6JY0Eu8i6FLJUyn8VXOhw8LY6
         EdB9tJyePIz0M2Pu21YQc7/nN8YjDZQCCJMnnmrhfpiMTkDNSmtaC2Cy6QmgkMwi3Dee
         nhM8U+vgesUckM10o3rs1On7YU5GqMMA0CAj59E4xQig2pcyir/2ZU60p97qs0ej+E1a
         UZ0Nr9nBPNBPopOHHRtlJ1k7Dr2Ol3xgguStum+bc5CMrDZFSt2DyRjkBpOErkBcxEIc
         XXXZZpmwJHipnTrA90bgnBNLl5aJQxUeILv7OGLCYKcJpzJQySZnfje+TGHiJsrYyShi
         YHoA==
X-Gm-Message-State: AOAM533aPumr5eORYPNTAQpcg8lc2dxn6/OXLl8rc6lVj2IeIAJvByjx
	ZESMeA+Z7kmtVYGxhR3griUozj9L59EyICbd
X-Google-Smtp-Source: 
 ABdhPJwGYJ7Vc2vcTTLk5X7fa9hs30x92XnKyA7M+OYr3Dehu6fr2X2kNa22Mh1LLr8QIK5PEdtTSw==
X-Received: by 2002:a7b:c154:0:b0:388:8e6e:ff76 with SMTP id
 z20-20020a7bc154000000b003888e6eff76mr999442wmi.191.1647298135614;
        Mon, 14 Mar 2022 15:48:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 17/33] python3-iso8601: move from meta-python
Date: Mon, 14 Mar 2022 22:48:21 +0000
Message-Id: <20220314224837.834776-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163183

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-iso8601_1.0.2.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-iso8601_1.0.2.bb

diff --git a/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
new file mode 100644
index 00000000000..aabc47d69b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Simple module to parse ISO 8601 dates"
+HOMEPAGE = "http://pyiso8601.readthedocs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
+
+SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
+
+inherit pypi poetry_core
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


