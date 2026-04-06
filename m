Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF543EF4EB2
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49600.1775456853246278236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RTjra5kQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso15915055e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456851; x=1776061651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=RTjra5kQAq6fpPJJTCstq3YdxrbfXvP6APBQH5cWol7liQuR+Z7kcHfm41Y5ubMTc5
         8F2ro6EgDcacivXaoafqOpAys08/NuoCDPYWZOL0wwuKbSBzQ41Rf1EXlAAWEnoKg1vz
         xccA5Ysq4SGs9TBUMpwZtympJvGa3jg3pHqoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456851; x=1776061651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=HEC1AmTSr1Acg+IxzrIcfsoYhAk0/OOoMWOQyrfxVktBEudjpykO0fqKynap/e/OXK
         eupNYlAZuQ/B6PFvo14eFUox/bLVrSnVXgUZUqHpi8dee40NgXDC56JEviVd48/OIvou
         wox41FtkdzszJQjHvIisNdsy69dbB6ZF1aq2guQMe9rFPXWA69l4CKs3JMX0rx44H2+3
         hnZb6br3wPF1VvqrUdWaCOs9gjOJ0Kr130rwutqSKPHv6vMu5eX354zxJJhNrzMDQLUZ
         RlfKJ7p9bgir8BnQxds6xycH7pH81SQ+yLo6x33G+ukgwD2FTBCNs9deoHgkS6SFvbZq
         kxWw==
X-Gm-Message-State: AOJu0YzMn2M3hpGpCCn3MK3RcLX4cvLGjh9uoRoYi34AnC4LxKQ6kNw7
	jBcjpAn1skQUdbqyoi3ZffctXmSF7v46mXVG0jD+o5BJmyrzuEPhHSgfZTKkMnc7r62bNgt+lA1
	wFQ0nqfA=
X-Gm-Gg: AeBDieuDSDcAcZ2rWz2bnOSPgce9M4XDeIlmt0kHvuwDQT42uQFcoSj5vWc1hENKaMf
	7SBjVn4eOen6xxlP3n/BhdQvfAPslr71oViqRA1wpyCtf3TO+7n6SVsSsyOPr5U7wh+0sHvWBXE
	3U4PTYCDHrE/a1zzYT2hzwrKhSno0b27yiwmgr83XkivbZbtSXNPYSqAbMCfmJjXnJFVOHxOYhj
	RzmodWZ8pIZDB5bNLM9YUznMGv+7Ve8/0OJXUGPi35g2J35dIU8w5VMvr4Qeho8M5FxkyJ7zc56
	McKH0axDTGADfZdvr4P5jaKlwuCTRBgncP5JKlP/o54IjYOy0ySGOgrydRt8gIIoC+0N/h2qaov
	EaoYJM0AQv/IwlxOJA7c3jQY4Y+MN/6xnAX+wv312fAvSm8DpDklJTIZMiLRBGfDZ69eUOz4E9X
	feocYQrUMdtJJzT0tRFNyYyU4FailM81dI8/5j8co+BxZaYIiR1zlFDRybKHqIbhsSDkGXtmWLm
	ck5iXSym/preXd+3XaUplcJ3aM=
X-Received: by 2002:a05:600d:a:b0:486:fc3b:3e61 with SMTP id 5b1f17b1804b1-488997d1788mr135253845e9.18.1775456851327;
        Sun, 05 Apr 2026 23:27:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/18] create-pull-request: Keep commit hash to be pulled in cover email
Date: Mon,  6 Apr 2026 08:26:32 +0200
Message-ID: <58138d386f1c221e87d2217bddc7e31d02cab58c.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234649

From: Paul Barker <paul@pbarker.dev>

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78f5ae4a5ba3675b78cc226feb7b9fbbfd8da19)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3d..5c4414ecd5f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

