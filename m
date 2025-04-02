Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8669C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2127.1743577844157417431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ArMDqCjq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so3237845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577842; x=1744182642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xM7DnXEImcbmWhv685x92qPhYKQTnfsvlFcgSTlJ+o=;
        b=ArMDqCjqU5YIKIuzGwdNlaOToIv+S4Nd24EOhTn3VPyIXnURIbfO+rKtMwffR81AVe
         X+MRfzqG9HMA53VqHfThT3jgqtI+hEThNhTkXM1s0mWw/PwcWbhZD2USkhv8q/4m3s/U
         8NE74FJMSkLY/7U748m4j43D1S+iy3RMhlfyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577842; x=1744182642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xM7DnXEImcbmWhv685x92qPhYKQTnfsvlFcgSTlJ+o=;
        b=bypycDEcS87/xQtDODdzeSj0Ok0wjRkUykHkO6qyKg/BIoaUzomiFqRXLiyHm67dB0
         /nkQwqGnRAFvOYNAwMQzakptHZdPjYhZ2EJgN0d4jAe9Vdkqof08VGR3tWSXjiFepps0
         hsbez4Nissmnr5mlDiiOpAxsTvGe/FX0d7Pg+a2tfn0C3MKxasQICIektbvtHRQ/yBKw
         Lj348NABDxiTM2MT+iDL9m+QU1Y9iNVs3M+p2x9DVW0zUgjspz2A1G6e6XteRv61HxYu
         CWdwKNY/9KfRaaJooy4w9HG0L4YQEvUNoGRiWwnlZxQC62rzcKdR4Tl4S8sNbGEh4idL
         BbjA==
X-Gm-Message-State: AOJu0YzP8jMo+B+sRmi5Sscenh6NhsvejvjFyWdJoq1HcnH+Z2ziacKA
	yMcAPUKAHvkKTzbfLDbRwFXY/l17YMCNkselb1B1yliNwy470cl21pqcIPSMduDcy0o1gNDCTvf
	h
X-Gm-Gg: ASbGncsLFxgP55QU/lHB8xLP/54OSFT6Izd/t/UFCd8+QAIq08qfGA9BdbAyvGwKvNz
	oVtpZDqWP0iZ9IqB1ApJpkfmenfPbRugAKPEzZmlP0znm+ah1ZsBSsB8H9odJAq0WE7yduMPJmH
	s4nyURLjOYXfznKYVhLU4DeQuBX5pxhMeOQBhVN5R6cT5HpWWK3lOfusL/3pCvPov10g6cINrTA
	ZSVpu4GWUApOn4RrdHxD6g1+Y3An9wy8kDTksfHvYWeEbxlR99MLFbBYZLZZzk0BqXGjDCRre3w
	JPklvIufKJy5BRu7L3vu/0Md1k+7CokyGYOtof8mVR8y4MSPpIP2vNvdPg6vBqPsF74WKnvOsg=
	=
X-Google-Smtp-Source: AGHT+IGEJliGIjdQHvOv0CSX9bbyOMkYzHD/AjYbzo8Q/mQqdIdGwPHVVvsU8A9bgr7rPU77ZbC0bA==
X-Received: by 2002:a05:6000:420e:b0:39c:11a1:21d6 with SMTP id ffacd0b85a97d-39c2a35fb0amr750153f8f.17.1743577841715;
        Wed, 02 Apr 2025 00:10:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/48] diffoscope: upgrade 289 -> 293
Date: Wed,  2 Apr 2025 08:09:38 +0100
Message-ID: <20250402071017.2157620-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214182

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_289.bb => diffoscope_293.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_289.bb => diffoscope_293.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_289.bb b/meta/recipes-support/diffoscope/diffoscope_293.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_289.bb
rename to meta/recipes-support/diffoscope/diffoscope_293.bb
index af7d6b5d73e..59e7cbe0003 100644
--- a/meta/recipes-support/diffoscope/diffoscope_289.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_293.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b9b2e598e62eb2220376e252692ac534d8d921d4314ec288d8c7415d3041dd9d"
+SRC_URI[sha256sum] = "15315d09babdee45449be7042ad1f57104a5f04853bd6951cdc0da171c13ac3b"
 
 RDEPENDS:${PN} += "\
         binutils \

