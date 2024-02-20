Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46814C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 03:07:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5318.1708398457553861402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 19:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27803fe644=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41K0sT5p001200
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 19:07:37 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary4a47e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 19:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS233c1VeKQKBYbdOpRw1X+RpysvbL0CqhEoGSPdW5Cd7c9cAlSq7Y81kZB6ex5zzWDfcYBsCuA2RgmIPUw/vqcxXjcw9iFCe5ERxbhAarNDr1AP75tpgVaNWf306l2q8y6Bj7x1CLjO681h1HF0tGHMy3c4dkUFPmkqgl0RXYAlA9lvTz2m9uZXrw0qBZIRsbSiJ2va+G2zvbWtT9oNQabslUpJYcEw3NSTWc5icU/p0sos0sGDAVTHuWaf2mV+2sqhu/7y1cvCZKwgZWX7SNy9jFgxGAz5KfbGhdJZG5cbWO+rZT2Mjs3YClykMnVS7XJvRwNxpDeKa6Y9/c+X1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T18WMsb8t5bTqQb8dLyixrIBijfWfCEM84VzacSKf4I=;
 b=HFOIfjfPVWLpbnH3HxVHukZkTbOJ9iuQDp3Xf/QioGP1lR7mTxNxW4xaoX4+2BLfGVdTqO+9xA7c1MbarixJPSo3Kdy92VzRzLywH1jCFXnO5R+638f6TQT0MqputTR3E9EXXXdwUNHOZP82ri7aeViSL4GCvMo6oLknpEoZVbrlX79kz3Phql57gM6JSIlTJ0mcKSl9Qx6kkTWw81CmLCwDRAhmVyPgyomBQxwosfdKUyGuCD0HHP8+8JUR4O8moc5mTKXrKwjuV14aOYfq4/2YE7jRKuHKjSHZz9nDWaE54VbztKclU12uPjktuNSfhwaA9rJtitVdAWHvrhcf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 03:07:31 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 03:07:31 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bash: rebase the patch to fix ptest failure
Date: Tue, 20 Feb 2024 11:46:48 +0800
Message-Id: <20240220034648.3450003-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CO1PR11MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: 24aafaea-24b1-459d-81ab-08dc31c11415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NdNKSWliSHByWpHKBNP9GmvTMAof6QXAVreN2oU65gBImJRR5nrhoxmSMwqicZgonacUVh6OnTQGasyskuEbIPEZHhgDbc4bM+iWg0+0foTpuXSfuiNLubqoXqs7OP39rVIXB/Lq9BSly1YTEIjlpU/6zbtRTzQtBec0fcdMIBsIoM1JNg6378a1KcrdlBmWUKw4dMNTffjVdsARkLLlyV5ejuLstbQ0xkdFjQ6yNESsq7H3gSo3RoN6013sWM0GR709OtPnDCBVVLB+Z53KirIlEH5hU2yIEXPSu1uqZJND29A8Ah6ur5Adfft0S2O+nVQ8jX5AIGyu30wqrJOFpj93GE0A8DQwBUi3Sw7qXWcDiXpXWugs6EdNrGNMZ0KFQmOJeow5Jmq0B4CaeGm/UL70EUA932sl0xhnx3ey81LOunw6ENDriMauNC4AQY3Vm3y0MukL+La+sZEh7MLMVQYlxjXcf1hBy/uF5ntMc/0P4XatFrnEDnd35nOQ0dIYViKgaSGIyZnjshU2agwsAm9EiJ+tnARLPK6GclfrGmsGquXZCx78q7ImFI7ts+MhkBgSf7LFvDes0HEXXZkuECddcGhzv3k9NhVml+7uuDfuBsiYMQJSaPSWZMIccHJk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HHKZ4LNZx1OA4BX1KCqs49/CA/etFzFdPtD3JGKRrbXU7ryHsZ1/gZ2XIyql?=
 =?us-ascii?Q?j9RJW0j+v25JeSX+g+6lv31tRhjaFYbMHrdTjBbvO3pKWY+Ps6QVDbjKI0f0?=
 =?us-ascii?Q?lE5cYd3QlyXlIMb1KIXtEQ66437r4gXVBUphJ0MScCyM5fufzMp6a7MwwMDM?=
 =?us-ascii?Q?JucO2xthB8loNGsunRggE1oiC+gl8JEeW46psqk6udsqbivNDik/Op9mv/Ek?=
 =?us-ascii?Q?rA5wOaeeLP33dWosFiPw/dwM0xP7eYIxDLTYmtg3pIDEtUfk+fNA93gbuCRK?=
 =?us-ascii?Q?JXfePd5c29GckquBGSLFhpMoZ6njSpqCxhjoHvfvZ1eKom1L1QHg5H5R8156?=
 =?us-ascii?Q?IXsKEPBSpu9aXD5zTEX4RIREYpKMx5D2YeSZasCYRV5Nd15/XITKV+pN3nW+?=
 =?us-ascii?Q?AXLWefJRRr1mbbToIujwJ4MPVGHL5CwCkpbFJWOH1v4s255RtDSX0oZ9Kn5/?=
 =?us-ascii?Q?jdnLF+VdFnWT+HNkvMZKyF8sMwgRo2vS4SGL9mUbTDq0pclXP3JMok9rAMsl?=
 =?us-ascii?Q?FoJ5XRaWhUb6oED6Plaoh+1nnv2MeQv8psvifmoC6g4RiGUtMNO4JTkhAq1d?=
 =?us-ascii?Q?0eGTchXM+4GaHZ20wsjTif9qDIaymgZNGsA6mrf2MxTJgFDls2zXbw6LHEfP?=
 =?us-ascii?Q?5Xl2WmsW7Om0GH/gNeedGWvOHL38PiHWVJdy5QJN9x/scg2QnKysZLVbIbNG?=
 =?us-ascii?Q?2jren5ODyRKXxmtDSoDECbQXJG5rYHBnk/3m9mAuENrePQDvW0TJb4hSvW9m?=
 =?us-ascii?Q?NDjxtHMLQBIIaD+oJ0z1VcHVWbhnbnDnPLrDtIHhQgCyj4BMo5XK5OMPT6T8?=
 =?us-ascii?Q?hLp6xetb35zRAXu3eeu4+gqQAwjSNyWEkLNaGAE0JdxgY52D1Ee4B+9epb9W?=
 =?us-ascii?Q?IfqRKidJj7V8uun+5OBHXW/uDU0TbiacBzRvr/w0HZhrqt73BzdrqUHOmA65?=
 =?us-ascii?Q?XCyXQSyMUW6UAaCwP/gPmRpvYK1nCKV71/MFCtASwHb+XewcDk3ugWUMnnmI?=
 =?us-ascii?Q?ugOuAqxrA+5NNtb5srLD/Ippw3rC0/s4C/kBu1jg06Fiv9Dr6h3rpKzWM0Dg?=
 =?us-ascii?Q?0Eb/eioUGE7Fhck10v3Y2loCLTQXbdIetMX3dQvi+92zDPDL69no24GZbKrW?=
 =?us-ascii?Q?afY8d4+SLP1UM9Wd1dt36KCc+S5IpTQfhrS3j/y5qrrzVf4vs3qWvt5tjqFD?=
 =?us-ascii?Q?tU06eGyB478DBEGdfhFpaVt1DvFRVVnl1DehoFFOuXDjCvS49IJktXs0sHlz?=
 =?us-ascii?Q?PrmRPQGH4uFl04GsfW8/Gbi3I4Jx8PrB/kRQSiZ64ofycg5cB7abtNaaQ9L5?=
 =?us-ascii?Q?eaxki2z+teJ4lw8fXMndZb3eyZEEgA1TcKq1umsU4LW0nykbA5LE3aTGO9Ov?=
 =?us-ascii?Q?YkKIW8Flj3eUSC2ezGRH2ktmvmJgIIow0z5wawYuENqrK3NRzgLf2b5L/GrD?=
 =?us-ascii?Q?8fqAYnp5xYrUEI8F9zpC6jIpu+Ne9fPyCwuS3xqiZOsbSw8jIt6K8cPPh7QU?=
 =?us-ascii?Q?q0nVS2YtV56cnswlFEv18LelezrUP64mKARCqnKBx6qqvQey7PZmGk5XS/Qk?=
 =?us-ascii?Q?155m0Sl1vjXUJVKtNJqVf0E7kcoJx3cOAVZvTPQdf/L+9RSIY7ykHo2s6SrN?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aafaea-24b1-459d-81ab-08dc31c11415
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 03:07:31.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6mv2FSo/1pHhe1YT9xmEyteWEZte0Q6EoKbL638LtzFfhmJHQHMDuQDr3llFabLcsPtAiVb/0spAoyzy4broweeKVl0BRnoEVDK+rvoNf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
X-Proofpoint-ORIG-GUID: x6tnrh9dOuaOJekmdibxSwHeA5-fFXV9
X-Proofpoint-GUID: x6tnrh9dOuaOJekmdibxSwHeA5-fFXV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_02,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=636 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402200021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 03:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195900

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This fix commit oe-core: 1b69769b -- bash: changes to SIGINT handler while waiting for a child

Due to the patch adjust and drop some codes to be applicable the tree,
the line number has been changed, that cause test case "run-type" fail.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...1-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
index df92c2475d..77d770b364 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -147,7 +147,7 @@ index bbc228e8..e0a66745 100644
 -alias m='more'
 -alias m='more'
 -m is aliased to `more'
-+./type.tests: line 59: type: morealias: not found
++./type.tests: line 56: type: morealias: not found
 +alias morealias='more'
 +alias morealias='more'
 +morealias is aliased to `more'
-- 
2.25.1


