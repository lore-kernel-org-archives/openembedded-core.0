Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F127CCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14167.1792122758432712248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=j52ApY5A;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3466; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CGO9+D1YFCeH8wZgt6pK6ELZXEMgjkD/zDTrL+ATKbI=;
  b=j52ApY5A88j4zAthhzLX7FzNyey/DtvW5ZW+zvbSRFu6nr+JaFZHDXmA
   kAxpyYvGtEA9jzh5GCuG6s/6xUdfisEJ15CuO7ScUVP3bPxUMWPjCOjGd
   W42Tb02z5GTDV4GOJhZkNlGp1AiWPfqSJWfJVw+GR8qBDV2yoEE6pT9zr
   SiRlE6/etTBMVFKWoG7MSQk5NIVdmyMEHrvUtE+64YejbAXmQ+X11zQ08
   qNHaoevARWH3M/UT3fJYLqN5weK+MFth2YZ8YCaaVo+tWMl+ukLvrhnTH
   /gTVDm9qUnbsSeoBye5KtNauvEgpNfexg6+nMoYAlwPY0J8TYDB1RuaAz
   A==;
X-CSE-ConnectionGUID: bQvf801sS6eMWRtl14CMkw==
X-CSE-MsgGUID: QPb/XVRLQCSCqEMSSC+IOg==
X-IPAS-Result: =?us-ascii?q?A0AbBACwntFq/4r/Ja1aglmDTGBDSQSTVQGCcJ4fgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWOFwImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFTYBGAEtMFxEgwIBgnQDEbxwgiyBAYMpAYFU2z4VBYEzhUCII?=
 =?us-ascii?q?3aEfCcbG4FyhH6LCASCInoSgyeTekiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoFzcoEPKwQegXEZpXWhDwoog3aMIpU6GjOqb5kIjgqWT4RpgWoCO?=
 =?us-ascii?q?IFZcBWCbgEBMgkKQBkPlzfJRycyAgE6AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:T7Ya96/2G8JsTSQCYUxDDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jEbCjjQPvrbNmTxeN8ga4+2oU4A78eAzoJqHAds+yBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k8BJMWqr4uGloQ+
 NknEiwJN0yoouGplefTpulE3qzPLeHxN48Z/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOE0n1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwa4eEK4fTHJo9ckCwn
 1rMuFTHODUjH+e00BegyUmHxc7oknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:xszuB6CtS8VHZbDlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:x466Um6dCQ+QwXB3Utss/ncKFJB9K2bmknr1HHWkDT81Y5iWVgrF
X-Talos-MUID: 9a23:+P1Z2AZ+Hb02MOBTjgfmwwFcDuNRyJ+FEW0oqq4t+OijOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535993117"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 429B818000312;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E054CCC1611; Thu, 15 Oct 2026 20:52:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 00/10] openssh: Security fixes 
Date: Thu, 15 Oct 2026 20:52:26 -0700
Message-Id: <20261016035236.442896-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247915

From: Hetvi Thakar <hthakar@cisco.com>

This series addresses eleven OpenSSH CVEs in the Wrynose
openssh 10.3p1 recipe. Eight patches backport upstream fixes;
two set CVE_STATUS for issues whose affected platform-specific
code does not apply to the Wrynose Linux build.

The series is based on three OpenSSH patches already submitted
to OE-Core and still under review:

  CVE-2026-73283:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260929035745.321529-1-hthakar@cisco.com/

  CVE-2026-73282:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260929035745.321529-2-hthakar@cisco.com/

  CVE-2026-73281:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20260929035745.321529-3-hthakar@cisco.com/

Those three patches are prerequisites; they are not included or
resent in this ten-patch series.

The upstream-fix backports cover CVE-2026-106584,
CVE-2026-106586, CVE-2026-106587, CVE-2026-106582,
CVE-2026-106585, CVE-2026-106583, CVE-2026-106552,
CVE-2026-106553, and CVE-2026-106555. One patch addresses
both CVE-2026-106553 and CVE-2026-106555.

The CVE_STATUS patches address CVE-2026-106588 and
CVE-2026-106589.

Hetvi Thakar (10):
  openssh: Fix CVE-2026-106584
  openssh: Fix CVE-2026-106586
  openssh: Fix CVE-2026-106587
  openssh: Fix CVE-2026-106582
  openssh: Fix CVE-2026-106585
  openssh: Ignore CVE-2026-106588
  openssh: Ignore CVE-2026-106589
  openssh: Fix CVE-2026-106583
  openssh: Fix CVE-2026-106552
  openssh: Fix CVE-2026-106553 and CVE-2026-106555

 .../openssh/openssh/CVE-2026-106552.patch     |  63 +++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 100 +++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  80 ++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  42 ++++++++
 .../openssh/openssh/CVE-2026-106582.patch     |  97 +++++++++++++++++
 .../openssh/openssh/CVE-2026-106583.patch     |  35 ++++++
 .../openssh/openssh/CVE-2026-106584.patch     |  39 +++++++
 .../openssh/openssh/CVE-2026-106585.patch     |  44 ++++++++
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 101 ++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106587.patch     |  62 +++++++++++
 .../openssh/openssh_10.3p1.bb                 |  14 +++
 13 files changed, 755 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

-- 
2.35.6


