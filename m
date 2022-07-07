Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C8EC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 21:59:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.725.1657231189784519954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HG99alBI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id o15so11982596pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YfbJXI8CEqFANuE1OqhOFTKgK/9bKJxmAIEL3WSeM4=;
        b=HG99alBINoY2q8DC5eJHk9zKl6Rw0J01QanWK7+1wu7zMjNYwh7PUOsa3h+N1ZtgzP
         S7s+grfn3iX/im7J0nY0l1A6ip9ZCcx6BPOxpOhqYKlguXBhcGe5BdxwNfKMvpTOepXl
         hoAnlx3J1BkJl+4+5gJltwWZ/w1w/imajYzIR/S3tnVEdjCsfRC90NhsZ1jUI5003wcQ
         6Slh73p8e68QeZYe6r+WU5JZKHMo6K4KfUgKe3qsEvGHe48gKb6++CQMuDtEi7Te4xTQ
         fbUwi7W6QLWh60GT6kqJ2bJBkAxaccqjNxTgjWn+ys75e3bwAUZp+6soxPTW4kf1TV3n
         +n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YfbJXI8CEqFANuE1OqhOFTKgK/9bKJxmAIEL3WSeM4=;
        b=wflS95G1AL4SLF551gvrgcrg5N1gEYN6DUOyvK3WhqcCPSmlSbfLgV8Y4PVcVmsiHb
         VgWH9daoZk1h41Lnumlarw0FMaZv22Pf9rqMbTsuHzBYWz5dg5wCYzGNwu/Qt/n8xw3S
         I4uXLO6s+Sag/c4rhz3ksRxhtO9DcLtc8VTel7qN7oUbGzj+Vlgxszxcnukdxqx8sDEe
         OGhyXel53utPZU/6fryp/nQpLMF271/sDgHOYmFpASJxUcm/eN3Ow9EAu+yaux6x22jt
         QLFxBTLeZU01AcV/BatPKnkKBEW6A73ijqWRzvtM0+jjzDmrt+TmBmmUKVIXIO5GEPIy
         1xQQ==
X-Gm-Message-State: AJIora/19kNbhgBONmP/rzcjO04+0kju0MpOpe04XsmQIN9f1y+T31wf
	FaZdEnheZUNSNU3KBUEFqKYgHe3ByAmpVg/N
X-Google-Smtp-Source: 
 AGRyM1uO5IKEAcAKlQGz0sZjy7QeVSpGfHcvG1yi76CUqlcdftDOvC2GO+PL4zt5c5LTR0uWva9cpw==
X-Received: by 2002:a17:903:2112:b0:16b:de4d:555a with SMTP id
 o18-20020a170903211200b0016bde4d555amr247207ple.61.1657231188342;
        Thu, 07 Jul 2022 14:59:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.14.59.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:59:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Thu,  7 Jul 2022 11:59:22 -1000
Message-Id: <cover.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 21:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167798

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3880

The following changes since commit b75caf4a985e3c20996531785125eaffdc832104:

  insane.bbclass: host-user-contaminated: Correct per package home path (2022-06-29 05:15:49 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anuj Mittal (1):
  efivar: change branch name to main

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.199
  linux-yocto/5.4: update to v5.4.203

Jate Sujjavanich (1):
  IMAGE_LOCALES_ARCHIVE: add option to prevent locale archive creation

Ranjitsinh Rathod (1):
  openssl: Minor security upgrade 1.1.1o to 1.1.1p

Richard Purdie (5):
  cve-extra-exclusions: Clean up and ignore three CVEs (2xqemu and nasm)
  vim: 8.2.5083 -> 9.0.0005
  oeqa/runtime/scp: Disable scp test for dropbear
  packagegroup-core-ssh-dropbear: Add openssh-sftp-server recommendation
  oe-selftest-image: Ensure the image has sftp as well as dropbear

Ross Burton (1):
  cve-check: hook cleanup to the BuildCompleted event, not CookerExit

Steve Sakoman (3):
  openssh: break dependency on base package for -dev package
  dropbear: break dependency on base package for -dev package
  qemu: add PACKAGECONFIG for capstone

 .../recipes-test/images/oe-selftest-image.bb  |   2 +-
 meta/classes/cve-check.bbclass                |   2 +-
 meta/classes/image.bbclass                    |   5 +-
 .../distro/include/cve-extra-exclusions.inc   |  31 ++-
 meta/lib/oe/package_manager.py                |  13 +-
 meta/lib/oeqa/runtime/cases/scp.py            |   2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |   2 +-
 .../openssh/openssh_8.2p1.bb                  |   5 +
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 ------------------
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 ---
 .../{openssl_1.1.1o.bb => openssl_1.1.1p.bb}  |   4 +-
 meta/recipes-core/dropbear/dropbear.inc       |   5 +
 .../packagegroup-core-ssh-dropbear.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}  |   0
 meta/recipes-support/vim/vim.inc              |   6 +-
 .../vim/{vim_8.2.bb => vim_9.0.bb}            |   0
 20 files changed, 64 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1o.bb => openssl_1.1.1p.bb} (97%)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

-- 
2.25.1


