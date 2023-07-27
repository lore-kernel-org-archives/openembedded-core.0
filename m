Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B75BC00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.16760.1690487061263417320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=dbRsVLib;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso10913905ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487060; x=1691091860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YY0u9/gZFne/ydJtjVWTndS0V83J2YjtjJOe/GOYjc=;
        b=dbRsVLibep5FesUcDLUs64O4kMsLWEKLXkCvzzFA/sgC9pSg6Hn1IW3kKwcGbROtNI
         w7jfVzQQUyycVpucIdCP8ICvK0Eku4xcnIl0SpUiIM14TfhhhAKBqppflV1IFSaaY7G9
         tdvsbla2D8igAILl+bg7Q7gj0uklgVnNCJKWipkMuwDyPw9yam4E3f1VSUdTS2i77gUh
         4y1QIZsg/R4x+RqOfkgmXUTE9mU+GUTEh/plTEWnJa2Ehv13z7dMiV3+mNu56MIClJ+l
         aQ2J+dJkudmvqnDCp5TgxfBgd713zcGV+M+zXcDi7OKyLtD+0W5GUgmA6y08rtBhMA4D
         7Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487060; x=1691091860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YY0u9/gZFne/ydJtjVWTndS0V83J2YjtjJOe/GOYjc=;
        b=WVvMxZDXHywpnOsyvLvRGVjRxWLbgB9BPtZc6x0WOWeEcijca44Y5CVS2lzXS8gVwz
         nWpuPgR/Ar70IpfzCZgEc/OquKkG1vHODaK6lmspL2H3rW82cjAxStngC3sU4aT6VakC
         3+kAMBPXk51cty2i1JYvFKRwwcLOyIfCTiVjpok9/g3tmzjAITflxNe+FGdzSTyUYrf5
         StvrdrEoXh05PXyE7EoL6+4UdzPwGretVOVonPMTkcQtoCNK5QU6WfsR0QOHMJ7nvMpX
         hclWBDrrSATV9NsICxliJyGUZr4OJXS+60Wzu4kVxnIagQnkaCnu8dO/s7FATAj6O8zr
         iNsw==
X-Gm-Message-State: ABy/qLYYvzW4873PjKexDQ/RkoYF5+ovf9ucV8iAO7gl6HW9fiFtRr2M
	BN45y3UV9Cr1gL0oBYFEEfj9whyDRViNN/KUUT4=
X-Google-Smtp-Source: APBJJlHBk3tdL7gOGVoE58ewhot/EBNXJnzsR6uhdBTyYeIpQxzpbok3S3aiaYm9s1An5uLVZk3Psw==
X-Received: by 2002:a17:902:e803:b0:1b5:2fdf:5bd8 with SMTP id u3-20020a170902e80300b001b52fdf5bd8mr365257plg.8.1690487060401;
        Thu, 27 Jul 2023 12:44:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/27] mdadm: fix util-linux ptest dependency
Date: Thu, 27 Jul 2023 09:43:32 -1000
Message-Id: <45bf9f5c18a1dec0d3c1a134285e71660dd9d890.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184989

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Trying to run mdadm-ptest in a core-image-minimal build will result in:
root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
BEGIN: /usr/lib/mdadm/ptest
which: no lsblk in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
lsblk command not found!
DURATION: 0
END: /usr/lib/mdadm/ptest
2023-06-28T10:14
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Remove util-linux from RRECOMMENDS and only add util-linux-lsblk and
util-linux-losetup to RDEPENDS.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3004f7589974c135cc82630d980ea281b97ecd83)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 14de9d88c2..bcc0175f67 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,10 +101,9 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    util-linux \
     kernel-module-loop \
     kernel-module-linear \
     kernel-module-raid0 \
-- 
2.34.1


