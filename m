Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DD0CD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9414.1777739493214827338
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqHnkGH4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44509921fbcso1473303f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739491; x=1778344291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GsghfXTWxE/4Ut52HUbbRlux02iU1AiIndsFSpFyG4=;
        b=CqHnkGH4njev+rIeZxFsjz5D6DKK/5/T/H5lOIHOkPlZqH6+xq2ZMlDvOQnPkCczGq
         KhqfkgMMlMQyvX7NJIzdus2obKeFt9SH4Tc2Pgn+PGibKi3P0zPEm5dBVB18duTVyE8f
         A9ffPrbLJwp0sgTWWviLsY4BMGZe/xZkTlajE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739491; x=1778344291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0GsghfXTWxE/4Ut52HUbbRlux02iU1AiIndsFSpFyG4=;
        b=hq6/BOvK5qyuoy/CYumbmKjuAL22a0I3U4pc4TTmNgmuykOF1JzDgSZEbvWe2hOFED
         gVXCiM8MiR77hGmMEetHeQrLMQN1zpMmKI1XqTa6gisuu4gEgkaxRPgIH9viKGGNIgKh
         YYxn40/JqL34UBAG4wFUb+QYf7Y++QyEQVSmFoHCNsP2/xYyBgyPQY4Rh5jjIzGd0v1s
         1d5gR3awSqKDLoTnCzpYq14TRNCfas6f2h9Z5QUyfGiHlo8mUBnfFouu4LHU8/8uqbdy
         C50GCNw+YPbt5yqRTa6I5IJy1jkYkxySpgumZTz/QkZGbG9lCf7POT51AZIFtoRsHVz4
         LNnA==
X-Gm-Message-State: AOJu0YzSmm2nupoZXNtyaR/ZOPoKDD5u9ENGBQa89GIEq6p4SvuJbqbB
	iRc8qEiihVACjwLv6hcTeAFTJEsEaK9Sm1wYYs1uTGK225U9ppTsVD1pxQo4cpiXjEkXpkCVr8O
	Ii8V7mzxELAFl1pFzKvwTr0RqkNy5r3VMxKOIdZ2xNA43ID9ELhx74oIx/wTdUucSvjUuq2gToU
	NGIcvRmp6ERVbeuiM=
X-Gm-Gg: AeBDiesS3nPwFtc4PhT4Ny3aGMqa5ZCfh5iH/yCl3fzeeZVLorgt1I+xvaYuysu9YMA
	HKkudPqeumfHDHgLEX9ShevEcRFnOJI2QAXoYRluQXjlxmpR/iF7h0l/SVmTuMhEQ3XA4IROE+o
	BlaO8/XzS3zrgym8N3VGX3+aVjV6/8hs98iphNDliVZv6LF/3so7NHQ0sHnJ78ouF4GKhn9AvU3
	DUfiOD1naqovse6qnCtqTEpM0RIDPwrGFHDb71X0PjSyhYNAuqBIqqKW+OPl+XmL3GMqSmiqPXc
	E0slS8Lo92kat2VeZNSaj3vi3MGBUED5XHhOl16YYyAvwvS/sGJBbkbm/OKjp0e93r/at3yN5Wv
	Vt0YtDYXrfGtF28c6RfpsjRyWsm2GJBqgdojtGRdP3l2+ShCujPRJ1nHtWGHM1zaSlLaSr4iaq8
	s8u8H3hfr9Xi7cSBkhh2bpIxdOmHmhYJYrXsAECWczg8G9h1ebT2ngMINrX/OTakQ=
X-Received: by 2002:a5d:5d81:0:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-44bb66d5c0fmr6039971f8f.43.1777739491177;
        Sat, 02 May 2026 09:31:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 59/62] ttyrun: upgrade 2.41.0 -> 2.42.0
Date: Sat,  2 May 2026 17:29:19 +0100
Message-ID: <20260502162929.1377831-59-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236368

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ttyrun/{ttyrun_2.41.0.bb => ttyrun_2.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.41.0.bb => ttyrun_2.42.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
index 59dfab71226..811a4da70a8 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.42.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "5e07b30bdf67623e7a6d3850e26208b642d416d7"
+SRCREV = "997343f8417ab0af0ceb869e7a34b23cae3061e3"
 
 CVE_PRODUCT = "s390-tools"
 

