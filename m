Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9534DCD98E0
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71889.1781274401607547464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PrjtxqCj;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1198766so604804f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274400; x=1781879200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eXhXD+T85nklAXiM5owdkzCGp0RPxcyndUdXkWLMTc=;
        b=PrjtxqCjrBaQ900i2ZtlCfKJXgSosaOHuP+QPPM/P8yfKmuSW82I60CQ+Q9zzgWL/7
         CC/DVGn+fh8etv8wzc+eg28q1/tBl0pNxwSOYIRhFJseLhFgW/dNVkG+aiiRd8aNXbk4
         RkZUHylBVqyZWyc534ctbhNk1UQ+v09U8Akhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274400; x=1781879200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6eXhXD+T85nklAXiM5owdkzCGp0RPxcyndUdXkWLMTc=;
        b=qrDAI/8OT1ATDVx2RGnjssuNiZ10y8BDsDYGqktvpDfLdgI6fTGNfU41/9ghfBon6U
         KToZbPpBBIyWDkcxUGeRqrqzxdMDaB5zVF77VK2xFe1SZM4AH5T+aGAmb4lg14nnUWOz
         8sk/0Il+Lqv7QLTHg0UQ1zimrAoshneO2PK6v4EcYHaIEOcZiztJL/pAv3NEPzF4eZkU
         nktbrH6FTWp0PLdlhuF4lbgD82+KHAH0qJgik7U11ltpNtkZC3euVG9oylTl5zKOW+vn
         VfAlLQj1hlocvkXiTyx33Xx0e98ksD8bEl+KX+i6L6n7qcQ3UlszNuJVubMVDH6gNOeS
         cCOw==
X-Gm-Message-State: AOJu0YxlsjyxcgyJQPxA1bpl8h6MRU0dwXlFUxBnD3CVp8o719ZLlprk
	Yllz2ccG6+2X8JRfOgi3hExNot6efwN2pJ7iOxyDdzoBTyLS70ODLeRmgupa3+O6C7FlY8uf065
	ncSeC9g==
X-Gm-Gg: Acq92OHlgaxqUPEmofieWZroNsRuamEhg23I8hB+QuLSd2jWHvY2UX0+opyWmQ2WYd6
	vvS0yCGRlhJTp5d2jLoxwGlaUTMxT4Hl2pCCxtbgk0FbaYPfdvqQn1vo0sHuUASzLC1MFgTar42
	zZlLT7dq4u+cH0HaurPBvxw0aP9AL0BWZveCRu+zLeripdtAvgw7j5lZ8AlcQno6dEOdlshaEN1
	lqGP+avKMjuI7sEuGhxhOptHLMjcajXF8NfEzk85Gv7+omzzNhAGHHIWYZcl3eu4rffYIOu+4y5
	zBO+BPz+D24hUS4EhKPWic5dsM3maecmmRhRZISfWnRxrX3Hl4LKvQCfDnvjB5BqxA6GRdLWZE5
	3P99haWxVkKZhfJPH2xpHZ0ZNMolm8pj+wDxfbbqZqmjAdeMX/5aSOMIgiwJXFnPK2shCGkaeKR
	2uQ00YWHBI7YGX0pXm6MhCQWg=
X-Received: by 2002:a05:6000:41f7:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-4606d024020mr4538210f8f.22.1781274399919;
        Fri, 12 Jun 2026 07:26:39 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:39 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 06/21] devtool: prevent 'devtool modify -n' from corrupting kernel Git repos
Date: Fri, 12 Jun 2026 16:25:56 +0200
Message-ID: <17570092dd08b72ec025a159cc3915fc94344a76.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238628

From: Enrico Jörns <ejo@pengutronix.de>

Running 'devtool modify -n' on a kernel recipe that inherits
'kernel-yocto' can unintentionally corrupt an existing Git repo or
worktree.

The work-shared optimization introduced in 3c3a9bae ("devtool/standard.py:
Update devtool modify to copy source from work-shared if its already
downloaded") is not skipped when '--no-extract' ('args.no_extract') is set.

As a result, for kernel builds where STAGING_KERNEL_DIR was already
populated when running 'devtool modify -n', the existing source tree is
overwritten (via oe.path.copyhardlinktree()) with the contents of
STAGING_KERNEL_DIR.

Fix by adding 'and not args.no_extract' to the kernel-yocto guard
condition.

(cherry picked from commit d383ea37e4987ecabe011226f1a8e658a52ede12)
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 908869cc4f..e1e519ce5b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -841,7 +841,8 @@ def modify(args, config, basepath, workspace):
         commits = {}
         check_commits = False
 
-        if bb.data.inherits_class('kernel-yocto', rd):
+        if bb.data.inherits_class('kernel-yocto', rd) and not args.no_extract:
+
             # Current set kernel version
             kernelVersion = rd.getVar('LINUX_VERSION')
             srcdir = rd.getVar('STAGING_KERNEL_DIR')
-- 
2.53.0


