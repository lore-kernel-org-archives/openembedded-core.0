Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D6DC47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:59:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.6442.1705507148965550445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wJqvohlA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d6f1cdf279so5811895ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507148; x=1706111948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XD/5w/6sdy1IwRMOjr5DHAeJvnE96U78TXyA2cfGzJg=;
        b=wJqvohlAK+a6PVm1fkRberExoPWoTCpQgIV2UIaanr5R+fDNVCeyB+XSSVZFgefda5
         ZR4fmS0l2P7afWdunH0g8KpfFf5YRv/UP3UYSm5D+L7BS6VPpaopUOrK+PV2Y3YcrHXg
         bXJbEMJnmkWEmelOmuCUTwDKVO6pPFiH6hV0b92TlkjRY5PnUEKAnkX1ANMVmbhTrLbZ
         oFyLm44OaFByrX9zEpZz/K1/mAtAHpkB+f0DokC6jkqdctkF723bp9xnKG+ITWSSSEaQ
         YdPocULdgUoBMxGG+RKCFXssH1BpsIb3h6J0sxH7v1O+Lr8XEbsaWRagwD4EX5rbuDYt
         LVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507148; x=1706111948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XD/5w/6sdy1IwRMOjr5DHAeJvnE96U78TXyA2cfGzJg=;
        b=iLhqFsYj41bJ8IRxq/iGGuazaksvWGJRoNbL0yt4bOTBlKW+MY8WNNrItiENZZcsA8
         PLOv1QnXBvfdL6S69krJy+NrHUAMm6wkRxpOvz9IkSULETirLSB7XTILbxe1zIBD0c6B
         mOCjxFLkTQp8SyQtTm8Q5L9dGsDsLwYM1eJ/Trcnoo9CPyaFHqyACTaKqikyCQaguhra
         3ypJ33cCjQAlaXdukK9TDtJ8zeMq8Ay4LCV83K1aVQ/Br1E3GwHGMyokBkb495uT41wG
         7Q9SOHJkAslvIF05xwvXCM98lJaobL5C7/GLKcWnL4jwjnEj5wXIhuGiKQ/aJEsykfg4
         kQ6g==
X-Gm-Message-State: AOJu0YxWKvx1z+NobS2QKwz3vWCrGBVsU2aaaKwp5hC0i0YcLKpBTrXd
	iBsDaZkn5J7a8C9hmMTgCykiZ23HNMI1M0PU0U5LEHSm61e+PQ==
X-Google-Smtp-Source: AGHT+IEAHlesHAx+2hS7s1s9h7dNkCiLAVm80pOTAEdnB2nhu9THZBUBDJHLdRf/3oppZdSbj1QiHg==
X-Received: by 2002:a17:903:94d:b0:1d3:65b0:838a with SMTP id ma13-20020a170903094d00b001d365b0838amr11890764plb.131.1705507147846;
        Wed, 17 Jan 2024 07:59:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.07.59.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:59:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed, 17 Jan 2024 05:58:53 -1000
Message-Id: <cover.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193924

Please reviwe this set of changes for kirkstone and have comments back by
end of day Friday, January 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6458

The following changes since commit 8e27f96c0befbbb5cf8a2f7076b7a1ffd79addb6:

  linux-firmware: upgrade 20230804 -> 20231030 (2024-01-09 05:50:24 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (1):
  systemd: fix CVE-2023-7008

Martin Jansa (1):
  pybootchartgui: fix 2 SyntaxWarnings

Peter Marko (2):
  sqlite3: backport patch for CVE-2023-7104
  zlib: ignore CVE-2023-6992

Poonam Jadhav (1):
  Revert "curl: Backport fix CVE-2023-32001"

Soumya Sambu (1):
  cpio: upgrade to 2.14

Vivek Kumbhar (1):
  openssl: Backport fix for CVE-2023-6129

 .../openssl/openssl/CVE-2023-6129.patch       | 113 ++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 .../systemd/systemd/CVE-2023-7008.patch       |  40 ++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   3 +
 ...charset_alias-when-building-for-musl.patch |  30 -
 ...ove-superfluous-declaration-of-progr.patch |  28 -
 ...-calculation-of-CRC-in-copy-out-mode.patch |  58 --
 ...appending-to-archives-bigger-than-2G.patch | 312 ----------
 .../cpio/cpio-2.13/CVE-2021-38185.patch       | 581 ------------------
 .../cpio/{cpio_2.13.bb => cpio_2.14.bb}       |   9 +-
 ...e-needed-header-for-major-minor-macr.patch |  47 ++
 .../curl/curl/CVE-2023-32001.patch            |  39 --
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 -
 .../sqlite/files/CVE-2023-7104.patch          |  44 ++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   4 +-
 17 files changed, 254 insertions(+), 1058 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
 rename meta/recipes-extended/cpio/{cpio_2.13.bb => cpio_2.14.bb} (74%)
 create mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-7104.patch

-- 
2.34.1


