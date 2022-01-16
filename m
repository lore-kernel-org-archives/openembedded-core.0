Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C916C433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 14:52:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33668.1642344748840899191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XI5FlHgI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80157207cb=kexin.hao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20GEhDNU030649
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=YgdDgh/r88BFAE4o6J2lFsCdWflgvEKAcK4pCY1YrEM=;
 b=XI5FlHgIi6pPng3zECbVjKplrk17ig0uN1zmUyjTAAzovtJEfoTlnkJ5y8BD7rbQBkIi
 iLyD1aSi6bb1FdLFQGXIoBDFZrbIBW/JX9MINGn9NZTDAoGojyXxRlH86lEUvMCvjJx9
 1Off3itVNRQGKiliVHNFaun0lOiJscfLjsIkJ1LgKNpncG2s5a7NpAKhsMow4jfrZu1e
 UN7Muw2lBmgP5VYQHqRphmOKlvJX2Jv3KlbyPQg9xxvNoJ+3QXPWy44PCEOwRS13tBK7
 lNxWHYfygtKf0uuiWcwzXiC6gYracgU+k/8pG6xW54RtyE1pS241NIhAJfqn4Y1FJw7y tg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkte58p3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:27 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20GEqRmS018864
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:27 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkte58p3u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 06:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOR7w7r9GIHjzlJhggmtsp3saC7xGFqnbAyFezkn6Kv/K8HSTxoposNaQPrdi2FqdZdBrqZmoDO5nCIj1wg9S/oHn1Op5MNojK++pRVvov5Aw2IjglPy1fd0l/yapLw6xv0Pll3ZlSikLiO7BvwsLOZk9ebLc7aSsPhxzb1e+TH9KTfNavVJ47xBQIGEhRWbL9IJMU8MP/j1qaj9RomLd9jqfIii3D8TsjF/qrLIUfhCu1DzIfq7SwgXXdHeum/lxNnZDRr8KavcOTC2xjlGik9qBagR412ovO3WD5Yecn+6xUqCsdHV9w7VCrbwx+Wtpea7ut/9YU8eSLSAaNL2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgdDgh/r88BFAE4o6J2lFsCdWflgvEKAcK4pCY1YrEM=;
 b=CiT2nYxIuXGa2A14ElbWryrIrudzeA/Z2OXbyzvx+Hz+z+oQ/yl5L0j+xnj80y/U0cyMSyKRwn4ukR46BSiVzExwGPgSlz+8MeXTzIq6C/aO6cPIQWVmaBbfrLDMchgzse+HF87Z6EhKyd/9uzuaJ+/5IKneISPbQnyVKRyafaBJdht8hc5eFVlcJQ9umPIJbBj/Rd1eVK77xwGodfGny2RrDqvhFObbGpUc06c5fGeg+kv+jPh3WBlMcgHsTobzriwA6kDFzIo2m8FIQl8ESerxkTiwDmMJoCbXInuGO2y0l8pK10kUH23ZIFK3QF7eDFUh6QdsPgpqnxpT1Qgkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Sun, 16 Jan
 2022 14:52:24 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sun, 16 Jan 2022
 14:52:24 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott v2 1/3] tune-cortexa72: remove crypto for the default
 cortex-a72
Date: Sun, 16 Jan 2022 22:49:07 +0800
Message-Id: <20220116144909.1924922-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220116144909.1924922-1-kexin.hao@windriver.com>
References: <20220116144909.1924922-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a89a395-9df4-4b5f-ab59-08d9d8ffceaa
X-MS-TrafficTypeDiagnostic: BY5PR11MB4353:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB435312EC7733AF8FDE08CECBE2569@BY5PR11MB4353.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SuwtNzshm3eOLz+NBGwNzZ7I3oo02JolSZXT+KYFkQ+frBXjbv3ecZJt7ZMBFt0zERRIYy5BO5HgcWVtOqukyjokF+MqU6RTDcXklyq+f/BlgB04sY3aYrVmWcwP0ueDWeC0f3jP6Vl36rpdZRGpICr1AwqZ0n3AVXqbuO15N9BIURJL5CHH6qZxBSiachQcpw6MZx0y9SYf6BlPJLbc8GufYqyA4IG7TPijkazS9Q7CIXuRu22Pe7xT717q36McXx8M6YrrjrMkFdCFDk4b/MTcnNp4HOYQzq1tKXr2h+o64sbDL2EVr9+55nCYvQa9zbKzsJyrpVGjVMmTz+a9Uy7+0uws7mntvvKOOGSyCuDWcPy34zwXTr3IvFX9HOO1f7vG/pPfQEPdWQFdIsermdZP95pMcWO6GohAV/BILTdC3L6BF+hPK1Cn136W5QCSN/AEBqewCrDf+RFTAekv+rPCs1nKn3ifXE65rl/OYMhJwgmTwPOnbFWhH8yb2oXg7CYGUSR9S6HRjbTIW8iNsU2DSwa41kH27152yRz4Tu11BP8Ky0KNEYPqmlT6NQrPv2roOYmEp17qoDtkSA8AmOcm3yzzmfyn8J76C9xbdF5x6PQWCrCz4Qt6xxOrLsCnnog9o6Sb6SgjjOqJNA8KFxbaPv6VfSLqhpUW34erNuHOBZPL3uOvDbctgiCS6SOAt4JlAU3Vi85BK5ElvCF9WQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6666004)(4326008)(6506007)(8676002)(6512007)(6486002)(86362001)(2616005)(26005)(1076003)(36756003)(316002)(83380400001)(2906002)(6916009)(66556008)(66946007)(66476007)(107886003)(5660300002)(508600001)(52116002)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eV7GA5I2AEjOZH8q55xdFcAO7XDIBCkfVXVdRa9PGntyLhr0m5PIOvrGB0NR?=
 =?us-ascii?Q?TLD0n1Qq506pALUshkketkLbd2HZA9LA+0qyFTUhq6Cb3mLnnWzTOYHYHjx9?=
 =?us-ascii?Q?r5aYdCG/mUIf4W7dENtaboEXfTlymSxIuYd7MMEIdFeIDWWebYpj9AOHUFKu?=
 =?us-ascii?Q?BpJEMyBHp10Em+Hgd9eL+0G2mr3wkEvvz1wTcU1/HzZyBWi1kpgEIv/TcOSL?=
 =?us-ascii?Q?MQB9NtXS1HHdLU/AxMLrJW6frJhPdw81mo5CLJxOOUSTr0FfJAsWRvxBaOTs?=
 =?us-ascii?Q?8XrcUi+p4wbFNlOvUIcMR3PRjXYk4GvhoEwWFSEl+hjBD8OGaiGrY5+AzI96?=
 =?us-ascii?Q?hu7uzjQ3jk3GOKkmUAJC86gKlnSjOK/rjQYtJfPyzpp3YOpQf59mbHx1Ptvz?=
 =?us-ascii?Q?JeXtEISZOTOVAf5Cc0wcBjcaeXoVobeIJ1EIRA5YjFgCOASOK0UyFOQrQyyS?=
 =?us-ascii?Q?pyYd5JDKnZPH1piTe1wq/9d//5UUE1vJjN4G3Tj7Pt4QBYceGNRIAZcQZXa1?=
 =?us-ascii?Q?0hdWDFalSA01qmYXYxFUG6enE7W+YOA1AXe+eDAgGnr9YqXSHoRxBqlR+MsN?=
 =?us-ascii?Q?4GDc2upCoCCD+67mvsSGy7jYyqJ9LYgFxN0abC9ytIVnLahVtuMdrJUAMded?=
 =?us-ascii?Q?dyR4eO1JIs50csta8SiIRLxZ8aOMarp0F9tgxOtzMaeR1VooZUU4qqjPKD4P?=
 =?us-ascii?Q?/OE3xiC+oNezDujMxY8wNFZ8MOCWLDj1k6wBpyLmjlntsNnlD9hRPGczf2st?=
 =?us-ascii?Q?vEGna/eXE58e+yIPsaEnNbHaWFlj+I+EBOzkyAHVpOWXXOX7aslZ9rR80EOe?=
 =?us-ascii?Q?QViJidI24tU1jgs1IfXM+AK3UQz/Y/UJiCd0LkoQGLKn+jQRmV2N7uNZYsFU?=
 =?us-ascii?Q?TBdNliomAxeZbIGtE3ej2o6A6VyjlQyuuCJkkMfQCj+2r4F8E8eHKwFKmx3X?=
 =?us-ascii?Q?DaT1G7ac1mRX+cpSJ2VlCtd/6erBu+sUrZZthbzahDZkq2xvdCBg2c4Cby6x?=
 =?us-ascii?Q?ONvQArw074bDbf+VUDrLfCkLqxYu89RtRi/jKCIygHfg3bm1ttMZRPAQWhJh?=
 =?us-ascii?Q?PClq5o8zUcn4kUin2mJZDL6AbEc5Y0CcvBNYHv7Ba67DOQaTZMBVFS68dg4S?=
 =?us-ascii?Q?gNuL7pRsGWTbZwVV0BIBt0tgCFWWh17zufH+Zq5gYmdtAftWB+shiVoU1mpw?=
 =?us-ascii?Q?47mdI8AQJ/Q0efxY2VJH/Wt+2IqxuApeuKKNvMcRsGC4Mnc5+45LsnEAi0bR?=
 =?us-ascii?Q?OUnSADZEMfCOt9ufKu/OoOUvpi2Ya8G7VN5zzHhl5VlbhShxgTYQWus1Svl5?=
 =?us-ascii?Q?bin0WYTO4vRP0RJZkStNn8yBhC5i1l0DMC+SmEg0mk0bknEjlPsBz2J98adc?=
 =?us-ascii?Q?i0blSr04ENt5v66tc8fpJQcu0LhuTPhSc6j3/rUy3t1+8p9pSDJXA9Qrnq3z?=
 =?us-ascii?Q?1x3ZJr5m97Srt6aF1o1GvE5+9Dxo9TR4PGycaEF34MRE9kBxv5whAUlq3SaM?=
 =?us-ascii?Q?niLmJthWo8vWauZa+2ItIbamnF4W3csPx5TbgnVBdG89bNvCvH0SdldblRNq?=
 =?us-ascii?Q?hPTmaGW5pc9IBxwo73abU3/NfC2DlIqDWBTkbJuUacr0/nkJpmLjIywrDN4V?=
 =?us-ascii?Q?LN+8XiJXgDVraDpsppqLJ9U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a89a395-9df4-4b5f-ab59-08d9d8ffceaa
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 14:52:24.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qYuqHgpYKHNnZj79uAlGIij9I3OVIEmyqb9j3o7irZCzWfLYfs+b5O+0FwrhCie+BP8S2CabwLW90vXImT4Khw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
X-Proofpoint-GUID: LY-eIF5X4U1vmj5W-7Ui9c7GQQ-MVgIG
X-Proofpoint-ORIG-GUID: IOLqHbipt1Rz-WS_wN9NIqq_MPjB12dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=603 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 14:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160608

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

The cryptographic unit is optional for the Cortex-A72, but it was
included by default previously.  This breaks building systems that
lack this functionality when using tune-cortexa72.inc.

To correct this, add a crypto entry in the tune file.  Since CRC is
optional for ARMv8.0, do the same thing while we're at it.

For platforms that had been happily using tune-cortexa72.inc, a slight
degradation of performance will occur using the default.  To correct
this, simply add:
DEFAULTTUNE = "cortexa72-crc-crypto"

(From OE-Core rev: 2568d537087adb0b592aa250bf628a7b48c3a9d3)

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit message)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
v2: No change.

 meta/conf/machine/include/tune-cortexa72.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index b3f68ab6e3be..7608a20c43f4 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -6,8 +6,16 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
+ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
+ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+BASE_LIB_tune-cortexa72            = "lib64"
+BASE_LIB_tune-cortexa72-crc        = "lib64"
+BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.31.1


