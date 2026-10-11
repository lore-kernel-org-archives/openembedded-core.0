Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3792CCA9ED0
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23568.1791708074596030812
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oG/woIQy;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so127369f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708073; x=1792312873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g9/KcSkDg60NAPusg6YWATKdw6U0Jdti5Hk6MMxn7TE=;
        b=oG/woIQyjFHU5LbMTqnQDkiLle5DshB74N9HdpVJHAlX9nBYLViQHLz8hgfCF+VC30
         Y5WTy2CLUURxNIYvFEAu+9ODYh3Lek1SkBpOH2yHnSE2KN5CKdBYR6tkYmzlXIPjf8KN
         m34Yz8Ri2Slu18Y4ITaZhoxd7DM0q3JLSxIuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708073; x=1792312873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g9/KcSkDg60NAPusg6YWATKdw6U0Jdti5Hk6MMxn7TE=;
        b=qLOuXwpDPTMRP9B/rwu8moBfV2UUC9tRuW6wxxNTgALB/pdcgIH+1RrGI6CjXUATMZ
         oT1FrscKBtPTd8KVYMGYzJsLMLDs9IWa4fC+n+FxUBNCWAglQf8TomtLFrYLIrF6NC+z
         B3NQIgHkoTRPTp+Rfglm1zGqrnUTcz7lDOSLnGMhapK870sXcIH6J5lMRctdzoaCy8Al
         OqY6YQv7s0KKuLORhHpst3UAS1I4e0rKtdlYyF4jqCxs8YEaA0aYFeHCLAY/foxlnek1
         vcYhf5J1dBl0BAlOFQNVpR8+B+k4QspQ0BSJexi3YinoWYGIC38aODNlSb+n9gN6jxT6
         61iA==
X-Gm-Message-State: AFq9FYI2X11tcBUnk7qlg8fx9+tXCmlBIvy8pRQfiJwmDtU7FOsM8o2R
	r9+Nl2BPMLJzqeo4nawCHumQp1eJZglNd6tQwSt9ZVDTuhWe6eZWF1cLtjEpJ3pJwj6Y/AaQCFx
	AbgcY6DU=
X-Gm-Gg: AYBFou05paaEpbiaYrVIrYXloVsrK+YoNA3CGykBas7+9XET0Zi0dwogPBNhXl9k5nl
	J6hoH37p9YCEYolUfjqR/RevFkE6HCuudIPcWW0PbiL2lgxjw1b+TPWqQ+hlFId+nn3iBTUlzbE
	UHgh8ymggRJTnLYh+6w5bvX6mOKttZKEwZVumgKquVO5xuq4lqE13Ep3e4AYiWDv2EM+4TVsCar
	2jFO/DyXpgaf2Rttz4UTTCWF/6IyEvL36o1q55O0hCi7SjI5rOB8xw4hdlIrlpnv9vXdWdbIWHk
	oMhIuOmNplz/arcLk4MoBaUi/BYVAEfn3ZE2HOt8blChLpX797HhWcPbfDHE9vEaNkiN63ucRx/
	rJa4BjxehCkzVpXWQaCs5CxW5gWlW2nKIWLpKZoKDMRg0JRYm6A47a0dLHH52myISCvhMdYuwur
	A2bq2mAx9BGWnhVvhTuSZpza98mKoys4EylgZ1npkMPs1mAzwCKoB7OWVyv82Rl6geHTcjO2CmX
	/RkICPvBBTSxEO4RBk6E4UahBrRMPTN/cotkEOBN/XhB1I5nytCRVTX5EfUU2u9hDSBdPssW5c=
X-Received: by 2002:adf:f184:0:b0:48a:f5de:2ad1 with SMTP id ffacd0b85a97d-48dbad2acb9mr8241988f8f.42.1791708072636;
        Sun, 11 Oct 2026 01:41:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/60] vim: set CVE_STATUS for CVE-2026-51400
Date: Sun, 11 Oct 2026 10:39:53 +0200
Message-ID: <af972cbf3abd540bc2e8af1cfed6b9698aae9231.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247529

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:

- The vulnerable code for CVE-2026-51400 is in src/os_vms.c. [1]
- src/os_vms.c is VMS-specific and is not compiled for Linux builds.
- Record the not-applicable-platform status; no source patch is required.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-51400

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index de639a65026..37c5cacaaaf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -52,6 +52,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
 PV .= ".0340"
 SRCREV = "6addd6c101117706bc9b3609d3a418e26e92618f"
 
+CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
+
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer

