Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314B3CCA489
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 12:31:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.7063.1658493097007600753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JqggI/Qg;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id id17so2708326wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P89kXkwggxp7z9syyc2X/9Zn+F4E+sASuKCQ3cmY83w=;
        b=JqggI/Qg7forh9EkuXNjsWiHQSa6RKHb3GS+EuIijjKPsGC7jOapudWMt/OmrMAei4
         EsMNeKuNs8UjHmMfWrCl2f0nbjAOjxJLCP6Tz5yVx1THQgofAyqiiDXymwS1h+o15xZD
         taDZP769kdQi9yePTtkh4uDo8wglI5yXl1LDdwQmHP0w99VKr3uZWHuxI/XPPJJelxlb
         XQsRP7iqtwvcKSq5lLnkChN6u0Zzx015ptRIBXGheCWrW+lZrBGa1jfyM6b9kmBIKjNC
         WRNORpC8R4QUL5SEBhLrHzx911vuNHqcIP+APOb4jO98XoWbcYDp5Wz3tdMSLrmmHB2u
         d9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P89kXkwggxp7z9syyc2X/9Zn+F4E+sASuKCQ3cmY83w=;
        b=2/P20GJDlhTHtOz9RDENV6BU1m1u46DmqNREFUnN/vX15dYTBNTEPELcCm34IlScEs
         pSoaHUMj1bxR1mZD8T3YFBpvuab4vDzb9HhmLOGmOH4a/m6h64VfMcuNGf2qBKnhnRqs
         VvHgrtJsJoIoBkiKyXOfk3qyjvrpnQLqP049iQnnmdnB3WhSvK0adNB2ihEgeL414uK9
         dbqm9Ie5w0rQgYShVC8wgRAbulUX3h8qqj6d+ZhuNMQ79VRQydOwVWuwm7KnmxCemIl5
         Toe+8VIXNcSJu6JTbnQS45r5DEn/IgLU8hYkgRkzsbQ481j5A5Rh0eGE0MVI5guauDzl
         3zcA==
X-Gm-Message-State: AJIora89YJ7JUSgonT9jtOuMYVQoDTwlndekXChEwLc9LtbSaK14nCaG
	9gBg/iBYD9MEZDOdqnOmuOS1ijM3PLQPvg==
X-Google-Smtp-Source: 
 AGRyM1vNzO4j5B9YMsGfQ1AZl5LUMDcPgUOdxlNvbZYwhxQ6dcbNmpT0GpIULWqbpL6zHEkVOKeuIA==
X-Received: by 2002:a1c:4c0d:0:b0:3a2:fc6e:f8c7 with SMTP id
 z13-20020a1c4c0d000000b003a2fc6ef8c7mr337322wmf.102.1658493094938;
        Fri, 22 Jul 2022 05:31:34 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm8404001wmq.48.2022.07.22.05.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 05:31:34 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/3] archiver.bbclass: remove unsed
 do_deploy_archives[dirs]
Date: Fri, 22 Jul 2022 13:31:22 +0100
Message-Id: <20220722123124.390710-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 12:31:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168404

Remove as commit b3afe7d redifines it.

https://git.openembedded.org/openembedded-core/commit/?id=b3afe7d9bd25a943e947de3ec064ea245173c5a8

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 33070cd17f..5da369d422 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -69,7 +69,6 @@ SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_SRC}/mirror"
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
-do_deploy_archives[dirs] = "${WORKDIR}"
 
 # This is a convenience for the shell script to use it
 
-- 
2.37.1


