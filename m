Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F38C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.62236.1699295644104525081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 10:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZ3j3nVo;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5b980391d7cso2719507a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699295643; x=1699900443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIA7GYEpJ/Z1fil/XO/9rYYopUC9huuSTDHiE5hegP4=;
        b=iZ3j3nVoErDPgp9X6tOujkTdgLSaf/Ozk+g82LBc4K0WEcvCLVNkTq9WlEPjCdZIO9
         dlhYCl7fa6DZvcgZEEmdjYcJAywCi98FuB1THl85447ww6wGlPXdEg+8ykd+RwlxbW9F
         7W7Tk27V7d7jPetaEJTcTuCpWc8hclAjxqr9yQf0oOG0jYd+2Vv1DRLo1PvH+wUguVJE
         GUMTDJCRGSP724khYdZvTCf6rv2D48X4olB83EePidwZiECh4/cFxZH8mTdYGaZO4bOo
         wE7KE1XFsy/G61WRmRrYonBU8fCLL7R2LIbYXOtoEvq8jArgSblXipZWCNz07qY0Rf53
         pbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699295643; x=1699900443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIA7GYEpJ/Z1fil/XO/9rYYopUC9huuSTDHiE5hegP4=;
        b=hdruKdFTOEapd7mgVt0+KCV+FOTrycQrsg3iiDtoNFPUYckGwpCd5221ZttCm1mOhv
         kxsMqMrxJKTgsK/ImnY57h44NuOtM252fDP9Srr11U9xYkvDXwt0CjNdFmzaY/O2ymaU
         sDuAFV0qUKg3U1Q+ZWIjhe+U/yqumvWZjO4MFC5MetBdBcSx6mLgS5dAv+WKlnxG8GBp
         TflwrGroIMvBPJcsNzmdTmtu7+GoDVyhEkq+d+SM571sMpOS8El05zAuw6GPIzYeKWwH
         xs1gnffKBruRkucEPkYJNQEVGuH3fPfY8dL1xQiE4fiHTPtGb9fnUeEpu5bK6et/eS1n
         uSSQ==
X-Gm-Message-State: AOJu0YygO+9Xj/7YdNmTfrbMbCpxHO+ZK/xb2MDdfFfdFGrz8H6BqPPe
	lp+XX78fzlvUBVdx4z/WbrAOAZq0TYxdIw==
X-Google-Smtp-Source: AGHT+IHjruMIvwGnZMcIVuixC4slGkDKoT7ghjm6E/Npic2YE9jTe6VNrlLZXLrGsisLMPN+BTArdQ==
X-Received: by 2002:a17:902:ecc6:b0:1cc:4a66:7d83 with SMTP id a6-20020a170902ecc600b001cc4a667d83mr23247315plh.2.1699295643026;
        Mon, 06 Nov 2023 10:34:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b001bbc8d65de0sm6193075plg.67.2023.11.06.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:34:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Florian Wickert <fw@ferncast.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] systemd: Make libnss-mymachines conditional upon packageconfig
Date: Mon,  6 Nov 2023 10:34:00 -0800
Message-ID: <20231106183400.976526-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190243

nss-mymachines packageconfig controls this features therefore add this
dependency only when it is enabled.

Fixes
    ERROR: systemd-1_254.4-r0 do_package_qa: QA Issue: systemd-container rdepends on libnss-mymachines, but it isn't a build dependency? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Florian Wickert <fw@ferncast.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
v2: Add missing $ ( typo )

 meta/recipes-core/systemd/systemd_254.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 8a8ff545995..c86c2aafcf0 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -542,7 +542,7 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
-RDEPENDS:${PN}-container = "libnss-mymachines"
+$RDEPENDS:${PN}-container = "${@bb.utils.contains('PACKAGECONFIG', 'nss-mymachines', 'libnss-mymachines', '', d)}"
 
 # "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
 RRECOMMENDS:${PN}-container += "\
-- 
2.42.1


