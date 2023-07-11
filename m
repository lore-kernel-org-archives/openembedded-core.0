Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B920C001B0
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 18:25:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.3705.1689099943207860709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 11:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iwSPSCEz;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so3849777a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099942; x=1691691942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3FJ6bg1a9g/6Bh2JNYmy7m8heXQVtmJDkd6zIGUb/I=;
        b=iwSPSCEz6tqShywELHxymkYfYSe13R+w/iZc0jSwybe0rRME6Io1BuJt9zO6NtrqYj
         2G/IrMzqDyut4DUClznVWR/B08rEZ2FPnZIaKTb0Q/FBoJjxKRUlV3STiNFZ/tb/QqIV
         WMaJG7rnK/jyoVTxLPCWTdXpW+D1dQUzZCIOquenF1e630zepuAUU51SEQ/JSrqPZBpZ
         VPGzPqWrdkE8Jn0jdg0Wicx2TmTiEEto5Ym5ljDqEH+yQpiLwBNOGZqQk0LM6TaPUFnG
         zq/z6TSktcmto4kkjd5Si3NQ8YHNbt6W16TwaKSe2vVDAgrfKe/VuWPdf0SGcjMPJMi8
         +C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099942; x=1691691942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3FJ6bg1a9g/6Bh2JNYmy7m8heXQVtmJDkd6zIGUb/I=;
        b=AU64XbEZcFbMCAFiolIt8xMHsSAUuuECmt6Pu+4kLTvoByZ/pCperoTDpzg3Qlo3m8
         8InsZ1sn3T4lqbvVbILXdULRu869FqKFaoJKpQXSUksLdX2UmpsUhpWHkEta/1yd+01e
         LI/NJeLitWIFkPuK7mDbk9xLFqcz+Hq3N4TOL+iPhZoTvSu34aFXEF9YGmjjUm7UFTvg
         SFBFfiwNBb5AKor0hoUhsxY+ZtIXfAA4chttMgVL9haFpoVCIKBrYLUdRtsrxWG7QrUd
         ryTZEMVMayr+yzP3PjNyrZjpQaIwrVVUIfqto+pgaW/mXGXJWxIl8UvIz7ICSA/CM/rW
         4kBQ==
X-Gm-Message-State: ABy/qLbjwGaQlxivEjX/wMZdklphGlsnfVi+pnzN2kGGJhVTeZJV2gQc
	jPB3t52Oagv8vIXE4UTZey7+6vzfoFE=
X-Google-Smtp-Source: APBJJlGuViHKlijKLP2h0HM+GUBApJ5q+M/7STTEZm5iIfYO/IpXARSwpeXGL2fKmjGbBnvjxWh6Bw==
X-Received: by 2002:a05:6a20:7d9d:b0:127:72c3:6428 with SMTP id v29-20020a056a207d9d00b0012772c36428mr23132563pzj.18.1689099942192;
        Tue, 11 Jul 2023 11:25:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::dd1d])
        by smtp.gmail.com with ESMTPSA id n20-20020aa78a54000000b0067f2413bf6dsm2025811pfa.106.2023.07.11.11.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:25:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Add a packageconfig to enable SVE
Date: Tue, 11 Jul 2023 11:25:39 -0700
Message-ID: <20230711182539.1234935-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 18:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184151

This is an ABI change which should be controlled at distro level
based upon hardware capability. future versions of glibc have
added checks for this which will fail if toolchain is configured
to not have sve but its not disabled explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.37.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 3387441cad9..ea7d62abbed 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -87,6 +87,7 @@ EXTRA_OECONF:append:x86-64 = " --enable-cet"
 PACKAGECONFIG ??= "nscd memory-tagging"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
+PACKAGECONFIG[sve] = "--enable-mathvec,--disable-mathvec"
 
 do_patch:append() {
     bb.build.exec_func('do_fix_readlib_c', d)
-- 
2.41.0


