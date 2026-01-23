Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EC2D6CFA7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 12:33:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66812.1769171630971792035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 04:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TzSlOl7/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260123123347c35cd5f548000207b9-rnsadw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260123123347c35cd5f548000207b9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Jan 2026 13:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WZOJWp0g7eVW6L2nyzXL4IVrLY4ULrG1ZeJYoD9x7Us=;
 b=TzSlOl7/0+rrdqmeMecaa7JtSH6ODb3RWwqlPhKj7KdSTFzdTfjK7Y82ySBsF8RMhgK8v7
 QCRCYFQt12ZbEluP72fQYomWmLM2JprkXFjbE/WjnOQMBofQXzcKrpfAOqOcCny4tyyyZ36P
 bC5ZeuDLSpgTVZgRbt/wZlCO14JxOMebOUTsbF4WTjkOUS+9qvQQm7pK2FOR+qOqCUxvIK4R
 bXrjXf0FjTkiwNMeXNKHsjGSiL6RkIfuc3sIaJi29KWMtr6zfxkA9gydU/UwzM6hEZbq2POz
 lC47UiJo7TULR2pfEJi88VGmr9oIKrXkm9Dm+BcUgSst3R+uGb7b9CFg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 -> 3.5.4
Date: Fri, 23 Jan 2026 13:33:35 +0100
Message-Id: <20260123123336.41126-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 12:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229884

Intention of this RFC is to run full autobuilder job matrix to see if
there are any failures not detected by my local testsuite.

Topic for discussion is especially what should be the final form of this
upgrade as some users may want to stay on openssl 3.2.x originally
shipped with Yocto 5.0 Scarthgap.
Current form was chosen to easily review recipe/patch differences.
Is it fine to overwrite or do we need to keep both version and make one
the default and other optional? Which would be tested on AB?

Peter Marko (1):
  openssl: upgrade 3.2.6 -> 3.5.4

 .../openssl/files/environment.d-openssl.sh    |  9 ++-
 ...ke-history-reporting-when-test-fails.patch | 19 +++--
 ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
 .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
 .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
 .../{openssl_3.2.6.bb => openssl_3.5.4.bb}    | 76 +++++++++++++------
 7 files changed, 116 insertions(+), 94 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb => openssl_3.5.4.bb} (75%)


