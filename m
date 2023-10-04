Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ED4E936E1
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 20:26:10 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.5367.1696451162531404555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 13:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZV3HOxLW;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3512fae02ecso917355ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696451161; x=1697055961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q2+4PwSdE5lPEpgIHZUoyU+j3soyGYVCQmNvlaZcTs=;
        b=ZV3HOxLWdEddyQJm6YlVFZe7fcb1Jpxa7K/ZtIlngBsB9AxUgPbGVC6zB1To3C/jby
         1GSFf3ZI0V5+NZH4L5dkZiD9g78s16O9hu7K/6FnlTSmHvwSiw+2EFPpAoN384ithiKi
         JTLUHDW6iv7sdHfKCdJdg7NihkceAsMB2lSREmGYS+FpTtCVUJVOuoMf+fvRMhLX6xAd
         1PeIGKLCL/9bFDuaty9uuXTw3OYKvzRs4E6Ordh9u82DJaF8LOfIbzemAXLoh9VNnhgX
         IWsPdHtHS4EPoT4KjCcgzlyEoj2WMAwlwp4RFAdkY7NsmVERDeGoj2u2c6FNrU44Dlsu
         uYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696451161; x=1697055961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q2+4PwSdE5lPEpgIHZUoyU+j3soyGYVCQmNvlaZcTs=;
        b=jOp/cfl8mVob1Pf1MWKuatbjvZOOL1wOn+bqVuioxiv5sK7VRZ95dn6lQzvufqYpWc
         72u3H1gyfIZoK5eKbnHsj9roWKFD90DCh/3bIr9BqVKp6sVK4+JUBK1O2Az0HkkrjwXz
         XBtedoRm5tSgfmxW/JahBIDSMCovJ2opXZ78vXDsgZ/cCfOx0lb4Gy2t+VCNnPd5JNNq
         cRbG4quTiYmWSh4lMnffbxoVpk0jvchJ766/LIJCB9AnQQmOa5TvumQiLPwnqhVvHZE4
         OA0HGM8+YER+Lb/OFEbptQZ5xEhoHejUAlUG6lhpS8++JA6eum+kVodm9gfUDsvp4Vqw
         /IEA==
X-Gm-Message-State: AOJu0YzfJhto+LpnX218TJcj1RKtaMJS02RjHXSAnpcg50dJFjHl3OSs
	45l5Hrd45IiMqPndvTiTAgzJ1mFSKgIgsA==
X-Google-Smtp-Source: AGHT+IFPt1LxCV6aohMrE+AEgmJ9yB8iTT/86g0fIu8lm/Y8bc9TyXO0eAiJC8+QPiuhRd/UUACaqw==
X-Received: by 2002:a05:6e02:20c4:b0:34f:234d:4b5a with SMTP id 4-20020a056e0220c400b0034f234d4b5amr3919505ilq.29.1696451161492;
        Wed, 04 Oct 2023 13:26:01 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id w10-20020a92c88a000000b00350b7a9f0c1sm140942ilo.62.2023.10.04.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 13:26:01 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] libtirpc: conditionally enable gssapi
Date: Wed,  4 Oct 2023 14:25:58 -0600
Message-ID: <20231004202558.581182-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 20:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188699

From: Daniel McGregor <daniel.mcgregor@vecima.com>

This is for upcoming work to support gssapi in nfs-utils for nfsv4
and kerberos mountpoints.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
index d4669054268..b27c302460a 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -18,7 +18,8 @@ CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--disable-gssapi"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gssapi] = "--enable-gssapi,--disable-gssapi,krb5"
 
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
-- 
2.41.0


