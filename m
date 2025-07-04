Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14E4C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.14852.1751642942686192126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oiK1zoVY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-749248d06faso900050b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642942; x=1752247742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzhg5rZ0z7kGfAfzWJpG3EX6o3dLAZ+JNKLsAvxmP8s=;
        b=oiK1zoVYnSs/xU7frJClDDVMYC0YnOXTgZ9h+DOO6NSvmUl3yAwqipKplJJ9K8LrFR
         1MiBCWyapkk092FZNxx2sHjcVNyZ9Dng6Wnv4/Lnmr4dsDORwX8vNFEpDo2dVC9E5Pjq
         hwnyjeJvcic0bNuI+1VSqt2D8+SfSpyu+56iHZQwhCpscFfGe5h3KTqHusbmZA6uSGMS
         15iC4FLYiYxY92i7lFYNIjQVErz4BTG1A5DEH05YlEgYa+TrR1OyPxLKBT+BorYd51Rd
         Uewf/LssCdW6fL33WGuxJBf/SjP99R5TTupR6b8NUCPquOx+Rnf2vhNPVrEvInlMlFW2
         8lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642942; x=1752247742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzhg5rZ0z7kGfAfzWJpG3EX6o3dLAZ+JNKLsAvxmP8s=;
        b=Xacu6qaAyLEZZMjgXawoXsZIlKlSNEK0V3u/FPwJyXmq8S3rJrMKchVY2lqpqzyUwf
         GxE7/jztC/S1bYZOtxLmwWcz9oTQk7VXb0X0yDi8JH761KXtx3CqM+L+avfhmmEfuNm0
         CpRVF7WuuUlPXav+gHJyVd3ylKYJ8WHD3R5A2mQ0/gBtBOao/9Hfkqm09774DembyE8K
         xaMmXViFKc98z1eViObqLWFQIYhOCM/2LI04IMMOZg/lauHilU36wB1n5HfWxKxIwptt
         j0ReBGlrea/DspqSh2Qb//0mC9hus5JXgylba1RbupAmlklL144vwxm26gTPnycf+Yab
         dsPg==
X-Gm-Message-State: AOJu0Yz1NzEJHjvfxyKipuTXTY2wHD4WYQEaRvjdGDxcDy+QVFN6/1JR
	sA3Mt32DcvR95XUnadAymLTAF335sY7tOUHALt3jMvdZdGm8YqCpXW1c+ib/mSCV+6hiIEIcTGF
	zOgIx
X-Gm-Gg: ASbGnctzutyqaSBLi7qgDMa0pmPq9ZRAYkfli3C0UuOv2ikffywym0zzwY9C/yfDlkO
	OenJT6c7DBkKpe+PPZ2fEK77hTpoHt02HsSEpTgZciKj93LvfU3u/yQBrFL9IzJcT7rnrFwHl6N
	PmgMCsD9zDa3+mNH8rHImZ1Jnf4bISKOW53v6BPXF38TZN+68zewdpWAjZjLVSRFOs/BY0NYqNO
	hMRXWgDYq5FxcB1XvllgxCD1FkL1963m526DKhmL2wyn2bVaEH/Kjx5X2xfBUHIBJ49NeEp/bKF
	jkJQrXFZ6/VHSMWrt7V0KGvZFlC1KujOrdZS3yFwSFyk47ImcbPGjg==
X-Google-Smtp-Source: AGHT+IFwT9iiULsVG/t0fE3rbvAkrAF7rdieCgcK7J3OVKXL7RmzAfPZ3AX3tuLnzpUELYq0vKA/WQ==
X-Received: by 2002:a05:6a00:10c4:b0:746:26fe:8cdf with SMTP id d2e1a72fcca58-74ce68f9a22mr3795632b3a.7.1751642941639;
        Fri, 04 Jul 2025 08:29:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Fri,  4 Jul 2025 08:28:46 -0700
Message-ID: <cover.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219939

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, July 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1949

The following changes since commit 75e54301c5076eb0454aee33c870adf078f563fd:

  build-appliance-image: Update to kirkstone head revision (2025-06-27 08:10:04 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (6):
  xwayland: fix CVE-2025-49175
  xwayland: fix CVE-2025-49176
  xwayland: fix CVE-2025-49177
  xwayland: fix CVE-2025-49178
  xwayland: fix CVE-2025-49178
  xwayland: fix CVE-2025-49180

Chen Qi (1):
  systemd: backport patches to fix CVE-2025-4598

Colin Pinnell McAllister (1):
  libarchive: Fix CVE-2025-5914

Yogita Urade (1):
  python3-urllib3: fix CVE-2025-50181

 .../systemd/systemd/CVE-2025-4598-0001.patch  |  92 ++++++++
 .../systemd/systemd/CVE-2025-4598-0002.patch  | 106 +++++++++
 .../systemd/systemd/CVE-2025-4598-0003.patch  | 144 ++++++++++++
 .../systemd/systemd/CVE-2025-4598-0004.patch  |  36 +++
 meta/recipes-core/systemd/systemd_250.14.bb   |   4 +
 .../python3-urllib3/CVE-2025-50181.patch      | 214 ++++++++++++++++++
 .../python/python3-urllib3_1.26.18.bb         |   4 +
 .../libarchive/libarchive/CVE-2025-5914.patch |  46 ++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 .../xwayland/xwayland/CVE-2025-49175.patch    |  92 ++++++++
 .../xwayland/CVE-2025-49176-0001.patch        |  93 ++++++++
 .../xwayland/CVE-2025-49176-0002.patch        |  38 ++++
 .../xwayland/xwayland/CVE-2025-49177.patch    |  55 +++++
 .../xwayland/xwayland/CVE-2025-49178.patch    |  50 ++++
 .../xwayland/xwayland/CVE-2025-49179.patch    |  69 ++++++
 .../xwayland/xwayland/CVE-2025-49180.patch    |  45 ++++
 .../xwayland/xwayland_22.1.8.bb               |   7 +
 17 files changed, 1096 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch

-- 
2.43.0


