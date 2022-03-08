Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEA2C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:13:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.8181.1646748836560932320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b9xg27b4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d17so8600452pfv.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uJLB55i/yv+vA76YW7i15mgSUEU+jeAERSFZyD25GMA=;
        b=b9xg27b4kajflCKtYA2zgRCPm9tbSW5DYnT9Pumd2ixV3tvnGetE//fDpUBj+CBz8b
         HmlM0cQEmTErWWgUtS9BAPELoBKOCuuDdAd6v0TV1tEpKVLlp4Xqzek7niDyTHFXlXq0
         1QWiklaXzmZz9dD8L3i0QuXoHU2kbgshpXW+px9zXDOsSh2qjLrusPC2unG0VRq2iakf
         vajInQTv2yLq60taLeQIlcfNR4myEJIJowH73ltRvcsv8hzP//vizBCRM4aRml++Djnv
         LG7WK7NDqh1n3ImVVK3UuDjTyhvKsRylO5jPYxIAKONcn2sL0Hvi6eWxTBkQgZtXEn9M
         0qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJLB55i/yv+vA76YW7i15mgSUEU+jeAERSFZyD25GMA=;
        b=CXnZrmwX9/r+2FVcj0sREE18Ju+TrG0uN3RSwpAosSxz6hGUXd+GVv3JeJa30UuX5a
         xHPOTXRnBdVsNwDIAIJfd4k0ue/4BQl8mOUm+izifyoAVyt64GLAkr1qsQToeBuSppJl
         bwm0uxfBAqGO6wQiq/uxJb7zKAB9vfy2teq7s49FsqDNLLlxp/C7hQiIJOlOzC4esHHt
         04E7K9YBKoeEpHdwD+/rjon582KrhwUPrdFcieSox3A5pmQdep6UBlluSdBQFfdZfNbM
         UlBYHD9fkELZUXDpriMjpwgAiRf36jIKaK/EK2hmINGVyhC5zvV0pCRMbYorzkq4lqlW
         8M/Q==
X-Gm-Message-State: AOAM533idkenPW7hJ79f1kVVC7V1g+JrC5RN6O70cbmlIPDpfhnNAiwf
	ciGwt4e32y5IMnpfu1rKR1p4jzlWA7ftUH5Mrt0=
X-Google-Smtp-Source: 
 ABdhPJz2fUA7U9DdZLOaIzRTvslKcnKUtj0WAcNQyzmZsXvSH583LKKEd8py3PTpAP8QRvBDum0TnQ==
X-Received: by 2002:a65:4c06:0:b0:373:a7d1:75d5 with SMTP id
 u6-20020a654c06000000b00373a7d175d5mr14007124pgq.502.1646748835507;
        Tue, 08 Mar 2022 06:13:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e21-20020a635455000000b00372badd9063sm15160884pgm.11.2022.03.08.06.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:13:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] sstate: inside the threadedpool don't write to
 the shared localdata
Date: Tue,  8 Mar 2022 04:13:32 -1000
Message-Id: 
 <604146a242c3d5f5a9872bb756910f4bd1b58406.1646748150.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646748150.git.steve@sakoman.com>
References: <cover.1646748150.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:13:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162906

From: Jose Quaresma <quaresma.jose@gmail.com>

When inside the threadedpool we make a copy of the localdata
to avoid some race condition, so we need to use this new
localdata2 and stop write the shared localdata.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90fe6948a9df0b43c58120a9358adb3da1ceb5b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 00a0e8fbd7..3d6fb84d63 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -961,7 +961,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
-            localdata.setVar('SRC_URI', srcuri)
+            localdata2.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-- 
2.25.1


