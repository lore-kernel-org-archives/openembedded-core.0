Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7001C9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:54 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32859.1790495030772905753
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UofkWtfU;
 spf=pass (domain: smile.fr, ip: 74.125.225.98, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso544474f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495029; x=1791099829; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N90MvScTbg6bWUKUoSeKUqZiVzSM/6dkCB7r5dlscfY=;
        b=UofkWtfUy7HqNQ8eV/rZF5H57btxPXs4rZUOk3iwdy4yJl8KyBOiOPe4pyQZaeql9H
         5zDZ4cWbe4d+c5rLt+zaRTnXWV7Ku1Z1uPOYQX6Vlt/lyufjDhxiskVu1OIdSEUda6Jd
         kIshjMZtWduIsx+NmXwwgLnHBTWO56MAZT4Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495029; x=1791099829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N90MvScTbg6bWUKUoSeKUqZiVzSM/6dkCB7r5dlscfY=;
        b=1CNMAZyR16T81ucWv66paBWHeRNyL24iXUbMpfJYqdexnigPz7wb3c17MkDt8YQ7Dx
         QneJHF1VhezkgcviRTxUCA6CezpUQzX+JJBzd9krdEZ6uANNkoLMGMbXLm9IG5jxDDeq
         6CsPam1K9VlC+0tBZ5NjjDKa70ykB34Ubl80wefrtYD3K5sjKBmMs5XTm/akgcW+titF
         lbn6s/26swBWQoRlyh4NAXzD+Ue2oSPHCg7j7kGib6zyb7ZyFHXLcAmTZM8iMK4jGMqh
         K4iYvMdxhB77MTzxaVo/uW23nIe/Ex7NTmSLuG082yVEEBDi6cQZbqXG+lGgtM/zkpWQ
         HX7Q==
X-Gm-Message-State: AFq9FYKE9xOEkQoLmC0nXIHpBBdzk5TEDsW85c3/aMh+eOkwerxqPb15
	zrFg49mM/QEudmvMBm6VjJirg8eNHA6IyHG/xPUsAJiFgwZXM+RSXt2lBow6ZLFdrcxzA9skAQd
	3W+vnJ3A=
X-Gm-Gg: AYBFou2vhUXZ192l+q8HAuC+1DS4+KekmVhNMvLNdpneOLE6euT6BQqz6x97PWvLM5d
	BKekHqFaKHSzyDq7cv+kFEquBvZ08pjae8LlxCYlu/Bfw9w4nVZQ1kqq8R2yhgxPCscUPOrhmka
	vdAxvjZA7e4M3pqTi7DSQYtsSLd7S9NfrOzmBD8CHik2HpFh/EGPFegZtQdyLp311WvcyAdTLXf
	mhzdNGISJIrvi4YB+CrCmJObNBWenV9E6kdQJTNb/lmD/yF7h6gKugmfy0XtoBBaQwFfOP56qei
	un9db4dU9TBNA7RHWYwq0anzPqYE7g8mUxYIa1ZywQAXd6GJWmvUSsHggP/r48NBhTee6YMYkxD
	4jcXkQ0aFm6mjTZTKCrRHL5RF4yQqUD+HCBZXCFvhQ+3kDLgXlooButJJPpNEBCtxtQlT1vQUhD
	WLd9BvogA0AWopv3NhqlDgWp/sJvaZXaI1+QSOObSPL1mpep4APIXefkXQeul8JYwImlEnUhw0U
	6TXT5NZL7xpkDXNOUCP8C6A00vAJdJsT7x+F7UyNX51p18Ig8CfcxvkJZTBwBCJuW/AYFOKqg==
X-Received: by 2002:a05:6000:41cc:b0:488:83fc:a7d1 with SMTP id ffacd0b85a97d-48883fca9cemr8951630f8f.9.1790495028950;
        Sun, 27 Sep 2026 00:43:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/28] sbom-cve-check-update-db: Exclude recipes from rm_work
Date: Sun, 27 Sep 2026 09:43:05 +0200
Message-ID: <480c6440f3947ef6deb6d1a00ae3aa46f1e74571.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246664

From: Benjamin Robin <benjamin.robin@bootlin.com>

If the "rm_work" task runs on these recipes, the next execution of the
do_sbom_cve_check task would force the CVE databases to be extracted
again. Excluding the recipes from "rm_work" allows the build system to
remember that the unpack and patch tasks were already executed, so
it does not run them a second time. Extracting the CVE databases is
slow, and it also removes the database "index", which sbom-cve-check
has to regenerate — an even slower step.

Keeping WORKDIR around is cheap: for the recipes downloading the CVE
databases, it stays below 400 kB (not counting the "temp" directory,
which rm_work leaves in place anyway).

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3b81e8bc30552359125f2ca40f36ad11ce8ee969)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index fbdc561e8c6..2efc080b932 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -2,6 +2,7 @@
 
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
+RM_WORK_EXCLUDE += "${PN}"
 
 inherit native
 require conf/sbom-cve-check-config.inc

