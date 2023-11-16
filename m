Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24527C5AE5B
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:52 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.20271.1700174924320634365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=haSSmmbr;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so1957304a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174923; x=1700779723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoQ0E3pbkkS+y0QW/y7zkIXHnqISclla4keoR5O+9fc=;
        b=haSSmmbrrPCkbezevQa74N8SRkvw+2IM2KtcamwatoKTKSTImvsw3WidoRx5vdrxWq
         YX7l7p5yVmjUeZZS1RwLnJAqAO933xH0sbMzw6D805WCVjbfH1ZowI04OGj1HVKCjlml
         pf0H+wqVGeaBrjOnAHI5VgV5a7WV8/B6p12Pf4XUg4zZaPalpGq/9wUgk9mvou3+InKL
         Lcf825S985AOZnXUO48kNsbkosERTQKKYNU518A0bXfGAAXSyh0E0OG9Y/Wjr0eRfTG6
         g6WE6zrcDO/Rp3hVqMCBVE7YcANQBoSLRpFd1WKC3pRduKbwGlZeNcSw3h+j5izGuLuH
         NgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174923; x=1700779723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoQ0E3pbkkS+y0QW/y7zkIXHnqISclla4keoR5O+9fc=;
        b=h5mZNfCLr1jd6utfYrRSudtjuwXZHO9A2weBpxAOyeWISUrFofLP/JqlVPM99awiOY
         CrpSExpuSb7ko3mzKLTvR8TTKIJaK/bZF8SC0TP7/mwa58aAa0Ajkn6EUu5RHEsPIE48
         6P1GVi+Yo2uEoHjsS5a+ZNjZMf/RZS9Ue2WmjDmqKLVQKhivqBDX1vHppTJ2EyFzEbP8
         Q9MDqi9ndCqy0hLl5ysw0CAYRRV3dRJClbfO5AAXtQ4RQE5RktO83BuPXTo2jpgJBUlJ
         HWaVzfdbUI5mSuleoTktrmPveoUYtKJWUwKoLc0tzGh10/3Ii9aLa/UZd0ltLpXrllxC
         v5mQ==
X-Gm-Message-State: AOJu0YzyAQNLNvnO+l02tE41NTBctJUEp9tD7684Uf1KeaDYcHssJ3C9
	/pnd1yTaUFaDF/UQ4r7UjjDqWbCjoIM=
X-Google-Smtp-Source: AGHT+IE7oVxjGj2HD0kFjhApTbUUOz+9qjJ2Ol4mVKSKsNNmIRubEQcZeNtxlKJ3MnBcwMl2ns2Xpg==
X-Received: by 2002:a05:6402:35b:b0:542:d895:762a with SMTP id r27-20020a056402035b00b00542d895762amr11027194edw.39.1700174922478;
        Thu, 16 Nov 2023 14:48:42 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w15-20020a056402128f00b0053da3a9847csm123291edv.42.2023.11.16.14.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 02/12] ovmf: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:26 +0100
Message-ID: <20231116224836.2696913-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190816

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 6bbe21ac5c..3dc031d3b6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {
 # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
 # tools definitions are built by ovmf-native so we need to pass this in
 # at target build time when we know the right values.
-export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
+export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
-- 
2.42.1


