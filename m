Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F34C4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2624.1784364802069053832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2h+yhYB0;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso7797975e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364800; x=1784969600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XRLe/JE7Ahp64w/tWhASFF8rfOKVTEl8Jln0tEJE16s=;
        b=2h+yhYB0maAb1za1V+3C/cqfInytrfxafENPag5R5rqdmNN29ek9sf0N7ImuGQiL67
         j9cRWc9ThbQcibVGSxsH3w6wOvQ1Tu6oWTz6jguxYvjyiOWeIdHWkAOcbw1gYV9j4epC
         OhePa2viKHm9FvmVw9vFzYpfi2UQRwfAZHDuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364800; x=1784969600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XRLe/JE7Ahp64w/tWhASFF8rfOKVTEl8Jln0tEJE16s=;
        b=A0U8Cp5gMbvgkrTz8iGMr7Aob7eKsLA1IR3/7K1ZdKlCgZRTC+f6n/WZjHSXa/akRj
         wb/wX1CN1RveW7BWAp6oQD5REWWCWwSN/j92Zt21QVfEXKeEcpPmJk5jgrwD3lYsFTJg
         LW4UOoJQJMtzxhwgZ6Hq7KwJ9LjzpqKucGQXZrGF3LbkDD8Itbr4iAkhiFuhyLyvNkc2
         U4BuJfpFDdr1PWym9Uy/8llEuxQmq65hQAhZs3iGZ2fthvncB9vWYbKmcEqM+cnIPr/W
         OdZhO7j41xEj90yews7dsm0ILOMKtZ5xiSxUOTx4rNrj0KLMouQSqaoojL7j9Rym4+vB
         nRGg==
X-Gm-Message-State: AOJu0Yz2ANS4aUBw7o26gP7KUCRtAyol1qoOxSTe9Lp0MEnMf6m9DPYl
	vHxJ3i8M7Oqrtsl/rugYfn/wf64YIbu9xJEQNJ7GPbIk5EoakFkfTV3yIvd7L7o9Nexa6UuzsCV
	L5f31B0w=
X-Gm-Gg: AfdE7ckTLgqGigf9I6H/R9pFBEIOuRhdQh6BwIDSgucWktQWrjfco5NN5Ngtqcu/jMt
	GDEZ4mxy/yZdO1gsCunIk0ETx4Npf8KoTiamHJ9EKM6oS+pzgR/6COhDqYJ0h4HAjU9IRuZgeix
	q80mSIdpN1KgTI+QIXyMs1PuF50NpivNPWsJ6VWQru6wF22PgeKds5D6EFWjWu1cQ0SnYcdc6sI
	dfYasBM9oUSRXT1BQqy7ELfAtJEpMRPzHRZ0by2UvlNGgF7NqZn6u9P8iQFBdBWXI7+RBZZfJI1
	Z4OgYa85sCDLAmrUvdjcbHwqx57sRDUpoBiG7a8A8PRCxQLDKP6T9Z0IitiWZbqG9FVwWme/sr2
	/gfn0Qg5tZ07eAcqesl8jxlVijNAAuEMAia4RT15BCP4ydPjQMjhsCgzS3RQtI2Lcl4JmsZg/Nw
	n2eau4ewvuqgik1cBt14IrAYc2gpqf/jQW917A737cME6q5O7YbRgQGqxV958ZyZjX5cRBuXgX4
	QtN00A=
X-Received: by 2002:a05:600c:45d3:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-4955233b700mr14920795e9.2.1784364800299;
        Sat, 18 Jul 2026 01:53:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/17] scripts/install-buildtools: Update to 6.0.2
Date: Sat, 18 Jul 2026 10:52:40 +0200
Message-ID: <7a761f2d67dbd7107bfd92ece3ea799b1d64abb1.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241238

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 6.0.2 release of the 6.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index f925dfa6b5c..b59cfbb8705 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-6.0.1'
-DEFAULT_INSTALLER_VERSION = '6.0.1'
+DEFAULT_RELEASE = 'yocto-6.0.2'
+DEFAULT_INSTALLER_VERSION = '6.0.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

