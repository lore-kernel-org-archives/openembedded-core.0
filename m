Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF33C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 12:31:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.7137.1658493099234779158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPJFAls+;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so5089481wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sgCqS2WTowrWHNZjk62KxMD5w3QlNbc2gefNiYllefc=;
        b=JPJFAls+L1pvM/Z+ponDwecnEeMad8Cfw0k4fcrTQcFfAF7Vg5HnZy9WM9ex78g+pu
         X8ik1MOKYJ58O+/b4phR2irqD2vRv+kCOIW6LrABrU0xkdEvQmQzDISq7CteGQw2tTSV
         xcZzJnF8AD9boY0ZxL4ypMVOlOvvvNetVMsUfdvwZT/N6TZSdSFnGpyhLcAwdHdR6sqg
         z8Qac/tcLqUo854OM+7WHFzKSBkAlWAv8luvBgHvUG/RPym+BfESLXvW+I6d/9P6mEGO
         IqjXOjwV0cuUmyxjztAfBQhPLvJu9krX3MaKnY1yPyHLUlG7NrYQDuQUFcxT8yThKVUQ
         W72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sgCqS2WTowrWHNZjk62KxMD5w3QlNbc2gefNiYllefc=;
        b=mFWwNm/zbSGdbmM5Uvl8UmbF7uJe2V6jpCMMhERQz4wmRWWESp16GHpf4hZdc/oskV
         +KJAOtgGe5EUejPJIb7bvBwkpmfYqC0xjasvten5uL8MCSZWGfRULIewQ+VhLNdjFv4D
         KgkE8DX6Z5nr9N/Um9SAPnKm/6p7LslqcBUJWNz4N1YJE7E68G7REchBUotS5Cp1dT59
         2c4zHxTg9ZD+YaO8BxHjzsw9qBKp4ugb6dlgL3XsJMhNzuxYBuofrEsGWrwH9YIOFszo
         Sv/c6uf9fE5j0nGBnSBjifK6qa8kDX5iatGZ0nunHyWKUnbQcwGBJCQ+b3jXEN718dcW
         A/NA==
X-Gm-Message-State: AJIora9YOQfeKkBH34aoAE2uKJRNwLm2/DAOAeIeue/eVEJ1BbU7FCXP
	a1VRnK9OYJWiFuPvEHs0ivtw1nL3+2258g==
X-Google-Smtp-Source: 
 AGRyM1tVgLdy09NREhgO6EE3IJEJwuKVUkwA8+CDuk8MrdUUwLteSg8y9G/gR7rdLoc9cn5kS8Xs5w==
X-Received: by 2002:a05:600c:2194:b0:3a3:bea:1017 with SMTP id
 e20-20020a05600c219400b003a30bea1017mr339765wme.44.1658493097407;
        Fri, 22 Jul 2022 05:31:37 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b0039c5ab7167dsm8404001wmq.48.2022.07.22.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 05:31:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 3/3] archiver.bbclass: some recipes that uses the
 kernelsrc bbclass uses the shared source
Date: Fri, 22 Jul 2022 13:31:24 +0100
Message-Id: <20220722123124.390710-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722123124.390710-1-jose.quaresma@foundries.io>
References: <20220722123124.390710-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 12:31:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168406

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
---
 meta/classes/archiver.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 9c605cc932..c9ff4b2c64 100644
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
2.37.1


