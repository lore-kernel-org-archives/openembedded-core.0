Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0B6C4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.91896.1669557376984228180
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xSr/seuk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a9so4689992pfr.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS7cFmxeuB1Uu0Xdv3I9iQgX4H4SgVgq36HnP/AmyfI=;
        b=xSr/seukZyjrF1fTswnDhtNO//xMOwphJvl/nhoypW4yBDbBJ693/IhI5xlMBi9LMV
         tDTqKGa/CPdKuoP9jDp+l5FscTsBQCPSjcXSO6fLw17r9eiwW/sOa/7q/kZ0WxqKcCGB
         vureiK+UnHS8D4GzLg9F+zcRmWExW0Q9U788poLxTE5GtPasaO3YZrFtZ5/l1IAGKD98
         TQ2l0h+QzJft+CaDqxhCJKecrpJi4HjIHX0XbTg9iVpG1KFQbpNQkbpcQIp5kJyoeTXr
         7TFkp4eTwyURTrF4NjyP3pG4g822Kiso+McPSbpi9Prxc60Pm1tnYGJxGN7k1NNfmA2S
         KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IS7cFmxeuB1Uu0Xdv3I9iQgX4H4SgVgq36HnP/AmyfI=;
        b=SEduVjuNJsmHCG4BFTcwA3wECM+4P316+tcIHeq/Oyx3ZXC8R/bN5cJSltbSG8wEO3
         SwPIZK5hvJyynR7aHZUvUGrsClGpzRTiO+k8j4sLsDRzYbJ0fqsk+gUfd6teKgWq/xtH
         PIj1Gn+hbhUrpyQnW+mOaNQEi5SN8mWXySgEFk2gZMz+2L63EY4V9OHadIR8lxTcSDF2
         KJeX1Kjk8g1prJ4u0N0auKO8Gis8tB6o8i1cyZ7rgMdDNFRCsFpIWDpD65z5ehBaZ7fD
         9ex0xF8UU00tmGY/gky+wFVmdejKPUjJdzOI9TtyH4MCe4m2vhlFmn7s/bOROb4ub2nl
         4xHA==
X-Gm-Message-State: ANoB5pk6szpilZ8Pitjzr24xhVxcQzQEMEaEsm6I3Wz9PHk8qa+4Txxo
	Um1aVmi4QdEZLFHMQf6HaLodvdLBFgbbE6SKBu0=
X-Google-Smtp-Source: AA0mqf4MAWDdsbroZY3XqAVw6LsFm6gd95wXsAUYdyR4x59Qp/7Nco5kPSktrHrVRRyuMJHfCdJ3HA==
X-Received: by 2002:a05:6a00:21c8:b0:560:e4d1:8df5 with SMTP id t8-20020a056a0021c800b00560e4d18df5mr28112806pfj.39.1669557376062;
        Sun, 27 Nov 2022 05:56:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/31] linux-firmware: don't put the firmware into the sysroot
Date: Sun, 27 Nov 2022 03:55:08 -1000
Message-Id: <a75f20f71b4dd964befbae2f517d0f41f02fb4fc.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173867

From: Ross Burton <ross.burton@arm.com>

There's no need to have linux-firmware in the sysroot. The sysroot won't
ever be used anyway as nothing needs the firmware at build-time, but this
saves us building a ~900MB sysroot (~300MB sstate tarball).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 26ed998c4f201c5cacf330f52e51e416afbd300c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 6ba59a34c2..c7ecee0d9a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -1121,3 +1121,6 @@ INSANE_SKIP = "arch"
 
 # Don't warn about already stripped files
 INSANE_SKIP:${PN} = "already-stripped"
+
+# No need to put firmware into the sysroot
+SYSROOT_DIRS_IGNORE += "${nonarch_base_libdir}/firmware"
-- 
2.25.1


