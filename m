Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EABC61DC5
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18278.1787652434558804547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kQRwSPhq;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3820174f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652433; x=1788257233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6fDVWAPoE0GSdFM+6sliREvLuqAPdIxStCuRKsXbiXM=;
        b=kQRwSPhqm/bsfN1mYcmJVMjodEJTa459fB3m+T74fC6FkcFUysDUTtjKwm6ALMpraV
         WX+akUSn/4qtDKOwzqanN9kCXuVdJX4X23rA2GpZFhgxttOK/Zb/s+KdRNQjuTH4ii+8
         V/0+cl8+ktISqflEB51lzGHP0oFr63MbW/Kp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652433; x=1788257233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6fDVWAPoE0GSdFM+6sliREvLuqAPdIxStCuRKsXbiXM=;
        b=WUlkGPYiFTx+NZGbkt+f/wxQMJU4eN4VZXjA12vHBDvHnwwd5Rq5/aUtelRhyUUaYu
         Gsssetlg2joOP0VzkJvrDK1xLBK7GjchKb8nkJvL4UVo/x1WtKh3VIthO1eNyBCq63zr
         XymaBbdGxYdzw+WSMHCNNWZc2+36c0RsFr7ztAbEARs4Jt9GrM9UlGMDwRYqXo2IJch3
         qQshoZUeC3/OJ68k3ehcJbi0LkxBu/5BNJB87ty8/tuJ5krfhmx7HVrcIa+yKAFb3f5m
         0hgVhhnv7xD/E/8yq4PiNTzfGc9icLtYRGxYKCDKrikvVnjrUDFrlL+vAM911vjacPIq
         7bJg==
X-Gm-Message-State: AFuF++no4GcQiGj8fguUxcrF8n9R0JbgocPmIVxy8XXuocvNHwZ+HiC+
	m77POFWdWNzU3Z6ZtrFno2VIPLeCKHDoBbbvFj695wwlLGYdNo7rPIdgHUbuKroZxOnk0oQ/i8X
	CbGAaKFQ=
X-Gm-Gg: AR+sD13S2A28+oz3x6A85CcxjKhhwpAQ7JBKuWQIcOKXd8agQKb+nJ2bd0yLtJr344u
	V2z4kHjbB0IpW1BQdiZSNKcuJxYe/wtGwmV+FybW+nRwqnnf6NK74AC26zEwBknfzgMg0y8wes8
	6mmQc40f1iOS8nhyGjt1infVgVYAQhvwzoyWHnga1Wh32YrZBCvrFSCXwOgncvADt+BvLQNL6HS
	HK5jmKrTKdRS/duJr5TW+CnSCmu4NH+bmxxnMRcKqIy55t5fUsbIPdf1YLOx+hnnSFl5TJUYf/w
	oBO8z8v5qb8/iSn4uZSwUP7YzblVHuFAKrvQno8G/G3MbDnrcpFaMImi9+2Dkktq2xHZyz9gjYV
	5fsgfg17W5q9LSHxkkOMAcL+yxntn5w/Brlt+SPxro2xSO14V94zv5FNRcNO4xyjkKr+OyzFi+8
	zzr6lxPBLp1B78Jm+eJNr7ydzuAs1w7JvyfWXbEPI/kRwvn9JxstR+fNSsSOvFhkbhaFPNRSyXR
	7rTU6jt3VBYofD9fNW8X07WlzbuqqwvP0S12lo39RilpX2+yZ4kS0E+xXm8lky0Z8z8TnE=
X-Received: by 2002:a05:6000:2582:b0:47f:7129:e30 with SMTP id ffacd0b85a97d-482d9f1d930mr6174685f8f.11.1787652431589;
        Tue, 25 Aug 2026 03:07:11 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Tue, 25 Aug 2026 12:06:38 +0200
Message-ID: <cover.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244215

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, August 27.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4569

The following changes since commit 70dc15941dd33270a92d1001174efb3093e79bdf:

  build-appliance-image: Update to scarthgap head revision (2026-08-24 14:28:47 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to b7007d82eec734bab6760ae325645ae5b199e384:

  rpcbind: Fix CVE-2026-16277 (2026-08-25 07:01:14 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  libssh2: fix CVE-2026-58050

Deepak Rathore (2):
  nghttp2: set status for CVE-2026-58055
  glib-2.0: fix CVE-2026-58015

Etienne Cordonnier (1):
  curl: fix CVE-2025-10148 backport for websockets on 8.7.1

Jaipaul Cheernam (4):
  binutils: fix CVE-2025-1147
  binutils: fix CVE-2025-8224
  binutils: fix CVE-2026-15003
  binutils: fix CVE-2026-18220

Peter Marko (1):
  bison: patch CVE-2026-56389

Ross Burton (1):
  bitbake.conf: add TMPDIR to GIT_CEILING_DIRECTORIES

Vijay Anusuri (1):
  rpcbind: Fix CVE-2026-16277

 meta/conf/bitbake.conf                        |   6 +-
 .../glib-2.0/glib-2.0/CVE-2026-58015_p1.patch |  97 +++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p2.patch |  55 +++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p3.patch | 198 +++++++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p4.patch | 222 ++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../binutils/binutils-2.42.inc                |   4 +
 .../binutils/binutils/CVE-2025-1147.patch     | 110 +++++
 .../binutils/binutils/CVE-2025-8224.patch     |  54 +++
 .../binutils/binutils/CVE-2026-15003.patch    | 400 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 .../bison/bison/CVE-2026-56389.patch          |  56 +++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 .../rpcbind/rpcbind/CVE-2026-16277.patch      |  34 ++
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |   1 +
 .../curl/curl/CVE-2025-10148.patch            |  24 +-
 .../libssh2/libssh2/CVE-2026-58050.patch      |  45 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 .../recipes-support/nghttp2/nghttp2_1.61.0.bb |   2 +
 20 files changed, 1367 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch


