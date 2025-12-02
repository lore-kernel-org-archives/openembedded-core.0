Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA21CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 15:09:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9913.1764688180193169607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 07:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e0Mk5XLA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5477273b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764688179; x=1765292979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2GR11sgLAgWS07j6a2729uEH3HBWjaaKOElCZk2cgo=;
        b=e0Mk5XLAYl1Q9OHK8GKq1AQGxgMB/Yl/FiZYT6sjQ7Qst7CsZX0Zwxa5BoMEqbrwt9
         b2Q1J8JjVffxidnl+w5DvYMsNHAQTYqon58TghypOJDAAvYz4gblhU6Db2YpDcPp4hK7
         y8nkjR8Pijxt5zR4h7mZqjq9q4QCQ/HVFQW+62Aa3BMcaS3TaPuc00XKg9YgZKeHZ911
         hoO+VaKswJtwa5hWBog/urM2Erj+eEsLPGabpK/pbbWnrpIRWyDoHELHgy2M5Xq6GoGv
         DBv9jAp52+smQ2Y/8/TbemmWGHzEDEE4a7I8/o90y1NcCjkYKkSCt87zzcivRbQ29kC5
         JxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764688179; x=1765292979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2GR11sgLAgWS07j6a2729uEH3HBWjaaKOElCZk2cgo=;
        b=VkQnpFSpZcAElDH15RDVe0tJpKOybBOF2+oE+iWlm5cDzKr7MeC5d5gCv6T1mI5+Bv
         MYPX8hAV5/ggnNmOWEDMBbBS2eA+Ls+AVdIIlZ8DuX57HbDc5wOL1K2XiwouYKY9/Dix
         ZF89UtRoLJSjddp1eGeE1A6LvefZQcRgdM2mmjoeOJw9Fsjh0Yrl4yECQiWWgJHrxDm9
         N+r7k92xN2HELd5OXL0I/XDhOqgwX6bQRvQZxx3ozRIt2h/GKesD6SXVAYpepeEP/DYb
         ArYqWlmMVmB7rct6bi38dCFgm+5FMPzVCCT9VVfqyc6FX9Ypp6DAm/oCVus0emVvHxt9
         2Zwg==
X-Gm-Message-State: AOJu0YxIIgFuux1EyOkfcQfOSuktE09aw/EbOE8pxd14bov91EInPKi4
	J7/o0971EsuTO6WRSqMF6Lf6oBuIoAn7Uv3NTwtbIx9YiY899XvYeIGh7+1kD04+q9IWJh1kSOR
	qqp+M
X-Gm-Gg: ASbGnctA5YZLCjt68MXDMtFl361KBg2ojW6sSAafzpiJOi2N67ek2xwJo9dtUPysmEF
	Q2nH4KuezOCXNZiCbPGe7ROhCgyBqYj+/p09LkJS2M2GxSMXA89CwDOF+1B83SnICWJJY1/z3vF
	G2CInw/Dfova/y+6n5YoVgSDHR+TfwfcDsIc98eZKnMuBJpHkU+Ql1yr3YwUiUU0doxN3scTZGi
	8rT2d/QbA1QxLar0S9TTmuXRyAY38K6YNUrJk4pAUdQ2FmRzTXz0cMJI+RYo8yM+DtP2fN5LGwN
	SK31eKaE8DXqy6lgRtq5yHDX2EE4YKSAFipCZWlZ0Cu+D4S9m+gmpm0hvTXWHrb4Kx7T9K4+nHC
	2ThlIKIghurVCIAgr9f+VtPKUAcwYPqAlIAbNkXlo41G8xVAK1JbEC1K3EqamURBgRkEGdwhlGr
	9kkrGpeRk3iF/X
X-Google-Smtp-Source: AGHT+IFz5r64nYMvOTQLUvOxTmXkilH11+ZwYuoqEj2cbWSVY74M2kjQpESSEAWeyPhTlu04/vYbeQ==
X-Received: by 2002:a05:6a00:1895:b0:7b6:ebcb:51a8 with SMTP id d2e1a72fcca58-7c58e0188f0mr48935647b3a.16.1764688179170;
        Tue, 02 Dec 2025 07:09:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:b8d9:92cd:3fd4:9b7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6621sm17175182b3a.16.2025.12.02.07.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:09:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Tue,  2 Dec 2025 07:09:23 -0800
Message-ID: <cover.1764688053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 15:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227159

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, December 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2808

The following changes since commit ceef3cde9b761b7b5de6f7b6b1fb8e99663af9ca:

  flac: patch seeking bug (2025-11-24 07:34:36 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  go: fix CVE-2025-58187
  go: fix CVE-2025-58189
  go: fix CVE-2025-61723
  go: fix CVE-2025-61724

Gyorgy Sarvari (1):
  systemd-bootchart: update SRC_URI branch

Peter Marko (5):
  gnutls: patch CVE-2025-9820
  libpng: patch CVE-2025-64505
  libpng: patch CVE-2025-64506
  libpng: patch CVE-2025-64720
  libpng: patch CVE-2025-65018

 meta/recipes-devtools/go/go-1.17.13.inc       |   4 +
 .../go/go-1.18/CVE-2025-58187.patch           | 349 ++++++++++++++++++
 .../go/go-1.18/CVE-2025-58189.patch           |  51 +++
 .../go/go-1.18/CVE-2025-61723.patch           | 221 +++++++++++
 .../go/go-1.18/CVE-2025-61724.patch           |  74 ++++
 .../systemd-bootchart_234.bb                  |   2 +-
 .../libpng/files/CVE-2025-64505-01.patch      | 111 ++++++
 .../libpng/files/CVE-2025-64505-02.patch      | 163 ++++++++
 .../libpng/files/CVE-2025-64505-03.patch      |  52 +++
 .../libpng/files/CVE-2025-64506.patch         |  57 +++
 .../libpng/files/CVE-2025-64720.patch         | 103 ++++++
 .../libpng/files/CVE-2025-65018-01.patch      |  60 +++
 .../libpng/files/CVE-2025-65018-02.patch      | 163 ++++++++
 .../libpng/libpng_1.6.39.bb                   |   7 +
 .../gnutls/gnutls/CVE-2025-9820.patch         | 250 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 16 files changed, 1667 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58187.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-58189.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61723.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2025-61724.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64505-03.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64720.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-65018-02.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-9820.patch

-- 
2.43.0


