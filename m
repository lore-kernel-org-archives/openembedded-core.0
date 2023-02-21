Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E318C64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:09 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.53782.1677012305021455032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dasc9jSD;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id m11so989280iov.8
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Xz9AsDeK9dWV1GMeCiI7MEuqw4oDsJQ+UwJiOFiIU=;
        b=Dasc9jSDIQ7mqCwEn0Bu4CvgQUF2uN3D08mmiK5eNuTnCUmoc2QM/aFYG3OVFePsmz
         hhT1VWfTEd/NjU0ahYqVY7mKqxOy20sgQDteeSeJ0ajfQLqhoBfogb9KGRL/bTDOLwq4
         ZVNKkDZz6v4AydxeHl7IKqBQtvElpNEnZucD88n+nQMwsjuhGND59Y++I0dUvOmeBRJg
         YgKJNOcJM7npFUB51x0QhxQylUsCsHQH+Ta5RvNq5Cln4DSz68O38HC0jHmh5tbJEXeN
         OyDapOy1gyHCFS1T+/EnU2MTdzIJMnIdkFiy9/RhPNkBnY6SNE/3S3ktonyDnaXk1LrR
         10zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1Xz9AsDeK9dWV1GMeCiI7MEuqw4oDsJQ+UwJiOFiIU=;
        b=fYHYAS6AySep/I0hT3d0UBHKZBDzZZes0tFj1WVjhdXAXyAAksXaHwDwB3CKh1+TU+
         eE/5hjCDX4qCPdOWL0Akn70EheeM9wiSR7JfNIKkke7iX16X5WgpGP6oKrMvcwPB6vAv
         ExijUmIJIDWzOtJqP5+6iAzT0e9JpCQwbsh4czKLVG9ARCuZuSJPz0BWO2t6v14T/MN7
         89Inq62REituqQ4tctoACKBPQ8t/EbA/f1P3pVwUqiDG1sKSWdJtehyvWjCnhg9zDIsi
         yA9vplDi7ukSHVEjvMNGjgezIIzSQkoT1c4pdU1awy31BTbswMTNu9wyhm6MYykY/Iec
         gFKA==
X-Gm-Message-State: AO0yUKWL6R1QnEedxl6twpZPAbffd+pQ64hwo2UZnquUXZwDQkFUdrd2
	U68tis9fxE5CW+luNHhj003Y6RdMTTg=
X-Google-Smtp-Source: AK7set/70JCdUGFk58vGm39yua2G6aiaCt3QF4wFP6rPGeIixCFYyV4LrigVshzOFWlPN/Kp99GRRA==
X-Received: by 2002:a5d:9389:0:b0:73d:eb4b:345e with SMTP id c9-20020a5d9389000000b0073deb4b345emr11052584iol.6.1677012304018;
        Tue, 21 Feb 2023 12:45:04 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:03 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] build-appliance-image revival
Date: Tue, 21 Feb 2023 15:44:34 -0500
Message-Id: <20230221204445.23931-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177538

Revive the build-appliance.

The build-appliance-image produces an image that contains all the necessary
pieces in order to perform a bitbake build. This patch series contains a
number of small tweaks that were needed in order for the build of the
appliance to succeed, and then for a build within the appliance to succeed as
well.

Trevor Woerner (11):
  packagegroup-self-hosted: alphabetize
  packagegroup-self-hosted: add zstd
  build-appliance-image: add support for qemu
  build-appliance-image: set TERM
  build-appliance-image kernel: linux-yocto: qemuall: add taskstats
  build-appliance-image: fix HOMEPAGE
  build-appliance-image: add /lib64 symlink
  build-appliance-image: use a real /tmp
  build-appliance-image: QB_MEM: allow user config
  QB_SMP: allow user modification
  build-appliance-image: check for xattr feature

 meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
 .../conf/machine/include/x86/qemuboot-x86.inc |  2 +-
 meta/conf/machine/qemuarm.conf                |  2 +-
 meta/conf/machine/qemuarm64.conf              |  2 +-
 meta/conf/machine/qemuppc64.conf              |  2 +-
 .../images/build-appliance-image_15.0.0.bb    | 27 ++++++++++++++-----
 .../packagegroups/packagegroup-self-hosted.bb | 11 ++++----
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 8 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.36.0.rc2.17.g4027e30c53


