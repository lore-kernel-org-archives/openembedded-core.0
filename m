Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2759C4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 23:03:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3214.1784415798985995638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 16:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=udIHamG0;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7121355e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 16:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784415797; x=1785020597; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z40g2y/h79on2xeR14uDu9wM8AGlqFQwuI369MN9SEQ=;
        b=udIHamG0yzNAb7FZtAvN0yp89L/T7vu3vzVBzXNH+OclSd/O8ydyuNiCyO2ANLE6VB
         v9HEBUb8SLlzuOE+NbWVJlKwFrGeqFoTsnqGdgjU3lxA2D3JgOaHGmj5CVpnRf21mwLL
         wQo8iE5tMvTynIceZnsJLVxPWCovbeBSr+Svs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784415797; x=1785020597;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z40g2y/h79on2xeR14uDu9wM8AGlqFQwuI369MN9SEQ=;
        b=cAobQiZmknpxQXytfRwDj1SGtL4mBjpgCArMT4gUhDfrqEq+qP41dl2nQpXhggOTAL
         kvDs/Id3OjxTITJnIUDDtu0kah4WNkxwsidSFfnslyKZTmjyT9qRYCZ6HpKbBC3Hv3TF
         HPeNWNKgI2m2z3qiDOFLn4JeTAYj0hZ/QiYkSIx2+MYZlmBHpl+dxpom17No7cUyYhxw
         Q+yy7Czflv9C/WywayjJ9K66oVMvg/24Un6AelN26dfx/cpwAoR5An1HpNwbtuKxHyyK
         VBQC4vn586QtDEGUa3Fb+BsPHWPXoBpnjgWK/dWxMzx9b9EhMMepPvbL/46MehHHiN9X
         jUaA==
X-Gm-Message-State: AOJu0YwIMkAV10JXIlDJHGaEaL9IdGfkrDXWt80liFAKSXVtYh9tpBbw
	DG7XFcQG76h4fY0ozhJvm3mmgHOren9/MTaNEUYLJvkTPDwKnqA8tcpBdXgUdlZNjkZOk7sMjaD
	Zz+OH7z8=
X-Gm-Gg: AfdE7cmPBMyHNc345ujhuQwXlc+fFs6b68Xc908bAbGHYxDSWjd/qE+HxWUp+/D6f2l
	XDz6jVFBYL8fYNr8A/yNjB/JAXmESKRbyh20AoiwnsatqLRm/MR/BWX7u1iYBDn8b05er4ss6EG
	KpImO2dQSRWSCR/YGg4GsU5jNw+OpuD6w+eDXFMOlVWCNOm6izmvd5ShlVkMN1ZCvVywf2ttkNf
	hUxSqtifHR0Kjzm+WhvfPLmGxxrE8mEhN1qmzoJEeHBFXy4uU9tCYHoY0IEqVpkUoP2yxE7qab7
	dcjhkpCDxKkYGxSQhQLELA/NsiE4dO+47MAUtinuMUy4O0j3S5U3KK86PjAldICrlK5yYLhaPAe
	vyPcZiMWjgW5OD8BX4Y6a5j+94GxFTAdgtZUXT1Ambyn1gSE3P3YUJsyj85ayBy2HXMDbpM19Zf
	budVdshmLuHIsfsmEo9CoE6r5CD6Y3bYYCLwseC88lG1MFT+QG2WOoz4KKIKXBMEKMesOvcsqfE
	GW4ArM=
X-Received: by 2002:a05:600c:4ed4:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4954a3ec5f7mr86085095e9.2.1784415797076;
        Sat, 18 Jul 2026 16:03:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm149360805e9.6.2026.07.18.16.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:03:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/24] Pull request (cover letter only)
Date: Sun, 19 Jul 2026 01:02:55 +0200
Message-ID: <cover.1784413978.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 23:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241270

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1783590688.git.yoann.congal@smile.fr/
... with "binutils: Add CVE-2025-69646 to "CVE:" tag" removed per
review.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4235
oe-selftest-armhost, oe-selftest-debian and oe-selftest-fedora failed
with 15289 – [scarthgap] AB-INT: sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source failure
All 3 sucessfully retried with isolated sstate/hashserv:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/4357
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4300
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4128

The following changes since commit 2814f0962f56c8d1afa4de76d2895ba9b5cb767d:

  build-appliance-image: Update to scarthgap head revisions (2026-07-02 13:50:35 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 8aca19cff468c5f15c919c973c46be58e020af46:

  cve-update: Avoid NFS caching issues (2026-07-17 12:05:24 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  curl: fix CVE-2026-6276

Anil Dongare (2):
  cargo: Fix CVE-2026-5222
  cargo: Fix CVE-2026-5223

Ashishkumar Parmar (3):
  qemu: Fix CVE-2025-14876
  qemu: Fix CVE-2026-0665
  qemu: Fix CVE-2026-2243

Benjamin Robin (Schneider Electric) (1):
  openssh: CVE-2026-35387 patch also fixes CVE-2026-35414

Daniel Turull (2):
  libssh2: fix CVE-2026-55200
  libssh2: fix CVE-2026-55199

Esa Jaaskela (1):
  linux-yocto/6.6: update CVE exclusions (6.6.142)

Himanshu Jadon (1):
  tar: Fix CVE-2026-5704

Hitendra Prajapati (4):
  vim: fix for CVE-2026-34982, CVE-2026-34714 & CVE-2026-35177
  vim: fix for CVE-2026-28421, CVE-2026-41411 & CVE-2026-44656
  vim: Fix for CVE-2026-28417, CVE-2026-32249, CVE-2026-45130
  vim: Security fix for CVE-2026-28420 & CVE-2026-46483

Jaipaul Cheernam (1):
  curl: fix CVE-2026-5773 - wrong reuse of SMB connection

Jakub Szczudlo (1):
  libgcrypt: upgrade 1.10.3 -> 1.10.4

Nate Kent (1):
  sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers

Paul Barker (1):
  cve-update: Avoid NFS caching issues

Shubham Pushpkar (1):
  binutils: Fix CVE-2026-6846

Theo Gaige (Schneider Electric) (4):
  dhcpcd: patch CVE-2026-56113
  dhcpcd: patch CVE-2026-56114
  dhcpcd: patch CVE-2026-56117
  perl: patch CVE-2026-8376

 .../dhcpcd/dhcpcd_10.0.6.bb                   |    3 +
 .../dhcpcd/files/CVE-2026-56113.patch         |   92 +
 .../dhcpcd/files/CVE-2026-56114.patch         |   34 +
 .../dhcpcd/files/CVE-2026-56117.patch         |  167 +
 ...ch => CVE-2026-35414-CVE-2026-35387.patch} |    2 +-
 .../openssh/openssh_9.6p1.bb                  |    2 +-
 .../meta/cve-update-nvd2-native.bb            |    9 +-
 .../binutils/binutils-2.42.inc                |    1 +
 .../binutils/binutils/CVE-2026-6846.patch     |   57 +
 .../perl/files/CVE-2026-8376-01.patch         |   62 +
 .../perl/files/CVE-2026-8376-02.patch         |   49 +
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    2 +
 meta/recipes-devtools/qemu/qemu.inc           |    4 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         |   52 +
 .../qemu/qemu/CVE-2025-14876_p2.patch         |   56 +
 .../qemu/qemu/CVE-2026-0665.patch             |   38 +
 .../qemu/qemu/CVE-2026-2243.patch             |   45 +
 .../rust/files/CVE-2026-5222.patch            |   92 +
 .../rust/files/CVE-2026-5223.patch            |  114 +
 meta/recipes-devtools/rust/rust-source.inc    |    2 +
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |    2 +-
 .../tar/tar/CVE-2026-5704-dependent_p1.patch  |  484 +++
 .../tar/tar/CVE-2026-5704-dependent_p2.patch  |  169 +
 .../tar/tar/CVE-2026-5704-regression.patch    |  176 +
 .../tar/tar/CVE-2026-5704.patch               |  556 +++
 meta/recipes-extended/tar/tar_1.35.bb         |    4 +
 .../linux/cve-exclusion_6.6.inc               | 3418 +++++++++++++----
 .../curl/curl/CVE-2026-5773.patch             |   40 +
 .../curl/curl/CVE-2026-6276.patch             |  135 +
 meta/recipes-support/curl/curl_8.7.1.bb       |    2 +
 ...ilding-error-with-O2-in-sysroot-path.patch |   64 -
 ...r-handle-substitution-in-sed-command.patch |   49 +
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |    4 +-
 .../libssh2/libssh2/CVE-2026-55199.patch      |   44 +
 .../libssh2/libssh2/CVE-2026-55200.patch      |   36 +
 .../recipes-support/libssh2/libssh2_1.11.1.bb |    2 +
 .../vim/files/CVE-2026-28417.patch            |   92 +
 .../vim/files/CVE-2026-28420.patch            |  162 +
 .../vim/files/CVE-2026-28421.patch            |  148 +
 .../vim/files/CVE-2026-32249.patch            |  117 +
 .../vim/files/CVE-2026-34714.patch            |  109 +
 .../vim/files/CVE-2026-34982.patch            |  105 +
 .../vim/files/CVE-2026-35177.patch            |   60 +
 .../vim/files/CVE-2026-41411.patch            |   75 +
 .../vim/files/CVE-2026-44656.patch            |  130 +
 .../vim/files/CVE-2026-45130.patch            |  115 +
 .../vim/files/CVE-2026-46483.patch            |   77 +
 meta/recipes-support/vim/vim.inc              |   11 +
 48 files changed, 6448 insertions(+), 821 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch} (99%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-random-cipher-handle-substitution-in-sed-command.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28420.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28421.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-32249.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34714.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-34982.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-35177.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch


