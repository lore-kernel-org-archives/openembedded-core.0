Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8318BC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9103.1647518226675325285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cxgcJsGO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id a1so5638988wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zkmZjdjo6oq99z/ECVxqeazxNaoBIyntWrpu8mVbDrE=;
        b=cxgcJsGOSNj/G/kw/8iRSUYiPIWvgPkp3V3zEQHsSb8JhxHDCtV4XnB7Bk8TKHDXS0
         sF2uRCRd8vbWaPOjBMC9coailVJjp0m35UMeZop4Zmpw7w/qUHtnIZgrk0QRky1ltVSE
         IucxPjcWmLJfgjwRj8u4YMfT+mEK2sj7ZxTiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkmZjdjo6oq99z/ECVxqeazxNaoBIyntWrpu8mVbDrE=;
        b=KCU/eASiEl80rIkLBGcsL88UJFWij3PlKyzrPBAtV0tGB5RS+1SPNK5nvdCSTyMCQ2
         q1qC1Uffmw7PoCF3OmRmFc7tNpH4WUvqAQyYP2i9wntva+hFUp7UEfj/C0dkRSAtvkLT
         VP0WKV/XG8k8cnY25V5nYUXa8Su6dmdWIJJOYSok85sLiFEfS/D+S0ak5nYKKaWkrqLv
         T/LixuYdrnkg5Bivd/nJKvAfCICP7+lnrgrTcKvxEoXKA4cXfmjU5/yFj/gMAVZwCjtK
         BcYX83GIyn7fdvT1QyeAb0Xk8oddFT8UgpOfG+f++///5tAPiXINyFbeW6oNwnNa2Qub
         OXjQ==
X-Gm-Message-State: AOAM531BzppTre3JGbEJZiVxHe4fR8bsrxmJ+w8EaTJdzQr5Zs9H4aVC
	nIQY75X5liWDuJeM8Q57zS1TLlvckdJmli6s
X-Google-Smtp-Source: 
 ABdhPJy1EDL8q0HdCQVE26w+wrNp44mGdGfMNrLMlQFp25D08rrwuwp+Q7uqafjx6S6AY7m3aizfCg==
X-Received: by 2002:a05:6000:11c5:b0:203:dc09:dfe8 with SMTP id
 i5-20020a05600011c500b00203dc09dfe8mr3606058wrx.499.1647518224909;
        Thu, 17 Mar 2022 04:57:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/26] python3-alabaster: Add new recipe
Date: Thu, 17 Mar 2022 11:56:38 +0000
Message-Id: <20220317115700.993924-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163390

Needed for sphinx support

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-alabaster_0.7.12.bb                | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-alabaster_0.7.12.bb

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb b/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb
new file mode 100644
index 00000000000..3381ce9568e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Alabaster is a visually (c)lean, responsive, configurable theme for the Sphinx documentation system. It is Python 2+3 compatible."
+HOMEPAGE = "https://alabaster.readthedocs.io/en/latest/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da053683d66d543813a727e8a30c96ca"
+
+SRC_URI[sha256sum] = "a661d72d58e6ea8a57f7a86e37d86716863ee5e92788398526d58b26a4e4dc02"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


