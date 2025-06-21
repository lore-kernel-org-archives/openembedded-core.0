Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102DDC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.8228.1750515804302252566
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GGuB0oc9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1215303a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515803; x=1751120603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S03/xH73wMjnBAt1TUrQW+L7rn+9g+tEd7j+PqPtk9Y=;
        b=GGuB0oc9JuJHuR0Qm0o4FwN52zW6JBHCkKKo3rn9zmALIq7miAtgEnf1Oy5ltZPXn3
         ul+2z6HpblMnjuSlAQtNB+XnftwANcxqYGgU8MrSmIC14Y6A63wOe40DbxeVe5Jrs/9V
         wH6gTjUZ0fdJKJcfzS4Bd1q8HrJknEH8kBRGXYHTazGb+1kvapR70XTo9zUIXI/YjcNS
         BlQDtOhUmkSPylngF8GXHqMcro9L1U7qEBz9zHMbCR48xhSYQRAKQcAiCNSORJXJ9oOf
         YkwoP5ds6uiK7fRXT1T4JIB9KWhbYTVqxlEnCrQrlhCVm7iwMpUnCPiJjRldA3odmmbH
         kFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515803; x=1751120603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S03/xH73wMjnBAt1TUrQW+L7rn+9g+tEd7j+PqPtk9Y=;
        b=vSi6DmB0N/JdBjKXu0Ku/ywmfssxyZ2fciIryvJd8fBnCIBy6vyI5tJDjbAArVb9hn
         8glapEro+VUrN8ClxmIuLZfzmV7xr+sh772DGIoUoe9xBvjIZWSQTQ4MD92tWnordz0j
         M+jH/OPotjJdR5ALx+mCJG0EsGhvlsbATjy1+P6E3fNScIoqUo7BKKpXOFTmnsx1kcng
         as8KG+A90aa4Z+MYQht/KVnUivXQpq0o1AIxl/uX8401cA8oh9ylixSTaWQZzR+f+jTK
         9IqbxnnNmoaapKClBcCPcpqPQaHKM+YmaILdfsBZPO62QLa/SWsFctkcIIjcEaHOowV7
         GFCA==
X-Gm-Message-State: AOJu0Yw1WIFz5hc34yJPU2rrSsvm8M2hWGBX6aHFi8IZua33sHItdddc
	oAPBxK30XPE9aWRLz3F4krqopN1LOPpM9FKlrwnIaT8ye9Y7k72uk2mZ1Y/jftboML7AnD2RqR6
	n1AE7
X-Gm-Gg: ASbGncsvyO3xo/247P9J/PDRHgQ1kuPGCfz8N7cL+aZ5hsNXcXX/1Y0qKcLKslGOy+b
	1G2G1yOUNPX0rWC2oPmR6xLVdMFD4oE8ztu4py5ZFgSWtNcR8Di7arNzxPOnUx8xMsBcnxM2RxZ
	6wICVm3hVK5J8pplR/IsVgTz4diYqfRDe1mhOJoEbiUBxatjskGfvyFt9lJ9noWqW0K6Ojq2qDW
	LP9LW4zA6lCJgqOAzHM6hmw9KJhLLEtSiF2ejWq/ddupB+pzbhEy23Mi4LCIJRK2l4n+zWvhJum
	emjB74VWd9o6pcrPS2xVcGhlEmjymf33ZuoKwCSJRMnQpNrnaTxwzg==
X-Google-Smtp-Source: AGHT+IEMqFs5aPRqADqogXXlG4CGnU5KD66FR7DixtSwWCC6VBoDPjV6aJXLkYTmqViZ8KmKclOGDw==
X-Received: by 2002:a17:90b:524d:b0:312:e8ed:763 with SMTP id 98e67ed59e1d1-3159d8c0f85mr9077940a91.22.1750515803384;
        Sat, 21 Jun 2025 07:23:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/7] Patch review
Date: Sat, 21 Jun 2025 07:23:10 -0700
Message-ID: <cover.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219158

Please review this set of changes for walnascar and have comments back by
end of day Tuesday, June 24

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1854

The following changes since commit fd79c20430ad5c540522ddbe72ef235379c628bd:

  tune-cortexr52: Remove aarch64 for ARM Cortex-R52 (2025-06-16 12:50:00 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Archana Polampalli (1):
  ghostscript: upgrade 10.05.0 -> 10.05.1

Moritz Haase (1):
  cmake: Correctly handle cost data of tests with arbitrary chars in
    name

Peter Marko (2):
  go: set status of CVE-2024-3566
  glibc: stable 2.41 branch updates

Praveen Kumar (1):
  bind: upgrade 9.20.8 -> 9.20.9

Richard Purdie (1):
  bind: upgrade 9.20.6 -> 9.20.7

Wang Mingyu (1):
  bind: upgrade 9.20.7 -> 9.20.8

 ...1-avoid-start-failure-with-bind-user.patch |   2 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch |   2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
 .../bind/{bind_9.20.6.bb => bind_9.20.9.bb}   |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...u-tests-that-can-hang-in-oe-selftest.patch |   2 +-
 meta/recipes-core/glibc/glibc_2.41.bb         |   2 +-
 .../cmake/cmake-native_3.31.6.bb              |   2 +-
 ...trary-characters-in-test-names-of-CT.patch | 202 ++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.31.6.bb   |   1 +
 .../go/go-binary-native_1.24.4.bb             |   1 +
 meta/recipes-devtools/go/go-common.inc        |   1 +
 ...ript_10.05.0.bb => ghostscript_10.05.1.bb} |   2 +-
 16 files changed, 219 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.6.bb => bind_9.20.9.bb} (97%)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

-- 
2.43.0


