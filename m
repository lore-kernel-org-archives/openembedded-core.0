Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87917E77175
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.25986.1733442153415473211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=D3sOpa1+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241205234230664b6a467214faa6dd-azqqxo@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241205234230664b6a467214faa6dd
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VFoZz6orAnXYuV+vsyhtTyz0LBzh60Qn1bxDbP49y7c=;
 b=D3sOpa1+17yU6btr0LlBI5gCohbWnEZZuKUpYniT6oUw48m8+QdmMeS/DIwtTTyPhF8/7G
 zSIydtJGe/7mjGGvIQfPqlaFtgWj30v7/McSFkYGj/8y0iFAWPmr0XDVKDQaXj4yG3hYbcsc
 AuHXFXIcMFa6uLl0/iIUATgH0zfbIVUoUWWBNK4NdWTkY+//fx5vUFfhTItL9QvmVEkUd8xR
 0LNWmSiDh6/ZjdWA9lm53P2o5hiHPICU0I6/mRz8aGuXOSOXNLyjSYLgtS7qHWsH09DkNPA1
 ORHxq87TJzObaxOanX43GjuMbQnDlXAY/xdQ+9TUSwY43d4Eft1RYqUA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][styhead][PATCH 0/7] cve metrics cleanup
Date: Fri,  6 Dec 2024 00:41:37 +0100
Message-Id: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208397

This patchset will resolve styhead cve from cve metrics to match master
and scarthgap. It contains only cherry-picks from scarthgap plus
cherry-pick from kirkstone-next for qemu patch.
curl and qemu patches needed some love to apply and were tested.

With current NVD situation it's not much, but searching trough
scarthgap and master patches is a tedious work which will take time.

Hitendra Prajapati (2):
  ghostscript: upgrade 10.03.1 -> 10.04.0
  libarchive: fix CVE-2024-48957 & CVE-2024-48958

Peter Marko (4):
  builder: set CVE_PRODUCT
  qemu: patch CVE-2024-6505
  curl: patch CVE-2024-9681
  rust: ignore CVE-2024-43402

Ross Burton (1):
  libsndfile1: backport the fix for CVE-2024-50612

 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-6505.patch             |  40 ++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 .../avoid-host-contamination.patch            |   6 +-
 ...ript_10.03.1.bb => ghostscript_10.04.0.bb} |   2 +-
 .../libarchive/CVE-2024-48957.patch           |  36 ++
 .../libarchive/CVE-2024-48958.patch           |  40 ++
 .../libarchive/libarchive_3.7.4.bb            |   5 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |   3 +-
 .../libsndfile1/CVE-2024-50612.patch          | 409 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2024-9681.patch             |  85 ++++
 meta/recipes-support/curl/curl_8.9.1.bb       |   1 +
 13 files changed, 624 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch

-- 
2.30.2


