Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F31C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:54:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2546.1642211652949582858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LNOSSZI2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F1pWqq025583
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+YRPnoO2VBMlnHM+kSf61R7rmAYHuDXVDajvrX4M42w=;
 b=LNOSSZI2paO9yiompEt8zDmYHLNxJbAcX+2dooYqxmS993lkG5hqUdi8Wy0/Gpu+oY6q
 ynVAbh76ixnMemFuqarFUEKG83sFUc0k2tGNLzRXaZ319zw0TSEmNboxUtah/tBlM8ad
 sxQcCvr0mqikrVcBcQNTF2BRWEx5pX6oVBlVszg6wA2mnU510mQo+OCwnTfkscayYE/5
 13p63DxbemtEtmcrG8jxWxKvkgiIesMT7Yw/EqdHMaFhI+29+PhrjGbZVgVWScLvYVzw
 ZtdW7OQVSrM7riJUDduKzIjcxaxOGaIBiwQMFZBuKgXlcjLHq1hC5ohVxZp0RfLUXrZm oQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F1sA9V027763
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jan 2022 17:54:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpgWgTwSB0+YpuJa6jzltlBmcokUIXTx5JxVzHvT3BLb87mjNHfRcwZE1KP8MJLM6Bk75zJ1uo4IX3SPOnySv2nbN389V1p9k77uqYoi4hOsLsCh3/Z9s/JY3quSKZAKARKCeZmJE9mwq2n3QxX0ziOyjWP5Y6QhhSSsZNiC/9jZY0Urn/G0Rd5T9hYiCIlKUOBXEJ/Ft7WXR9fKMFjnlxsX0GiUo03oOfv3IqZlQkOmj3Nv0vyD/4SmH2MEACZEsO5rwjzd7NGTwPsFm9lObTVdPVcpLaWvTOdOgHQesQzZj5FB7j5gbdtVCfMEqY/fq7NDLOPMO4ti/lmlrimjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YRPnoO2VBMlnHM+kSf61R7rmAYHuDXVDajvrX4M42w=;
 b=YuZ9jgjMFZLUN0B8iuzszRapxlJIzoSg2j4p1HBumR9qTuGumWjbsnRNvMwqSMod0PS8OoWUKezzW9mNdKpVtKpVlMQRcyYawZC8G1EGqLjohZ5bvQ/9idc/lEE6x5pBuDS3Dn3hJoGq3wXpfaNYF7QmF3HDAHubAQo3ZXTZWyjPZ/U/u0TMn7Uj1lCLQAjdF9+Vv37qZsi1j44JdPYx7jS7mtKBTXrY3Ll9F3ncm30kUkpYMlF2QnNEs8fbN7S6ZvzkVvyM/XE1gy5+XbRgBPCJHhHIdIDe+wpHZFgSlFWkd2cmrTGm6h11Yk1TC0lpR1v07Y4z9a4wgw6M/KxBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Sat, 15 Jan
 2022 01:54:08 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 01:54:08 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>
Subject: [hardknott 0/2] Add tune for Neoverse N2 core
Date: Sat, 15 Jan 2022 09:50:42 +0800
Message-Id: <20220115015044.1142719-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccd9fe3d-f2b1-4042-676a-08d9d7c9ea72
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2223:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB222324C1BCDE309E0FF07CEDE2559@MWHPR1101MB2223.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ujH1aHoYRPXWVkw5SVKjo92pJvk5VvC3oc+/KqHikPMyp5yGPbjyBnqZ5J/Do2r+8CSywQA4brFE1DRCZV2nxPgL/ibITyhQRz0/AXadv13ItysAaZq0DMQcpus4WLthwGthnEGt6NNS4BhhRCfoH3D1Jq36b5iCPn16YLa9c+kCtoNqKht1Dqm3W/YWjSDzFAL9rYnxZSqG8zYzw2OjAhrAIppWR/DgZgNlfaUycfAzRTzJm4SZAkvAjZOu/s4Ucvs8oO9d6iVFTwEtYjJ65rN6yFZ+1NekgHz/4EFcBrqUrayuQiuFKrO7E9sdjasGgRnZ1LEMiFv0uYr39iF03rqGybZgawW/+lcb+WbPURMX5o9M5d9MytnW8xdB3gHDYOC101aslg4VPWP2j1RzbcnkBksJ7xFEa4CJq3XbFi6blkvkK0sksO23eS6dJflc/QVPo0xVSmX/nw+Y71MAjtmub7+765e7FxTaRiKrFl2AIuURM82Q30XsFaJhaucWc8wXHBetRatJg1shMRop1YFNyEqDZb318KHKBSWLRYmfDYbdiKHzzld0msPyLFYyg6EtWuptqjtOmDGWMSHobb2qtqcMseG3If++W5ooNC53i+a6tWEitxcjE3s3Zf9q2bSDszvs5sa0xHDjWmWeaxFGN+9T21PHXcVXStaafibyBGU15M8wKlwQxICMvDFy4zQcGYM2evjZz2lJ/WUfvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(66556008)(86362001)(6512007)(2616005)(36756003)(4326008)(52116002)(8936002)(66476007)(26005)(1076003)(38100700002)(6506007)(6486002)(508600001)(38350700002)(6916009)(316002)(186003)(4744005)(66946007)(2906002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?83RrtSiL6LEmhayXhnbIuxD+Q5Xd+IQR5vq/n6gtzyXpG8HNZafKVgAR28O5?=
 =?us-ascii?Q?RADNzJlR6P8sToLj4aN/FbvA9QABR2zROHsePlG35rpNiNnVaklYoyA4OisS?=
 =?us-ascii?Q?dt1m+J1InTcT0PMXqu8d8R1lGafBMy07Gxe7NT7Fz598f3L7LDlYshrc7/WS?=
 =?us-ascii?Q?YI5umjbaOplYvPhJR9vaptxLZSLpGjYlhLfQO0bVB1q4j3+ZvFN7EvfelvuQ?=
 =?us-ascii?Q?w7Ewq7qt3n9zhbSgiCDj4q8RTPVqlxKuP9e4qncnMo4HKZTktAaMSuyFhmey?=
 =?us-ascii?Q?3OHbOejDvWJfhbj4/k4B6NwmFRSUR/1ouu/DL/JQQPLKKG6rsINrZScC1E7m?=
 =?us-ascii?Q?F4SJCM1Oil8WcRBjDiaeW4g+YZk/iaPQkMRnmxv5QlfwH9HbO5l9CRJaSCGY?=
 =?us-ascii?Q?i6MgPkqXVYUZ5y8JeejyCz5eRybMismeoAdnDAr9O9QTHN516f/jR9bJb3vI?=
 =?us-ascii?Q?hykvX9v8/Cnvhc9Vy/qFefXzMASGF8re+kVmSPiu2v5vEN7ggEmuL+f3aa9s?=
 =?us-ascii?Q?Zpz7o+gK7fYcal3wQCVrzFrLUmjZxaE4ro1Z8BtLsEXZYmhk9dh6OOrFiK9o?=
 =?us-ascii?Q?19dBhiqslbCDzZ/dAYxCqX1RJWW/cI6bLTzpei16l7bOFS/ftMa9BrlF5Pof?=
 =?us-ascii?Q?CNq0cDQAyNPQlc32jrEYdaMfZ3LmrObWg/egyQMdJLsoIaK7s7sAZS+ZSb/+?=
 =?us-ascii?Q?C4I0ken4pNCpXvaTeeBSmOhYIFuhLTMCq0MENTI0uoj4pqTh4Qe3YRpzhC+f?=
 =?us-ascii?Q?PAJLfF2pqCgTazipznAT2xup0Ylz94Ix6tgC7p8ozYNa/sDJ4blFpQFyxs4n?=
 =?us-ascii?Q?+X/UNLgRJi53K+3sW+aiV7JbW4G8/yCihrSCiWByJ5N6ftlkAhzdNBajO9Pr?=
 =?us-ascii?Q?UGelEet0HRS0vGkpvCejFhLOn8qo/QnMbnI/2S3lP5vRdzfFHsos9Rcql9pS?=
 =?us-ascii?Q?B0U/EU+nMIFM0Vkq8RXFkP4wr9+7TtFne9zk/tHcYYI5Lu1rhJHRNc61oYvE?=
 =?us-ascii?Q?eim+BaWRlK0sCFm0/viF2ZNcb2ToQ9kisV+NDUUqZHoynaymJHLcholWFrLA?=
 =?us-ascii?Q?6Fm15ttlI86YWnQsfMVnAA42SDyiBodrtPKnyuutT7GklGM+HdAo19voFo1N?=
 =?us-ascii?Q?ZBonPtpWcwqMBaboRCzGhYWuyVBESXvS/VcLH7b6/AD1v7lDKB2LpD58IZx6?=
 =?us-ascii?Q?ePAjtinJvJYSsroDkbyC1hIo6c01amqbjzPKFX4eJ7MWXAN8k1VlHLFdPqlP?=
 =?us-ascii?Q?6mZ1mtPDavGwyMbo9ZX7VeZ17U5nj3Fsgr74tqIytfwNWQbg75ynL7takVgt?=
 =?us-ascii?Q?971uwoYxczFIBU60QqbYT2tl3Pdo5s18whZgEdafsfmp2Da+p0VFEuFL5S9v?=
 =?us-ascii?Q?CdGGPkXR5sQVkhMvupmpHjnTH/+ZbLaK2pNwF86Rr4eNo/qYOMv28J98OL7A?=
 =?us-ascii?Q?acpcJ2tjNVZvf10EL7I9nU/7r5Dz3DHyMouFHe0egt7UJL+8F7FG/uvc9eoU?=
 =?us-ascii?Q?9UQm754RnDTxoN/uNuf0ZJ3RUh33oslVB310Lz2KeuoegRW8jOnko17wphvY?=
 =?us-ascii?Q?nWWwwo+QYdSJPkaMeGJACSEvCP0OqOmOx8hspfT0147y+J9nswuTd7R5Hg32?=
 =?us-ascii?Q?oDr7tOe7tZOrOxdK1lJ1fcM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccd9fe3d-f2b1-4042-676a-08d9d7c9ea72
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 01:54:07.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yNLXmUxQox4LZnYYO96OIyHSm7AEwpA+wHnSy2giocHbYpEyORhoCAlV2v8GEzf3WmYGUu6Z23bIsYDgA22FxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
X-Proofpoint-GUID: JIohdcyiq4BgM1ugVEU-6B2FHLhXNNCy
X-Proofpoint-ORIG-GUID: GSnEDluOTqKCJ2RrqvYkdt6Am8w-fp1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=386 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201150005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 01:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160593

Hi,

The gcc patches for the Neoverse N2 core have been merged into hardknott
branch, this patch series backport two patches from the master branch to
add the corresponding tune files.

Kevin Hao (2):
  arch-armv8-5a.inc: Add tune include for armv8.5a
  armv9a/tune: Add the support for the Neoverse N2 core

 .../machine/include/arm/arch-armv8-5a.inc     | 19 ++++++++++++++++
 .../include/arm/armv9a/tune-neoversen2.inc    | 22 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-5a.inc
 create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc

-- 
2.31.1


