Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C704C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 01:33:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97707.1683509620541778346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 18:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4492aff766=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3481UavZ025069
	for <openembedded-core@lists.openembedded.org>; Sun, 7 May 2023 18:33:40 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdj65s518-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 18:33:40 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3481XdNl029472
	for <openembedded-core@lists.openembedded.org>; Sun, 7 May 2023 18:33:39 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdj65s516-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 May 2023 18:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/5EMtx2G+/mD5kd/2p0O7ffIKrMI7GlasO5RWP5e4arjU3mQpC61tF3nBjXjHOiXUfPzTae4GbKTNsXTTNsdwZNaROMo/K2U/wvCnpqrEMvibV3Mhy/EE0oM9jycf1xWMhbCs8CmcuD6EBdA06p89TRhCm+1FAkfhAgP21Ftsr5pEIjO0uaiEkHLl2vt8wh23CTvMBKbUX41X61U3T5Y5ITuraSQjcg5NPMo+ljAVmRqeLZ8sAIBcSM9lkkFX7rTBZ9C66zU33X8ClFdAq0eFkTNhhpzJlMRfWZVCFZlDCUz9o3BHqsBVPoZ0EixWYgLrPvyiw6CWmXqvKWF6YKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crHdV1B2f11pDS2BSRyZzlRKfuiEKzCR8iDZfVme99E=;
 b=c6OAdT0rOivKfxalRZEGzgcxD/VZ3nVz6X0gKgebVv5+lCAd2TT8stJr35yNkP7FZnM4cSRkvdhnwSnmsLKBg4smchUKqJC5mVyvE2FDr+4T+KqLgkfWSqkGZhqQ3xGQBuOc715KZOp+h7jdYa1rvv8UaYsOO3s5MsnFJ7juwjK/gkPJHoSEOsefLwYTscOUEbXp6J9gaX0MJ//Fza5ypxSDCWGPTG2yHF/kIQQS6eMoChrwNXmS8OroFpda2B8ZtyMmK5Ob5yjOnCZbfmj7qhV//3WCvi+ebe2Wt43jH76oqgH6lTu7IcIuG8mfrOPXt2CqH0Ez3pgiqV+owBGfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:33:35 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6363.029; Mon, 8 May 2023
 01:33:35 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Subject: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils when CONFIG_DEBUG_INFO_BTF enabled in devshell
Date: Mon,  8 May 2023 09:33:17 +0800
Message-Id: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2ed467-1afb-4a7b-f7c1-08db4f643d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qHwXcWy+bY+poocWuVB4dGRlM42bceqXmkRIfEghqYDrF2ivVBqdauCiTesuZt2alDK5OTf5Yly6HU0n+9Kb13kE06AkVpFEjGUZdapoLCLHTJMokGYKkBqNnWMySdFXYBz81yLqvYrdLFRwEW/3V/xAuVYlnKqpEl8jVOT3q9hfTLA1v8J3CT4+usxnU+beE4MlTbtS6nZ2FMDE3AAktzu97a7x02nz0EztHC95CGYUT++xzZV2QwzpCZFNokPGygsAyOMBCGB8VvoyjNKW76K98fLH4y01FREKPLum0oB21D6kfTEpmebuHaf9Mt2R4bJxyAdDpR6f2sZQRgfQvUasfHr6QZfMiS6dsmhQ7nZuQ3K21ElvhJHPD3Ghayv3t1PJr7/HXdItebPShZO7YaJeXiAt+FZ0O9gtV0tT5IucPzYz3oMEuFJt2yFcrKa5iSj/U5qeJxUHY9yPigh1p2jR4GTmaImMn9x1fhyR88qGSo0YKL//mWzNdVZoBnfHuPJIRYBzNwM/XCvDnj7Hy0eMP6nGW0/J5DKVXWJLhP31kwi4SPAAFkkYo7gsACN9G2IGd5UpvJDKrUCUCTD55HtBVpY35pLrClbWqQD2Sbh75nRNyf216QCWRzpUsKME
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(366004)(396003)(346002)(136003)(376002)(451199021)(1076003)(26005)(6506007)(6512007)(6486002)(52116002)(2616005)(38100700002)(38350700002)(83170400001)(186003)(478600001)(2906002)(5660300002)(66476007)(66556008)(316002)(8936002)(8676002)(41300700001)(44832011)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1iaBYtefGRj/Qarg5MB2o0b3VnTt4xtUgcOXoprT+UATF5tEDib7uanhyxU/?=
 =?us-ascii?Q?qkJsuKqRhJD0jZqhSZNLuvi5Q/UHiCniNZpSHBkw4BNl0N0efXJIiwK2KLw2?=
 =?us-ascii?Q?M/TVGOl86JxYFGJp5bgnYGOJKDo29CTLqLC0bA1PnaY8v4Zoxjd/rjmwhFrW?=
 =?us-ascii?Q?QMVl8nx/f+Pun0HmDray9lf9rwVwpsMxqaW0zVNDZx5a2lVFwiv3JLJM0neg?=
 =?us-ascii?Q?mu4CwdpApb+scpeNbM1rBX9QDBOklY5CPmXmecMUtjKuO4QfMkWG9MHRSuf9?=
 =?us-ascii?Q?Pm1SsFCRendd/HOmisbamIYhbnycDE6WF7rn1niHKcLH52Hdoo3yi9c7zgNm?=
 =?us-ascii?Q?fEfdthX2Hp/2Ok9An6Rg+lJ0MTUlPx37f7koypoaNz54ya2kZxF5hSVRjrzk?=
 =?us-ascii?Q?DMawGndl+s22BDY6kbTl9qZ/5feioJGQ5a51QFWpqle8xA7PKL2JJI6WYhLI?=
 =?us-ascii?Q?zcUcccKU7ktGqdELrjn5PvQ/hmMnlIB4lkG37clAoLbTTgokMt4/A1QHwSEW?=
 =?us-ascii?Q?7MvdMMJXMRFEiJI9sZEbcpAR0yJOYLBLRy4xcvt+aIG8BjQ8JFrX3avfyXfZ?=
 =?us-ascii?Q?m5dM3OjGU0Ea1PtN3T3wv2mksnOC/nbnyNB0kCLrGWVaQ8M2mCBHJE383UGj?=
 =?us-ascii?Q?A7XJeJ0szYzh64qpGFVqgrPWj+mEnzabKzoqP8PsPDmciBck0AaWbkDNfTee?=
 =?us-ascii?Q?MhEHypXzCCd6hjEcvQ5KmGTjD3HIF8pVaXq2v5MbZfBPCpUAej1weaiw2hfl?=
 =?us-ascii?Q?U1MvlHfiuKRg5GsVaH0R8dRgrZ3okW7oblJpXy0AcFZ+MNVzG8AvJMLlIoiI?=
 =?us-ascii?Q?h6mIIfYrIQtTO2AjmLnPDP/9BEJB0yUJJh0h+UsB0cDaoMifJoqb9sOI4QxA?=
 =?us-ascii?Q?a8vLJ2CtHZ8luPrWtgv+O0YG7xYuJTEi6PZkvAQ7+dQXxA3CDyBqlyWev1Ny?=
 =?us-ascii?Q?QjIVJ9x6Bq2OLikTdfTFuLCgf0Fs1USNbkcSI06v7iPznlGDhuuZp3E+7UKI?=
 =?us-ascii?Q?n+WVXEOY+Vg5dEKXye+4kTWNRQwmLqlnVYSg0gR7jMYoNBsQlHc/sPIJu92z?=
 =?us-ascii?Q?wxLQqbuuPVG5ZmzMyzwQxQSAfXI/Sy4eybqt/8vxQJ3zimSj/iuE3T+k7+d0?=
 =?us-ascii?Q?Tsp6jWKQ/xtN0i0tAXiKDF42Ob4uXmlcO3k/PkDjTlKbVy/06l01x42YdkBp?=
 =?us-ascii?Q?cJJCqnb4tNlGzNjDbN4F2BvWmz5rBod/ORaUVqlciM9VEbAY/iE7MQEJUU+/?=
 =?us-ascii?Q?8TfCsgRQSo+N8SpktuG9nAQBGmTGy6OSIYdC8AP1JPMt2EJs2j0O9wlRme/C?=
 =?us-ascii?Q?JNglF9bZJcv7Cph4MuhdloOdokSyqjnPe3I+A+sKFpd4Yet1zTF8tPdEk95P?=
 =?us-ascii?Q?KwvD5rjUk9KqRk2b6FuVcSnT5vanrR7sAdLEgp2ekOIwzc4hxyk5ImZTxWfS?=
 =?us-ascii?Q?E4jBnExMSWuG81/yv7AM3CGDdXWUGSlEj7w0qAn0NCWOBxJzmH3/zNOyK77j?=
 =?us-ascii?Q?jBGqCZrjRuKEHofwkU771X+Dw7PQ8PrVYD4v9CS4YjPdBnoQ+oyRkjk38TvD?=
 =?us-ascii?Q?jniLK9apwY6uK1OKQ65YexJbrG+a7QNBeuoz6Xp1fh8k7cSumDMKQyh/bC9Z?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2ed467-1afb-4a7b-f7c1-08db4f643d86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:33:35.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF4iE48HtC+AzUKc5KC68Hi4bQ4SRIQ2GX0/qwH1fS5qzS7EOsbg/qhGkx+Tk6hyiLPSMr6iYaLqA/1vjSHFPv5I56tSHw+EFokj3tZWUVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-Proofpoint-GUID: dOw_n1SnlGeJRUzI6FwccCqY6kgpcBAv
X-Proofpoint-ORIG-GUID: hiEDlf1MJGjLWhfS3uT6nE0J2YT1w0mE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-07_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 01:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181013

From: Xiangyu Chen <xiangyu.chen@windriver.com>

after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make would report some
errors due to pahole and elfuitls is missing, since this is a debug option, so conditionally
add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need enable CONFIG_DEBUG_INFO_BTF
option in devshell, they can add KERNEL_DEBUG_OPTIONS += "btf" in local.conf to solve the pahole
and elfutils dependency.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 934591ff1c..67d72c8c21 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -61,6 +61,8 @@ KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG_OPTIONS ?= "stack"
 KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+DEPENDS += "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'btf', 'pahole-native', '', d)}"
+DEPENDS += "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'btf', 'elfutils-native', '', d)}"
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-- 
2.34.1


