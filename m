Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2645CC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1783701423035449702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VdiUXV5+;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f431e317so7551845e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701421; x=1784306221; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3ybJMU9MzCMV9Li2T4c/f2zhteGqkCVKH9+yx0EEzc=;
        b=VdiUXV5+/l3wS8jjqaFBCdUcjr0lxzqW+PeYmP/3FmNhB1eWQfFIAeeTxZAQ8ubLuw
         6J8RKz2LjepV6IdpOPehdswlr27WSq/FyqllXxZJ8M5zSe9k6sr4wIFdt5S4K9ZFk5S+
         3olnwGVHa7LfprC0mxvUu6E9570K3+iMvIyLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701421; x=1784306221;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3ybJMU9MzCMV9Li2T4c/f2zhteGqkCVKH9+yx0EEzc=;
        b=CHRtwjDTGJRUP9nkV6TR4bjqAC2EFxxLvY+BhZCVS/huV6TF0axRMW68roY4tlgIG7
         qaqDkBRF8r25GqrWW+YkLjo0Kqfu6OrsUxRE8gr705dg2I+ofVa7V/LX3u+UVnJKmEt0
         uZStOki+tFcBbgKtjDtsT5N8b5nrlLUmTOt6usgfDAoYcrVsAHLO+c71YhgW19uWRXTf
         BwGDg7A3ZJYfnXtoL4yIzYyzuanHhTBShVGumQGx7OzSVDBOajW0vcSswR9qduaPROX2
         DaToxD2ymmXACsDPjI/MwqMG0yW+gznvHNfKa7NkwqVVmq1iCEhq4VKun4Z8iiTUsVq8
         RrRw==
X-Gm-Message-State: AOJu0YyhuMA08m5ycVT6kKu2HG4af+fa4/W5RgEGzdfdpyWa+mKGfqFd
	OGFmJtlwuoEFopHHsuhL4fumrU39YrJyheUw3uSQf4QjBSs9PRnCgNrVGpoYB7794K2D9cr5MNx
	hayfuzvA=
X-Gm-Gg: AfdE7cndySrGc9CRNOMXsPEPTQ4TW5wE+NhAnfDyu43rpYq3oF1tcUJTujH4y5mZABa
	UcEbhhoz0bfBpdY6Rx6ne5JB3V7gHT9HMyV0dnXxJ6l/NOUUJrfVEAhTb1M3kZjoBTUHDUl2AN/
	quEgmYMaoW6T9dfIkqnBj9zJ3k2oBQaeFhjMgSAFWe1rRR5WbF+H6k6krlbEvUT/wbEsNPYm4Ci
	GxtoI0uKSgUQlXPZrl/lmU0ipV27RGiCL4zLLdOcUNjCzK1udY6TmgagnMNDWdIINhxgnH8k+9h
	6Sn62Mawv65iE0pqWOD8Lh9Gnl6uT1ODDLNRPpiHkC+vHlndS/rqJ3o9X7rFKTTs7oAoJRy/+Ls
	68PROX5dOEre5zLnnIiKEfYf3KFwXKacwT25aEpc7V8gABxVP8mMNMpE5q6n5FG+tzgFUjQwoE/
	AiiWYCat37qsfw+MXt5hKQ4eVuAfgdL7o62IaGmXIXCMtLt1KH6eq7FtnLHTtM8wQjhtjer3g5s
	KjZRg2bPZZwZo+QWDk=
X-Received: by 2002:a05:600c:3b28:b0:493:bb2e:11a5 with SMTP id 5b1f17b1804b1-493e68c689bmr134567995e9.15.1783701420903;
        Fri, 10 Jul 2026 09:37:00 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/18] Patch review
Date: Fri, 10 Jul 2026 18:36:15 +0200
Message-ID: <cover.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240661

Please review this set of changes for wrynose and have comments back by
end of day Thursday, July 16. I'm off most of next week and back on the
17th.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4187

The following changes since commit c2746a4a165fd99c2d1aafed17533555787f37ce:

  clang/llvm: Upgrade to 22.1.8 release (2026-07-09 16:58:55 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 73299cef1b7cd6446c918c361fd2c47534126361:

  gnutls: fix CVE-2026-33846 (2026-07-10 12:37:42 +0200)

----------------------------------------------------------------

Amaury Couderc (1):
  expat: fix CVE-2026-41080

Benjamin Robin (Schneider Electric) (3):
  python3: fix CVE-2026-11940
  python3: fix CVE-2026-11972
  glib-2.0: fix CVE-2026-58016

Deepak Rathore (1):
  libcap: Fix CVE-2026-4878

Deepesh Varatharajan (1):
  gdb: Upgrade 17.1 -> 17.2

Eilís 'pidge' Ní Fhlannagáin (1):
  ovmf: fix tpm PACKAGECONFIG to use TPM2_ENABLE

Eric Meyers (1):
  create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for
    do_create_image_sbom_spdx

Gustavo Henrique Nihei (1):
  opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal
    ELFs

Hitendra Prajapati (1):
  vim: Fix for CVE-2026-52858,CVE-2026-52859,CVE-2026-52860

Jaipaul Cheernam (1):
  curl: fix CVE-2026-5773 - wrong reuse of SMB connection

Peter Marko (1):
  python3: upgrade 3.14.5 -> 3.14.6

Pritam Srichandan Sahoo (1):
  gnutls: fix CVE-2026-33846

Ross Burton (1):
  xmlto: update SRC_URI

Siva Balasubramanian (1):
  util-linux: upgrade 2.41.3 -> 2.41.5

Sudhir Dumbhare (2):
  python3-urllib3: Fix CVE-2026-44431
  socat: upgrade 1.8.1.1 -> 1.8.1.3

Theo Gaige (Schneider Electric) (1):
  expat: patch CVE-2026-45186

 .../create-spdx-image-3.0.bbclass             |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb     |   6 +-
 .../{socat_1.8.1.1.bb => socat_1.8.1.3.bb}    |   2 +-
 .../expat/expat/CVE-2026-41080-1.patch        | 517 ++++++++++++++++++
 .../expat/expat/CVE-2026-41080-2.patch        |  33 ++
 .../expat/expat/CVE-2026-45186-01.patch       |  70 +++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 +++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 ++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 ++
 meta/recipes-core/expat/expat_2.7.5.bb        |   9 +
 .../glib-2.0/files/CVE-2026-58016-1.patch     |  94 ++++
 .../glib-2.0/files/CVE-2026-58016-2.patch     |  98 ++++
 meta/recipes-core/glib-2.0/glib.inc           |   2 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +-
 ...2.41.3.bb => util-linux-libuuid_2.41.5.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   3 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ----
 ...l-linux_2.41.3.bb => util-linux_2.41.5.bb} |   0
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ---------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 -------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 .../python3-urllib3/CVE-2026-44431.patch      | 157 ++++++
 .../python/python3-urllib3_2.6.3.bb           |   3 +
 ...eadingMock-call-count-race-condition.patch |  37 --
 .../python/python3/CVE-2026-11940.patch       |  67 +++
 .../python/python3/CVE-2026-11972.patch       |  61 +++
 .../{python3_3.14.5.bb => python3_3.14.6.bb}  |   9 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb   |   2 +-
 .../curl/curl/CVE-2026-5773.patch             |  47 ++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 ...fragments-implement-a-basic-DTLS-tes.patch | 258 +++++++++
 ...merge_handshake_packet-using-recv_bu.patch |  96 ++++
 ...s-add-more-checks-to-DTLS-reassembly.patch |  65 +++
 ...fragments-extend-with-a-1816-reprodu.patch | 159 ++++++
 ...fragments-extend-with-fragmenting-Cl.patch | 149 +++++
 ...ch-DTLS-datagrams-by-sequence-number.patch |  42 ++
 ...fragments-1839-mismatching-message_s.patch | 104 ++++
 ...ts-mini-dtls-framents-link-to-gnulib.patch |  27 +
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   8 +
 .../libcap/files/CVE-2026-4878.patch          | 163 ++++++
 meta/recipes-support/libcap/libcap_2.77.bb    |   4 +-
 .../vim/files/CVE-2026-52858.patch            | 167 ++++++
 .../vim/files/CVE-2026-52859.patch            | 274 ++++++++++
 .../vim/files/CVE-2026-52860.patch            | 446 +++++++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 52 files changed, 3706 insertions(+), 612 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.1.1.bb => socat_1.8.1.3.bb} (94%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.41.5.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.41.5.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 rename meta/recipes-devtools/python/{python3_3.14.5.bb => python3_3.14.6.bb} (98%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch


