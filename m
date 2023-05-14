Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D85C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.70161.1684081907021227513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=c4oEf00g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6439f186366so7472891b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081906; x=1686673906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8S13zOCuzxyB+ZH9+m4vP3ZBrNSEM1I6s0JLrtB8ZyE=;
        b=c4oEf00g3K/3uHeJxi03uO1ik26HNMLNMyH4O+Am7J+G5/oO//Gi81rK3+p/UYsV3+
         rrkGRMlF7+udTdBIWsW/Lkv19goqRDMaw9oLGNgjBJ/bw36MmEWLT+d0pykcwKX3wbOj
         MNT2NVT8/IlS7ycW8IkFh0mpcoihGwBOXxz10E57xFpnS9kOyUKJn66MbDlO4CMo6So6
         q991/TQ4ZPXYjsyy3kXrN18n2e0qJIoIiRK9BfE/UxRDjP4kLK3Fpmp0JzUAMnsfH1vK
         LsFNhVqaeEsf6PZTB6xgR/xhznrLuLzdLNdyAn88SWASA9s1Qa/GkAwIyxPpsD3m48Dz
         /qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081906; x=1686673906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8S13zOCuzxyB+ZH9+m4vP3ZBrNSEM1I6s0JLrtB8ZyE=;
        b=TVIHVqwErTpu2ro1mFDqrtSVkLuI5AtJ0aN7ZaP4ySyEN6j63PxlVXhQnAjZ0V/uDe
         eEzdZCYgr5FzjV8tMNAJOS1cDn78f9Ac9WXHtkRMgXimXgt5TEHYaFV0r3ZgYtLur9IQ
         nKcJ8OHn1LzVUjLmlWbFcNarHAu9Mt3KrY230uJICr8xnJBVt3NFyOpP8lOrXNL9PpHP
         KfQcTyhS9gxCuvdP3oMtyUGq89Hj9IGS3y+LQ1q/zH6ZUfRbi82vDnT9v0B9Jt81bJSr
         de8zROvM0V7VPMPCsAIIU5rGlauhGxDlQXKo53cDWL2qAXIT2dak6L6pgEHxto8NteNd
         CMbQ==
X-Gm-Message-State: AC+VfDw65ds9KXJbIsInrHgM+cBoV37otqxca19RTvzvPuSb8es7MMKP
	ViCgHfTGMfPAG5kzXkn3jisAMH+LU7YLQxSIExw=
X-Google-Smtp-Source: ACHHUZ48vnUqkQsMmvN52PhlyiU81z7WfP4Cw0Luah7qGP6iP3qTP5E3vClPVuPLk645V7XAUzg2hQ==
X-Received: by 2002:a05:6a00:22cd:b0:64a:f8c9:a421 with SMTP id f13-20020a056a0022cd00b0064af8c9a421mr9248132pfj.32.1684081905850;
        Sun, 14 May 2023 09:31:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/15] Patch review
Date: Sun, 14 May 2023 06:31:25 -1000
Message-Id: <cover.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181201

Please review this set of patches for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5299

The following changes since commit 27b4fb60c7c66c245ba50607c8e178390fc41014:

  update-alternatives.bbclass: fix old override syntax (2023-05-04 16:42:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Khem Raj (4):
  gawk: Disable known ptest fails on musl
  gawk: Remove redundant patch
  gawk: Add skipped.txt to emit test to ignore
  libxml2: Disable icu tests on musl

Martin Jansa (1):
  populate_sdk_ext.bbclass: redirect stderr to stdout so that both end
    in LOGFILE

Martin Siegumfeldt (1):
  systemd-systemctl: fix instance template WantedBy symlink construction

Otavio Salvador (1):
  mesa: 23.0.2 -> 23.0.3

Richard Purdie (5):
  qemu: Update ppc instruction fix to match revised upstream version
  glib-networking: Add test retry to avoid failures
  glib-networking: Correct glib error handling in test patch
  maintainers.inc: Fix email address typo
  maintainers.inc: Move repo to unassigned

Ross Burton (2):
  cpio: fix appending to archives larger than 2GB
  machine/qemuarm*: don't explicitly set vmalloc

Upgrade Helper (1):
  waffle: upgrade 1.7.0 -> 1.7.2

 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/conf/distro/include/maintainers.inc      |   4 +-
 meta/conf/machine/qemuarm.conf                |   2 -
 meta/conf/machine/qemuarmv5.conf              |   1 -
 .../glib-networking/eagain.patch              |  29 ++
 .../glib-networking/glib-networking_2.74.0.bb |   1 +
 meta/recipes-core/libxml/libxml2_2.10.3.bb    |   9 +-
 .../systemd/systemd-systemctl/systemctl       |  13 +-
 meta/recipes-devtools/qemu/qemu/ppc.patch     | 127 +++++--
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 .../gawk/gawk/remove-sensitive-tests.patch    |  43 ---
 meta/recipes-extended/gawk/gawk/run-ptest     |   5 +
 meta/recipes-extended/gawk/gawk_5.2.1.bb      |  24 +-
 .../{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb}   |   0
 ...build-request-native-wayland-scanner.patch |   9 +-
 ...-make-core-protocol-into-the-library.patch |  23 +-
 .../{waffle_1.7.0.bb => waffle_1.7.2.bb}      |   8 +-
 20 files changed, 505 insertions(+), 110 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/eagain.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives-bigger-than-2G.patch
 delete mode 100644 meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.2.bb => mesa-gl_23.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.2.bb => mesa_23.0.3.bb} (100%)
 rename meta/recipes-graphics/waffle/{waffle_1.7.0.bb => waffle_1.7.2.bb} (92%)

-- 
2.34.1


