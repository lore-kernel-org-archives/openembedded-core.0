Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763F2C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 14:52:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.33630.1642344748231283464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jz+mHRbr;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80157207cb=kexin.hao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20GEqRUP018877
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=h7BQ1CtR4Hq9QN8gSRNHppKYWqzrnk/18O2FT3IhHwQ=;
 b=Jz+mHRbr/ExuoPjYnCDV5I2+IU6/2uPJGvyo2rjCCpo1+RQ3Zt6x+UFJ1CAkuMksZA2w
 ySaVoo6jvbG2YHDNtQGLLgVdgqigmTywpWiRrtKVKhBgyF8lkC9GsGtrZWT1f+SEz1qA
 xfvXk6lracjaUtvfV6hm9MikBvlRdXEdY6lHzEXicB5qMbNKclI9DG9FW7Nb5Mgg53TG
 sDyWgGdh1FECjx+N1x2jaSt9Cf+tPqfNq40jr/Ul3oQ5coF+pwN2q/ERBH3f4a/zC2aG
 wh06+qpLMBajHbjmBXLvXVOjdiq4XK7/5z7olS96k3jbxs8PfzErmhveWWUF0AwT4cQo eA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkte58p3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:27 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20GEqRmQ018864
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:27 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkte58p3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 06:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+vt7dXEZ/tpfmqKLNtn4BAIkgepp5xAGWap53nctXn3sUE0YxugnNMgtAfTvCRZL06X9nZa3KOw9Wcvgyw5uZq6wZfcDz/cafsLq5vyslLK0kCx/Cvu7vFATPdyPltCTsjO4bUcErq/IysPZBT2DcMY+o+3s1tt2zyJhWr1KfBydSDsbhIWRY9hO7i4eeWjaHqGacgC+enoJIV8uBbKcvDFCUuObf3Q+I2dyu5Pr0FBTzr2Tpw4W+EPy7qiA17su9fcoYP4P6RT7GssCM9J8jDw/zge+PqGPUcBqx+xyiw4sLy5a7Ibc/hFcGja8Yt2/iuxD67TJIKULj0b+dLbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7BQ1CtR4Hq9QN8gSRNHppKYWqzrnk/18O2FT3IhHwQ=;
 b=O/Ipd/Jjc2hyI1s41BcPlYI073quJHziPx6QwMrlMLypkzgxzeq2IjbASDFNCP13Mf23AoPiPVY/Izd4g2aEUXTGtTrA1yFLMq8ZdI+q1UAY7dcdPcJ2BL4GwFUjnqTOWj8AarMVO7yuvg/1ynDKpiErYAPZ2vKV9T4+HMQvDdy924fObwc6RX/4rQYHb+nhYAdmIa+BZBS615n2UrVLngmjydswlVVy8i2Ldy6dhsJ0k3bFHzoPjPDC9g59p/HYSEne143KotQV8+keGWB0aUc00WvDYMgjwrp/J6HPveFLsr21GZg/Ux4gC+TVrcrCmxSIr301BJ9D6Wvr+js2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sun, 16 Jan
 2022 14:52:23 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sun, 16 Jan 2022
 14:52:23 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott v2 0/3] tune-cortexa72: Drop the crypto extension from the
 cortexa72 tune
Date: Sun, 16 Jan 2022 22:49:06 +0800
Message-Id: <20220116144909.1924922-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4478ae71-0bda-4035-8549-08d9d8ffcd80
X-MS-TrafficTypeDiagnostic: BY5PR11MB4353:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4353510DB885B2490F127C9DE2569@BY5PR11MB4353.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YYrXLKby5wz/ZZrM0wDtEtO+4eRpu2jsDM5I6gt3OxhZ5F4QgmLDZi9gX5LovL1pYF/BfgaAoAOPRll0TxllfDMVpwnx71qtvvKz/BlpNU46Jj0AOoLyyMhBvcQ/STDm7BB0JdBFBX/haonussSJnn9EYsr0ZmhmanTwcSVavmyrCUfrt9QZ6aSEUCicTkxQ1EjvPc0qrdrVrWtwUlOzNuYHAEaGC4yuHzLy2i+MEPp8e5o2Efuwsytb6eJOlDf4kbUP0mqqoca1yA7+fTiDlyaKqNLWj+8reaiT3Nd+veHn/H9w+MsBg98HFlNriqK2asfVn4Jnpecq6lMBvcdKReNey22nAuMDnk8QEIrlznN+NAhjehbXZ8mYn1lAvcHsQu1gVtM5ttTE5vFZPvHaQ26zBS55N8kWDGdXSQ7GsiD/9HSARB5Wr0tzob1NH2010h+rqJv/Sc0BIMK1ZetW8bNueNmIblkwvtGpWL+stq/saLLAcl1erzXbyT0IoXFEBAepWM88ZFzu9WMj9Oy9X7uRy+8C63Gw8oq8/poeJIQw75CFFsqfHGYYpUhp+UfT/A7BRo3CvQ9BH7wjCU3JckkQr5M/7/+Y44RE9HkW0NMO+U0ZgKJjqQu2YmevG4sRne4MlyTDd379npyD9fa38noH+3oWALy4qqV1uQKyVyp5918jBdv3kwrOmAo3CM99n86H9P3YFISOWVu+IJ4yeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6666004)(4326008)(6506007)(8676002)(6512007)(4744005)(6486002)(86362001)(2616005)(26005)(1076003)(36756003)(316002)(83380400001)(2906002)(6916009)(66556008)(66946007)(66476007)(107886003)(5660300002)(508600001)(52116002)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4f9ct7i2hGyYjxXUUkgn+Qk95efSu9Uz+3CuaXwBBp8KpeAvpi/ofFJWgxA5?=
 =?us-ascii?Q?h+2P5Y5T3PRiwdgyqPPf/21S9C26pCfIcM27PahrBNmm1ot2Fe/lA9bbZs/p?=
 =?us-ascii?Q?k+CdhDtSgJbv/XEI+pMgfM1zBmlERZuW1pbzUkkzfwXuCUeK34uy+AsWgpRL?=
 =?us-ascii?Q?C8RwG2YOZFrrJ7IN/nUskv+9MHDRGY7hrkOn2UvI0O0kxVr8jG4xRu4wD9sN?=
 =?us-ascii?Q?t1CmFyL8rM5N6DzthTBmZIqSG3g+swMtXHgN75iCPPxHKRQwQwP/sIGhpflo?=
 =?us-ascii?Q?FVc3Ahw0DYJN+r+7SBlbtEbot0Hldf7/WkHEG1pnWFyufwwcnGChATivd5c4?=
 =?us-ascii?Q?w53byIDdVNuFvtKzm1PRKs0rz0PZfwyjkdPq0MJTbubDrpqFHsfVYf7nY6Tc?=
 =?us-ascii?Q?EkmwhpOLX00FuFwWu7huK0LqfsFH/SgB0jT2LUV995tSV9ZJ/sNUCtY+bjoJ?=
 =?us-ascii?Q?YFL2H+7xF+8l7lOXr0XjV4qvrl08C98tJF2mfc/CTOLWWfldDfzReGXMXzBR?=
 =?us-ascii?Q?vBIbSSBKK4z7WOeq/oZJ4i1HtyPTdfMS4MLn6vApVu5Y/vOafgc3J1mp77bt?=
 =?us-ascii?Q?NG0MexiX0D6D95HZd/IJaALnNdHYWIj6AqkjZ8bYO9j4w/cHYZsxeonNcTTI?=
 =?us-ascii?Q?jeeFY0nbUZHn7Klpe1mjQj5FbHa8sDW2VAq9wH9cyT2tukwYBe8MZAbA3rSU?=
 =?us-ascii?Q?lrqCVg398hocaESDvVeoOrAlugqIswtEYxtqhHNRh0I08WzGy9UI1epZVwCy?=
 =?us-ascii?Q?jqdblxpcMiRluHQn3u7QASHe7CXQcYdS5NZhlccDEW1T90pF+wCIGPFhFVgR?=
 =?us-ascii?Q?deiHb5GQWrfO0A/YzUGmVLpRRQ5YrvJsfik/eQTQDFTmxqWK3QD2s91Isa37?=
 =?us-ascii?Q?sDFGzXSGtTjltkz1/QhY3spmansFsbhUogEpyOe6sOC1tMiVwr4w7o36NmBz?=
 =?us-ascii?Q?eN+G6nvsaPoIgi5ZNyrZ5sucv/MfhaxMalit7dOo3wQP2yf/OI/DSfQLJrQm?=
 =?us-ascii?Q?rQ1tWk1lfYUkocQ0Q2WoXYIlBMDOz7nDCoHfKQi4MboC86/qWDAT1sKE3M0N?=
 =?us-ascii?Q?indv6tz7jKY53Z2ClRCNxnUsURWNoxkEvobH4NJckWIibt7nTkWnG94BZPwA?=
 =?us-ascii?Q?dHrj10PXMy7hjWI3FXLcT2VQS2JsTMTScRGsesEcPnX34bHoxKtbSJJHSYVp?=
 =?us-ascii?Q?O8Z1r28NScIhCmaHYQk7q3obbAWALKCCX1uqjFemnnNPyXIHE/QlcWfOAsEm?=
 =?us-ascii?Q?UPCVCivvWtNJtI7WpvlJlbHbyyM7iqeJY/WICxnaaldLc5Gc5oXtHJifPCVB?=
 =?us-ascii?Q?d/gaCBdcf7z6Z/jLqOJDTXZQPYq9F+1o4VFN4Dn5fJTpRM3iXsDL1ROLREQS?=
 =?us-ascii?Q?/JBqZ+DkdHHk3ZeXDthTI7dqnRoo4aUX5Y79G0gfTuP8/GbPJAJsoTetRgfZ?=
 =?us-ascii?Q?C9T+/ozxKHjNUH8zz3v+0QMvgQWTiyhD8hyuEaErtp4Oq2/aCn3eZaey6RMY?=
 =?us-ascii?Q?phJr1/wjUN1Mt1AA1yynMjEmbJweEq1wMwuB27uU1YgFmwmE5hm+SfwMLcKE?=
 =?us-ascii?Q?VJOzED9wKpbm93/GFQEtKwHd3RTOQ5Bs6F1r6srWQv/HNSYWu28TVODTXFtS?=
 =?us-ascii?Q?izNtH4xmrAUtcmCpYyJFLtY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4478ae71-0bda-4035-8549-08d9d8ffcd80
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 14:52:22.9240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nrn/sE+1yszgGoOk4bR1LB2enpIq79UogmM8UYnxjNJ5B5lc+f/oroGlhXC9d/LMHFGVZXaoWmFO8K/uIikVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
X-Proofpoint-GUID: kcRLWsQ8Ppiy0xuUHAdNKRiLgWRYDCaJ
X-Proofpoint-ORIG-GUID: phABrqb8rUyKMxwmbNhs8Eu5Yu562NhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=273 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 14:52:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160609

Hi,

v2:
Include the patch 3 as suggest by Richard.

v1:
This patch series backport two patches from the master branch to fix the
crash issue on some cortexa72 boards due to the crypto intructions are
used.

Jagadeesh Krishnanjanappa (1):
  tune-cortexa72: remove crypto for the default cortex-a72

Kevin Hao (2):
  tune-cortexa72: Enable the crc extension by default for cortexa72
  tune-cortexa72: Drop the redundant cortexa72-crc tune

 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.31.1


