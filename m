Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DA4C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 21:22:30 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.86287.1673299342389768763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 13:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=MmZAOw8p;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=0373a37596=charlie.johnston@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309GMbpF022667
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jan 2023 15:22:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=SidiXczCx+8T45FL9Lnh61iXYHQ3TWrD1Kc/A/cXD8Q=;
 b=MmZAOw8pY5QqSefxaMm78auVK/O/bspqVx2lBE899ONSTmiXk3rqOy2FNaPZXP8PxhNV
 XJHv7AV0Jl+tAPBW6GRIGkoDPCUgfmu1EBXbMxa2up4Ie60ysRpjwiK4jHpK+fWJsVdY
 yLNW3Dooeq8BfA71khQHCky0ITLOLUMYJ9GBUbWmqauoRbjWSp45oWeVQ+Cn3ORqMn1+
 lyVmN0JKF53lpGyxJCJRRjZWQrvv0yRt6t1xZQg48F+aIMLhWB1ZCfM7MChPPbGgDISn
 SHSt3PR4YWZCjQDe3yKDQQr8xqhm8dVxDNHT1p/hTWltgThU2/PEcs75Q6UodRZ6QDm7 tA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3my5n7unj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 15:22:21 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCMlLkUK2TZIB5iaE+37hED6lgItw2KDwKHoF0VhXEPnqyc1Uhk1F2T40yg6NVYt05WjI9RDHvoa8afqJFLzX6AMx4vWsqN9DacS1rgamuFqLlouNTI10JxOypItW9BiO6mB61gKjgzS/BgQWdmCsckc1dCmMv8ONQ/RMcX1NEnBQAgVOPpMUvaYArxr38tdkDgY9qrBzU6cB2WY9GkNUy44GWabWLvhQWRDtw4350M2mtZb9emdcZYociysL38G6eduHI/Ppc71y4Kdk6mb8f2GMAC35GqyoxOD9NrDxB/mYcNEaa7gqRXefxdR9G2gJxYZTMMsttvxAAlUsG0DFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SidiXczCx+8T45FL9Lnh61iXYHQ3TWrD1Kc/A/cXD8Q=;
 b=YzH8uLFDR6WfTfA3zI5mgyUi67eP2nPgql4kNldgmMfWXHV+8Kw6D7i+7oUc81Q8mDXGDAdapmaCr4cgePDZwpn30ghHgkS7dATpE4t3rff7q/etPzhy9RVQ8ehgilKwmu48bVvKGMQCuhPON3Ykac/xW9jwxVmNJ4WsirfpaE3FRgFFBNTFCfETVVH1AsAWlcV3aRejACC1Tyqpd3/wuaTB1PnxJ2mf7xgu1uBN53WXapofwqlCPcTdG2yzTaCZSRG8pBWabICIyFfG8+3j97Kp0VCC4oHQ1ZFZjn2KPRzaqyMhBaBKBbv5TefKanhEamxA1GnSadSM1UEXEdxACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SidiXczCx+8T45FL9Lnh61iXYHQ3TWrD1Kc/A/cXD8Q=;
 b=k83C6kgB2jt8y5icnjxyjuzAEEMPFso8FLL9ArwyB/CbtMLNrKzWykmMbU9+bDLZXVT7RrIblv205JNmhtLlF4Ql47y/pkFEH7R/PW2soMSi1MJj33KkvAAiB0bg6gFFQ03omyq3gctWiTjOz6pYYpGBv9n5zimP7ynu80TI4EQ=
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB6690.namprd04.prod.outlook.com (2603:10b6:a03:22c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 21:22:19 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::5f52:b9be:921a:7d1c]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::5f52:b9be:921a:7d1c%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 21:22:19 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH] opkg: ensure opkg uses private gpg.conf when applying keys.
Date: Mon,  9 Jan 2023 15:22:00 -0600
Message-Id: <20230109212200.500890-1-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0022.namprd05.prod.outlook.com
 (2603:10b6:803:40::35) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 519ede28-a694-4de8-9fdd-08daf2879701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	laNA621x4vGMtuC1OXzhnw05RSkgbet3HbtvwvtV5AoDCuzqy/FmkbXcOL56ult5Gillk2TVQMcEngHrIF+v3N02hxuLHw7Q5XS4pDL60+tBIcArcsWhaWRufy/lwULzNI5VsJMdFAid63hXnLpI80BiDovpbGiG8JcvdNA0bdc8bV7Y0nylm+JZ80a1UDujKkY3pcVscZhw/MnOgNnGv3s7MQ8fgF8VFzrU7b6ATNz+Xv20Q0jd4aptqNoCVMjq4snXe3v7HLM+f2GP9XLEWSwQO2Mu1PwE7z3HjruqmD49e9WOMIN3uNaT6SskEiCcrrlajs5/1g2t1TxjG764mwAzNRohXM7tSW4xW7RlhVmUZAAX9lpFfXgqWBgp3vOAgArM9mEPuAJiNe4XWbEIa8dl1R8v22GLrxidqxj4qjmDMXOlSBxif1qQGJN8cSK1VUutfRx/Je08q8uIs+X+KHq7WNqh7bjKTf4NyPbScTvoP2t/oYYrd4UKd26KFe5CldxRaT8S6HC+VUZVAttM7/kt/RzyaK65tv0n146ViF4UpCgYsNwIU81h/1PB1HoUi63iNEqZuni97DI/W2FVNtCXYYkXycfYDO+iHGHXXYdtI2l0PFDnlr96x1eI83w3phkY4NzhiQzzzP2ykbavnjPjY00917DtuCO0Ar2Z3+Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(8676002)(6916009)(316002)(66946007)(66476007)(66556008)(4326008)(44832011)(2906002)(5660300002)(8936002)(41300700001)(36756003)(83380400001)(6666004)(6506007)(6486002)(478600001)(1076003)(38100700002)(2616005)(186003)(26005)(6512007)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zfKuejFXw/a3gLOibW1P326FNkIxXuJu+ZYXO50cfj0H8dGyogXB6exZcf1D?=
 =?us-ascii?Q?XbFLbkFDsCt4U3j3BQMRC9cTEfvS/1Cx5LvpuziL24yKJ/g162SpXa6bG9vh?=
 =?us-ascii?Q?34ei2JIwDifG0e6EAbG5L8dpoLQMeb1zLWG4Cju4Dn1oOxPnExOg1CGR1FaV?=
 =?us-ascii?Q?6V8Lb01Qlwj0aNG2iFVlicJ5Iul+bL9yUDRdxYcWK/SZ6bK03anVsQ93M97V?=
 =?us-ascii?Q?QHgeJWeKmp5VmvYPs42Gtx0n6CDF4Yuqp/dvgRPxeGnYW9UhBZ60sGvaTyo1?=
 =?us-ascii?Q?xmEE4ZL5sA8U8U8tnRPxT1ex1jolcbUoLfZUSWOgvCM6vQsAZBFg6s9plAKQ?=
 =?us-ascii?Q?x2TYjS0j1l/xoID2589D730zWhMdsXm0O0mexAkwm+fIOgGGGu60LkjfvnaT?=
 =?us-ascii?Q?zTpzssCYmaREdrLjr6bl1jvrtWM9isFsUVzoyRJ/NMCiBD3iS3GQw9B41Rsb?=
 =?us-ascii?Q?IL6YwF7qN5QJZTFfFQ7OS3bfEOX5CeQEzCyNniseeqgW1+wJUt02wD0Zd8l1?=
 =?us-ascii?Q?9sjndu8zTw+FJUqKXge4Ay35wwagSix/xrOlNJ9v9gagGFd2uX57sBJHrWIT?=
 =?us-ascii?Q?71s41zx/ZmoOVU6peJKkYKJjdBgTJ9cUN3oOkfMo+JJlu+AIGaKx6Z8Bf1Yi?=
 =?us-ascii?Q?l+j/AoyHZUvpEBiJBcjLW5/9qo89bpZX8iPlR1kAdpj4lLon7mG+BOosPJCC?=
 =?us-ascii?Q?+ERKXxnTeZ+AiezKDjKiYXfU4nNyMf4XfNzcAMSr695j8NlyKV8+iVTr9uVP?=
 =?us-ascii?Q?E1D64B9qJp/Zjy+XnJOqU9cfqvBsJ0NESSmZAfvtXBLWB1Iu8MOArqjnJcSH?=
 =?us-ascii?Q?ckcvZiZelF8n4OpkKSzYtMVQ7xQhRlhrmG7Y1NTsJjcui9r1oF2jPsTon4eZ?=
 =?us-ascii?Q?oEkFj0CO0Xurnmwn/JmJoTAO+G2M8k1PHCrIWAK3fIzdCxaCvKzYHOvfNiK/?=
 =?us-ascii?Q?7LTpAnv6O+J4wWDemwEcbdQqMNTx3qnAr1HA+d2V4DzVskSgAVHtH7lgxzYO?=
 =?us-ascii?Q?ve/yL+uedCcPIKCmkahgmplTgaOkA14Ewr816mXh6N/sbgTZKPaeYngKRKlG?=
 =?us-ascii?Q?Flw/lNA+4ZY4R1l66ecS/+/jDkGevty0zbancJhy1qUC/NOoLFgMeeIvBCMA?=
 =?us-ascii?Q?yjbBxXJhrmAHt4pn4dLynz/+6GelOyOQcMa1KAMas2DxOtmsiU/+DBmKkfa3?=
 =?us-ascii?Q?Edt4xKupOdH1mXO4kfhc1oEHdtxfdBv5oUiNu6tiuryutVy+5bgZmxeaDbCb?=
 =?us-ascii?Q?oj+Vr8yishx+DQ5v61ac7IQ/E+KccBHfM5u13+2hV2lJ5/wh1movHKx33ALo?=
 =?us-ascii?Q?/0SRG6Ee86NoIiuIprPOEJs7LU6eAAFcHHs/a3GKL6Yz/BUjGl8NQmWjBs/x?=
 =?us-ascii?Q?YeorhKknhtvhCTUrnNy9vBXIG0n9AOlf2FsXN5D8cHo35eNcpVWQyQvEEa5e?=
 =?us-ascii?Q?/p/jW+FzMXJOosrxM6QXB3hydtUa4PoakJtCru/Kwi5sr8qSj3powjcxJ55W?=
 =?us-ascii?Q?AN+qYaCvMWcwlGKuNED647/5cLKZ5sI1UKzEndJWMbpo0lxgncjA/TOrNHEm?=
 =?us-ascii?Q?04wzReZ/GUTnQa2ClZDnlYAm03R0wfm+cbiRXEBDSbo6K3rrX8491wbETqjM?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519ede28-a694-4de8-9fdd-08daf2879701
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 21:22:19.5881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d359c4Azb6Zca3vWctO0usJ2TCE+dgU8yGAJMSa5v/As/kaDVb2ErTA7nIbE8dNkn68PjoxD2+Hhzr6Ja2e+pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6690
X-Proofpoint-ORIG-GUID: VjWqJdE9AxcIn287RPUAibut6r_VUyZF
X-Proofpoint-GUID: VjWqJdE9AxcIn287RPUAibut6r_VUyZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301090149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 21:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175700

Currently, the opkg-key utility calls gpg with --no-options,
which uses /dev/null as the configuration file. This means
any configurations in /etc/opkg/gpg/gpg.conf were being
ignored. This change applies a patch to remove the
--no-options flag.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 ...emove-no-options-flag-from-gpg-calls.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
new file mode 100644
index 0000000000..f216950002
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
@@ -0,0 +1,34 @@
+From a658e6402382250f0164c5b47b744740e04f3611 Mon Sep 17 00:00:00 2001
+From: Charlie Johnston <charlie.johnston@ni.com>
+Date: Fri, 30 Dec 2022 15:21:14 -0600
+Subject: [PATCH] opkg-key: Remove --no-options flag from gpg calls.
+
+The opkg-key script was always passing the --no-options
+flag to gpg, which uses /dev/null as the options file.
+As a result, the opkg gpg.conf file was not getting
+used. This change removes that flag so that gpg.conf
+in the GPGHOMEDIR for opkg (currently /etc/opkg/gpg/)
+will be used if present.
+
+Upstream-Status: Accepted [https://git.yoctoproject.org/opkg/commit/?id=cee294e72d257417b5e55ef7a76a0fd15313e46b]
+Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
+---
+ utils/opkg-key | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/opkg-key b/utils/opkg-key
+index e395a59..8645ebc 100755
+--- a/utils/opkg-key
++++ b/utils/opkg-key
+@@ -53,7 +53,7 @@ else
+     exit 1
+ fi
+ 
+-GPG="$GPGCMD --no-options --homedir $GPGHOMEDIR"
++GPG="$GPGCMD --homedir $GPGHOMEDIR"
+ 
+ # Gpg home dir isn't created automatically when --homedir option is used
+ if [ ! -e "$GPGHOMEDIR" ]; then
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
index 50c9451a57..712f066f0e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
            file://run-ptest \
 "
 
-- 
2.30.2


