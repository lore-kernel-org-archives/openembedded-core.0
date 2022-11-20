Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD8FC4167B
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.13300.1668953796617699692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=It2yIK9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 6so8987595pgm.6
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HiQy1GKfxtky/g/xoT1NAKewvG4qKjBYP7fAvx1pAM=;
        b=It2yIK9A0oW1CAyKG6irAh1TgKMg9c2ywufN+qdrDU18fVQQMyinl/RHtbO8kaoRqN
         nBrX9r33fly2Z4lTcvKPIvinPPKpjvSuugNk6MDDDSggLO27tjvqqe9ZOUj0L8wYgUWH
         7LZQWbrEUP7l1E2Gqct/znMovwu9JIeq+bM1h9guIP4lAc6yToc0ulikzrXrYWafHys0
         LQlb4x4gWuSDPI0Cjx6M1YQd7W6I+5kRSZRTA9HNCWcIR42azGhuwnAZAYhuAjjnNiyd
         cCReAaJs8932tQDq2lK/nlYRdA+w68FbcYakxwhxW1j+bbThlW4nm6P5BVThecAjcnXN
         ZzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HiQy1GKfxtky/g/xoT1NAKewvG4qKjBYP7fAvx1pAM=;
        b=PfKwhOPq2MHKwt2FnHeYlwJU1F1MmuHdJvqKOdlSA+UWW9grrm+q9kwT2Wy3L2TZWy
         oiPpGPIZeZwWXI9YT61bjZ5hx4jEVbQqhQHBM6hScKFgHi4k/vnPg11tQQtwDIlfzbJX
         XKDT/1hrfi9wV3gaK4eCieZP/Zlw7pPOd4uzUsHa9muRsbucj0HtdAxZd/W6t7hOBNx/
         aaKCVzhWUkq5NUR5WvOB6H+qJ2A8PzqG86iazRMqdIcrwVF3eHW23TVcr9/x0rpceBjB
         gVUAedEAhKM0OZnNBy3cXbu3FTG08EyUmwnjFlealoNtMQcYiew0nDvG76+SLs2yeHUd
         zDXQ==
X-Gm-Message-State: ANoB5pk1+Py59tENdViJG3cDpKuA9i6bz/5NxIE00KbD6jr7jS55VGee
	sACgmycgPTXrXmH9SKHoZlZx1Khtj4olR5UPuS8=
X-Google-Smtp-Source: AA0mqf7k0PvCEZ+PtxiZTHq8GziH5JmoFhb47J2hxJjnNSssgwrwi1SADpXD+enF2XsMBwHH2NvdqQ==
X-Received: by 2002:a63:747:0:b0:46f:2780:93b7 with SMTP id 68-20020a630747000000b0046f278093b7mr4455184pgh.166.1668953795562;
        Sun, 20 Nov 2022 06:16:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/35] gcc-shared-source: Fix source date epoch handling
Date: Sun, 20 Nov 2022 04:15:20 -1000
Message-Id: <0511f24264bcc27d6b61edd2e16f899c985eb8ad.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173631

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The source date epoch for gcc isn't being transferred from the shared
workdir to the current WORKDIR for the specific recipe. This results in
the clamping code within sstate.bbclass using a value from 2011 which
changes the timestamps of many files. Since this happens part way
through the build, if pieces of gcc haven't built, or build/rebuild
later, we see things rebuilding when they should not and for generated
files, races are possible.

Fix this by copying the SDE from the shared workdir into the recipe
workdir.

[YOCTO #14953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b996293b4c8ab7ff3ed852045d17290df29205df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..cd2e341099 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,13 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+do_deploy_source_date_epoch[depends] += "gcc-source-${PV}:do_deploy_source_date_epoch"
+
+# Copy the SDE from the shared workdir to the recipe workdir
+do_deploy_source_date_epoch () {
+	sde_file=${SDE_FILE}
+	sde_file=${sde_file#${WORKDIR}/}
+	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
+	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
+	cp -p ${S}/../$sde_file ${SDE_FILE}
+}
-- 
2.25.1


