Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2DDC41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.15685.1691071461703866858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yqnf/SwD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso684542b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071460; x=1691676260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iat49I7DmVZTHsVM1Qa/3shfuT9C1ckbzpL7pCoovOg=;
        b=yqnf/SwDBqnv/VEUzKf1ZOO7FXC/76T9YH+q45Jfzz295M3f+70idBZaKHLWWGVTxn
         Nyu83PdR4XvrUHViDdscDyCXu5dLM7A2NpA129pANqcA4Ux68qIPOr1uBN+Drs9YvpcQ
         kssGmEC7ZLs4MYPpiRIe5r3g0hX5x5iy7X93qsNe+vrXDRIg+TSiSWLieKfolQ0tqUJs
         gtxqzH0AaubWqinqFRGFLNh5MH+/hYyqAv91A5KhSv1HlDSyJhovmh6LlucVtIWFSrQ0
         /8Q3PhMJ/D5y4yO7R64GXLAQHTuCD7HVkFq4eLt0dMQ7DQtCcz0V0TbabLleTZZx3Lnp
         DNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071460; x=1691676260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iat49I7DmVZTHsVM1Qa/3shfuT9C1ckbzpL7pCoovOg=;
        b=WQCeMcPGhRC3eUVaVipT88dc5FQVdMOmzXP4lMOPEb7E95zDxqFfLl9YKZG76d1gRC
         +jtevdgEDAqNRLWYfvZJdhcDD8HYVEC4U/SKCV6BqRxtPF5hnkshF0GpvtL5Qinsgx1f
         bxUCu1piIwdtHYE6TcC+/I41S4b3nIygF2Ljp3jipFdRLqD3t71bzSYOvs86IaGc+Ao+
         BpEwFdk/jQ4qad1pWtVbRwQ14/Aw0FmmU5iyfeEdAXoZ3OMbhBfPLnTIaoski1Ykn0V6
         YbrPOGVZ3vehBxfDaSlz290BOlvmyMUy8kcUGhb+b0UbeXsWnCqc3TaCawQhWhG7HHUZ
         7UyA==
X-Gm-Message-State: ABy/qLZ8TB6qL4JViG+15XCntDLVia8z5KD0f3DRM+99glfyEgnQwng2
	scXjHmV9CKUWDxl5cd6azKGuEtbNmasclnrTkVQ=
X-Google-Smtp-Source: APBJJlGa3RgZnkkyB+giiTHHx7efK4uihAxDNrTDhF7EFFPEQFtr2AXxCFiq6qg/yV45UWk8DWOK2Q==
X-Received: by 2002:a05:6a00:2d07:b0:675:70d7:1eb4 with SMTP id fa7-20020a056a002d0700b0067570d71eb4mr20168191pfb.14.1691071460445;
        Thu, 03 Aug 2023 07:04:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Thu,  3 Aug 2023 04:04:04 -1000
Message-Id: <cover.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185479

Please review this set of changes for kirkstone and have comments back by
end of day Saturday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5680

The following changes since commit dc2e760591c5ed3c999222f235484829426c71a7:

  util-linux: add alternative links for ipcs,ipcrm (2023-07-31 08:12:27 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (3):
  qemu: fix CVE-2023-3301
  qemu: fix CVE-2023-3255
  qemu: fix CVE-2023-2861

Peter Marko (3):
  libpcre2: patch CVE-2022-41409
  libarchive: ignore CVE-2023-30571
  openssl: Upgrade 3.0.9 -> 3.0.10

Sakib Sajal (2):
  go: fix CVE-2023-24536
  go: fix CVE-2023-24531

Sundeep KOKKONDA (1):
  gcc : upgrade to v11.4

Yuta Hayama (1):
  cve-update-nvd2-native: always pass str for json.loads()

 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../{openssl_3.0.9.bb => openssl_3.0.10.bb}   |   2 +-
 .../meta/cve-update-nvd2-native.bb            |   2 +-
 .../gcc/{gcc-11.3.inc => gcc-11.4.inc}        |   6 +-
 ...ian_11.3.bb => gcc-cross-canadian_11.4.bb} |   0
 .../{gcc-cross_11.3.bb => gcc-cross_11.4.bb}  |   0
 ...-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} |   0
 ...cc-runtime_11.3.bb => gcc-runtime_11.4.bb} |   0
 ...itizers_11.3.bb => gcc-sanitizers_11.4.bb} |   0
 ...{gcc-source_11.3.bb => gcc-source_11.4.bb} |   0
 ...rch64-Update-Neoverse-N2-core-defini.patch |  20 +-
 ...rm-add-armv9-a-architecture-to-march.patch |  54 +--
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 102 ++---
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 .../gcc/{gcc_11.3.bb => gcc_11.4.bb}          |   0
 ...initial_11.3.bb => libgcc-initial_11.4.bb} |   0
 .../gcc/{libgcc_11.3.bb => libgcc_11.4.bb}    |   0
 ...ibgfortran_11.3.bb => libgfortran_11.4.bb} |   0
 meta/recipes-devtools/go/go-1.17.13.inc       |   7 +-
 .../go/go-1.19/CVE-2023-24536_1.patch         | 137 +++++++
 .../go/go-1.19/CVE-2023-24536_2.patch         | 187 ++++++++++
 .../go/go-1.19/CVE-2023-24536_3.patch         | 349 ++++++++++++++++++
 .../go/go-1.21/CVE-2023-24531_1.patch         | 252 +++++++++++++
 .../go/go-1.21/CVE-2023-24531_2.patch         |  47 +++
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2023-2861.patch             | 172 +++++++++
 .../qemu/qemu/CVE-2023-3255.patch             |  64 ++++
 .../qemu/qemu/CVE-2023-3301.patch             |  60 +++
 .../libarchive/libarchive_3.6.2.bb            |   3 +
 .../libpcre/libpcre2/CVE-2022-41409.patch     |  75 ++++
 .../recipes-support/libpcre/libpcre2_10.40.bb |   1 +
 31 files changed, 1451 insertions(+), 100 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.9.bb => openssl_3.0.10.bb} (99%)
 rename meta/recipes-devtools/gcc/{gcc-11.3.inc => gcc-11.4.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb => gcc-cross-canadian_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb => gcc-cross_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb => gcc-runtime_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb => gcc-sanitizers_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb => gcc-source_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_11.3.bb => gcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb => libgcc-initial_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.3.bb => libgcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb => libgfortran_11.4.bb} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-24531_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-24531_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-2861.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3255.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3301.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

-- 
2.34.1


