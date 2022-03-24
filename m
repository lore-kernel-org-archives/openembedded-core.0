Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB00C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 17:37:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.14307.1648143448239595189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 10:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ja1s6eeV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u16so7668905wru.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H92pQkF8/ELs5woHFxisLrs8nCRDLTgCZ5DnSNECEBQ=;
        b=Ja1s6eeV7ZSUqZpMGCxJhx+0vWyUYQRrkCMl3yALeh11EX2V1sJzDTrfyHFfiHVH1x
         ivI9Ez9E357mkR384gKqNCyqTQRmsFXHP6PprVi0rdfumya3O7Ltmx5yDAelf5MrGyTY
         l/N23EsVtIsaWEfNij+mFvl33ENpeSsB/5U3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H92pQkF8/ELs5woHFxisLrs8nCRDLTgCZ5DnSNECEBQ=;
        b=ZuoaqaRp/fZ2EUPhJWm+aillcAu2Y5EKjkq0QYONp4R76v9BP/cfDJkQ3qr5QdtuF7
         UipXLbcjdJgQUGLGNZSQNYd1lrJ/pj7/6XVZDfohoaxkYOaGOuHdjksSRXyfDEcEyYw9
         DgJWuEtJRrBNsxitOoLwpaRhwZsfgf8K4zSOE6qoi75+GqnhudhVVgLLaBM4uZfvzHmx
         P0Ms+WglRaxEs3LBBd+tv5Wg5lL/xRO8NWyWoJgiytHpKIxzwJ1Fhw/14Jf8QVSB+L1D
         1Qqg/8Js7jaJauALz6xK3Tg14JsP1qMn0JJCVyXoaxQfr0rZPY6TXu0lrH7jRH5/aTrN
         i7lw==
X-Gm-Message-State: AOAM532th5B0c0/QmKjn5U/7BeXn0sbZUvcVVEpglYjOvjMzpPW8PQm6
	KaCgRxTqOYzuNwTbCOWa94neTdcwnMHYQTyQ
X-Google-Smtp-Source: 
 ABdhPJzywLxk2R+kZyWyYfEQlKYaxEPL575y4V78cVAcw+kwByr7iJtNecwbN1kFOGVDQ2OthiLl+w==
X-Received: by 2002:a5d:424d:0:b0:204:7fc:d6c6 with SMTP id
 s13-20020a5d424d000000b0020407fcd6c6mr5372221wrr.291.1648143446349;
        Thu, 24 Mar 2022 10:37:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:468a:3ed0:d59:9804])
        by smtp.gmail.com with ESMTPSA id
 bj26-20020a0560001e1a00b0020597757ebcsm2056790wrb.7.2022.03.24.10.37.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 10:37:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/tinfoil: Fix intermittent event loss issue in
 test
Date: Thu, 24 Mar 2022 17:37:25 +0000
Message-Id: <20220324173725.1325265-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 17:37:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163620

We've been seeing occasional test failures on the autobuilder where
we don't see the expected events. It turns out this is due to
run_command being helpful and eating them if the server is fast and
the client slow. Adding a sleep into the run_command code makes the
failure consistent.

Use a new "handle_events" argument to allow us to handle all the
events which is what this test requires.

[YOCTO #14585]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 63ceddf118a..6f26af23d54 100644
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
2.32.0


