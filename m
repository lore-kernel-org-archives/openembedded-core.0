Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A9ACD3423
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 23:03:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6253.1725145420346391094
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 16:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99738a7452=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47VMOQw4022129
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 16:03:39 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41c2pkgbes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 16:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wX0cjvZXcQO60S3RGg0wXiddE/EYyxZ9ra7uA7kYzUGAjZZm1NhCGoCGvEcZ1Ci0PNsuljCOoKsNjf2tZExbxTsfiqBRPjfV7DZVUZG9rZJHjrNa+MBJtsXimyXSk5GiJ5fXC7Ojtw7FcOOaUMla/N+64mZMmRkr91ppu7CRuaIt8sCHQGBfT0Yb+HrSUMw57X9ESZCCo2gEutAr2NeTpPyVZiGVcHRPy1gDrikke+hfi5XRIxZaZc0+r84k0Og3AzlY2R3Pz7qZ0vFuv+KJcCspKg86NfUpADySrqT0LuroxnTtKdg4x9nsesqzTQjokIeeqq/zFuBsXWSYZxG+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OszmpFzYJWiYzoSe1S7rbHArH7NTF4Y0EwlMnfI8qzk=;
 b=yBQXb4xX/VNneAxQNN4MKdQrNl+79EmrEr+dDFqZZSxsm0vGgiUxoOZT6lTEzoPkfcnOjVng3v4s9x3g2VfCUB0qt6pnFrTI7cqtr+tnUoxhxP9yATU+QwvvLXQWwllHB4xqYgvF3iFCEfeMGuELy2Qp7YdaNVV75ejde52dNV8JKk+AqBnUw98BNfuD7BGCcOPb5+JqOYkRGxHDGlsPI0oAiE1IOZlw9VO1unJ127XA2jbe0AZFFpg5YZE2j72EDBxFCa85azrL5+nJUVWYB4k+k3vn4DqhSiNJy1zsSwyavC/aT2q7XPA/nG2TtuXwCJPpN2yB4e2pMexmlgR/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Sat, 31 Aug 2024 23:03:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 23:03:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libpcap: upgrade 1.10.4 -> 1.10.5
Date: Sun,  1 Sep 2024 07:03:27 +0800
Message-Id: <20240831230327.3285083-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:930:8::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c37c10-4f16-466d-1a3d-08dcca112561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bgYmQ/mEu1UODadA4sBDA6mhSFoEER7tABEh4/OnegehS8ssy7M272d7259S?=
 =?us-ascii?Q?LPe5LQxQLPHirWLgw/xZQM6XoEXp3DIRFkUxH7v70XPFLgsg/MiMCluFzka5?=
 =?us-ascii?Q?5UIwUN+OomTsuMZ9U/JQIcDo5rYsmg0NAbLCH3F/6qCXb53ybA88XCYSKxPo?=
 =?us-ascii?Q?fyZNS87n2BSqmuNqilCXykFTgVoJE4VdmhGTkI108B3bi3elyQ/zIkP4bUpP?=
 =?us-ascii?Q?qDOzBwpPwp3vvKORnFJvY3h9YGOA5JiNuf+Q8jvSv75RL0sR8rHAVMVtnrd5?=
 =?us-ascii?Q?4Muyi4xqhULBaQA5+QEBlIdbVwB0P80jNsmtziDx1vgchclUBAnaa3xiRu1v?=
 =?us-ascii?Q?wRoHdd9RTla7SSfz4hHj1aY+5od6pC9PHKzwPBUncnftfHTDuhxEmq5AY7kn?=
 =?us-ascii?Q?qdTWsgdafDATvvL5E+4pM5AaD5+9yKvwuPAJmtRVY7dK6+WPjAq6kOaBuGPW?=
 =?us-ascii?Q?MDiMza19kRTBF3b7GmvUUerDdM6jotT6riQl4Os6NXbzD0ykyD4aMCv3NP2a?=
 =?us-ascii?Q?dfUyM7WIiefNlQiUUBGp13ukkNQKltEbBfYoNPvHtTCQxucD05JGRr7HPlKO?=
 =?us-ascii?Q?1VZhW0+MRASXOQd90UiF5A0dbQNrY2a7wRRcvJqHs/yZNprhsyfoAt8C9S1d?=
 =?us-ascii?Q?qTrn7c2oopg9zsN7Zdq2C/3IFwTtbwHyLvTVW1xpcFQsVDRmzyfE2+C+6IN4?=
 =?us-ascii?Q?0glwXfX+GdRY55+UY4alQMlOXR8mrqaVFdL1pO94IcepmnAujUTD1yKb0fj4?=
 =?us-ascii?Q?9RhSEQ07P1vM8TUJPOsbw6agxxM73JPWKU5unyCd4ZI+7uGISVNXL7cHc7Jh?=
 =?us-ascii?Q?JYJMZ7a8bGeP+kqQZMBvT7iY5yosBNvw/g14QUeKpoDUUWg18iCZ+lukSeJj?=
 =?us-ascii?Q?FcuKwzMYFWmr955e2MK4wSNMQEm7BhzEUfcjMLsJSLM7zOUwHWzTAsP+r0he?=
 =?us-ascii?Q?EBphZXoaeimILbJaxYLxhXEvrfvBjRcwTeN3OzZBUWrxM0wORT5+ymObmhtK?=
 =?us-ascii?Q?mktdGnLohw6R6S5LOsrpiW5WpHJvdemVweqeK6UDZD1KiyeQSQETpYEA5G2j?=
 =?us-ascii?Q?vsRbDoxDpAdlOvUAwGFSzMToIxCU1QXj7DAScXfuOTOGl3kuoj+/XDImzlxJ?=
 =?us-ascii?Q?e60vZXcOqB3BsPjIWU19t8Cqm5+IZKFRvIjOzu38Ku5yb5YjfWYCryEmWLpg?=
 =?us-ascii?Q?6RV6zqr2Wog5oyfq3YbFVVT3IKtDbhM1Z3oCNNazTdWVpT2jlEQdd40mKX7n?=
 =?us-ascii?Q?rYZxHVI5Z0T7/UcLQ2OlGZSsY4MFyTF6MLHU4ryk5OgekpkWoGNu/ng0BFlQ?=
 =?us-ascii?Q?369EhD2mAg4CSEt7pR0repvzKkz4bfcK8624cVQ2ojVsRhJgNKsGW0RX+PDP?=
 =?us-ascii?Q?Sm3Av8Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lbMcdNc3qmV4rOInfsqFw1k1V6o1ALFt7cnmRIGDyvTHqeh7nujygxNkPgJ1?=
 =?us-ascii?Q?dR9FqG8K0AXH057kThoEZgSw369d+1eryahnURlssv/LKyClWu0EPYaaqQNi?=
 =?us-ascii?Q?x0/J9KKIQupSn7QOv5Wy/b++mv0wvMRXjdhib3bLf1e+GKgRaqSDZ4UOO6bs?=
 =?us-ascii?Q?uvZjs8iVgIrQ+C0zcFolOjNR1aSx0SW3tp65zlLA8NfkCSZZJFZNWRAE/Pae?=
 =?us-ascii?Q?/6NJzPxTVphXgSOSJi0ZMUv1umEn15tCz3YditlKFZrzOCg2LGnfqCC2G+Q+?=
 =?us-ascii?Q?RSBOvm26PaZHkHYVvq3vuMebQHQVRmc3kKWG7kj83YumUYMm/ZMtYHKqnY0R?=
 =?us-ascii?Q?OLs9gtmYqWeGdtOy8giPet6pxiVhbmzGnJVW6ey/b3gXhFWxUUfa3kopunjt?=
 =?us-ascii?Q?C+4w1wIQu9PuI/OYD71DzqcW78nuUU1iDp//mi18P8yPjsFgcVECC+fQCSYB?=
 =?us-ascii?Q?grA1z8tvMZsFrf4GNsmccc8DfqN1lf+cVib91sGr6O6oegjZM3L9j8eJ0XwW?=
 =?us-ascii?Q?too7yVnYbwI5FCIUjoX4o+FWWpUFH2Z+NuxMM9HOVN2shk/KIJR/fguxdEYa?=
 =?us-ascii?Q?1OXOYkC4QTQV3U0nfJ8Csawu5Moa5f2u2o/2+LKWpPkrqmu8na3/wmpylckv?=
 =?us-ascii?Q?AhC2jgluVsaMFLxyGU5oJbB0HURZHw2zMBNZ2PuGFWwgpghg7qbiN2iYgR4B?=
 =?us-ascii?Q?1XrkJwZuxfN2jlGX2fp+CMcvW5lDaFaI6KYenJdIyxUfZiws7KZwqzL9eSKW?=
 =?us-ascii?Q?MFUQxTZ4s4fkYcMZbrMfqGaNYWxiRbqd0AmvIkHYfM/qbUshAyqrPCNrSgxq?=
 =?us-ascii?Q?sl0ol3P74BMNSqm995yTxgDEQO9X1LGBmaxIhseHKi9oaFapTl8wu/qlExRR?=
 =?us-ascii?Q?6n9zDr/6rWl1pckThW1u+ZuudWH6FwYlRH4eWp1/bV36W+ZDZgff/mtWzJOy?=
 =?us-ascii?Q?n+XLmpsRBPEUy6h/ZYBdzwbkbbVHI92uz302W7WIHrxRG7mLI26sWs19/0qX?=
 =?us-ascii?Q?Qx+2Ixto1/WZp5kZ3ggVhUC0uR3onxZyHHiEYYavWOIyGOTkG+V7vtZN2KMU?=
 =?us-ascii?Q?B8TnYz4aPaPIcbZzaeJhVIsxRjpp0kW7LjGqKXe1aFxKWYg/Rt9wRrxXf1pU?=
 =?us-ascii?Q?EsUsP1viPIHil8g+CsNTZohxsxywiqqHOstHdxPvyqISIIZq1UPVjk39ELGt?=
 =?us-ascii?Q?FuK8mmqCLYZ0PfxRDuYVH2tgYvklqjDigaakzrAyXSqL7MToUDHYbFhiTN1k?=
 =?us-ascii?Q?GaAMoTxj+6TrAwzotF6GWBvroFf5Dm09jkhbzHvyrX64Ywb9+vKyya4jxRZm?=
 =?us-ascii?Q?t4EOOB2rz45UzUiWyGII828Y66sG3Uo/FnIUMANzAIF9485s5wUXTUT1Fqgz?=
 =?us-ascii?Q?aD9YO2mwXvTTZvu1/AJJkdkxKUUsmf8zWHLEOqV1eBqGgUQuL2J+K/cVrVOf?=
 =?us-ascii?Q?723aCPkEbtvL13IvoHNFtPE4uqXwrpesvqljQ4Ew/6/A9B1b1RWXPPJY9rCh?=
 =?us-ascii?Q?1AxilrtAI4q+nNlIf+6nO3Kbe9J218e5WB71lu0SIL8klf4ZMPnmgKdlEEWY?=
 =?us-ascii?Q?l81sHZKS1yd6efaRBaivhV4GcVdtEUkL5DS11E7Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c37c10-4f16-466d-1a3d-08dcca112561
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2024 23:03:37.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w68SaOGzuSeXSt3o9LEu3CS6axz1rKRlk7I/5Iw/1wisNNINfscKknCq5u5a3mlGCIq2uZ/NSW2e/QeIG5wrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-Authority-Analysis: v=2.4 cv=c+X5Qg9l c=1 sm=1 tr=0 ts=66d3a14b cx=c_pps a=O5U4z+bWMBJw47+h9fOlNw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=RwghQLH8AAAA:8 a=t7CeM3EgAAAA:8 a=qto6SD_HX_XL75Ph5P0A:9
 a=n9nybW_iuiH3Rhfh8WpK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9pWRa8JK5VkcUgCkQ4Q3cWxjbuVlFxhD
X-Proofpoint-GUID: 9pWRa8JK5VkcUgCkQ4Q3cWxjbuVlFxhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-31_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408310190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 23:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203977

ChangeLog:
https://git.tcpdump.org/libpcap/blob/HEAD:/CHANGES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libpcap/{libpcap_1.10.4.bb => libpcap_1.10.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.4.bb => libpcap_1.10.5.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
index 166654e280..7ad52acd06 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI[sha256sum] = "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.25.1


