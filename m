Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332C4C4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:37:55 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.10765.1652193470050053591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=s5SiP99v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id x88so4503565pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RHaluhbIJIHbq0HPvYVoCyMx5pm3rXDnO6ZTLkwaMSs=;
        b=s5SiP99vPUDzUgiZBUKNaGEZVmpgybEhx0jDKtxA8Dp/zcA//Aw1QKZRT5gFU186BZ
         hcAdN6hZ2N9SRLE1X0YxND7BZzJl+xX+SVCBu1YKtJDTNLivFocTEaQoGuX/q7qoXtX9
         bKZc1Uv2HPrTDjePH2Sno2GjgkbXHvgiX9CBkKiW+gSnLcB+LMV09u1qEY40kUjxaNcQ
         +k9qEzuY24uBC6kVM4BV0Ios3lToJoafNnoP7aV6TvnMBuA4vk77zOzrQxIW1fD/XvZE
         gUVgCp1rcafPosx2cNc6IEQi2Wwnxt6gM+/9Yc8tffKGRVLY1dAIlcqfevixaIwwXxmD
         nEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RHaluhbIJIHbq0HPvYVoCyMx5pm3rXDnO6ZTLkwaMSs=;
        b=2hhlGmo6S1gXaZdk12Z6KpOy8JLO42pkeIdRtBVXYtuRSyOObjzxFC6NBQUglNL4pn
         RmxVPrvdSVNg3cMk6CA9Wg7elqfGIM6UV5xMKfQdKJCDv16oZIWKGN3LXZPIaBpN1BGh
         Q9t+KSAKPT2deY9uViVSDLTLn3f9vMl6zMXWSNdvkp3ILq6pW/Xr8ZBf353p8Fn4niOM
         fsVHodkWni0/2gLnTkvCglC4NUBVj1xSlyt02M88qG5EIvYwh3ThkbV1vIqdfNEfPGEY
         FdbbFHfsZQnFL/0GB0UJMcBfh7e1QaOx58yat/NR3Xy+Tg9nJHIgaN+4YbQZ4dJesGHm
         WasA==
X-Gm-Message-State: AOAM5323UZZXGKPOKN7zELpaVKTxdRhHCqniRPKufC3N3iSOxdIOh3K9
	Urv8m4wVFMdkNwxYEgJJX6h31c7ZUjfZOdf2
X-Google-Smtp-Source: 
 ABdhPJzj8D7aQa1BGb78/pRmkdF3+q8RIxZ4j1tDgoHm+crNvD/e+wETyPe8zxsLjJHiiCugYPtvgw==
X-Received: by 2002:a17:903:11c7:b0:151:9769:3505 with SMTP id
 q7-20020a17090311c700b0015197693505mr20966614plh.72.1652193468657;
        Tue, 10 May 2022 07:37:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/40] lib/sstatesig: Fix find_siginfo to match
 sstate filename generation
Date: Tue, 10 May 2022 04:36:43 -1000
Message-Id: 
 <3230134c0e5654afccf4f8831ab1101615502162.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165421

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sstate filename generation was changed a while ago and taskname has to be
passed into core functions for the correct filename to be generated. Update
find_siginfo to match those changes and pass in taskname via SSTATE_CURRTASK.

Thanks to Gregory Lumen <gregorylumen@microsoft.com> for spotting.

[YOCTO #14774]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51d7310b6cf8ef9033d461868c07f686656070ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 2cf858e201..7150bd0929 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -382,13 +382,13 @@ def find_siginfo(pn, taskname, taskhashlist, d):
             localdata.setVar('PV', '*')
             localdata.setVar('PR', '*')
             localdata.setVar('BB_TASKHASH', hashval)
+            localdata.setVar('SSTATE_CURRTASK', taskname[3:])
             swspec = localdata.getVar('SSTATE_SWSPEC')
             if taskname in ['do_fetch', 'do_unpack', 'do_patch', 'do_populate_lic', 'do_preconfigure'] and swspec:
                 localdata.setVar('SSTATE_PKGSPEC', '${SSTATE_SWSPEC}')
             elif pn.endswith('-native') or "-cross-" in pn or "-crosssdk-" in pn:
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
-            sstatename = taskname[3:]
-            filespec = '%s_%s.*.siginfo' % (localdata.getVar('SSTATE_PKG'), sstatename)
+            filespec = '%s.siginfo' % localdata.getVar('SSTATE_PKG')
 
             matchedfiles = glob.glob(filespec)
             for fullpath in matchedfiles:
-- 
2.25.1


