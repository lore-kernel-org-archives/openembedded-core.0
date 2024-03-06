Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2FFC54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.16304.1709742229458337474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AvARsApN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412f55695d1so6364265e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742228; x=1710347028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th93Ra4sybPd5pgxU3onuO3PZU/oxxWftu4exHwoGjw=;
        b=AvARsApN4O5rgMo6gr4QRH+QgB4caxsHCgSJ5VJI02D8jGSjQ1KcihXB8XBRL9rxxH
         rChFz+lOaM9D/VY7TtwZ2c/3q8QLLjiSxdb7mKxbBRuxhDMVrctdotek3qMi1/BFN9bw
         tQyAShokvJX+FFxVHTHBkJuG/FsUZXI915W9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742228; x=1710347028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Th93Ra4sybPd5pgxU3onuO3PZU/oxxWftu4exHwoGjw=;
        b=w7cPheQsreemO+2VzwiEk9+gRcwnTbJ5HzzBt6ew/lr2Ru8Ef00cw4+Y2Ka5aqtjCT
         CNZHU2oef/KvbBRRxYG8vj5JDBseaPzMYDdLUHGG/+M21WuBzcpoAyRQU+RNKI0HFbDd
         Zf46vsUwF4lLXdHTsDExHKUON02TsaN0UQoDDwq2ce/pfFscOIHsOVHYin36AtSlzgfJ
         Fo4p4zplRr2RbRQu5BZwjGZ0dVJTnFBaE+5z+6rDqXNprg8yetSg3GOPn1pbzOsW2GAH
         cPlLWbOsi3s+KUdndpmFxN2BSRxqO6FPPVgrg2CYDqcWTX0ufkr7tesgsGcwLQB2/YIp
         Xmmw==
X-Gm-Message-State: AOJu0YwyrVeChZQJKY3qAQPuc6MX6xmyX01rpd+RCLdsakakUjZaM6FP
	uz7EKDnogAobMLk/hrM5izlI5MeP5jrnCiKYdUq80nu6yx6Ehd51xUj0RNalR6Efrg5iFdbSGEq
	D
X-Google-Smtp-Source: AGHT+IER8Kj4aSRfK6avphG+8Idq4+TjuCdiNSav2nK3LtGqY81HvOAvGrbYc5xWgXxURfb0fMKGbg==
X-Received: by 2002:adf:edc9:0:b0:33d:1d57:6eb1 with SMTP id v9-20020adfedc9000000b0033d1d576eb1mr11969008wro.32.1709742227850;
        Wed, 06 Mar 2024 08:23:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] oeqa/runtime/login: Mask out the mouse panel icon for now
Date: Wed,  6 Mar 2024 16:23:37 +0000
Message-Id: <20240306162341.2267587-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196739

The mouse panel icon can move when the time changes between 3 and 4 digits.
Ideally we'd fix the alignment of the clock on the panel but to get the
tests working, increase the size of the mask for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/login.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
index 175a60c48ca..ac8a0454f38 100644
--- a/meta/lib/oeqa/runtime/cases/login.py
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -84,10 +84,10 @@ class LoginTest(OERuntimeTestCase):
                 width = subprocess.check_output(cmd, shell=True, env=ourenv).decode()
 
             rblank = int(float(width))
-            lblank = rblank-40
+            lblank = rblank-80
 
             # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
-            cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},10 {2},22' {3}".format(t.name, str(rblank), str(lblank), t.name)
+            cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},4 {2},28' {3}".format(t.name, str(rblank), str(lblank), t.name)
             convert_out=subprocess.check_output(cmd, shell=True, env=ourenv).decode()
 
 
-- 
2.40.1


