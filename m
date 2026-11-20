Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2608.1795166597786855317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=dtH540dS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-202611200923149f0f517b3400020708-11ddda@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202611200923149f0f517b3400020708
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Nov 2026 10:23:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9zzkYORqKx7+a0oskRk60X/zk0AUOK3bYIG/M2p2MQE=;
 b=dtH540dSlDu/SDb19mpPIxBZHS2ytXKdKoKzvrrvJGts1HhTF6t4+hP3YW/c/dkToMEqXT
 gf1SD3XJ6RFgmPBR4+ipGCxeRnDxRiCKH0iS3Gf1trDXuYcwQlIQoA4evz2Tz2iZnZ3qa7cT
 VZacrHpsTNIZbqIIIoGZ2/xmcBBOPSeykbzzuvmtN1fCNSgK3F5H1k3KzrNHiQ7teMSi/MK7
 3NjIZwUfKsdGdgJ15ob+TsYlWzrnGhe/cLWmZRS5XqcIAAxznmcSHRoSlOHIiwsmqCsEboMA
 ydfBkVSSa2Fpygkfap33ZM2bycVJ3lj2rLw+1ks+SMu6i9JbY67BLJrA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH 0/2] Scope global CVE exclusions by product
Date: Fri, 20 Nov 2026 10:23:07 +0100
Message-Id: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250752
Content-Type: text/plain; charset="utf-8"

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The Scarthgap SPDX 3.0 backport did not bring over product filtering
for CVE_STATUS assessments. As a result, global exclusions can appear
in CVE-check and SPDX/VEX reports for recipes they do not apply to.

The first patch adapts Wrynose's parser and matcher while retaining
Scarthgap's existing APIs and the behavior of unscoped entries. The
second qualifies the existing global exclusions without adding or
removing assessments.

Peter Tatrai (2):
  cve-check: keep global CVE exclusions out of unrelated reports
  cve-exclusions: qualify global assessments by product

 meta/classes/vex.bbclass                      |  1 -
 .../distro/include/cve-extra-exclusions.inc   | 24 +++---
 meta/lib/oe/cve_check.py                      | 76 +++++++++++++++++--
 meta/lib/oe/spdx30_tasks.py                   |  1 -
 meta/lib/oeqa/selftest/cases/cve_check.py     | 48 ++++++++++++
 5 files changed, 129 insertions(+), 21 deletions(-)


base-commit: fc4316861becc9f0d41857b49f6438929ab4c291
-- 
2.39.5

