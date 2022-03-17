Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826CFC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.9207.1647518224168359180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ed+qWaiY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id h15so7022740wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HmQRrmK+pFIGDv4gr72rQWtpi3UnujIVRXItmZ/2IbE=;
        b=ed+qWaiYpyewKGrkECuNV/L/C8jmE9mjPFYXfAPPF564g4yqz7unD5XCLPtcS+UemW
         +2cDQ+FzALw3R+6khFsW6bnJINOF1x9o8oyBfVs9fctXN50gomi1t0UT5AZwoJXYW6qz
         7HYPOrDEIhtqgT7gb8aDmFTC86hsRvJgCDLmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmQRrmK+pFIGDv4gr72rQWtpi3UnujIVRXItmZ/2IbE=;
        b=uUBd29H7HUR/xNR80OBcc68ok3Sd2YtzIIVQbYu79K1KeOPn08oCP/SxlQFCvFYflD
         dwUemas05SfmS43EzoYidn1Ie0i8458+Grs1pCatkLfAqShxJZU4zmYqC+3SjY4VYE4d
         Q/W+oECaoNtialhTXkycDKGHdu/26xHFrJvcUgW8WkQPhJ2bfTqhjBU/i5ygmWMpvC92
         4Xyr8v4cQd5qbCCtfWHdPgAdIkel+IoLTgviqgcrPSsrYc/x2dVSmXXZCYGjewJshv13
         3trq2aRh2GZoW/nuh0w5RA0iiZvtV42ArCLEiFC97lvDAzwRO+h6IBh2IPacoXBEnWJq
         dpdQ==
X-Gm-Message-State: AOAM530qnyhCqeCD5UN6NYdTcCd/ZOCw5UqCqXyjLy3qTT+ySW4tv5GK
	nDoyPMATN+MGK7P8wSDkIMvf/MyxCZbRc3ge
X-Google-Smtp-Source: 
 ABdhPJw1SGHKGaBmjYD5vW9rPNFAtiB62vJYF6B50PYWYXbOia14oC4pcvs/Ve6ofh5+cyxteYT4Ow==
X-Received: by 2002:a05:6000:188b:b0:1f1:ed77:2f29 with SMTP id
 a11-20020a056000188b00b001f1ed772f29mr3665049wri.413.1647518222380;
        Thu, 17 Mar 2022 04:57:02 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/26] python3-docutil: Extend to nativesdk
Date: Thu, 17 Mar 2022 11:56:35 +0000
Message-Id: <20220317115700.993924-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163387

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-docutils_0.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
index 4f60b050484..e4ddd019787 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc6
 
 inherit pypi setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


