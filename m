Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819ECD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9467.1777739376358714495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CzvvhIsl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f60944so1715367f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739374; x=1778344174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bq+yFfuBfuj7yoyWDSF2BFJwS0jvWjqFThzjzWfhGOc=;
        b=CzvvhIsltl0mhx7LtZI+FH038SKvN0JlG8fSn4g/v9uxfbeoGH/lNuY7ZMzmdJCfso
         zragslcku2A7lDsYTPrS1Vka9lyh8gdyOi2QNs1DwiBC1324sCNBpYAtHzu27oCBtuBi
         UeE4s6oJNpfL81QBLsQaDkC8iQM/5WeAaeehY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739374; x=1778344174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bq+yFfuBfuj7yoyWDSF2BFJwS0jvWjqFThzjzWfhGOc=;
        b=YrHs2MunEK2qh22SYJGsKQsAeYM9CjkAALC4Q65rpDPiGwExdeftf4op/EWGyuWPMZ
         Wh947qDhNWS3tikuq+a/5tyvmTvRvF81GWqS07blxwwlZ5qT5P64eSWOJXYyT57D1Hnu
         qGmYMRI8DqXjQ6/VPSvFKmnBR8oI4vE9XJizytWbPyNW7mUM7X6hcj1p5LtqLA7TEC/R
         LGTypaIaIlxRw+NW1qd15LM45XRfnRRdfEcrF4MxDM4CMhlY3OMXBRWU1qcUlo1DpNy4
         Ux6C79HVteECW2MdDNctb3qZv8WBgkM8ue4m0+PadvhxPi3xHzrdk4YtGVw/hHycUQcN
         twLg==
X-Gm-Message-State: AOJu0Yz5t0k+oJw7Vn7tD/CkKWJaTfh9mJaIKRrZixPZnsiFj4y8dUVQ
	Z1WMl24pUJHQ4Dw5rjIBaM4UYGHCi30IBSs0NmnXszhsCJR7fQxsvu7D6xLaoObOC8SHeUBQsOC
	/Y7mIj9ZZPHT9KsbQC3mTDESFJJMxlhJGNQo4xb1mukDCitA9DNEjqCN95A4YZNPtSRP2oawoQg
	NaVhVOTfNnhCQmtxQ=
X-Gm-Gg: AeBDiet87FgZoYolYk8vPdFuMh9Z40CeaOfEXTRhV2Pv4NdkyOXwytlylLQbTkQCRZ+
	7kAPJ1RN/N7ElGh0JqZbnf2Ddgm6CbHfc8Pt7/aF4It+ZR7bNWVAub/JCs+oTkdLhreBEmJTvEF
	9Xx0CM+DDzjypb44DLxOXNw9toeqECFFfZyudcxnyj8g3v5Z5bIkIv15gPo53M13yH+u8mJWZKQ
	TcOkOnDcDqwH0HVWj1waz9TvLCP4FIy6Fb9Xi3RLGj2yKoFMMtl/XDhPOkSRG2Bmp20d6WdcNcc
	zKKusNl88D0Pago66WFqwcvaiClietLByHch1QGiFHLzGW2aFkeDj3p9xDctdUPFIl5s/dOwnSN
	KVEIpM3qJW7UX/dpR/SQREbCMPllu4QNR7wcMsliIa/stZjcaDGjZXFd7dVjYRh13o5OmDsAAza
	HzFcyhGwxIZs6bsSpTkZfb4Wr4FGPuYippeUzVzBFuaPm6+2a0VhJLzbquuUQeVxk=
X-Received: by 2002:a05:6000:2382:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-44bb36d1837mr5780906f8f.5.1777739374225;
        Sat, 02 May 2026 09:29:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/62] boost-build-native: upgrade 1.90.0 -> 1.91.0
Date: Sat,  2 May 2026 17:28:22 +0100
Message-ID: <20260502162929.1377831-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236311

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...oost-build-native_1.90.0.bb => boost-build-native_1.91.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.90.0.bb => boost-build-native_1.91.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.90.0.bb b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.90.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.91.0.bb
index 911de72bc1f..c276cf436d8 100644
--- a/meta/recipes-support/boost/boost-build-native_1.90.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
-SRCREV = "be69c44857e34fae250aa1321808a05c1d88bfde"
+SRCREV = "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"

