Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2912C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 12:22:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.19580.1717502845106512686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 05:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6yuc5R0;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: kiriyatsenko@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4214fe0067fso4698735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717502843; x=1718107643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4/sO3toxSbm/ll1UMU3Q8TxrvzvOzDEYxOsoXcnMNA=;
        b=J6yuc5R0c5ld91hZbj/iMImXIn3h+zdG67RXeaTSEBLWzsUYzivozwWGmE1IC0TxFq
         431m/kEJrN1DmgfMN6dExuEVPM2LCAZWzNBhYmvrrJtxGOtiNJxbDWQVoqhvliHcCjcK
         qG6G4mxODvFdMzbdtMVzR1NdW7nsegg4H1iLnjepFLplPCdkTyyABhlpVHQslz4k0UWg
         mLrfsPltwft+xQpVA9SLQIbo7xcF0has98YIm8s5b0i1srw9dJo3LFxkusZ9lQH5URO3
         YzCFmoao2b7YhFfwgllxRUt+zFtJ3VtnX/EzH5yo/2sm6IPJPTIlUD3eVq+S0mUwljAw
         mdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502843; x=1718107643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4/sO3toxSbm/ll1UMU3Q8TxrvzvOzDEYxOsoXcnMNA=;
        b=ILcZerdgyYoB6EiUpf+UAjMJ/cuxQHVNKD6ZQJph1Hg3/StHdrRQIT5JNRlKQ3CQ6s
         nv8XuNx1sMFhYjl4difBeS+t3n6RCL27qr358XTdwtbspPSoIk/1sy9fQDb6StZJ/f5a
         Vt2f831wWc2Mn6dYnRNLpjhcLJ5/9snWCftG27JBnKxhTf6qDa2IZycduTYzu51XXDPA
         RJpxrNyI7Yt02LWzuRJWNrSEcz18s43h4Ld9yHSLRGjjRdKz9CCViLnXMOPEbG8YS5/o
         vyVKWDe69YHDz2YtGaD0Kfien6nyjRJ6NKJKvXndxCxK992Ae05e5hpVBraJzFjRz94x
         3ErA==
X-Gm-Message-State: AOJu0YxggFz+AqFmqsB0r9ltGn/9Ki5jvy/bRiWsRWz1jacnUyIrB6JI
	0hvrmIKgRu7YqwRsGNXLrxNs0EE0BVbwTTAH1u5DowcZhq5N2xei2ShsX60Bwvc=
X-Google-Smtp-Source: AGHT+IH49/LYrEEFJkFzfBahmC7H2i+KML1ZyEHMSefgblz0Hce2GtMBEPc5WegSnDm5q1mBMBifVA==
X-Received: by 2002:a05:600c:1f90:b0:421:b79:93fd with SMTP id 5b1f17b1804b1-4212e06226fmr86256595e9.21.1717502842881;
        Tue, 04 Jun 2024 05:07:22 -0700 (PDT)
Received: from kirillyatsenko.camlin.tech (077222254150.warszawa.vectranet.pl. [77.222.254.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a4f98sm153564075e9.32.2024.06.04.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:07:22 -0700 (PDT)
From: kiriyatsenko@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kirill Yatsenko <kiriyatsenko@gmail.com>
Subject: [OE-core][PATCH] iptables: fix save/restore symlinks with libnftnl PACKAGECONFIG enabled
Date: Tue,  4 Jun 2024 14:06:49 +0200
Message-Id: <20240604120649.553575-1-kiriyatsenko@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 12:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200331

When the libnftnl PACKAGECONFIG is enabled, the "iptables" symlink is correctly
points to xtables-nft-multi, however the "iptables-save" and
"iptables-restore" are still point to the xtables-legacy-multi.

So, when the "iptables" command is used it's using the nftables backend
where is the "iptables-save/restore" are using the legacy backend.

This is not consistent with other distros (e.g. Ubuntu).

The issue was identified when testing the UFW firewall with nftables backend.

Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
---
 meta/recipes-extended/iptables/iptables_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index a9c88582cd..86f1335ac8 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -73,6 +73,8 @@ do_install:append() {
     # if libnftnl is included, make the iptables symlink point to the nft-based binary by default
     if ${@bb.utils.contains('PACKAGECONFIG', 'libnftnl', 'true', 'false', d)} ; then
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables 
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
+        ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restore
     fi
 }
 
-- 
2.34.1


