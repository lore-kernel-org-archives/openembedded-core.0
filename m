Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78CBC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:45 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.64021.1656877059589986594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KanaDjbW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id w185so3481214pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RLITg/2AElZSoyhx5MrjBYkePq2mIg4pBhQPoLHu5cw=;
        b=KanaDjbWdHKH4Phfz4z2ozXLMxA/fSzK+vJC9kBX/gPw1H/sBiene0t/xmIuHTWObb
         K48dEUFKw0K4AwBoEZPhdmk3DDJnBVVSfr/dzT0gULJNtnjWyyP4KtgcCkItA/NJLJG1
         zXzZrqf4pod5nWTopyAxbYxKgwAIpeyMGJQIIrHslvnuFbp6FiCNYpNvFAYilVl942RQ
         nlc7hx44Pi7KBCWT5UoSnwXxFjOKS8dNhmBx48zBAS8GPVP/u2SH11kMwsvMS0O2GtHf
         9cp6LSPGGK9WJ12xOBQ5zDnl10cpMPV1j6+V+HGsHOHv0OWL8th+j6D5tLwPQCPC/Svr
         JHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RLITg/2AElZSoyhx5MrjBYkePq2mIg4pBhQPoLHu5cw=;
        b=dir94BZcOK8famwwfvE1H7Vm3jXweVIi8BwkDz1ma1PEMEv6SPWW7kJ3T309YT3D5+
         KSH8zVgOwRhgZ7CVpZoGbJpk7dm2JZ35J1N8OJDGlcjm5ygTqciSSRfqfzAFiXJz3GyE
         eiBxPLUrXxjn5uKmsb5InLluHBhqJ9nJX9vUdABkCTW5t7gwyhsz/HyF+f2kQbLzKSca
         5m744bVMzGpcZcar2YQHQSC5487UCex1dTsCrusqG1ldUGxZr6Cu7rYxgTQooZUwyZsV
         pd+kJwKeP11betzZQ6xjmDxY69RFenYplrHyeXP8ZpnPagnCNde6N2kKItkZNG888atm
         G5Gg==
X-Gm-Message-State: AJIora/E3p5ezP4sf3VSM3b20vxOSx7Z1Q5RaN/GZh2XKaUmYgx2+PPh
	3oi21ZCZaEwV8ue7EsiNtw2TIZMmmp5ulVDv
X-Google-Smtp-Source: 
 AGRyM1vcvQGVM0hhM3WXDmfskVWZvI8Cbss3kAQdcaxrgz07wMz1LZUsbEgpMC+X7gwlcAc4NICnSg==
X-Received: by 2002:a05:6a00:400b:b0:525:1c50:557a with SMTP id
 by11-20020a056a00400b00b005251c50557amr32078338pfb.4.1656877058596;
        Sun, 03 Jul 2022 12:37:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/30] insane.bbclass: host-user-contaminated:
 Correct per package home path
Date: Sun,  3 Jul 2022 09:35:51 -1000
Message-Id: 
 <3aaf9708be7b7ce67513af4e332733ea58403517.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167576

From: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>

The current home path that is compared against is incorrect as it is missing the
package name, this patch adds it.

[YOCTO #14553]

Signed-off-by: Ahmed Hossam <Ahmed.Hossam@opensynergy.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit ae8f22d9e2694eea5ede3b31c6f3bca404ea4a5a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ca84bace9..6f6dcb3dd5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -970,7 +970,7 @@ def package_qa_check_host_user(path, name, d, elf, messages):
 
     dest = d.getVar('PKGDEST')
     pn = d.getVar('PN')
-    home = os.path.join(dest, 'home')
+    home = os.path.join(dest, name, 'home')
     if path == home or path.startswith(home + os.sep):
         return
 
-- 
2.25.1


