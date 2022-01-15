Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCF6C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:54:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2552.1642211653427885160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RarDFqwo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F1pWqr025583
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=togb3hJZmmysfCICOUyPnKB1pmi8972EyRMls8yN7w8=;
 b=RarDFqwoBFcMM+ECVma5ywcZXlV//4Ztyl6/MFpXDYdETiyvXgV2vLjdfv6CeZWJsUH8
 WVIhVpxoJOy57rjeJ3LawPRdfwpZT1pB9WQRHkz8ZCW8BzuwrokPNzBDY1btGkj/JkFu
 0nMo5CRFndFbV6zluAgeTUPQmOp/4m8xMAuR8JyACi4MIZXh1dDZCem5kzZF4ysgC3cw
 oDWJFnfyySSCcyNGOEPf0WxFwH0TOAKgVHi+HGKjFngtgD4aXCd/NlhXPwlxJpqJgWIH
 tUR15Kv6t2t+DQQs7G257bYn9ys1M7Vl7ClnWFPxsg+IznQoGRZTejjGsel7cAM9NHXt rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F1sA9X027763
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:10 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdnx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jan 2022 17:54:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B83ix7o1QHp3yazi0o5a2hd34y0Mp4HP8XxkpNiYrklYZ8Spxt3oHB/e/DDOLGOwSnOS/Ld/MeZPGz+cC/BDnHgGwwNm3ZT6Lfzt3ZEjBImNbgFW8cnu+FWckouOO39mbYYo8Jxc5xiPc2qK2XTvsC+TAn6GXq8cqJCG/z0TGfGrVMW2UvNyGvrMB92cQFjlCvHFY81rq3YT38mxRhq+vWjArOqYqUkEX8XJyYj1JEaSKPtIgs6Ow6LltWkr4y3nSEFtJ0a50uhOJCZ0IXr59X/w+GQPwlmsKB04Q05LWInaD+XCNRI8k2Ap/WwOKINgd8Cgj/kTB7XOaxzeUp4uBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=togb3hJZmmysfCICOUyPnKB1pmi8972EyRMls8yN7w8=;
 b=N8fuL9s/XGCxvmdR0LpgvduddmBzbsxMaakv8/UW315DUlk7qxRZANlth+dvO3Evz2KL+ur+l8h1j/4lmy/TwRqj8wk+JYWR+u75RhoFBUm95ENqFVvLfSZEGmK07W/6bYYejzcjuQksbqoWzKrHnul9czqHIbEpDtkH0J4pb7y4C37CqFMeXrx/sQi3olE+Fz7gj8iKz1um994pX2Kt3zqgGVTzN9YNvnypgBxBVuSKcLx8FLmbsFtrvV6tyVoIgWEM+baeaMtEkMA/SjiiSN5krftqfUnqDiZciYhmAdeCzRyDN+qGPO+UcrJkNUIbY21OSadi/7SRAQe0F0WYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Sat, 15 Jan
 2022 01:54:09 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 01:54:09 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>
Subject: [hardknott 1/2] arch-armv8-5a.inc: Add tune include for armv8.5a
Date: Sat, 15 Jan 2022 09:50:43 +0800
Message-Id: <20220115015044.1142719-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220115015044.1142719-1-kexin.hao@windriver.com>
References: <20220115015044.1142719-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0c2de2-f38c-480b-4003-08d9d7c9eb82
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2223:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB22234EB612B9291E85C2F4FFE2559@MWHPR1101MB2223.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cZZQho12pfqDvXSthlymls4/P0MX4sjaVEePE+HK/LVECJ+uHIroYGS5meiHDpu6GNvdsrZ2TUWYRQC5UpmNCcP9r8we68xZieJPozS+zihHW9pHBiSbsnKPVcxQYODR82r5wV9hR75x2shajJIPzBI6Y/bs+ppxP4rYwWI7lWJTOyb674YRnyCghEMQp1iNAacy1L6+l/1tleBbCLlBUX4wjsKhlm+0xn2aJm8a1JRIXU+SLcOBoDsR/5iYIkjeVvedzy1Ix4n7uip88DW0N0HDzjYybDkWOBhU/RLpd3cC8RX+xfeLPyN0MpCdDo6zLoBI7fSZpyPhMNrc1FV6MMuYWpS7nbfYVmXUUocmz76V5i5g+zurGYODaKUt20q4oqsE6NxJFOURjltK2S+WszonPFtlPANZ/MQAW+3fq4JqXY1HMqLOoeD6RIhumRHPhfrE6VIvChuIG6ZBcwFV9/fnJZayV/sxwVdZDTvEQaka81U+734hUUSPu3xIYlmUiXAKYauvRGpmxVR1HQuzen4bEE6YZIGPa/FWEqPQMDJzfsGUOF5RL/LhIHHE6KEwbaxp3vpJTry97LrihsgW9XPffPD2MBUVmxx9ocLOiCBM/Gc/o4/NnNoKbIZN0RdQLXZHPy9P8YtkSXSnWdJL6PXv3V3+GrQpR/3CQ8o+8I1SyaPr4BkvhUkPLEJjmWw0lOrfpWP0medPyYhFhKVnCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(66556008)(86362001)(6512007)(2616005)(36756003)(4326008)(52116002)(8936002)(66476007)(26005)(1076003)(38100700002)(6506007)(6486002)(508600001)(38350700002)(6916009)(316002)(186003)(66946007)(2906002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ylv7TnGxndPB12Mfpu9ca1Tks6vITWvzOuXi17E6Ptj+8mEKvx60CZPSUUV?=
 =?us-ascii?Q?hTniHEUYhtsKAnUxxJIcGSFjVlJNEy5frEQ4LDsyphRO+evTfJciRhkYvC3x?=
 =?us-ascii?Q?aOh2q5ZvXF0RnQr74W3byAHxkTYhdrU2t+BRSQ2fl7RKMkGoo21yM+SRkwFV?=
 =?us-ascii?Q?AwIchusGiWHB9AjZXbCxSP8UKINHO3rFio4M6CgvCaSNA0agIzYAyydthgzc?=
 =?us-ascii?Q?cRWggr1x9PEgzGtLDJhDe5mb1vZOqCWfXUmKdrOAknt7vTb8g5vrUF6u/6RY?=
 =?us-ascii?Q?9EsLBC/r8FfcoDYnxm8NkqAER96GP4LCGaGNZ6aU7p/NWpyoIOVKv8QFgmJ0?=
 =?us-ascii?Q?oVu6mgjWt0AWgoaHroWUl50Clpf3h1laxaAXyvFtPfCb7epNcmbkjh+MxZ0j?=
 =?us-ascii?Q?d86kT+LXq7nGXuN+9SFIz785mSTdekcVAwod+ubhDWC534VLe5x8+tFcaDKp?=
 =?us-ascii?Q?FBSs0wN2QweIBcGPocnd3ke/S8K4a8lOjkBhfsVId7bvWSsLleortPK71EQ6?=
 =?us-ascii?Q?GKADc1L9t/0Mi4Bk0avO3t71ChfwABjj/vhuxJM7+6D86Mlu7d2+DJCQhNv8?=
 =?us-ascii?Q?hMHMf7R7kjc8/XXAt+SA2S+fW1bWbpYFtpJOtGk6G0C/yqAB2IRCMIEYxw52?=
 =?us-ascii?Q?3KFJCAFEajfvnp9O1nks0VpBZvYguzOUO2F3ywhQDbYM4rCRWAuktlOdJpvz?=
 =?us-ascii?Q?ixArpa7QTpH/DUlZIj+6yZtkYWOJhHrLEyQZcS6VRNEy2plio+jo/LKHNybs?=
 =?us-ascii?Q?1GDT0shEPKvshUPn/jpFTG9p5xQWcpf1hvcPily2S5CB62rAoDL344QlyCHT?=
 =?us-ascii?Q?uZCL6I2RC7wJXIBoSFDWY84fKisGpsIpBUNX86qvj8nDsMo8FcQSjfizzFK/?=
 =?us-ascii?Q?f976Maxkbdiu+paWBdOp9oISJSRhkMMlxHoqJD2YEQ2KuL3X4MkNB20DQ6Sm?=
 =?us-ascii?Q?yh1ikDISz9UC6C0zlfHB1KcFRFXhhrl6cU4C+HR8pxN7Kzyyh5eKQ4Q0IcXZ?=
 =?us-ascii?Q?tkhw9ijJfwsc5tQkpz1x/nslKnvR6Pfcw8GBOT/mofui0gtkRmo271oQYvae?=
 =?us-ascii?Q?H5isnvRi84zI/Dprmnnlfv8DKmr2WehL61ZXatmyGT4e/Bu5EWjP+cwwjitb?=
 =?us-ascii?Q?b8+A98apLaweKcpS3lKdSm7y2K0LCESSDetx+ceu8G3c8P8vGVWtxiNlfOiJ?=
 =?us-ascii?Q?Si235Sf6p52jLi1KhoVU1P/ZpevqytLVteXysE0ERcTukst2qxwhpyYLDX06?=
 =?us-ascii?Q?hMTqadyyE0woP+YKNiDenhW+Ah2Wk1DOhJFF5TuqnG7EW9SL/b+yu5lMMU39?=
 =?us-ascii?Q?uwrVG3qjlhMsM23suK/tILxzpznYgL+x4Sg2jks+GcIugGXKLCzgPc6nB7jR?=
 =?us-ascii?Q?sz9bQU6wqD9lfLjZSsBT4N9ceskSu25HV3sMyiXagGE6XKykQ2SDoXDL2HpD?=
 =?us-ascii?Q?e6XsNDtupU1ApB8otXzcM7FW1qndLG6Tm5iW5hBTPbC8eqy4bZPEEVqtSaNT?=
 =?us-ascii?Q?RcbuAlU/LsfRYrVEE1VFQx52o7TSi002IIm5X3lOVpupls2xr9mWpBkwVgEb?=
 =?us-ascii?Q?tZhm2t8y8FMGUeYrsmE8ZaVRGV2X+wptgG2LiSvNTfrRJ4WT/4lCjfCkHi92?=
 =?us-ascii?Q?11DWSnboM/B+3wp6EBm9lZ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d0c2de2-f38c-480b-4003-08d9d7c9eb82
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 01:54:09.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9O2OLvdy9pljhS5T125kTNzs9iofVEr2CGIbK64qGvHvEarfUD2or1ncrItMXjXOH60PpsqamFm9w92SOflQYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
X-Proofpoint-GUID: 7z8EYkmpGjkYi86oW7as6MQYks2J_nZR
X-Proofpoint-ORIG-GUID: Mv_4F6LINS8ODoC57zi69-xWda1lvlfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=514 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201150005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 01:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160594

This adds support for the armv8.5a architecture and the crypto
extension.

(From OE-Core rev: 0cb1a6d9cb4c32526d79dad93c8053b3793053f8)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../machine/include/arm/arch-armv8-5a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-5a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8-5a.inc b/meta/conf/machine/include/arm/arch-armv8-5a.inc
new file mode 100644
index 000000000000..44c3b5bd2275
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-5a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-5a"
+
+TUNEVALID[armv8-5a] = "Enable instructions for ARMv8.5-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', ' -march=armv8.5-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a', 'armv8-5a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-5a armv8-5a-crypto"
+ARMPKGARCH_tune-armv8-5a                    ?= "armv8-5a"
+ARMPKGARCH_tune-armv8-5a-crypto             ?= "armv8-5a"
+TUNE_FEATURES_tune-armv8-5a                  = "aarch64 armv8-5a"
+TUNE_FEATURES_tune-armv8-5a-crypto           = "${TUNE_FEATURES_tune-armv8-5a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-5a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-5a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-5a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a} armv8-5a-crypto"
+BASE_LIB_tune-armv8-5a                       = "lib64"
+BASE_LIB_tune-armv8-5a-crypto                = "lib64"
-- 
2.31.1


