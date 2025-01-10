Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28792E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 11:28:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.16144.1736508532903941278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 03:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HYoBLjE0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-386329da1d9so1035950f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736508531; x=1737113331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfqSovbCwBpOAPS02Z+CqeosC3y3/G5e6HR42f5At8A=;
        b=HYoBLjE0XbPBtRW1eF+1WG8QPEjtTgrtidr8BSRJ2OZAcPjv8VjCS2w7YCPCUElBz7
         aFWI07X1remqoBhfElobrk9D/ZqLto6d5hWdnleZvizJsDcW+20HzwPB/esz2JgMY+nA
         gXSdLSNkuj0hhyBYVYSd8nmLYgrXeAIAk5dAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736508531; x=1737113331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UfqSovbCwBpOAPS02Z+CqeosC3y3/G5e6HR42f5At8A=;
        b=cboAASwRvC1VTLZFsxG8dQmJAOiWmAWXTZLzsX6ihNRY1PKys4a4IELh/+wlodWuPj
         8pS41T/WT6bqqUeHfiPhkQS6d8Cfhz/hW5ex6odImu+HQ342UGtHCJ+mJpOiqoOGbjU6
         AyDimZaXlfLja+T2vP7qKsRwZQrXOUCKlIA5zQxFxM79yttj3JZYgCP+I32baJr7kN1Z
         2NxWBu4oHg56OvCyxWdkX91pIvQg7IyXeWY99rYrqhJHAgFmGzXERn3p/3lum4wxRnqA
         H14kopwSgJgkbSQqPUWeTR2djWf/SJxZw5LLYLuAzE7GMYQIn9S+3cHfGxft0L1jhRMq
         Xppw==
X-Gm-Message-State: AOJu0YzBzEl6h4PH6gyZcJBnz641IXGO8E2CgoF6TbOIXAR+TCujp8lx
	Z1OWaSgFllG+LolCKIilRcnh2qiM3bPVCmwP1eg57KFDpVFrQZkq+nCzZBqLlaQfrT7cF471oBS
	PpfY=
X-Gm-Gg: ASbGncv6WDWwWeEx6vgbEQT9veF5KxptG4kRw89zPvE9aM2svBDy57hDqadFD4vgmjA
	36wrCk5n5Q3ge96ZRIrGAEd8/7jduIZEl73Ii2MX/1J6659FeO/CVS4dQPKM48QiU7lE7dVlklr
	D5eYxTf9JiZ6elpGHQMt1kOaINN1iyCnOou3uHMjS4kdkUBLDG7E4TwQ7v9J7hCuK+6bZZWSSz+
	Xw0VvpnanhwVovLE+bMeiHTLlltuYQUiaaELqA4fsv0mi/X1JY592+PXg0bXzTPkKnhzd3DtQ33
	J9MJZ68R9Q==
X-Google-Smtp-Source: AGHT+IGC++K5ZFQ7wWhWg48TsiDb5b1c3neQFKRWLcYumWwfzZ4kfOXrdDOi2hBJWZJvy6IZGuw/NQ==
X-Received: by 2002:a05:6000:710:b0:385:f4db:e33b with SMTP id ffacd0b85a97d-38a872db2c7mr10242505f8f.21.1736508530745;
        Fri, 10 Jan 2025 03:28:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm4244637f8f.80.2025.01.10.03.28.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:28:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-psutil: Fix native dependencies
Date: Fri, 10 Jan 2025 11:28:49 +0000
Message-ID: <20250110112849.158987-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 11:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209640

The tests package has many dependencies which don't BBCLASSEXTEND to native
well. Remove these as we're not interested in the tests in the native case anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-psutil_6.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.1.1.bb b/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
index 854161830a1..9cd2d20fff9 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
@@ -35,6 +35,7 @@ RDEPENDS:${PN}-tests += " \
      libstdc++ \
      libstdc++-dev \
 "
+RDEPENDS:${PN}-tests:class-native = ""
 
 INSANE_SKIP:${PN}-tests += "dev-deps"
 

