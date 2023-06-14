Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055C6C3DA41
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:26 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.13058.1686751517926052802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MQE2BYVU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-54fcef0204aso708054a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751517; x=1689343517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqIwKZrT9DxBR3e/OusAxcRPrCJgZt2TxJtbrXytIeM=;
        b=MQE2BYVUF094YztiJv2xwbndMDYG6yIDFsJXWBNOXipukgEZDuJdX2lLxiWEcCAw/t
         sG/6LCB305zzRGL/umVe7rWrTXJfm9GzKIM2QscIngA/AIe2eDTlQl806J8AbtHlDU6l
         oaXWEH9jCoRvAcGiXgh6FXTmHo7+5DigijCLGe2FtOlp55HVYhFnD2sHjbxEQhnO7SHP
         1TR6Haq+L9qUZxYZdGZrgugpdFU7JRW8G+qzep7pm59qD0bPEQyf4Q3LBHanPTStnSB5
         yrjnc6Ov4Q48WXWIsVo/nZpysEX+yT6ztXKGRmDwqODMNF97cPuKjNm4pc8SaB1wcjax
         0hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751517; x=1689343517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqIwKZrT9DxBR3e/OusAxcRPrCJgZt2TxJtbrXytIeM=;
        b=aLukaF6yyBOrV5atJyaeAF/Xl9DixsmSQjI3CXNYatZzsHHDsUZvPUe7VZwwgaxbAb
         AkxKRvg6YSTuKoiLsGO9YY8RdhkKsYF4QTP5PmQV7bIWYkMI5Ikn4G+NnxlfQmLCa+Yg
         nT+WSucNTUDXWCEJNFChVwVCSGJIkNLTU5Qv1EFaaRm5UvzpsBTQ2XlqGfJK/LG+9Qib
         9EldL8XithiwbjrKVFiEbSFN08WPkgzGLZY85Wjg9Vl+l+zC8vn4ptLA6lqaVxU0WlY1
         d2ViIdrErj13V/BIVscoTPLunUmjP2b1+w2DdMaBTVWcFgWgOpUNrTBOyewVvEV92eee
         wb3A==
X-Gm-Message-State: AC+VfDzp1LSs1ujzNeBAtjA62G4AeRxgaJgJhQYPyEfC4NAC62ThtYB0
	KT1sMPah6pXdQye6hX/ikApZb+ncJMI68+h7408=
X-Google-Smtp-Source: ACHHUZ6XStIfMCt+bnHuP+yLtU4WHqoqu/VFYk7cwFxvutHOWTueKFg4NZLTYftNTUGC9d5UrTFd5A==
X-Received: by 2002:a17:90b:1e06:b0:256:d262:e686 with SMTP id pg6-20020a17090b1e0600b00256d262e686mr1683608pjb.19.1686751516830;
        Wed, 14 Jun 2023 07:05:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/5] e2fsprogs: fix ptest bug for second running
Date: Wed, 14 Jun 2023 04:04:55 -1000
Message-Id: <7ff9bca99806c4f3b44b450ec7d6b06486908ea9.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686751371.git.steve@sakoman.com>
References: <cover.1686751371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182812

From: Qiu Tingting <qiutt@fujitsu.com>

At second running, there are four new failed case:
  d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize

The test_data.tmp is necessary, but it is deleted by run-ptest.
So it should be restored after testing.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d0d08dd9a8a179e25b9cfcbac696c1d212a1910c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index c97c0377e9..279923db8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -8,3 +8,4 @@ rm -f *.tmp
 rm -f *.ok
 rm -f *.failed
 rm -f *.log
+cp ../data/test_data.tmp ./
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
index b1abf6b858..565c433866 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
@@ -144,4 +144,7 @@ do_install_ptest() {
 
         install -d ${D}${PTEST_PATH}/lib
         install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
+
+        install -d ${D}${PTEST_PATH}/data
+        install -m 0644 ${B}/tests/test_data.tmp ${D}${PTEST_PATH}/data/
 }
-- 
2.34.1


