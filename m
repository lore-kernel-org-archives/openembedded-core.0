Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E9BC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.9212.1647518243495698483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=huec23WV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u10so7007648wra.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aE9DQfThqXl9/JPNqaKHukt6c1CNJUZDo48Hqgtqrtc=;
        b=huec23WVzt0gC+rijfIZfgsu8vOjnBPZAAiYz64nOxbWqeC0ezzKIbSn7uyPmKoKBP
         Dvu4MfpD4qTo3G06Sbzo88YJ8Kf4iqcqnAVoB6SjvVjLssS71KLvb/hFDlVpMIKZVEJQ
         G9MRDNEk7gfCGHzVSPalW3b7QNGf7H/rBBtIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aE9DQfThqXl9/JPNqaKHukt6c1CNJUZDo48Hqgtqrtc=;
        b=oZi8oZtLHuhVprA1F+xco3dLdhADqKCTuS/uOWQU+xVtU9zqcDAEvt/zTmDjibWHKC
         S6lhczzgsItvI+0OluNzMXxqAjU4hr8jsRT0bfbMlhsT3wkq5Ordst/m12mZv/Ln+lC+
         GLTU610KYEhMU6O0Hcs31PWtSfBNU9bwqnXrTe1H7AzvgiGZ/jDfpscave3Y1z4NBdfj
         Jzm40AOy0RIVLSxvuwCLghDjj4TzzrtbsLaE++er0JiisoMfDDvya5O+0qgjHG+6JRFF
         Dt4hwP/ZtTshseP3J1xWqGBISL+8eUgBvn8oXhZMd6I3bd7G8UfvC8fUqOjMfadf8M2C
         2ibQ==
X-Gm-Message-State: AOAM531hKZDnavrnZ5t8UBenbtAjAy6dFJ49vIxA51pTeE/01pBdWBrY
	WGf3luzAuxsFl+6JfrIfZCltBVNzq5YlAz3i
X-Google-Smtp-Source: 
 ABdhPJyMpytzWlEYaf0MBzddFYGKEgE29NFpe2VN665uGzJzQvooYtlZrwv+GiThXJeaqzT9Olpj5A==
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr3825779wrs.615.1647518241719;
        Thu, 17 Mar 2022 04:57:21 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/26] python3-sphinxcontrib-devhelp: Add new recipe
Date: Thu, 17 Mar 2022 11:56:50 +0000
Message-Id: <20220317115700.993924-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163402

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinxcontrib-devhelp_1.0.2.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
new file mode 100644
index 00000000000..7b7bda78071
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "sphinxcontrib-devhelp is a sphinx extension which outputs Devhelp document."
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
+
+SRC_URI[sha256sum] = "ff7f1afa7b9642e7060379360a67e9c41e8f3121f2ce9164266f61b9f4b338e4"
+
+PYPI_PACKAGE = "sphinxcontrib-devhelp"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


