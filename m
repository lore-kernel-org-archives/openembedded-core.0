Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E156CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:00:40 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2389.1791018030165935189
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 02:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z/9uNh/w;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=861; q=dns/txt;
  s=iport01; t=1791018030; x=1792227630;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J53WaxcEtYjPzKxFceEx4+MPvQGDY041rfS34p+LlkY=;
  b=Z/9uNh/wpqzQk5lNTW5BOKTEJkZxvRdV9RKxtlDx+m8TVxYi8rahSAQ1
   J3l9+Jmv12PG56AVhphIgn1HUjSUGH+lMgBDBmrE6V6mm4sYPO6LBILxg
   hxnF/yjbhyBg7GnIPNi8PynipjOLPV49YRI3TUPnDkjb1Evmnii0S/wFz
   7+KA9mKCEbl7lwp5Wz+9CvrexkKnFAIveq+fqxC61tl8zmLvu1K1DZbK2
   HSWk0sQxOo62lV0COU9CiTNgrKlNNIusckgvqjym2fmK2sNALTh9caFYA
   MrDOUqe1BGG5xGA9cM2rzUVrM0+xj+4TZa3Pab9c4rm67d8nGe61zGQ37
   w==;
X-CSE-ConnectionGUID: /69Zsf7ZSUi9J1T1rRwG9Q==
X-CSE-MsgGUID: tVoBa9IDTsmE3xiDe5srFg==
X-IPAS-Result: =?us-ascii?q?A0BCAgDXwsBq/4//Ja1aglmCV3VgQ0mTWQGhDRSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZAVNgEYAS0wXESDAgGCdAO5bDeBWVOBAYMpAYFU2zIBCxQBgTiFQ?=
 =?us-ascii?q?IgjdoR8JxsbgXKEfoQEgQyFeASCInoSgXiTTkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUUSRyYiCBIJARMaMAuBGzg8CShEFwwQGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?FAegmAfb4FGAacHoQ8KKIN2jCKVOhozhVulFJkIpFqEaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+YCMZVJzICPQcCBw8CkXWBH10BAQ?=
IronPort-Data: A9a23:7gG7Y6wmjYNpiPj0sQ56t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 2QYW2uPb/iKamT3fYolPoXkpksFvJ7SyYRnGQA//lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsajlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJAZobL8D9LlFOlxPp
 N5BFGkXVA+s1tvjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwa4ONIIPSHZg9ckCwu
 lzB1W2oIz0mL9mykiqE3n/xnfXhknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:GuJOAKMbQAqq0MBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:nWYlZGEWBw0W5CMJqmIgqh8mAc56QEbgzSbyenPhE1x2Z+ysHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AUlTh9QxoECPFTC5H8dX5sAmfjgeaqLiQD2oEwLQ?=
 =?us-ascii?q?qh9KBGHdgOhuQ0S+tbIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,138,1787011200"; 
   d="scan'208";a="531027005"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Oct 2026 09:00:29 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 066D9180003BF;
	Sat,  3 Oct 2026 09:00:29 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9EC8DCC1611; Sat,  3 Oct 2026 02:00:28 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][PATCH] python3-click: depend on python3-shell for shlex
Date: Sat,  3 Oct 2026 02:00:22 -0700
Message-Id: <20261003090022.3048107-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 09:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247148

From: Darsh Kelaiya <dkelaiya@cisco.com>

Click 8.5.0 imports shlex when loading _termui_impl. OE packages
shlex.py in python3-shell, so add it to the main package's runtime
dependencies. Confirmed module ownership in python3-manifest.json.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-devtools/python/python3-click_8.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.5.0.bb b/meta/recipes-devtools/python/python3-click_8.5.0.bb
index 05a8fb343a..d6017e3d7b 100644
--- a/meta/recipes-devtools/python/python3-click_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.0.bb
@@ -28,6 +28,7 @@ do_install_ptest:append() {
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 RDEPENDS:${PN}-ptest += "coreutils less"
 
-- 
2.35.6


