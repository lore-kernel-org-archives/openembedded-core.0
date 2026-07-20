Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E5AC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2891.1784568233498789083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UmORS7nt;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso23594815e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568232; x=1785173032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZgwC8LKBh+//IUpP9CyEyVL6WwY3aeMnUh9z/aP2zy0=;
        b=UmORS7nt9JzVsAYGFcou3jUXPKu668pwXhqymAKQ3yhne+1I8SZ/BH6KfWQQz7pzyv
         a75wfKJ1wc7k1gjgflnFdO4vOewbT4TpgMPnqoO1UMI0jnL57wF3t5bgYrvwPivR4/m1
         G4ZcxwQKtbvbGIu0YwU+5dLeQ2u7t/mNPigbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568232; x=1785173032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZgwC8LKBh+//IUpP9CyEyVL6WwY3aeMnUh9z/aP2zy0=;
        b=WJ5GJaMct9qKhegrcrR6oTiqOVX6AsSDGkAfudbd5d67E/a5J9qcRSqXEaeeddE2zz
         Z7HnB2Mu76nPtcuIM0uQSNBHC98wIMSfPvgZ4eploAlPQPcrXTB685Dgx0bpVJvRQbQ7
         PVo6b5wt5QEemiKuAKErdXY91v2hTO90c/dYL2ID8dAD1CxqfRdVTYYmvjA8vN8R7TXo
         +wPL2UbsfCpQ0d8B6w9kO8LYjVqQ9lptQyZR18iLL+P3KWbL79f6KqSovc6uJ7ZAZZLw
         uGWdY9B8ObcBxxZ0Enh8UbqWp2FBbBGBACWdS5GTtalyqbhN6cNOeEaKFXl5LfOMAVwU
         TjZg==
X-Gm-Message-State: AOJu0YyfNovlhoQ2hfFSkb5J8oSEII+LoD86YiV16oa6vfi0ULt0dBZE
	u/HYr0s9k89RJ6ya8OuXZhvbAfTkNgb0uDvtzBUMp3Y1bsvltA9eu3lkNS4uvyste5Gvjuh818P
	725CNkiY=
X-Gm-Gg: AfdE7cn40jXaBDA8InRiafHZVPz0P6lzdbMIddXn3ro9o3tC1rhsXOqJk5nS+1uqvFU
	1rZQW8JLCCW1D0v+fr+AfpUnMwRGc98rz/1H3AzNQ+UUUUX2rQRypy7I4d6zEyIAlfimBplmIjF
	jCGs3oVSZbcp0VZXXdzK2zX1JmvIzSZwG9HQvN9VUivC8c06YHEBsP8sdIT8BHF7jyISIVNEMbs
	9PnRA2Z83E2Is/kKo2bUj4AbG5ZBlAJ/mtP2JELyq84mYV4CoZkjfm06JUJ/rPkQzwr0bs33xQm
	SDMa4DCJG9CHlES1CqQczwvQyMHFhyNiONLlzO8+zsgNX22gmyxyJOnoOnzYK9ubA/YvJzTaOzf
	Bat9y78m21ljEJ3iaC3ZdmxxZSN9z04PW8Y4jKeGSCHpBxWaz0OADh3JcAji26Rom/sjfABdiAN
	Y+1xAXhIlv3XDZGGhROjtPwbEQ5Noriyu4x4sovlZMY9lnl3iyEIiw2mLpes+MDxxdIeVI4oJGQ
	yTFk2Tn
X-Received: by 2002:a05:600c:6c91:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-4954a402d87mr112488715e9.18.1784568231682;
        Mon, 20 Jul 2026 10:23:51 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/33] glibc-testsuite: Do not generate SPDX
Date: Mon, 20 Jul 2026 19:23:06 +0200
Message-ID: <9a7f92f2dce94876fa63ce8625d53444a9a706aa.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241467

From: Joshua Watt <JPEWhacker@gmail.com>

glibc-testsuite does not run on target or factor into the build supply
chain, since its purpose is run tests in Qemu at build time

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 32801348ca231978498612f3ebee121ca27459c1)
[YC: See https://lore.kernel.org/all/20260708115052.71740-1-jaipaul.cheernam@est.tech/ ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc-testsuite_2.39.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
index 2e076f4b0f4..e0e3e8ba847 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
@@ -31,6 +31,7 @@ do_check:append () {
 }
 
 inherit nopackages
+inherit nospdx
 deltask do_stash_locale
 deltask do_install
 deltask do_populate_sysroot

