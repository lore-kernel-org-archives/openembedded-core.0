Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FF6C55183
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32609.1771565686307896284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KvfSKjRc;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5197; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=34/mb+ioIaonp0sVCnYCfzk5JAar0VTY3CzeKJSJNmQ=;
  b=KvfSKjRcrsXf0bcFTc8FSqK/HXTi04R/wHy8FBJWqqJqAyvO8J7FPe0i
   XSB9zcOeZoUFEULvhZKCAkLTIHA2sqxgWjSiy7zT3nR/1pccbG495QofC
   Yt+L6p4eeVLtZc043i9NoL7fFPagp1jt54L8N+K20yPJOgZH+A+30iQh5
   2eLeZoLu+VMzaULkjQR98q7tTA01p8ufVmzdMHMY+gBJTIEbBlV1MEAkS
   Yhtl3jZ6oLcw4OLrok9qwpg7oC9aZdI8jd4tw/gyIy/LLdbkPrlmKg4M0
   zUS4Jbm+rXRr1fsHz/PoBgifqAU8rA730FJTbBHuNP6b/TTWk6J+qjG0n
   g==;
X-CSE-ConnectionGUID: dvgy7YhCSliNQBc4rUJ/DQ==
X-CSE-MsgGUID: JwDK72nLRWuYl7+zrRdSaA==
X-IPAS-Result: =?us-ascii?q?A0BGBAC68Zdp/47/Ja1aglmCSA9xX0JJA5ZIA54agX8PA?=
 =?us-ascii?q?QEBDy4PFAQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDATEBRhAgJgsnBCsZgwIBgnMCAREGpziCLIEBg?=
 =?us-ascii?q?1oCAwkCQ9t1AQsUAYE4hTyIGVoahHonGxuBcoR9gmEBAQEBAReBDYZ9BIIig?=
 =?us-ascii?q?Q6NQoYNSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFh1MPiQV4b?=
 =?us-ascii?q?oEggRsDCxgNSBEsNxQbBD5uB44vFSqBOC8JPQcBPFEqAiACdgImbJN8kXihD?=
 =?us-ascii?q?goog3SMHo0+h3waM4VbpRCSAIcGizaCU5VnaYRogWg8gVlwFYMiCUkZD45fg?=
 =?us-ascii?q?0KFE7VlIjUCDC4CBwsBAQMJkWqBfQEB?=
IronPort-Data: A9a23:PBVgjapF3Kpp/FbmuB0oAhYyLzpeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmDOPrcM2T0eo8gbYuz9k0OvJKBm9cyTgI9/HxmRiIb9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgbNNwJcaDpOtfrZ8ks355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uppDnARx
 PwzEzQMSCmpjL6s/ZD8ZtA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7Wz1VtEqcuYI84nPYy0p6172F3N/9JILaH54IzhvCz
 o7A10bmLjJFbtq78wWYw3bzxf3Vpy/AUatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:uEhdMq8Bx8z3HZG2JEpuk+DfI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNDU1ZmIK9PoTJ2KDYrAd/OU=
X-Talos-CUID: 9a23:sxCramADy1WUzjD6EyV5+19LK8AOSXnc6k76KBOiNEQuZITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AElxXfwz1DynopywJTRpkQV5QaxKaqIaxJGNSy5M?=
 =?us-ascii?q?igfaZBCgveCWHtjiMS6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="668235852"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 2BA4618000D06;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 85854CC8CFA; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 10/34] cve-check: fix malformed cve status description with : characters
Date: Thu, 19 Feb 2026 21:34:19 -0800
Message-Id: <20260220053443.3006180-10-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231468

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc33dd9176726cb4b2d2f142ed1bc655da8e0a9f)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index c8572d7724..cd152df69a 100644
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

