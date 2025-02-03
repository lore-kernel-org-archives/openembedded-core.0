Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40326C0219C
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.92658.1738600912177293952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hCVdLHHH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f796586so54740695e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600910; x=1739205710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MPhjofszWG4DDOTNA5mLW70xeX+ia/PF9PihBzLx/o=;
        b=hCVdLHHHPaU8CuKdPwgAltnqtnSTRQQgVQXrpZVtA5n/+Elu3XkvATHC/CFhDapCi5
         PUlCLOEN53wPPYy6ZMFpC7t9DGMfRGk1NzxKyw9HkUVNIW3LVxSNwp7AnigtJBVcuBCE
         tiW1SCdnAXoIyt/MBmqqOLgJNCJM6KXMlr5ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600910; x=1739205710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MPhjofszWG4DDOTNA5mLW70xeX+ia/PF9PihBzLx/o=;
        b=Naw/IRwGm6ZLD7GuDtIKfDy68+r8LnqK6vywe2DsPMQDDsqo8a7l7KrS0nD6SAAmvU
         Op5Nyc89XITxx/8XA47GMEUtT3FN2RXNWRfHFXrEnSy4urD8gA2QqZPcE/61+uS9hFWv
         g0YFpTM6YaDc1Gi9ynK+MhKhPNhDiBnjZ6H9dKnQWCjnulrnvlC94qM8SWL4ysl5HrKc
         /vLtHP52SKss8Mbvlmig7roSSgNSGU9o8T/6QfLKa9mf4MtxbbG6ViV2sTJ8vwOv6puW
         xut1nG9JXZHxlfgzUgqHykO374aw/I5/SLk2hGZOx/N7HsO8bckfo5SBCB4GsZrVynLG
         rMLg==
X-Gm-Message-State: AOJu0YysiZLk+t2ANCkxaehSVEPe8/yui5K5MfJeP7fhxNJkkrIREh7m
	P2l2Yy3NdOxZjLCC/cbGIV62iqtEBOCqkniszdGOT9DsmHisH2uyUBGcBekjJSOxl2agAz95Iv1
	W
X-Gm-Gg: ASbGncv7GfS/cDg+UeJvnSQNwSSPiAZY0UYWdH4g4Y6aReAGMewsr7qpeGDYwoE3qZ/
	oHdn5XrsWXnl3FgPk8nqwxNz/yU5v1nP/NFMd4qozaZLgeiLk9Gim6AD1nJXCVcum48YBilHmvQ
	EEtJOrauHbDcrKXjpqnDF8RD8RR72g6uhItHrAjYpEFMm/CakkvTuF0z+5duvcnXGLdc83MPmUJ
	34VFNEN9YzFaBMTStpAJt4koX8pT0YDg8bddlB+XLpqQ1aHEsUpSHlKgGhNq4n8mNkp0toTDkYb
	Sh+UIsZGVcBGFfBaX5f/e3Fa0dMuzXn3zJF9ie8emSMn
X-Google-Smtp-Source: AGHT+IFNBU7BnJGgRpch2r+2ypk+Ikk3u+oVsnwSCCCl0+HW5075hcMtQYOXsdmpEOocZ7y3oScHuw==
X-Received: by 2002:a05:600c:444c:b0:434:a734:d279 with SMTP id 5b1f17b1804b1-438dc3caef4mr251998245e9.16.1738600910297;
        Mon, 03 Feb 2025 08:41:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/46] libwpe: upgrade 1.16.0 -> 1.16.1
Date: Mon,  3 Feb 2025 16:41:03 +0000
Message-ID: <20250203164130.3403325-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210692

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/webkit/{libwpe_1.16.0.bb => libwpe_1.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.16.0.bb => libwpe_1.16.1.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.16.0.bb b/meta/recipes-sato/webkit/libwpe_1.16.1.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.16.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.1.bb
index 57f91ce87e9..083e48b2cb5 100644
--- a/meta/recipes-sato/webkit/libwpe_1.16.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.1.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a"
+SRC_URI[sha256sum] = "9cca60f2c4393ea0de53c675ebc3cdbe9c5aa249259dd1d6d81a49b052d37481"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.

