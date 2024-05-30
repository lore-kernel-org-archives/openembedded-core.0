Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F64C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.4937.1717094292860636602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zlvj+OPa;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70231c74400so886617b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094291; x=1717699091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N13wcDnTXJ7BHG16ZSgwhLrXGVrSIVX8qhad/WdM2pk=;
        b=zlvj+OPaWa4FtRlbLczkHRL6Sq/EUqFcJVHthNF0yAYeF2ODSZd3IM/eCt57HCBaTU
         1/vhbHB2y/NpRR7HK949yHjAczQwt+7nhbT5pKYai5sSIx4DXwyEE8W/8LkgOgImSgE8
         LNWvy9BGtTq66aIufWefu8ttMiNSXmq/c9JUfhZemJ7RkPMhY11aXJNjI8JrMKNNhyHs
         ckJzQwTR8IQuPsqZvN/kUO2i010TE0+Mpy3WsYw1iofpb/rxDVueT1n25HZpNGbSRJd8
         1O4sjlvwArbAfiwtlX1aQ5TTT+sTx1UAIKu3SlgA3wCVNi3Y/uFT2rBCAlMaxLGRuWzx
         TYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094291; x=1717699091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N13wcDnTXJ7BHG16ZSgwhLrXGVrSIVX8qhad/WdM2pk=;
        b=CjUWJxCdjQZbBRAfjrkk88FVH/ckXG0wXObmKAvzXZyaOdcdszh0RcjhII8gv5cNv+
         NDExarAxYBBY5FOQHxbGpg+zcvMJ13pHLgCSFlnZY2dZTpbD6KjZl+Pv52/FZPxdycE1
         oG6kD5jOyjzHd4yH3Qd38PRA8OnRARQWM5zh9d7BTrj1m1ifZ9MJGsCy+8e536XIey+G
         KnDwSU3h9myvBspKbGzVOdbQ8pr7KYFjGEX2FVJ9/hxXXKyMqQmqRn80UjI0uhSzN2x0
         dYJGz5RmpT3wSUbWM0aX8tmpzowKK569uI6KEqLnKjT8RQCmTrxGgjXnVvdvvJbwpCnK
         +vLQ==
X-Gm-Message-State: AOJu0Yxi8e4maVTDdo0YAedSr2Dpt5FYOqpT2vFo5RH7eR36eulXIdud
	2r7mgBuF+NW0g2ygWeeQNeMpvm1f6hGHW1Jqx8QEKGYGS0Ydklw0r1I4jRc5CHGxsHJjWWssR/F
	8
X-Google-Smtp-Source: AGHT+IF7TOvM7ZH6AlQjjrKXDZSfJRZVOBqAvQokUueUg9NBTYfOYacuhMhch+XEu+159JALbg3Vig==
X-Received: by 2002:a05:6a00:1da9:b0:6ed:5f64:2ff4 with SMTP id d2e1a72fcca58-70231139480mr2850666b3a.14.1717094291118;
        Thu, 30 May 2024 11:38:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Thu, 30 May 2024 11:37:59 -0700
Message-Id: <cover.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200038

Please review this set of changes for kirktsone and have comments back by
end of day Saturday, June 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6984

The following changes since commit e0a1ed7aa1f2b12d985414db9a75d6e151ae8d21:

  initscripts: Add custom mount args for /var/lib (2024-05-22 05:07:30 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (5):
  ghostscript: fix CVE-2024-33870
  ghostscript: fix CVE-2024-33869
  ghostscript: fix CVE-2024-33871
  ghostscript: fix CVE-2024-29510
  ghostscript: fix CVE-2023-52722

Soumya Sambu (2):
  util-linux: Fix CVE-2024-28085
  git: Fix multiple CVEs

 meta/recipes-core/util-linux/util-linux.inc   |    5 +
 .../util-linux/CVE-2024-28085-0001.patch      |  202 +
 .../util-linux/CVE-2024-28085-0002.patch      |  172 +
 .../util-linux/CVE-2024-28085-0003.patch      |  223 +
 .../util-linux/CVE-2024-28085-0004.patch      |   36 +
 .../util-linux/CVE-2024-28085-0005.patch      |   34 +
 .../git/git/CVE-2024-32002-0001.patch         |   69 +
 .../git/git/CVE-2024-32002-0002.patch         |  213 +
 .../git/git/CVE-2024-32002-0003.patch         |  141 +
 .../git/git/CVE-2024-32002-0004.patch         |  150 +
 .../git/git/CVE-2024-32004-0001.patch         |   95 +
 .../git/git/CVE-2024-32004-0002.patch         |  187 +
 .../git/git/CVE-2024-32004-0003.patch         |  158 +
 .../git/git/CVE-2024-32020.patch              |  114 +
 .../git/git/CVE-2024-32021-0001.patch         |   89 +
 .../git/git/CVE-2024-32021-0002.patch         |   65 +
 .../git/git/CVE-2024-32465.patch              |  206 +
 meta/recipes-devtools/git/git_2.35.7.bb       |   11 +
 .../ghostscript/CVE-2023-52722.patch          |   43 +
 .../ghostscript/CVE-2024-29510.patch          |   84 +
 .../ghostscript/CVE-2024-33869-0001.patch     |   39 +
 .../ghostscript/CVE-2024-33869-0002.patch     |   52 +
 .../ghostscript/CVE-2024-33870.patch          |   92 +
 .../ghostscript/CVE-2024-33871-0001.patch     | 4863 +++++++++++++++++
 .../ghostscript/CVE-2024-33871-0002.patch     |   43 +
 .../ghostscript/ghostscript_9.55.0.bb         |    7 +
 26 files changed, 7393 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0004.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0005.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0003.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32002-0004.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32004-0003.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32020.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32021-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32021-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-32465.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871-0002.patch

-- 
2.34.1


