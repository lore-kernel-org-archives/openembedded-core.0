Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DF7EEF331
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:59:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40219.1772701151371130334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3LdeZoA9;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso4044207f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772701149; x=1773305949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6s+FsQFpqu/vDgQyg0+TQPZ59H8NI4Y6FQXzmEFkHY=;
        b=3LdeZoA9X8d2FGTLoIvEntZEh8yw2DJ79zGJ8BzOt5Mvw9vz3DBqEGgn0zh3fWRDrM
         IJxh4uDse0genPlY/O3w1Dak0zmO8ReBiXHKYDmofdq6YFwS4X0eJs+iEGnbye6Ij12z
         ztZcqubA7RtHsXte4rLMuEld+/XIk01p0vvMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701149; x=1773305949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6s+FsQFpqu/vDgQyg0+TQPZ59H8NI4Y6FQXzmEFkHY=;
        b=FdDJnsWSWExG5FQ49ZwXrCOcMvV9zGCjaR5RVY9jtUuJVwKaBX/ShOafJP9rUvQ+TN
         8LdJhHQDcYlwT45lZxWe6J0oi116UU220/oeiKb8eL+mAedfHPYaYda3egNE3FpolKjF
         GCCioL7cW4Q+3+aU0j4fLvvTuFJRNheBifBOgMDpbl1TIWCMv2aQyzdtGmyfJGOniKyg
         JzBGfgqy3w3GMgRI65lFewC6vmRTjPqjrk+3KIQ41Jod77U/7PIBrgglyRJsn8kQWuMm
         ZQv3R1fqG2dYJngxurGp9CdzdBJ9aquEVXdpj0Qf3z+4OpY1f1MA8k/JYexq+P04KnbC
         jclQ==
X-Gm-Message-State: AOJu0YyCKGUO5+VvW0K4yEpoJF1d5NYA0MuoK9MoXg8qWcq4si15UD5Y
	f/mnf1E2blTclo8DWLu8IiWaRC+weNzF2FzNNdIgVVwdaJFcA3QofAzfuTJafj/1c46ftHJxMdb
	eawE7
X-Gm-Gg: ATEYQzxdkRZwfisVVpXz/fiW/ZhrLqwMZfD95NASpoq+4jhUD2FcX+LhvrS1kdslhuz
	+qDxWTHqkrO7YiJoCpCoY1wa7gqApHrGrsofUu5J2CMDVA1X2PV+gCNL9OxVXQLb1kGk/6F0Twz
	mKLKoYEizUelXYZAqystKkGSncW/3R71/CQ1ecbTIZrhQoBB09uBePmsqSSONSkyXktecgUhi9p
	6wquZFoVIlnzwQUQCZkGKEVELbIcPcdans8sjHUVguT8nxDKPtJosvIoAQ9b9X133wI2jG7Xmme
	ALf4Cbkkr6cHYP3ssVwMN3N9xMx+SlG1n6MD/eBWvOY68nxFn7DedvzRVcm8byDwJEa64Du1++G
	ntuWgOrlq34xIijaf+v6MoDKywcvwNKqp+oh6ieuauHFP5+fy41iAoHw8DqDnVIQdAKT8eWIkQE
	m34C4pgsYPs/j1TCOpLYCYJmahEn69BZtQnB8DVceS3P5SyYU9zUJ0ocvnyCHDu3JS+gDkq48Sv
	2TyQatGgPGo9P6KbCL8T4giuyvt
X-Received: by 2002:a5d:5d07:0:b0:439:c5cf:fc73 with SMTP id ffacd0b85a97d-439c7f64f22mr8828119f8f.12.1772701149495;
        Thu, 05 Mar 2026 00:59:09 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae3f31dbsm36087138f8f.1.2026.03.05.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:59:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [whinlatter][PATCH] create-pull-request: Keep commit hash to be pulled in cover email
Date: Thu,  5 Mar 2026 09:58:39 +0100
Message-ID: <20260305085838.1176663-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232465

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3..5c4414ecd5 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

