Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8831DC64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:42:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.44252.1676990519697908885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lOfGGYE3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id cb13so2587599pfb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfyXsSgZ29yWeiNFmUUKhco0Tq+gvqz8Q0lXism6amM=;
        b=lOfGGYE3wOw3kaubLIndOIPMS5DzWVq/iAqDEwbdb2id4JHr4b2KCi6IzaS8VO0sBm
         coRVpz/CNIvBeNdOPN1jVYZiQQrvoa9OmzEfD2+KUTjlOYhScwxHIQp++PIN8w/+oHwU
         LeB2Z99dCwoJS6nS3DQ2up2t6m0/Kb0ebTgTBaFNGC1SwSCT0rHar3/NTKLpi8mG/jAF
         3HFSIAhsh10q4Gs+8Qxg5wZb2/PlswiDXCcs+d+X+SaActx50dM5QlOtkVMvU/4Cmbb3
         XDGRoiNcpB9z57amJpNWuojKEv/urxMNjTGVZxIbH2k9E8ySvsRslesGEPMK72sQFuSH
         zb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfyXsSgZ29yWeiNFmUUKhco0Tq+gvqz8Q0lXism6amM=;
        b=VrxtsF86UqAmF0pPrLXB6TmPQUEGCrbbYgyoZSWvA+2tR8aeuWSJ6FhjVd+i2opUEG
         dAxJrpNHQsG/TZ97z+713gHnhnxmM1bK4JQ+JkoeKcgXO3GPDAgRpyk6ifqIbRCVzWYv
         /ZyeKc1oeedPjmyjI/0wlS9OhB1vyx4yDoqLuawFanWDAiTHmJ1Vfoc/KEJnAZpoyjsc
         tDoYvrf8tas9B24Igf29uqBiNF2eeZmkWKY8qWt/VnNgcewjvmQmrri9mcFRm8PEDzzq
         uEa/uc3q6v3UQZ0nXSJOm7dKDCcEG6bXx0rPnXX8oU8Knvl2t+THbB4JR/09v8jtej3Z
         wv2w==
X-Gm-Message-State: AO0yUKWkw9pZoIE2HRXKwYMkA90h28wDF2Cv3rgGKJaSDZkRuiHm6Z4m
	iCpzQzaxghTahFkMCQqmnLRff0ZVG2wQ9GtV/eQ=
X-Google-Smtp-Source: AK7set8QuoRwRftRjnQjC/2tLaGEFJ/aT/Csl1c/SlYC8+rAd2TpO0O+V4S+WurFAIqY3vYZ1BfkLg==
X-Received: by 2002:a62:38d3:0:b0:5a8:d987:d012 with SMTP id f202-20020a6238d3000000b005a8d987d012mr4248844pfa.11.1676990518722;
        Tue, 21 Feb 2023 06:41:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/23] oeqa qemurunner.py: try to avoid reading one character at a time
Date: Tue, 21 Feb 2023 04:41:05 -1000
Message-Id: <e91a09702680b713293bcfcc851b27a73e884a8b.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177522

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Read from serial console with a small delay to bundle data to e.g.
full lines. Reading one character at a time is not needed and causes
busy looping.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 0049f6757f6f956fb4cc77b3df6a672c20b53cf4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index aa9e530f1b..925d05a339 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -647,6 +647,8 @@ class QemuRunner:
             except InterruptedError:
                 continue
             if sread:
+                # try to avoid reading single character at a time
+                time.sleep(0.1)
                 answer = self.server_socket.recv(1024)
                 if answer:
                     data += answer.decode('utf-8')
-- 
2.34.1


