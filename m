Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5ABC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:52 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.1772.1645114191633143095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gw6qJU/i;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id f17so10574533edd.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nDw8dudK1CV6WD50yAFCrfgvZPqEfRATaifHBbOlWB4=;
        b=gw6qJU/iq98f+PRErQCz7Ure0hYgB/N4HCz7S2H7ME/oPtRRC0KJCwcy9H3I7HdecJ
         0+y/D+kfKipIW5pYZjN10tc0rK9Z99oywMg9czyBJublDKzDUx1nM4nuATTL0ZtqPTJx
         b8DYQftJ0Ialup9tJXdRd1COHOpzjyytXmNlpKn55nRjr5hvvIKdBY5fXUFzyAFGprC2
         lvjY1GnVFPiEuqW87GdYQblzV99pc38oqXkAceF/nVJ6S+CKw9GhipyrzuUfBgyWC6bx
         9L09Oo1PtpzhIVGURtHghsHDT1jvUoARUIJ0wAVyq6hSSAC8rYEMDRIBM/tV5JSRBmdX
         msKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nDw8dudK1CV6WD50yAFCrfgvZPqEfRATaifHBbOlWB4=;
        b=igB0hhjyb70IlbMXPNiXI2RmhHnp/h1NE6lP7sx5eBN/k08MbH9/vkv176g0doS1FP
         K0tlksCSX+ARRgJ0Aw6NAm8ZqpCycJxUR456b/AdmB5JRGEAo/tRAfy3Zo2IshghtiM/
         EHclttWN+6aNfEezRQnl8UeXHJO5J70QW+d981AQsEKq/AVqjeO2GnfiJUq7wmS1+RQ5
         MEhdvd9HNbaYgKo3ojiUsU72EYoRyOhWC1yOR30cxXq/Kj2znLkmyIbNC4drBzb9C8EI
         zBVR3Z/N+B0ktMrlAV/gwuFJg/u3gE9tHGsJalcOn4mogKXyHswlYna76q5ZsMiprCg7
         mP5w==
X-Gm-Message-State: AOAM532o5+LbE2gcik3AvLDjkqFA5SAIa55QPaRfbbVm8v5yiACI7D/P
	C/tkmVizNDCooPHBn0Hydirth2o1v+4=
X-Google-Smtp-Source: 
 ABdhPJzNeNLFntgoog7n+4EzFN2rrf32e4JYkT78rPm0T5DfKxlGO3D/J8C8FCSsQ81FIo2lFOQl2w==
X-Received: by 2002:a50:aa9d:0:b0:40f:d653:ff0f with SMTP id
 q29-20020a50aa9d000000b0040fd653ff0fmr3430173edc.114.1645114190213;
        Thu, 17 Feb 2022 08:09:50 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/28] devtool: auto-pick 'main' branch in addition to
 'master' in upgrades
Date: Thu, 17 Feb 2022 17:09:15 +0100
Message-Id: <20220217160939.1424397-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161821

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 826a3f955f..7957d41192 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -192,7 +192,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             get_branch = [x.strip() for x in check_branch.splitlines()]
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
-            if 'master' in get_branch:
+            if 'master' in get_branch or 'main' in get_branch:
                 # If it is master, we do not need to append 'branch=master' as this is default.
                 # Even with the case where get_branch has multiple objects, if 'master' is one
                 # of them, we should default take from 'master'
-- 
2.20.1


