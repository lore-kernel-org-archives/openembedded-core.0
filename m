Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83183C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 08:56:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5487.1662540963579221451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LYel6X+y;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bq9so6348734wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=psgWjQl9qyugR+ffQimE68Xc3/lyxCOKgc+Cay1Ax8M=;
        b=LYel6X+yrBKrPoN9MqKqEKEQadOySVBxagkWACzVz0WxAxqQuKvMYKOTyAyODMpVwm
         Bf3W2gvdgD0tWwzU0OcYnwtQb7pwhOrJ7tkhK3hTxoD5bjyRuip8PrRZJ/PG3W9UCu8R
         f2B9C+eVF2Vd2yc/uYs6ABUA7Zjn0i3uo215dNi7BrOm6SAzr7FgEmN4+2+yKK4Oczqn
         fUxgwU/r23m1PEcVwCRSPvUCbGUTPKFuUup5bjXA5Rc6hRYK0LHDlje0WyCQQfLLYSkL
         ULlSf6cpXlBMYTXuDEAt4IltqMMhV5rNUbShEcf3OMpUX8tQHVQoWc3lCPt9/6F4JupX
         jWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=psgWjQl9qyugR+ffQimE68Xc3/lyxCOKgc+Cay1Ax8M=;
        b=WgLivzyU/xS8QMdm3r4nS8PryYv6YXHK1PHzvw2d1fXPqVN4awPXYqirXG1t9JFEE4
         kBo4QR19N257zt0xEM04gUvscajk9nvwoY7hI0rD06InVvjAaH/ZVkn4u4PZEnqbTLjy
         o2CEOZPYEDVvVMHznWW4zLjd5hy1ieQ6/AxK2gK4KBG9zFB0KlQAt8Of1aa49ySPMNSJ
         R/XfvR+6mFYn3DfZ0fwgv3S7db4++RhyENYMNeEQWIC50bYmqqVMyYoPa4hUhxajU87K
         NdLaJePQZjnbnrTM9JMHhMjykTIaI68DROkFADIIKcTS75o0BrwmbucaITG6BpSimaNu
         hMlg==
X-Gm-Message-State: ACgBeo1rgEs5IxXqv4UXqlD3tx+VWPzd95JaJieMAfM0ihOJFrgsyMck
	IQ5yfehnAObEG9kgMjjPIfAx0TLJuhc=
X-Google-Smtp-Source: 
 AA6agR55OnA211a8rIiMZCbakUuAbk1IyctI4it46fNAAqfSj2C3e1We0rcfm9b2RXVblLbMsEJx3g==
X-Received: by 2002:adf:e94a:0:b0:228:6aa8:432a with SMTP id
 m10-20020adfe94a000000b002286aa8432amr1381189wrn.567.1662540962111;
        Wed, 07 Sep 2022 01:56:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c10cb00b003a5260b8392sm21498255wmd.23.2022.09.07.01.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 01:56:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/3] oe-setup-builddir: do not suggest local.conf as a
 source of examples
Date: Wed,  7 Sep 2022 10:55:52 +0200
Message-Id: <20220907085552.1171821-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907085552.1171821-1-alex@linutronix.de>
References: <20220907085552.1171821-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 08:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170375

This holds true for the default core/poky template, but not
anything else. Eventually there will be fragments and associated
tooling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-builddir | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d3c7f943e7..c4fd253d36 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -83,8 +83,7 @@ if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
 You had no conf/local.conf file. This configuration file has therefore been
 created for you from $OECORELOCALCONF
 You may wish to edit it to, for example, select a different MACHINE (target
-hardware). See conf/local.conf for more information as common configuration
-options are commented.
+hardware).
 
 EOM
     cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
-- 
2.30.2


