Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47921CA5FE3
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:04:10 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2423.1791018247458661956
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 02:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QjWcEIKa;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=850; q=dns/txt;
  s=iport01; t=1791018247; x=1792227847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WNl8ddxH0XXbpC+JlDSa2935zT/e7TtZ6Ndoai2lCcU=;
  b=QjWcEIKa8BXSSf0zSieMjNvekA/uApLzf7k/K5LRQA/kp3IccujSRTx9
   2I4QtnAyX9RGl3/aWS9SK/835iAzrwPyKzlTXDat2B2SUUgGLPxyZScLu
   uaiFfTvBPUHFmf/Ffr2BpJmHqn+e7/rrUwz/vURU+oVxNmu35U9UVunNO
   j+hVn9M8eEyCDvpGilvh3vPqpZTOAqQpGyJA9IqroopviA41eMCodIcFL
   cPxQvqpRCjdfVZ5Tq410CgHnGFizSNrN4fNu4vVVExwYWyAcNJaY31LGT
   +8UgPtwQvHq6g+V7cQ3H+jPdkTm1QRKIdMvB+BRVT0Cqd2/FAF9aAzyY5
   Q==;
X-CSE-ConnectionGUID: dZA/kHRER8W7nuV+gkQgjA==
X-CSE-MsgGUID: AurM29exT6a1Lq0aQ0Y2MQ==
X-IPAS-Result: =?us-ascii?q?A0DEAgBOxMBq/5X/Ja1aglmCV3VgQ0mTWQGhDRSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4LAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZAVNgEYAS0wXESDAgGCdAO5ZDeBWVOBAYMpAYFU2zIBCxQBgTiFQ?=
 =?us-ascii?q?IgjdoR8JxsbgXKEfoQEgQyFeASCInoSgXiTTkiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUUSRyYiCBIJARMaMAuBGzg8CShEFwwQGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?FAegmAfb4FGAacHoQ8KKIN2jCKVOhozhVulFJkIpFqEaYFpATqBWXAVgyIJS?=
 =?us-ascii?q?hkPmAjGVScyAjsCBwIHDgMLkWqBH10BAQ?=
IronPort-Data: A9a23:PBYHza6B+h9EnDbLfNzUeQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mZLDGqBOKzbM2rxftpwYIzloUhQv8eBzdIwHAA+/yhgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpMsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMb8xveVXO0x0p
 cNHLi0zLR+Avu206efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeOIoXQG5oKwS50o
 Erv4n7cWEAXJODBwGOh6yqlv7f+xwbCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:RethuKla80Qjd2xajTvjM4vvKsnpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:Pchig2w4NlFuzza5fYO1BgUYKOlicV3n4U2AHBC+FFgqR76sRl25rfY=
X-Talos-MUID: 9a23:RfE21Qg+FQFpmWnEx4SBKsMpHdpyxv7/BVAxz5xfn9DcPBUoCm24tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,138,1787011200"; 
   d="scan'208";a="530126777"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Oct 2026 09:04:06 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 27DD0180001DF;
	Sat,  3 Oct 2026 09:04:06 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C3DDBCC1611; Sat,  3 Oct 2026 02:04:05 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-click: depend on python3-shell for shlex
Date: Sat,  3 Oct 2026 02:03:17 -0700
Message-Id: <20261003090317.3051838-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 09:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247149

From: Darsh Kelaiya <dkelaiya@cisco.com>

Click 8.3.3 imports shlex when loading _termui_impl.
OE packages shlex.py in python3-shell, so add it to the main
package runtime dependencies. Confirmed module ownership in
python3-manifest.json.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-devtools/python/python3-click_8.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.3.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
index 9e80f8aff0..44612cb8f3 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -30,6 +30,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 RDEPENDS:${PN}-ptest += "coreutils less"
 
-- 
2.35.6


