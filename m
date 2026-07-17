Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5AAC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 09:59:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10266.1784282391112053746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 02:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=es/LEmsl;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so1840875e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784282389; x=1784887189; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMtdl1E2m4qKEYKxu8+OS+UY3u4XmTiZrpHE3Wa6VG8=;
        b=es/LEmsllgUk4V0YoqOUm5EcyVtfQ6uN2uneEmSnwzy518E/M3dDpKmqTljFU/PgQG
         InjxE8RHuPa3Iva/VtfWYXqeBjTFdPKQx9F86my3KVK0PxJRx9xZZLQfK90D/rvCX96o
         Q9Wqy751k6a67WM91GmRBiGdsAtWrIwcIKigU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282389; x=1784887189;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMtdl1E2m4qKEYKxu8+OS+UY3u4XmTiZrpHE3Wa6VG8=;
        b=JiQ6U6knmHrfxXAJEm+nVky+1roTaVYer8f66eS6uBMpxm0+vKgXhwGShUw79d1+D6
         oN40YtTIc0GC5RryMrF4d8Nr/FtjXJmpqjBbT+F2me+EHhqQwGK0TSEK+PMBeL+JxVx1
         VXC3YDM45HljVSxdI3hs0c4shbIzUx/vjA9t+Z1Qd9CN8aNfHYhAtiKDoRUErw9vBnqj
         d35SU4vFT+2O9UMXAmL+cHUKI+Qf0SJo7Hw2Q1+0H3kvs24RogvhEJVxPQyMPxEjlpjy
         WSOtpVd+hmMzGZz/xGKkoC4qTSIozIrl5NuGetnfYyA+UOom4UOUkuHHtZcMT+poOjp5
         8sTA==
X-Gm-Message-State: AOJu0YxdYsJf4dGRP4jxz3jklGgQw5EcjqBEXlL6lloqFvF/VLvQKMS/
	3umYmozMuj7BxC6eUYySGTKazVi3wGnbGC0Rc298Z3iNj0RssRXOGeNOPmXQf80ySamATDHZbjx
	KU4vsDkA=
X-Gm-Gg: AfdE7cnRuwB6PNQKYwMi0pw2gxWPG4o1XIP3vMm0MesmbuTdgUwKNzDaGCWAIy1fBBn
	H5F0mlAGtDFuRbGfnkfB7fYmLCfsw6AyodvJT3z7lL1kQVF+grg6V2FZ9sZWjMqMn0W0xMICvoj
	AN14d9VgxF7ZiU13TMxPKaGq+pEYRWBS1Yra6b9COyRT+7AzwpbFGfdnBKAFudms2KhAsLs35xz
	vnuHnwFJcGL52QZmkuT73LnZ3CRNjWEL+IrcbbioizcIqA8c8uLaj6hIvDsRyrCENIsje3iVRAq
	qIKgoEqaqEqQBTcliWebyZBu3KWI6PAQpuwd3mRqzvl8OHuyO3/rVZJH2pVxzwSrf1ZI4eEQ15E
	+HatPcWYtJA6MF9DewLH82MF58PyRG3NEwXXjh3TDpv32wpJzOKc1l5MQc/IjdbZvKDMbhkjKb5
	RrGpesi5cWzjPMRqW8LS5WdDQHIjnzrS53ImWz6LUb3i19Ir6FrdjVJuMNHWddBj4jzqF7T99w0
	kMLG9CIgzTPM/YFkw==
X-Received: by 2002:a05:600c:46c7:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4954a323acfmr21407235e9.6.1784282389062;
        Fri, 17 Jul 2026 02:59:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm43034595e9.11.2026.07.17.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:59:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/17] Pull request (cover letter only)
Date: Fri, 17 Jul 2026 11:59:43 +0200
Message-ID: <cover.1784282125.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 09:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241159

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1783697455.git.yoann.congal@smile.fr/
Removed "util-linux: upgrade 2.41.3 -> 2.41.5" per Paul's review.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4214

The following changes since commit c2746a4a165fd99c2d1aafed17533555787f37ce:

  clang/llvm: Upgrade to 22.1.8 release (2026-07-09 16:58:55 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 6f5681afb324aed2cba4e5b819ffc878f74a2bac:

  gnutls: fix CVE-2026-33846 (2026-07-16 20:54:12 +0200)

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
 48 files changed, 3705 insertions(+), 496 deletions(-)
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


