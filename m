Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2304D116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 04:34:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8938.1764304469049481550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 20:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kYJ0LWOj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3427347a84=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS4T4dE3306752
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mDkI9f4gf3X/5Kl/t/6i
	Tr8oADyAg1KV0i0bX8we1pg=; b=kYJ0LWOj9JxrjjCQycglHcPK7469wo02n9qw
	hcDwNcJUirOLDZEWWMUGfo9wMwfjHBVM0+6YoEv6suubvcDetpbz75Nl6/fZYgHM
	0pVxpvJ/XYZtzwkbrTTwg7jG0yZJeDhXGjxkpXq3qp79AP9RtKLeeVDOmGOStMwz
	fZhH4R9C7w3nd36nnEt7/H8ISnG9wlbDRyJJ8I4lxKvqHKQj3zqIos70u9tDtj9+
	+YifXEtKaMOj4wT0frHcGIjOEX7q5QfIlBr56PqMg8KB/L36VLfTDVJdOHTd/koC
	ci4aZfRSFkWvFtIQbKF4PUahwQtliM4KdTt3BO4KDBtza1XNRA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak455pgvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:34:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTUTyNAiyD0s9UG2XCvW3ePaEhMAKjx7B1e6EWi5tsoppb7jygs9egqC/sCuxGvZo34CA1mx48yTZHJU5YGL4KIyOi9NBqzEzihxz9Ujv7b2mmGlbCCGxz7NSe7mdMtXzxk38MUpkSE7k9wKg5b77o5rVcf7LlSOsrtICMET6PrMNTN89wLsS5RRPWY+nTdTOjxfLgMuKYDelZ9kpP0iR7YGlg1gT3DkWNZZki242lckG7hTCyYVQGeqoLZW28igDeNlGaCUsw1uJIrEVxF/rD6R5Kc5DP6n7W5LUDc4m9WSrCoDhoeOuDfKIs3D0XmFl68VBTIFfU1Pv9UWbq2n6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDkI9f4gf3X/5Kl/t/6iTr8oADyAg1KV0i0bX8we1pg=;
 b=anbk3ysoUQObpMhqGGPlhyZdQO0cvFv4LXUnZIwUWJJH9CbRNzm+auyX2SguOk98vTRM4P1BnvMGt0M73PBiar2l559VeLGX2TifxQ5hlK74KqTICqk/MlsMxqmd1lsOQ9wX+2LJaFgusDKgik0+DnsIWDcWcjX1fjWJDT76fbbbFOrCOzeAb63tL+a7xzHqY15dvJJyNnu+ECVfuy4W9mAulWRAoLVJyoiygtBLB4lWQ1+0KM3INDnlPHyNIvzCakhg+DkKH/iZODAhOa0dh3ZrImznB79trvibWrq0SD8nkMu1gGAoCn9cJAxuOx9D32ain7Zs1WsW+UjfSVkCEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 04:32:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 04:32:42 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH v6 1/3] base-passwd: add clock group
Date: Fri, 28 Nov 2025 12:32:19 +0800
Message-Id: <20251128043221.3603223-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: d0481016-ed2a-4a05-edaf-08de2e372b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T5+DFF/xvXw+fnhuMaRUNkosl1vXNOKZpe2yhjEv0iXGwg5RTlJIPUOcb3hu?=
 =?us-ascii?Q?qLAY1WepLCYmn+9qfCzgrDbjWgEa5T4z+W00rHaGZeQZ6h1mASvbo1uuNqqX?=
 =?us-ascii?Q?i3C/25JF3kXAnE3u1HOCVvGI41GhC04n8jhHod/iYJes2LHV7p/PFWgK4NDW?=
 =?us-ascii?Q?pDvH5bCn9aU1d/Npvs2q/a0rv99WkTpUMUASBU4X4QQC0IsrTTzfmT1Or4CI?=
 =?us-ascii?Q?4H6GBnsNorY2x365bWjC1RmT9RPw6ZexrQsS/7toJKXF/U9A1orKJJJsK/VT?=
 =?us-ascii?Q?dWYL07UuMFAF3dopb6lSNzhvBgWkkPbdkbfOveM8KR7MIZ9PG6BNTxJmgtwS?=
 =?us-ascii?Q?Dt8YmJ/akcxRx9O7sG7B41s9eBFwE3H+Vguy/czJ5cKu7dJ9KglSDqvU8lCI?=
 =?us-ascii?Q?V7yiSdJ/HqNP5XYyDPSsVq0MX41nh8sShdRQMrcv2JasJliUNJ8Ky7dLdgTl?=
 =?us-ascii?Q?zJDcuBmt9jUGU9UfQrlKDDr/iBwiJ96skdNRA35pLiQFaILpXnQL4hXNoZpt?=
 =?us-ascii?Q?9p48bhesqwEZS3oSZs1izSMKeMo23CPZRsV8Sls+TsJDByALdhHtVygf83FM?=
 =?us-ascii?Q?u7RgVmSPBEwCV2JDJfy0nRm8EcZKyOAaR5AmenXQjRGmFdWM8oCZ2zLiXzeb?=
 =?us-ascii?Q?dRs+GE4r96XbU1b8iLo/wOHcCCs50fd1VW+9/ec7DuOf7l4PcjfOwAOEr1Bp?=
 =?us-ascii?Q?v+xOjnhnr6Gm/cifrWRNa55Mn5J74QVsK56rrWqqubnCRenHAwd/yCKlQObn?=
 =?us-ascii?Q?UiYotoWFz974LsjiFQC3/Jc5bpnSUwU4pVqMgu68tIEW8epWfrHcp3OqDu4i?=
 =?us-ascii?Q?m9UGiDNJoH8PuMo03Q4keI/d5h00LmycTf255rNNkxNX5lbUjTtytwaMEztH?=
 =?us-ascii?Q?/jTNgVTB58erRveQE6LiBn5yKd7ZCqkvF9akYBtiI8hzD9oUupbcEaPQzyvx?=
 =?us-ascii?Q?aj8Kp2vPt1QbPNv9nDS4x2nkv8c0rhVHC2Ik0jUKqxOIBaAK2ZBqTsLCHpi7?=
 =?us-ascii?Q?yk7fpaBDG/COHyTbdXGcdXJttPCLLsQf1y+csRDA84pYxX2VtXo6bdrZqszK?=
 =?us-ascii?Q?jCEXVltIBPPyzx5mw89BwVt0Y7R95BIpAZR75jCMJEHuH/rzpAmILGXH3ebO?=
 =?us-ascii?Q?DcDggIHEJRdPjUAVf2ZEgKyuTdGZz9JHlQ/fMR4KlCaIWFMKpS12H13h3+Wz?=
 =?us-ascii?Q?DGxNv0MAUl6qqmvPM02O8wxNzNER0MsI0j/bvJYCVbp8388INAtzcKV7t8jq?=
 =?us-ascii?Q?ucbjIdtqkhABY0C0z+aZ5InmSe26Sa1nCGmsXmcpmFM6DhmHA8/iyojhfsvr?=
 =?us-ascii?Q?5vE34ewgzkDHfEzMLguwOefvtlz6EetI9qE+yeyN5JOYGQAOdsZVJyCzcG1q?=
 =?us-ascii?Q?hcLclD2KTn9VlRoHgrkrnlxSAJWaDLe2DPnjbmJEogWI4bDkq+Iueg+GcXnX?=
 =?us-ascii?Q?DrJuclkUqf/lrs4zAe118F3qpGetfN9z5A5cZO2V/iQtvwVx7V/ZRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sjux32eW3lywEfEA5K2q6GwmULChopdu2hd1JSuIaUWcszZd7W/lXZfCpJCg?=
 =?us-ascii?Q?gbmzOsJfO97OjiZTpGztxA0BU2CMxGOfrC9RFs+UI3FYbZRqJmhNjAtexD7M?=
 =?us-ascii?Q?7sCD4CPA0+yW4KEttDe6PSNY0yq2O09qiavebOXtIlVGhPnarapWhzLHYFZJ?=
 =?us-ascii?Q?zMq2GCZgeNqlnpUCxlc/WUZj+bGD7ERjFUugZPiiCIIhRFx0W/INhWpRgWgB?=
 =?us-ascii?Q?mO9ONT7eRe8k+KEV7boLxOpVNbrfF9bKpqr6ag/q7Q2eRn6zyqFnlpFZckAr?=
 =?us-ascii?Q?dVqB6UhiHlPbT0QJDKuuhnbevekjJ1o8NZC3I0OXZ6Hr2PelDx4HoYeL2lgm?=
 =?us-ascii?Q?ENfaZbaA1uKffZTm9Nvo5mWzmuHGYaVWjm8jJ96r4zxhmIBbxvNU8ljBfzd9?=
 =?us-ascii?Q?16pzTjwFSc6bWI2/VILT4fZ7Y3FZxkQwgq5ZwX1rrhxezrp7ecD11pwQfNVw?=
 =?us-ascii?Q?5cpX4yP+1JE9TRvbWqNTkzQwZwJQpTQD+7noPmAD6ZZgiao6bGsRP7xb+G+R?=
 =?us-ascii?Q?WUwXfKWDQReKVrezs1AZB3TvMoVXBXCPYSSqIgPEFvWUzretKG70/DL6lDcK?=
 =?us-ascii?Q?M1ozZQzd9uh/BlO3d9SfT/MSaOjEQ67L5DLXpSSSFh3KUnN/svrqr7Y+0nnV?=
 =?us-ascii?Q?Vd39TkMEOqE+BPWUAS8VTLaPvZEfqOKYTLkj1YT5yqArDTXOhADsqo+PuGFo?=
 =?us-ascii?Q?kSg2zfwLcUME1kqEwy9RMFxqLA1HAHyxprHdhbMsFhv05vcIlHpjZQR3YimI?=
 =?us-ascii?Q?xBDVgkBzFDQ6ctTBo9QPrJvowAiJ/iUb7ZpCUzYWdlWRNJ0fNca0kE0ejUwO?=
 =?us-ascii?Q?60F9jDwyOB48okIe15eh388SX6HtORyKs2Deoxfxc8aRPSyGjgeKv0baz71i?=
 =?us-ascii?Q?C8dSK6lVUiNkRducj4ZBX4/sNdHnRe42LjDLAzIhso2vZ3Bti1X+zFd9ushX?=
 =?us-ascii?Q?1UXlHoUMbZkvcfx94QDrsflqANAW5imCguf0S3Tnlm91C2J8aC3fWiv0795O?=
 =?us-ascii?Q?oBIFw1NuwFXM6EOf6BajraTxF9L+1FlojuMCcQBv2so9TD85lz4CdOOQkNJh?=
 =?us-ascii?Q?9HDKfwtlbCT5LgH/AO9s1rucDBYHorBEteS6B7RIZXSbMiHIe2//nUrFH21O?=
 =?us-ascii?Q?zuVJPpcHTmRTMvZa6mQnV2wLmNb2NpvopeANCBc2m6UFiqHm0N6MB7UZxGi+?=
 =?us-ascii?Q?FwCIIUewm5LF1j7YEMeIbHnQW8tBmOpyQ6mTW4xigU17aNf1S3Vga5WQrZkf?=
 =?us-ascii?Q?/KgCNWbqaG0bYSoiyM5bFL0rLSAejtRtjcV4n1UFfHBe3xjqJcsNeFKD1e70?=
 =?us-ascii?Q?bo08Haxub90ZfjFYa0VUKYDP4/4aOarklL+Ps7YaaxolLdo8PbgkRburZPib?=
 =?us-ascii?Q?OK7H4z2h+hKOfMnUCnTShaV5SR7SVlyCDdeAorGTNDKCFF65vOl9PwVrZns7?=
 =?us-ascii?Q?5Ln3pUiJVL1AwjRLhLzxq93ODR48Vw98q0AzS9CWKtw0zgYb59R0G9itBMap?=
 =?us-ascii?Q?aOk1b94OOtiRqbp/MNIguLX7pcvFP6G+kJzDYhQP0d7m6cUz7F6GawTxW5Yt?=
 =?us-ascii?Q?lIxE83oPIOhK8mn9wW2jKpZxgKQuCoeLyUXvgmIk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0481016-ed2a-4a05-edaf-08de2e372b56
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:32:42.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROxcdHmLcbFDajEmE3mCMKjX3bJx+PIGQove9Z64HuPgPaqd6rWckP3cU2DEezLzZgzyrXThNNpux8ikKluz7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-Proofpoint-ORIG-GUID: DsyBFSbbmVfUAmEUbh4gRBfNLN0U5Yb5
X-Proofpoint-GUID: DsyBFSbbmVfUAmEUbh4gRBfNLN0U5Yb5
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69292653 cx=c_pps
 a=jY48VJWlCesAGUsWasdw0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8
 a=FW9jF6JLtlXW1qxicXkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzMCBTYWx0ZWRfX8ku8MQpkoi4o
 0KlL3206kS3NldLvu7gXr3ClFTwYHef0ZjulbYXwEyZqddEp/YpDszhlADMQnev6UXAGat3fzXf
 cBcZb0nFLWTSePuR5mz0PmL2U5VIy7CVleMsGFwuHAE0y9SFjcOY+DZzZsp0ETyEwrrXUMu8qcX
 U3EEKLCPK0eojeeIA+uyIwmozDDDWgESA2Mq3OtKpO5G8pp+IxYPMtFvu9Iw9fMolsSOZBbVriz
 Gep1WVqYom9Gg+cNDitbtYLmVuSOP+zOVYaF88YnMCHydAFxPTlbJC4ayc1RZQdRaQlXeGN0iSg
 l4gjiYkkBwRCYt01ehQ8YeoxvFFOkVIkbYTeoFakiGeiU7lcqe+jnrVNj1dQJwBlUFUEnkHxDl0
 l750sKJiy93U2URRPPqVhyYGVD8Pag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 04:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226880

From: Chen Qi <Qi.Chen@windriver.com>

New systemd version (v258) introduces a new group, clock, to
"enable applications like linuxptp to open clocks without root
privileges".[1]

This results in warning at do_rootfs time:
WARNING: Group clock has never been defined

Add group clock with gid 81 to fix this issue. The wheel group's
gid is 80, so 81 is chosen.

Note that Debian rejects this patch because they're using sysusers
to handle such groups, including 'clock', 'kvm', 'sgx', etc. We're
not relying on sysusers, so we have to add a patch here.

[1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.7.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
new file mode 100644
index 0000000000..af871949fa
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
@@ -0,0 +1,34 @@
+From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Oct 2025 08:48:49 +0800
+Subject: [PATCH] Add clock group
+
+The clock group is needed to "to enable applications like linuxptp
+to open clocks without root privileges". See the link below:
+https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
+
+Note that this group is needed as long as people use udev from
+systemd because 50-udev-default.rules needs it. See the above
+commit.
+
+Upstream-Status: Denied [https://salsa.debian.org/debian/base-passwd/-/merge_requests/17]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index e54fd1d..6f84539 100644
+--- a/group.master
++++ b/group.master
+@@ -39,5 +39,6 @@ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
+ wheel:*:80:
++clock:*:81:
+ users:*:100:
+ nogroup:*:65534:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
index 177927d674..e4e0890293 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
+           file://0001-Add-clock-group.patch \
            "
 
 SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
-- 
2.34.1


