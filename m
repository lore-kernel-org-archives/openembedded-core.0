Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7FCC5AD2B
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3552.1786186332120819974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MvS563S6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026080810520879b52ff70900020793-fap0v_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026080810520879b52ff70900020793
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NRDgPQ0jHMiNZ/mnVFblEphwZ/5IzIuRiBNShoo24RY=;
 b=MvS563S6AV22Yc1NoNw85cP7/R1hwlL3QqP59bsK0XA9Xhm2jAidG8oXtvwGd6WTDQN/Gt
 hWaZ53fIMGmQjnZXfQk598HwiMFvpGgrQl7P4p8G4x7lZMiM91AdwPqmbGIOzl8/4vIDm8th
 mP48FCpgd725QNqwOZ2300cXV/8zdy3HQGYBtErXaczFLOc7QG370frvB6Qof7fe28Ou10es
 2JBmt+uJ41Mlu6MfqYrWx5CZJQyWFDkrzhAjC9jSEpRsYA79V0dgk6P0510RdE7uTaR1Bc9H
 5BoUYrpeCiKSd3UsbXUKz7ZMJZvwpNYdG0OrdUp1gVZh2+MWDzF9m3Fg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Benjamin Robin <benjamin.robin@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Paul Barker <paul@pbarker.dev>,
	Ross Burton <ross.burton@arm.com>
Subject: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Date: Sat,  8 Aug 2026 12:51:36 +0200
Message-ID: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243037

This series updates sbom-cve-check tooling in wrynose to current master.
Unfortunately it shows that having cve-check tooling in upstream
components violates LTS patch acceptance policies.

In this case the most visible is python3-shacl2code (1.0.1 -> 1.1.0),
but also sbom-cve-check-update-nvd-native introduces new features
(which is actually the reason why this upgrade is wanted).
For now this should not be a big issue as all the dependencies are very
new and used exclusively in cve-check, however by time they may be used
in other recipes or tooling, too.

So I am sending this series as RFC to discuss future of CVE checking on
LTS branches.
* should we go with this series as is (possibly updating policy text)?
* or are we stuck with old code for next 3.5 years?
* or separate the tooling to meta-sbom-cve-check which would only have
  master branch to service all currently supported releases?
* or create mixins layer (to be also used by AB cve-metrics jobs)?
* or are there some other suggestions how to rework this series?

My preference would be to have cve-check aligned for all supported
releases (even scarthgap), so I would welcome opinions and discussion
on this topic.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: Yoann Congal <yoann.congal@smile.fr>
Cc: Paul Barker <paul@pbarker.dev>
Cc: Ross Burton <ross.burton@arm.com>

Alexander Kanavin (1):
  python3-shacl2code: upgrade 1.0.1 -> 1.1.0

Benjamin Robin (3):
  python3-sbom-cve-check: update to version 1.3.3
  sbom-cve-check-update-cvelist-native: update to version 2026-08-03
  sbom-cve-check-update-nvd-native: update to version 2026.08.03-000011

Benjamin Robin (Schneider Electric) (4):
  python3-spdx-python-model: update from version 0.0.5 to 0.0.6
  python3-sbom-cve-check: update to version 1.3.2
  sbom-cve-check-update-cvelist-native: update to version 2026-06-24
  sbom-cve-check-update-nvd-native: update to version 2026.06.24-000003

Tim Orling (2):
  sbom-cve-check-update-cvelist-native: -> 2026-07-23
  sbom-cve-check-update-nvd-native: -> 2026.07.23-000007

Wang Mingyu (1):
  sbom-cve-check-update-nvd-native: upgrade 2026.05.07-000006 ->
    2026.06.09-000006

 ...{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} | 2 +-
 ...python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} | 2 +-
 ...-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 ...07.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.0.1.bb => python3-shacl2code_1.1.0.bb} (81%)
 rename meta/recipes-devtools/python/{python3-spdx-python-model_0.0.5.bb => python3-spdx-python-model_0.0.6.bb} (93%)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.3.bb} (82%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} (89%)


