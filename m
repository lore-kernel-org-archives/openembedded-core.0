Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20059CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.900.1778649841730054722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jes5rx6D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D26ogn016166
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:24:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=; b=
	jes5rx6DCDyWW0yr1BK6JIeHSyUu5H/g0nBP3CtjZKh/1psak0C3Gp+5Q8QTK907
	qRZYoY0mom6NGfgbG9jqgf2qD/VG1QasHq2TATqMFDJzU08A4OKEY51e3VFALoKJ
	QiHWJ0DWJe6czxHG7dMBg5qyte4Y8LHE2s/DZvPLyR1KNdhFPZWypsPw4h9l0FWC
	2ABUR69wKjjts9vbX+xV7GGtZJFS3MbpcQFAFsTuTQF21g+GmgVuUge4JOVs+imV
	WuLef7O7TyfsDMjJ6dU6BDG+o6RpKcMevE+d7yr/SRqo8NFpjccXKBYXP2U7/Z53
	acImF0WddCzQET+pGjy3Mg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g85xw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDH17qhx6SpHf13bNJrAEO6hUwhJKaJ262J0ZF0FY70ILy/RUlXv+KiTsVXVN0saRFekc2ODZJ/TpiOULCTHF1ug9tsRDREII+Qey3c4A7PGzomAOs/d+azOmzVquXsfaDy6bE2ShbB5GKNJzUDWgKDF+aLLT0wRi+serSuqT8zGRlmvMi+XvqrH8NtYEaFBmxY+OqJHJua53nXcQLVk1/sboiVqpFAwso0oOq+1fH/ZaUtSqjvMrzwNc9Eg40zU3IIOcghol5IGDB7ChZycftfsfRG2vb9v3jp+WzksTr7i8iRm4AmBqhwJ+mgpFpWf6dlJgaJ3o3zJkxJrr/p9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=;
 b=hrmvRWf3c7QkWWfaz/KuCh0AdV7L1r04TMqNnj7hVZngs/lwOuNRjw8b3Kusc3c3HVosssCAVdV7HqusxG2NdMGnkgSEX6kKZREAOWIIGLygP9Ug9QYgpiSN6odhV5ItSp9YeNXf6zGrOsFFEeITAB32uJSt3zQ4eBDbgZWo480l1qh28RlEDBcf+JOsA70/D0F0imyrBBtLMcG0T+hTCcVS6lgEn4CVMSQNL9yhzQM/L+nURb14WiWa33067T09KCxka/KhXJHhm5n3Yhj+AdPmtRLqTzYEFj7yk9zKTXcH8GR1dW/JlPIkLlKG74n8zr1OU1EAcFZueyuBr5JvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:23:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:23:58 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 4/7] systemd: inherit upstream-stable-release-point
Date: Wed, 13 May 2026 13:23:31 +0800
Message-Id: <20260513052334.2271800-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c75b9b0-5389-4257-9a1e-08deb0afd5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|22082099003|3023799003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	zDIuNDVooVvntuZ1C7N+PLOvo4p0g2smARugnRyuxd76nni+4Vh+AkL7+f97cw9HsQ3e3hWnEIG8zszG5ngg1qCrvtIK6QLZKWzPyrNTYHn0/ROm1cBEDDKkKPm74z780btItmKPAfGXdaH9VZRPnbaTWNmXuy56TtmbSyvBHSEcUGoaXwR2oyrEP8mTJdFcGKpPjHDrxxvBah5PWW5NCrFwUPfsPb23JMVnEaYP/LObzPQ42qStN6fpc7T4ACaE9Yu4V5Pd/8+SN0vODrqfEW/nq0v7R0cd39cygiVImBh5Man9RsS+gebtVbx7P+vKKJCV/hKRpvr9AmRXced+UP6dP0d6ThoML1sz/8Vabtaz9kLipk3odk/tfn7wM5uaPvgbPklBiep1VG04DbaehbQW673XxDSqj77hvaoZ1w+Md8Plhvzr3r62nBzvxSuwdDwIisi2ANQ2HPh9lwQxS3XlATuYqgL+BIdvsZbTy6vd4IpyveZtebibc5z4VfXQujPjPqISQ2eoCl/cezB4SkZda9yi3fLDS7xpjTTLNuk5xLlXyTcdIcYpkDz31ZXKZ5pmlZZ8BwejoJPvssvntHvV75BsRPuzGo4eOzuly11OnFYzYj1g5Xh3SpCs+SsrEhKzug8pLS2Erj3XILE+3VdHFMqZasvaVSBaUZxjKcZb/7M+EL/kdwj084VBnNozUCtqD3HgLqynDdhWZEXVlDfW7HWGdg7Vf8YwkmDuIkFE6uoyo2CXr/pyyjVDZuMW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(22082099003)(3023799003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sXnOEnb5CW6YO+h0Z8ATvfXjmhWwvEs0fjylYP0QxR0f1vdGwN+3tP46mDJt?=
 =?us-ascii?Q?XQ4XD+eTkhYuwFN85HRnlo6gi6toVmNpsnp6a8n2nhbnOgicHFXecaIEVB6l?=
 =?us-ascii?Q?EGYGXIQUH7t6LDDSFjVbvfw0py4948U0rPGNKdFbZF/V8JRIQx0/lkjd9dcG?=
 =?us-ascii?Q?t94HmvbNTl2uQJwcLsJcd6XDIvamXC3p0Q53wM1sCAYx74EHUUeRpldMB1iB?=
 =?us-ascii?Q?Uy7+0eLd3Ri2mwGWMRX1gdRnMhftrNoupb8SYrMcbAoeg8SI+pxs/ZADv6ac?=
 =?us-ascii?Q?8SbNi0z84MAGEDQ5sRsBLT1OtDh7mRq+HrqlzJdbJCicB/aVZeXrKY/pN+rj?=
 =?us-ascii?Q?Qd3rH73R74iB95TkkCdLBfpml7slT7KFWhjsxuxmehGS3C/127PdQkTWR3QI?=
 =?us-ascii?Q?aOL1N1gd3iGY637ulljn27RBsch3tR0eCsf6cfHsZlpWWVWtjjFs96mJ0T0V?=
 =?us-ascii?Q?duvmeWfJSFCpBvVTlwjO4Dfk7ahPhPAvLb7ZpVFpVkswnJ3c1nHY/XAHSOg4?=
 =?us-ascii?Q?5CjZNKciDYLhMnp6PTqpFagCnUIriWgPteoTT+/TgNh1IlI4QD/JuwlhSNY+?=
 =?us-ascii?Q?8inkCxMSz7KMqfE1c1zriPwMZXtoZGpjmmD5tpGb9WAJsEB84XyB58OgICFD?=
 =?us-ascii?Q?bJteBanHNa8MweRrMwKScsgZtzkBkBUdKyjqPgmN5pVhMVfpkgTSBCWOegCX?=
 =?us-ascii?Q?owQ3TFo0ConqXgIMGKxXMpYhyAHer1CwjW1i7HXxc9pf9rl9ZNmkCd/OxSHt?=
 =?us-ascii?Q?jcc9h3OZtKSCWOBROa7ImotSsEiACThbI6+1+3zjesrd25nhRq+n/pS4tPz3?=
 =?us-ascii?Q?nMKRYFWjorBHAWYnx1/2BorFJGAZuozaWx2HFojcy8At8rxQ8e6peqrG9QVI?=
 =?us-ascii?Q?4Msr/ObxGNKDTPxOFsroxJfGGLxoLYL3aFYhAJMIxhNzulRujbjq5k7Mr7MR?=
 =?us-ascii?Q?S1Xw4jRuCfQE/7xWZesIHKYzhkEXSgqkwUCdMxPfM3ushs+yRE8RDU+bSqZe?=
 =?us-ascii?Q?We5tgulxaVPVMjRtHWziUZK9cktCKlInWft9t1C1SBpoKuZ17+xRvG54XRnO?=
 =?us-ascii?Q?JxXz7S/qZKYzLVYXgutqhyGF7sgG+IiKkoaf1Hj2NVwx2fcycclS77K6XePK?=
 =?us-ascii?Q?8hU0q4hx2F9pUEoL4sz0a3wurq4i6ZF+XfcrZpeeU6glXQeUK/4QP+nQgjB2?=
 =?us-ascii?Q?bj2bz5XPWP48/C8SXzBNkRL7KajbUks9zsLhvZCLEVcrmwI92Kt9+EJtke6o?=
 =?us-ascii?Q?TbRjryNQJQNlZKiYO0kRkjQBolT42hlkzaRbCbaDECbv/lFtdTTg3FsKLvUW?=
 =?us-ascii?Q?CkWerJGom8OumRRexD+nOgKkCmosRSjXBYNvXtyZN538CecNzYEZhW77ey6r?=
 =?us-ascii?Q?/o6UHql1BMAnzQG6EqsBgNofWPjW2GeOnzgedaL9xlzvkvCH51vyhMXP67pr?=
 =?us-ascii?Q?ahkjWqeLXZeCAm6mtIJGeveZ9wwSNMt7UuOV2LVCnUN9TTbsSL6YyabVy7SH?=
 =?us-ascii?Q?dW4PmB4DJbXCPBx3JVj3vjeexbgvnd05WFWWlggnePTz0SseIW55Al6hQqV6?=
 =?us-ascii?Q?mB1hB89wfsr2EMSETqgWeEOlxc/F04KU18cOc0136lNjtBtPGL2FxFty/6+B?=
 =?us-ascii?Q?VmE16upX5eNT1QoMDjVeSicxmjJapcCVU6DZ7lznNwGqfZCapxGCnEr6FtgS?=
 =?us-ascii?Q?BH1mp6vl/bm88+dlgdNXuQHh7XT1ihRn9SApRDEtS1MjoU3d1XNWbaPkGQh6?=
 =?us-ascii?Q?nI7qsb1bwg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	PNLLHY8yMucxarplb/yfdHzkRp0lr3T+loG0DmfprhYjFs6VuIlFris1p+ZTPy8R4nw5lfjBkehAi3mwDYnRjr+GI1gbmZTNTo8BDbsvq5+mPz7gL9VNMgxa5I7Iw6TnIJ0WxhA4H0Q3xzok1Sag9undv5ObBDhUN43YK3F43KBqdTYFqljDg5dbZpnMk5hINLS5Kj+MIiHiSyTmBWRsu98PqN/r/nNZXr5EDjixA3rA8L618JczMHdmcWTYZzgjvf6wIB+X10gV5r1vfaf6UcZc/dHtCZkdjVTKEd3HjcBQrcCXaSWO3t8w1VqkV+GSrOsNNDxYXP6NJEL4zk+3zg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c75b9b0-5389-4257-9a1e-08deb0afd5af
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:23:58.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJN1wqq1vD8/9W+dOfPYFcSXdtE1FF9jgzCR7YMvlXiCpUEIrWxT0Oujc5yJ77eNLLGxL7JpEnBHU7g2e9VMjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfX1bfnjGS8AZGu
 fbeEbhozb851N15hjitdoewB+tXyHm5natJND3iZzDNvqj4OZuCtm3+GDhAyklB8O/GGeArJvlV
 MhbBbtAkWF6Yi6UDINsGOviPu3hcBwhgqu6DAuxrDu095lFcEc6zZh2JHE23HHXu5se5EP6Pc02
 Se089SQXVoblvcn41CkNYA/2ig6uV+IueQQ6a9Ri2R1g2RwYqJIkkjARTnSe75tHu3P29lDha3T
 Yno6UO9qoinEqoLJ9Fnn55/4bjmMWkT/MBd1M81yGRopgfX6Owg9iKs8af4dQhXCgab0ElZGAjF
 l4a8Z6Pcd7gxZj8dkbT1LRqffOPIo1l7fkbsoG9+Sn2Aoj6IvJwLftiX/UWQPowWG59Ri+/nbEk
 aRxBgn9MkFN7oHoq6UsXtSAu5rnCjZrneaOKN4iXOcEkbVn6E8bkrPyt1bZTyA1PefnzeLpQOoZ
 YHposttasVQ+nLf6cOw==
X-Proofpoint-ORIG-GUID: ockDMfEWn-IvrQu48mP65Kc-her4K70n
X-Proofpoint-GUID: dUuF8n6nzEsnF5TY1PPE2l3odXErbpzJ
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a040af1 cx=c_pps
 a=E1AkXC+xFF28g4y6WI75Xg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=TIlOCVwuG6zFfn-mFGAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236923

From: Chen Qi <Qi.Chen@windriver.com>

Upgrades like 259 -> 259.1 or 259.1 -> 259.2 are stable upgrades
for systemd.

* Evidence

  Its repo[1] has remote branches like:
    origin/v256-stable
    origin/v257-stable
    origin/v258-stable
    origin/v259-stable
    origin/v260-stable

[1] https://github.com/systemd/systemd.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..e63dde3af9 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,6 +19,9 @@ SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
+inherit upstream-stable-release-point
+STABLE_VERSION_PARTS = "1"
+
 CVE_PRODUCT = "systemd"
 
 CVE_STATUS[CVE-2019-3815] = "not-applicable-platform: only applied to RHEL"
-- 
2.34.1


