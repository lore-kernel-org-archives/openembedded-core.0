Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8068C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 17:58:19 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.659.1634234298506481608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 10:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y7VTuX0X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.41,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f41.google.com with SMTP id np13so5311809pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMMRczK2X1Km9dyR05aaWzEpOzetP9Z9NTyIK5/eTwo=;
        b=Y7VTuX0X8SThXATzo4RSLEOKSIA1Ej+9HOwKU0v4Hm+KFIch45KKlIzCGRuAe5dcCN
         MPgyXW7Uqn/E5IQY1ddSnHyVcGcsilUKNzCeGfbfgoF4q5y5VOCdsf+8XvG3m7uH5SY2
         eNyrPQDE0dzcduaihi4tJGjYitRKEXbJYL5M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMMRczK2X1Km9dyR05aaWzEpOzetP9Z9NTyIK5/eTwo=;
        b=aStOnrauKea7b49F60Jrul4uPZZy970ejyiidI/wrSBKKmfCvyyyA/2x681BRbg/eF
         HHhpKwWO8iiN1dZNFmDPI8Ie7+xYoeqfbsEi7ox400beQ249S68Kq9ja7d1fxz70MMuY
         9Gs263fvJzLK0wJ/ZCCg1yAVEWyixwQuvxCfAWGrkoaj8iaqM/7YWHlfH8ZoRnRX8T0V
         FzmUoqwr/PaIAnVch3wAsnFMUBVppTl0ZoKkBuBm+7tvc1MOY7AxGmGE6ak9+rR00t0Y
         /tQhpLmMilOt4+4QWIbEhEmO3sAkfzx7reyNip+KFyHHsa75RCzJKK2AJdm3neaXfuWe
         GL7w==
X-Gm-Message-State: AOAM532NgVvJid+BZMQQNIIPfeoZVX6QWb5hTw/siakaoOp83S0/a4tk
	ow7ze6/QYgoVXwsFXGoJNxNuwc1rYxOidNgj
X-Google-Smtp-Source: 
 ABdhPJwfxi+OnZ4VHd8EShd3Lgd/JNc1zcOUKIPm0x5LQrOlpov7oaE99OojsylrfJu5VJ2/I+Q8Iw==
X-Received: by 2002:a17:902:e801:b0:13f:255:9db5 with SMTP id
 u1-20020a170902e80100b0013f02559db5mr6292815plg.23.1634234297388;
        Thu, 14 Oct 2021 10:58:17 -0700 (PDT)
Received: from fedora.pdx.yoctoproject.org
 (c-67-160-160-127.hsd1.or.comcast.net. [67.160.160.127])
        by smtp.gmail.com with ESMTPSA id
 i124sm3178929pfc.153.2021.10.14.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 10:58:16 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] scripts/autobuilder-worker-prereq-tests: jinja2
 check
Date: Thu, 14 Oct 2021 10:55:43 -0700
Message-Id: <20211014175543.85257-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 17:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156970

Ensure the jinja2 module is available during bringup.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 5d7e6e2601..82e9a77bd5 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -35,6 +35,11 @@ if [ "$?" != "0" ]; then
     echo "Please set git config --global user.email"
     exit 1
 fi
+python3 -c "import jinja2"
+if [ "$?" != "0" ]; then
+    echo "Please ensure jinja2 is available"
+    exit 1
+fi
 bitbake -p
 if [ "$?" != "0" ]; then
     echo "Bitbake parsing failed"
-- 
2.31.1


