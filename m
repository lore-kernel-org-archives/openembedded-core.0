Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5E9CD484C
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67453.1778556406014040548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=muflgmYV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BNj2GW3069377
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:26:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=; b=
	muflgmYVqeSwdIPcmxlYXFI3IozL3uL/fpF47QSOWsOw1xQM191qwXWKsoVHgRuh
	JlLP0gc2uSEdnamc46CohCWAJQ4FphvL38SECSFFSkiz7a8o3HRSKP4j4DzkTPVH
	gL1QgUuaz1mAHnS7dkPRJeDBc8pvxjlgNBRtCqGZmSVrEnMpK7hNQuIoky5SbByr
	aAIHyBVmwVUJZBe5y78ZAjBw/wT/bXHFaL8L+QOxdbjpydtr7NsLce05Q8ke15LR
	wwkGm3+JUmoskjahlqVB/0x1f2FVnXy8Hvy/Jxi2NHNik6FL2V/zQThEbErtTP+w
	Skj9jPZK38kyGU9w/lGkcw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvg0cb4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 20:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loYKfJTjVaKtxBppAjNATqlcvxqv5xN3D7sc3gY/TlAsgGZszQTTLVApc6GiUGRXVBIuBppx76cltt2iMJi/43dzRfJwEttsI+0L7lmp6qYQMtc/QceU8CNm9RWz1fC5316YS/0SYXFGV8cZwj2gUTKNpmuvZhP8020i6q/PiSQmMfQF/DHvyZ451ANk/LySH/exFZJn+WZdNhqAVMM7G+pzLhWR8fTg5UymQtqg++vZqC+NI08buHUB8Qu/jMCwzB276JuT9Z/cEftJsPm9RTUA88L2tGowtpoc5jXXpta3kRvmii6Rsx4QzeWg15Qe/v0BUf3F/5qqJTX+OuwL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=;
 b=ZZnpJS6bMR4liXDsFeYcCNpP1aYcOkx5RUkx1M2tMRqAyBc5OpO9N9tYreF3VTUI6Ga0DLGgC+1glskqjMwhoFJBUukP06mn0cQh/qKyqojMBpvejvESINV+k3sLD4Y81pw2pSp9lyxSrCqT7/tci3W5/rIvFoaorUNkUvHpIP4NUb62uVdd/ukKjesTqIrMBrw9we8YgTGNfv3hm/mBGDluU0gzboM6xMuoUS5HkEVGKvndSuUsDBPhMNV62YrlXakhORyYTh77qCu7aMS4F3ik4NaSOy9i3Ufs46qVAfyl4dBL1mMRNcZOjFU+ZLhnS6fsvam8xEmBDiNtlaJN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:42 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 6/7] util-linux: inherit upstream-stable-release-point
Date: Tue, 12 May 2026 11:26:13 +0800
Message-Id: <20260512032614.2814369-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512032614.2814369-1-Qi.Chen@windriver.com>
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ec239a-3854-4f47-e79a-08deafd648e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nNaaEdr6JOuKiNEO3vZC1LIwXdxEsMIM02683mpsedKqVyx4ZX4QshMBOHm6Ubgo4GgLNeLGB4DK3XPyDvIxUcbNpAaiborpxGyeJjOqTe/qoCRILfcoQzd8fDp4let+plHS1eAByq+UtyeyjApYNaDNz3AsvSjv3Id3ZvJlZNPDssl1CznBNCTKVbBrWZNVVg3BrjMcO1ZiozNNDLVPz2jXWr9PpbV7+h5/0S/ZUGZXLu6YLBx/kZGCYPQuNObRAUFuXUdshxyqM2RpvaN/wkUvKVRJUqVzBOxYDQENme8+qOSbZx/zg0eA//rReBKQUPq7BbWaich8hZCuh92NCN2eDscx1bf1IeFEShDAUVwDqI6/NwZ/7frlbtLsro9j2OWqA2DBo0ysQauR3QCv4DmqHQ6rIodvzGaRKi8WJiC2PKd43r/Rax2sZj7nF91iL2O4NIr67fFCFjY9K6XD2aUpRPF/yGPywtLYgQkXbFU4ElfgXbJnCGqJ2+ye4RTC6sZ8OOPd0HGO1Zfg1USEjq0o+lcoSiXzMjpnQOXb50ycipyt0aQuq8vgdMlRHbewtHCxfP4Y1i2nUicswGKYirzl0GtlLaMFKlqL1DulcVFq7h1LOmBydJxuOyDN2VdaYN9Omb3QPM3YYSLuh0JiSpkfjj7teKB4hlv0rVvT6xA3UhKVpp2gYDYJwGHtcfpa862N1WnvNBMxE6rGc8zvBFxVOvLW4++KCErPMUFWpMKQRPDWLYmWjQtCR4YRiCr1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?je/Kc4D1dGCwF5N/ZA8r9mA1KKJfQ+bcVyfyjafosPVzVoMx0ps+oqPUzmvn?=
 =?us-ascii?Q?ks7BHuQ+BGyKCO6NaARaQGYZ8Xyvh6pYC/14sBlH4UVN81lqJ+BE4Y6MCDsh?=
 =?us-ascii?Q?PVE/6wMmnSlQqlGK3qdOqWMU6JWJSNRcn5RpXOgTu8GBKDIAVw7rFt9OVUPR?=
 =?us-ascii?Q?eAmloOFYFrIwktbeE2nh+xZZasOKo7Ddiz1i3WGvmdsgXkMzYj0l3F7JV0vF?=
 =?us-ascii?Q?A063WXonAMe7XQN9lTXrweUB3EqHFs1+mBTWQYC8hEWRX3RC5ejsXG6cWWgu?=
 =?us-ascii?Q?NCm8ZQbwGRg+JLR+AA8uMUE5dPKiUvWZrTbuI1W0IQFYMEzQvs3cWA5RMttE?=
 =?us-ascii?Q?g1/apSFd8Q0vPqnq7ZPrXTC+TdAKAzITVKpMhW+IV/EgYvRMntBvN8txYoo3?=
 =?us-ascii?Q?lv8+BRTfWMvIUOYDD3TKuIS0R53WAH8hmoZ4JSLrH1SuSpphwlqXdhtxqyUx?=
 =?us-ascii?Q?RYRCZxtWtafdwJxCl6+vysfPh532L6T4kqz5iEMel68742K/91AEJo55roXH?=
 =?us-ascii?Q?z+caQseOWkLQTcouJU3FmiGDsi7wD82geHJRxV6UL7agvknljgxB8kwFlWAc?=
 =?us-ascii?Q?J7mpaGImgx3uOSY4pXkE6Ditsx/wR9wbCKr2p3I+bR4cx94DE5ch1XTUat6m?=
 =?us-ascii?Q?INKv3ZZj6Gd3KpyrYc3QC42inJlG4k/sGbohCNa3KOngbzA/uUK2UPDl/96Y?=
 =?us-ascii?Q?mC2K8m6B6K+4KfxDIX+zmxNASDfVu+mXgwPHzGSBCTdIHibAg6mql+KlAKkU?=
 =?us-ascii?Q?LN7KKR89DaZWFF+DQtuQi5kxU7ca/9PFndzHqkit7x0rdxszstU+iOUI6mMx?=
 =?us-ascii?Q?Vv7zwgLoYo0wt8rcuEKNH8Av+7m+D+3nxTUac/3OGN1ooprwUZrMOea2HWH9?=
 =?us-ascii?Q?DdtVregPxQfuyp1O7hm5c3Yu6ZYoBUqc9zla2c3cCeKP+D4MIK7d5rvDiB7s?=
 =?us-ascii?Q?cTVEiGkm4Z6EdqSjzpN+kQKamN13pnz25uhwnb/FvV1eM+YHarrw05RB9OMw?=
 =?us-ascii?Q?ROH/3jLyAAYdImUNLi5WaqCNlPfBo8bOAoCLHfPbt66qmRFI+YFWdGvxE3os?=
 =?us-ascii?Q?qXWPZp0aJpvj26Sw3q8ORaCiApfpdzyY4IJY7yPXMBz7L7NXufaUVd+PeTEZ?=
 =?us-ascii?Q?7VbkeIMAamuEnRueDmBVLQxDHM0V9u3jVrU/MKo51C5o9LwM9iiuGPyBrenE?=
 =?us-ascii?Q?fZ97mapjgFNcfHwSGAzD1gcvu8wA2FrbuI6lu3hFdiq225GzOcn3AaxkmSut?=
 =?us-ascii?Q?W9yBkavt8+mD1hLH0rpYbX4uhvUzAX4J8Yn5ER+QU3+OP5uX5C467pX/sqpG?=
 =?us-ascii?Q?mjQzCRCEkgZJVhdm1AUvOhHIbyjf/Umyqn7G71yPEz9fXIodLIM758/2Qcrr?=
 =?us-ascii?Q?2LtFk5M14/mXRmGDA/HGrFMMyFxAolkHB6nRu0WTtqP9telaJf64iounxpaW?=
 =?us-ascii?Q?9YAM+C2zx9rMAHSh2I4wUw5oUqj0PtmaCqif91JiBzQiq3C1GuEire+GVgSQ?=
 =?us-ascii?Q?XuFkhWbFMTOjcYyimsukur3DMRv4dL1LMY5ROGK/zHXMpZ7hmT/MQmvvAV/k?=
 =?us-ascii?Q?f5VGvpuKpvmlOd+HzgWdD1JzeNikm2fxi0s10tUpZfjkbg58+s8oQgZz1Qk+?=
 =?us-ascii?Q?LglWh0+eAYNImu+rHRtqKUavAeQ5OvtOsrd+K4vy/ll1s0nJm6v2vy9b/QdK?=
 =?us-ascii?Q?pbJ2SiBTQOd9K2NnAWJAKcnwEid1Aj1jnwg0Xh85clZzlztBXUdSHeI+VslI?=
 =?us-ascii?Q?/0wtOco+qw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	gAbk8s7OuIhSK7VARy+S4g/rYlKXf7gtuJrUUDC2wU70U6gJri0ex0p3cU0ZWXEo6YHxLpjLOfNZHRxmq0o5W0XLFCOK72UGXy5SpykGppnCUfE0XxT8h8u3NpwBXp82IA90xGa5qaNthMHssunhcd8pGM7iHjZwiibp6jNCoRX5AK7L7c8KZjlHDn0+GlqbmRpG0Z1F3SBngqTjcxjisnyqvDCjRdG4ymEwNIfpfdN4c/gebqWEC8Pse8sia+ETd4lHSKUyXOsPTtliDJKJGUy0I/U70HU7kIEyepZlVO2MXtlYCesLiMoL9VFSOm6Ad34iYzBUhkgNQTS4cB6wvg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ec239a-3854-4f47-e79a-08deafd648e0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:42.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHkaO3BFOwNmahTdgEjetcbpCtYSbo8weU6J2lHvNd0i1IoyWOXOazftMVB2Sx1XE5iCLNC2pPHGrKQA3Mi4Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SYDHsPRu c=1 sm=1 tr=0 ts=6a029df5 cx=c_pps
 a=/dw4gKU6pt/qT5+OabM4uA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pmzwAjFSpYc_cExjFc4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ItcKFJ_BgIZFDmGvQ7wzwnYYXkWphfIG
X-Proofpoint-ORIG-GUID: SpN_X83RpfmBa_LN0UT6kw8G0oWsRf7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfXwk5o0J9aZ2h7
 jL3Go03pS2UkxHe0vlGDIsHKBKgYr7JicpL+gu9s6XhCu8uu6e5aWsBNHO4O89DyIxKZGA2mrX6
 1FvbSH4BUMgAt8E3x1gxPQ6RZnLpeyYDgF/8VBMstOhjaaEo2fgNxfDVqQpVIhph2CIR5CTbeBJ
 eCXOrXHm5v03ksr8lm31vfasDSNKfUfPWYNKuuNJTosIe41MxEL6KWg497UwQ8/3UvI1g1sRc4G
 +sk/uIRrNjSGbrRZU51780HrxxmSqu+r1tT9P3TFtge+1hlxl8kmO3n93VArAGDjYWin964slam
 h97UN1+7e/84ft49RP0XhzC38WaZqYAmvyIH6GHMCAdp1u1NHzy0KL2hfn8KXcTRG6/saSt8eIu
 z12ap3Gepm8plaUFaLwjozCn+cRjkuv6Q1yaXMpdpq79iWYgFw8zZPTb0sA8Vzcufh8scMyiJu7
 Etmx9pJP+S2LLvXr/NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236849

From: Chen Qi <Qi.Chen@windriver.com>

util-linux has x.y.z version scheme and the bump in z is a stable
version upgrade. For example, 2.41.1 -> 2.41.2 is a stable version
upgrade.

* Evidence

  Its repo[1] contains branches like:
    origin/stable/v2.39
    origin/stable/v2.40
    origin/stable/v2.41

[1] https://github.com/util-linux/util-linux.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..1068e24b76 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,4 +25,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "util-linux"
-- 
2.34.1


