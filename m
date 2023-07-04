Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90824EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 07:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53705.1688456380979148824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 00:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DkfMlwwa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65495b23ec=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36473i96023971
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jul 2023 00:39:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=6GCcZmUAJaLRM2Gg2qgVVL/2NDD3tybre7D24zkkM+g=; b=
	DkfMlwwa+8IEkXGV51TOMUGw9YWe1UtsRAu+r1b++CbPAgt1k/P/rLCzAzWpkRMP
	iP+iiV2BBcneqr9EBy8VWqCUX1kU4Uv8e0xeosZN0DmOhcRvdeMSEP2O/jzMO7En
	fm12jP8YR7suKWwrTg5w8DxffqzD6avB+070HpFUa+m4uAG71kvfKmIyuJ0hGjVi
	HnM1ubM0bndJcsDajmXgAYh7Ho2uBG0PVxs3lvlbPXxgofQ92d5xIIyOxDY+eBWx
	MBsbrFgcU31iynp/vGnagiPnVfPfQybZp2KnZGFr6mHKiGZmdZn9sjWwiz46skmk
	5MQRC56SRPAEL/5YxTTSUg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rjkneswpy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 00:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhpcwHVul7fTnaXIlDsaZoaOFTkVodLv8hxyMyspt6gBzH8yTAdjUHxkEdTF7ZNPfkUR2FMT77QiAcyznzL+dw2UgVpcFHDZBBgcDiZVYbsuHr+TkAf7YW7EY3gAha34ELbNMgpd9CuMTZpHgNt8AFcgNk6eFJXoDZgo8cw/3CrfJMf5Mb7EwurSyBn+UpTPZd4GH3eX8jj2/XYR+Kk2NwLJ2QuljWAS0eezCAf21QI3umlFnvo6xsqaA9k3fGQVufY4c9YsS2LWLeqZ3l985cyOSALGLNu6bZ9NyRJ9F6DTXSRDV7nJR96VZGDARq8q4cEhnPm7mkgXFoo/oUf6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GCcZmUAJaLRM2Gg2qgVVL/2NDD3tybre7D24zkkM+g=;
 b=XzXHwIOZjOBOkSNtPEr07BIgi1KJZ0FXnH4B/FhAsnmrQ9Xr1R09fIVRom28E5XcBKStEC4eyMi+WPdxQ/KukgSujA7suXLSh0MmU8IUAZC7/u0RGUcNFkHwklvIv2r/bDEd0nBWxIVMn0GRxUNRHvJx1AUjxloHQfx29C6z7MWcwOHTohGk+BFgOYzV1ARgMXtcpOhm5KBJn9+ZJX2nCv6/HilzNmYaN59p5NTcMq4GWN/d7Sj41G7RjLEZyYVa8kevxSSNXT38gyqjxin1sePAJJdLv9mRBC/DCClX0xWDIQiG0KK+LHfvr3s6VAhfuXdWdo6vaaJvBxYIqkhrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:39:39 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:39:38 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] mdadm: fix 07revert-inplace ptest
Date: Tue,  4 Jul 2023 10:39:16 +0300
Message-Id: <20230704073919.1593400-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
References: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::17) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: a54cc80e-d20c-4964-e8cc-08db7c61d264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CP3cKz0P6e+Nt1c8mtCR+lFztAqLs6TkHj7kSqRpogLSDf4/WJtB7CGPh8Eshkz2YH/WXzcolN7sMUNlo6P6DUtm9KhXTc13IN+oIcqlaUVyFyyWJlXMp19Nowew7MsObrbwhRSvUAvcy0g5p0PglmO1Qh17AzvWGYr3arYzuXMIuXkd1YetJoNrjBf2TITSBV7nVKG8USR7D96pvItpTI6EUzLARpvshDuGLRWbePSEbjV/SVpzU8Dh1yGHBI7WSGqqvor2n465IPOi2hcaDQS29kXJM8FJNr+aBuDLHvpwrVh9lEWyJDKTog8KK10+o8mhDEkUsRmdukfJ/eM4voCssJGigN7ERvbTfhZv24PJ7cd0GCxnCjSjvxx7Uf+ahLhEv5AIhafar6wTwCtCPVcaQCLA0ewVmuVvNFpyYO9mQQfuw5ZGyk4chNDsD27z9zFUzoWfnly2WK0rbqxm6N2U4xaUKvSXuP/iiz/acKupYk19MoyDkABjSuKFekcLX8YhoTdIvQ8naZskSWqq0W8fSrfpt3VwTVdU9JCpIZlna2pvkJOhshgpLnBp1eJtHe+1KkjXbuwsiYk1EeuzNf2xdjaujPD+/V/tjLKhM43HbXQIXCmrMVDWAfnetGmG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(451199021)(41300700001)(38100700002)(6666004)(38350700002)(52116002)(2616005)(83380400001)(6506007)(26005)(186003)(1076003)(6512007)(86362001)(9686003)(6486002)(478600001)(316002)(2906002)(66556008)(66946007)(36756003)(66476007)(8936002)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6OGaVrCoPf3zYtub6m8/CHBkeRxOh9jzRaIV2KkfZJfLNiRfMdr/zccFdVkS?=
 =?us-ascii?Q?r/6QZTSGMSL731yrCrszY1DgN6lj8XpTOi/ruMK+u/TaONigdrHE2E+RZE5i?=
 =?us-ascii?Q?+/QM462RAgpC820CyOQQL09vQotYUQgBpx2Tepd2EB1qQ0Q77TP6hRD8dgS6?=
 =?us-ascii?Q?dsQ/mBF6uacHIpAQ7H2zBdymgC4ruC0tshcLstIGue0RueekOHfCKOBcduy8?=
 =?us-ascii?Q?zXY3MrLe7Linob61NctECeFvNId8VlAyjSnHiFH3YmRPKV5yRbh74XzoEauy?=
 =?us-ascii?Q?uBfC3Hn92EzsId4zuKyV8tzGp08aKg/+p+5blY6fZAum7K6btyUmEohq61yT?=
 =?us-ascii?Q?PyTmZUF9YlZUFIVJBq6w+CCuDcwC89UFbxlxu0iKDzwM9wdyobYGWq84OZy8?=
 =?us-ascii?Q?II4+bXWz6xGLbjluZpGNxImIZaRKs1or/IlaTQxNRCC+RqrM0Pg3G8z/Kkcc?=
 =?us-ascii?Q?hALmp4Z84m778ZKqMBYeCOvShfOhlFNHBiAHOtcFfUDAwdobylbF2pTErrTe?=
 =?us-ascii?Q?NmhwVai0h+tIMBREgNXtlMsNMND0Y4AaYDGUwLHJiKTRVQSuqHxhZNwuM30K?=
 =?us-ascii?Q?7LmBs07wGfSBVJ1/S03riekX1z93/wD4tDHIIRt+8hG4F/lJJUTTz8O+XcCP?=
 =?us-ascii?Q?w9/k1wTDxPcOyePen6P+DyR40rFL32rSgjZ6maHHjymXSLcHxahPab75uGIS?=
 =?us-ascii?Q?uDmSHnr8P+OWDApgJm6cZeRczwuvMIm8HrgLqvd03/MIijxGyJ5YExgxjLBF?=
 =?us-ascii?Q?yOtkcZbHjt36QGwAs9kcvuoAllUgj33uY+p3UpSCHGEMGz6pEPZrgZdkHMCh?=
 =?us-ascii?Q?ZEq6ujNCg5bxRWrJP168xVATHNqPHaz6XfVtUYxIcGFlunAv8U50tHEhvZU8?=
 =?us-ascii?Q?JqG8dfZFjk8CZEIRVAGZ5uiJyI9gFsbMwz+FVTW5yCp0vWOGW0rKO0f05CMq?=
 =?us-ascii?Q?bDR8uK1Mm/qppd93/sLsugZoOSfFzXWQ+ry6GS/TUERYM4dNGFDUNglgq68m?=
 =?us-ascii?Q?rT7zDyaICndN2a0SN5R9ZtqBWRz5AHCxYLvT3YbOduword7KUXKBv0xuMYSS?=
 =?us-ascii?Q?t+UV3niQ3vg5VGNZ4uOUdJ3GNIuNgDJhAT7GJVIWVXETSwOY802KL8YEAKt1?=
 =?us-ascii?Q?Lu7dSsXVpzxy8s6jQ7Vn67qG31YGzYh1yNVbUUJU2M+SywP5oFw70YULfMBZ?=
 =?us-ascii?Q?mcqDfbV/W4zJjXQHzzg31CENzKDz8DKbM0f8mWTt2u3eAZr6A4s7wpUaZcIV?=
 =?us-ascii?Q?T8vOmAuHv9mM91pRsKPjw7O6a0oiJZ3N303SH9O/KHD/cAUFpFHVTRV4ca1+?=
 =?us-ascii?Q?S3GyMgtI/sfd5/0dhd+PZ0Uv1jVzRzosVjPVYMIeTT3TflvKg0f3EcdW8Qo2?=
 =?us-ascii?Q?7hirv8PjnHchuJo35MtvmrOoqBJW5UlonvFTsmTuR1W8TaT4jDrrf9slq7wm?=
 =?us-ascii?Q?YWnVk7updq/pp8t/17frwJYWBTichB2slu/g+0LIEmYrB+/ARmC+bKBUQd9J?=
 =?us-ascii?Q?f4NjxbDkGpoTUJD+Ufjxq/GJqy7oddTPjs7Tn6l0eCQvIojbjPFVCbmbs449?=
 =?us-ascii?Q?jTRa4pxH3gbiAdI1TwDnbnE00psbCoIs/gkEamiNcgB8kkkd2zgjrgKSUc1E?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54cc80e-d20c-4964-e8cc-08db7c61d264
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:39:38.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAMiu62HsTVpA1I0UwWobMOPazmy2gDr3eriy3AR78xXXerVN8NJiN6LDe5ePqnKQkfSffknfI05JxjXy1j8XanIo5brr4zp3vDNZ6OG9U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-ORIG-GUID: MrYDrha3_ubdcuP99lJhxlQuKxaKrCZ2
X-Proofpoint-GUID: MrYDrha3_ubdcuP99lJhxlQuKxaKrCZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=706 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307040061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183814

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Testcase 07revert-inplace fails if strace is not installed:
...
strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
tests/07revert-inplace: line 40: strace: command not found

Add strace to mdadm-ptest RDEPENDS to make sure the testcase passes even with
a core-image-minimal build.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index bcc0175f67..6152a83655 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,7 +101,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.39.1


