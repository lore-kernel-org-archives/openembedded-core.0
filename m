Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFDEC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:46:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.1658.1742316364596716670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOHg2CYG;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso26219775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742316363; x=1742921163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxY5y7Y/63+StpIPgK4UAoOzuY4jDrqDaitO5P4SVCs=;
        b=bOHg2CYGxdOFNCivCdLJC+WDZLJqmulpgH9jI9qguzwg+OYl4iNLhB9OLlAzBh3F8b
         88to+SJad3v3SHkuCvi4s/g2gpEi4HS/Jv+dbLUnyK72y9J6G2Qa/whsmAOZ6grjmTMb
         WqEm3ljRdSebLVr+i/ivOA+ymtTGsfhlSsg8YOPv48l73ScSzRRTfmzi1Rb/KL4XclfQ
         wb/MaZ0zBt8GiqGhyO43hhNqYABwEza71UlgPDPcU1npJ7oVJgDbyLMPPR/cOY0ekO+C
         a9aIQslEUE1dlGDk2Z5RRf/EXd6mmWHwdRSDFKgy4cp2qK6EH2PrLF3yMasFMEy2efSr
         z4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316363; x=1742921163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxY5y7Y/63+StpIPgK4UAoOzuY4jDrqDaitO5P4SVCs=;
        b=lM9ANBrUlfnIJmvz+Q2vmZ5prAOC4XUd1HCclw40rDqzno7DDpobBPNFNhsaWZPYCI
         KUgUtjUVnb+OWjxAFglRwX2AvNSqvh1B6u+LAV4LPFbbIiKqREDM3K3sOin2ng8WmuNA
         hINvVIUWftcT9u/iv2wHEYtFnRrO6l36Q4f96hwTLA5yrlAoBEZ3HdAS8xZAUR172c+W
         tlo8OhnOK/E9vfbPfZpbywgOwKpbGOqgkAYgIPb1g1UqOHhVkFFgSBee7jANF4he5F1Q
         omWYcmUU5fSwTWqOOfuG8Rc8Jvvdob7zWxrKRauRoXl69UVhqUd/KD3jiQzUibGxChDk
         q4KA==
X-Gm-Message-State: AOJu0YxoIVr4+MF1fsVxMtALXX0X6H7LUpVyltqfslUWOpsp+Hl6kEtG
	ltRsyKKHPf6Z8sVbHjUqb5RmC8rNdn5qlWNNjz8MQ5aaLMlfaLx0xZ+3xA==
X-Gm-Gg: ASbGncusF55pfipuaUJxt8T/eWtU3tZQyS7yvlA3jBTyKo3MzGuh3TYfsPpXgqmETI8
	iy0QnBvL6q1Desu2SzgN8H1mxgAm0fI9h539HkksJqpVrv3kRZg36+x6Z/sG20raq9lnKs5edks
	RT2XeMwnXbZnP5ZChJYPZlsdNby2i1o4sFmsa/bC7J2Lmo9ul1+GRIIOHQFKH6w8rwBT+c+vrA4
	9NZvrxAh3tkboZ9vKKso2b/+oOxnlJ5/snrJaifzQIGt7A63cxDnJFXlTIhOR27ICPBbMQSwz4J
	huNZFw1oCnN62I+UBOnuAK2JlmOCgZ1arMyOu3hGZF7yg6HWnVgmC33/L2Z7OUoUSBc3i+HR8cQ
	YQUaTTw==
X-Google-Smtp-Source: AGHT+IE1MoVvbuMO+S2BLfO8DFUTISIMZxgZIQwoyxQ/zN938TYMhDMnkbWRWlN2PomgyYEpeGaDzQ==
X-Received: by 2002:a05:6000:1f8e:b0:391:253b:4046 with SMTP id ffacd0b85a97d-3971d51f3f8mr18841760f8f.16.1742316362473;
        Tue, 18 Mar 2025 09:46:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df35ecsm18804416f8f.16.2025.03.18.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:46:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] meta/lib/oe/recipeutils.py: handle fetcher errors when checking for new commits
Date: Tue, 18 Mar 2025 17:45:53 +0100
Message-Id: <20250318164555.1527383-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213224

From: Alexander Kanavin <alex@linutronix.de>

Recent freedesktop instabilities are causing 'devtool check-upgrade-status' to
fail with:

bb.fetch2.FetchError: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin ls-remote https://gitlab.>
fatal: unable to access 'https://gitlab.freedesktop.org/mesa/kmscube/': The requested URL returned error: 502

and not print any results for this one or any unrelated recipes included in the check.

This change handles the error, so that if some upstream server isn't working
properly, latest upstream revision for that is marked as unknown, a
warning is printed and upstream version check for other recipes
isn't thwarted:

WARNING: Unable to obtain latest revision: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin ls-remote https://gitlab.freedesktop.org/mesa/piglit.git  failed with exit code 128, output:
remote: GitLab is not responding
fatal: unable to access 'https://gitlab.freedesktop.org/mesa/piglit.git/': The requested URL returned error: 502

piglit                    1.0             UNKNOWN_BROKEN  Ross Burton <ross.burton@arm.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/recipeutils.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 56be75dc9c9..044f1bfa614 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1070,10 +1070,15 @@ def get_recipe_upstream_version(rd):
         ud = bb.fetch2.FetchData(src_uri, rd)
         if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
             bb.fetch2.get_srcrev(rd)
-            revision = ud.method.latest_revision(ud, rd, 'default')
-            upversion = pv
-            if revision != rd.getVar("SRCREV"):
-                upversion = upversion + "-new-commits-available"
+            upversion = None
+            revision = None
+            try:
+                revision = ud.method.latest_revision(ud, rd, 'default')
+                upversion = pv
+                if revision != rd.getVar("SRCREV"):
+                    upversion = upversion + "-new-commits-available"
+            except bb.fetch2.FetchError as e:
+                bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
             pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
-- 
2.39.5


