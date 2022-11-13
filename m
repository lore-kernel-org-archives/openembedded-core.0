Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E74FC43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 14:13:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2793.1668348776082841181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 06:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dvL0zd3O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id b21so7909820plc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BmChewzeFg4YMFzSDFFOs8FYCi9FMyg/PxFjkhwmS0=;
        b=dvL0zd3OZXD9+uBgpetxyPnhK55dfN5iSS59HZfs/UnryOrP6uyEYm5ulbi/M1Rr0h
         HOuL19ObI43yChMBngo0TiVLau4wlLZLZsjKQwvcmuXxEIWl+eYOI581dA5fk8a/ePZZ
         1xFRT5o3VhUak1jGgQ+xc7hssvmc5Pzo2NOt8VIAO2yv3pxCu/eOLNvRUlPADgsNYQra
         AbqlRgrpe8fMOb/oVwkNXXh4QOqX8nItIh1q9LvgM9av58pIrp5xgqNaHCBlEXgrdcew
         mxuHP123beSgM6m4w7y0vsxtNVEMEPWTj5S+EQ1oCOOUz4N2YlUgGTJ35J+LLqw4UzG3
         irMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BmChewzeFg4YMFzSDFFOs8FYCi9FMyg/PxFjkhwmS0=;
        b=O6ZUauTVxgbysKgf4o8vTb0HLHVWptk0qKVJ8sKc57V58ToWJZV87TQGh+MLPNmDyj
         6hAU7yEza2pNw/sEiN41uqIvSvl5/uojpTHqcBojRREEtxcpVk1xW89Be/DOjxvQAKgZ
         N+rPom/TJPxMbFp5j5qcz2c1ho0d+X6FtlChyA1RXWNW3+/3ngFAzGqU794F2ZDzr2c9
         kFVF9U4TSpI0YR1jAxYdAn5UPaKnrIhLluKfQOy/RoRaWXaulWZQcGKm4a7z8m8OMf8h
         egpRigCPWllVrsCo0e0YxlQMeBD3ntOeiezN26dNNytMA/dJPW/tHrQNWcV11cAUDf/r
         ZlVQ==
X-Gm-Message-State: ANoB5pm2PsgWFKXgTbmnru5v42l0s78dgVn8tcD8SFM3piIN6dOFhXZB
	CdKPPg8Jv039Zg08CHBgwgosBMLcJKOrsvP+
X-Google-Smtp-Source: AA0mqf4yxWo4jvG9AcwX7cqm56thY31I8eQdGS13Fsiw27khiw0zAendvPM6vu7i5AXdD5HbT2CkEg==
X-Received: by 2002:a17:90a:2f25:b0:213:36b7:1b77 with SMTP id s34-20020a17090a2f2500b0021336b71b77mr10066177pjd.94.1668348774630;
        Sun, 13 Nov 2022 06:12:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w34-20020a634762000000b0046b2ebb0a52sm4198771pgk.17.2022.11.13.06.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 06:12:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Sun, 13 Nov 2022 04:12:38 -1000
Message-Id: <cover.1668348622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 14:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173194

Please review this set of patchesd for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4468

The following changes since commit 0c0723757fbba9a4b88c0f98477a18d1e220da2e:

  mirrors.bbclass: use shallow tarball for binutils-native (2022-11-06 06:00:05 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  lttng-modules: upgrade 2.13.4 -> 2.13.5
  quilt: backport a patch to address grep 3.8 failures

Hitendra Prajapati (1):
  QEMU: CVE-2022-3165 VNC: integer underflow in vnc_client_cut_text_ext
    leads to CPU exhaustion

Michael Opdenacker (1):
  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED

Narpat Mali (1):
  python3-mako: backport fix for CVE-2022-40023

Ross Burton (3):
  pixman: backport fix for CVE-2022-44638
  sanity: check for GNU tar specifically
  qemu: add io_uring PACKAGECONFIG

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes/create-spdx.bbclass              |   2 -
 meta/classes/sanity.bbclass                   |   8 +
 .../python/python3-mako/CVE-2022-40023.patch  | 119 +++++++++++++++
 .../python/python3-mako_1.1.6.bb              |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 .../qemu/qemu/CVE-2022-3165.patch             |  61 ++++++++
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ++++++++++++++++++
 .../xorg-lib/pixman/CVE-2022-44638.patch      |  33 ++++
 .../xorg-lib/pixman_0.40.0.bb                 |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 ---------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 -------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 -------
 ...ags-parameter-from-aops-write_begin-.patch |  76 ---------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ---------------
 ...ules_2.13.4.bb => lttng-modules_2.13.5.bb} |   7 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 17 files changed, 373 insertions(+), 437 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.5.bb} (78%)

-- 
2.25.1


