Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EA3C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.9104.1645178778120482999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyU9czMd;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id f3so13490458wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WQS331UuDg1roledQ/KnNSFENAzSnuoG22Gw+MLENFg=;
        b=QyU9czMdSDfxGRj5IPtBnSR4UEJomsoesTxvV+Fy9VcfI6j2D+49NLBGy0VbPOjdzk
         bHHMRPkO3BvrFYbEttDoFhfQ9qYLm6ZM+3tXUPq9qW6mSRfIDwPnQZLGPV3evQYXjKVB
         XgZ3c/t0i46twhQ7+fQDNh8/9QvLmUcFJzlY37eMwuOGM6dc7xg0zK7QxsB0jEWJZZdO
         r9tKLKTjRzxis3oi50cuRpKjsv+SlI3wpQN8LreFrsFtjagKwohrW5WxDbgFGNdxtKg6
         Z3QAhocRYWpQyfE2SgGTW63qacggzE3inZdntPKV/OwGEU7db7j/dEcps3a/is0BCwcS
         QDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WQS331UuDg1roledQ/KnNSFENAzSnuoG22Gw+MLENFg=;
        b=lfxhFvIdH4IHMKzS2cUeMudgRnWkARjCG5wgrzt7yNstSQooA9RhpqoNSlvECAJ9pB
         GDc55pR+FdktNzK/HUlCqvfH0DnZi3iOcTrmo+UDLf4eUVgwadnEocG/Z+U3WIRGz9Hs
         naDsfaoCysvd4oqfxrqjw9zs4KUn6nH04KfqNPXVH9o8hj9TSF4rlypRyfWYkqt7gA3n
         Yep6/58oKAvQ9hN2NA1ZvjDbaaWCs2azVP6VFXQeDXt+csPUXvHdbK8t+SyEX0gB/04t
         XjLUn+yQSmgTXWHjqi2qHCC0ITyt8+hZXVTLNBAmb/cCtc/+yva6WGAKd8fb4OyzNOMZ
         XI/w==
X-Gm-Message-State: AOAM533RCXfXdEZArpFSHsdpYR6yI7lXVmqOI2UOb043t/rQdEn8mWPx
	BfaUsNXiuiYGe/t5sWdGOfs=
X-Google-Smtp-Source: 
 ABdhPJwUG31ecbLDLdN3KTNWLJIrdPJBlHYyAZ/YxeDRJhQawv5yBdKs9g4UingLDHW7oF9IA+PVNg==
X-Received: by 2002:a5d:522a:0:b0:1e3:36c0:6e76 with SMTP id
 i10-20020a5d522a000000b001e336c06e76mr5639817wra.11.1645178776555;
        Fri, 18 Feb 2022 02:06:16 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:16 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com,
	Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH 00/46][dunfell] grub 2.04 security fixes
Date: Fri, 18 Feb 2022 11:05:08 +0100
Message-Id: <20220218100554.1315511-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161888

This series fixes a number of issues in grub 2.04. It is a part of a security
series [1], except of the patch 5. The patch 5 is a dependency of patch 6,
but also a bugfix on its own.

While none of them has an official CVE, they fix a number of NULL pointer
dereferences, memory leaks and similar issues, so seem worth having.

Patches included here are also in Debian's backports [2].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
[2] https://salsa.debian.org/grub-team/grub/-/tree/debian/2.04-20/debian/patches/2021-02-security

Marta Rybczynska (46):
  grub: fix a memory leak
  grub: add a fix for a possible NULL dereference
  grub: fix a dangling memory pointer
  grub: fix wrong handling of argc == 0
  grub: add a fix for malformed device path handling
  grub: fix memory leak at error in grub_efi_get_filename()
  grub: add a fix for a possible NULL pointer dereference
  grub: add a fix for unused variable in gnulib
  grub: fix an unitialized token in gnulib
  grub: add a fix a NULL pointer dereference in gnulib
  grub: add a fix for NULL pointer dereference
  grub: fix an unitialized re_token in gnulib
  grub: add a fix for unnecessary assignements
  grub: add structure initialization in zstd
  grub: add a missing NULL check
  grub: fix a memory leak
  grub: fix a memory leak
  grub: fix a memory leak
  grub: fix an integer overflow
  grub: add a fix for a length check
  grub: add a fix for a possible negative shift
  grub: add a fix for a memory leak
  grub: add a fix for possible integer overflows
  grub: fix an error check
  grub: add a fix for a memory leak
  grub: add a fix for a possible unintended sign extension
  grub: add a fix for a possible NULL dereference
  grub: add a fix for a memory leak
  grub: add a fix for a memory leak
  grub: fix a memory leak
  grub: remove unneeded return value
  grub: fix an integer overflow
  grub: fix multiple integer overflows
  grub: fix a possible integer overflow
  grub: test for malformed jpeg files
  grub: remove dead code
  grub: fix checking for NULL
  grub: add a fix for a memory leak
  grub: avoid a memory leak
  grub: add a check for a NULL pointer
  grub: add a fix for NULL pointer dereference
  grub: add a fix for an incorrect cast
  grub: fix incorrect use of a negative value
  grub: add a fix for a NULL pointer dereference
  grub: avoid a NULL pointer dereference
  grub: add a fix for a crash in scripts

 ...leak-when-iterating-over-mapped-memo.patch |  39 +++
 ...ible-dereference-to-of-a-NULL-pointe.patch |  39 +++
 ...net-tftp-Fix-dangling-memory-pointer.patch |  33 +++
 ...n-parser-Fix-resource-leak-if-argc-0.patch |  50 ++++
 ...formed-device-path-arithmetic-errors.patch | 235 ++++++++++++++++++
 ...-kern-efi-Fix-memory-leak-on-failure.patch |  30 +++
 ...ix-possible-NULL-pointer-dereference.patch |  65 +++++
 ...ulib-regexec-Resolve-unused-variable.patch |  59 +++++
 ...mp-Fix-uninitialized-token-structure.patch |  53 ++++
 ...-Fix-dereference-of-a-possibly-NULL-.patch |  52 ++++
 ...egexec-Fix-possible-null-dereference.patch |  53 ++++
 ...b-regcomp-Fix-uninitialized-re_token.patch |  55 ++++
 ...e-unnecessary-self-assignment-errors.patch |  41 +++
 ...std-Initialize-seq_t-structure-fully.patch |  34 +++
 ...heck-for-NULL-before-dereferencing-i.patch |  43 ++++
 ...re-comp-data-is-freed-before-exiting.patch | 128 ++++++++++
 ...-If-failed-then-free-vg-variable-too.patch |  28 +++
 ...ory-leak-on-uninserted-lv-references.patch |  50 ++++
 ...odisk-Fix-potential-integer-overflow.patch |  50 ++++
 ...that-the-volume-name-length-is-valid.patch |  43 ++++
 ...ix-possible-negative-shift-operation.patch |  42 ++++
 ...source-leaks-while-constructing-path.patch | 121 +++++++++
 ...3-zfs-Fix-possible-integer-overflows.patch |  56 +++++
 ...-a-check-for-error-allocating-memory.patch |  35 +++
 .../files/0025-affs-Fix-memory-leaks.patch    |  82 ++++++
 ...x-possible-unintended-sign-extension.patch |  36 +++
 ...pt-mpi-Fix-possible-NULL-dereference.patch |  33 +++
 ...slinux-Fix-memory-leak-while-parsing.patch |  43 ++++
 ...n-Fix-leaking-of-memory-when-process.patch |  52 ++++
 ...0-commands-hashsum-Fix-a-memory-leak.patch |  56 +++++
 ...move-unnecessary-return-value-of-gru.patch |  94 +++++++
 ...bfill-Fix-potential-integer-overflow.patch |  78 ++++++
 ...eo_fb-Fix-multiple-integer-overflows.patch | 104 ++++++++
 ...deo_fb-Fix-possible-integer-overflow.patch |  39 +++
 ...eg-Test-for-an-invalid-next-marker-r.patch |  38 +++
 ...-Remove-code-that-coverity-is-flaggi.patch |  34 +++
 ...ader-bsd-Check-for-NULL-arg-up-front.patch |  47 ++++
 .../0038-loader-xnu-Fix-memory-leak.patch     |  38 +++
 ...driverkey-data-when-an-error-is-dete.patch |  77 ++++++
 ...k-if-pointer-is-NULL-before-using-it.patch |  42 ++++
 ...nstall-Fix-NULL-pointer-dereferences.patch |  41 +++
 ...v-Fix-incorrect-casting-of-a-signed-.patch |  46 ++++
 ...x-incorrect-use-of-a-possibly-negati.patch |  50 ++++
 ...ix-NULL-dereference-in-grub_script_e.patch |  28 +++
 ...ire-device_name-is-not-NULL-before-p.patch |  33 +++
 ...void-crash-when-using-outside-a-func.patch |  37 +++
 meta/recipes-bsp/grub/grub2.inc               |  48 +++-
 47 files changed, 2609 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
 create mode 100644 meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch
 create mode 100644 meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch
 create mode 100644 meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
 create mode 100644 meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
 create mode 100644 meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch
 create mode 100644 meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
 create mode 100644 meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch
 create mode 100644 meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
 create mode 100644 meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
 create mode 100644 meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
 create mode 100644 meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch
 create mode 100644 meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
 create mode 100644 meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
 create mode 100644 meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch
 create mode 100644 meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch
 create mode 100644 meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch
 create mode 100644 meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
 create mode 100644 meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch
 create mode 100644 meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
 create mode 100644 meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
 create mode 100644 meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch
 create mode 100644 meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch
 create mode 100644 meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
 create mode 100644 meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch
 create mode 100644 meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
 create mode 100644 meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
 create mode 100644 meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
 create mode 100644 meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch
 create mode 100644 meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
 create mode 100644 meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
 create mode 100644 meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
 create mode 100644 meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
 create mode 100644 meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
 create mode 100644 meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
 create mode 100644 meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch
 create mode 100644 meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch

-- 
2.33.0


