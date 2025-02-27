Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25D6C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 13:59:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10931.1740664768319560627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 05:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bV0ZEwEB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so13291035e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 05:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740664766; x=1741269566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQolLqu3GgbUeXxDCTDXsAeDoSIHHTEEQJ77GFX+YTM=;
        b=bV0ZEwEBBEtshIpKg6p6OglDNP4BNB+2uUJCU3OCCM+n+0mHRP6pntRqay0wJGSdKo
         b4S2rAAoL7TMD++s6FQqtw4HY87N+5/szJ8PiZZNEnGHlWMefubggFtFX0DlVSU+v/Qf
         lssumvn8ZeTc3ajub068GEfCdu5Z+nTTRKnAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740664766; x=1741269566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQolLqu3GgbUeXxDCTDXsAeDoSIHHTEEQJ77GFX+YTM=;
        b=OBxfgw8e4zAT8KxmNt08Rnr03hpVQZs4LVNF9Dsq6EN+iAaNZxN1tjFfsuPZrejpsM
         UbyAxcy5b/sWuXKVuRoBydNj0guC04aXQhdgaPzsKr4/Fp1h+sTWaVzGV3sHcyRr33ji
         GGJ6M4Z06OCLnbcXUwG00DdyVxx4s4LGpe6JE3hpJdyeSIZmDVk8gWUVGJFMfHcTYB2V
         +K/ZvICvTGG7M+32YtK7YXC6WkjbEUa3HXwepab9xh/S5pS8enuTxGNuD/OWRJ9E5k93
         k9Ozqx+us+1J9N2bdQUf64xAyiuyuzVFEDjlY7aReJ+UsN3jEs8jtWZqDznnETMLZjvd
         t7+g==
X-Gm-Message-State: AOJu0Yy9rWDNbf1xYfrNyz29hRDIW7Gc2j17b1VJu69CGFgz22u6mKQE
	RmNCty9pZWMJ07BLpg4BjZigEsF0djCklF5988dbwvheVjR/Vs//iGtbvPnYix0x+wdOjH0+r3L
	l
X-Gm-Gg: ASbGnctjmzBcWZENXd+atAzuQApkdEii8kl6RVP1sIaV+cxPE/MTrE3kVkrGEML7nvw
	KhiEsds/bffLFjuQ20U5QWpvh0ZS+0Jxtg5F3K7itpQcrLbIHwuTniUnpRZwkhZf/sNBbhyZ/f0
	nKH7KwhvLzpTCeJMdsee7EZt/VyhvPW7nR4UB4Bpk7osSHvTjIRba1m9LUtRxQli48qlwjTaAYz
	0Dkr/wEJuFaBZYBb5WpE4ovcHM3RvkA2Kl0ts2lEJtFXPyu3sQf4EUTgsLTqKU+k/XwDFe54JY3
	E5XGlT40z+mLNuPOqLVlfbP1PbKWX1uPyExlJwe6gkeEu2eO3jNXtN0=
X-Google-Smtp-Source: AGHT+IF/O42+i8GbOgjUr3aSUSOaoGPuv3Dgn2fb3K3It0IhyVZPJYBaJHAv+PP8qEpOBckbkwDy4Q==
X-Received: by 2002:a7b:c303:0:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43afddc6535mr30652265e9.9.1740664766298;
        Thu, 27 Feb 2025 05:59:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm55624425e9.30.2025.02.27.05.59.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:59:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lib/package/utils: Improve multiprocess_launch argument passing
Date: Thu, 27 Feb 2025 13:59:24 +0000
Message-ID: <20250227135924.653822-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212010

The current code for multiple argument passing is horrible. Tweak the
multiprocess_launch function to only convert to a tuple if it isn't already
one, which means we can then use function arguments in a standard way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package.py | 11 ++---------
 meta/lib/oe/utils.py   |  4 +++-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1af10b7eb0e..0db14f21642 100644
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
@@ -220,10 +214,9 @@ def file_reverse_translate(file):
 
     return ft
 
-def filedeprunner(arg):
+def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
     import re, subprocess, shlex
 
-    (pkg, pkgfiles, rpmdeps, pkgdest) = arg
     provides = {}
     requires = {}
 
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

