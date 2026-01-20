Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE4DD2ED15
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4162.1768908271782690624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JhdrjVm9;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so49560435e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908270; x=1769513070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf7r5P8R6uL8XQgSzye11t9Rcr9MLD3C5DxPyoZco2k=;
        b=JhdrjVm97tq/uLOsfC/hxVTFK2zR0exiAklDXjmgO+ukcxWB5OUF11H49/fx1+16pG
         Yb5EHL/kagFUkDk/uB1OAsr4/VDK8HGSzi/9Tq/sBYEzJBB57RQw7ULtkmhfVT1inh1Q
         lkL/ycGZ6vXB8pPQMufQ739wRyfd86vhRH4rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908270; x=1769513070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qf7r5P8R6uL8XQgSzye11t9Rcr9MLD3C5DxPyoZco2k=;
        b=aVsWpLGtyi2c+poVT+of6IFN4h6n+pDDqIboDzEoEt0qEx+7Eje/lwcQdF7tpnjgoS
         +RG+lQDdoYco15hZiMa0TIR9o/xX8EaxPurn0y6y7gt2szsQoRBYCiMcMiPlwThnzXhK
         pk15yyIIH5+ECCwnTx3J8dZdm1weGF+ZNDaqyGRR7k4Kb39/ORzpYqnhZnyuVBu8s9ue
         f/KuyQPpEDx9/gsudG450n6Kj1u12sxCCh3rAbtG5tt5hyx+LiBCA8bgJmaTSEhP+Hzb
         9QP3rIbkB/rFbR6AsMtFy3pc0PLwuVoTzSVbM5mEjmr7NAbMKyYTlmvwEYvqc9XHpy+5
         R1/g==
X-Gm-Message-State: AOJu0YysmOB0eMo5+7wgij4vN+Tjd5Vs2zGRa0BhdPrmI2GlLjH+uuje
	Ci/oHwnmYgdqSBCNsRYnFBTpi4N/GK0U+0IByVe0kVwWRUN4dJkZkFSnkdj5amrlSaqblxp8qn8
	C8puu
X-Gm-Gg: AY/fxX6N+/BRtmTe+KsRIJl7bqT1UyBcRqy/Jth77bG1B8ZCO3JB4wWH89QLdWf9Keb
	hbErk+EX7Co/BlGmlUIsQYoE2ap1jYrh5q4rmgt+iDegTgE+n1WkTey3QjxBVbH474tne7RM29w
	JJdNiEIfV/fhy+my4sAOWSdlGbb6TymDdA456EiU0NSpQetn+IJAihxLDd9y93r0zQ53puM2a+H
	8oAQW9jux496YpNjGxXGPV5RMOJBQyluPi4RRZqmov10LRW7y8rZNdRQaEM/ybZ0ew+U460JWqc
	zsmpM/AskyOtLQ1akaDkO8EH8T8ILro7xhS1RYhjQtnaCSEBPxhr4ON7rqhI3jjQ+pz3jUSowgU
	Gx8nMgI3rJUp826pw/AXMMgzjig87WeJx/VSOxpZFB8XbkIWTaT0d21wTAVXIys/XBSx1SsnwRX
	KaxmZV4Fyw2z6PV1Zitw9IhAw5oWoR65L1xIkz0B6wKGRy8NDubQPTdnx9Ry5gGCWe97dKF8MTO
	CO0e86xPFe/yP0/ulVedsHuoWHk5wbp
X-Received: by 2002:a05:600c:4e15:b0:480:19ed:7efa with SMTP id 5b1f17b1804b1-4803e8020fdmr21318485e9.36.1768908269800;
        Tue, 20 Jan 2026 03:24:29 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/15] selftest: devtool: Set PATH when running pseudo
Date: Tue, 20 Jan 2026 12:23:53 +0100
Message-ID: <842f5a492d79f218e81c48acd02b6e06eaab0f70.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229668

From: Paul Barker <paul@pbarker.dev>

When running pseudo outside of bitbake, we need to use the same PATH as
we would use if we were running inside bitbake instead of the host
environment's PATH.

This is particularly important on Ubuntu 25.10 where 'ls' on this host's
PATH is provided by uutils and we have setup links in HOSTTOOLS_DIR to
ensure that the gnu coreutils implementation is used instead.

Fixes [YOCTO #16099]

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a264cb75ab456c22568b135c473064553e5321b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d7e984753..c7bd1831a9 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1843,11 +1843,12 @@ class DevtoolDeployTargetTests(DevtoolBase):
                 result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
                 # Check if it deployed all of the files with the right ownership/perms
                 # First look on the host - need to do this under pseudo to get the correct ownership/perms
-                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
                 installdir = bb_vars['D']
                 fakerootenv = bb_vars['FAKEROOTENV']
                 fakerootcmd = bb_vars['FAKEROOTCMD']
-                result = runCmd('%s %s find . -type f -exec ls -l {} \\;' % (fakerootenv, fakerootcmd), cwd=installdir)
+                path = bb_vars['PATH']
+                result = runCmd('PATH="%s" %s %s find . -type f -exec ls -l {} \\;' % (path, fakerootenv, fakerootcmd), cwd=installdir)
                 filelist1 = self._process_ls_output(result.output)
 
                 # Now look on the target

