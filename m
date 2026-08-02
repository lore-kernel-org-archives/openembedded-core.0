Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EB4C55180
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21325.1785666539320277916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqEMhmYw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7049205e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666537; x=1786271337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jJ+QrjzY32CMrCMTaBGNrLOBAx3pkPJkXyLAaTADVjo=;
        b=CqEMhmYwJr4AI6/DszbnP74RetF+JtVI6kvlODjxU4BHp651Ur8j+t4u87U6uNK/sd
         6/MS6EzD6HzoHUULnTQEegcBlk0kxxz8hu/fCOJypoBwJLz/4pZ8ZOJ0eb6tgePUinO3
         c3K6izQdaNHZO6qmsw5xLx//QokG+CHJ12ruE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666537; x=1786271337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jJ+QrjzY32CMrCMTaBGNrLOBAx3pkPJkXyLAaTADVjo=;
        b=JFrkyF8wd3AQL3CGyn8c4MO3DQcIPAV4/1HhLR+KWnY6QYtu4tk9XE9OmkNEbQGBt/
         lINAxnY9IKlvja6o+ox6wW5f5CImrCy92TPs6+ETut/A9u9y99Jak1YV6E4BEAU37Evx
         Eng40JCrioWzc6GBcIUL1fSZfgz0Z8YNtFYW5WgF58bJUKWMqm6zgDfgEPoH/XXWQYAh
         qxtShkQlpIG1yWe2tGdhnYpVYvSubOv6X3Xp2wuiowrBniAVEzEHMkvPNznYJ5aCkmhZ
         czscvBJveZqHr+Kl66VpwIUXg0rrAdqMczgicpkIO6RttqQmN0A180lPukBaXNlv1bux
         P+Lw==
X-Gm-Message-State: AOJu0Yw+jNHPqlUp17AGIMCKBoe55H+K0rWxi/XP/ggLkx6myhzo8TJ2
	Ck/usYAY9/Iv4E7a9yryXwfBW3p5dE+02JENFgnPh4zJnJM+BC5N9XvapGtQnN6Xd0w2ktp7Bht
	GlQDWq6A=
X-Gm-Gg: AR+sD11OtcYVj2lY3P1GhmT1XKUXsXb3sn65qQzAx2l0sL2bJ99fxuQqcNhXHnwc3K8
	GrLEjbdEkRBNEg24ltKUgX45oP87Gd6cZ8+MoAeA2S5rjaVOjQAuRqipLL3ZM/YVyJvU1IbxVcv
	eQRTwhLFQAsOpfGZAyMQXArRPwlw2OSsoqlx1Kwb78EsGKsuuwH1Dbwy6MDWA6GIYYQNBsxUlLB
	90wZpy9/Jy584FYlD6FJq3EYSDSLB7KIAlIY02XY2sNRxXsuhEDdBsMygWflODoWiH1li8yZjwx
	4UGGCPfVDlDwNM2Xx8u+veoA0tDbQDceS6NbMPb6qn7jqOj4gnl3T50dzQgrZdLQt4XTbrwk6rd
	OE12g0oRRUCg3ku0MsE2fb8k95P5o3lEIlwOdpHD5EXxtSHxHdeyw9kQibcTWPFQBn9Ha2QUM7r
	qcxqzGJXK6JPfWuPxOi8SFfJTWfIPZYjS6voRLFZdKQjU26U9qvFx/wPqB7VFR8uG2eniZBYHPl
	ilMNcmkw7xELJ+DJVCWZF2t2mxS
X-Received: by 2002:a05:600c:840f:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4980c6507e7mr110130605e9.14.1785666537286;
        Sun, 02 Aug 2026 03:28:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:28:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/25] sstatesig: Use kernel.bbclass instead of linux-kernel-base.bbclass
Date: Sun,  2 Aug 2026 11:28:30 +0100
Message-ID: <20260802102854.3952760-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242526

linux-kernel-base is nearly empty and about to be removed, switch to
kernel.bbclass which should be similar. The main risk is other layers
using that class name, but hopefully they'd still be kernels!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f016fc67704..bd509800726 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -19,7 +19,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
         return x.startswith("nativesdk-")
     def isKernel(mc, fn):
         inherits = " ".join(dataCaches[mc].inherits[fn])
-        return inherits.find("/module-base.bbclass") != -1 or inherits.find("/linux-kernel-base.bbclass") != -1
+        return inherits.find("/module-base.bbclass") != -1 or inherits.find("/kernel.bbclass") != -1
     def isPackageGroup(mc, fn):
         inherits = " ".join(dataCaches[mc].inherits[fn])
         return "/packagegroup.bbclass" in inherits

