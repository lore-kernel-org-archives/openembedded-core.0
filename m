Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B4DC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.31704.1742141539044877090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wcixtq11;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3401325f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141537; x=1742746337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+42ukw2joLFWUGls/bXmqphjvBjImYKNsJTcJTMUc5g=;
        b=Wcixtq11eMsJbDE3ikzS2P1JWt0zG5NrKC2v+6MLsk6icl0jHyvpwWVjNaCEXyg4UO
         4cXYgwCHxSjUxtSuvZUlsJJWLpAZV1WAFBx8il7HJ797BWglrP8JzIJevQZFuIqX95IW
         052JzSTamtIPZIKZVWxtjpmRpL8cjQYb6g7ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141537; x=1742746337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+42ukw2joLFWUGls/bXmqphjvBjImYKNsJTcJTMUc5g=;
        b=JIq138f1dUR+OuD4syRXknPLk0VGHWGxzqQXNev4CxMoZO3IjVQ8cxC9fk9QGXRT7u
         wP5w94KvL9eaxY8zxht8MCw0ESF96OlPTY0tUwOnlB+qNQIiff4k0Xkj08Zi2QQJ2Z0W
         /BJWXrVMXYP+pgkRdqz+PT/1DAOmbSmoCsmIZrsYCqOoyFXSvpvW2xHMOM65vZ8NEnHL
         yjs9ZFjuSTAHXDfDK/qXvkgO3Vn2bYddtLgsA89VJCo/n/VKwdz5MAUoq1yxRW5USCgl
         RCHpkgmF6Ouzpl+UN0yQoW5q3lcyJvvMN1A5xPp9zWgIT5CEX3cSWA4CC8qS4u0vhEp+
         hfOw==
X-Gm-Message-State: AOJu0Yx7WNN0mtHkodlDxvY7Xpuegj+e8LksbyAVpJT91nH3cuVe0ToD
	XHx6xOi/uCENjUKH9Vg30x0rrgMn3dj7HDWP/ZedVIJYLolPPlgHZsOj3E4UpnIzmg9vbI1uQuN
	g
X-Gm-Gg: ASbGnctZGXJuVmh6ibA8+IOCvK2MpMhs/UcqC68jZ6kR9t6Lc/QBwexKXDl49TLvYNI
	N/vXVQ/rBelz3fLosHWcI3CVQogB6ArJni3iY9jjT65xFpYe7D6UtTNFrWW/eLBO5KhBl9q8BUd
	W/xlyFOi/KRtZs+qyp3ePwBldjRyLsuNw7IzQQ81u1qLaW+XuT/FAzPqQzIpiEVwGgm4OGLm+Ce
	KT7Ry5KbwWq4uZGvn0wIKEzuj8i/6qvaN2BMMImRj5t2PLIqNKc7SbNUu/zxuRnqHZ5asPFNpKw
	k+fetsWfSaoUd8ZUldlIDcjtqFisDx4cGDfRb4FfBF9/nZh4QfsR20GVLhqxZaXbQyBN27aPRA=
	=
X-Google-Smtp-Source: AGHT+IGUAa7Wg5kHNinfG1lmYaZSvDog4tvxQ2f/b5BdyKSsM0s72n3EA3sBMLebQOazqVZFJMaiuw==
X-Received: by 2002:a05:6000:2c7:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-3971dce07bcmr11347107f8f.10.1742141537128;
        Sun, 16 Mar 2025 09:12:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/43] fastfloat: upgrade 8.0.0 -> 8.0.2
Date: Sun, 16 Mar 2025 16:11:32 +0000
Message-ID: <20250316161209.3629986-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213009

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fastfloat/{fastfloat_8.0.0.bb => fastfloat_8.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.0.0.bb => fastfloat_8.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
index 6426a1d2ec1..b3f45ccef45 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main"
 
-SRCREV = "77cc847c842c49e7e3477c1e95da2b6540166d66"
+SRCREV = "50a80a73ab2ab256ba1c3bf86923ddd8b4202bc7"
 S = "${WORKDIR}/git"
 
 inherit cmake

