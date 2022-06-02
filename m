Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5CFC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.2153.1654137094992361900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=txgLgxo6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id s14so3357793plk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MA1/dj0zdnL5JK6oWOpSNZiQvFz3qI6ZFM2gt4gE1Lo=;
        b=txgLgxo6MxRcCIfxlccI4l2vru3cCsbq/7roZdFXfnahgRh3JygqmxYwJ6uh9Ohsg9
         bVMU7XKxNvZCf/1MvlZdpgj/NMDSSMDGj/12nNfoOh/hDAwN26rEMBEjSnUAChHHjOhU
         MaxuJZNjujzs3ifPW5eGdP/nkYxapkm1gLn26N07TrcQxauhC6IKXUqORQ51wJm0F5vp
         Bs3JPC0wNjq5Zm853mgbl3ng1u9DqSwsMZGigbtmhKArkKd/JhONiYsgRkZdReJyBDon
         qf9xHXkhOPZsjy/8UKOTM6CR3nfPExkKvtBYQp5lTlGYsdaAKZGPkici/Y6hOthG+WNa
         4tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MA1/dj0zdnL5JK6oWOpSNZiQvFz3qI6ZFM2gt4gE1Lo=;
        b=rqvxBNtCPHjtx5OqeUfZwfiNmInnAbncHoLDDPgZ+qKZ7zsTBzfl3XYPmHdxyWYQDV
         4CWKYr0c7U3RaDFoxrhHzXiIUaTfjZHS68ioy8OubV+B5sEE9CBzOv3gc0fGR8gwSLf/
         E9+b8DRjK65XwDqxoM+H7haJeE0KfZRFOu3fDpo4z/bFphy+Kq+tlUfRYG2sRzYf5zMJ
         FkoxLTG4vU+j2AibA9SAsVHkpqrb270P66/FXFpJb4rQrPQwOzJE8VQ0Tbqxke1hHCA1
         nSBNZgyLZfD9n2cVDkDdIrt3StEef6LDFclVqhNBcDeZ+79ypqGQsOUWRKacefukEAap
         +XVw==
X-Gm-Message-State: AOAM531gfZPT7kIuUER32pXvvRMFepOzGx/J3uhTN68G+vNW2InLOkt7
	9OBwiGcDRx+Rla0s0EXh7n2FG4F43JrWRLrV
X-Google-Smtp-Source: 
 ABdhPJyPhys6wL1sH5todvf8rvaNtLccNoih5sJ5LAm0KnAw2iBuI1zh6xW1qcrdmBXISf88DsWedg==
X-Received: by 2002:a17:903:181:b0:161:d61f:e891 with SMTP id
 z1-20020a170903018100b00161d61fe891mr2436241plg.153.1654137093828;
        Wed, 01 Jun 2022 19:31:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] cve-check.bbclass: Added
 do_populate_sdk[recrdeptask].
Date: Wed,  1 Jun 2022 16:30:48 -1000
Message-Id: 
 <df09cd71b4cd3f830fced9ce91aa202c1609bfc5.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166456

From: leimaohui <leimaohui@fujitsu.com>

As product, sdk should do cve check as well as rootfs.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit cc17753935c5f9e08aaa6c5886f059303147c07b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 34c38bdf2d..f7ed2a6ae9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -213,6 +213,7 @@ python cve_check_write_rootfs_manifest () {
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
 def get_patches_cves(d):
     """
-- 
2.25.1


