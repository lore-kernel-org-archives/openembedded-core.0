Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76413C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.2474.1647901795599419021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=d4YFVGTx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso553707pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+xDuSFHO7axlhqFWT9pXH8u9UaA8AnagHC1u/Jly51Q=;
        b=d4YFVGTx1wG8tefVzC0J8jgYYDo4GorUfEtXPMiWMycCQlaXBH4uZ7ySfsPKhnJ2kS
         RcoNVF2iHi5DIZrptgcaieNFl6wncAAC11JHh+3q13aWKynLzsWUA1az6P4b4R+Oqou+
         QeRWkZmjSAZNR6QsputAwNM6KJ+RZ0XLgKlOlCg861ESgudvgJiFKMSeIA+Rfk8vpNpE
         cxjuoAqxSpoD01m2AkhNcTr0u99K2s6VvE/3cI9dHIHZNeYaypGhdeEW97+rURZl4U1H
         g8rDOJcPox250Kw8NuJuAomEYx5n+0LYn61jsR8Jl2nxDI7+VmDN2gDKW5YQauJyX/0p
         xJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xDuSFHO7axlhqFWT9pXH8u9UaA8AnagHC1u/Jly51Q=;
        b=HcZQbEUIRKPQFtxCjJMKwBpEhERqNC/QvBzTZP/AgqLsbMXes//ST9dNhCC0N5SwZg
         V1Ri8LTLkp/2vSscX8X9uXvSVUmSjwh+IJEKuwEyxeuckafWntWlmcScTuERZPD7faeC
         OeIKDmEHovSlsyPMJzJ35V7rb/l5TMUJuktQofqqr4FGMTL1KB7n3CYVlYpo8p4rOKL3
         uC5xvqdmyeYeG+yyw3osDwcZNIKxXhLvaEkuINdKy7sUJG0MMsDPrGCFzljXD5OAjWqT
         zTOJBETrtiODgsmmu4FQiB2g0Lbr7VyBUnpLqju8OXLBqsUiKm6+0YxtMCpRgoXGVLMC
         zKdg==
X-Gm-Message-State: AOAM530g3UDIKnBigG6rRZe20a8fKPzrQketyA/QBVIB1vbkdK9bJbvR
	dF9RywFAaat5eUofCa72Bq0bjCJ2upHAObVOPGA=
X-Google-Smtp-Source: 
 ABdhPJzD0zl5ECLZNkCNlYYZWY5A0b2O5ps4owEdKciyW6V+BeLNx4BMiN0n4mYK2PCEym16H+34TQ==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id
 oo15-20020a17090b1c8f00b001b8c6dcca61mr1406980pjb.13.1647901794725;
        Mon, 21 Mar 2022 15:29:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/13] oeqa/selftest/tinfoil: Improve tinfoil event
 test debugging
Date: Mon, 21 Mar 2022 12:29:13 -1000
Message-Id: 
 <71015408c60ddf2e9af00cc8574815971e1b689d.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163526

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We still see occasional test failures for unknown reasons. Add some debugging to
show whether the matching files event was received even if the command complete wasn't.

Also ensure any commandfailed/commandexit event is shown.

This will hopefully aid debugging the next time the issue occurs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f7a788bb51ef09ee23c94176285437ea760fab7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 4fcbe594c9..11cbced5ea 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -87,7 +87,7 @@ class TinfoilTests(OESelftestTestCase):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
 
-            tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted'])
+            tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted', 'bb.command.CommandFailed', 'bb.command.CommandExit'])
 
             # Need to drain events otherwise events that were masked may still be in the queue
             while tinfoil.wait_event():
@@ -118,7 +118,7 @@ class TinfoilTests(OESelftestTestCase):
                     else:
                         self.fail('Unexpected event: %s' % event)
 
-            self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server')
+            self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server (Matching event received: %s)' % str(eventreceived))
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
     def test_setvariable_clean(self):
-- 
2.25.1


