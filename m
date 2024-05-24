Return-Path: <bin.lan.cn@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF7EC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:24:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10529.1716535448625217398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874dca73e=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O3C88k025258
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgj5v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQv6eSXbXMt4CvR6sdCpfQs2x8LUBQIKdzqZGj39IioBOTWRA9RqUFyyUoiZwYIzlF4MhpbtD0L1e54Cg5ZltvQMuI+r5/sQVPjlUOWKe773fOZ2FGhCE/fD5fV+wK9d9EgQMeTuU9syWKn5JEzab2Je+xWONlQoilos1CdL4pdaMa8sFXtGcaZbUpDEQ0gq4L+8k+rAvOuY0tFH72JVDG+gFc5UIQkACPx5bCNJh1ZbuHFe33UwPKt06OEYpWG60FRjs3Pm+StTF0MFqC3ff22dBIOw+mGnLFWjMNhsyXoQHrrHxRMXvvRxlWN5c8GWaS6md0umPCyZdWneqq0NqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4IRtisEqS+KelGie+IPWHcuY96ivM+y9gijKF5IgVo=;
 b=LY7AHwpUArc2utGFm9GOLTyZq++IOrfw2YQK6sVzdXyCL+Hgg35JaaASjw+fIoWQIrG6yZkT21y3WCopcfNp1TnjcGiEzb4XOTy+OhvcVZHs/0heiDlV2anVxHaq1prp+0i1nusjLvokz1goFcQ8Di3C05RpMYNZyIcvmhKsknXFc9iC7Tg1l05T6YD7qRWdASi8YjN+nnfFtmRgYzkfTgHO32zLdYlKA/YPLqWITTM1ANJVuy04TeK+WFrrI4/5jazI7t6+7aKbDdUt/5xPdTe94dgiX2avzC1AEXYbjeFPlPJZzA9GYpeB16x6XjAHY9I1KujiDqG4sa8xcl8KXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BN6PR11MB3940.namprd11.prod.outlook.com (2603:10b6:405:82::33)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 07:24:06 +0000
Received: from BN6PR11MB3940.namprd11.prod.outlook.com
 ([fe80::a4ab:9a00:55e6:90e9]) by BN6PR11MB3940.namprd11.prod.outlook.com
 ([fe80::a4ab:9a00:55e6:90e9%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 07:24:06 +0000
From: Bin Lan <bin.lan.cn@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiangyu.chen@windriver.com
Subject: [OE-core][scarthgap][PATCH 2/2] ltp: add iputils-ping6 to RDEPENDS
Date: Fri, 24 May 2024 15:23:45 +0800
Message-Id: <20240524072345.921885-2-bin.lan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com>
References: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To BN6PR11MB3940.namprd11.prod.outlook.com
 (2603:10b6:405:82::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3940:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 918d191f-2017-4f1a-b28f-08dc7bc27e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8fQpGOpA0s4QV28k5nywaHNNRyAeJ/+9dvcMnfWMjStr/srNP+zHa4suuBzU?=
 =?us-ascii?Q?4sMP5fOIOQBW2kP9eaE3rdnFqPq05pBr799hJ6dOw2CG36inFQSdtXFM4gvd?=
 =?us-ascii?Q?dsKK2VADm60T3mJuzjMGTyXdY426IykkKEnwebOn7RqXUNgJe6qfjum+EToV?=
 =?us-ascii?Q?GA4lvKwLB4rmH2Jl36Dy1/Bpm0RbkWV9bFgR0MincBKNJIKbcfn1q5AqGm7r?=
 =?us-ascii?Q?6eH+FvQM/tUp/bTEva9Yps0dtI+2eYTEiyOwhXXMA75VfBQ9TeVwuB4bGHO7?=
 =?us-ascii?Q?2B1tNVSHrW2Wn4adoINbqyIy6qEkBofhG2p7aSvVPMuE6VQwtuNap5TEMzTW?=
 =?us-ascii?Q?rG895Qzj20wrBZe44BzPKTdcPZdvunn7hfqYXTBYCT0Cdoyt1e3o62kUsSAT?=
 =?us-ascii?Q?9j4+E9XA8YsHBfiO1cn9NvbK5YUkcy1LFpRCJ4En0B9B15wMoCj/GGr/NZBt?=
 =?us-ascii?Q?PnIAHlGmACDAs9p5uz6l8YkFTpphOuQOFR3IIV9h1wrHW2uVIA4uTMbxF90/?=
 =?us-ascii?Q?GbFVR2T4J4w7li4T7yP6xQ0RKyGR0EREBiOJzGCABwd5mTinFci6Cwaoh7jr?=
 =?us-ascii?Q?b8+wqLWBJWtitMwrxWIBGYoeApPD9bxkRPh+eJtVrKG8Pin+4AhDEHfrHdPI?=
 =?us-ascii?Q?nseSIkK6gfbvFI3s421f0yEdbgtmsw/cmXc14Yki+YNOgmhVsQ+/P9g44hoE?=
 =?us-ascii?Q?vUhryYbyYVe7w9RtcaivrPaGJMqs0Fdhe7mE2P8QWP4Iwy1vsaEUenb6zg5b?=
 =?us-ascii?Q?j6kL3iFsN+6Z1L8nqIeDKiCJ4bunJrQa4mCleQbAsKjFMLR3zrbsqg2izmyY?=
 =?us-ascii?Q?OgMuE0R8uEqvoHiZ0Sr2TjegTw7qjIFGR7dqHO6LCAVyZsKsEyeQ/4jrEh2k?=
 =?us-ascii?Q?2CXyFxJKg5ICvZnGrr/96H5xDrJJfhAMkmXKcwxIPhgVpBwuLdBkQyk6tylh?=
 =?us-ascii?Q?yteCWla4xH8Hl2PdoQwKh86rm+m/eFrHil6yfA76A3BV0aq7eOqyXStWR7Xm?=
 =?us-ascii?Q?TwQHFkji4MNsRIIxyiG/4uERY0w/3MIZi0c0So5Q0/4B3kM/wZiGY3lQa3rg?=
 =?us-ascii?Q?eeEbCJwby6JvV/QRNFkV2YRy9DWD4Q2h6QCj486OJR5IOUJgu4zb8Ly7XDpk?=
 =?us-ascii?Q?WBz0q1ZTYo4pgiVZe1/rFPAWGie2KRcdH2MlP9PvWrl52NxQKCHgJjZYT1HS?=
 =?us-ascii?Q?NV57PS1gUnooTt0LYTYnUtsvKZ33qWPfdP04oLUo8rCAZtPiQhFUfxZwBpFH?=
 =?us-ascii?Q?7dGSmvNILgIwulFYdYyfa7OvBWvMICNkhZKNSshKDi3+0hO6b/s28rwq2456?=
 =?us-ascii?Q?G6w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB3940.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O4V+McjM1DEQNQ/W02t6UeZSsLW+E+90Cbua1IYMn0elT6aZ1EKSobta+cqk?=
 =?us-ascii?Q?lueIM0Q45tOFXQd+34TZAQgLpPnR6kkvPSSs97gxUEOZgR0/YjgHPRqLdVVr?=
 =?us-ascii?Q?q2xLRMmWN8zUefm4BsP+/WoknIcXPyu4FeoxoTDn90ysJcJXi90TcziPkSqF?=
 =?us-ascii?Q?C0VR/kPrjRySy9nOgwgGxO+surO2DtFfhQbJATEfaEwr0PBp7NDx6IiD98jC?=
 =?us-ascii?Q?UNLY9U8zE9aDNfIsBj455rvvGot6GW3MlTov30XtBXxkb67xELkG7vPO4usW?=
 =?us-ascii?Q?w+7NMQdjHVXNaLgOUMaxYaJkZpI15we2sav/bVJ0dz6lMfqC6QvwuViAN1HB?=
 =?us-ascii?Q?ZDqO95gfb7TuuNAYcjwYTR8uT9OjzL3vVS10UAQF0zhCLQ5UNB3/fHGVzhEJ?=
 =?us-ascii?Q?0PiSss7qlKEAi5kibHusva8ow3NI+P2JTdVy7HJwn/UuwREDlJmlLH08YHch?=
 =?us-ascii?Q?QQ7i9xgA28XE/yXT3FBc0Rn8ip8Q+iDhS/mz8sFoLu/7rIMH01kwmHxd2ETO?=
 =?us-ascii?Q?mgEb4yVVSPYwqi9e7gVOGb0bbutc6gT9IUMs6b8c8JQQ4KXIEWJTjy5tudQb?=
 =?us-ascii?Q?dnWS1d8nVQJ2+nGdBRYp7L2ZTWtLgBtJgjWleQGz2MFwwmKl4uT6dV1+XkHt?=
 =?us-ascii?Q?TOYhOyRT2NjI8ftAt8/9o15Fq+twGp+/LQU4z0bP00SOpSjzQtrS8ChO6ThP?=
 =?us-ascii?Q?nR+TU4EIOvIPGyncjE4dKVvAqBdgmEoTn3VDZ8gbOMQRQ5BklEGbNGT1H4bW?=
 =?us-ascii?Q?SEgilNSa+S43Rpn02gCDjZsF9AxXZLVR2H8cBh2YgSPvGIbnq2gs1EqBJofy?=
 =?us-ascii?Q?1wMUhmKUUXfTc2u/4AbXkV+JiL4o9Uk1epBn/Z6vBCbOFgH8KtTstQE1p/ml?=
 =?us-ascii?Q?6jxGm/dYkgPaRyyyGce9ujXmWjO0g6/3rSn11mYKXzvxLVROn4e49UvgU6S/?=
 =?us-ascii?Q?PLwVF44HcBRdDv7KDLbZwEU262ay4yssp3aG6388xsMVb0c4N7odwYf+FgPT?=
 =?us-ascii?Q?Xnjx3F3x8wL0LhserT8b2Rw+kOidcEjKA8dYcvbpLi2SNP53a4L8kokYNjSZ?=
 =?us-ascii?Q?j0ZCiC1KnerHPo+gcKOaGk2G+3Hu/158rFF/tpBTrMXRnvU8fOD3fMwIkfjM?=
 =?us-ascii?Q?A2ZxpDaUsqhsguWGYRDjdCjM5JJu0v+Oh7Cpmk78kGFDKvgJwTEFaMoW092U?=
 =?us-ascii?Q?iMo/T1kEI9qmfk6JhWQU7yAvzEqK3QV9weqUwrwAvVlfIBXSYcVCEeMizyHs?=
 =?us-ascii?Q?KsTZStuXG5OyU3OJZnYDUoCIoCvAAUDbvbEvWLlsfWpBJnW1kmn1qpE3Vgx1?=
 =?us-ascii?Q?F+kh3KwO8j0Adc7ZIryCbtokiz2D+9lv06O1bndlfaEOlG9mc4SNZWFBxFCC?=
 =?us-ascii?Q?+vidTazCqTf0+5jgL63o39K5njgAzlsTt9Y4b2mlxI45VycD+t/sdfFXPdEH?=
 =?us-ascii?Q?RasSQVXJxD94W2jgewlswru+aCG/HjDbEHDWtAsCtLDu8bLQTeyuhHyR2WZK?=
 =?us-ascii?Q?nb2iB/ajDBZIU0nQIzi7D5HOwoskirRdoUiQYaq9r+YAt12ov71Qg1CPhd/2?=
 =?us-ascii?Q?wdDiIla4uSvjV42ZnYm+sXOs1xw1LQsf0hZr1GjeEccP8YZ7hWAH1L7p/Dnk?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918d191f-2017-4f1a-b28f-08dc7bc27e9f
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 07:24:06.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmEkKuM/XxO8LadiFDmpZ8fRar/t/nzjRip0ixp+w4A89VBgQJA2zMIKm32RwYGmISgb4SF8QVvYFxVMnuiXzvbDE36gcQV+JCPZiVnQkDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-Proofpoint-GUID: 8Xdpv9Aj4Zboj_XKZJX37zltmTyzJqBX
X-Proofpoint-ORIG-GUID: 8Xdpv9Aj4Zboj_XKZJX37zltmTyzJqBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_02,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=911 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199828

From: Xiangyu Chen <xiangyu.chen@windriver.com>

According to the LTP documents[1], it using ping6 from iputils which
support "-I" option to bind the interface[2].

Ref:
[1] https://github.com/linux-test-project/ltp/commit/6f97789c
[2] https://github.com/linux-test-project/ltp/commit/64b11656

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05107ec5e4b81315d53efef23f2a570d520ee4c7)
Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20240129.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 3e896957d1..e88e931a68 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -98,6 +98,7 @@ RDEPENDS:${PN} = "\
     gdb \
     gzip \
     iproute2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
     ldd \
     libaio \
     logrotate \
-- 
2.34.1


