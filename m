Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC69C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:03:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39333.1786096982070231432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hToQkrGZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2679201048=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776rFGR2475712
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=OAJmN43qq
	CwNhPBNNiEK5J9VW9mQwpe7Z5v8b4WnEjM=; b=hToQkrGZl5yeEwbNJ5l7+iAM/
	PRmmZrJlGZc1bxbiBNmKsio3oqvWGO6B8VEpfrIXMRLw+uzXdot3QNSz8z4onOsl
	/R5v3nYI1vI4y/xVQLVgrjW/2Drs/WJ/JTt5JzKykjB6ETTw52YBRv53yQgD+oZj
	F1jmN2gSD4WLCLNKsW8KMatmiHG41EKOkkHRC5Onxah81fg+B4zCCH7Dq10DjCS2
	61Ku7TU0AQQvt0gvflKvVDEmUT17lbcGOflW/SxIBTgU+/WoWEQHPnYFyeDtC24c
	Xck2inVF/FHZXjXK2FZ9lryzPpb9H7Zt1sAmVoGB8rXzjk4WCtvxJliq8X6Mg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fvpjctesj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:03:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQ3grw7N5uKhXd41+PWOqh0eOTxqH4T0i53im0HPpzD6qMECFP2snsjiXnO/APtiWpyjBAMytq6Q/BQ+DGoAxUNbTejiPQF6GDLhcnMdtPY0Ixm84gHcXfYE2ef13Vd6cfVTyYb412klOX/ovUHg8ZZnni5FPpJ5idknMB2Ep8qVqR2Y2Ydy93+NbOSD9zfS30fTgjWQt4GrKcKj3RmZT0lKPCW5xn58HNWd9Zs8X3Rx2PqMLceplrgHtz01GxkG6Tti/amz+WXQahE+tfNG4Q/ooaU9roMyPFLpUa5JoX7CpD9XN0ItWN0FttcHyLU9+Sta0JRfdxR6j0fTaOTh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAJmN43qqCwNhPBNNiEK5J9VW9mQwpe7Z5v8b4WnEjM=;
 b=ID0CUl47vRRW8AgoxyQfTQ+xIyWLmsU0g73IBGJgwsnu6elpdpZbfMQqOwHF7Mz8TjdIcGvXJE4UdGTLtfgCCi/hgjcpN/FwBTOsVNuAb+Tu0wN6LCKVSHVPkURBo9dqnnZ20J/2koaIHxPAqOtTJ73VALUv0h830jTtEmZI2gUUSeatFYp4uLW4ms7lW5ixgWlCf3GSNx0dhvxlK5hzNxUo2O7IlKOs1D8KOxor5MQXceSTKW2hEP/6EiNCrYVjc7+Zpmi3KQOHLBYjk/41phZrSKd8N3EnYQXIeIDqj7gt9xKmmrNnxvB8LPYlufy3l0eDBjDRt4OBusnFa5oPPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 10:02:58 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 10:02:57 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] bitbake.conf: Add timeout to HOSTTOOLS
Date: Fri,  7 Aug 2026 03:02:37 -0700
Message-ID: <20260807100237.1218728-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 38558d8a-797e-4dfd-d41c-08def46b0e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ECtIxsgyIdEqARVmXCWrji38ojc5CUQIhuvT0M57vEg3qRqxIJFrBf7otu3MzbyEywYq/y7TLnoqPEEBQwpzaJhWhBhikCc8iCs8ffeQtfxR3yZEBVGI4BBcm0gSIA1mSkfLN11UKHXzb8Ep9dnTBgdZd686RU+qTiilrNncfeE/QnKxHlsm5ZbBQ8qxKeb4yPH2nT3DaQOwIlP5Y7EY6tTuesTBvn71qC94ZwEyPEBHWSt8VTNGiEqKPg9ZloCWZy56PPQ69JEkL3+mJ5/9XgWx+4a2D4neWFAITpt5WABMxvu/5/y2Ys7cUwiZ9DKPmvohPA5RPqCR/+/NW9B1Y1KOT/5vOwWA5EWlja8CwzjABavEM/TdBlrErqvR6GGBFgOcLjdBrxNaSH2Gua/iloYdEd36LkRkbDVwXaVCQul5dRv37PjArSdjqPpptm8458qNQyAQVOk+mKS9/p6RT+PdC+QEuSfg9KGq8ufYxHpjbSDU7A23RGVXW7shFsdDkGaCBEaWYIdVmPsQ671OUZ22wEA4VgWkomHVfAH+JoJ+wydSWTYO9cm5AGAACNY9hEeI/W5G1anNEK0IsKQrUcz/A/RW2Q70GhnlemAvBVIUDObek6pHCR5jC9ZzWr0DYt4lzCuSw9t4cfdWnp862sq/5uqiRKnqJLBcdpgBGVi91Z25yrllDKw1BsUjBdv06BFrY0JIbzLLz9JWh2QlDe+QgkCKVEIl9Sxy2TMqdUg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ygTBM/MzdtMRGz6Hpt5DjhNBdpTNArHrIio+A5Hda7xi7Kwuwkhl7eS0Qbsa?=
 =?us-ascii?Q?TV5tTIWCNj5U8kiSUvEWQJLFGF+6p/CdFCTso0JPSSeIqzzp6nF+2xhfQQHM?=
 =?us-ascii?Q?xL/MFYNfaw1Nobxq4z3FCjcot5gwvlhWToV+g7yfSxqeHIPPv6Wqq8eBvjbf?=
 =?us-ascii?Q?Z/dQiya+OdEphpWqjBmAUhMGohhZ2gyvTh0eP5+TquwxBGT5AermVCOUqAgz?=
 =?us-ascii?Q?11Nz/fL+6o9lPV//+h8pCjltUBYaqGwHwVzpGaB/vgliasovj5Ghea41pDVL?=
 =?us-ascii?Q?KT7iY/LVXStiUJSujWq58oFwIDi3rx53z37qm9I1lK/0wp1f94FKNa90z6IU?=
 =?us-ascii?Q?EwoEEduMyUUy5p3tbLwxhvUdVuzXB2JnZWJCzF0ddNGDhS694o9oC1jQ2rog?=
 =?us-ascii?Q?tgzdsBIvPQEjXWQ1nxDv234zyK7tKjasGXRVvisJtt84L1IsblQNZ6YFBzrv?=
 =?us-ascii?Q?YumwBU6QTqR5VeZpd8P4seIOm8suKsrJIUtLyrRvL4kvlq+G2n5wbNJPI9rp?=
 =?us-ascii?Q?ecIPd7nVCvM5At31o6uEQdmDB3zJSl9uSPdo93h/h9vMi9CEhIXdy1hP0R96?=
 =?us-ascii?Q?PpXllehQk552ry1EqIKbvjzzn8dak6IRR+lkL8cY1BK+7DIlqiusvJkfIAlp?=
 =?us-ascii?Q?gMqVz0t5Pjwo5bwjdpQ4ULyGt8lMRNfCxE3EJ4ZJNEKiseJyFHW/lpkmqDxc?=
 =?us-ascii?Q?SB2UXMtb3ulZRuOYv78wTWnWfK/ccSkY6AL59flCBJotxF/LjKdukhE70/Qk?=
 =?us-ascii?Q?eXCELwobLPaDkrB/jXoqtNXEaBE5cG24VUpSY5Vqhhwz0ubucTl/FhL4213r?=
 =?us-ascii?Q?1Mpj0Jz/SLKheCRfvlebV4fnMzJTF1djilaVD7qBV6f+v7P2Qf/R0HuSKPBI?=
 =?us-ascii?Q?ZV+EjOufgcrU8+iIp26WqSC4fBrVyLpDrXrSXRczP9xUJQwaylyKNPSGz8MF?=
 =?us-ascii?Q?0T5QmgFmQISlR69kaAJ+HY9cpZwh8Y/8rEnmLDp1Yx2PwyCoX1rnujNxVSRo?=
 =?us-ascii?Q?jCB1eDxA8BQsZOiGvzTlLBhwVQrnCsfJweH8xVAYfzkIkA4IhjXUJQRlvxih?=
 =?us-ascii?Q?QFMf62F+tNEug+bE7DqkrTFlHveM0k+owgnV3SnyuasrDT5lWkT/WzlBPS/V?=
 =?us-ascii?Q?odh461gTuMFfExFkpPGthCSn75ZmDUbFzkutcG1dZSHxrHVYqxKImPbf+iO8?=
 =?us-ascii?Q?2q95WjvkLBDYLFx8Upr4l3Vc9k6aO6W4PaU3DVqnvxSf4PB6TafDaNKB72wQ?=
 =?us-ascii?Q?PWwy4/x2tgoGavOyROVlxzy/rcFi4mxCW50nMNL8yq2I+o21I8R2xYBntjUG?=
 =?us-ascii?Q?L1O2OBx06bw9V7xRuUtypluy1/xY2TWF5IZjvAqE7VwQVEafo+PkJTj0Qxps?=
 =?us-ascii?Q?6uo9se952jdroH8zsFzgB7n5+jO3+M5aNU7F274cxamZMME8Ke6thhUEGcwN?=
 =?us-ascii?Q?NbEKVGzjq3Sdd24LP70bcEByg+OA1qsLpyXuVx+FsOuZHPdeA0YbL9Gqp5ta?=
 =?us-ascii?Q?d2EU+iC+Ug4XCYJjWRoWZJ6HufpMaAT7WVuo43rrCCr5ypDyihWpU8IZxuxg?=
 =?us-ascii?Q?KduSkWXReLU71EgmRvgHLx5KI9c9ArZJ6XK3nMhAKwTpJvDj++0m9oXEJ1/l?=
 =?us-ascii?Q?sbnE+/bK4E1NNLaPQUzFst6WnSBnURqm5MYA9ayigUm9LRZaykwCPDTuFiAe?=
 =?us-ascii?Q?srqdvuSQe/2vR/BZZ3fV8NqnHlqJGHcks6+9Vb6r7DF9wH9XlW9o3XHGlZYS?=
 =?us-ascii?Q?IbF0PZqjXRV+e2MZAAO9p9JIDICVGH0=3D?=
X-Exchange-RoutingPolicyChecked: 
	dLsDuKBuafmTXfI46QUMQwWwVdKPc6J1RbxM1SEAqtMkpVcD9qAfilwwolQvWqYlhPXfTB1iDFyWzTUF6dF/wvWLeDLXFiuMwyGzO6nrRt2v2BSKf1QchFeRjIb2f1yon4NTZVgYyEI1/+ADIsoHJ2MaXl1cyepXWJJXSbzMj5Hb9OraQ5UJa1L3Xjbe5/OdAUsHRlzu1hxMditL51pZQlBgE1vtAheLXs/JqBYrhPSPpUYj7Em+qqOB62KxoxUnjBl42yU26BEE8nT20xSCE0S0BGBHJWFXzCNftX1sJFZBxLFTbhY0VamWzOvvMkolkYOsn+W7d/DL0KxjafTJZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38558d8a-797e-4dfd-d41c-08def46b0e40
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 10:02:57.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1gd2stt1ddqhdekwlIcZzRLXW8bAQ31x6IchgoLJydhYZRTovo1q84VhR6FA7gNPkmzkD7fmE4RlQlgHfe03arL2mW2+NLuA3g/KY72cEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-Proofpoint-ORIG-GUID: jhP9s2AVlQN5xJUHVgAvDn4BQMIt4Edi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX/l8uioDxXIjr
 Qw25xpJglXDcffLPMSc7ZvfCnr93fwYEdD3OqNdXe5Wx1zzhuVVWmEIFxiHLx7Br95FAJqtpjqp
 IxF18gnR0/1gGj/DC1enD7+4RaxqOrjsIV8qfLTwTwzpqB9RU6jHaBRh6OhNd4Xj+APqwjS/QFL
 GYl3MmaV6RZjITQuDaLnHAVzmBeCtQbwDgir+qWAGuA2iP05kxu0VJoJ339zEOUW5p8QpNrLy3w
 04B2nyW3I7EZbrmlE9cxwVeHGU6DZ7Tcq1mgAKMyDWKFxVEiza36JI3z5NcadHTOoXtqdI9b7zT
 JRzTwwyyNKe/A15GQIFFkNoti1BKKopqs34GEoecn9DyVnCkmlH2gP6etd0mJ2aV+Xcf8WsDoNS
 YKbUn6hKg+zk4CKCbOBoA7fDdALfmmZFkkvRfmdwrnhITZReinhwlaEPasOysLSn61RMk3WGy7M
 Fye7lFteg09NPU9Rqkw==
X-Authority-Analysis: v=2.4 cv=Ic63n2qa c=1 sm=1 tr=0 ts=6a75ad54 cx=c_pps
 a=6APEVz27trGWNYyenu7PEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=BueZr9OacWAYg2AdSfMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfXyTbepjd/b+sG
 OhyE1COQk7DBg0nL/9Kb45mwVL0CyGCb81wArwr6nxPQV+umnQDmk/ZjalQ3fpq5ZgGRIn867hE
 CB8NuZvsQVsCzVheYW7hfvnhJ0GWDkIVg/29s1eVpTar12Sa44ok
X-Proofpoint-GUID: jhP9s2AVlQN5xJUHVgAvDn4BQMIt4Edi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242998

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

The glibc iconv/tst-iconv_prog test uses timeout(1) on the host to
guard against hangs during charset conversion testing. Since timeout
is not listed in HOSTTOOLS, it is unavailable in the Yocto build
environment, causing the test to fail with exit code 127 (command not
found) instead of the expected conversion error code.

AB testresults (qemux86-64-tc):

  +--------------+--------+--------+------+
  | Result       | Before | After  | Diff |
  +--------------+--------+--------+------+
  | PASS         | 6759   | 6760   | +1   |
  | FAIL         | 30     | 29     | -1   |
  | UNSUPPORTED  | 584    | 584    |  0   |
  | XFAIL        | 16     | 16     |  0   |
  +--------------+--------+--------+------+

  iconv/tst-iconv_prog  FAIL -> PASS

With this fix, iconv/tst-iconv_prog now passes on all architectures.
Verified on AB.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..39966d60ef 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -533,7 +533,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
-    sleep sort split stat strings strip tail tar tee test touch tr true truncate uname \
+    sleep sort split stat strings strip tail tar tee test timeout touch tr true truncate uname \
     uniq unzstd wc wget which xargs zstd xz \
 "
 
-- 
2.49.0


