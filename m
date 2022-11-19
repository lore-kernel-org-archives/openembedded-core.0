Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A5DC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.30959.1668892576090693357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NUm+Vzzw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id y10so6244800plp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvcz7QhKtO34FltDJUzOo6OokE96Nek23Cv8SjXaUZ0=;
        b=NUm+Vzzweev0hnlIsJcQ8JZF7actb7IVKC0EQchosij0WTDROE2cDecnWKyzs+3RdS
         LwvCHMyrQiY6L1yTAVTk2Txb8XmXGIlfngQ9yJGEYTUquYsfpL1mUZXnRAxUCXDi2Ww9
         8lXzBSkfqRZxhFG1EkgqKQSfNeriiJJIfNvYZYlFHrDA2iQB9QIrWA72cBWPn75n5uvn
         BTo+pLJRCkAfsIBw7cff/I95XPvnrf8A+Wp+9TUg/IXiduM5OZzYJtBomr+VwAIixfIH
         27ykZBLWDsv5KbiLGkf6ASieQaYr7np31vIjgsqf8sLJxJPhPjFHnMVGuVY4YpFrnWiH
         2SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvcz7QhKtO34FltDJUzOo6OokE96Nek23Cv8SjXaUZ0=;
        b=6vO+eOxxyTlgYOZ7gtIvF2ivSmOdDOZbxbtEDM/sfZxIK1Ut/Fdd88N8dmoNLEdBU8
         7NUyiJQa+uZUp0djVnsCzFz+HZtCLmojUGYBvAqsdgZ7uUN3pjdL9w6Q8wkkKaoRDuI6
         OHWhPspUhrHkbb8TUNUwPjZ50KwNWLkAS6xrp1PnsAFXyOAU8WEEjQ4wDqlN02CY8eRa
         XqVQz4QB/J02qHR15uauALS84f8+XshCcnXPfg/TwfcxUF8oTW/Q5NqVcZUTKd1TaGRA
         t5MqkC0eRjGui/NkpnR+IOHN19IyPdpNRHjf1SECwCGCuVKpzzFLkF9jsAf7KtXMpOa9
         UghA==
X-Gm-Message-State: ANoB5plDQLSKYnShll6DmTGOq8uAk5BKA3Ukw76PJ+DQsL0jJECgoiYE
	2olVbeORAba4inmhAAJYtye9EptwHVm+wPaBFSo=
X-Google-Smtp-Source: AA0mqf6ervf7vsW39O8x0MmIzsJhXMuerJFE7eCpm+N8kVdk6JFjg8jo+2FQJkABtZVHJ1gflW2a7g==
X-Received: by 2002:a17:90a:6906:b0:20d:5587:805b with SMTP id r6-20020a17090a690600b0020d5587805bmr13887021pjj.190.1668892575130;
        Sat, 19 Nov 2022 13:16:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 28/35] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Sat, 19 Nov 2022 11:15:07 -1000
Message-Id: <1859eaba8638549b2dc5d6ab3ae3c0b3793eac67.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173568

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
 meta/recipes-core/systemd/systemd_251.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 87668cadc7..1b771a7b86 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -437,9 +437,9 @@ FILES:${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
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


