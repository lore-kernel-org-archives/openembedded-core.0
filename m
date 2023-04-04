Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E01FC76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:29 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.92065.1680575968233221441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qv/hd9Ya;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id cu12so20493022pfb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575967; x=1683167967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mN05vf85Dv7BnaUFkTRTDi8Y6ZyEE6HUJIQIgmZOX24=;
        b=qv/hd9YapJkBo+C9RPKrsUWJPhn/mhAyCOfrbKb3qzhARm97HpOCKhL1O6P5DeFDzb
         JBOen9UNcQlt+8fD2kM/35rMNrG2xFG9T7MvMCJaAC5EbxTTwrSSg7vV9VbP4IMqTObM
         NRdjhL1cfuYcxz8Zx5u9yhgMyumPG5RntY0w9yQhMXdE8EgcBNgpWtKsAH0f3xCT5mcB
         KLm34B8HCwCaf22J5vTCn1sclEh3MfKGQ+MLKHMnz/+2/NB+H5iCweB5McdGjrNEaXMF
         qJGQnz/QHoSEAtU2N6SGEWaXkSFcSSM8vpwXKqaQ7NGN4iuvvelU4hJpxtA6IoY19FHk
         YgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575967; x=1683167967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mN05vf85Dv7BnaUFkTRTDi8Y6ZyEE6HUJIQIgmZOX24=;
        b=66LGflr72P5x7fBYDUm1G5tXykVzUOKtIfYQeDMQuqHX9PSvG3iMqkRQTzA6+Tbamw
         +476hD4brINc3KZguunZmyJ2Q9E0FBIvuZDJZsLnq+BOzBaRiXO+MXaiM8pFfe0OrLLy
         wmqb2kbCWxgQoLn37ku2guzDf6qcRz0euuBK3c+vLMtykM9nULB+pRC1RpEGL7c1RO4o
         gmS9Sd0I15KBlCOhDBwuMyou3TTvByeN00nzp4OeNH4nu+n2zHcDw5jO37PytmfTtt1N
         nD+8xTF1dYZpoiWmPQjCSdf4vVBDdZ4TINyEUW5UJOmgR01/7Wn+PNyOodR811Sx35un
         qiwQ==
X-Gm-Message-State: AAQBX9eRmQ90eHYTfNuiVPK4ITzL+Zb1FUGoWaiHIF9oNN2HxLAwYM9Q
	B4kSX1OIpElICY8/9Cpi8LEO4JlzGWNs04dKsd8=
X-Google-Smtp-Source: AKy350Z3GvGdQTgSgd91gdCx8cJmHlXGM9VPsD5eOs+KzK3FkwI6aQled5NyxYd/jB8SkQgDFeMh/Q==
X-Received: by 2002:a62:194c:0:b0:625:9055:3bc9 with SMTP id 73-20020a62194c000000b0062590553bc9mr598288pfz.27.1680575967192;
        Mon, 03 Apr 2023 19:39:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Mon,  3 Apr 2023 16:39:09 -1000
Message-Id: <cover.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179659

Please review this set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5141

The following changes since commit 1c7d555379c4b0962bccd018870989050d87675f:

  classes/package: Use gzip for extended package data (2023-03-27 16:29:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Geoffrey GIRY (1):
  cve-check: Fix false negative version issue

Hitendra Prajapati (2):
  curl: CVE-2023-23916 HTTP multi-header compression denial of service
  qemu: fix compile error which imported by CVE-2022-4144

Martin Jansa (1):
  bmap-tools: switch to main branch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Shubham Kulkarni (1):
  go-runtime: Security fix for CVE-2022-41723

Vijay Anusuri (1):
  git: Security fix for CVE-2023-22490 and CVE-2023-23946

 meta/classes/cve-check.bbclass                |   5 +-
 meta/lib/oe/cve_check.py                      |  37 +++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 ++
 .../git/files/CVE-2023-22490-1.patch          | 179 +++++++++++++
 .../git/files/CVE-2023-22490-2.patch          | 122 +++++++++
 .../git/files/CVE-2023-22490-3.patch          | 154 ++++++++++++
 .../git/files/CVE-2023-23946.patch            | 184 ++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41723.patch           | 156 ++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ass-requested-buffer-size-to-qxl_phy.patch | 236 ++++++++++++++++++
 .../bmap-tools/bmap-tools_3.5.bb              |   2 +-
 .../curl/curl/CVE-2023-23916.patch            | 231 +++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 16 files changed, 1332 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-23946.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

-- 
2.34.1


