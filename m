Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7E9C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.4514.1661294199359327887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1kf+Qe2u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id w138so12164433pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=x5qfZMHocbZNKSS6paUUwnspavYB5Qk6KSksAjHY9KI=;
        b=1kf+Qe2uRkLS6J9J92NNQjs1wevu6bcPI0byYMKwx+oYB3XVaxDf3dJHZtbj/bPXR3
         Ka+lW8keG97Y/qGh8cT6+s18V3ZQHdKBtvMyQ3ZQGf9M6lAkN0CUzAwXyuA/E/hjcqtH
         NP9ZOfvUQOrpr5eA9FpavDfVM2jpYknrp8sA0wUJMM/I+Marnz0Mk69iZf9DIF+iBz/e
         ncIxbLrh8dAGxHMrnFf8biBkTFrPv2mKpKBvhrWXQ3o1iH7V09WDmUa/xZstTFSdBZSq
         im324NMoLVuwP43kG051N03xe3Q4/2AWTPqxhsBmtuCtsZMks7rBiYzBkSRx3CBIHbMx
         e5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=x5qfZMHocbZNKSS6paUUwnspavYB5Qk6KSksAjHY9KI=;
        b=J4yMM2CgY6S/PpesJYlGcrnJACcLJRJZLpjozy2QL2pIxzESqDPdA7GxxezuY1So+N
         8vGkvoBE2n+rXRDFk+bAdDfB+HUusZBqp7VsDErEGSTRDMeUJ/V7Lt8tPwTTpUblOzYU
         uLpTOccZnHj38cf73fnJ6kc8E7XpsyiylnIdzgg4A/2GRVRjLjrLW5JCWQAzhYb63HTZ
         3AlAFF9mDYv/nMx5olGXeVyLDRqbm67SFY/8LuMeo1FVGxTBaFsyDsNpLLXVVVabgtSK
         Ajm6lNFLbTwQ2lZto9/WFonSVnsO4m+17p/TgEqktzJLwpwR7uLobiMSPYDoGwhOGfva
         DpfQ==
X-Gm-Message-State: ACgBeo27skt6ffe0rYwMPJBBRBPRPWD4NwMiPDogcauzp8cDA9Dhjovw
	8P2aEBL8XL+nRg0OAGORSUabFC+Dg9YIUhGl
X-Google-Smtp-Source: 
 AA6agR6ofRmFCEzjaee5yPAffq8qeiJ7msPap0ac46CgOB4YAJ/9hormEJ6nv5/NCeMvhNnyCG26Xg==
X-Received: by 2002:a05:6a00:2302:b0:536:c7c2:10a9 with SMTP id
 h2-20020a056a00230200b00536c7c210a9mr8760802pfh.11.1661294198396;
        Tue, 23 Aug 2022 15:36:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/28] archiver.bbclass: some recipes that uses
 the kernelsrc bbclass uses the shared source
Date: Tue, 23 Aug 2022 12:35:36 -1000
Message-Id: 
 <2556d0bd85039d45cc4b0f9b5d7c4ec50fcbb712.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169756

From: Jose Quaresma <quaresma.jose@gmail.com>

This fix a race that happens when building some of the followning recipes
with kernel at same time.

The kernelsrc uses the kernel shared source dir as their source
S = "${STAGING_KERNEL_DIR}" and this will cause a race in the
do_unpack_and_patch task, when bitbake runs the
bb.build.exec_func('do_unpack', d) because do_unpack will
clean the source dir on startup.

| ok: note that S != "${STAGING_KERNEL_DIR} for this ones
openembedded-core/meta/recipes-kernel/perf/perf.bb:inherit kernelsrc
meta-openembedded/meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb:inherit kernelsrc autotools-brokensep

| broken
meta-openembedded/meta-oe/recipes-kernel/cpupower/cpupower.bb:inherit kernelsrc kernel-arch bash-completion
meta-openembedded/meta-oe/recipes-kernel/spidev-test/spidev-test.bb:inherit bash-completion kernelsrc kernel-arch
meta-openembedded/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb:inherit kernelsrc
meta-openembedded/meta-oe/recipes-kernel/bpftool/bpftool.bb:inherit bash-completion kernelsrc kernel-arch

The issue can be replicated with:

INHERIT += "archiver"
ARCHIVER_MODE[src] = "original"
ARCHIVER_MODE[diff] = "1"

And:

R=<recipe> bitbake -c cleansstate virtual/kernel $R && bitbake $R

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5487dee2e1237fb57c5e59b2bbbfbcdfc8c97ab6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 5da369d422..dca4271a69 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -459,7 +459,9 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
 
 def is_work_shared(d):
     pn = d.getVar('PN')
-    return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
+    return pn.startswith('gcc-source') or \
+        bb.data.inherits_class('kernel', d) or \
+        (bb.data.inherits_class('kernelsrc', d) and d.getVar('S') == d.getVar('STAGING_KERNEL_DIR'))
 
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
-- 
2.25.1


