Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E1AC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.11782.1655667071878919231
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vgOkePQa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id y6so8020656plg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2eV+9z7VzfoDfDxQXYbxolMPWYXxgwkpJFzXwHjjFUA=;
        b=vgOkePQaQgMp5suisiZnLwRrbSeF798vzm8o4B9+p+8DRnw9dkglqTKChOTWVFzsAB
         8VjIZ3sjrikOKzvMjM3+2rbJQR4SHGIY7UF9e5IvBLfzKUs/p5ojbVBbeZ119XwQa6XV
         WenN3Rfp2IVfZz/R87jGhzt4Hmy7kf9dTxetuhi/1OFUh7wQAwhxWvTbQeJ+Qyb2cYOK
         98rNdcQsnPbf2qdbIowGIwA1zq4oHUIH+24hTvBMfMU5Zn5CjQbL/c1O7cJbSBPW4K1m
         J1+zYqkPNURW61ZLaFSJIRnxXKp6HUVjNqO2UgMBD3bNW2R3A2+TPD6YGFGKPSuV92o1
         cJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2eV+9z7VzfoDfDxQXYbxolMPWYXxgwkpJFzXwHjjFUA=;
        b=LChZ/wI/kVLFJnUn7H6gnCJGFeInMy0fBpqj+hyoRlQlqEsPeYXpnEqLkQOlX/3PxI
         BXurd6fwqzMQSW1/DE57U6uyuAdg5RAFF2n53NhETd+sYCKUUYtauQPztcaCVg+fhXGP
         pcYnVtALjopz5dlixuYObeMBw/yUnFwTtDnRs0rWXWaBK0M6TSP7K5jN9d/Svh+n+qFr
         GL7bSkY909YQB5AgpfsE5yPmIu5BMlkQDy2JOENlpF6X9wvPAsGVuOMt1dSqceTztcBZ
         /9GNqwIDcLwXb5AoWFwbds5bRVJvdeTnZCW8Bjn6ZTlsoPKIatYvquUtmrCUgh8Mqpic
         nGMw==
X-Gm-Message-State: AJIora/xd2hmYXUN5lnvtrLw5Bnhc+lD84ipHsuM3v2wSaNyfS9uv1To
	YBU2+dpNN8gOAQgP2J5MKiTKFXvXBV+bzhj3
X-Google-Smtp-Source: 
 AGRyM1s37heRV/8v8iymIak68QwONkUVp20T1e6RC3kcG23bCjPBq1BPd4CRMQ5oqBLpIX2TJF0KcQ==
X-Received: by 2002:a17:902:7c95:b0:168:e7c2:f5b2 with SMTP id
 y21-20020a1709027c9500b00168e7c2f5b2mr20182299pll.5.1655667084476;
        Sun, 19 Jun 2022 12:31:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] popt: fix override syntax in RDEPENDS
Date: Sun, 19 Jun 2022 09:30:45 -1000
Message-Id: 
 <6168dbc9b27da1ed88c277bab6f024e6e068e685.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167056

From: Yi Zhao <yi.zhao@windriver.com>

RDEPENDS_${PN}-ptest -> RDEPENDS:${PN}-ptest

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37a47bfced900c2f1e239b216d8614eb290f2f0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/popt/popt_1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-support/popt/popt_1.18.bb
index af8add4ad6..b465f8817d 100644
--- a/meta/recipes-support/popt/popt_1.18.bb
+++ b/meta/recipes-support/popt/popt_1.18.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24
 
 inherit autotools gettext ptest
 
-RDEPENDS_${PN}-ptest += "bash"
+RDEPENDS:${PN}-ptest += "bash"
 
 do_compile_ptest() {
     sed 's#lt-test1#test1#g' ${S}/tests/testit.sh > ${B}/tests/testit.sh
-- 
2.25.1


