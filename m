Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B459F531D6
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:28 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3543.1776114978132225658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=iPrbmVd3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202604132116167db5b6cbfb00020729-f7fu5h@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202604132116167db5b6cbfb00020729
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7ZHPUstQTVI6uG2LhgkV15alJlteJ13TE/aklkCzlBo=;
 b=iPrbmVd3S51BW0Hep25eBrZtUp+/Ccla4fAOVkO/IxQyA0V81w90LDdJ4TcymIUi9xHTYw
 /73o03iK9GylU5w6j5I6TxdwF/pkMQj8nT3EBQlT6MvAxkg1gM28KvnndhMXVz41g2VifLq3
 LvY6q5MSHIJgaYOHOqht+KOXPnjaKeplIHizOrUucUfHe5QF2DizTNCdVrSIgbEAtGbvC57U
 pbTdLTeg4UnPb+soLW0sFfF7nhIU6smJHvWjlWdEl2c0C52niRvin0PaSatPRGDAUOGqH2Tg
 sKEzwnfbgoB0LVVcWnKAnjittwBHx/M49VQIfzBIu1OCcCMmROGlrpDA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/6] screen: set status for CVE-2025-46802
Date: Mon, 13 Apr 2026 23:14:45 +0200
Message-ID: <20260413211447.564257-4-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-1-peter.marko@siemens.com>
References: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235126

From: Peter Marko <peter.marko@siemens.com>

This CVE is showing in the new sbom CVE reports.
It is fixed via [1] which is included in:

$git tag --contains d10eb5b2f7eebaa347f09c010bd391373fdd1695
v.5.0.1

[1] https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=d10eb5b2f7eebaa347f09c010bd391373fdd1695

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/screen/screen_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/screen/screen_5.0.1.bb b/meta/recipes-extended/screen/screen_5.0.1.bb
index 69f4098519..0155ece374 100644
--- a/meta/recipes-extended/screen/screen_5.0.1.bb
+++ b/meta/recipes-extended/screen/screen_5.0.1.bb
@@ -44,3 +44,5 @@ pkg_postinst:${PN} () {
 pkg_postrm:${PN} () {
 	printf "$(grep -v "^${bindir}/screen$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
 }
+
+CVE_STATUS[CVE-2025-46802] = "fixed-version: fixed since 5.0.1"

