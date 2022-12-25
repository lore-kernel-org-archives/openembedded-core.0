Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E2C46467
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.125282.1672005573826840492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ENPIXjAu;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so23050285ejb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=ENPIXjAuZ0uC1fwGA42O5hWnbSifDB9GCsBGPfwmvxBAo9dH13NNGGxiEeKA21MD3U
         /AhR7Q64qcE1lJ2EptcPyTSMKAYxrtkQRiiFp8dMQgMHouKOtUlpHcXa0J8pK1B6mdxG
         NDUR22Mm0vQMfm+F6xUcIT2ozMpDhrmAUQift/HfZsxVysZyExVrhE19WtJbPaTjdHjm
         5nxzjdN7jEqqcwRSOMgJzlU10qHRJLdM101GIgc5gVYy+sIga7uST/iEdJh3Tkk8BCh/
         KWboyBfZXbae54g47vsaL+SkaX9455WHnHT5lF2ObEFKMfLYEWrz3XnIPFJasMw8c0dh
         xM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4gQi8OuYoeZcVag7RZJ3HkFSj96ezDIqCzNwhzZp4I=;
        b=A/MpLy8yp+vrRXaXjrsz8TgAHnwlxOooxza/3ny+wuK4KRjrSTbAkdKGs6pIoaJ0wL
         6l2vIc0Kx0gXhq6ddyrudFb3CISe+vYPQc9Yf68wUFP2QFsfHN2GTvo0gNWW9WI4WybY
         kmLpB/4VXsOzAlHVEeKBa97H8BEKA1HyMTVvVsF6lmQAr9k9nX/7CbRQFgCYr+O38mu4
         JuNjryPu1n7d4Zd1ZdkZZblBnyNiT61b5UQAZUHTjmTitUD/IGHsVKXolYEwaAe3Ip1j
         2jU1msOoKfFlLQYZ+FBy0RKeJWbqUlPvZIQtGtMkHq06H9awiev0iE0aJIdX4XB05oOV
         t89A==
X-Gm-Message-State: AFqh2kp1ta6xO9c7WqpwGSQhPrFzCwdfwJGQh33Zw8ieenhg3WLlyudF
	JisJ9rzTLry2rNXe2nf2xYGeKwIB+rw=
X-Google-Smtp-Source: AMrXdXtmlw3Y0XNuvx/2mA9cDvAMPkePBDBKE6nfrjGdJVtie0DVWOvTdDZD83WIIh9QbVBBA4o8AA==
X-Received: by 2002:a17:907:8a20:b0:7c0:cfb2:40d2 with SMTP id sc32-20020a1709078a2000b007c0cfb240d2mr17545924ejc.64.1672005572138;
        Sun, 25 Dec 2022 13:59:32 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 02/11] rust-llvm: Update LLVM_VERSION to match embedded version
Date: Sun, 25 Dec 2022 21:59:12 +0000
Message-Id: <20221225215921.12868-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174997

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/rust-llvm_1.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
index e1baeb78574f..4cf244bb67f5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.66.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rust-lang.org"
 
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE = "14.0.5"
+LLVM_RELEASE = "15.0.2"
 
 require rust-source.inc
 
-- 
2.39.0


