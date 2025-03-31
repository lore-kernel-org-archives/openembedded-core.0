Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916E8C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 13:30:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.52009.1743427850120825102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 06:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ApgVxPcR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso30098635e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743427848; x=1744032648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3KR0eyY+v+0+T/oyxYw5DTgbHxqP0wUrZPMRKRRRsg=;
        b=ApgVxPcR0+gmm4crj6OClT19rbRIxZR1suc9nYe6pCy7k8QPt5hqNC8z5ltNLMJJ7J
         sfPKuXJ4oC4bFk90OMroZVT/SwhRyGejAQsUP8APxbo24ijt/nz4neaGxMSVD3t7v/9G
         7eS0kWFrCwiCUpYaCQ15wimCPjp1k+J3Z6b8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427848; x=1744032648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3KR0eyY+v+0+T/oyxYw5DTgbHxqP0wUrZPMRKRRRsg=;
        b=XDFl7hFmj9NB2Z/PoaCBleufi6AhIxTkeX8BHacX+KVuMy956Fpi0gfvzr+pzoPg5f
         EDiYbmI2uYKStpS0d8GfmVnJVcLBlY78haxEJ0iruQMG2GbWLicIMkGYa2z5OceEZBsM
         nDB+dnlsJKHTGChWuR5FxwwRf8+dy6VtuvrHUyCK+UoKGhhvhCu5x/9Y14WLCzJxZjpQ
         oJBqMv4M/yupjt4TuHq7wKuyxLDVZsdT8MOMSFaIOGEiLe5IGVIjq695/ExJjBBcP4DC
         fH5iVXizAeU3fcz9ADn4L+cAZkmXQltzbxpI4in7u2lLYPdPPufYfu/myzieBgZ8CxDz
         lBFA==
X-Gm-Message-State: AOJu0YxsQpHnojliMiu1ardjkgQ2IfwHpEVTpitveEizkBpzqwWF1ioV
	s9QrUJwjSD3Gk4YIhYpvrtFhi0cWCuOj3ieHbGIxQNCAnj9hq8d7NzIV8IKcn9TbnABDmuqxKUR
	v
X-Gm-Gg: ASbGncvsCyu3GwOO3UtP7wxvlVraaR+uTE95+cHPvDTigxuyBKMCLlv70erRWWbaFih
	aXAPoMWPLE/JhkmT/cWQNVKTYwcn/QPji7zzWzGE0S2dC8WHGCUgE+kegeXqPtaPRtBK52EsINs
	r8w4OevBROgivA+MuQ5ta9OQO0IqiMMrxTRVKRH33h8HwoY8qPxPVtzt8GJdiLBr4lRb5y7B2LE
	fd7uqBLcg1xFH8iefRbP0ipJgnmrQGuipRch8+UV9LXdzA6DtFD4KvrXQynYvwrjdemF+yCNco2
	DfPNPepK5ZzaviAAzZWkb6k/UInWlLIVUjus47zamBbPodGdIrgFEK2joxxKD5E5CoopgXw9SpR
	LQPmERuh7
X-Google-Smtp-Source: AGHT+IEt0Q01ODAEJdds6H5/VFPB/Dilh3UwdFwKdPa3F2n2azU5yasg9GiEgg6iI9WAOo+H60Fvvg==
X-Received: by 2002:a05:600c:470f:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43db628b92fmr72601695e9.20.1743427846227;
        Mon, 31 Mar 2025 06:30:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aa46:e141:94a2:8b56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff03715sm122774195e9.31.2025.03.31.06.30.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 06:30:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-llvm: Compile llvm to use dynamic libraries
Date: Mon, 31 Mar 2025 14:30:44 +0100
Message-ID: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 13:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213979

Our main llvm recipe uses dynamic linking already but rust-llvm does not.
Enabling this significanly reduces the size of llvm-rust to about a third
of what it was, which is a bettter configuration for us leading to smaller
TMPDIR and sstate objects.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-llvm_1.85.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
index 6a4d2957288..566348c617d 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
@@ -44,6 +44,8 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_FFI=OFF \
     -DLLVM_INSTALL_UTILS=ON \
     -DLLVM_BUILD_EXAMPLES=OFF \
+    -DLLVM_BUILD_LLVM_DYLIB=ON \
+    -DLLVM_LINK_LLVM_DYLIB=ON \
     -DLLVM_INCLUDE_EXAMPLES=OFF \
     -DLLVM_BUILD_TESTS=OFF \
     -DLLVM_INCLUDE_TESTS=OFF \

