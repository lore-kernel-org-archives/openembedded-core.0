Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4185CC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:41:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2971.1642214463621088425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IhnSVYuo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F2YgGK001713
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=uEQq+y/DTYbeprh51GC7bKQ7QOyWDuUOvy92256HUC8=;
 b=IhnSVYuoIc7oDcu9hSLz+Suj5V3weg6vT9MaQa/i/THXfFffwSzCmsWB876XAoeM0to+
 SgvuIKElZUpbw3mY56jBXvfiXxyIAXNnUP91XzLZ91T8IV/FpQvkgkuNUlmGx1Ia/Pkn
 K4QtNbvBZu8NWLCPT/da5P1l+w9PIfohyysidK4ZawEsRltqIaVijgm9xQ0zOGBP8spq
 6gWSbvyXCgN/l3Fo8fpZjXi2hGtA8a1W/1XpUk9ei/pzb2J8SsfvuIVbHlsXHvN7bf1w
 u4W8UkGjRXxbkb679x7FXQdR8WWtOR/8CBi9lOKZVaeRAlFqcmOoVA4tbxej4Irefc0q hw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jan 2022 02:41:02 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F2f1m2012744
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0ds-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jan 2022 02:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4G/ffnAteh4pHqTkJrDA2ImN0OjJ7ADL1WO5HSFSoxPIx+WvL47lKPAPnRL12lgXrvUtzpLdorsiY7MkKtGErCYYzaWZUxmywnMdfQvIqgUDVjIbHjcW4o66Prqi0F3HEAHXp1eC6YT/R3zY4+YGyffJXxDV5UB/2yrVzW2+QDYEp0o1heVxEZy0YjU9rwD7DeCeolSoflgF3ZpVOzF2M3+zX4lA4fzMdwKrdPe4vYRzeUV15z2ndR7WMa121t8+7Kczx9AeVEt/zUxQv6mdFTV1VPNWExX+bE6mrPgV/KMuKZMeJSV0zuo/dgYO3Fhan9VhQeWjlGo0DBM596K3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEQq+y/DTYbeprh51GC7bKQ7QOyWDuUOvy92256HUC8=;
 b=GzGzTq/41sI+R/Kc9EtC47Xf5A+W5Cxa/NytfxVdNalZOyYDRcF1129Ym3BsWOrXMCGwGiHypoZH1f6C54PO4TwvcgIAKBZnFAngAo/S00ISRI2PnV4OHNOjLshFq7a7wjII4D1VsjG7M2PFnoaLhmV0WLXwyZSIPPWjiosvlpYAaaF7LVExvz6FX+PYMk6D5AVWC7sUUe7VSy5bkuun2B8M7lxh5qfWPbN9HkiqR7hf4oV7QW9rRp2Sh+qk92X5DHJzZQ3ZezxtvsuX4Cizefa9GGwRn1QOeAQ5sCJCBmbxihp2D2+UiyTsttyYMMbZVkphHO27tnpjQGB4/85LAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 02:40:53 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 02:40:53 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott 0/2] tune-cortexa72: Drop the crypto extension from the
 cortexa72 tune
Date: Sat, 15 Jan 2022 10:37:45 +0800
Message-Id: <20220115023747.1154635-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea831547-cf1c-4b26-6645-08d9d7d072b1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3445C47C15E9C70C2088F4D0E2559@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9eRWoL1ESWrJOlgerzXCCspC1KsyJo/UmJgsMuB1bTQV8/3ThMZdXrxnD/2DODoXl9XdxkYc0ZR8ilpY6JA8RnjeUOwSl7IuplCuB5uwIlIyr05ZPZoh4P/YW81D7GyFz9xc/8dLYUoCsRGy5wtYc5Z2ZS9iTMHVBTfouKslZdMBf9Cn1wGyaj3KqzXHMJbEK41xiJTNRQsNoZ6Y+jGHtnAtMbgSsNQ67xffnndq5ubU7rIwG/GlXFZRDCF3qpmMi/xeMrmTF9CsQAr+dvzVyiXlNGVl0vk2QuMR7n4NTjZnQehNUdgxYjOaCdoflOxdhOe0oGZ+Y4yEyGhfNYuMADVITlAYAV4s6q3M3HL5h1jDUytIJoVEscMp2ay3xrCuReFucNv+LcVPuUud6aZCDkQDe804YDguPZFVVswXGuzTtdbGMN124eANi/1MkohwpgeI12+bDj/eikvu/E9aLjoeXC79muxB54Bc9NJXt8XAhqFKV0NvRflXhEz2xkVl906+MC0gDkEN4Lshz/pu3VRfIjtYqSO+I6+4S9ep+Pe+bS1LWkq1HSMPcO4YiXdY9vEHv6UTW4aDC97Y9zV9IwA3FK0sZ+sSy0zytODLahIR7UvE06qiJU3oKMcE8WhyaW2ViZawoWfr0ZUXUsJ4MeET7p4AsFLudwf3QpGRNeWBjW0pjfldmBBjXTRIRN0t2HVJLNkS0jeitePmpBhiyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(2906002)(4744005)(107886003)(36756003)(6666004)(26005)(8936002)(6512007)(186003)(83380400001)(316002)(5660300002)(6486002)(8676002)(6916009)(4326008)(2616005)(66946007)(508600001)(66556008)(66476007)(1076003)(6506007)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dO3/q/yzMNas1eslp0YZ2YAS858iImg4MTUyvK+zjhCaNDJkYrDdFRSIlnXm?=
 =?us-ascii?Q?3DojyK4mpeoy+yX5WehYAQpJaeU6NIUVPLVv3lBbO6yQjaLdQJLWS0QBCWRh?=
 =?us-ascii?Q?L8AuWbMVdRBaypMmY7ltQehe6a/ItS/LkO9ecdICiVm3SMylIsKFFNafSngC?=
 =?us-ascii?Q?jpPIPjI1avrNREK/YXaRzJ405imUos0lg0bjJK7cpDdMWL1226VTBAwU2rcN?=
 =?us-ascii?Q?cSXxVIyXnk9Qc+oNIbiErCvhRe6GotPX0l99CiQbKW519cLbX8Uyawv1G1Ht?=
 =?us-ascii?Q?ZALtq/IN9HBAcKy3RWrjHbVyicBjjEguAOz0trADba5GIAweBomCJ02jFePK?=
 =?us-ascii?Q?QNR7xgtBoInskzpw0ZqAWMqR4/iQImZIDYp/y5RK1ahErwWNIHxBP7xjDW4D?=
 =?us-ascii?Q?4GFlqolpXp5D7RPsgWDxac3N6yOzYv1pOeY0uQYLPFHqlO0V01iAmOl02z4g?=
 =?us-ascii?Q?5TLu7vMzkiSbhj1vYVan5DwIElx8tkgVNATjLGij6OnwPxN8emwnLb+uQi7Y?=
 =?us-ascii?Q?jOrqwEBdvQhhsmfTeHteqG4yBXPEThCJTdkHEUX4WC6f+L3Q4QqFm0UGTYeO?=
 =?us-ascii?Q?b1+iMlZCNdi4DX5smaNXktfXItiL0tyInLZUFnry66o0jfpUq9AePicu+LTh?=
 =?us-ascii?Q?pyYDYF/0KvdPhaHa2fBSOcv1aHkBxLDoM+OLMSjiM4m9ASUOsaIoSCOcuAfF?=
 =?us-ascii?Q?I16fAFQRxxXt+HpB8c0e2A+C1ba3LdKpWCfYOx5N10IllIrQFIwUvvZaSYhX?=
 =?us-ascii?Q?IqUE2plqkLqICwguz+RyowNBpczDxOF+RIhj18qHl/MWPY5P3FEP9BGEexYv?=
 =?us-ascii?Q?vNO53+D34RDnyJE62kSssKZsEDz/8occJCcyH6bMH0duuMTVG36q0KxbFA3M?=
 =?us-ascii?Q?POqZ2RbSm/RtBSd+jAdlxWC98TQ5mFYQ8sN+SqUHIO/CCx53lRjgk7fQ61mT?=
 =?us-ascii?Q?ZU8B8Ey09SRJWwnJ3zgPDOUOTBKg66jrEjY+N3ppNWqoG8yD2HArx0WwCJ5E?=
 =?us-ascii?Q?vFybznSRc0RAk4ICXIyV33CpVE5mJK6mSbcbAp1TM6a/NWlhl5FmdX7wckoX?=
 =?us-ascii?Q?PpvNjtJ5/N2tTATyrAslHtliLcElvR1qTblOImhN5c0sGYOLUmWUOHuMNEWv?=
 =?us-ascii?Q?7cGtJ6j2oULQrbOY/fsZi7UQyGVIogf7YpqNst7Xzp3IMsXC/1FZTxItZbza?=
 =?us-ascii?Q?uRLjMbhJ2yFMxmy+2mkFME6T1jI+eXC35bflXQt0wKrcqmSt5QV8Z+9grapA?=
 =?us-ascii?Q?du2kBaT7NPLAeymlwm4R0dHNECZq09PwRBDCMfyJf71HoTyTdCgXxpmnME2Q?=
 =?us-ascii?Q?0UEKyKRiDBc62a3OpJje0gdGE9QcDg3bH5+8LzOxEQyWiJUbgJOepBbLQxwe?=
 =?us-ascii?Q?NFjdTy2Kcb2Cs73JgYQcXsvfR88XXNA3j+cHwhFTrsqmZuvRfa5ZVwRxCXms?=
 =?us-ascii?Q?9M6N5VJtFCww0ek8YmcmeHOspC+8zpgQG+noNay5aX7uT/QSrp+zxWm7/Jiw?=
 =?us-ascii?Q?dWpQamAnqzPnQs8ePerkLqQy86QPI5ipeZWT0I3ytlv4LdfY8zoJkeTWTNlS?=
 =?us-ascii?Q?+ZvKCoHl2vs35MAKtk7n8TBrvIz1dBzF8ksED6zV0OK79DkSqxjJCQzeIy94?=
 =?us-ascii?Q?Eah0Tpie0kIvYtNsselhAV0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea831547-cf1c-4b26-6645-08d9d7d072b1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 02:40:53.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m0QTp0Jn79vA20CZN2H7As6pjRLSiCDCXTpj5/LsTt9QISq2tGzw+h5wbg+tVGG0myv8UKUWny/Gz0J7m+tLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
X-Proofpoint-GUID: uwgN4TvXdI5C8VgpklE1YkCs2tjmRQoF
X-Proofpoint-ORIG-GUID: yzSInqkhp7I_F4yYmCp2wzvjlPC8PHXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-15_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=247 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201150011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160597

Hi,

This patch series backport two patches from the master branch to fix the
crash issue on some cortexa72 boards due to the crypto intructions are
used.

Jagadeesh Krishnanjanappa (1):
  tune-cortexa72: remove crypto for the default cortex-a72

Kevin Hao (1):
  tune-cortexa72: Enable the crc extension by default for cortexa72

 meta/conf/machine/include/tune-cortexa72.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.31.1


