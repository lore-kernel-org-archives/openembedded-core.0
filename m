Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B6BC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 02:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12929.1752634394534666568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 19:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292a11c7f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G1vDLe1115344
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 19:53:14 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0sdjg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 19:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ1XKVp0W0djX/8w/SHZd6sEXC+NLC97ZW/KnF+dEHGJsAYTFZv8ynaMKJzz5YNgEOFT8+AlevJa8zRGru2gil5Dh03SDSPKfxQ58/5lpDdlaY+IOKlGH+MJQI9Euj37b/2hEzQINXV+4XTY544IpmqKEZF6COpV98E+Kx+YObpjlmChGOM3vx3JPInvaCuXDEzB1+k5pA2H7cfL1JQfpUOxtIVHkI0oZlJ9Gh6ist6/p+1ViKCa/dwVSAYokXZIhgegieOGCP9MqYzvNHL3It41/fbPS2R1ZDMHfO5714w3NcehJ+XY1VCS774D2WI6YUQns5v9aKCEPVyFs8AMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/g9z7x0w9vqD1k5VB/19qFDYXe7yJUCfLmTm9Cy5sg=;
 b=AdMjL3zD/L5v1WoFgJPrVNFlp8BGb9aUHJDr/r4kk/rxT8dDswyQqcsYfw/Zf4eyoXoElSrcy2Dg8OL3c30177gdgDI2m8jwvmUscm5qRUyozBN8j5JB1OMPAsQnlbZXNS33TOzZIXtCA1P/s3YSYtgag8soqZz7yK6uP94f/zC2ATIp1cP3Oxd0KAEVe7yXrjM0/fRMZwnaA9roJuOpgjOj1LSItpopsYrIFrU6tj7aoY60nE14isv0Ykek0VsZbURY3BhT4OK468u7IKim334KYuMv1votPq37Hp4dI/RFCR7V6NHTXVBsbdSwBEmz94MGSxkSfJCmLgY4BOtUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 02:53:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 02:53:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: remove 'serial-getty-generator' PACKAGECONFIG
Date: Tue, 15 Jul 2025 19:52:58 -0700
Message-ID: <20250716025258.738590-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bca8017-f106-4a93-7cbc-08ddc413e621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gt/2OpTMzrN/vCTMmZn7hYnS3ojEX67wZydvwnlEnmI/04TSVgZPoImUA3dJ?=
 =?us-ascii?Q?DJ2szSbcdaOvJpgRnbAY9bwaJm3YDH8Ef+UEsfNJdC/pAn0ikDdA7n3O1KUK?=
 =?us-ascii?Q?h6YHCLu58dqzspjcDkhwz5dgJQVZ1IAMqe/4eUvUjTLZEId5E86t2H6EV8vA?=
 =?us-ascii?Q?obxH/BSP5su4rEae3G1qQHNsUcuQ6acCnTNRd2CfKff0N4jfqkGqNKGAL8KI?=
 =?us-ascii?Q?SfuLVLNbx3ON+RHfHPMJ2/wDdEnFjvczSVpah1Z8FW8HqCYvxvV+NyDI0V8O?=
 =?us-ascii?Q?FrHVY+Zyf2jwJ89Mh8ttWWraLE74HBu2GiuIigkoB4b1OkLxvTRau10lQLD5?=
 =?us-ascii?Q?3sz0zJKSqin/GdHKARw2sAIzi4ZNKf+832IeTbzpINgEMkaUm5UycMiB9fzf?=
 =?us-ascii?Q?0neRyKUnZLj7IpAIBcVvgXuAY9z8HeotrKlJorfQ5mYjaY8r5pGAzQ4ivlb4?=
 =?us-ascii?Q?0XrFd9i0yu1OKWRSRobVgBcuFSn/0nHPywtpKdBRmrhAPJTN8pYe0oPaXS7o?=
 =?us-ascii?Q?ZOkbeCoBTt+KfxaYcEcmlcHEa9Du0x3TmgxiBDn0na9UeoezZxnJg1oEBO1u?=
 =?us-ascii?Q?sGPMo/0mpiBE25ggWI0Ua7c1ItPOcvfkh1jJJ3IQOlDt94cEFUmctJvPJwpe?=
 =?us-ascii?Q?bwxYzovRwkIa3mnTtn2Kb3JolUqtcKsKSWNOuuRXIWKm6ycsdFZsoYOWPpKs?=
 =?us-ascii?Q?vYJt0vivTC4NhJyeSl5moMw1XsUDq9zheASYRnTzv2Q3kA0nezqnbZq+1VSc?=
 =?us-ascii?Q?zQlvlUzj2OuwwmUrdefwZlDrU5WCicDyiydWTwrGmixAidoiExSQo5qaAb5y?=
 =?us-ascii?Q?SnfpfwDmZBKeSIv+2YoRSIe9ml7+goBLMF+0hiQQddpc8CO1grMp7neLOgp8?=
 =?us-ascii?Q?noRyOBBqbQbj6TUZitKttjVAAewThIThlB7ktqYzvZRb6SrYVwJoYYWRfswL?=
 =?us-ascii?Q?2Ap02X0T1mhjuxkYjtN4rtFbrUdKVUbseK/JPHQ8FXdPTJPsm454HREOfva0?=
 =?us-ascii?Q?Y3Jjz1f0YWWi57Yu2UwScYWXl+IJ3SMunm2owwh5rs03wC/Qno2McbSduwIy?=
 =?us-ascii?Q?PmP/aXYB5CsnBZ80yckdAZuPwM/CD91yI56B2G2DDpVSEMbeeZAG9GRF3CAl?=
 =?us-ascii?Q?oYfKWUnm/f9QY7nYDKYgk95dm+ME2xBR5DS1LORBa+qOXX+Sh4DsujtHyIkZ?=
 =?us-ascii?Q?rUBZtynyb26XzoztTAcMkfEEsA1/kOu14nk2hnyeE+HblsZRiHWwGmeZ8Dge?=
 =?us-ascii?Q?uMfpB9ZAfQyXBiQYQrQUjMMx/8sDQ2Mf7kTLVMpBrOD3xih7NqC42MAE0Y7F?=
 =?us-ascii?Q?s2eUVC8hSTxlccVTU0OhPtrVdFp/VOsItep9Y84uL8C71yo8trvOf/QiE3RM?=
 =?us-ascii?Q?lzSzfzQShLPVMVqLYBIxEKhZNomhlxZIke9lGaXq3g/QqVI5gOo60qOKkSF8?=
 =?us-ascii?Q?jbp0fiofuSc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5K0q+XhpZ4XRqVvvyNg6Aynj8bQPXlnsXgxDjewQbIpWbWqvVMiVynUK24rT?=
 =?us-ascii?Q?YZD9fyX31iSKm5N33EcaLewIFfp+Jcp1Ww/qwkbakFTQIt3SFOlAIMSnbfMU?=
 =?us-ascii?Q?3EOO+Sn4TySucb3j8X8pfSp8LzVAb0ifpVf0B1udK0SUbEeAuFS73Dzj97oK?=
 =?us-ascii?Q?IqjMwSczB0zGxDg6GoJjN5BHcskVExwb9ksTddCMDifzhUlTVx3NOkz76hDP?=
 =?us-ascii?Q?lP8BSXp3nIB9Sd2zm5haBpIOM7dxX13YnKoc2tjzPwxeggKFHAdMrmJCPnd/?=
 =?us-ascii?Q?dtYld7/Do+juNM/WE/ST1R3EQdSWmD89OwR8dE7sqG6BrwCk8tSBEaEka99n?=
 =?us-ascii?Q?jMjpoN2I9rAw+Z+yjiMu8E56zIL+iCE9DfldnzvIZ0ENoi9be4HaVVg3Qfor?=
 =?us-ascii?Q?Z7UR/65Q7Q9acVHsrTBM7/zp8ALBoZSD+MtnUQZoHPtm2wiMKK0nZ2v6dwik?=
 =?us-ascii?Q?3mYruoLhkqeDlFBDJojxVWqeuL+acPqXxzJgomdttWizuujtEpn4vlhyZNV8?=
 =?us-ascii?Q?70dlKQrvsG67X1+/2qDN8uY5AD0X82xq32K0Qj25gIfR6YklldnRsJToT9OV?=
 =?us-ascii?Q?pvA38VYNNxCuA82O01HIFiBR7wYN8M7RVNnp3QJouB2veY2D+o5tnuMx+p5m?=
 =?us-ascii?Q?a/4/5/44oI5ZRCixGNMtIqHoDvbrLyT76/6y9I4XQ/ItlJyVMaFB66IYGU/e?=
 =?us-ascii?Q?ww17fiLKLcK0EiLgM7CXINbYdURKruaFMN1xRT9sssUziye/saqBPS1SeVPL?=
 =?us-ascii?Q?NAxj9kkm1Pvyr0Osn3J7bGn2gCXHgWHcr8wwdkOLNUrlFNM9iDwtMJk8g0dY?=
 =?us-ascii?Q?Jpv44rmLjVONV4Zefh//mFWzzMXBW9U7fgZI6yR7ZlnytoEv9qAFTygy48Ig?=
 =?us-ascii?Q?rMna+MkRdHWPdiosNkMMOvmAPwYL8rwf+yp8IpfTwLsayy2wEQLbDyznFdV9?=
 =?us-ascii?Q?WVd6QJhb8Ktz+B20XRPcmH2enr4q1CAhoq5xq7D3v/NpBGOepyF5BKHX1wa8?=
 =?us-ascii?Q?4FOMnEQZGJuh1RmXZk9DyZO5EnLAYlYF0LW1EO2AalLRyJ+lJ9H8AtKiT+me?=
 =?us-ascii?Q?EeGUANDFHoDKUXz3LasmiXCiOHJ0hbK63jwFFKCxnui3M3W3qGjQRzeSBB9Q?=
 =?us-ascii?Q?6invzIFWYsvlRmzm/GrtLtG1u8Aa+fRx4aJYpraHY/fnc0ckxbB9RjDTn+HN?=
 =?us-ascii?Q?MFy2JqmCEVVdmPMjfBEBuiTBrbVZXsPNB+AKjawgBWAzU9KYIfHzi0rErQxK?=
 =?us-ascii?Q?b5jmWb0kOwLGDcU0nHIcq67d8dHeJvNfiar7AednyquzbIv9FdbOyS5wrWKS?=
 =?us-ascii?Q?DGMYkjPhVRNIL2S2rtro4/Xg+FO9fRM9eJre89Ok1pLYqTtFJHfFcNckiHjj?=
 =?us-ascii?Q?EITUsmaMJ0T5lK6oPMNBD3owUD97NjbN4dxBVM8dML6baOx45qFuSiPiF8WA?=
 =?us-ascii?Q?4tnlYYPxnhWyYHAnPCQyynamWepT/VFCxwK0twNhSEd3f5LNEb3Gp1Baqms3?=
 =?us-ascii?Q?TKndoFi53plx7ioEXy8hTGDSURhwzXkrdE/m39Lufj/SyQLcYbK2oTxJ0OFu?=
 =?us-ascii?Q?/nSk7ce/JpV4eryvVQV+SBgnRC0Zk214IbcJHQ4AV8OApbfsgMdDNmBEFy6A?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bca8017-f106-4a93-7cbc-08ddc413e621
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 02:53:10.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqpmQXnbTtgd1lRD81oQLSr9Xp6j8wqfxPAMbcCd0e28d+FialdcmPBk+YURvhXuF+/uW4/H+rd9kaKArWJcUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-Proofpoint-ORIG-GUID: lUoD6k1yuDk2l4OyuLY4s6G73FCZAeDl
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68771419 cx=c_pps
 a=MeJw8Nb+dw95+su7xs73xA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=q1RkSzT7k_u-ol9PYDMA:9 a=-F0DAKMyZqAA:10
 a=7aRqS6lzTfIA:10 a=YaWxdbyzcwAA:10 a=xvG5tWAGjjQA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXzHYPngMDNbpn
 eUO2iyUX6HUVJbtbdd9R1WNOg0z4EyG4BddmU6UKInAaxJbqoQyJ6BvfJdHdMNYOkr2m8nHSvg3
 UCCGFp1mVV0GPHg3Lnjeof0mSmjCJD3UUPDjD96IgYHIVKnrMZcGBHRYzUezH/eIxR1Q+HDMa3A
 Fjn1NEd0qykzWJpaiMtnxkX/FqocG16zHokCyGNhVwohnRfTQ0GkuK72ECi437NF/x1N6iVuCkR
 /TivjKvGBpdE6b2zTLi/4Qm4+40K6Quz/SKMKkL/QJ2gdKA1borppTDs9l8KcKQmak+ILBI5u8O
 Z5QZsKBJHJ48GR8lYQ47qouLl4/nWnIxXZZ/S83aOFRxG8II+8Ji6hBmmN/t097pQhdGHc2LUS3
 z1etxCXB
X-Proofpoint-GUID: lUoD6k1yuDk2l4OyuLY4s6G73FCZAeDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 02:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220432

From: Chen Qi <Qi.Chen@windriver.com>

This PACKAGECONFIG's net effect is to delete systemd-getty-generator
when not enabled. But deleting systemd-getty-generator really does not
have any benefit. Here are the reasons:
1) The units installed by systemd-serialgetty.bb have higher priority than
   the generated one. Because .../generator/ directory has lower priority
   than the system admin directory /etc. See [2] for more details.
2) The generator could be disabled via kernel command line "systemd.getty_auto=".
   See [1] for more details.

[1] https://www.freedesktop.org/software/systemd/man/latest/systemd-getty-generator.html
[2] https://www.freedesktop.org/software/systemd/man/latest/systemd.generator.html#

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index 9092d02c51..f1064f07c5 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -92,7 +92,6 @@ PACKAGECONFIG ??= " \
     quotacheck \
     randomseed \
     resolved \
-    serial-getty-generator \
     set-time-epoch \
     sysusers \
     timedated \
@@ -125,11 +124,6 @@ TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
 # Some of the dependencies are weak-style recommends - if not available at runtime,
 # systemd won't fail but the library-related feature will be skipped with a warning.
 
-# Use the upstream systemd serial-getty@.service and rely on
-# systemd-getty-generator instead of using the OE-core specific
-# systemd-serialgetty.bb - not enabled by default.
-PACKAGECONFIG[serial-getty-generator] = ""
-
 PACKAGECONFIG[acl] = "-Dacl=enabled,-Dacl=disabled,acl"
 PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
 PACKAGECONFIG[apparmor] = "-Dapparmor=enabled,-Dapparmor=disabled,apparmor"
@@ -290,12 +284,6 @@ do_install() {
 	fi
 	install -d ${D}/${base_sbindir}
 
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'true', 'false', d)}; then
-		# Remove the serial-getty generator and instead use explicit services
-		# created by the systemd-serialgetty recipe
-		find ${D} -name \*getty-generator\* -delete
-	fi
-
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${nonarch_libdir}/systemd/systemd ${D}/init
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${nonarch_libdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
-- 
2.49.0


