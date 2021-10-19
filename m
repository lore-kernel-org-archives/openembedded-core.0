Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B28C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:18 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.15312.1634673317402650840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=phZMm08C;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 ez7-20020a17090ae14700b001a132a1679bso763862pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kY8W9OPPZVHoRsiokBZP8imimwaLKSmzfIW2X4RSV0s=;
        b=phZMm08ChFYBSf1YVmz8uxIzAbziVA+5UHMzH6KokoVkA42gLZsa1leyIgRcFy+89I
         57Kibwa0n0x8iKzot4jjKQ/OUzuDdvaWs3PpfDWvg46MQkzBSuYY1G/Zexy5tmrlY1zc
         HLaE8/SnSznqZKHW2L89NEtKyav74+j/PCWzO8/2HJCnXQEwRM3DOLOxKjovJHl+xu87
         0XG7yn52Ch3pRU6r4VuKQHkf+wC6ngJ9GixPevCytl56XaNnPM2Q6wIz6FbJGOvcyytp
         FLpGZ243BA2mLD+3fCsG+fZ5n+FLEo8Z3yx+h/MLEDFUPRZQc5KhpArY/4CZnhgU7RFK
         Aqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kY8W9OPPZVHoRsiokBZP8imimwaLKSmzfIW2X4RSV0s=;
        b=jU4m1jD4S8S83nWQIxC2XcvnbOnuN865qTRN/WMCPqs+xl4Wnc4LRGl52sJ/j8GV2z
         QsZaePMzpizD5NphAOZ9gLul2JC9TH2v5YxNPhJo06ZGhkoqr7hAzSpXCbo+5YbN8RX4
         NDd9+9axN+88EMJ4+XAqGN1JoP02zo6hBrpK2+CVRFp1Nftw+JE8pXtaC9Me4sW6+UIR
         b6dzyRdO0ZpWUCBlH8OEHtMWSNyrj5CxWiGXQ+ln8YQg21wBIha0/aFwXBmhLGGsB7s/
         kgauiSGMzzjcGws/I7cGqALEscbc+Bnovcg9LUUyDKIRCdj1BPghJn6CrMrt8hT2R1bZ
         lnFQ==
X-Gm-Message-State: AOAM530omlBAqLrX5Vm8iATZ4q/zmw0OJvd6oXtBRzRsLtNZdfCUEMdV
	7JXLGxzepncVjILEyeltI8nPwDsrykFfuSBP4uc=
X-Google-Smtp-Source: 
 ABdhPJx4BTBCqGzLiUKgYksQs5g8pSySloK+bRowNT02UQBolyZfSo54O8DlRY1iulKECx8f0uAPHg==
X-Received: by 2002:a17:903:234a:b0:13e:f01a:24f with SMTP id
 c10-20020a170903234a00b0013ef01a024fmr35358578plh.43.1634673316433;
        Tue, 19 Oct 2021 12:55:16 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/38] util-linux: Fix reproducibility
Date: Tue, 19 Oct 2021 09:53:40 -1000
Message-Id: 
 <c6a5c4a72de7590b4ac8f5e1bd4c1e83567ef468.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157234

Sort the list of files to ensure the pkgdata output is deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a55194f90e11da5671b24391a4aaf2b86a8e1e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index af4c0b9974..7b780352be 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -59,12 +59,13 @@ python util_linux_binpackages () {
                     continue
 
                 pkg = os.path.basename(os.readlink(file))
-                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
+                extras.setdefault(pkg, [])
+                extras[pkg].append(file.replace(dvar, '', 1))
 
     pn = d.getVar('PN')
     for pkg, links in extras.items():
         of = d.getVar('FILES_' + pn + '-' + pkg)
-        links = of + links
+        links = of + " " + " ".join(sorted(links))
         d.setVar('FILES_' + pn + '-' + pkg, links)
 }
 
-- 
2.25.1


