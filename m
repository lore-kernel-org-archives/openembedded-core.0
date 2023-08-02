Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F620C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 07:24:47 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9206.1690961083850974739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 00:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qOpc9wbB;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5221f3affe4so8752894a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690961082; x=1691565882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2SxVA7S9soWrP8hC6jqhcBT3v3B3tZw7haHOwUnJb4=;
        b=qOpc9wbBwaVl0jnZyeuhhSxXPkQSztXHzZYnReQjSILCewOIwhBESChTahcuqYrmBa
         dlk7hrg+uRDJeOyoYv9XkmZsM1szqotgj52r39UAYcRadHALvSeXsTiMs4OPGPsTWo4T
         jxiKCaernA2xFZa/XCIH2xuORWMBuVDMptxhH1Dp1jLlBxA7OqMadNz6DwwpO2944Pdy
         I+ANWqVyP8hp7FsmO+25qZIaxerV1owRIP56nProQbq55GYUdLBWDXEaG3C1js69rrTP
         o9j4/aFSaXDRYnA1J917hKE3avIHbVKGTzmAXuEbeKrTvcxd2RSrY9MLe302EWxoh1PY
         mufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690961082; x=1691565882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2SxVA7S9soWrP8hC6jqhcBT3v3B3tZw7haHOwUnJb4=;
        b=MaWqAUFlJ051Z5Sk5NLC9oJj6XXTLnUev1ufxJTXx6BwV8JJOeFEgs4AqlLi75vSVj
         Zcy0OdfQAxnjSAzBQvDICFPyXArhev6/zdSai6AJDnzHLPzQ/znHiNsS2BlfWwpnczPV
         RtYgAboFScQBQ8vEPota/ysIc1eLgM4qDfgXfN6MFtRywXRETBvLpbtxqCwC15LfVPDa
         Lz6kSkyKtWE+jOy8AsFDg02z34Wxb97s09gHbj0X2tFgHLDUYij0XPW6B8B/FCK/Lsra
         e9kp4YPoyrue0hETwlnj20rVicmSaIfR+cevqWxwkxXwpyQK3TOuQf2vC0odhQwkaxV8
         9ynQ==
X-Gm-Message-State: ABy/qLavwSxG8dadnFYcCCHPhW3viThIR8mX8V3hTcJOzOuJhPADK8iq
	t3snauAp7fntxrq/4DyTnAWWTOAJT6Y=
X-Google-Smtp-Source: APBJJlEoOniEVlCzGC3mrxiR9buWI6RSVWDTMAR2OXcldrk0esMBJIvSpIMSa9DiGtv0Asy1F/ibig==
X-Received: by 2002:aa7:d748:0:b0:518:6a99:cac3 with SMTP id a8-20020aa7d748000000b005186a99cac3mr4691670eds.31.1690961081787;
        Wed, 02 Aug 2023 00:24:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q25-20020a056402033900b0052286e8dee1sm8022013edw.76.2023.08.02.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 00:24:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/lib/scriptutils.py: add recipe_qa artifacts to exclusion list in filter_src_subdirs()
Date: Wed,  2 Aug 2023 09:24:36 +0200
Message-Id: <20230802072436.1020900-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230802072436.1020900-1-alex@linutronix.de>
References: <20230802072436.1020900-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185379

With newly added recipe_qa task, the function needs to filter out its output as well.

The issue wouldn't appear in selftest because it's triggered by buildhistory and
selftest disables that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/scriptutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f7c1bd9e4e2..f433106c9a8 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -277,6 +277,6 @@ def filter_src_subdirs(pth):
     Used by devtool and recipetool.
     """
     dirlist = os.listdir(pth)
-    filterout = ['git.indirectionsymlink', 'source-date-epoch']
+    filterout = ['git.indirectionsymlink', 'source-date-epoch', 'sstate-install-recipe_qa']
     dirlist = [x for x in dirlist if x not in filterout]
     return dirlist
-- 
2.30.2


