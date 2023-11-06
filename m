Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD772C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:04:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.64704.1699301068173289744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 12:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mj4vXllc;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6b5e6301a19so4964412b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699301067; x=1699905867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5v/y2BHi0v4u3VrmMj3sg/pcwSb8smWRQ7VbBKOduI=;
        b=Mj4vXllctgCta9jjJSqDErG/yup6uMPubIj/Lep4vhKDiOH9yyzmQfcu+HAkgEkgaH
         ir7bCaSjjVdvWq2SVLAmAhRUp9xK567BL6c2vGF+oTviyFh7GBdtJnjb+gWkRgumkras
         wZpbL6Uy/0kBF/VTxCi8vcuGDNHqv8BMBRBRMMl4ixgA33WPhKmKrYlpL+4CMoe2KynO
         75d6xcF01bxTJkDIW9UGak5qFwFqXoDSM9qUOuZcI8kwRYZJA8vR4mC8LAcQPJ2xdjOM
         e4pM8I5PrKWFQHioElwdUEY71F0Cg8+ukWwMvFjZnu7/p7z40+cjFoCYLG/5hunAi5J9
         FhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699301067; x=1699905867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5v/y2BHi0v4u3VrmMj3sg/pcwSb8smWRQ7VbBKOduI=;
        b=UWd50wVYrjtTPX8zuIghJZPMH4QXTuInvFEwNZBJkvcwdNbvBGF8IMqMlezJ1GU1R4
         pXYghOm+mmhbuaFL/urj3HPGSluvGCDL0wcn3VLg22rYEbLSWBTu9XVLbJrFKfpX6vb+
         gBPm8d/myua7SJNBApmYX6OriuoHeyjL6Of50ZeMxqKR90xFvdUYj42tUmFSvRn+vxvn
         qhi1AlUxTd9pGCP2VcHrnTj6VI3DMau0ub4LIh5/R7qE3ui+a+LqkU9yOGQ1458+6MG2
         fG6LMl/u4bpLnfTTV7INBKIOj9yqQMQFnNl78hK16vhjug+6p3gmOHezMiA/XQb/J2dt
         qpVQ==
X-Gm-Message-State: AOJu0Yz1BSL3zK+uXh6dVPCyE7L/VyHmqP8oIgkQCxJH81FgS72Nz2Nu
	svAb6goY5HuIuzGCKfJgYmmXVkUh00lX7g==
X-Google-Smtp-Source: AGHT+IGdcr0I56jiFVNpjUBHgOIRyM7C+7WkBf0tbDencXhDkTGiuXa7cAheqXZDEUFEIZKaFWoYGA==
X-Received: by 2002:a05:6a20:861d:b0:15d:5f9a:3921 with SMTP id l29-20020a056a20861d00b0015d5f9a3921mr20902544pze.27.1699301067127;
        Mon, 06 Nov 2023 12:04:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b006bd8f4e398csm5958874pfn.135.2023.11.06.12.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 12:04:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Florian Wickert <fw@ferncast.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3] systemd: Make libnss-mymachines conditional upon packageconfig
Date: Mon,  6 Nov 2023 12:04:24 -0800
Message-ID: <20231106200424.1019839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 20:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190246

nss-mymachines packageconfig controls this features therefore add this
dependency only when it is enabled.

Fixes
    ERROR: systemd-1_254.4-r0 do_package_qa: QA Issue: systemd-container rdepends on libnss-mymachines, but it isn't a build dependency? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Florian Wickert <fw@ferncast.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
v2: Add missing $ ( typo )
v3: Drop another spurious $ as the beginning of line

 meta/recipes-core/systemd/systemd_254.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 8a8ff545995..80ef4187269 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -542,7 +542,7 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
-RDEPENDS:${PN}-container = "libnss-mymachines"
+RDEPENDS:${PN}-container = "${@bb.utils.contains('PACKAGECONFIG', 'nss-mymachines', 'libnss-mymachines', '', d)}"
 
 # "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
 RRECOMMENDS:${PN}-container += "\
-- 
2.42.1


