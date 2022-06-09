Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ECFCCA486
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.11845.1654774657202701677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KlwYDm1t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id a10so9754865wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PVgeyY7ty8DdDMk1kYRgja/R8gmuGFxNCIgegjm7Wko=;
        b=KlwYDm1ttiTaDOwUO7vN1X/Nmxq9rmCs8hPh4e803F8TCsSs8qJcO9WltBvbIRrlqt
         kt2JGQ0sVL9iWM6oSPQ1D0f8PphCu/mWzIkrCnEfM1hXXSjSrYcehmwaVZgB4Sh6SwUB
         Uxb/be57gJMKSODBJKJYJ3j5I/2eBQgU50G0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVgeyY7ty8DdDMk1kYRgja/R8gmuGFxNCIgegjm7Wko=;
        b=UyKKkuZrJYzWBFQA0G6FyouS/+fJnp1BtjCnG1Bp8tBGUwlcwplc3JkNawZI2Cd19g
         vk2IxVqFhLHT09wK1inAXVaj5ZbZNQ+l0slQSlsHq3DhlerH/Z4nuFq2asxP4nWu1YJy
         A6O+r4Gt5SJrtpoJ7NMXfN3++TK4RCKaRTkq2lj1R1DFPRiAPzcbnyG8tHposYkJu5tG
         2d3V5dJ9bIbTKeryaj7TLeeUru2NpeuUep0cbmWVjGDdtq9RtwFhvS7jkiW9xqGc3JGD
         vs22izfFUSyNLivcOFdxxB/N/lsvZFzNL5F+Ss1iDz1rvz0yl7lwIjWDRr0qJ31xs8fm
         sZYQ==
X-Gm-Message-State: AOAM532VU0obsNWLRUVyjAv5wLATcslkmwCIk8wZM1UjjQsHKHEW+pXT
	8VYV6cBCjNd8EUPh/k4ufVdOICUrcPPhDQ==
X-Google-Smtp-Source: 
 ABdhPJwm1XSeMLhk6PdcHDDdR7sg4ayiIgqo3NSFcW7miWBdOt5ZFG+HtbMLbVy6jRb6AJsPde1pDw==
X-Received: by 2002:a1c:4c12:0:b0:39c:6750:be17 with SMTP id
 z18-20020a1c4c12000000b0039c6750be17mr2968144wmf.21.1654774655305;
        Thu, 09 Jun 2022 04:37:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0039c5a765388sm9843899wmq.28.2022.06.09.04.37.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] buildcfg: Drop unused svn revision function
Date: Thu,  9 Jun 2022 12:37:30 +0100
Message-Id: <20220609113732.43566-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
References: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 11:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166772

This isn't used anywhere and everyone is using git now, the functions
are now hardcoded as such too. Drop this function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/buildcfg.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index a7549f1e229..364c40a2f02 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -13,17 +13,6 @@ def detect_branch(d):
 def get_scmbasepath(d):
     return os.path.join(d.getVar('COREBASE'), 'meta')
 
-def get_metadata_svn_revision(path, d):
-    # This only works with older subversion. For newer versions 
-    # this function will need to be fixed by someone interested
-    revision = "<unknown>"
-    try:
-        with open("%s/.svn/entries" % path) as f:
-            revision = f.readlines()[3].strip()
-    except (IOError, IndexError):
-        pass
-    return revision
-
 def get_metadata_git_branch(path, d):
     try:
         rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
-- 
2.34.1


