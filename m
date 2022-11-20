Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6EBC433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.13296.1668953792553304384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZanV7A17;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id u6-20020a17090a5e4600b0021881a8d264so6765677pji.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0TnRUTT124PE9ANzqgLh2JSsLVqZmsRlYPZxkb17JI=;
        b=ZanV7A17tomlAuS2MwAV8477WARMCPQxxajQETGdS/jqXcA8DH3iIdjofSwoOYifsi
         TRFdr2j48YNxV7H5/A8RhjWa98TbACBxbxEaKgpreXzs/R3unhOrFVsja2uihItc4eq6
         I79ai53IBW3pwyMTtRlUUgLWMKBsFrh0h2g52N99GrJpoWcMVWrKhAhkD8EPyTlNqOi6
         OUBpfIL36asYWDoERVwfbRhQrYGRGZI9/sZTTfgS00NxMZ5qoX/FkOuHcxBC4pRlrf8y
         8d7qQbFNZIAArq4P3Z6AOP1xQc3+1SiND5A5l3AWBLkHEG1bBjr2Jb+bSb1gKiB+beTV
         +OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0TnRUTT124PE9ANzqgLh2JSsLVqZmsRlYPZxkb17JI=;
        b=PKyl6kY7909JLfbWsI0hmFZz/dPsmmoQj7jj29z7KtJQknvlJap4gMOT0iRINjSOOZ
         OELQJQhWjN+min3keEzcuSDU1kB1gO08/apBlqprpCVebCR412/K2r5J/8QRLlK71stG
         COT3jwMi+peJ1KiFjg6+qOiozrtJJkG6TIjlUfq6wa/azQ5VcEmmy3Sg53V63/PGka4X
         LPeAmPFQjxd3JZXvMleu9MkXS83p2xFbwXEzYKJ79yP4071XQx7RSETq2rREEz9VjQq9
         EDK6suY+jltQ20S/Jmglx2awv8SD5TX/cLLzTMGUIW0Lt5ogqSLJpQhvNqbizo+/5f4+
         xcKw==
X-Gm-Message-State: ANoB5pn7lhEWsRia3RSx/btm9DvtOIu/xrtX2NUDAbmrtx4Jx+cNFlkL
	op3l7bVQzO6CwEARZX74N8cnYp0unHDK/l5Ba3I=
X-Google-Smtp-Source: AA0mqf5S27pPQEeu4RKIPYUPZPzYgSDE3odA5B234wsuK8muGKpMT8tbsoTro2gZ/C8ycKfv+eyr/w==
X-Received: by 2002:a17:902:7b96:b0:186:9890:97cd with SMTP id w22-20020a1709027b9600b00186989097cdmr2964150pll.104.1668953791600;
        Sun, 20 Nov 2022 06:16:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/35] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Sun, 20 Nov 2022 04:15:18 -1000
Message-Id: <41ecfff7a413fff178364d67c1bf96c8e6d31c30.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173629

From: Niko Mauno <niko.mauno@vaisala.com>

Since RRECOMMENDS declaration implictly induces building the recipes
that provide the runtime recommended packages, conditionalize adding
such values according to associated PACKAGECONFIG settings in order
to avoid redundant building.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a1989add927f7805378fe4d5afbde780b747ba77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 8b6d0e8580..93cdd6fa16 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -431,9 +431,9 @@ FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* \
                       ${systemd_system_unitdir}/systemd-binfmt.service"
-RRECOMMENDS:${PN}-binfmt = "kernel-module-binfmt-misc"
+RRECOMMENDS:${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', 'kernel-module-binfmt-misc', '', d)}"
 
-RRECOMMENDS:${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
+RRECOMMENDS:${PN}-vconsole-setup = "${@bb.utils.contains('PACKAGECONFIG', 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
 
 
 FILES:${PN}-journal-gatewayd = "${rootlibexecdir}/systemd/systemd-journal-gatewayd \
-- 
2.25.1


