Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F94D711A6
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:14:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1703.1766088888314681716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=OVQ27z7o;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202512182014458f92ad9df2000207cf-m_m2z8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202512182014458f92ad9df2000207cf
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Dec 2025 21:14:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=k16iXas7XbTahZGxIgO5QiWmNglHBwOSsPmomSER8sA=;
 b=OVQ27z7oyIotd+Zpovs/tF46x7uy91Ajdos8XG8zBQOOgCaMIrsDOAv1Hb7/zrdpIyUpw8
 PMgvo/D6Hb/uI91GfuD2k2KRGDejdrGr4kvCDo5SxfVWf/Rs2qr5RCOx3waCIeXIOo9zeWWY
 6MHHfIw8KeCxQ0A8ymVE6gnbHj5I13QC96xRB2x5UYOU6wXdegQDOFbgDre5Ck0KaltRrGED
 juPjZtvfUlTRTOFxktlHQnvBHXvIYLsDtslaDwRidowk/YSGAudHPxSx2PqANSFACx51PtwN
 ThBXv7NssK5w0tf9g1+opQR2gFjVr+0GVnHi/aXtzbf9JyI+ziOKuvYQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] kernel-fitimage: Add FIT_CONF_MAPPINGS for flexible DTB configuration
Date: Thu, 18 Dec 2025 21:14:02 +0100
Message-ID: <20251218201432.1608259-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228141

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Currently, the kernel-fit-image class creates a strict 1-to-1 mapping between
DTB filenames and FIT configuration node names. This limitation becomes
problematic in several scenarios.

This patch series introduces a new FIT_CONF_MAPPINGS variable that provides
flexibility in naming and organizing FIT image configuration nodes for DTB files.
Two mapping types are implemented: dtb-conf (renames configuration nodes) and
dtb-extra-conf (creates additional configurations). The design allows for
additional mapping types in the future.

Adrian Freihofer (2):
  kernel-fitimage: Add FIT_CONF_MAPPINGS for flexible DTB configuration
  oe-selftest: fitimage: support FIT_CONF_MAPPINGS

 meta/classes-recipe/kernel-fit-image.bbclass |  2 +-
 meta/conf/image-fitimage.conf                | 12 +++
 meta/lib/oe/fitimage.py                      | 57 ++++++++++-
 meta/lib/oeqa/selftest/cases/fitimage.py     | 99 +++++++++++++++++++-
 4 files changed, 160 insertions(+), 10 deletions(-)

-- 
2.52.0


