Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E709DD35691
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 08:16:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14224.1769528541620915450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KiXVmwdO;
 spf=pass (domain: est.tech, ip: 52.101.84.41, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNoBbwjMFEO/6YnepCay/dDVTpaai9VQCt4r1FUt62xy4YmSp8qFmxUd10kKve98H6H0m9N/1J64W2aHbfgwcRw3iuc8oH3hHZkf8PcIdNcAiN7T3YaxLkmgn/xUgZwLnufBNZ2++a2/64bM/JSdnjTNjA7ptO8A/qih05I8qPdI8ttzVgDIlhgOylGoG5wIppdRGxgiUjr/ZPm4I9Bu2EiUhg7xHEwA4/cFwBwwIfm++qFgtr/ePzGcebrwdxPc3Wa6OS4yRwrrk3U80k3osw6yv/c/QXNmzE3VfKDOQ88bZWTlke7CobUkSvHWe7Hs1VRofL7CDd34kwMVPBwUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=ira9/QTPmOx3Aybuomo1sASRDb0mhtIE+TfKz+2eqqQC22iMTSfFgUGztgEOfSlilfa12DhU00zfLghLr80cSR49SJDdWQvbvu5GhV3+0qwpGTz1gzOEvSQygVccseqayVYDnW1je1Tr1JVCpOrtwbGTbyQAmzJt25Jvc27Bnj3RE4/lUQLFzdK7zb7gh+nWPBxs7qa4ZD9x077Qc5A5SSJyv/DFBAy5VewFJOPD2AynYEZJoqXBWyzTFdYpGrIlyvQRlYmWMh53HLcSQ4ZgQ66tJm7D0pvG/8/lBaiEUB0JK5/KMDuDQXVIZOHOex/3lUONeRzAPY/a7Bf+FWFPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=KiXVmwdOdtNEYwucRZm7QXcLdBvG8z/qe7JfhgXQqP+n4IJVnypNKFZufp40BI84sVc6Ia2SB+cPDA3mYJrYTcvF+PbuBYsf/VZwKXSvt9SgsgJkl6WW0FUYOwWxaOE5C7Ip13oRq+l8MXLGXVRcRh1XpkNmYQ75kZUa2Iaz7HecjXXLUNUWtnyCOOuizMATGfI/R0HdV7peXoc5RHOAOOLOwM64dnfqNecnmNAL1kNbpJZOw7jbRosTrdNzu7z5j7vzvZ7cV6R0VzeNUn29tbljnGdWmLQPUYXfmZq3obg50vT08LzAAVk68fAYmNJzfuEGmXVNhWNpoGMVIB/5Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPF7FA5BEBDF.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a96) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 15:42:17 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:42:17 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v2] Backport fix for CVE-2026-21441 Python3 urllib3
Date: Tue, 27 Jan 2026 16:42:11 +0100
Message-ID: <20260127154214.97186-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU2PPF7FA5BEBDF:EE_
X-MS-Office365-Filtering-Correlation-Id: 25633c68-971b-4d51-cd82-08de5dbaa6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gxGSHyWSuV7u6gMstB4mwt5/g9igXe7ffEjsGRSM9ViBr8C2E1wrN3f1gOah?=
 =?us-ascii?Q?ity+jbUIV4syp0Fieo5L55ia+ddiiW7b30SJ9a4AX+yRh6UVRFIix8Ngf71I?=
 =?us-ascii?Q?4YuG8tJozFB9M/TuAFc9zxqh5JijU1gGh7c0d7WiJHRm2UThVBaRUJusLI9h?=
 =?us-ascii?Q?sNlXi21RtvFNJgUdz++o22Kp8DlTmsePp0+pCxRiVnFhBE2aSEVdXyvEXjH8?=
 =?us-ascii?Q?OzUS4k/mLy71reE5HdjcsLXo6R3CVwwnpj2t3hCCwuWDrUFCTjQimgbxOEJg?=
 =?us-ascii?Q?xTOygYOlJYmLaWKTiFuaRk5S5voNZPlbw0TolrWt5mUevrmaK2/mwKt6p+qh?=
 =?us-ascii?Q?Iqc31ECzcwaRC+J7yAB6MfknM7MZmBSO5oiL2EDeUBtYDo/gd8wIZtQsFB1n?=
 =?us-ascii?Q?eNfNQhlzqqj7XYF2kjCKsotsT3aw/lTaEyfWyr9vgnNUPVm+CM6RQJiUOXEG?=
 =?us-ascii?Q?GNZiQC3IUV/RoIyshOyLBDVnfEatRhwhtaC9My6n8z3In+076fswficxx75h?=
 =?us-ascii?Q?mh0OpXBetBfkIjFp9oBcqmUh2f3gYg1N+Rmwa4kBdEsonvuhU85hpXo6KvwJ?=
 =?us-ascii?Q?eNl3vqYZchfsEOrqs5jiXDTgD/cz6WQ2tOqTxfQAlxPYQFBO1bm8hzNjop7H?=
 =?us-ascii?Q?S+CB6x1gPOWNlMbCUo1JHPP0bUv448UDvZHfO5ede8iNT2/DWMWFeMY1wYxG?=
 =?us-ascii?Q?ExhKJFKr8YijVDAMQMkXh723y+pcWPZf3YsKZwC+vRcmYQEXFapquW2VmNr6?=
 =?us-ascii?Q?iRKxyOzzLk4s6Apq+Mv2a2NFhli3MwZNuRGFf5maXQODufk7Q/kPxAo58VTX?=
 =?us-ascii?Q?9CzHFmo4EDhUHIhSBuFnFlQPblj/eBz07preXA1EyiGQiAV4FbZYt71nhnGt?=
 =?us-ascii?Q?+KtPOE9qYqZ6Eg9a+o3fKGuFoeGq3qFssN0dlX39xgQ55a09OVa72LmaCF/T?=
 =?us-ascii?Q?UndEeOS9BAtIX2Mhjj0QAZUlL+SR1/xr95jKV2N8uty+PSSTDpmIbwQ8Pilw?=
 =?us-ascii?Q?UPGYJ93JYm6danDxr1dFAMV6aI0dxadxQvWOzgwsbPQ36OhZCw0XUc/B5W4l?=
 =?us-ascii?Q?U1WebXZwUnKsAh66Xk9hFG/ZPrLD8+Yw372V/3bP+zQWUH+cNvbrvSVZkZul?=
 =?us-ascii?Q?N0GKE1XwWJ/q3h+3gOCEPhv6Bh9EiiPSzCKkOT9g8XpsMN+BpWsyekzrvbfI?=
 =?us-ascii?Q?QVezRxXSRS8CBcChh2xWdTpAT222T5j2AfrzKf9xXxv9prBrNy3xFWl0bFMg?=
 =?us-ascii?Q?MUsQfWaxHk1zZrLlTfekm/4JlCQcPIG53iWVKJe7T3gftvcWOWkmKMPUACey?=
 =?us-ascii?Q?8Anza4ymA+G3udZFBD4YJC4/xUOpCmZGE7A2L/Aj6geYVgckG71DnnGfXjAg?=
 =?us-ascii?Q?3nhjdyCcCObeqK6La9Ru8AHR3v/QlWsB7w2JR9V2uYoH380HNNNvu8JW63EI?=
 =?us-ascii?Q?jSyY4i/QB6p+x5vlibOVmehMtOCN+CSef/42gx20J91FK2h3e81IoRZAEE+Z?=
 =?us-ascii?Q?7TEtMn+mwAHnx9r5TJX0Fxw4QczJ6Y16yEnCHq2IZ+kvaPSedfuGEghEURqP?=
 =?us-ascii?Q?6axBnRAVY4BffjrWVVo65/oW53SAnhkZwU3TaDiP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3DkPBXsfFF0gx8Nwvd838BH3pttFE0hp2r0afz3Q6hVJB0SOtamMAl315qni?=
 =?us-ascii?Q?e6DEUqJdhIUwQlkJ4hUGXxNfnS75picRTtCA/VRIXOJ1Rq0wwgg6Ok0xLh9f?=
 =?us-ascii?Q?ucNcg2wAnPgw3I8DO/i3SSjf3+YdgdGsbI8qNC+Op0aw1Ia0TsuYVfRLDiyR?=
 =?us-ascii?Q?Ok5RInbyVVAv974iT66J2YCEooSQui4ECJ3PIZfbyu7Pg90bGqf9zbrSwAil?=
 =?us-ascii?Q?W206vAHQa7ZZwPBrkiz+m1oR0o022FMNmcm1iV/IUxghom7Jm1yqeUFDqJ64?=
 =?us-ascii?Q?j8nGDgMigBQTzrz+U1mG7y3IG315wuJrSkS6gCB1yMW4+x3PZbp9sFB4ocMm?=
 =?us-ascii?Q?Je31f9U9R02xw1jpGmRWNFYAh457fQ3o/f4W09ZHlKKvnHZvORJUagouIZIc?=
 =?us-ascii?Q?yU9sciqnxyVndMbtneYlpEUEGcyvEIWYYWOk7UYk0r1NxqpAb3dUAWla16+P?=
 =?us-ascii?Q?xJBDofU2QzYCCEKEhMRZnmdsk0RolbDvOXhkjulTuW3nZ/B5iTsJ/7GWnu5X?=
 =?us-ascii?Q?X007rKbpkxtEXqbb7X0MGMlLozUTvC3XV0+/e1T3OLYp3IFJWLnZfKeg/P2w?=
 =?us-ascii?Q?8vkzZ6bJdFzqD1qGt7MzjY2pR6Ng9FknyFmLfxbaAIJrIc7K1PQ+V+2lALWT?=
 =?us-ascii?Q?rDkxGPRux/sv33psgWp4nRqzDuPDgWmhHk7mBVwza/lDiG2RSminqA8+tbNf?=
 =?us-ascii?Q?iYl4Qm2bPuBznaEKsZ7RAfaLr4L99r9vS78JSQ7qvaJfoOz91M3o98JhaK66?=
 =?us-ascii?Q?PWAotIhDxp3npxsAmFtW9YWtcLEFksg18yY4n9rLykRjCk7RTQ+yar6nxVH5?=
 =?us-ascii?Q?Rz4wDJCnvqhW5ePquCGYOSIoEFsHk73XybMaJOdHYw10E7P+vjs8CXujkRXM?=
 =?us-ascii?Q?SzlN24a7pq/9KIqFsv+xuN4KE7GRP32wgWlnrZVc/QQWnw+OS7PCuVu8xzmA?=
 =?us-ascii?Q?AQh3DHoYi6k8Rhvgcs/e0C5ew7ORUMpZx/6SgXbhd1NgeLevT9A3gy/ur2S8?=
 =?us-ascii?Q?BtcYSErwFOUWmiM5J4aolm9TQcBP3iAVyD8mHwWH297iQXTpak+UefHMvaV+?=
 =?us-ascii?Q?Ite8V62QcK9WixZ6UuY6L9wn479zTvFtVH2CBgJ++RvsHcn3W4pGyS+jbKar?=
 =?us-ascii?Q?t0zGrHTThox5we1ju0nOWPJFkMBG5IF6jhJ0d74L+kZ1pKvXF8cmSZ8+YxTJ?=
 =?us-ascii?Q?nLxP2IcvHekye250c+SH1q/nHkhQOoORlJy8OqLZAcIUQ97ooCR9Nze1ANkf?=
 =?us-ascii?Q?FZqbNQLYR8g/b4nJXSZfRzdfr5wkfkAkPrDS0HqSsDHpZz+4EKqqnOjbHj1G?=
 =?us-ascii?Q?uSxCTqaxyAVfN/rNOMTPduYJ01a0sABUArDo0DSudzDkufM9A6qWmYCv26wN?=
 =?us-ascii?Q?qZBks1S/0O0u6i80Bb6IuRuFGJ30h6CHjLUakeh8QD7Fr/IJ08b8pVsNqVGB?=
 =?us-ascii?Q?GDwvw5QO7Huk5xgbXfLgJCyGAN9SscWxvmX82VRaeJ2Q7kWTEPNex3ZkM7cu?=
 =?us-ascii?Q?vyC0yww5yz0wD9qJ96bj0/kapmiGXILuTyLQc8GW0Vib76rz6g4CUbnzVFPN?=
 =?us-ascii?Q?1Zr9IzBIJ3Svvut09U8eMEOlTD5UHlVt9Gpl7W/+8LeRDoDMF62ISCvd1fi/?=
 =?us-ascii?Q?jZtgS32I8E648Gn5lHFNREU0sQZ8oiyCY/a56N+LzqQT2VwDcI8PlHSbhlXE?=
 =?us-ascii?Q?cQL+bPu9vYMAbRBCpe3YFbDIweFMUZ5BjKERI9BdyiDkO0mD3i5f1x23REta?=
 =?us-ascii?Q?tMdbC1a2RYsx9DaGOhhyF1gjihqvpy8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25633c68-971b-4d51-cd82-08de5dbaa6c9
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:42:17.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cK+HxVu2gA/u5xRyLHqftnLblcmad7gExheZjf/uMacbKATk8BFwrIu1j9KGIOglUlTkbY+lPSqBlrOOvuFY+/bQPn3vxwMpn1b+cNBbMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF7FA5BEBDF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230084

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report : https://nvd.nist.gov/vuln/deta=
il/CVE-2026-21441
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-2=
1441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 0000000000..16af67af31
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
@@ -0,0 +1,105 @@
+From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 7 Jan 2026 18:07:30 +0200
+Subject: [PATCH] Backport fix CVE-2026-21441 python urllib3
+
+Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
+Original-author: Illia Volochii <illia.volochii@gmail.com>
+
+Bugfixes
+--------
+
+- Fixed a high-severity security issue where decompression-bomb safeguards=
 of
+  the streaming API were bypassed when HTTP redirects were followed.
+  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advis=
ories/GHSA-38jv-5279-wg99>`__)
+
+* Stop decoding response content during redirects needlessly
+
+* Rename the new query parameter
+
+* Add a changelog entry
+
+Fixes CVE-2026-21441
+CVE: CVE-2026-21441
+
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864a=
c407bba8607950025e0979c4c69bc7abc7b]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ dummyserver/app.py                           |  8 +++++++-
+ src/urllib3/response.py                      |  6 +++++-
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 9fc9d1b7..c4978152 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -233,10 +233,16 @@ async def redirect() -> ResponseReturnValue:
+     values =3D await request.values
+     target =3D values.get("target", "/")
+     status =3D values.get("status", "303 See Other")
++    compressed =3D values.get("compressed") =3D=3D "true"
+     status_code =3D status.split(" ")[0]
+=20
+     headers =3D [("Location", target)]
+-    return await make_response("", status_code, headers)
++    if compressed:
++        headers.append(("Content-Encoding", "gzip"))
++        data =3D gzip.compress(b"foo")
++    else:
++        data =3D b""
++    return await make_response(data, status_code, headers)
+=20
+=20
+ @hypercorn_app.route("/redirect_after")
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index a0273d65..909da62b 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
+         Unread data in the HTTPResponse connection blocks the connection =
from being released back to the pool.
+         """
+         try:
+-            self.read()
++            self.read(
++                # Do not spend resources decoding the content unless
++                # decoding has already been initiated.
++                decode_content=3Dself._has_decoded_content,
++            )
+         except (HTTPError, OSError, BaseSSLError, HTTPException):
+             pass
+=20
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dumm=
yserver/test_connectionpool.py
+index 4fbe6a4f..ebcdf9bf 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase=
):
+             assert r.status =3D=3D 200
+             assert r.data =3D=3D b"Dummy server!"
+=20
++    @mock.patch("urllib3.response.GzipDecoder.decompress")
++    def test_no_decoding_with_redirect_when_preload_disabled(
++        self, gzip_decompress: mock.MagicMock
++    ) -> None:
++        """
++        Test that urllib3 does not attempt to decode a gzipped redirect
++        response when `preload_content` is set to `False`.
++        """
++        with HTTPConnectionPool(self.host, self.port) as pool:
++            # Three requests are expected: two redirects and one final / =
200 OK.
++            response =3D pool.request(
++                "GET",
++                "/redirect",
++                fields=3D{"target": "/redirect?compressed=3Dtrue", "compr=
essed": "true"},
++                preload_content=3DFalse,
++            )
++        assert response.status =3D=3D 200
++        gzip_decompress.assert_not_called()
++
+     def test_303_redirect_makes_request_lose_body(self) -> None:
+         with HTTPConnectionPool(self.host, self.port) as pool:
+             response =3D pool.request(
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/r=
ecipes-devtools/python/python3-urllib3_2.2.2.bb
index 620927322a..f6ac8f89ca 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI +=3D " \
     file://CVE-2025-50181.patch \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
+    file://CVE-2026-21441.patch \
 "
=20
 RDEPENDS:${PN} +=3D "\
--=20
2.34.1


