Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BD6C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:03:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.21593.1635617018561336893
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LFi6Z42h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id v127so10460336wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6yR5hpA2pNNht/b5Yz/IlD1F8tIylkhdKsrZe5uRwY=;
        b=LFi6Z42hHQZP+cJapHnx9RxEI+8LX/jnAPoo+MlbtM1qC85bZkbBreBso46sKqt/ep
         EPOwCQvBYwYCVDRXlM2HkdWvQwhjo6Fl8swOgVaplNG01VFv8xwj07RuUAovWgcZgBCK
         PSn4Hi+rkLJ3cs0KiDr42dz+5KnKsmY5zTUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6yR5hpA2pNNht/b5Yz/IlD1F8tIylkhdKsrZe5uRwY=;
        b=oD/udpzNBa3h8AlJDxBRhDfj9O1rtHU5XTegZ6GqSdtiRhWxFVrLkv0jzhGxgxNUOd
         Go7+PSDAHwrbtEqKrxJc/PqpR5mTlOMbZXN88Fec45IcrQDbx58WR4arITJ+SwZ3OyUL
         BZi4pwSAhcfyLqMCx620eFYli1OBkCPgWKuchuecwEu23ujgSL+yBzR+EXpKiIoxZm0d
         qWVA/i15iHM819XV5MlLfekgpHG5pATu5AIKN4+ZKQZrGoLPKB5lefqYEJuu0X5/3C8K
         ngtNNDKNwd6nnm0oGUa0kt4dkRWpcncSE96Gtf9FgTtmGl47hGBIb8od7wt5VPqgwe7W
         1iaw==
X-Gm-Message-State: AOAM5332NKlV7Ufqzj+6icdgHbkCsr90plqb86QwtpF66m3dEmP/EeeY
	iLe0fyoyF7dbflPZLOtrqnrw+49P2pPAdQ==
X-Google-Smtp-Source: 
 ABdhPJzJZjeIuZuyzC4Rbscz6VVaMKwaYvrmLUJQ9tsAcxHbR0ZEUy/l6JM2jJXtY7mtB8OYgXfftw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr27823285wmq.24.1635617016820;
        Sat, 30 Oct 2021 11:03:36 -0700 (PDT)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id
 n8sm7974814wrp.95.2021.10.30.11.03.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:03:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Add fnctl64 wrapper
Date: Sat, 30 Oct 2021 19:03:34 +0100
Message-Id: <20211030180334.3458919-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 18:03:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157647

Add fcntl64 wrapper which hopefully fixes issues seen in findutils and the find
command in the libtool removal code when built with LFS compile flags on Gentoo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7acb1d64d59..f9e3b469104 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0cda3ba5f94aed8d50652a99ee9c502975aa2926"
+SRCREV = "d34f2f6cedccf8488730001bcbde6bb7499f8814"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.32.0


