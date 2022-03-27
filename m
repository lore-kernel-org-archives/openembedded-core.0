Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9441C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:35 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.783.1648399295282560050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xzI7FxVZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id t4so7375065pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NDRZSz9xmMbBWUg5FjskqqUGTv6sN4JNQNaZZw/zI7I=;
        b=xzI7FxVZFqfnqnpjJYwIfNaK7sW7bViFKRJpISauuWQlxjaC+JnKypENkC/7rfHD5+
         8ovJU72Jrcq3CACk3Z4mtVBwlRQNhtAjWXzoFH9XogHU8Y8eExEZGbVRQOi4rUCHTYIr
         4/8bpV1Q8rNbxmQZaLwSZwUH4tp+u4r2xX786XhjSsgNl3tSR4cuHS2w49Eqx2568guL
         I2+q9ZpsVEa+QdXsHThakzzhkQhDCbghGTs2CMzKye1/UNVyX+oSRWc0O9UYapFHLkax
         zMzegHZko8gcpmi+OU0ErFmt3Lkj+qeYRRruKzt3sUkPbFO7Ub64Vi8XPeYlx5uxWs4M
         H0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDRZSz9xmMbBWUg5FjskqqUGTv6sN4JNQNaZZw/zI7I=;
        b=pwl1qNC0xDR0flieJbOE0Ln5T/d2pGBdAukbMi0kI6B4TgDAQhlcJM06xN5+Dh8USF
         1hVofeNzORIq+nODdOD6bFtAD1fu6MxrCgSQirKmh7JNYBjScPfye3596MfWulMtojjI
         EDBPUS5669meErPBGV2YuylfEAIeQ7tlTQRI5yTw/kwKXN8IjI7n7CgqWa2eWLXpI6C1
         hE4Yms/cCLAUVo5WmviVK9u8hUZtEk8Kj1Ct1SfEVSxnApq9E0qepHVzh7qzLHtmzLa9
         7qCfech+PFyPmYcBDj6LU/v6KvIXWwCxWL3w+h1FHFiHWL/UfKB3ZvemAhjD1Mug/Zim
         +u4Q==
X-Gm-Message-State: AOAM533wF+DjWd3Uo0WgEa3nf0qnRerK18pyXVL6GF2W3XqEc5Szftre
	D98DmHl2zDNuHyIjGxM1CeyqgdVqBryk74dBbJg=
X-Google-Smtp-Source: 
 ABdhPJz7ZBGIoVEcAndruKZgrEn2Q+c8DVs++jwjy75u2lRI2ZXRoTg4cQd1BYqNyQHBIacfkfXEpg==
X-Received: by 2002:aa7:8893:0:b0:4fb:10e1:8976 with SMTP id
 z19-20020aa78893000000b004fb10e18976mr12593904pfe.36.1648399294440;
        Sun, 27 Mar 2022 09:41:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/10] oeqa/selftest/tinfoil: Fix intermittent
 event loss issue in test
Date: Sun, 27 Mar 2022 06:41:00 -1000
Message-Id: 
 <da5cba5ec56cc437ede46d8aa71219a2a34cbe9e.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163676

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've been seeing occasional test failures on the autobuilder where
we don't see the expected events. It turns out this is due to
run_command being helpful and eating them if the server is fast and
the client slow. Adding a sleep into the run_command code makes the
failure consistent.

Use a new "handle_events" argument to allow us to handle all the
events which is what this test requires.

[YOCTO #14585]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2292983c717b8cadcf0c443bb7b649a84ea5ad57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 11cbced5ea..686ce7e6b9 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -94,7 +94,7 @@ class TinfoilTests(OESelftestTestCase):
                 pass
 
             pattern = 'conf'
-            res = tinfoil.run_command('testCookerCommandEvent', pattern)
+            res = tinfoil.run_command('testCookerCommandEvent', pattern, handle_events=False)
             self.assertTrue(res)
 
             eventreceived = False
-- 
2.25.1


