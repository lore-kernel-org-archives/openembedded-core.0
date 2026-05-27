Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25380CD6E47
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20553.1779888940269471890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=akcmoEKx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8i3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=m/AU0VWUtvMgc3rauzOyX/qP24ZAY0diJ5rRJqALl/8=; b=
	akcmoEKxaj2MEhAtC2fj0BtCqTnqFS+DN6sSBQWJHbi/M4n2q0zv42lw2MSPxBak
	UFWaA3j4PutCE5Zji0i1ioRcTJ3f4RV/LVvO6XO34iZHO6Qyk9Ju2YGqrjECLGfA
	uus+XQUvwH3OOtqm7iDViRD3eaRywCq2pAlspCR4pcSXsPg8Gqz/B96bI3KFkBMF
	obEJWqzXyZVdQW8ZbTgP9Cx/RfIJvPQHARrT63OAQ5LGdgW7kpLiWybFgOzPBj8s
	GewyN2odkbaeoCkWW3Byp7eeHo/++uS4uP4EWKGKa9UcuomjVyg1ZXeeM5kx464T
	j1x9MR5hmNwwNiIXSfgXwA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrON/WFwWGEru9Ho8SXZNwyiAquoxQ+r3lh24P3OEfoaw4jGfvIGabod+Boat7u07fQfu5ctWCBz3AfBA0XjubxlipmZebMmjdZihllyjf5ZRLf1aBs92JIEXcv8NxDc0smvzUkR+Jw3UCWO3kViXbzhYi2h7VLTJVEcpNdVVEx8NrRQJk9/74CpH+f/3sTXrT9YXAk0c/noe8Qw18LcrhJNfe/JU6WL3/g7oyROrced4omfbfsZN4WPXO8SdhCxUUwMrMjpYA7pZ8k2aIuv+Yaxu9gicH2o7qeAaQqiggLNbqHHWxIqad2mRINE1ETsM7oiNXByAK9BaVd/eJ4ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/AU0VWUtvMgc3rauzOyX/qP24ZAY0diJ5rRJqALl/8=;
 b=Cv75zIhrIQU3fFSpcjoOM5MNFDSV18dYqVjXoCjMkD1lxByEgSthfHdBAvc9geuxwMWcJpIxsHTqYiV+soLrp1vfv3W/dN68TbJnwfZTx0HdHXeclzRYpdpAjQb31zBwukwTQO5GAbFASI7OOUtKLNsBeseCMv7EMsSfPubLm7BvcDD++J/1Gb71js5v0bX0hrYm2F88Ke4JcNFcY4e0p2lpNbcPfrRR0afSCUMZ+ERXtbRm2mB31bN0dJfl/2inWAtGWnPcaJOOFePPQB5xmhrQB9sgI/mEDiUrOGt0rVs9gcf4AQ7DOhFNhUN02vdLETR2Vti8qRC0fBgdbseJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:35 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:35 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 6/7] glibc: disable automatic libatomic linking
Date: Wed, 27 May 2026 06:35:12 -0700
Message-ID: <20260527133516.2337150-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0a22fa-1f77-4234-6a6c-08debbf4d4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|22082099003|38350700014|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	GMoakMERsg8Qf3Q3s6ZMTWXXU+lIorNZQWgnrJ5HF2qOk9YgdoeaPBp2b9DB0Bkxd5MN2fekByfOJz16U1FbeLr3jMvNBnuhvw73aIraQAXenHI4stOSztVhU1/blYnOVmPbp8Ogb7lOn39vcIjyXpPw66yHAEZV6KXu7+OymBlD5L9y7ZEYTdl2IYpDgwnDI71fC3wv4nQeieEByNP5ZGBIwWa2k1s3RGOHpdWPV53f1rWWw7GHmkp0GxUmyWTizxzrpBhNa3zB4t+5BbnodIeSr2L/jB4HxVthDeOD7zYbfENdbzuZ1zjxLYjWf3GGbH44RrOokD0ZzNY+L8g8OmCY7wMTNgr2ts9LaKZn3bxHPzroMUlSkt+Yng1kAIFX0voQzfdtI3YHQpGMbaj4c4e/b8ZjqMoYYMKuE4jjf8fn+1FjOUa1tPw/ygimYsLXsDQn8alnCtSMhaVjKvk4fkVax6FWWkJFAJJwPEr/ldUoFbbx/FzIaVhKWLrrW2ZE4U9jJFZC5TCMrkwzVxN702jdl4M29iSb0dpsOn0ZJDR6fCpIj2xhSJbXfdqZGxRoXXKUyypv7LCV/6ao0BMJL3QhgtC70+AJnyjHoKpeaHvlopLnCkXsxG3/NsWrragom8+aEhrKKZEMcgjvFgYBLzAcjxM1oh6izmaICpFTN6ek/itMYMtM/ELEoC9SfH4o+ef3mXXVmsYA0548XM6/rUDBLc1mu7742tc4UPHYVjBlVArsk/iZ7ItHqru4Yy54
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(22082099003)(38350700014)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rTOxaqlnGfJrPDzTXivzalPrOVtzynBNwTbSxWgMNk9nKkR2HyullJ6RXQhK?=
 =?us-ascii?Q?Z1N9BHLXTN4785d2Y34UHrry2p7l+y5c4rupd2kIUTlaSjAO0cBVG7X905yy?=
 =?us-ascii?Q?iHMv6rjMP5hIlZih4T4USAoeZROGgdNr6c+mb1LlxwX/NomNt59n6Mh//Cgo?=
 =?us-ascii?Q?h5ykYicwGKEGoOmwtKvV6mmJen5aw52j3L7zHscu6PD9mlEQZBQOdv90nSSw?=
 =?us-ascii?Q?xuFaxvftmSyqvw5bxq2b6Ol5gz4wTdDFGKazzsWqtq7bImAmR/ZGSJw4PQQS?=
 =?us-ascii?Q?/uBwKw644UUNXbQf5JQf02aF/P+4lgEkeJ3kzUcNSvcpaRursyiqGF38ajkz?=
 =?us-ascii?Q?A/lUQaO3GrF1ZL8DFT1BcPcUjr3PyeErA88kp8+MfQi1ahmE7vgzhK7q+ePx?=
 =?us-ascii?Q?7m8TH3IYT7B611qiAJVJVagjf2hGX91v6mtZaZqu1k5AYpDhuBNUI4iicju6?=
 =?us-ascii?Q?GkX353cXDb8IzcEJW16cuWoUDc8dWmnf9Fmjwtv8+5k8zhuRkkOxXinzfMy5?=
 =?us-ascii?Q?RHNpCzyXY3wA1gZ21puGcHJcUA+VpcDXti4c46fOOzbLQysNyN5dgbNlqOYw?=
 =?us-ascii?Q?8KBDbKiKUjp6ffHS72rqSf5QYWA5dDm/1o/Z6pLIiavSKrkeZFcEROdMIaUx?=
 =?us-ascii?Q?yQIT6+ZopIXLizJpD0xGKxAsa8xW5KLumZFMQeqE4TDn1DicdwonAC/2D3JB?=
 =?us-ascii?Q?W0i+GcF5eOSUkXugrpz9Tl5rY/q20d8Luo53eKQiehd5eUdCAEavQ1H1NSC6?=
 =?us-ascii?Q?//zKEa2FpgYGo9Cp0CP7G7b+XawQ2+QJKByS+/jdh21LQzyJqEyWSxIlRTkK?=
 =?us-ascii?Q?m1bJ/sQc0fzoFNS7U/J+QM3+SxTynBrvGd2WGIr2b5zz/hJP7usM2elhKXIp?=
 =?us-ascii?Q?5IviAvHxfoVut01C7FaabnsFSy6PphAsjKpbQTi1Q2mffY0y1N2lyKajkfxX?=
 =?us-ascii?Q?ZAXS5yx5S8jYQdiVVTdKNeWfd/7uSirQ23teI+sk2FgqFyeNNXHGO+Hk7EMN?=
 =?us-ascii?Q?/V9EV1LfgM/z65X0m8Y/2Gb2MvWMxXo5041zJmeh1YISA3OJ1sS1oPdFEz2U?=
 =?us-ascii?Q?tPBagsqiZ3aslHDsiU2ikFlSjwcgLJxX98qecFkK5u263JvgcsjFIOGCVSIX?=
 =?us-ascii?Q?HvJjlp0jIN+BhgFtjfBNDH2HZbNvGsOy1mw78K0zH/L2hMpVmLttg9VX8x7z?=
 =?us-ascii?Q?KH+qFAEdEj25ZQ/qUjFpN1n3bHvKAnUFEzTLmAeAhr7Y0OnR6r5aTJJP6eLf?=
 =?us-ascii?Q?NxYG8ecH7dVxDKXfsv6aX8bdRhVrlOqHcmOUpqrJ4nIM9DgUvp7lnnmp1Yol?=
 =?us-ascii?Q?cD/mSh3JFNU7XlL2JYgYOSTy3Qiigv6mshMosSx5apKZ7aFVXrfVF0x7gwmx?=
 =?us-ascii?Q?oIVQtH/gXa33aBb69JQI1JpQFfdBeO+zb2tWvKdrzcU94w5iuWAi9CQRCmLf?=
 =?us-ascii?Q?/dLGmuEn57ftmbaWF0sEHwSq0Xy2ijgl7vFTpWTh0uETg7W9qFMWokdYkw6R?=
 =?us-ascii?Q?5qTGnLf52ZB/I5g7Uw3ZBTwh67fvOhB+5VJSsO7E9JtwPWTV6MzbX1bpFRMD?=
 =?us-ascii?Q?ygyBxUOR3l5i4tSUbPWLv/J4Npd1e6Yy1bjpiMFDh6/m9/4USMNJWBw1xYfa?=
 =?us-ascii?Q?ivveLDg0GjutlV07JS97L0cpkruqsHcGot6Mhb6XlH6jb7GULYfvGERGLXc4?=
 =?us-ascii?Q?TowHRBEmJ4Yv37YaYBMKUR2m47RKEHBnc8gRYzywmRM+WNpChtT9HTuymLZX?=
 =?us-ascii?Q?HmdmORW6UZEEFdRw6XBW/F+f88ilRtk=3D?=
X-Exchange-RoutingPolicyChecked: 
	nZmnwaAEzrYctqssyyalcMs23oit2a6q5HoJZx7DPt8Y9BM04pS/BlW2xEcxhvyMKr4hOkIgADPey/oNqFdvS/O6+NSgh8BvSxoiIuiLYSSb/gJM692mHL6X+LEgcpavVJsga6ftJXh4Mrluf2YDbaKBvJqJWf5JNSZrezYBhLExqgLxA8X3n7MItoSocANYCauz9Jc2jNNERZ/vty7yQF32GlDas5OeUYdnrrp4Iuj3liTHvcja1Vs/4aL5cuKBaFmI/Q03LWIJyq447enU1MDxyEW5e+E7vZNb8WphLTOvm5/fOYJjvl1kXGmmj34WhaQY6gLXgi+eSz7ObFrcwA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0a22fa-1f77-4234-6a6c-08debbf4d4d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:35.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKOxCh7v+QGzZ/lN69AYehHEOpH2I0ozdXhqEXsIOJi+Rt0+FvLAUKhtSBrbxlIe6pBJH4WCHHdEHCzQwP/jKP+LOH9uEVjsXoyyB1chl0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfX+Wyuex6RqW59
 bHgiLf/gCO3LDyK78QdJ3PxqOFz0D9eg03hHQ6fpqDw9Y2Uq82mAQilq/BQWrugpSyt3ml+6ZhG
 j7oDUAEtb42s5+gMMR0XNsMdpBH7Rga1nXUD1dWcYW0v7hrldAZI8Z/IZbncLX1Bmf5ZLcsv3Lg
 BjNvhCSbeIl/QplYYQT3Yqxj8s83bkPoF08OVt9YTYvDoSLdWpLhL7zvVvGBn+ydOxigu8yB+0L
 FAvCUAK0hVRuX+awpqBVfMm9jRj3JIK4kM9XTI6E4NUxCZUKVrouxwOKtsxHUDc7RrpRdsC884K
 hZJGUKfW+cE4QwV5fG1y09HPVTzVsFNx58boXEGP7yv+emFdOaTKAUD6m3WYpevfv3aiD0YRN2g
 otfHzIP9qJIx5t+weAxYE9eBsXSBnvSZ7uDYn3VQGYgp9nIUTpWvGKVHXevFu1bGcR5yOvY6Nmy
 QP/RHhQw+iXXAK5XrnQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f32b cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=qNKf9nYgbAztHspnWj4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vNxB63DEr1nvpooi7yztfsHNnFi_Sa7K
X-Proofpoint-ORIG-GUID: vNxB63DEr1nvpooi7yztfsHNnFi_Sa7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237667

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
When glibc is built with a GCC 16 cross-compiler, the compiler
would attempt to link against libatomic which does not exist yet
at this stage.(libatomic is built later as part of gcc-runtime)

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index dae087d53f..91fabe14a8 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -46,6 +46,9 @@ EXTRA_OEMAKE += "SHELL=/bin/bash"
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE += "KSHELL=/bin/sh"
 
+TARGET_CC_ARCH:toolchain-gcc += "-fno-link-libatomic"
+SDK_CC_ARCH:toolchain-gcc += "-fno-link-libatomic"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-- 
2.49.0


