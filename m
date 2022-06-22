Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE20C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 19:21:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.11839.1655925687417010859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 12:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nIdK5v0A;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3172a7b279=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25MCriDr023689
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LZO+89BLMd1rtkXoejg001hP91j3U8T26GX/YAiCVWE=;
 b=nIdK5v0AoIN5jboPiNj3AhEefiavGRa5ZFN1htc33WScgN65LTHybpYOv9HSTXmwhzkK
 /QZubahDgHUldqXt8nsofUSpBRcFO0Hm32Du6Mj2fBmXHh24G0q99lvp4oPAFmsWzOwl
 JYOCrLzKVVWUgC1GDpx9ieNTwsuxzqXDEdwddWtM+3k4OVet1oXKtQSnBNvthzSIrzJ2
 0qEr5paSyE4UBxwBqCnY/0BLCoHZj/9+O4ken2m7EB2mb/ZRfmrEfylLTTC38I5kQV45
 D8HF1JiWUbi5HDIoupbCSuIrbLjZABNR15GrZEhDn54piYQ6z3y595oe0WgHdK0zBHbV bQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gs3x1bgm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 19:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmFJzIktyRDfOWI2k/GGvSLgUDjeWrTq9cdZJHF7nzDOpE0X2ewFMH2FG9I7M50G4Tnmh9HVFLa3Zr4ecIz5B9y8NKLWusq55d9fjQoYxQwnxgl70JnR6aAD9YrS5ouQqFltTMrG7NBXQQQMKHYD0r/+KuwbSjJMlkdIAej+PXYSWQshce50gbWIR7PWsVAB5mxt1Q3hH+YngRnrggV0DOOW5BD+5YzjXGH6uUES2mpJKUCBkQqPp2NtRgctXXOu6pB6T7S1DD1+aldYSHO62EposMmwhw7i3F/p3TBGK33QAX1Dc8NII+l09fF2P80DL1BNrib05/lJdf7eoYCjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZO+89BLMd1rtkXoejg001hP91j3U8T26GX/YAiCVWE=;
 b=DDs5wJzxUhGR6GY2DPi1ilsu8iZzeBG4bnp0zjy4Axq+ADqgQlShCP4z1hN6TSCsRCrmYMG0/K8CchYoFqAidkr37KL2FqH6cZ7Xxq4iM+9jyndNCG9ltinBao0oJ55jm+Mnz2X/94A/9tp9RQSrJuiXUUr21o8Qnq+jlK619r6STWG14G45qOAq7MliRAvQUFBbQbhIvkVDOT3Rlv//lx20qxv7hk9aLFs6BQQs/hVmSPa8ppst9wWAqrCAANkndhut/zsuchOM1wE1InTABfvbbr8Z10pal9/ODKVhgtFHzGqQ4o0+W4J9rXDwE+97XMY6EzZ153owLIz4gGtd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 19:21:24 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5353.018; Wed, 22 Jun 2022
 19:21:24 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] V3 /proc/pressure buildstats
Date: Wed, 22 Jun 2022 15:21:02 -0400
Message-Id: <20220622192105.2177756-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::42) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba724db2-03df-43f4-e723-08da5484658c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4497:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4497FAF320123D3E5FA599E7EBB29@BY5PR11MB4497.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5z6EAbLiGibD4Z6OiMbNYRloCdMtV/0Jn6eXYAoSrdf4O/p2BIHbMkWGU0xQgB4PcGNMSXYAGqGnIZLr7d69Lfr0g2xnBUp60LY8Kywx7n2z94xnPAee7nfoQ2Jy1Q4ik+QQIFHAqqivB7+RuIHJ0U43c6tLbmS0yalTY32tY6JBNjNeySMNabt+0fNMJKgquvXpL4qW3iQia8JSLN8vjDPEUMQ7HTrqzClaqcuTNirVuQh3uu9mPs4yaeBGPE6ZOLuTvoEiTxp3AOr3N+nqAwpheHx2noCDgsOA5Z0xMa1yUymbNAAEA3kVwWJrWCZWsspyuZnb52JTzmZ3pvZTxiEQdV4P2KpjC86khTx9cAtJkXw40CM9cpL7adVsD3tX9MEJCq+sF93EQsnw79MSGQ8ezEXgagnb6fIJgwbjAdu2rnYROaz/ioF6o3lKzabs0dp3cv9pvtQrTddGRyIQcZ/zaBulT0rfswztEQ4EgRdpYh4MmdpdIA6s/KWkOga3qlW2pdsmtO9valQjDfL1qzfLE5NMCqdQ+35hlsaN+X7tTHeTsVKKk29Bu1ATlO6F62tvroZosYzdu7ysvXNmWd28dJPZ5XOikXVb25Y1g30u/HGY1LS+LiIn/8e6NNfsWoC2j3oaBpeQD8l9zChVHLpzMxphsTzs0J9dRpSNFqaCKwiKBAljZaFTY2FutEmkCb7R4WTvkShhInxUIHJp0u3c2W4zhuilTFCRSneqlY9woKGJ9+SOfQdwuO+R4yaM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(83380400001)(186003)(6666004)(478600001)(1076003)(41300700001)(2616005)(38100700002)(38350700002)(86362001)(6916009)(5660300002)(2906002)(44832011)(8936002)(52116002)(6512007)(26005)(6506007)(316002)(8676002)(66946007)(66556008)(36756003)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TgWSGbCdiqUEuiB9l4RI7lV1S/i0jw2gvcjqsS+J8WduQnQm2rs8/8zZkIio?=
 =?us-ascii?Q?c1XsgJM5qkIOicbY2a8ZJ/5S7MoHwS3W6c1C7s5x5IKHAdnt8bGmV2fR7eVS?=
 =?us-ascii?Q?Kep2+UatmR70gbSmpf6zIM4RRp/+yYAZ+FfO1JAfcCqynyD3zpeYr5+S8s2C?=
 =?us-ascii?Q?yHnmZ1BFx6gpmhyRiISp139PjtKQtiUNhquQ934khnn7qQX4AXfk2CK5zKQn?=
 =?us-ascii?Q?xA+EB4eeg9+i9kbMYQvoV5HHk4bTiiGyWWIQFEK+VPhkKKrljvKGLgeq2S7K?=
 =?us-ascii?Q?KxalgXytTueITVyTOmqlTf14rbJPIrlXsAJHUm4NF9KbEBfvOJ8JPwBftHFi?=
 =?us-ascii?Q?3l92kaAhRqEdkxGI3QHyBHAdvcIg3uUIqiEjem9ENqQ0bDC9O2Qkgc5t7mog?=
 =?us-ascii?Q?MWkXntlpdRLe985Xu3jRHgl6+2CxKPYb4FmT4x/s4I6p5o06WS7TVhk4tBV1?=
 =?us-ascii?Q?ItMXk0h5oNZEf0l4iU7QKnr+kE50xMPLHfsALKgjbrnYHl9qOYHNj4xEMznv?=
 =?us-ascii?Q?tzyTrZO4mSxjNI/bUKSM5EIYYuXe/PZ0XzGwvTP+5413w86qloCtZXIDgtAH?=
 =?us-ascii?Q?fwx+Fxx08PsSbHkIDA4BFyTwL9bs8Yg8xOFvr7P+Jep+Q/AdMEIUO3H64Xtx?=
 =?us-ascii?Q?6/5eXfLzvRrRmay1dj1mtl7mylNfnTn/+SEJd8GNNkzGCh5Qz0g0gmuXd/17?=
 =?us-ascii?Q?ziKD+190un76+mNK5pQbf24zC32w3scJlzFEfUQD2AkRsw/2uq8gq1LmzSn0?=
 =?us-ascii?Q?iToFI3gdZr4fzSuM5Pzk/F29KpQp0DYV0EZaPvOUrWA6g1LSukYw2Gq05jh0?=
 =?us-ascii?Q?A8yMdEkKm7J+85yqFXuIXpbYHZve8ZnXXtKQdQyxeiGmy3cF+Gc6tgq4B5O3?=
 =?us-ascii?Q?1UsH4SVoDQ0JNecZYi9GOdLSxMj+VT7ostxjNtU3doIo4hw1bUg3Hy4IimH9?=
 =?us-ascii?Q?aBMAZzzWGMqG682eIN9TeOL5hOAOM3WPYDa/Y+02gCMgvefTyUUgR6OXajtl?=
 =?us-ascii?Q?dgmbPGuarqeTfZgGVOjRXJFVKJiLf2HbVlcc/MZMcCD6TBDhOw3OeD63NzUz?=
 =?us-ascii?Q?Qq+FKx5ZmX0gKunGaqPZofnvPdWvqVstHs9uCY/12krbkpzXTuHY5wWw7cKP?=
 =?us-ascii?Q?p57TCykBTYascUfXfEgi8rTFSiUB4BgLoT8qGw3wpIlT4O0AxR/5KswNpuFP?=
 =?us-ascii?Q?Sho2SmabdQypjiGq6ShkruIYfsFRzUFfd0eO6iUVcVbmK9xB29R1I+gY+CLP?=
 =?us-ascii?Q?FDn/zobcEWysrbCUuEt5b5ssBUaBvxh0uoqDiZ3NjsIizUMn/YbZIuBPXL5c?=
 =?us-ascii?Q?GSOjChqBrr3v6AmaboXLIEuXJVbRC/kAAWb4OGJttT8/FSSGd+gTqVY6McRN?=
 =?us-ascii?Q?+UWd6oPB1qoMzLW9TdIDErD6YxJ0le/fMIlBVxHgn3ZZ20S9OijAHT4NFyQ7?=
 =?us-ascii?Q?hy1k9x1tafKkz6mpc5awmJLi2m5qa4vHCgbDrWuCZPmiW7jB25X1u7IxduRL?=
 =?us-ascii?Q?kUxGgcYkuvFL20mWmNt902bSLzrFiR4DEGl4EeTz54ll/6IBZGEZnUBdnZ3S?=
 =?us-ascii?Q?XyHgNm0T7kPMWNE8QQkdW7WDmAb+RH1yoWhalvmH0HueYt0URmPk2BkPyxDx?=
 =?us-ascii?Q?YhZZt1ENrrRybLuDHmumzjSDCROu+4lJxaM6Ufn/3O6NVPOw0+xuzHBGGC45?=
 =?us-ascii?Q?Q20Azohe4L8o6WrBz8JDjrSnKKpqNoqYdLPUYDRpum5My1ENo+eTQTMEZn1t?=
 =?us-ascii?Q?oIYgHMNMVF148GQsMib6wdugHsq0pB8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba724db2-03df-43f4-e723-08da5484658c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 19:21:24.5932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NF2Af+U69LKDGIdEXeXFfp8eVUAyMbfCZHY0ptdn4nfCAxSpHqFLeGI6KhxOOj7vRxK51il5BZcQuvsBPvOxeOf6jE8ObUVOluZdUxgo9Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
X-Proofpoint-GUID: FW_f0lSVnhHMM4jPGyKDYYpRxTtA6VNV
X-Proofpoint-ORIG-GUID: FW_f0lSVnhHMM4jPGyKDYYpRxTtA6VNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_06,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=344 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206220091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 19:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167252

Changes in V3:
- In V2, it was assumed that heartbeat events arrived once per second
  but on the Autobuilder, the BB_HEARTBEAT_EVENT is set to 60 seconds.
  Hence, revert the requirement to restrict sampling only to heartbeat
  events. 

- Make sample return a bool indicating that a new sample was collected,
  and that the datastore should be updated.

- Expand and explain why min_seconds has a tolerance of 0.01 seconds.

While any testing is useful, it would be better if this change was
tested along with a patch that caused rebuilds to occur. 

Regards,
Aryaman Gupta (3):
  buildstats.py: enable collection of /proc/pressure data
  pybootchartgui: render cpu and io pressure
  buildstats.bbclass: correct sampling of system stats

 meta/classes/buildstats.bbclass               |  3 +-
 meta/lib/buildstats.py                        | 80 ++++++++++++++----
 scripts/pybootchartgui/pybootchartgui/draw.py | 77 ++++++++++++++++++
 .../pybootchartgui/pybootchartgui/parsing.py  | 28 +++++++
 .../pybootchartgui/pybootchartgui/samples.py  | 17 ++++
 5 files changed, 190 insertions(+), 15 deletions(-)

-- 
2.35.1


