Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DCEC43219
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 04:01:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7688.1668657669196266232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 20:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s5MHL0Ex;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83209441af=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH3uNJD027062
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=Wtga4opzOTm3cjRs3XYknRpvZXlTtVuQkcAIusFcqW4=;
 b=s5MHL0Ex6cRAVqs35lTeHA3t4PACS60fOo2bPK4fxv4e9oYaCIJjL8pM/yjjRFcdYYFa
 5MIAwNlkUUiwi4Bfib1zp+N97TAzp5KS7+pbCFODt7bcu57V1eOjDXojf/IzFa1Sxy5+
 azu0w1AqjRDDOGtbYafNnYq3kc0aWg+6nNvpJJnb1wVEcjuCLie8cMAWOkt1AAl9Fx9k
 DgVZZZJ/R48d8maNFKFvl5W4DCa5LNJda/ADCXa/x5CPqNt2fx0aKSN0G0cTu9B9sRyB
 UWYSzG6xmx5eJelHcSH9C8g9IRcvRbwvvtvG8ws2OQyIX2kibiLOylJCZGGHd/GDih0s GQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1g1vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:01:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pq0aZRmb59PjXBaVxWuo2a2e8zg75JSp9Reunbuyz/5bz+6Mez3E3XdYn3YGXhaotJHpgLwXHxiKy+XX3TV8yNvUItBW+sJUCYKRmmZmbtfZL/zlZD2TnKmOk/Mi5oQHUleIWr1Wt5A0Vkvc2X4f4qKAGvv246JCzjln+hL7X9m5UBUZH8tzmLdDSrggMVPcL1wRM90+btR+dAc46EhyjFOwJ77KI7PvcDKnNv3r5JBTEJ4vVgepsm9K69kTDEeGQDSU8DHuo6kCIi+ZtiwAGau/7kprTQ8P07dLdrAkg4fs9lEatE3dpFbQdHg6GnzmTm0KXtOFxTEkKwpzzNp6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wtga4opzOTm3cjRs3XYknRpvZXlTtVuQkcAIusFcqW4=;
 b=XuIPCWM/zOC8E+vcwFFWD41nx4D+x315uY/pUE3fZIcjdU4ngbC5Lb7hA6tr04j67NGhubtTZamh4ReHU6sRvmeyfVynKtkFn8ew3e4krJD4l017exLqv/F/KU6B1x25i9JEL2dT94ackR6I/kn3B2bqPqxixaJMcYwyZk/KPMol5OYMg0wujph8CtEMqYzwrtqd7Pf+ge8aAemh++4UHQB5rEo8oTWAdz1kBuRuN8S8w2wqMw4sZpHnEe6Zuh77CZLz2ie1hA8LJ5o7R74/7Lj+eErz7YHfGiSrP3fTmlm6kmkXJKb3yTxGryrJAGwFpbVWawliKH8RuxXKC/Wl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 04:01:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 04:01:06 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
Date: Thu, 17 Nov 2022 12:00:48 +0800
Message-Id: <20221117040048.14781-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: b1475821-d66a-4e4c-4778-08dac85059fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nlLn5HxfAkkkrhASAcrVbdEXijPN7eRMHz0zw1iZ6wFSCOxtNfBVME6HATb0/L9mzlAwTrZS/b+sC+zvM9TKfnNwV6piGBqJbtoU3fx8OQlcR8JrQ5gm262mATibtLqWhPHW4Qo88X/h7LO5W13rfWZDSUDVtdyitOqDloSOmk5FDbePViSfxWDiPnbD5qqM1mX0BH6C0x/6UCaknEIMIK/brtaBHhqEatYT7q6T8bKkUlccncE18MnurftNAVdmtJz3xsGkxPb5oFkGg+v0hKDOQ8Zm14161/PKw19d/w9Pl5qRz9Z1nL9he5MZX+9cfPkjEl49ONHNAEizjCneex4dIVr5UAAs+p+eebb5md3zFf0/7LXD2SKa9iqYbo6en91Vh/Q+8Dnmah3MgSWMt2OnmicrZDEqozqqMDqryYiTEYtiWixvu5kd026azTrIl5dprT+FgIhWeISvFqmXIoeiq0B8JLgkKkkjUCcLqrPXF5ujk3sN5jN3/+Ne6vQZ9tb6OzpKGnqB6TijR+7kNi43ijsaRGeKRQcFAOHxKqslhxfC31m3om3XY8KmF43JGXyoxuFX1TEbXjLhduWlDOenkn1g+UoW4QVAFgqjmYHHU8n65Kty5dneibO7HX0UQsqYC2osyJ2pVpxrr8C9kPOq6HxhwWjoHGBkRqWGMQl/2eQuVe25NOOSP/KIM6jUFyespK8IDa48Zf/pt8/tKpxepKO0xIrHsD2FlSIGfXSfQ4PaRUx5MNNIJp8CR0K8el3YCMtbmc0KQ/L+LJf01Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199015)(478600001)(6666004)(26005)(52116002)(6486002)(2906002)(66946007)(6512007)(8676002)(66476007)(66556008)(41300700001)(2616005)(5660300002)(186003)(1076003)(8936002)(86362001)(6506007)(316002)(6916009)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+y5iV72Shw3ln5Ldz6lAR6BMfEp/12oSWFt+fSau3Zeg5viBlH4cGN4d6Ysg?=
 =?us-ascii?Q?NnHw8vAZ6G0/c7Jr8b6M4ocgxHmYABODIMVSCR3O2r16lnDOM8hsBfoW16KR?=
 =?us-ascii?Q?hSfzFW9RcsBdtzI9hSN0XchcN3YLxKzXElF29df51Sb+6AzNcAWU+hd8TUXZ?=
 =?us-ascii?Q?SApa6T5SPCUJCREOGGcFI3vcCB4I/PvB99Vj32OMqvoh6DTnl5vRTSb3H9or?=
 =?us-ascii?Q?pVao6w1w6X+jz7xPfW13MAcFMfWXlwuhCBWiPwgUiW05IN/KBLVo4BOuCVL7?=
 =?us-ascii?Q?V2SaEHHFCII4kSZZHQeolpxTfR8xrJK15Mfk/y8LNwGmQsptvtRFlr8ogf1S?=
 =?us-ascii?Q?f35WWxSZsSeCpWR5FWAG3KKe1y7NEFJ7lkXxyZ5QQhslMwrgiIT9m7J+zhJB?=
 =?us-ascii?Q?cr+Gt3qI62ZdImiUKX9FIq9BR9McTkiouetJkcCWU637QVvixAgMdsxzLMrx?=
 =?us-ascii?Q?n2mUYeupoIVbmjnaflDZhX/R+GxofDz3saUK/OO+JRx9X3HKKu136e/f9WEH?=
 =?us-ascii?Q?t12YX4l5Pe4aWno3qQ0UjckxBFxVz3RYjTA6Zqy48xTUzYjkpCrcfN+XyzBN?=
 =?us-ascii?Q?vbsIMihShs61Gxg0vTAB9s6jrg6u6bB+YGlWH066RZF4/8rT33FvKbVlNSn6?=
 =?us-ascii?Q?2n0fIKXIL4So3WK7gRfDqrKcR/k18RBQgvmOcPc/kgv/B5VUuukNj0vUbJD+?=
 =?us-ascii?Q?xEk9d7k0GeYyse7IyhZPSGQEiajkEPNPBajw+xYTPPb+ixKU+is/sc+++CvZ?=
 =?us-ascii?Q?kYynRy5XG7P6QiU7iEhlJ8YsNR86Ek1uGEBWytYa4kESAQb45XBgC3bcy0v6?=
 =?us-ascii?Q?5IXJHRUF94OjDar0A/dB9+UUMP6rYL2xfS/tZPRuJx99qcbE2EJiA6UPxbdk?=
 =?us-ascii?Q?8Cd+cSPZ+3ju8zb6pnmQ0EovmLDFOZcM2mgE6VHEeIUeZGXTYemU372yDFys?=
 =?us-ascii?Q?e9lUBQcP9S/n6WOls3e8QlM846hzJA+LEL1evmIMY2khYZf+dSV9RbwCfRdV?=
 =?us-ascii?Q?ntl7I7djZwLRVvcjRJW/vS4Nvd8GxIh9OFmMpn77vMZoLfRIF4hVMCKCs/gv?=
 =?us-ascii?Q?qoeumUMoR6SA1KZ5haoKGFy36aOXesFWrSR5+UqVmBJlhN3QMJVHvPrX1blH?=
 =?us-ascii?Q?4s4SmxMlPPvuNShI+XjuGV0EJRReYAlxK742PHxSidXWHPQ2fiD5IMhIVSHB?=
 =?us-ascii?Q?1e3Nm/K5Mg+03wSQTfrSv9bhVRi2yAD8OCWX2qa//wQ9s2favwHfi76qV9gW?=
 =?us-ascii?Q?AMM2MEt1FOZKvizq4smXa+Ji1qtdAmpFbKk3F0BdDatR5MpyPS+0i6RIhGEW?=
 =?us-ascii?Q?LvskBVpSZ4AompNkni5/BJo8mi4YYg3w3f4bMQ/5h111UTB14AOkvJdYhm8K?=
 =?us-ascii?Q?E2Nj4qJ82LEuh2b6rOu7wDbKCV7BbPZHPcrtAO9iU5Z4I7rZvBk/QlJ5TLOi?=
 =?us-ascii?Q?j13UlPiTG6cMto10+EMTGaCFPNBExEKRJu91A58kvRxYfiNAD+6aXUOKq81m?=
 =?us-ascii?Q?9yuX6nBZ/ZPMl3/vgOusdzRc9iKuV19JM9+PCXCwuscJtuwi++bXUPPxwSh3?=
 =?us-ascii?Q?ZTWH1LbSFI0DaDc5rEHJRo/OKKh5vPZOOS94sSN+ZumyKNpkvPSzID1Tad1r?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1475821-d66a-4e4c-4778-08dac85059fe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 04:01:06.2090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzIXI5zIHvfl7KFtiq8XMdUxeXefROA3Ox9EDpmSWecUz+wHzPODvuMsz85QpM8PvNFsS/01udVDmY2RSzWlig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
X-Proofpoint-GUID: oCIozw93S9XeLfnqKcYXVLct21lrxqfn
X-Proofpoint-ORIG-GUID: oCIozw93S9XeLfnqKcYXVLct21lrxqfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173399

Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
at rebuild. That is, even if we set it to "1", the kernel build time
is not changed. The problem could be reproduced by the following steps.
  1. bitbake core-image-minimal; start image and check `uname -a` output.
  2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS = "1"
  3. bitbake core-image-minimal; start image and check `uname -a` output.

It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
build time will be set to current date. But it's not. This is because
the compile.h was not re-generated when do_compile task was re-executed.

In mkcompile_h, we have:
"""
"""
It has made it very clear that it will not be re-generated unless
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
explicitly in do_compile to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3834a42fb9..3f6b40907f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -367,6 +367,10 @@ kernel_do_compile() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -412,6 +416,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
-- 
2.17.1


