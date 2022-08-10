Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAC4C25B0D
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 14:12:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6271.1660140748875168063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=dSFmCG52;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACdJdH006366
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=rdVklx3E/m9oDFG3jBm+qCY71Zt2cfEJykpXiN/FoT0=;
 b=dSFmCG52yXfpA4rnDHf0XlpM9SxSEmgA6gW2MKG/68AgyuYfI6s9tO3zbR6D5h9rPP3v
 IAGqzOh5OQyVdhUGS6jYrRNVq0VrCF3M5QJ81ZEaYGDUJRIn0Rv6aGnWNHHv1V9VtM5m
 YQeaMZxiGCgvUyOWkkaGFjv0x9Nkfc7zjyCV7isGvJXmqY/3tcxgG2yLbRairRcSDmCz
 DhLXEk9706hmDEIz6H00DhLR9oRxvNGyxvWOnKPGwoHuoP+5M+ab/gY221RCsHY25uNs
 8TKTZ6h7qi5aF65bB27yH8ARSmJYz0uQvot3fjhfUuWo44LPaoFHDcLdqRaR3clUfozd gA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7rkp5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 07:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chIFlWvIhTASCOlqSgMHNO19D7hRLihSaYioZf9KhnWgNXDa8tsBOqGorRmauXXskEpHLnrStbyH82eostBcTbE/TwsZ1A0vJnIjyWkwK7LwzUCKyrdpdjlJ/uU8TL17v9gljyS9jqNsEAGodn2D2L0j3dBOrn+qGUxQva+U8XIYLmU+0+0QM8XoZ2yUYmJG4W/Cxnj//MFM7d/S13kl63yZVNNKj2Oh2WMl6ll9M/sZa3uO9Qo1Upt98d1QOVgqVugLW9R86VyZKHR1wbUPj3b3TmCF5rIeGlYl5wKbE7BZbZWmN5xSX5cyzetMYPu2fA3LpOGMqYP7tUaEwj/2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdVklx3E/m9oDFG3jBm+qCY71Zt2cfEJykpXiN/FoT0=;
 b=JWZkywA/B6z6yjttw9R9LJwI0WnppSBGRVoT2v7UPxE15vBDYMgBhFM67bQN2dLsLSfvlJt0if/uoEnZ2w+gIpeTLKwzWUnWDsIiH/l8Z/7OJk+g/fQuPJaWPz3JKOaBmf9I/ODKaxO8xUmb84v/wwLqt5OFbujfCW5jzRM349Z9Soc7f3hOIhdsMxgdoEMmE6Ulo8xg59aO7L759nheDyuztdH1M/5ADTIS2vbhwuAPY2xlK4AXRbhfxNWPHnwae0gTjvC+ilWXnuEq/2WXYQylUlpqyRFXdQT1qJ/eKsedefOH/lQDKAvIQQUjMamt0fUfrPr9ktHUo+ieoEzU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB3646.namprd11.prod.outlook.com (2603:10b6:208:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 10 Aug 2022 14:12:23 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 14:12:23 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/5] qemu: fix CVE-2021-3507
Date: Wed, 10 Aug 2022 10:11:55 -0400
Message-Id: <20220810141159.21182-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b95e3ae0-8a50-4dfb-a874-08da7ada588f
X-MS-TrafficTypeDiagnostic: MN2PR11MB3646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9+xgAeB6lX3tCE7PeFRGKrz93w2Rc2GPK7Ir7RrcpAPtPC7SlmVGCBz9jt0UAiSYEIRowXJW8f0C/3lLzLoiMwy79qPkLRTUc9Fp6fEV55sdjkV1ga5KwtlV34mBNy93f2EkiuoAA2DGIaRGMDNAr9cxz/Ktg/xrBR3n1wnmMm0wc6Gtu+QZf3AneeBDOC17COejdgRH/2mPrNRXTD4PCW6RVqJzTsnLdaPWiFZ8baWPCcRYYnK/PhBKCL+8CJRGN5AwnxzNjd3hCk2vy/A8/nQgJS/djsND54jNvDoueQpUl/TZ78in6/gG56VEyts+NehCrdKNkMfvmspNzc4mpKUbQaxb916FXhhfiMWvVYPC0elz8cD6TpSDMKzYxuQgKWBXl81lmZ2Pi5wGh2zmz9ZPdn0Hj4yA5g/uGQNkihByv/u81TQhFBeB4Et36hoKyFCDVbxToCxmDYbh/zMK9NS9ixGzdbbAt7bn2sWa/wLN6yB61VVVyb85wu4OkaAzM/z1QGjfDLHIls0/fFDmlq/RJaBoRJKrJ/6uva/fFjark3cy4s+viGyZg4ntTyUI0Qh44eLOsY8SoCRT8SqYociH82KRDg8kVpfEK+jWDUZFsRTzLRqYBoHjxmftyW9nHTOPAXAGBdvXYkvN7wOj6P5WLyKFnw/Y31EcQUyYnr74krx/ccnspfS6MvCfIQXQwoHUS+5fKi0E4oyK7u1kk7d8qRTQHx/v34OPCWnxW91cFNtFwSduvh52p4DIYc0IYsTfflhJHRVze0Xm+4kuFu8omJerqPiT9Q4Yd7riUhfhuPLBsMcl2zfXh4xPIrDRCTLtiw2yfkCX33gwVX6j7RubNdjgxKrJ6CZtn6/f+Go=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(478600001)(6486002)(41300700001)(86362001)(966005)(6666004)(36756003)(6512007)(26005)(6506007)(186003)(2616005)(52116002)(83380400001)(316002)(6916009)(1076003)(8676002)(66946007)(44832011)(8936002)(66556008)(66476007)(38100700002)(38350700002)(5660300002)(2906002)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTRoeEhiVkdCRHdscjg5YmtLeGdrZ3NBSFg3Q2VQRWtZS1Exd2VDRzZ5aTVS?=
 =?utf-8?B?VE0yUis0RTZmamZUYldUTDVaKzFNZmp6QmxPd1NHS2JCUk16WG5KRWNjNWhU?=
 =?utf-8?B?RDhFb1hGeGgzaVF0d09QMEc0SDAveTlJdksrL0JBQzlSMnYwUGhRUlppSHBo?=
 =?utf-8?B?cFBhSUxhZVdaNWRSai8zRm1rNVh3anBiRXVKOFBSeXBiN2ZzOXMzRElLVEg3?=
 =?utf-8?B?dk5nWjdVaWhSR3owdmRNeWpxb2FmdlBUajhJTDUrbGRualV6Uk94OEJoMlR6?=
 =?utf-8?B?eit5QzhjdmNrWlQvTUJEY1hJQVhpWkpFTXRNK2VKTkU2MDc0enZNdHJDdm13?=
 =?utf-8?B?L2cyYXlRVHY2RUUyOGZudFczdkovNkQyTEFYcjNadlJaSVVLeW1PbFpmMU1E?=
 =?utf-8?B?MlhDTkh2WS9Yc0tVcHd5dkVpbFBqWjViY0k5Mk1yQ05ERXZqaDVxR1J5Zkw0?=
 =?utf-8?B?L1Q2eVM5aU5RMFJraDUyMXRkVit1Z1N6dzU0c2trRjRKQ3UyOTc3ZGdMejV1?=
 =?utf-8?B?b2N6TUFGc0JNU0FRSmFHUFEzYm0vdjZ0ZjlocUNXdi9oNk5qZWpHY3N6Skh2?=
 =?utf-8?B?N0FXdjE4OGU3RGMzWTNROEk4dkxTeitwaEc2NysvaTBNcHBHbTd1a0hyZC9O?=
 =?utf-8?B?b25URTRyM2IxN0g2SmdpTytqVXY2dC9IMSt0MGZHTmV1TmhJTjlTZFE3Qm9T?=
 =?utf-8?B?QlFIYWUwT2psYTNpNTlzckp3YTNXRzVNWC9Bb0Y5bTRCRWp0aytMaUt2ckhp?=
 =?utf-8?B?YzNCOW9WQnEwcUtHbzNxWVVBTmxhdlB0QTFKdisxM1hTUUgyeGFZaVJQY0hv?=
 =?utf-8?B?cUNNWk9LLzk1UTFHWk8yMWFxaGpncWwyMFRZbUF4K0VKcUVUdmw1aC9ibXdP?=
 =?utf-8?B?T0pqaVV3YmJJL1hrWkU5c0NuSmwzcW5TY2ZGR2orM25zbTBwNkVISlBhbktZ?=
 =?utf-8?B?MVhYLzQrRkZqcUVVN3pFSUpGaEZySTg2L0I2ZE9XZ0R5KzNJT3V4Q3RSUzN2?=
 =?utf-8?B?TmVMTExZVEpOMEp2byt6VGw5ZW1QRHFVMy9xeTYwRUhRd05VeUViUkNIQ1Zu?=
 =?utf-8?B?dXdhczd1b3ZQbExrWmUvdUovWjdHbzN3czlORVM2NGJ1L0hNd0NMZ1pvaGFi?=
 =?utf-8?B?VjRVVlFrTm83aHF0Um1PL3dUcTdKYzJua3EwMlZGUG14RnNzNkJ6SUxWY2Q4?=
 =?utf-8?B?S2dCY2NBbTdBbjREWk1CVllwTmdIM1hnT1MreCtJSm5HcHJMYUxueXFXWTQ0?=
 =?utf-8?B?Z1Y5YjIyYXVnVEhNZ0RIS29FWit4SDR2cjhGZFRIVWRnTHN0YnhqREtPamE0?=
 =?utf-8?B?YSttV0owcXUxV2FiY3FkUHBHUjB4WFJkMElnZlltYmF5VkFJMVA0OW8zSmVn?=
 =?utf-8?B?UWl3eG9Jd3R6a3BqclJLcWx4TUd0WExocFR4d3hBMERqY2VMV2UvTStaVS81?=
 =?utf-8?B?aDk0cUFrL01GYTREOENLV2wwR29kbHVPeFh6aWxqbjUyTTZKTFJuSkNuWnVP?=
 =?utf-8?B?VUpyQkR6UGFMcnNHaEhvdElGcWdIc1M4cDdlRXc0TS9iNlVvRndFakVnOEVy?=
 =?utf-8?B?Z1YxNUo4SUVRUFcrMEZDM20vd2diNHhicldOVEY0WEpSNkNLZUgwVlJPZUpu?=
 =?utf-8?B?d1pYZWQzT05NaTR6QW5Rb2ZNbHdDTDJGdmk0Rm5tNTlrbG5VVXZJaGdJY2FL?=
 =?utf-8?B?MDZ5czFsWDVEb090aURiR3g0a3YvTUVLai9hMGd4WnRYZFRYWXJpdW9Vajdy?=
 =?utf-8?B?U2dNOElqWjJycjF0dkFiQmpWbE9ENVEwOUt6bjZRVHVQdTBOOCtkWm90dmZu?=
 =?utf-8?B?cTdQRTJCQmRSemt2a0Z6ZitLaXJ5d01vNHVqU1V4VjN5V1d4Yjg2ZElvSnVj?=
 =?utf-8?B?USt2SzRQNWNzbVpMWUNDWWxYZDVWLytxV3hVcVh5MFFNck1VM3hibWxOMzl5?=
 =?utf-8?B?c000ejhhT1JvWGNIRnJXTlUzM2tja3hUZmorZ3dxd1d3Y29ua2s2Zk9GYW9E?=
 =?utf-8?B?SzJQSGpjVXlYckFIOFlvcDdZMWkvYUVnR1MvWThSbElZQlpEcTROQTVYcUdI?=
 =?utf-8?B?SEZiU1dxcU9tYU03TzM5clNncGpuZDBpZHNDeExiSjJicGF5Q2xZYU9BcXo4?=
 =?utf-8?B?ZldWSml0emZvcE1BY3NNMW1nc0w3UmZ5ZUdTRm8xQXk0RnFWR3NtQ1VXK1RU?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b95e3ae0-8a50-4dfb-a874-08da7ada588f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:12:23.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4N3vhZttkkkR7QdmArB8GWMeKAMK2URktgU0hffHeXkGVyINegp3wWTzyBNHiLxzZygfXYw4GCUoRQDoRJ1mi5PPJqhWkxNEEhrGCML4RSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3646
X-Proofpoint-GUID: vg-232LvTm-l3V0kpSc4WO29ZtAt_oIs
X-Proofpoint-ORIG-GUID: vg-232LvTm-l3V0kpSc4WO29ZtAt_oIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=741
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27ACdJdH006366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 14:12:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169194

Backport relevant patches to fix CVE-2021-3507.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ++++++++++++++
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 54a68e1730..dd30313fdd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2021-4206.patch \
            file://CVE-2021-4207.patch \
            file://CVE-2022-35414.patch \
+           file://CVE-2021-3507_1.patch \
+           file://CVE-2021-3507_2.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
new file mode 100644
index 0000000000..4201610f4d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
@@ -0,0 +1,92 @@
+From 963ac2cd5186b28fbfdecd15ac43afe1dbaf871a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Thu, 18 Nov 2021 12:57:32 +0100
+Subject: [PATCH 1/2] hw/block/fdc: Prevent end-of-track overrun
+ (CVE-2021-3507)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the 82078 datasheet, if the end-of-track (EOT byte in
+the FIFO) is more than the number of sectors per side, the
+command is terminated unsuccessfully:
+
+* 5.2.5 DATA TRANSFER TERMINATION
+
+  The 82078 supports terminal count explicitly through
+  the TC pin and implicitly through the underrun/over-
+  run and end-of-track (EOT) functions. For full sector
+  transfers, the EOT parameter can define the last
+  sector to be transferred in a single or multisector
+  transfer. If the last sector to be transferred is a par-
+  tial sector, the host can stop transferring the data in
+  mid-sector, and the 82078 will continue to complete
+  the sector as if a hardware TC was received. The
+  only difference between these implicit functions and
+  TC is that they return "abnormal termination" result
+  status. Such status indications can be ignored if they
+  were expected.
+
+* 6.1.3 READ TRACK
+
+  This command terminates when the EOT specified
+  number of sectors have been read. If the 82078
+  does not find an I D Address Mark on the diskette
+  after the second=C2=B7 occurrence of a pulse on the
+  INDX# pin, then it sets the IC code in Status Regis-
+  ter 0 to "01" (Abnormal termination), sets the MA bit
+  in Status Register 1 to "1", and terminates the com-
+  mand.
+
+* 6.1.6 VERIFY
+
+  Refer to Table 6-6 and Table 6-7 for information
+  concerning the values of MT and EC versus SC and
+  EOT value.
+
+* Table 6=C2=B76. Result Phase Table
+
+* Table 6-7. Verify Command Result Phase Table
+
+Fix by aborting the transfer when EOT > # Sectors Per Side.
+
+Cc: qemu-stable@nongnu.org
+Cc: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
+Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [defac5e2fbddf8423a354ff0454283a2115e1367]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 21d18ac2e..24b05406e 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1529,6 +1529,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl,=
 int direction)
+         int tmp;
+         fdctrl->data_len =3D 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->=
fifo[5]);
+         tmp =3D (fdctrl->fifo[6] - ks + 1);
++        if (tmp < 0) {
++            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
++            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x0=
0);
++            fdctrl->fifo[3] =3D kt;
++            fdctrl->fifo[4] =3D kh;
++            fdctrl->fifo[5] =3D ks;
++            return;
++        }
+         if (fdctrl->fifo[0] & 0x80)
+             tmp +=3D fdctrl->fifo[6];
+         fdctrl->data_len *=3D tmp;
+--=20
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
new file mode 100644
index 0000000000..9f00d9c0d0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
@@ -0,0 +1,115 @@
+From ec5725982f811d9728ad1f9940df0e9349397e67 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redhat=
.com>
+Date: Thu, 18 Nov 2021 12:57:33 +0100
+Subject: [PATCH 2/2] tests/qtest/fdc-test: Add a regression test for
+ CVE-2021-3507
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/33=
9
+
+Without the previous commit, when running 'make check-qtest-i386'
+with QEMU configured with '--enable-sanitizers' we get:
+
+  =3D=3D4028352=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on ad=
dress 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb419=
8bc0
+  READ of size 786432 at 0x619000062a00 thread T0
+      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
+      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:278=
7:13
+      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
+      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
+      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
+      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933=
:5
+      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-co=
mmon.h:82:5
+      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
+      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:1=
3
+      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
+      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
+      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
+      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
+
+  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x6=
19000062800,0x619000062a00)
+  allocated by thread T0 here:
+      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
+      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
+      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
+      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
+      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
+      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
+
+  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e=
65919) in __asan_memcpy
+  Shadow bytes around the buggy address:
+    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+  =3D>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
+    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
+  Shadow byte legend (one shadow byte represents 8 application bytes):
+    Addressable:           00
+    Heap left redzone:       fa
+    Freed heap region:       fd
+  =3D=3D4028352=3D=3DABORTING
+
+[ kwolf: Added snapshot=3Don to prevent write file lock failure ]
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+Upstream-Status: Backport [46609b90d9e3a6304def11038a76b58ff43f77bc]
+CVE: CVE-2021-3507
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
+index 8f6eee84a..6f5850354 100644
+--- a/tests/qtest/fdc-test.c
++++ b/tests/qtest/fdc-test.c
+@@ -583,6 +583,26 @@ static void test_cve_2021_20196(void)
+     qtest_quit(s);
+ }
+=20
++static void test_cve_2021_3507(void)
++{
++    QTestState *s;
++
++    s =3D qtest_initf("-nographic -m 32M -nodefaults "
++                    "-drive file=3D%s,format=3Draw,if=3Dfloppy,snapshot=
=3Don",
++                    test_image);
++    qtest_outl(s, 0x9, 0x0a0206);
++    qtest_outw(s, 0x3f4, 0x1600);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0200);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_outw(s, 0x3f4, 0x0000);
++    qtest_quit(s);
++}
++
+ int main(int argc, char **argv)
+ {
+     int fd;
+@@ -614,6 +634,7 @@ int main(int argc, char **argv)
+     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
+     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+     qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
++    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
+=20
+     ret =3D g_test_run();
+=20
+--=20
+2.33.0
+
--=20
2.33.0


