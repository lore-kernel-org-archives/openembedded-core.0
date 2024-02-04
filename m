Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5FCC48297
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 20:34:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.47323.1707078855612185905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 12:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gj9q4fl0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so5726595e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707078854; x=1707683654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2L+NGJD7xgfv3F+Q3y7X69qAB3bICByQ87+kqT9NHY=;
        b=gj9q4fl0uHlMibIi604/mPbORJg1pIt9i0n8+4UigAeDoF5rlo+FHo+5g2EQKYZ+y/
         etxHgx1BOrhfCkHd5HxBqdSolTxJGr78V2UeKvEs84EoayGRVZwLjcUyScko1CWlWKRS
         wmUC2P5FLgwoYfQeg5gh5kFVKP6JAZ3U+fbEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707078854; x=1707683654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2L+NGJD7xgfv3F+Q3y7X69qAB3bICByQ87+kqT9NHY=;
        b=tmVT/lH0vaW6mMFtLajUnCKWbgytPtVKkCCBdQO4W4P5GIaFDLGKTIqgWKepmdtJF6
         HjOYKlyvKpHvDcUOoI6JSy+cezgZufl1UUa6skHegVBDdpC0NdmMirQ7+fqUfUIyA3oX
         BIEpoQWCMrPylZfetJhzxj2pvXLZv3rWxsl6rGJmPrrJVHmol7NL4LoStaFeWbg12hlj
         4o9YFL0VyebsWUenchLR4/GvAJTxvym59xjHGamL7yd03NUwyT5lihAizCGzH45Kp+th
         Q6/ikaXJD2ZGuIrItlGj2fBGRcjdYeBpMItJDJ0q+2xejZnoAAQkR6SPUSb7z7EjlyB7
         NxKQ==
X-Gm-Message-State: AOJu0YyyTvs3csC1fQNJAIFEss2mV6TVjaZ8LdEUVAlr5J3iBsGvGDFg
	lB76IxhZ+JOqwOqMD/SwEZ4EH1E8xK6vknXtMf799beyUhRJtWwn1V1HBRmGq54q8kDGA0sT3Ed
	0
X-Google-Smtp-Source: AGHT+IGYq88Z7GOMe3XxeZFD1JyMdgS5o/8QBaneT+iiDBoFp58k4VRCbM24yY2vNje5/zOOccnNkg==
X-Received: by 2002:a05:600c:19c6:b0:40f:d3da:85cf with SMTP id u6-20020a05600c19c600b0040fd3da85cfmr2768654wmq.8.1707078853630;
        Sun, 04 Feb 2024 12:34:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ea0:9a0d:a119:2213])
        by smtp.gmail.com with ESMTPSA id iv15-20020a05600c548f00b0040e9d507424sm6636260wmb.5.2024.02.04.12.34.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 12:34:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-markupsafe: Switch to python_setuptools_build_meta
Date: Sun,  4 Feb 2024 20:34:11 +0000
Message-Id: <20240204203411.2342606-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240204203411.2342606-1-richard.purdie@linuxfoundation.org>
References: <20240204203411.2342606-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 20:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194912

Move away from the outdated setuptools to more modern build
classes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
index a38c97695b5..170aa8a56a3 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] = "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
 
 PYPI_PACKAGE = "MarkupSafe"
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "${PYTHON_PN}-stringold"
 
-- 
2.40.1


