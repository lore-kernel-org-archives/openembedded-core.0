Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72D7C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:58:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8390.1667545097712823938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xeGTjZyM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667545095; i=@fujitsu.com;
	bh=zOEGMtSJwvOKPpH4umSzT6lekfnT4w3PCofNmtiT1fo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xeGTjZyMNHGbtD3s8dZJul5eiah8V0Xf/QXU2OkU8pwr5m49fM+CSrH946lF0gqy8
	 8XbbTWGbahay3PwSb5YMAg69aV9y6zyVKF4oRNvFwp3o1zq+fXn5hfI127sBMkCnvM
	 S+jzmmXVCxxvFm5UflOkRkc3kOKXeCW4JB19Jj2qUejmZ76MsZUck4aX14RquZgkDh
	 ThJD8vYt8zt+QL2aVDDMcQozNDJh2eiyX5Ao44PShh5JfWLvh+nyoCQSOAOxQsuAZx
	 gGyU0do9AOT+5K/vsOym5H68URB1PSthJNb7Ec7l/A1vBzfG7LTyHqmLi2zj0wZ9BX
	 f3nRstCwuJmNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRWlGSWpSXmKPExsViZ8ORqMu+IyX
  Z4Ms8Dos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePCzP9MBdc4K15svszSwPiQo4uRi0NI4DGj
  xJQHx1khnGtMEvtnXmeCcPYzSmy7vYmxi5GTg01AQWLh1jNAVRwcIgJ6Elf/iYKEhQWcJE4e7
  mADsVkEVCTu3LvCDFLCK+AusfJnNkhYAqhzysP3zCA2r4CgxMmZT1hAbGYBCYmDL16AlUsIKE
  rMni4PUV4hMWtWGxOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo1lxalFZapGukV5SUWZ6RkluYma
  OXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5easkmRmDApRQnh+1g7F36R+8QoyQH
  k5Iobx1vSrIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd68bUA5waLU9NSKtMwcYPDDpCU4eJREe
  H/PA0rzFhck5hZnpkOkTjEqSonzngbpEwBJZJTmwbXBIu4So6yUMC8jAwODEE9BalFuZgmq/C
  tGcQ5GJWHecJApPJl5JXDTXwEtZgJavK06CWRxSSJCSqqBqd/AW7zkczGThFz+lR35f1ivPi4
  M2LboR5trzD+2st9l54WEJ93SbvxpXP1Y8XKumHfGr3Wcyo1rDcXZJV0CQtyE3baqqs64VLLV
  Kqmou8M6lfOJFmv6/AN7pE8znLTVneG8d8XnqgOWt7mMzF/yTl/9aMu/Ew0dVW4SvMdDj0987
  BDzWPjy8mm/5082yUqV5XM6vmBjqdw123s96yt6M1l+rThSljKtNF6Uf8vEVXt/cFsnvOV2PF
  F32Jyn4nof34bcR95C2333R6eFlpuE7je+W7rE7PJup3vXzjMXRd965DtDqKKRM2CPf83urd8
  meP5edEWQ27Sn2e/G786CZ89qj83JTnx9q8imfdNSJZbijERDLeai4kQA3GhKETMDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1667545094!27080!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17749 invoked from network); 4 Nov 2022 06:58:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:58:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9A3D010019E
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:58:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8E6F810019D
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:58:14 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:58:13 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.23.3 -> 1.23.4
Date: Fri, 4 Nov 2022 14:58:00 +0800
Message-ID: <1667545080-2494-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172699

Changelog:
https://github.com/numpy/numpy/releases/tag/v1.23.4

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-numpy_1.23.3.bb => python3-numpy_1.23.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.23.3.bb => python3-numpy_1.23.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.3.bb b/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.23.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.23.4.bb
index 9d086aedfd..d9172692b5 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "51bf49c0cd1d52be0a240aa66f3458afc4b95d8993d2d04f0d91fa60c10af6cd"
+SRC_URI[sha256sum] = "ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 
-- 
2.25.1


