Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3489C5620A
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:48 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.352.1771602105375669397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PFmvkP3b;
 spf=pass (domain: gmail.com, ip: 209.85.161.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-66ee7b9af94so824828eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602104; x=1772206904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5btMM1m1xoswc7pDz9OPzm0iIQ+9RQGJQ6XCnRd1M8=;
        b=PFmvkP3bg3fguwEwV4znGKScYJ3KAEzajN8h5Uszc5BLJqSK2Tu9TBRxnyWncpkk1N
         H4DK3aC5UB4vsY4fbjNQ4yiHWAh2YP4Qe5L14KPxmG73V9Q22Zj572dXcDmGDIYlK2xr
         GLPqxIBUgX+SZP09+QL2KaBVKoW1vgdW+kIkahap+HwWntttZWCv9UxhqF1R+S6FM5o/
         pdFhH/QIxMeJP9Q5A+xWM9EeXhwi8taggrjQ2RkEJQJFYkuMlVXMpIe7qRB5vU323/vz
         YnuTy3xmIdIXiR9ZK8EItHMDe6SDNK5ZWBgnJFqT09NXOAHeJO77WHjWUvK55KTK26jb
         HxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602104; x=1772206904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5btMM1m1xoswc7pDz9OPzm0iIQ+9RQGJQ6XCnRd1M8=;
        b=W0EKUHEXt5yK7O2RoMMAyDKEMGg31anv4RKWdzxOaUn5GuzvhVAumVZbVv5U3QSpbY
         9FX5LcXpWzhD7aH3fhM5Oqpt/7mYSfpr9FFKevBlmsZvlrDYDPKCNPLrgFZpg1qZTC/K
         bVY3yaw/9dUZvJjcT1Fnvcijqn/zx5rpz6N8VeDKo8K52mQrcalFHPA/zV7aNC/IimU9
         9wV3idIny4W2kZU37W79FPFKO4GofeFAf+jOW59iLBkR53fTOMbiT3ANdejr7k7wD9AM
         iO9tw2SDeZ7cLfrgh822AwPn96QqBHFyusyaDNTz5BZADRo16iJxHFLx5A0o0kD7Cgr1
         stRQ==
X-Gm-Message-State: AOJu0YxWjFeZ0H77hFNjTR5xv49zt4f1jiyXXg59Dc4BWvbGD8bNkgyQ
	Gz+/mBWBeiitNKmPvOBII7VLYLNsrHCXvGgmK/JX/lDA5+g4rNGu3a1wisiirU7t
X-Gm-Gg: AZuq6aI03YLa9NqTna8UYo+NVaPMLUKUtmJuEcDQlRQr9+3XDBiVCueP26mD55V8bpK
	A3RhNAE7kZH+HltzrRgYc2N3ALQ8LP+xFlnHC0chTiYvNquC1raZPFMfsIBlTtE4ASI94S2bySZ
	nvzM3+uWLL4zv9tUdi7GCuU3GD7/IP9Gs7tB1L1e7m4Ue8NseDcJC9hkUmYpnkUOofAg1AXBcqL
	NYEwgCt6K4yPRxX4JgGKLh8HRnaFSXs4d9njvdfG95RDJ9oyqbbRbQPVcq0qHaKNSgd04X8/s1l
	tluZDUvyKSE86sk3onXIO1n7dd0+07gQzXDa1ogMIy42u8ETcm8gcFq+nxCGlinQEq+MthgwcCh
	XPn8JXLQQ17h8u1Oc74nUqNhf3H9LlTPux4TwSDDxKXaz5efqO98KB7gZ+kjBKogCFHbyl+ASsQ
	fsqU/XhqbH01PA8yNxo9aP
X-Received: by 2002:a05:6820:162b:b0:662:ede7:fdaa with SMTP id 006d021491bc7-679c4728b8emr86226eaf.74.1771602104440;
        Fri, 20 Feb 2026 07:41:44 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 8/9] spdx: Ignore ASSUME_PROVIDED recipes
Date: Fri, 20 Feb 2026 08:40:43 -0700
Message-ID: <20260220154123.376880-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231527

Ignore recipes in ASSUME_PROVIDED when generating SPDX dependencies,
since these recipes are not actually built

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_common.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..03863ef362 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -104,9 +104,12 @@ def collect_direct_deps(d, dep_task):
 
     deps = set()
 
+    ignore = set(d.getVar("ASSUME_PROVIDED").split())
+    ignore.add(pn)
+
     for dep_name in this_dep.deps:
         dep_data = taskdepdata[dep_name]
-        if dep_data.taskname == dep_task and dep_data.pn != pn:
+        if dep_data.taskname == dep_task and dep_data.pn not in ignore:
             deps.add((dep_data.pn, dep_data.hashfn, dep_name in this_dep.taskhash_deps))
 
     return sorted(deps)
-- 
2.53.0


