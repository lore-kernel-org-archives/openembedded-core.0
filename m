Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCD6C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2935.1790154724595376056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VgB5U74x;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so3482875e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154723; x=1790759523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rXbk7/mq6TpPAyxucG7gQwGeu7iOKTSm/zjV3lKRaTM=;
        b=VgB5U74xY6BF6baZj4c2cf9/IslY12/ItPs0yl6jxMfDYAH4/PyJ3SPngxeGvvEll+
         Ypq42fqmMgus5Dr7LI3qc34jClWMx0QwJVSBduWnM3eBO0oa5TQJeOE4sWrelBkM31Gx
         IlNOHHtM5yMhQp+y8QD3FKjHhbkFkFBaRA4fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154723; x=1790759523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rXbk7/mq6TpPAyxucG7gQwGeu7iOKTSm/zjV3lKRaTM=;
        b=kHTHZVwiUe7Le90tdcvPudotqegBxcDluH7+CIxeCMDZQXkX1qCd8Ke4N75RxgVwyJ
         YCga+63vItMqXDn+Eh/d73wsaACgNYlN49hDsGpvfqON/f4+vTFiDXrnRFc7Ire3Z2sS
         6kggMQLWfUKAlEmayR6vs/RG/qFsGuep6etTa0qmdWKpyDsHemZUMzw8fcni8gDgcxgZ
         oT4aNmutko88dphugkHNgOxpMUbWcwzB+erjLKtR6teMue4lpYm0PCdQXSetwDWQhnWm
         jRN2z5GVqJB3ldZ1Gfq1CHSvXZ9sYl6IgYUrRUDT5l4GkbSrWWDl9PhPvIvWid5CoOdP
         7y2A==
X-Gm-Message-State: AFuF++l2H5TDRHw84rf6zZSvkGh97DYYe+OzFKmChTduaCePA2BPkJI6
	DIgnDYx7EggrL32+4HwC3Ch2pA2mFghDXyubUt8QTo3iaW7GUnVjLGgrDkI/BYUdNSgzY0+BoWq
	OB80lXMc=
X-Gm-Gg: AYBFou0l+0+uH/NjBpPuKz/jKS3wMy+mLIdMufYpmKnNuukt3+KmROtH1sWkTn88tyv
	lJzgDzMqdBWa/xuAxOTUJfHfGF7JQaDK63Fxohq76+11k1zRaLICIluGQihkP5gvqrDSWVhPNwb
	ijGEWN4HGqxmHKqDFcgjThN8JcDMDa9grFxsynoakf44eTd1B1bnXxDnrOLGGfIkOyYrSOIPqxl
	4SmIRxZRO/rJcI8vKj2WUlww+uWATT/+sVUYUyE1HLtSQHHPxGm4zbaZtMl+1m8MI9uW3sVHkiK
	bCVflG8WnOY+QdtpBKXelpdXMmHlnrUA3Ni50uwkzBQHkXtD8zSKruWRdja4tpI5NPIu28X9v1A
	5SvTLRlswe8mR05hd11w0LpLIBhf4Lf0bpjf9qmNKTwKB2qj7RYcDsrw8fFvz3tzeJ977MREHME
	SZOWDc4TwQj7hE/oTYDpA05IoSKqw9JyoUEBxTSkQTlhebU9GYY6/uTnfCpUX3OBboW6ZKVk8YI
	DFPv0NsZKWK5Y+quQ7yxDAw1iLaijWq4I+0PY/kzrl60aGSb0KBZ7IxZOzIkPYaBHpdknCV
X-Received: by 2002:a05:600d:8643:20b0:49f:bc0d:2e9 with SMTP id 5b1f17b1804b1-49fdfd90205mr15451355e9.0.1790154722785;
        Wed, 23 Sep 2026 02:12:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/48] ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
Date: Wed, 23 Sep 2026 11:10:37 +0200
Message-ID: <62d96e61678773686773203216f924d34a47160b.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246497

From: Yoann Congal <yoann.congal@smile.fr>

Changelog:
- utils.c: Fix dirname() handling in run_ptests()
- ptest-runner-collect-system-data: add info to logs
- main.c: Set PYTHONUNBUFFERED in the environment
- utils.c: print a message when a timeout occurs
- main.c: Add print_helptext() for detailed help
- main.print_usage: Remove unused argument list of -l

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 869d70d46c8e31cfc380b5143059cab3713cae26)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
index 9f6bb399b40..b52f327af97 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
+SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "

