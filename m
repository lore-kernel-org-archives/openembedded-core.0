Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D989C4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:55 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.10753.1652193587315110822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dHGPHqVM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2199225pju.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vaSrJh4e0zkwDTbfY3DOMp2tay2eNZG2p4oMmDNTJ1g=;
        b=dHGPHqVMippAKExnWJAhpc8XzZGn4QJPZ7Lq0b5XbC1K4CA8l7RGK7aXUPgHwx5zLv
         KSw+ZgrC1DVAIw8vUFWA5VXAH8iy59pSJBt6v7r8LRYnJHDY+e8zVDGByGNofrcfj3qM
         DEyjd5Bo3AXCQ6/d7GGkrWyhcVB38yk4iKWBvpXzQrnFTMX85/Cu5SjyfGtCYLb8CMmH
         qJZs2MSOIepkJmYx8wbAXVKiGI0ykR6ltkqDSq5ILoTS1eRcTaXXHFSGmahKNrxSkOFW
         Ngslsm9jtLIzK27zh3Wiyt/tQRwTqxI5PR4O3fjbF2nGwjrPt0KOTNZy/Ep4/Jdn6lEs
         aJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vaSrJh4e0zkwDTbfY3DOMp2tay2eNZG2p4oMmDNTJ1g=;
        b=N9M006PzJVVLVebXG2CWfcRK7Gdv4oM4Ngl54m4fdynGJmwGvFk3HrmAewUIBA+BDR
         10Upwnx/AayiLKfg/MhQG4BdN6LuCE9Xs4gHB8A16pKvTqJE1vxji/UH0EGamsni5oRo
         dqS0YHpKCnAIeJ36m8J5cGH+tnkyKamFkmw3GwlsLqOXWJatouciTla9IhjBL6JZ7rok
         Ga3j0ck14XWMzp2pdNfvghGaJbtjDQdq80uvwjOSIszw7uXzRGS1wCjUXbOIowlag2g0
         /0P0ZBnkNyVAlzL64aykbvMnckPcjrYrZNh2+CCL+OyeLBGf8nGEhtbS9MnFwMHSHIRm
         Dmtg==
X-Gm-Message-State: AOAM533F5UBn79r8LUJFGXrdw4JA3lmr0sRUIz18U8YsQpOWcMKzfFVb
	PfrGdHFKh9bvhx5FPOVjIakEvtyndhm2Wfs6
X-Google-Smtp-Source: 
 ABdhPJy7TZtEhknY187i6WYkQa+QoESXb79MVZ5pVWAqUdZjQ5vL3gtIUt33pxOmtTcsLBZHdUdRMg==
X-Received: by 2002:a17:902:e841:b0:15e:b10a:9f40 with SMTP id
 t1-20020a170902e84100b0015eb10a9f40mr20776851plg.128.1652193586104;
        Tue, 10 May 2022 07:39:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/40] cve-check: no need to depend on the fetch
 task
Date: Tue, 10 May 2022 04:37:07 -1000
Message-Id: 
 <a76b642736d78cd4dec0ae264da6d0ffd4e9aaf7.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165445

From: Ross Burton <ross.burton@arm.com>

The only part of the cve-check task which needs files is the patch
examination, and typically these patches are local so fetch isn't needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c9b3186d3b7c18cbea239ab9b06e85b7c243b54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 78516d0bb6..7cf206299b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -126,7 +126,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build after do_fetch
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.25.1


