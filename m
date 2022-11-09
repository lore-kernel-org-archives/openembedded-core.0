Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F96C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:20:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.3683.1668003649812019266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5zFliCGg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id p12so11725574plq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/2TeE9oMc1IYTYJjoTlyRxcEm6I0EvLVazNqm4/Fw0=;
        b=5zFliCGgoXzIHu5G+KPk1IccCLY9nf08/7pcKOoEaSZb1DGpjE0OlBsVT+YTidtGJ/
         YtLMShfO37O7+QnS87V4T+dAZooMTjH94FF4GNEYwykjSGuBk9FbVAV55Gl4wueuVZl8
         PBZHGJdIZrojA8xqYzfYCuSNENT7hYFD41mD3C3FpzdTf+Jg/T5fmcUUhb1OjAAWCzNy
         oDWeoyVHmtTzX+Jzo2+9dV9roF6asoQNVSeRq66LwqxE7e/dIn/9zsXfvMgnotFUeCm+
         V8aYS6WpkTTmcI+ZA3DeykaVhE0QDGK1u3a6bNnnZdE3wbP0ggrqwPLy7nIykA3r9JnD
         V49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/2TeE9oMc1IYTYJjoTlyRxcEm6I0EvLVazNqm4/Fw0=;
        b=5BOGcfRycjKPRqBUexnpNoL0QAUts7hROgMX6kIePygsiQ31K2jw3rMsUs1tx9as3w
         hxhEdbG9Ar0iObf3SILYibtr0CO5Irt4pCMxQshWyWE9svWS5UG2+D8ZJAnDsh6bV4gj
         Bnkei+0z0LbiXBfSGSsIGC3XL8JUPIL0t2hmpid06EYdbCILZqbURAl9MdGgIwFwl/JT
         s+gFoW9ezt4G9BDl8YGV1n0Hgt5QctpkTXaQQMywVeLpsW1H0o4oG3IgRGiv6W+Y6VfP
         UzvTUDOD6G/uc97PcYS0DxiYOLDQupZKaw1pIt+YHBdpU3a2HcKqwQru2QryTu8V41Qa
         AvpQ==
X-Gm-Message-State: ACrzQf3/xAOAmcigYvvtlhOynsqLFZu5hbQ1l7sjN2lUwqugRiQTfL0k
	1Pvy/B5x4pfSKggl9e2NI4NJODSbV9GqRF4X
X-Google-Smtp-Source: AMsMyM4CW+zkKi00hE7S8JHKYC2Qq5iNLXoxNeQIXbZ0yeYjm91Qzd6fZF29jAn38GveEiy6TEJtDA==
X-Received: by 2002:a17:90a:8988:b0:212:e1b9:e8fd with SMTP id v8-20020a17090a898800b00212e1b9e8fdmr78422134pjn.148.1668003648472;
        Wed, 09 Nov 2022 06:20:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:20:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/10] Patch review
Date: Wed,  9 Nov 2022 04:20:30 -1000
Message-Id: <cover.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173019

Please review this set of patches for langdale and have comments back by
end of day Friday.  This should be the final patchset before the 4.1.1
build next Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4443

The following changes since commit 0eee57ef03908c04e1567889f72d7187b5c1f657:

  mirrors.bbclass: use shallow tarball for binutils-native (2022-11-04 09:16:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alexander Kanavin (3):
  shadow: update 4.12.1 -> 4.12.3
  lttng-modules: upgrade 2.13.4 -> 2.13.5
  quilt: backport a patch to address grep 3.8 failures

Bernhard Rosenkränzer (1):
  cmake-native: Fix host tool contamination

Michael Opdenacker (1):
  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED

Robert Joslyn (1):
  curl: Backport CVE fixes

Ross Burton (3):
  pixman: backport fix for CVE-2022-44638
  sudo: backport fix for CVE-2022-43995
  sanity: check for GNU tar specifically

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes-global/sanity.bbclass            |   8 +
 meta/classes/create-spdx.bbclass              |   2 -
 .../cmake/cmake-native_3.24.0.bb              |   1 +
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   2 +-
 .../{shadow_4.12.1.bb => shadow_4.12.3.bb}    |   0
 .../sudo/files/CVE-2022-43995.patch           |  54 +++++++
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |   1 +
 .../xorg-lib/pixman/CVE-2022-44638.patch      |  33 ++++
 .../xorg-lib/pixman_0.40.0.bb                 |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 ---------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 -------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 -------
 ...ags-parameter-from-aops-write_begin-.patch |  76 ---------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ---------------
 ...ules_2.13.4.bb => lttng-modules_2.13.5.bb} |   7 +-
 .../curl/curl/CVE-2022-32221.patch            |  27 ++++
 .../curl/curl/CVE-2022-35260.patch            |  73 +++++++++
 .../curl/curl/CVE-2022-42915.patch            |  53 +++++++
 .../curl/curl/CVE-2022-42916.patch            | 134 ++++++++++++++++
 meta/recipes-support/curl/curl_7.85.0.bb      |   4 +
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 23 files changed, 537 insertions(+), 437 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 rename meta/recipes-extended/shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb} (100%)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.5.bb} (76%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

-- 
2.25.1


