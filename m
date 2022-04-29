Return-Path: <stephensportia@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE481C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 07:35:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.7430.1651217719823830696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GhCgowVF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: stephensportia@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 7so2031753pga.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUabg85yUmuut6n5hBTv1FJq1GVqrz3G7s3XDxsGlRA=;
        b=GhCgowVFyVS/SJ/KIWzdlLh0vES/KOq0+UVXA1UHo9ooD5ghF/SxnzfamNNmnX7A2T
         jJkJn/19FRZViXU6nEJvAIAeb04L+/pMFcSmcXciHUBcYtPS3+iZ7+FWEKhIM5ggaY9K
         0CADXxMp+8yOkc1nrj+3FlqpB3WNzJVkpH6zZq5akfh4OSMteuvkddMndzJd22k4FFGE
         2Jie//dz2Z1B28t4qDeTInXrsMW/xBRstOlfZbozzF0Wgdf/wNI3V5nejjAML4dnqO5g
         Tw8eM6gUPze4EaxdiFVXKYUXmgd7ye4KK73V8X1BivmTejGHuKlPCAOd//lKp7B0v8fH
         ELgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HUabg85yUmuut6n5hBTv1FJq1GVqrz3G7s3XDxsGlRA=;
        b=yF3Qs/9mWrleZmqRfDY7PQFv/Buy/oJuukwfRI6QPkMf5Y1DUh9XFs1HwzTg0Qiaya
         cUq1WSJHoMRgj3rp0pabqkFyHQI6rcCIkBU6izsScZ/QzdYIV+UmXXI0jb+XfjAq9ZSg
         XgT/vkiVdWmTGa30WOfzHai/h1dp9rSwKUZUvwSH2hA0dW7+abPVyp8gGho/rcSKWEuj
         M8ZF4zvQj6FkMAOU+8W8C5hiXwxZE5zNW2FLfUvt7MJOkoA1uwZ3RLuoAeqYOsRrsQtl
         MR77fdguq32EBJLqfaOdaQOrylfzEo+WGjoFbltboIUsS/p/vmxqnby5kNq9GHmsj0JU
         FUbg==
X-Gm-Message-State: AOAM530Sr8xvKEU8/XuwcLjh91oSfGQ8Z9ltOhn3BHLv+jiVhjiu4XCc
	IMQul45ay4yIcEPu5izbrrx7P/GxVpo=
X-Google-Smtp-Source: 
 ABdhPJwlQKtYy3AfBjjXFROqShuf4/gu02PSkPu8j5wDH43U/uEzz5FizJlrGaX1GKKcRTQn88d0VQ==
X-Received: by 2002:a63:d342:0:b0:381:fd6f:4792 with SMTP id
 u2-20020a63d342000000b00381fd6f4792mr31070758pgi.101.1651217718930;
        Fri, 29 Apr 2022 00:35:18 -0700 (PDT)
Received: from fembot.alistair23.me
 (2403-580b-97e8--28bc-2181-11ae-b80.ip6.aussiebb.net.
 [2403:580b:97e8:0:28bc:2181:11ae:b80])
        by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm1940490pfb.184.2022.04.29.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 00:35:18 -0700 (PDT)
From: Portia <stephensportia@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Portia <stephensportia@gmail.com>
Subject: [PATCH 1/2] volatile-binds: Change DefaultDependencies from false to
 no
Date: Fri, 29 Apr 2022 17:34:39 +1000
Message-Id: <20220429073440.136829-1-stephensportia@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 07:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164997

The systemd-unit parameter DefaultDependencies changed from true/false
to yes/no. This changed in systemd in v242.

Signed-off-by: Portia Stephens <stephensportia@gmail.com>
---
 .../recipes-core/volatile-binds/files/volatile-binds.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index 6612d2aae0..8fe7d8d4f9 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -1,6 +1,6 @@
 [Unit]
 Description=Bind mount volatile @where@
-DefaultDependencies=false
+DefaultDependencies=no
 Before=local-fs.target
 RequiresMountsFor=@whatparent@ @whereparent@
 ConditionPathIsReadWrite=@whatparent@
-- 
2.25.1


