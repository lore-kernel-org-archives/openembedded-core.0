Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6B8D6B6C0
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:51:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.23004.1730314253038204950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JQrTsOQT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241030185051da1f369de46c3e29d1-sxqc4n@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241030185051da1f369de46c3e29d1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 30 Oct 2024 19:50:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2E1PUu27WWFO0rTbwd4CbYeV9WSa9kz+t8fwYDiHR3g=;
 b=JQrTsOQTIb59yjk5JwNB7NsGyH8RsHW7swp/Biao+gISZCX0Os1FN2qzQA9zK9BRm53yZw
 AeNL5GSEAwoJiWrCsyTmaHi4P4KVCoyrhy059bYzA0/Hqc0I9pGucznAClArbKgnv+np93wJ
 zWjK54YrgtCEEWJZDyP1SMgatwtM2t/PjSd+Uu9XJ7gMccmxWK2li4ju/Vz2ehIDFYfGG1MZ
 0ZxQzZD5pI6h/HRTusBHsJmz8CFuB2pzf0rO5dGdtK4bSR1jMGYxrRljywtMuzqAQp6u1/ac
 RJIlNtHO6IQEiKJJ0afuaCtxPGWQgIrJlrcH/i7MYGYVmz1MJBE90tUg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] cve-check: fix malformed cve status description with : characters
Date: Wed, 30 Oct 2024 19:49:51 +0100
Message-Id: <20241030184951.82977-2-peter.marko@siemens.com>
In-Reply-To: <20241030184951.82977-1-peter.marko@siemens.com>
References: <20241030184951.82977-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 18:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206560

From: Peter Marko <peter.marko@siemens.com>

When CPE is not provided and character ":" is in cve status description,
current code takes only last part of split function.
This works only if there is no ":" in description, otherwise it drops
the other split parts.

Do a new split of the original string to take the whole description unchanged.
This fixes following entries from world build of poky+meta-oe+meta-python:

tiff-4.6.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2015-7313
CVE_STATUS:  fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue
description: //security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue
corrected:   Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue

gnupg-2.5.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2022-3219
CVE_STATUS:  upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
description: //dev.gnupg.org/T5993
corrected:   Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35325
CVE_STATUS:  upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303
description: //github.com/yaml/libyaml/issues/303
corrected:   Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35326
CVE_STATUS:  upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
description: //github.com/yaml/libyaml/issues/302
corrected:   Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35328
CVE_STATUS:  upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
description: //github.com/yaml/libyaml/issues/302
corrected:   Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302

cpio-2.15-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2023-7216
CVE_STATUS:  disputed: intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
description: //lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
corrected:   intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html

openssh-9.9p1-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2023-51767
CVE_STATUS:  upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.
description: //bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.
corrected:   It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.

cups-2.4.10-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2021-25317
CVE_STATUS:  not-applicable-config: This concerns /var/log/cups having lp ownership, our /var/log/cups is root:root, so this doesn't apply.
description: root, so this doesn't apply.
corrected:   This concerns /var/log/cups having lp ownership, our /var/log/cups is root:root, so this doesn't apply.

unzip-1_6.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2008-0888
CVE_STATUS:  fixed-version: Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
description: //bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
corrected:   Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source

syslog-ng-4.7.0-r0 do_cve_check: CVE_STATUS with 6 parts for CVE-2022-38725
CVE_STATUS:  cpe-incorrect: cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32
description: syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32
corrected:   cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 268adfb528..647a94f5af 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -257,7 +257,7 @@ def decode_cve_status(d, cve):
     else:
         # Other case: no CPE, the syntax is then:
         # detail: description
-        description = status_split[len(status_split)-1].strip() if (len(status_split) > 1) else ""
+        description = status.split(':', 1)[1].strip() if (len(status_split) > 1) else ""
 
     status_out["vendor"] = vendor
     status_out["product"] = product
-- 
2.30.2


