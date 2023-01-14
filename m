Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC94C67871
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 16:34:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.119615.1673714072006561668
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 08:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GJ6ra+N5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so8400698pjm.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXRmMLHJgeTA4L2IZSlscbB9b/OqzAvtjT2y0mdcGL0=;
        b=GJ6ra+N5TFzwBbT8glnN80ODq4EDlHEBUsklsjT+hmOMaPylw8a9i3Mk+6HqmH0Ql2
         X9bFE8lsn1F9E28DaAQCgr+P1cESOjm0Q8p2n4R8quSpLcay9MyEZ+6zs8xQNZzcbNgY
         TLg4PKWIJb2qb/CnIZjl6ZoiFQA4XffXZlb+irW+56QNkoqIu1/ST1WDmHRKzkZIPZGc
         nCfUEhm9ugqfhQiJzDZuj/eSTGf0vPJUFqYTBLh7yVvWggSC3LC4pqZytq3HU4b2UxsY
         tfUpGHMvEjRyK5+2kgzf+PNjHDZPxF44d6IeVhSi6R2DMb0UV6zc7KsevtVX3/L8or1l
         lcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXRmMLHJgeTA4L2IZSlscbB9b/OqzAvtjT2y0mdcGL0=;
        b=0O0jc4t3of7AP0J5+Di7IxbmSfIhD3GMYwGS3X4Rr1HUzxMKVyYKkWvUnUbSSqM2am
         50F5e8JQiObMQ5meP2g6Es68GvgwaFegNPbCydx+LJq+Zne5b80MPmG3SkPqShSPDMx9
         CmhtWrpDcEhjqHgqIJSF4cKKNuEVLGLVmHJiOa+2M0uWTfkAd4C6mNg3NKwEJuZFIa8Y
         QVTrIjyieC9Lern5xNi7qsl+TvLfylhH94fqBN3Du2xUf0xO2F9BmL5JI8gxTNeAEoPk
         D9pR2GmTxRUcn76JbUB8O+7AaNcQMOOAJYxKNOhIAFli5bZPYrigjFl6BP9w0r0Jt/hV
         ImRA==
X-Gm-Message-State: AFqh2kqOsVGpzUkgCTwWng7glp+ofy3oZ1kxGdIJyULid90V2zj6eChJ
	dNB33tET8N7NnkcoDDdhRQIPPxNOUrD6TpQcTNY=
X-Google-Smtp-Source: AMrXdXtmjzEPDpbV93LXaNfIkj+dJ6Dr+eBlrdyUWlqI2ZTXCdr3TBC/M7B2T+PQqSBNX/vDvGiWRQ==
X-Received: by 2002:a17:902:7c05:b0:194:6415:ced0 with SMTP id x5-20020a1709027c0500b001946415ced0mr8273178pll.15.1673714070954;
        Sat, 14 Jan 2023 08:34:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u9-20020a170903124900b001926392adf9sm16108941plh.271.2023.01.14.08.34.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 08:34:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Pull request (cover letter only)
Date: Sat, 14 Jan 2023 06:34:26 -1000
Message-Id: <cover.1673713936.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 16:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175856

The following changes since commit 5fa9d58f59bebfc9eb495b50ef9a767a5c765b77:

  oeqa/concurrencytest: Add number of failures to summary output (2023-01-06 17:30:18 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (2):
  libarchive: upgrade 3.6.1 -> 3.6.2
  devtool: process local files only for the main branch

Changqing Li (1):
  base.bbclass: Fix way to check ccache path

Hitendra Prajapati (1):
  systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
    a long backtrace

Jose Quaresma (2):
  Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change
    test"
  gstreamer1.0: Fix race conditions in gstbin tests

Luis (1):
  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively

Martin Jansa (1):
  systemd: backport another change from v252 to fix build with
    CVE-2022-45873.patch

Narpat Mali (1):
  ffmpeg: fix for CVE-2022-3109

Pavel Zhukov (1):
  oeqa/rpm.py: Increase timeout and add debug output

Wang Mingyu (1):
  bind: upgrade 9.18.9 -> 9.18.10

 .../devtool/devtool-test-local/file3          |   1 +
 .../devtool/devtool-test-local_6.03.bb        |   3 +
 .../devtool/devtool-test-localonly.bb         |   3 +
 .../devtool/devtool-test-localonly/file3      |   1 +
 meta/classes/base.bbclass                     |   2 +-
 meta/classes/rm_work.bbclass                  |  15 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |  23 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.9 => bind-9.18.10}/bind9  |   0
 .../{bind-9.18.9 => bind-9.18.10}/conf.patch  |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.9.bb => bind_9.18.10.bb}  |   2 +-
 ...w-json_variant_dump-to-return-an-err.patch |  60 ++++
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +
 .../libarchive/CVE-2022-36227.patch           |  42 ---
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |   8 +-
 ...-vp3-Add-missing-check-for-av_malloc.patch |  44 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ++++++++++++++++++
 ...bin-test_watch_for_state_change-test.patch | 107 -------
 .../gstreamer/gstreamer1.0_1.20.5.bb          |   2 +-
 scripts/lib/devtool/standard.py               |  38 ++-
 28 files changed, 590 insertions(+), 190 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file3
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file3
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.9.bb => bind_9.18.10.bb} (97%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.6.1.bb => libarchive_3.6.2.bb} (92%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch

-- 
2.25.1


