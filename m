Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC13C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.91902.1669557384265128684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QFkv2sb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so7994657pjg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX2o4pjOqsCyu1ay/OtapLw0k58jI1jeLSmcD20hXpY=;
        b=QFkv2sb/OAkeKMQsOcAZTnuhkcMTzM59T/nxiOlk5ilDGeb/ZwvFsDPHP5tNu3Xl2E
         r+fdlxwPBEd1atW7KIDKAktcrhyKU26MuV7vRlmsnLIFjWGcmEtt8SkyvCWoTOiWjEtC
         iAyc+wYObvkqZ0zpLkUTI6Hs2WY1WJ4seWykIKDcbkgPvwtfyQV7NoqrettmjiMJ3XCD
         PB/fyDTtRLVdCgeKuS2TG82klg24ijR0vfmbEGdKxRRuifL03n+kDIfbl5dC3x0+JtvY
         Mm5bHDCJxqVpSh49UmMnU47hQNAgqmCZsSfcQd79fiahoFszUc57iY8DHEutHHQQsB/u
         /OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX2o4pjOqsCyu1ay/OtapLw0k58jI1jeLSmcD20hXpY=;
        b=yei0vslIjc0th03PRQK7iBhYUau7/Gk3xQKUxDNsTjpS5ArIVTsn6QLIXVY5zpOrWc
         wpMiFd2nABMj71zw/kDh6S3UxQfK+0jo3QL8CjXvIRQa1nMsYJuPLC0PkUenmwdos4fj
         qT9ltDe+izwa8L81ljdl9urmM4DnFP7rbwyCgIjd7I6m2w9krZdYcK9SVMttm1xEJ+Yv
         DZ3EO3cRmEfgV3WrCOLVCqwFmdKutsVExQfI3KnshP5XRcN2OfZpPVdMDq0lbiJWZa1b
         p+dwEOj15M3o3qtZVkQF4TZr6J7husYTW4vfZ8r/WH/u5ahSf9d1+WcMVFgcAdKYogQZ
         LKMA==
X-Gm-Message-State: ANoB5pnYsJ8TVNkYpzkOL1lfSJ7/k3H9xjJN3nCGYNMf32I9aE4sXHR9
	aLfgR2zRONqVFFr2ItkYC1ybdvZGSd6Pel+VVV0=
X-Google-Smtp-Source: AA0mqf4E849jzMafq5MiXsQrq2mbmQ8giOckTXr9H5PwllEdcM5GYjYBOCXt0l3mVAR1L80tbBPdBw==
X-Received: by 2002:a17:902:bb84:b0:186:e222:9f05 with SMTP id m4-20020a170902bb8400b00186e2229f05mr27733525pls.61.1669557383301;
        Sun, 27 Nov 2022 05:56:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/31] rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
Date: Sun, 27 Nov 2022 03:55:12 -1000
Message-Id: <c06df50b0c7e6ecb138f37c51196c57295649437.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173871

From: Jose Quaresma <quaresma.jose@gmail.com>

We can exclude the SSTATETASKS from the rm_work task signature
to avoid running the task when we remove some setscene tasks
from the dependencie chain.

The inject_rm_work handler on the rm_work bbclass triggers the
rm_work task running for any signature change in the dependencie
chain of the task do_build of each recipe.

i.e INHERIT:remove = "create-spdx" will trigger the do_rm_work
when we collect the sstate cache with INHERIT = "create-spdx"

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 77729bea5b17d65dafb604fd1665c612091b28c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rm_work.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 5f12d5aaeb..c2b569903a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -106,6 +106,8 @@ do_rm_work () {
         fi
     done
 }
+do_rm_work[vardepsexclude] += "SSTATETASKS"
+
 do_rm_work_all () {
     :
 }
-- 
2.25.1


