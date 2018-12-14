Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id B36117BDB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id g11-v6so5643652ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9FX3XwDftrn/H08YH8tpXyr3G6itfkqyA1Lsp7NtceI=;
	b=gWaMwZQTnkOHwJtYOG6az+SZHt9CFQDjvkZEz3eMB0aci52McuLN5hosrd7zjMUkYq
	lykS8DxUvkkCubGnAC525fGcySaRmLoqw7L4bnbaLx+H1m1XGS7SUd6rciZCG1unq57w
	jg42NkneDW2NPUeC4rvwOjY3U8FEk/phsBSniJt80pNi4v/+ok5SyhSQr2SrP8ZkA9PB
	yha2lQWYXp/KpQBFuHVTBIRs+vc3pRInsdnaae6oiacud2d85HWqKmVzFnM2+16Lchb5
	Jo2NPKtp9L0CDW14kmurhp0KhF6Dd5gqlUutebk1G3oICJ3CqrgUynd7g4bh0k97HUku
	a01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9FX3XwDftrn/H08YH8tpXyr3G6itfkqyA1Lsp7NtceI=;
	b=TDmn+ZjEy77f7SaSGSrMH7rdf1rNEsh5GkYY/tAupwkWVo5dSciti0bGbrUVR7lJ01
	u2QwUtJ+kuZQZNgHVfpflrFxbN+NSfrPsUlNon/j5R9riIpEV5q01tds50GEnhJbAxE4
	yS1kf3kQEZeg/9dbv1tYjSx7pMfzWmmyp4Yf8qHZ7cc9PL8x03Imed0G65MqL88IqszD
	QIIpLny+FlEzZu2JANpEv3gpLuluvTjndVcqdcI7zwSE2psQku+Fz65EyFWb7tareUaS
	esbEjq4my0V80FZxiBKGFJUyF3m9DRU4tnY7NJ6R/9MWy4e7Nc3dfwbvYbGEqcwsVClB
	t9+Q==
X-Gm-Message-State: AA+aEWYVHrXntxNot0AeM0gxsQuuumopYQuzN1jnkti4zqF5GEW8/sML
	mVCgiZgeah6zF8X5+166Vqz71iYZ
X-Google-Smtp-Source: AFSGD/XVGMoZin/v50mWlmDNjfZFZv3cMmFoaNIkp7PnlNoVxVyDJlG0CDQTkaQtD/hh5toXlaRelA==
X-Received: by 2002:a2e:612:: with SMTP id 18-v6mr2329070ljg.125.1544810147046;
	Fri, 14 Dec 2018 09:55:47 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:46 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:33 +0200
Message-Id: <1544810082-22164-5-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 04/13] qemuwrapper: Explicitly exit in case of no qemu supported for target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 17:55:47 -0000

Running qemu for userspace code on unsupported target binaries might
be bad idea because qemu could say running in endless loop instead
of crashing due to illegal instruction or unsupported binary format.

While this is qemu bug we should avoid hitting it by explicitly exiting
from the wrapper when qemu backfill considered for machine.

Behaviour was observed in do_rootfs stage when building on IBM Power 8
host for PowerPC e7400 target.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 4aada52..06f1561 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -21,7 +21,8 @@ do_install () {
 set -x
 
 if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)} = False ]; then
-        echo "qemuwrapper: qemu usermode is not supported"
+	echo "qemuwrapper: qemu usermode is not supported"
+	exit 1
 fi
 
 
-- 
2.7.4


