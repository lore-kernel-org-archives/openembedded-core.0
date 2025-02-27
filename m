Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BCC19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:43:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.10712.1740663774723507547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O3LzZ0+a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439950a45daso6187845e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740663773; x=1741268573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwW3DDh/a5JODZmvikFCPUhKzTVvDrpOfjh8C/YiWJk=;
        b=O3LzZ0+a4zlpJBmIl8lWoNL+6HAJDiyZqQiGvroCMqUd3BpYDaCbQBRX19pLxbh2Go
         pk760co0CFgVpQpQQkD3GnUM7t3ahmC02WMMJ8Kg4VDJUws0RXzOISX6eXpnCXjwCGPf
         Ps9vmKXznFNzmOYRRy71UqIAKW8V8nY1bQoyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663773; x=1741268573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwW3DDh/a5JODZmvikFCPUhKzTVvDrpOfjh8C/YiWJk=;
        b=QZeFs4L3N+KH38qTLWN1xaFqoByJXWgvG1c9nPoY1JYlmUjoPc1a9gpVnv45fSc0/N
         X1BO2bZrbNxWANstTCAZjEa3zyO5qh+P9Zc0Rmn5lu6vAhuEw1NFwhSpw6IDIL7q6DZK
         HiWvHMcu5aw144atAJ6OVAlq5wXTsG8CgRvdIblVr1MNZwWbR8t/zx88X3O5OtY8WpnL
         KKeVEHGdzBLZqDCAmrEp7IQf2uYsspivVvv+KgPCPC10l3qb2e4NFOX0m78NLdjyBiL0
         3m67hBAyAr1JY9Q22xJPnsIqkhQX9lF0wcUR4yakZABDHq9zQWqwf+XbsKHBWak71qPb
         MN+A==
X-Gm-Message-State: AOJu0YzfF0qKGoN064NZFtI6ObF2oPbOHUe5zjXbDzQfDQsE6NjgDXkJ
	UUzI6JhT+j3It0DFQvr8JuEn9d5n6H0eg2MNiwj+52OvJDsZTEXxFW169PBrfkfZ0gTAl81xoTz
	O
X-Gm-Gg: ASbGncsgaEn9kBwJY0R4AitL730s4Hs7+0K6QPmJ6i0Db3/bOFlojJEON27BN1JOg1F
	CmVciC7mX2zCzH5gstbR7TrEfM4Za22uGXDkBUOc0MjzSTlRLhqv59hbKvodMabZ9wsfKrf5AfO
	7cb50wVkxj7WajcejMwd7RWlLI6KYL/ginWDRlV7OpbDGLiG+17K+RfcShuE1GoqQg2MHqUYzJ6
	dvwxeRjyTuaiKD6RHrc0FV3dvHFqpYCCFqH+yt2nQb7XclhMMTzPXJ9uXNA0ihkMscrlYu+E0Jz
	Sgb2gdgcX1AkA/fss4cBGoSJpgUqRxGHabkwfVBfFSFrbnl6rmQ8Bnc=
X-Google-Smtp-Source: AGHT+IEEC5GSX8OJIzlGBUJg+YiAh3ZIiiykJJM6FcKuNdu+khBgrxC0CNslwDXoBHZiyXgAwkZX6A==
X-Received: by 2002:a05:600c:198e:b0:439:9e53:49d8 with SMTP id 5b1f17b1804b1-43ab0f979cdmr110523745e9.30.1740663772660;
        Thu, 27 Feb 2025 05:42:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485db6csm2095417f8f.91.2025.02.27.05.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:42:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/package/utils: Improve multiprocess_launch argument passing
Date: Thu, 27 Feb 2025 13:42:50 +0000
Message-ID: <20250227134251.156595-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212004

The current code for multiple argument passing is horrible. Tweak the
multiprocess_launch function to only convert to a tuple if it isn't already
one, which means we can then use function arguments in a standard way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package.py | 8 +-------
 meta/lib/oe/utils.py   | 4 +++-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1af10b7eb0e..bcb1e3837b2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -18,7 +18,7 @@ import shutil
 
 import oe.cachedpath
 
-def runstrip(arg):
+def runstrip(file, elftype, strip, extra_strip_sections=''):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
     #
@@ -28,12 +28,6 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    if len(arg) == 3:
-        (file, elftype, strip) = arg
-        extra_strip_sections = ''
-    else:
-        (file, elftype, strip, extra_strip_sections) = arg
-
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
         origmode = os.stat(file)[stat.ST_MODE]
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index c9c7a470416..d272dd2b8da 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -316,7 +316,9 @@ def multiprocess_launch_mp(target, items, max_process, extraargs=None):
     items = list(items)
     while (items and not errors) or launched:
         if not errors and items and len(launched) < max_process:
-            args = (items.pop(),)
+            args = items.pop()
+            if not type(args) is tuple:
+                args = (args,)
             if extraargs is not None:
                 args = args + extraargs
             p = ProcessLaunch(target=target, args=args)

