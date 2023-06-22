Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4A1C3DA40
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.14624.1687447921501273324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ejaxruad;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666e916b880so3623863b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447920; x=1690039920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=EjaxruadOlXSx64Kp16B07J1nLlF2jIDbwPPFwvh8Refxj/QqT4C1FedA/x1ZQ872i
         pwaPyZ/p3v6F0aagt0glKm5GjMWo3NN2S3jVxUOFOxTez+zPdmiIhk7RfAwwe7mOnCAG
         AaYQ7aE5gGQhHcEfYHt419+B0U96Z3mU1CyoeYUVYrvgnrpIv0caKIsicx0VtvGoD5ti
         WDVv7cWjkw7G296Nlgor5eGve7TAu38gtxAhq/iOnwHBLb3EAaYdTYnb8SeUurlDH4Wh
         NYnq7YyrlJCXGhH6rZkd8OWC0JyVqr1weELHipf5Eh9daMdvscqqiIWZEK+t38GjuVq1
         t9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447920; x=1690039920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zE7/k6UOpzU7Prh6v5VTlEkrPU7F9FVM/PA67J5gdI=;
        b=bGVhND/hPgyzOTHVpmjA+aroGPYg6i2C4z3OKquppzNdtmjBEbiHNkmz38vJYE7K1W
         hf2lEyCdg/AOnkZnmzvFNR2QaILXxnj4KO3TBwdmPLEnBNT7gEmROdFvipLPztFJQhPr
         werlx+bpQmH+/1BGbt81MZsRW78qpIJQg84en8zEbCES/nZiPbsCWMbZRWHu9nlmxEcO
         KIxPruST5qik/NpGuO5L61C4ygmYA5Kd3vz+Wzi3yWZCvT1KAMEM6xFNaxaY1FRXsf2I
         RfXXKtbuJqzpUNZm7U8RZC0LA9shJ1GvvIpg2LnCmsZfeToUgdka2goCl/xgyRdTM3y6
         ESfA==
X-Gm-Message-State: AC+VfDzSpe6jzOxxP/o/RNxRYQzxCyNnLtLekOYiFKV+WT2RkqUaAoGY
	5t2NULbJzrjf9QlQe9YavphfebzEZ7Y8dCdat0c=
X-Google-Smtp-Source: ACHHUZ5ub2o00qpTGxpfKH6DCphv2a0+gvT4QjXhZrg5EDwVjw0jzqP4dbS1nWmLIQm6i+TGdS+XJA==
X-Received: by 2002:a05:6a00:2e97:b0:66a:613f:87e1 with SMTP id fd23-20020a056a002e9700b0066a613f87e1mr1647045pfb.8.1687447920479;
        Thu, 22 Jun 2023 08:32:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.31.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] cve-update-nvd2-native: added the missing http import
Date: Thu, 22 Jun 2023 05:31:33 -1000
Message-Id: <787acb1cbc22c0f3bd0cc163c527cc7a98007f26.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183251

From: Jan Vermaete <jan.vermaete@gmail.com>

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 39d2cde7eb922cb0a2cf9402cd8b3ae3b4cc2f62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1c14481c21..2b585983ac 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
     import urllib.request
     import urllib.parse
     import gzip
+    import http
 
     headers = {}
     if api_key:
-- 
2.34.1


