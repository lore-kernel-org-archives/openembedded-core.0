Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B0BC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.28728.1736801234027137891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vSR4ihxR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215770613dbso57358675ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801233; x=1737406033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFyqW7n/dmJA+tlsX/bpqlHPfuJNXtrFZj2a+6Oj4FU=;
        b=vSR4ihxR90O4CAtCa8rOuoQ/Rk7lM8DhQmoQ3AqAqEBx585p5kUsnLUJzOtwi99ClV
         VOvzlSuJFWDUflTdTJCTeJnM1F1ndVeG7/mb5IQB4k4+IiSkvQh2LjVR857Wbpj2yt55
         ZlsdVG8ZOrSOkKIuKkFD+sP23u95G99AZPZWU0tBkrvI207jrQZKbPommhkTau79XXzt
         ZA/4tIocAieZ5rN4CbG/ldXKp9K4SmG0LBN1eenKP6JwKqApUj/Y9vTrK/NoLj2ugLkW
         IKzMdlPbk7y/KVZ4SRtVeDbbukfKDuMLKphFz/9kkNzJYTqGJ2wWkJJeq8+fwAze3A+5
         JX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801233; x=1737406033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFyqW7n/dmJA+tlsX/bpqlHPfuJNXtrFZj2a+6Oj4FU=;
        b=k2vTVrPYT2x+xfseF9jPGV0eRrvjX/G8zBYIsibaBfOXoud5HbcwlpSYbKwAQUwOCJ
         WTE9QFXDBr3KT+fwsqUPgPf+nf3IKPDBdRCpT8r+UQynygeJIi/Pi7KOcPNRZw5orncB
         mjNfNXd2fFCllXkFhWwM8CxSfdeuiGiYkqr8w0KAeqqHNO4PIchzARq7ZDIavmnNCFyI
         j8wuDf/IR9eUUr0YUdzUM0SDMWU206Uat7pzfIimNaZkXI727jvhcibfiytZz9zKLFXo
         Vbl+kfEja1n5sCbCXA/KHQb3Tl+dnFHAtFa8rYJB9+K6vXIB8i3pYJqLZgFrLnUnccyW
         cI9Q==
X-Gm-Message-State: AOJu0Yz5SP++FPFVxBaegg+8gQHgGw4A3YdA+/kvHYM6IF+OgeWcyIFZ
	0OIoeI9MN8CpIVRiTzx1V0EY6/dYP556H3fUnHuDxGSPe7Gcx5E05i3WBB2g/ySTznlsfRWR7yX
	JJbw=
X-Gm-Gg: ASbGncuAbv00EbwLIwHnZpBmuHUWBk0qhMHJOicoDPF8SiiPtiVn/9TmxKRGxRvbYsb
	ufmphJu5W23gvmCslIkvCqirViemZmtvjxvARza4fUiPEQ0sQu7HeUaYDFPvBCNVQcm3XgnAZg9
	2/TPRJIOkXwnQqPmo0udS0GxuEPNCB01Y1/L9Q47aSVEiYi5iRItp/lpc3p4mIT0+0VvIN1JdbK
	uDOvL6f6Y2oL4MatQOEyA+ofO9EOpicr6Oax90iLK+0vw==
X-Google-Smtp-Source: AGHT+IEBpwTzjD6m3H5PqrGx+3xTuNs0yzmjcndGxiZGb032B059wmm6PS1FqomuOF5GmmYWE0yBUg==
X-Received: by 2002:a05:6a21:998d:b0:1e2:88b:4f1b with SMTP id adf61e73a8af0-1e88d320942mr33797202637.39.1736801233127;
        Mon, 13 Jan 2025 12:47:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/15] Patch review
Date: Mon, 13 Jan 2025 12:46:52 -0800
Message-ID: <cover.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209744

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, January 15

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/802

The following changes since commit c3e0666dd2624c20c5f32657846d6f044046205b:

  sanity.bbclass: skip check_userns for non-local uid (2025-01-03 06:05:29 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Bruce Ashfield (11):
  linux-yocto/6.6: update to v6.6.56
  linux-yocto/6.6: update to v6.6.58
  linux-yocto/6.6: genericarm64.cfg: enable CONFIG_DMA_CMA
  linux-yocto/6.6: update to v6.6.59
  linux-yocto/6.6: update to v6.6.60
  linux-yocto/6.6: update to v6.6.62
  linux-yocto/6.6: bsp/genericarm64: disable ARM64_SME
  linux-yocto/6.6: update to v6.6.63
  linux-yocto/6.6: update to v6.6.64
  linux-yocto/6.6: update to v6.6.66
  linux-yocto/6.6: update to v6.6.69

Changqing Li (1):
  systemd: enable create-log-dirs

Hiago De Franco (1):
  bluez5: backport patch to fix address type when loading keys

Mark Hatle (1):
  cve-update-nvd2-native: Handle BB_NO_NETWORK and missing db

Robert Yang (1):
  groff: Fix race issues for parallel build

 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-up-address-type-when-loading-keys.patch | 52 +++++++++++++++++++
 .../meta/cve-update-nvd2-native.bb            |  5 ++
 meta/recipes-core/systemd/systemd_255.13.bb   |  5 +-
 ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 .../linux/linux-yocto-rt_6.6.bb               |  6 +--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++-----
 9 files changed, 114 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch
 create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch

-- 
2.43.0


