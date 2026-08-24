Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769C4C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:04 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14071.1787569318477498659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ka2IhGqi;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1291; q=dns/txt;
  s=iport01; t=1787569318; x=1788778918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jhtsf6W4c+sBmuo5LeGQnARVNqymO80n1uG/ehUCXN0=;
  b=Ka2IhGqi33DY/7C5aI49faLUWfeNFxTWoyan8EJWojv9/7htl9jGELzB
   PkF3/fcDQNgQDLxJ5kkOsp0hqsNaBqqVYoNrzKRaJkj81QofRTEbO5yDD
   fM2Y22foZM6QdSiXfn0A6KzXi7+uFAocXRPhkqN0KrVxcLL5jX5Kfdg1O
   6lO9uDnR4muygBzg7cSONd7UhfXzU4n3xVfc50HMNYbZjwvj4Vyjx+s3u
   siblWnxjBnG3r1pprHSwawhNvzuGF9f7+nCeIW6kVy++IpgyXk6LP3yGN
   0qV1NweP1mpKUjkNsIELV5EEJhxDLlSGnrFir6N4E239wuIq9uWjivv2M
   g==;
X-CSE-ConnectionGUID: C9kJKkvrQRuq22h81L0Piw==
X-CSE-MsgGUID: YQWV0goPS4y3jPAocdco9g==
X-IPAS-Result: =?us-ascii?q?A0BCAgAuJIxq/48QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ89FAQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02AUYwXESDAgGCdAMRwjuCLIEBhH3bMAELFAEFgTOFP4gih?=
 =?us-ascii?q?XInGxuBcoEVg2mCYQKBNHmFeASCIoEMhESPFkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylkARIXgQmCBwKCWoIFA?=
 =?us-ascii?q?gFJQw4HRyILGA1IESw3FBkEPm4Hjl4fgkcBPFEZEyCWCJF6oQ8KKIN2jCKVO?=
 =?us-ascii?q?hozhVulES6YWos3glOWUIRpgWg8gVlwFYJuATMJShkPkiPMOScyPwcCBw8Ck?=
 =?us-ascii?q?3EBAQ?=
IronPort-Data: A9a23:r0Lvwa/1aHNUVLJoQCN4DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TYfUW2GbqyMYzT8KIpzaIS1oR5T7J+AnNE1GlZu/ntEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbeSxxZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjhIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kdbI462eVpG1h06
 OVCcjBdNzTbv+OplefTpulE3qzPLeHiOIcZ/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOHWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZC9a4GKIYXaGpk9ckCwl
 1v5wTz2BSkhaM3EywKs9XmgjeieknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:NLcNx689+Mx78XfeuVRuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:T5teUG9YWAUEU+6zSqCVv2VFGeIGcWPH9U3NOhXiCTYwbOWtSEDFrQ==
X-Talos-MUID: 9a23:/Bv0TwtfThdID2oZ2c2ntQhdCp9n5JyVVFFWk60vvMKIPishNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="833731874"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 317AC180005B4;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C23B9CC12A7; Mon, 24 Aug 2026 04:01:56 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] avahi: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:56 -0700
Message-Id: <20260824110156.25632-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244089

From: Devansh Patel <devanshp@cisco.com>

The current "avahi" mapping generates a vendor-wildcard product identity
for the packaged Avahi source.

Use "avahi:avahi", which matches the active NVD dictionary CPE, NVD
configuration criteria, and CNA affected data for the upstream project.

This changes the generated identity from
cpe:2.3:*:*:avahi:0.9~rc5:*:*:*:*:*:*:* to
cpe:2.3:*:avahi:avahi:0.9~rc5:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
with the frozen 2026-08-10 databases has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-connectivity/avahi/avahi_0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.9.bb b/meta/recipes-connectivity/avahi/avahi_0.9.bb
index 7cf0eb2b71..9397baa6ab 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.9.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
@@ -29,6 +29,8 @@ SRC_URI = "git://github.com/avahi/avahi;protocol=https;branch=master;tag=v0.9-rc
 PV = "0.9~rc5"
 SRCREV = "71b640e686964efb27cb708f4457ffaed183c319"
 
+CVE_PRODUCT = "avahi:avahi"
+
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
 
 CVE_STATUS[CVE-2021-26720] = "not-applicable-platform: Issue only affects Debian/SUSE"
-- 
2.35.6

