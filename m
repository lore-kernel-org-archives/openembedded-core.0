Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1591C35FF8
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.31730.1742141570349748747
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U7HIUb6Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso8444545e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141568; x=1742746368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuBRBrMNNf2iyf5x0Y79RFy369Q4KtRVPu6DI8nEXKU=;
        b=U7HIUb6ZVBh04uFhFhBf+CCAY6sykC/H+yJr/VZByrzQQpHxb63Gs5DL0OA53bmAsF
         bRmf+hoPfPQMvsOrnzn3GNm7vbcldT+2OdNi9gYLXsGwXPK2RzlUZ4i1EMtYcF9bvgfc
         I7V/Tr9rWfpDY5IX5G+tmIUgshTqd/j2Uy5dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141568; x=1742746368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuBRBrMNNf2iyf5x0Y79RFy369Q4KtRVPu6DI8nEXKU=;
        b=NQxmRWWOWRi8xtKbA69Spmrdl3GO8boenDC+ojGqHXX/k5mMhpfBiKZ517xcDuKo09
         LUVQlQTnA2XIxXrATIQDF+O1CXYC7L4FwN5gBfuHdOMO52xHnlHImp/cs0zXanMVaZEU
         felh1azwJkuerC/mmpJJ44YlrGS9ASCjEV/yeXHWDdosay/wdRlV9gP71fGKqJNpkHpa
         2bqSFjNW270UvDywOLk6uIx7WLMhtZOVgVSeG4BA12CaHfDaFH/jIVQH+xKMWsfbN87b
         qQSpJjIOKQp4h+dTN4ovtqpvAyjA1hHZMpJvJvcecBtSPQhWgQhvsqTGjHWoniMzSSs/
         qeSQ==
X-Gm-Message-State: AOJu0YxERscVdI0dmRAegFPdJaDthi9o23C2Tau+Xeauslezi+uzSlvX
	Y940b9qV/ZerhvBfPflaKWGXI8MFO6wFse1VRnCgfq5DHjre0BkKSu6+hF+yrniYKQhyf4I/7NI
	M
X-Gm-Gg: ASbGncsUEDRqC8BNXhuaCOGX5VFj6SzgcFwB7llt4qDCKN8eb1Dl+Eju2n938dYpj8t
	IrKfCL6mBe16XwuoYJqAujftaJMa8RvRG2URJWiQBGbZBVkFSD+lQETfPAV3KOfnLyALNTbKk22
	6P2Rc90wcOHc7J2A+L5z7pdwVlzUC12XbZh7NkvpQVs0WP+KY6zGVX5t7DFS/5f3evPQTBKT/Wt
	0CXvlywGxr0AYjr8PuNhLgArv4hWkeKrWurmGDMfbpJDkuqK1D+trl+gnkdDdRunTn+oKI8GTCm
	MwdIWUCBviM3ZmPXHgVglnKhBRydhLGlWpTTECiTqLEFuaVH5P45rzIMd5N2n8amJVO9WRkKhA=
	=
X-Google-Smtp-Source: AGHT+IFGLZb7qBlC+WgbBtv57Pa+nW9cmNJEqSQOqEN02qC+GrY5RVfdecAlUYNcEjaaBZlmfFHgoA==
X-Received: by 2002:a05:600c:4447:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d1ec646demr100302435e9.4.1742141568446;
        Sun, 16 Mar 2025 09:12:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/43] python3-setuptools-rust: upgrade 1.10.2 -> 1.11.0
Date: Sun, 16 Mar 2025 16:11:52 +0000
Message-ID: <20250316161209.3629986-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213029

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...uptools-rust_1.10.2.bb => python3-setuptools-rust_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.10.2.bb => python3-setuptools-rust_1.11.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
index df39d61d865..fd6ebf2f613 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc"
+SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

