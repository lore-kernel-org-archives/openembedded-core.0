Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88696C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:28:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5833.1716370101819215846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ExGdko5+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4202cea9941so38513855e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716370100; x=1716974900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctyfd0pYVWbDeUUCXtZrRzFklh68amOhsFdK4pFP4M4=;
        b=ExGdko5+813ULw3lHUmNe8Xan1FXhbUfsdqhHiLfQmj36PWUo5y1yQbvXHECfZIPTP
         bxqUzJQtdyX7J+bQWszvzG7ZcabbaBAvxrK0ytdUs/5PSS2fJlYIxNWlLYayGFzqt2kW
         6lVns4gNLczmIdwLrX9O04kpOujWalKAWkJ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370100; x=1716974900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctyfd0pYVWbDeUUCXtZrRzFklh68amOhsFdK4pFP4M4=;
        b=hx5+DdAuAnCFksgNS41lE8wHj2nziL3zG1iokRLhlxou67IJxYDnYXAoJ7XxLa8tPs
         yISHrEQKMyRQNvra+uboA3JRXev+vt3HpmcTjf1fjHTth2DdYDs+ZSAilM+zhz/bOnHm
         hsxYzdMvAZJXNdJ80ulHgRn0v97nBQNQAxLKXPV6lrByzQrWzc3jiNiorXNMgvfabu6o
         Qu9aVf20TQ4Uwx9TzzM5fgqE/66tqsvF5rW/oUzbp9NxsGTqob6BhZSmCOOjBEzQtqgg
         JoxZvR1bKGZdzsW4lBcFD36kajQfJ/jAZjFL7pU+UD3t5feHJLl0rv0Rz9ot+hrCIT1k
         fv7g==
X-Gm-Message-State: AOJu0YwWRJi7pFaBWtLP2ZsZVEWz1TvEbq1g46M+7lHZOog9M8pshgFt
	tECsSBt3yLKDB9f7cZTkYd0TWnvg/aqx0vn552dQEOhkX+GTTSb8G5WjPtjn+N+68UAolezJooC
	23Lk=
X-Google-Smtp-Source: AGHT+IF3f5svFAAyzx+Xhje3geuDPsZyMJb+VxsHlzQOdJsSfmC3hhpvv1vd1TJ3hvtJxsd/hSgHog==
X-Received: by 2002:a05:600c:22da:b0:41a:c86e:a4db with SMTP id 5b1f17b1804b1-420fd2fe98fmr9736365e9.9.1716370100037;
        Wed, 22 May 2024 02:28:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe36f373fsm470058385e9.20.2024.05.22.02.28.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:28:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] insane: Error for S == WORKDIR
Date: Wed, 22 May 2024 10:28:17 +0100
Message-Id: <20240522092817.1250809-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
References: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199740

Where a recipe uses WORKDIR as S, exit with a fatal error since the
code is no longer safe for this layout.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 03ac06b102f..eeef43d00e2 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1602,6 +1602,11 @@ python () {
     if prog.search(pn):
         oe.qa.handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
+    sourcedir = d.getVar("S")
+    workdir = d.getVar("WORKDIR")
+    if sourcedir == workdir:
+        bb.fatal("Using S = ${WORKDIR} is no longer supported")
+
     # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
     if (d.getVar(d.expand('DEPENDS:${PN}'))):
-- 
2.40.1


