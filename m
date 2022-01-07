Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7081C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 13:53:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6522.1641563631022630111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 05:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aDMKvuEI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q8so11145985wra.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IljIFvVV2J3fso+E80n+SGKcxHUQUv94EMOabeApmHk=;
        b=aDMKvuEIFAb2suMrAdiHEF9pQQSAkQFqQGfeJ0PYFQh1ADJjD9zCOgvb14hQ/c+quS
         0B4Vl9L9Q/JYd0UkOspK4JUcLNlacutMwdQ3/vbQRKDl+zcu0Qn48V5CzLeuG/sJ9Deu
         G3lNkPOUAX6jeV7p3UG46udoTDb+z6k5UFomk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IljIFvVV2J3fso+E80n+SGKcxHUQUv94EMOabeApmHk=;
        b=Q/S9LEZb+psQawcnsJgLythIwUH5+HfH6PMzg3InG93FL0lfzdiRsXlcLBzGbyqhDx
         HFKl8LJ/+DU6MhVpf+maFmPwRppcqdB9A9FGAVdzv3y/P7dyX7ZMRcB/DpgiMTJ3Jk1/
         OmTyz/3kTWktFM7wyjDAg7/tXSmLU4m8OxNlzfEPCyyWwgSAbL1ZvKT2s9nORXIr4j4P
         VnKBbkwc7XUSJEfOR6gRMVRZNTZM19sJFY31KgBM971DBaXoTg2ERRqV3iX8YbJWzk2Z
         MNzRbmbvayVzlmmjM5G0Ke9vls7Nu7eW2R6z409xY/2yiyqzrzc8nWCgNnvP7IJK9kxE
         aEpg==
X-Gm-Message-State: AOAM532ZkkxOp2M8/MxBI/rIjV6IWHBcKkFQ+d9z5g21+NzqzWXWQyKW
	kFAGm5trfCcakbpopAhsk4/2dbJqjMsmCg==
X-Google-Smtp-Source: 
 ABdhPJyefFSl9yr56fxIYWDqGgLm2MXpq4Ohf53Zr4YljKxkZa1T3k/DhY9vhMNrdgvd9ZHhVakYYw==
X-Received: by 2002:adf:f210:: with SMTP id
 p16mr10803653wro.169.1641563629338;
        Fri, 07 Jan 2022 05:53:49 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 m12sm5581776wrp.49.2022.01.07.05.53.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 05:53:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] allarch: Fix interaction with qemu class
Date: Fri,  7 Jan 2022 13:53:47 +0000
Message-Id: <20220107135348.1505019-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 13:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160258

The qemu class declares functions which are architecture specific. If a user such
as meson is used in an allarch recipe, this leads to sstate which is machine
specific. To fix this, remove the architecture specific part, since there are no
binaries in allarch classes, this change shouldn't break anything.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/allarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 5bd5c44a276..a766a654a9b 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -61,3 +61,5 @@ python () {
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
 
+def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
+    return 'false'
-- 
2.32.0


