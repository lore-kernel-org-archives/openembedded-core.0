Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A200C43217
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:16 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.54])
 by mx.groups.io with SMTP id smtpd.web12.9063.1639651155346786364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=cGnufowP;
 spf=pass (domain: synaptics.com, ip: 40.107.96.54,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKv6Dss9QL4yPbJfLn7SQx9Si/SYKtkPPSOMRvgO2NRn4LElr20Y3rSf41nHzf3lss09h5EOsWz1AXeWV0of3bcO7hPCCFl4Ck4boX9kxvDVgkwBd2XvUm9PhDHcOCiQO4OVwl0buJ0xNCEQRUaeP8BDX1RyYScTkuzTFmQxGgLr//q7+yxTLy8PZV8gnEEeM6IRoGv9KzFzyz2s8RzF8JpX916gbqJPprcnuScOgTH0mhSzZzLph8F/zTVD3GAYxpzy/3EHVgJiGOioxisICuQPui+JXSX8kgtNYf5EuIRyWsigW39UglPkXWTZqFUz+f92iTcxkktN/cVMKOTnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eZVQD1YIZPDBdV1XKi68GFl+/D46O9gyiZwN3NFpGY=;
 b=oWo4L1OwDF3fEh2bpCjByj9viEuon9qlDMCtUOFCA63jLsPHOULdChR2poKUfzdPbcKbQIMNQAZWEyJYaeZ9DuHXdsKSPbpxyZr0sCu1bzCLbBKoZjNhZ4aEthloHrqN74r5hnJgaugdnbn2xot5KLRPjDObPwxn+h/gLNPZ3c5fidjBkfWoK5TW0GxwsK+It283rn0uLQmMZM3T8H0OLZXypn1dD26y2/mXCNu3DftfP1ZRZbWzqpw9qUVm1PmOvYjNcaCA7+ZF5rs3pna+7Ma/VCSb+gOCEkPHaJn7RYA0Ea3gSHRosMDsMDEfoUawJ1uY8UH+vLuPWJCLE4VXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eZVQD1YIZPDBdV1XKi68GFl+/D46O9gyiZwN3NFpGY=;
 b=cGnufowPzVoFjRyj+rxwZqQ3zahpDIEsfuLYpQbql/BDgd5kPLSsH8J8gh5suLAm3SBgPP9viPB6GI4hhQtNsT/6PWuAvSXE6fq417ObVr8HW23JR3+eQiGlAf4wBMQ9u1waB1Zqo1tdNtgXQ0ZsaZ42PqsKKGjOU+/uLoJCdDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4745.namprd03.prod.outlook.com (2603:10b6:5:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:39:14 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:39:14 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 3/3] [WIP]: openssl: fix Android target
Date: Thu, 16 Dec 2021 18:38:46 +0800
Message-ID: <20211216103846.718910-4-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216103846.718910-1-randy.li@synaptics.com>
References: <20211216103846.718910-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4d6879-1243-4aba-fd0d-08d9c0804db6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4745:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB474574C017F313DB34F861D586779@DM6PR03MB4745.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TsX1MbjsC7M+n57WL+w9q4XCJ1Lln6q70TeKa4ApFWZnHilIGD3n6cq0L+66t+nWydvxLVO65kruWn8rx29joB2KT92dgRlmcDbt2jd3IPqVpyFiHrIV76oa7DxJPkxtaDxXQfp5t4inu3vAv8eJva6a+ScjFVuY/ZLwKOtrIjrE66V6TXoslLuYlA8RD/BgQgw93D0rcapSJRNX8zsaY70LQcq46fWLHobWeEV394QQLrDWxwBjP3y+y5RBFxTUy0XYq/kaZvNiAsdq4/KR1FeVoZoQxnNcPZGd4kvpwWFTbmluzYiuADPQx5WNAn00AaAmro7TrqLKCpI38CSLL/qijdHxYj1J1u6RNK80Rself9jeCabpBESdl3MOGv8V5/EOLjdm35XUzA5zqvTPp3SBAMQZI5dEUyw+rYyWo7sMK5Esc9fbfMtDENuc50iQQZ1ouu+Bmyr/nJ75YIOo+jjQ5cOWL4nNPzPn8K5HDIwKsp9g2BFFGdzb3Nv3gdavX+NasNisB0tBcKIr7M1cw0/byPsLKdOKRuCEtQBM4s9Xe7FQ/lzeuFcGOAwDAzsn3wwrRoDgmVrhbz+YstX+ZJSpp1ibzMN2hao3KedtfjxUBA+1qhqVhJ/dLSYejod1uc82etvRglZdHCK2CM55QXMYlo+YJ9uMfEN/ODLYcj8vAHtBjCmoTqVjELzGOs+BoXre3ONuCLyONTMmrTiD1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(186003)(2616005)(6916009)(36756003)(6512007)(8676002)(2906002)(66556008)(5660300002)(4744005)(66946007)(508600001)(6666004)(107886003)(8936002)(38100700002)(4326008)(26005)(6486002)(66476007)(38350700002)(86362001)(316002)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PrO/aOJBQP4vq7PybNcWZA19fN/hewxzyAwVxuEFmTeRpjptlGGg+dG1Aaa0?=
 =?us-ascii?Q?Y1+zIfw6hqrdWJQjpxxlzHtuHquZPBXBBnYwoHPWJUj9ZMfa6p8CK4Ub+qfF?=
 =?us-ascii?Q?xj51qYI4o72vGJn6H4tdpXESAFxrTcgT+06v57/k1A/jFCNLo06XthUwlK7/?=
 =?us-ascii?Q?BUD++OdULtVLkZ6tom08uZFcCPBcS1kRL/e4O01VcAkzsZAtT7z4stMSsBiq?=
 =?us-ascii?Q?FlCdYdPcLYywCZ5fm/dgUExFoN614xwqYNUsdiBSFSQ6t0OovuHSFEJztGI4?=
 =?us-ascii?Q?52vxgMF4dLp4SuQI7gqLjnskYir4JyNm/q1rfs7FB2Oa8C6/46Wu2RNkSc89?=
 =?us-ascii?Q?EdNQOxy1/2WkMFDIA6/Xdn+j2IAEBAAdOiZnE1uMJUyH3EKgHlTH3JUjXZSV?=
 =?us-ascii?Q?cwZqvfZPFM7WSA68Dzih5f3uihQXkihulUQpQV6FGipjEqP+EtO83BPkugt2?=
 =?us-ascii?Q?UmS6JiCIRt8x6zvCgFieCTOpEkaPKtvRQPb8+4/ARl2C4/a/HjUWXIawuXiX?=
 =?us-ascii?Q?3Dg3AAr2FNIBOjbt7l68KTV1x87uThBiTIDZyX7oVPAbOGyHMq/KMTzIXccH?=
 =?us-ascii?Q?Hec7OamQ7djCElf4SRV5p9gKycH5/AfVEVf2vXwGxBg4GiNI21szxU9+EZoi?=
 =?us-ascii?Q?+pz1LwqtbO2peokalLkUguNHKGzmLWq1HGNwt5BrEQpZ3ks61kvB8F2cTD7F?=
 =?us-ascii?Q?nEiZCbDp+LFh2JmCMtx8QsYjG4V8h8bXP9zol0r0VKK+X2DiqaiWD0EYIVf0?=
 =?us-ascii?Q?ZhPbRdw9cBUWS2Prfj2j9BKb7Yzu5icSrliNKVHNnDeJvlbJsY1t6JARjhOa?=
 =?us-ascii?Q?nPFwhC4WYgF8/bED8vOF3naWFhPak0tIf9PJvWJj/l3/jZOKjwaklZEa6aER?=
 =?us-ascii?Q?opYRQPfEgeUQD0XRX2uvllJGrf1TI82ymt9dC0cWZsHfSDWi6tM+VkTsEZ4V?=
 =?us-ascii?Q?vgwieegLYg8OFiu/3tl5/Usz7R5xSfL5r3Tg3mxKHUOGrdzY9c5zhkrVvV2J?=
 =?us-ascii?Q?FaXjXTuXqcXgwPzZHpd/56AlGnwf1zmlj5iK6j3WIO31oA+8BLHFpAavc9yp?=
 =?us-ascii?Q?RjBFn7NqKUFi05QwYVgFji3gk8PjSkV11hTUw2oRF9+PAghvhjWwF9v7fuIv?=
 =?us-ascii?Q?kSTy0dUL7XFiWslKX9lkri+Q4Se+ZSg2QlE+RW3fqZFIXERa/UPOz0ZF5nX1?=
 =?us-ascii?Q?J9nJnbLg4CMuABFfzx8Sb/eIuLVY09HKfgiYDSSsTJbr1DR9xDkR686cuOSk?=
 =?us-ascii?Q?G/mUtr2A4ea/tb81t5/6GNmdzTPXv1pzElLdU+Sp/4SQKeLWUMZvoLCJfX7L?=
 =?us-ascii?Q?AF2WWXis+oiL4OTCAr+teRaLIBKC9IvTi4BAWt4+GDfn/AAFq8qnV3GwQ3sa?=
 =?us-ascii?Q?aXIzueaUOIEljasRJ8Fdda62M0ILQxX66jW0xwQrJZ5Hzxd7mMlyN8ZYPiou?=
 =?us-ascii?Q?yJF+SUMhnaRLsiLFG20M1fZU3Z/crLezW85vr46B7NtKAo4PoxUG9Tx/OEle?=
 =?us-ascii?Q?2IgJ9SeQE5X5QraTwhIhmXQ+KMb9yLL/WpO9NIv9pMXnQ/zSut2mRrBUy8ps?=
 =?us-ascii?Q?0zZ1Wt89cciF6PE+j91tYbw//bs2HSjd6lCWhj37A4ztleWN1ZE/+oJvLiUX?=
 =?us-ascii?Q?/im58J2zexFk6R2P3YDyutY=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f4d6879-1243-4aba-fd0d-08d9c0804db6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:39:14.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6vIVTZvSB/o6iFln69Mac7OKJkl58Wuv0iArWPu+CEMWcyVCrkBTJUJ692BD1vo0GKd0npFNU46bLZeBPkmRJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159779

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

It is fair to regard Android as Linux target, we repack
the sysroot, so we don't need to bother those helper
from openssl.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.0.0.bb
index da73ed6bc3..c2e07fcb0a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -58,6 +58,10 @@ DEPRECATED_CRYPTO_FLAGS ?=3D ""
 do_configure () {
 	os=3D${HOST_OS}
 	case $os in
+    linux-androideabi | \
+    linux-android )
+		os=3Dlinux
+		;;
 	linux-gnueabi |\
 	linux-gnuspe |\
 	linux-musleabi |\
--=20
2.17.1


