Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E9BCF396D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:47:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3746.1726778873190133708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AxlpYPKW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso10433335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726778871; x=1727383671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qe706s36uItgjPa5stZBgs8Nyzf2+qzJZ5uCL3mr69o=;
        b=AxlpYPKWosWD0JqdnBli1xx33I62aP5KOlIMmV4qZto5KUf4SxlzYVWspIGz/uY9DP
         qml3y6qwaOq456HqL+iJ0LVJtqnN/IlBmG7pWbTUIBs3gQMWK+QhE1PdYhRhUAbLDkXk
         43Jnc7TcHUizTrafWRXDTcYu82uR9fIAw1ukk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726778871; x=1727383671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe706s36uItgjPa5stZBgs8Nyzf2+qzJZ5uCL3mr69o=;
        b=C2k0Dm0JCc7O9x51Pw3cX7En2zhxCUki0ElzJH+r5g5nZTd+ti712IXKhfNjrWAlGW
         fAX/g0QO+rYVV/pf3RbfHk1eoSOt4Ao4uVtgRx+gpSNR/igzooEm9P+MvtAg5f4Z1SOF
         9cLi8Z7m9JpKnh/2PfprIq8HRN0Z39n3feiHawq9l2a933zkA1ZcWLHnypiz8hzA558f
         xrkkkqQoZl3XOUhIYNfdwjnpdKOiyhmx2Ac+d2xDhH+1+/STRp5oIMUDqyRATliSkgS0
         uPUl7bGMxBUF/KWDii3nYfW5JbcmAvzKNsTUfbDK/k0nia1196zXxG9+ANbNbsK/vOb+
         dIzQ==
X-Gm-Message-State: AOJu0YxE5jguuAoPtYcVjHV8SZ6RO/TNNizYjmnPWD+XZMyyoBhmWWiK
	EuGbxKkHZkfC20PabGc3Ij9M9qEgN3qkwZMMmCPqW5ckc6PPB49i+Bm1FRoElavIvKcmF5s+0/F
	m
X-Google-Smtp-Source: AGHT+IE9sGZpWrJ0xsP+ongNeVb2yQNQ6wSw7P12V7w6ZOjz0mXTIBrtrZmeTGM4Gg4g4VOpcCYZLw==
X-Received: by 2002:a05:6000:184c:b0:374:c640:8596 with SMTP id ffacd0b85a97d-37a43157901mr168126f8f.32.1726778871226;
        Thu, 19 Sep 2024 13:47:51 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49casm16057836f8f.20.2024.09.19.13.47.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:47:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] binutils: Fix binutils mingw packaging
Date: Thu, 19 Sep 2024 21:47:47 +0100
Message-ID: <20240919204748.4054111-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919204748.4054111-1-richard.purdie@linuxfoundation.org>
References: <20240919204748.4054111-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204715

Use SOLIBSDEV in FILES to fix nativesdk-binutils packaging on mingw
builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e176b5cff1a..e1b903f1ebf 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -18,7 +18,7 @@ inherit autotools gettext multilib_header pkgconfig texinfo
 FILES:${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \
-	${libdir}/bfd-plugins/lib*.so \
+	${libdir}/bfd-plugins/lib*${SOLIBSDEV} \
 	${libdir}/lib*-${PV}*.so \
 	${prefix}/${TARGET_SYS}/bin/* \
         ${bindir}/embedspu"

