Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF986C7EE24
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:24 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.30314.1683300021011883463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X8Djuhox;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso2187636b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300020; x=1685892020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IObhgKvPL7YIF4txEE+OUgp/FFg39NRA6BUvGESaLWY=;
        b=X8DjuhoxS+3gO/ho/rQudGMS6oypEEzV6Te9DDcRTdt8xQ3LtuPI3aT4ZIjC/oQWVC
         HcPaEtgl29eoyEiHBrnAxClKa1Mdr+2Ry03eLckQEKkhbfQkYqMfttarKo55bTdZ0yok
         OMQiQUWonIKId0T1rMcpn2UXOq+BcmtiXRcuVUGFXAzpv3AItk51y7vvUaonPqTk4lqY
         P6o7LetptOIeoCLLk1TVxxeTVUGHeZ5lcfLX747EHn/PLxEVeVJsGblM5X2gBVNpWTaI
         qmYGfkfiKP+zGxdwtCcE7+7/Ti8Q0hrR9yDnGoTmvJuI4EH5q4vLeWsI+adJPi5sN2rt
         wL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300020; x=1685892020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IObhgKvPL7YIF4txEE+OUgp/FFg39NRA6BUvGESaLWY=;
        b=hjDJJe+W/G0036vGYPsiQ8MPWTySqytyUMVL83ESU5Uyh+/qTsEfECy4FzMnqVVDl9
         CnQKaNeXifJ8kggPnpfiweDx2uW8toVsxqlbhXjpSpCkp/uRd6qrJyc+SZjcmMcy2xWc
         CpvGRgJtH+ewFd/1ijFMlWk83ELBaN+/gS+TwNLVODZfZYceqmwGqgimqVFXIlwJlaVA
         aMTnYVWTPdQbWuHdb/7+EMj0jO/c+BwIK6lyDf1dvEKagcoxfJdd3JQIIvidwlRa2rhG
         p0bWLr9KiNjClf8yKmBwZUhc3s32WuRdRFeq8taFIjLr6Tn6jIdUQWj/4GUCchfb2gwn
         jwwA==
X-Gm-Message-State: AC+VfDycoS2i0ocA4lLgPy3YIDSIRs6zM4vPhaYDPxqEX2w992i0Vo/q
	CtXXbB7uN2w3oTEu9auL8M4WhhUR6U/QTtdKwYs=
X-Google-Smtp-Source: ACHHUZ7B047aWSmzHV0xeLvYOp3NCG4cgC80HJxFRUyhDa7IbL9GPnPx8sesEnJaWjQnTA5O31q1UA==
X-Received: by 2002:a05:6a20:9194:b0:f2:3d53:87b2 with SMTP id v20-20020a056a20919400b000f23d5387b2mr2515662pzd.31.1683300020029;
        Fri, 05 May 2023 08:20:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/35] libpcap: upgrade 1.10.3 -> 1.10.4
Date: Fri,  5 May 2023 05:19:21 -1000
Message-Id: <cc7a3c6cb32b4a8d2677159cd106068b5f2d75e8.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180930

From: Wang Mingyu <wangmy@fujitsu.com>

  Summary for 1.10.4 libpcap release
    Source code:
      Fix spaces before tabs in indentation.
    rpcap:
      Fix name of launchd service.
    Documentation:
      Document use of rpcapd with systemd, launchd, inetd, and xinetd.
    Building and testing:
      Require at least pkg-config 0.17.0, as we use --static.
      Get rid of the remains of gnuc.h.
      Require at least autoconf 2.69.
      Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit da76bde131a7fe0833c9fd59a1ca48edaed6fa54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcap/{libpcap_1.10.3.bb => libpcap_1.10.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.3.bb => libpcap_1.10.4.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index eb0a650130..27b167c21f 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.3.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6"
+SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.34.1


