Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B11F31E5B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:00:08 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.135825.1775750398452977636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z0Mlsu3P;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43d23305225so769240f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775750396; x=1776355196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=Z0Mlsu3PSjHJZMj10zzreln2nKNp+t0qhd1iI3m8zdro7oGq5lm+FBwT1SIxrrrmUx
         isZ0JdaOk+K5WMiLQDOuY+R+y9xPHLB7Je50m3mR30p0Mj5IKfpbUtjgihmIEbBWRHeA
         pi1xMOvN6a7/wIvKhirkQeATBP+fnGxpXcxMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750396; x=1776355196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=hxy7dsAcTPcKKUVTi+65UllXNKT0FA4dsSYU75c/6inVip2SZ69STHgBmUwi43OhQL
         yQzVqSdD0bmtebV5eUVRNyfnC/9zjxbJeoKgS/QUuSJBmxLrudMqAgGOGMZ+xB6Dq36u
         Z1+o98P7IuenACUOFi/qv/Yqqs3vqTPdboOWsBoEAvNk4baymCLu+dFnjzX2OR9i4gYr
         BRx/SX3lK8hdmN8p7WrtdUvixypWa0tfP7MFZ6Yy1JF1YeMO9Cxdmw3NuGhkmqxhcCcG
         wkStohYub+obGIY9mcyExGZJzNR7vFYY6IgZhtESgciT8gS62dhKcMGE2x0xxZ5qAXfJ
         NkFQ==
X-Gm-Message-State: AOJu0Yy0o0yMURMY3syjCcO+8VwdEajJgtU7Lyaf+aBOOFwc0iQwQw9f
	arvcT/mmaKhdLr4X2tQK6BP5LjvXVYLtdvpKfG9sNz9Hs7i3ksMwjSthF59xbeNh7HRlRemxeJd
	0azp3q4S3h5mt
X-Gm-Gg: AeBDiesmbzRCFK/+ZmnUmEgsE7R73oD3RI8rCbdwBma7TSSNadmbR9Pf9u60ehKrNJS
	tl6RhsXOn1ueDSYpPUpvqMMm7umzD0QsyuGedPnXhCPf2Xf132CIvDF0iSq3Lz8mRKX+YCOXf4G
	5BxeuFMlmNoZ3zNi1hY4pKaRa0EgpVXJe5YdXmmWVubDsiH2+kMm0av55geA64CjiOGJVlYuzDg
	5ozoHIOdPhcn6/wwy9jdvDTTdCgP6Bn0Pxh4kwQeGXl95fITxD+OsufN0K3PSAWMTWoSR24InKS
	61XrtfOiFyvakRPThMRtPUk1Gi4IbphPP85MasVNs8t/iennCG7rqROTZ7yYsZxdgwjZxmQ8N4c
	UZtzLZyTqAXdWglUfu1VjIJD5IS5YVuvU/MIA3yO1gkwHW7OmMYsTFMMFoJSCfHPQttLzt9PxJ/
	4/ucy4q2nxRDX4wJ4XzLhFojr5O26uJ5mHOwVX1YX42/PrMntCq/B40PTzZ2SQXVVNs3k0SbUdO
	t/ea5PL2W/yEc2MvsWFc3qKTmDI
X-Received: by 2002:a5d:5c89:0:b0:43c:ff58:35c3 with SMTP id ffacd0b85a97d-43d29267ff9mr37335103f8f.10.1775750396479;
        Thu, 09 Apr 2026 08:59:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003cc57ca6ff0f11d4.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3cc5:7ca6:ff0f:11d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm69149364f8f.3.2026.04.09.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:59:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH 3/5] scripts: Default to https git protocol for YP/OE repos
Date: Thu,  9 Apr 2026 17:59:33 +0200
Message-ID: <20260409155935.2245789-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409155935.2245789-1-yoann.congal@smile.fr>
References: <20260409155935.2245789-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234929

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

