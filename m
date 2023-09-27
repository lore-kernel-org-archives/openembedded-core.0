Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EBAE82CD5
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:31:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.27937.1695846717866434432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EonoyCDR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-405524e6769so62858985e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695846716; x=1696451516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQKD2yLJaKUm6mZhsbPWK8Bl0VhrJ0f0p8wlf6iSAFQ=;
        b=EonoyCDRLC6uBDoVxPoA47l9NOlyparHpbdYvqACjHqi1dLxOZKSvt/Ptj21jkMmqq
         br06ND9ylZ4unfPBt6ZFLnn7ZL5w7Zqndv6NzIkUN5YnLOqOS1f7Z/aowK9qXnFLy/Qv
         EF1PqBYTZ+RVn2FCBvSiGcP7PaGYoM8esbJFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846716; x=1696451516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQKD2yLJaKUm6mZhsbPWK8Bl0VhrJ0f0p8wlf6iSAFQ=;
        b=dOi3vlXk3lahlhSuUxi7teV0ESjmC1QWhq8rBguULcTtycFMPkzX4QqghaIJTPtJD9
         svHUK6duQSFft9aydvDwYuZoWly6mf0hg+0EFnGjTNRsSr7qgaFIsDNnIOk2jAhQPdqB
         ObnVDV4ff09wRsK/fh9/fgyYSXwSD8ltqUfx8eb7KrFFv69tVP9vgkb5S8p1n+pW6H3D
         SZpKDxVxo4vRH2Oz70ghdbWk4P0OdeGg9TGcPHF3S8oeDFXQlKxjR+zAfX4J/kuvNtny
         thr69XjlifCJSG7Uy1IpG8oEaeUnPwegHMmwR5aYhFKuwnhI57gXqfs6xkO2kDV2ORqj
         gLPQ==
X-Gm-Message-State: AOJu0Yx161mpiz50ltNWUUj+0ECcVx2uYIO4OMprcivPDei6ryuMw7Ii
	imcV7TDvZl8zO0u963F7JMF0JSb7Kvs2IJGmNPs=
X-Google-Smtp-Source: AGHT+IHZxETBnNCLgC+GVBX6RlGly5onIgfAqWM/BgZyilm5v3LH5bplZnktLT2GNJP9orN0r+Oz+g==
X-Received: by 2002:a1c:4c0d:0:b0:403:c70b:b688 with SMTP id z13-20020a1c4c0d000000b00403c70bb688mr2685078wmf.6.1695846716082;
        Wed, 27 Sep 2023 13:31:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:259f:7d13:e5a1:bb93])
        by smtp.gmail.com with ESMTPSA id 22-20020a05600c22d600b0040648217f4fsm1558393wmg.39.2023.09.27.13.31.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:31:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/utils/gitarchive: Handle broken commit counts in results repo
Date: Wed, 27 Sep 2023 21:31:54 +0100
Message-Id: <20230927203154.2328132-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 20:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188341

The test results repository contains tags like:

master/64501-g65c94ca3196e5ef3344a469fea8e30444f2e967a/0
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/3
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/2
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/1
master/1-g65c94ca3196e5ef3344a469fea8e30444f2e967a/0

where the commit count is correct in one case and not in the others. This causes
assertion errors in the current code.

Add in some code to work around these historical issues where the commit counts are low.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 64448f47d94..f9c152681db 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -255,7 +255,15 @@ def get_test_revs(log, repo, tag_name, **kwargs):
         if not commit in revs:
             revs[commit] = TestedRev(commit, commit_num, [tag])
         else:
-            assert commit_num == revs[commit].commit_number, "Commit numbers do not match"
+            if commit_num != revs[commit].commit_number:
+                # Historically we have incorrect commit counts of '1' in the repo so fix these up
+                if int(revs[commit].commit_number) < 5:
+                    tags = revs[commit].tags
+                    revs[commit] = TestedRev(commit, commit_num, [tags])
+                elif int(commit_num) < 5:
+                    pass
+                else:
+                    sys.exit("Commit numbers for commit %s don't match (%s vs %s)" % (commit, commit_num, revs[commit].commit_number))
             revs[commit].tags.append(tag)
 
     # Return in sorted table
-- 
2.39.2


