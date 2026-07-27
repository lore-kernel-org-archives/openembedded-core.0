Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96912C531FC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25496.1785134530144057490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DuGFKk8f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so8102635e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134528; x=1785739328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDqocgXCASMgp48wDX0ZpEyNiS9TxzfeTCtvkxk1gXA=;
        b=DuGFKk8fX228KUl6s1Y+VB0M23uzNjeh085WFqBLFSu2CG0T9iRpusCZa6jfz+PffQ
         DIQQnKEQ6GfVjG9u1uMcC8c0a1OoVcctOB7qmVjiUH5VqLcpbHFYBIgng+WR94EPoYI4
         /UQC3ciec6oyoAyqtfmeSOCPqHmZJLhjWRSKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134528; x=1785739328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sDqocgXCASMgp48wDX0ZpEyNiS9TxzfeTCtvkxk1gXA=;
        b=P/H/opcvk2iyKaHQPWScOlt8iKDokckZEQQLLVsz2ZUIY9F0DXtigu9xebYGU7v/ki
         wvbgF8ZeIb90sFuI4ymhMDicZJci67LbSV5wp+4muu6XeKCgto2nRl63SYt+2KSgNrbm
         EeHHOiIhBxL2qlvTWhe8ZbS0FN1rbrtZxXKRFQuNYvXsBv33Ahx4WfDb0gMK7jK7uNoN
         l40scv7s7P1OgUod5aBUiVOABpXfiK1ivR1ip+keu27WlbJaSBuHAbd4fznLJX2rzXaZ
         ZlyAevXvGt5jRSFp7I4UJYmd9EixOdZxz3g/9LF183f82bGv3t/dbLmH8VxmhrHuC0hY
         qOXQ==
X-Gm-Message-State: AOJu0Yy4wrFF8npr/9b697ONePBTDt08gx7ZpqNrM3VCCPdddzpnpVF7
	gZ8LCA6D8i0PQosbILmpko1UlOzARfiPIdGAuursoqktAb/I828KdF0uN4fLaT88uVKO3vrUaJy
	VMYTP0fc=
X-Gm-Gg: AR+sD129ZL+1Hvtt43vKgvDy7/WtgRSgTZ6qCqH6nP61UELHVTE1fAe0mxvbfvrLjwP
	5VZQQMyxUZ6xEJbjN+H2yOgN3Q+xd7fUfhgTeJDG8WQ27XcVioie6RcPz39r5YcCBxmKoPn9oQX
	IfBkYjXP0TXSKZd3Fa2u+rLCp74uJi2BQD+YF53psj9z1vQwRTo6+SmOiK1WxPOWjvS6Yg8aO7f
	dOjeRbmi+SP9QUnKDQozdskOY2t/ZRY2vw8WdqV/1TrHj9FhZ0pwTKNKTCsA6KpYB00U9hHY85N
	9xLlUR+ZClWDh7w1xmZA4mDn4dK2AkxTiLckGAQYgfshc1BEkjmGwIa9enxsMeE+dxt0EvjNl7C
	iSmReKS0N1hxw6/hKwtRhWeYUMOAs2TsYwdjrvQAURHXBYfhQZicG8clzm5Pwaq15e+i5hSW+/O
	ogWGZKsFhOiI8HQEg3jGur0Way19NdAA==
X-Received: by 2002:a05:600c:4e8c:b0:495:4598:6e14 with SMTP id 5b1f17b1804b1-496ba009b1cmr61176905e9.24.1785134528439;
        Sun, 26 Jul 2026 23:42:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] python3-uritools: upgrade 6.1.2 -> 6.1.3
Date: Mon, 27 Jul 2026 07:41:56 +0100
Message-ID: <20260727064158.3784068-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242045

v6.1.3 (2026-07-24)
===================

- Minor style improvements to keep ``ruff`` happy.

- Update build environment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-uritools_6.1.2.bb => python3-uritools_6.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.2.bb => python3-uritools_6.1.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.2.bb b/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.2.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.3.bb
index 3112b98c193..47fddec0460 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "fa60028843a8be651699a1ee2b399066eeaef349224b32a177efa4aeba463f00"
+SRC_URI[sha256sum] = "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053ada7976ee83ea5f"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

