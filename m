Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185F4C41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:09 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.94007.1691961539470243027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZalNkhaT;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.52, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56cc461f34fso2406177eaf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961538; x=1692566338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeVydU5WQYXk+lwT6jFpP2bMny79fKZ2G4jaIJtDQ4k=;
        b=ZalNkhaTkZ+grtl/tF/GjjAb02BLB6g5kxa6G30Qr9mzvBeLLoglj0Hox2ldBQWYRj
         UhN3NiZrRWZnDW9IehAPzAX5YlHz5VhhuoJ3a1gbSIeKV6sffT8Wblw4xGQ09gqtMt2u
         3YNtXP0zOwubLeLxERUsnf3brldWGTOSNLkGRIunJJa8/okZd0WVFLVpgQrXEtPyfV14
         qwIOQQEcBi9fmjkgcwRAz3K4Tz7mJRPRYQie2TlCiko6Hfa10w+DhyzW5+hpzFaHTQ7n
         rWctZZgSyr8OHLgr5BpER8dagSlVzs1rliOgLcN4iN/sc4w5clOU1ynrkpD/dCqPs7dN
         4UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961538; x=1692566338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeVydU5WQYXk+lwT6jFpP2bMny79fKZ2G4jaIJtDQ4k=;
        b=SU9B8hfM7TD3c4Wt7mQPTfk7wJLnmfgs/HULQx1ENqRKfs2jblPhBFjbiwHqJdnj37
         aADl5llCfF9VR4CE9g5MvIu0cu3wx+qQeYR0d32jq7oV/pqEl+bYs6s9+4g0dxb3Dodf
         6ck9F38sPKY3jpOuEStdGmFrg/qkTL4w/HAb3IRMFK1wxht896qgFjR1yaNNMJMh6aHx
         jFxxFbBiLjzGyt/0a32KtJw4pFvkIA9fkf2kTJXL5IoBbIpxX8codMPDqdKK91AePavq
         LpGLxSGeArCdm5vMK0doWPgaT77/wLxi3fcToRzgvNMQT6s/SJ7gUU/ltHc45yxq9Gdi
         mGrQ==
X-Gm-Message-State: AOJu0Yy4TAhB8AjdjF4zx8yJXcMhJajuH4MdCC6LIZHFN/5ZESy6rKRi
	WBHjsuW1HZCwGz8XfTEDYUyN8n0M9ZKt9qm4MyDn4w==
X-Google-Smtp-Source: AGHT+IHboAZ5x84m7RQoxzhx0jYq0jj1QM2DAhgE5KTnAgv5jxSZpWzig8hZoTePY1ExAyQCKWyDZA==
X-Received: by 2002:a05:6871:5d3:b0:1b0:3075:2f9d with SMTP id v19-20020a05687105d300b001b030752f9dmr7633165oan.34.1691961538399;
        Sun, 13 Aug 2023 14:18:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/22] libarchive: ignore CVE-2023-30571
Date: Sun, 13 Aug 2023 11:18:11 -1000
Message-Id: <9374e680ae2376589a9bfe4565dfcf4dc9791aa8.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185896

From: Peter Marko <peter.marko@siemens.com>

This issue was reported and discusses under [1] which is linked in NVD CVE report.
It was already documented that some parts or libarchive are thread safe and some not.
[2] was now merged to document that also reported function is not thread safe.
So this CVE *now* reports thread race condition for non-thread-safe function.
And as such the CVE report is now invalid.

The issue is still not closed for 2 reasons:
* better document what is and what is not thread safe
* request to public if someone could make these functions thread safe
This should however not invalidate above statment about ignoring this CVE.

[1] https://github.com/libarchive/libarchive/issues/1876
[2] https://github.com/libarchive/libarchive/pull/1875

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 582787d3f3..728eedc401 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -46,6 +46,9 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
 SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
 
+# upstream-wontfix: upstream has documented that reported function is not thread-safe
+CVE_CHECK_WHITELIST += "CVE-2023-30571"
+
 inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
-- 
2.34.1


