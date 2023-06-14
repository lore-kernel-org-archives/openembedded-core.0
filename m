Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CCAC3DA42
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7490.1686734987257515265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IzbNz9Dx;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-519c0ad1223so171778a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=313iTdJUz4gGq/oOseP8oJ9jJwPnzKvXn7aNrOBWKME=;
        b=IzbNz9Dx1TWcWReCnLeqqUOG2skF5OU+bXVk/lxOwXUye1tkhhS20CoLJWuvovXxo/
         gFhM0MeuTaoX+NrNyJKl377EVmv+yEQwjBEZU3n8Q1/Y+A7I8h5dvQCsAHudIT2mD3Zu
         O+JQXWuRHJGq1r7WeNCzKbohcd2rkSyaoYCmeca66b9pQvFsj9HRHu/Nm+miMEjvNEmb
         uGh40KDw4I7ugdx5UUM1XinhrxTaDt8CZQrkczP5p2Xdlad+Kl6iSNCqm8Wype0GH6gx
         ARGEbQiAUcJgsoNhTanUMvZm2lnmDFm9ELyuQaVDp+68FQMWFawrmWky5uHljmE0ZxS8
         la+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734986; x=1689326986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=313iTdJUz4gGq/oOseP8oJ9jJwPnzKvXn7aNrOBWKME=;
        b=Qlno+edd0INt3CMgxZ83D3deE6J7Gh0UmQTgfHkc1A+ery9ECP+3MKFM5JiEQN43cO
         hJPNwOIuN0XKSlirGKlgr5Atnkjygs/TyvzbybXbKD90DdQDvWNRpA7tmZdOTGSmn4Pv
         iQ7xgi7EAOhkbWQTBNsSpcM7qUJgyii3cSIokqStotTxInCPBK5pDgsw4s0y5CLentzd
         geEYlt4EQspmFrBJWaDnGXSv0/HLNG7/2DuejtMRAeHEwUPYw+3MMuVrZjfm15BDmSQp
         a2/dyo0ZUDVlZGdHwFbee3Tzlae7wuG+bLBjYt/zHigq3DIMDdVVNAH5X1DnA9K37NJK
         fTqg==
X-Gm-Message-State: AC+VfDxqNksokimx/Qq3pQsGaMlPfcRbhH2LAJcqQncBOpJG2GxsBWW0
	3c+Ar02PAT1g0RJY6irCeur4xaFMVnk=
X-Google-Smtp-Source: ACHHUZ7y6QHqeBP1spb1RDX5zJJzN+0yAzRA0TYeaV34Sf4Ni+kNLITcoFeBUGbuqHTP6Z1UmxLCPQ==
X-Received: by 2002:a17:906:7954:b0:959:18b2:454a with SMTP id l20-20020a170906795400b0095918b2454amr15515529ejo.76.1686734985733;
        Wed, 14 Jun 2023 02:29:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/55] nettle: upgrade 3.8.1 -> 3.9
Date: Wed, 14 Jun 2023 11:28:56 +0200
Message-Id: <20230614092918.4065570-33-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182778

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/nettle/{nettle_3.8.1.bb => nettle_3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.8.1.bb => nettle_3.9.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.8.1.bb b/meta/recipes-support/nettle/nettle_3.9.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.8.1.bb
rename to meta/recipes-support/nettle/nettle_3.9.bb
index 92cc966dbba..7a5bdb2a038 100644
--- a/meta/recipes-support/nettle/nettle_3.8.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f894a23d12dd41cbfe"
+SRC_URI[sha256sum] = "0ee7adf5a7201610bb7fe0acbb7c9b3be83be44904dd35ebbcd965cd896bfeaa"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


