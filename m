Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9FAC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 04:56:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4640.1743137802793864905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 21:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5182795c15=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4WGUZ023897
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:56:42 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg46qrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfRlTS7h/9p8H6rJ1s9jaXOy7o83Q8n3hs9sKWrMsQciL9DRPWNBa2qBEknSUfAjCdoJmOUtoGq9EMfRgCMDHmhFrLD0zXaJYdKXSRiENIKX6pLKen1Rzj8A9IKjhu70j00s/eibjBZXisaN1sE8aZXxDbdTI6XrgatpCyLUE06JgJy+eD9l3M1m+4eeXGA+X99/Y1KUorEWZEZDv6Foby459bCOGI2m8atGBP/iRE3/Y8GG/vXV9Unymu2RJH+xvBEebV83hoqVsxFvUxS8aRF2BJfH4jw1y0ZySGPMYIWtwpa3V26saPPLrs9VBp3+Tg7sCqXgcjC75k2MoR4MUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kppo57Jb4r+aoN70V9PTJJD9du44zVkXsUJFplK+elg=;
 b=RY8S4hiTzYO0Y/M5Ys5+zLga6mWtS+zn4b9hAJN8gkQrrHukn242F1CpJsNXLKUomZK1nOasntO9AZ4v3XRGVnkdKGbagjlwYfHnavYz7/MEKzBjplVZGxLYywskVjUAj9UVJsNpn2tT0vVe2K23QiCZE43RvfDc1fBmb/fgPaDPA08dwkKAMw+Jwu3WwK79ZFd98WPOIul9zLUh2yevVO+f91WAUso261UMgFj57iuwo8QM/RDTwbB84bF+qFpmumBmDa38QuT9pTCs3bqcyhfVa+zJhszTWDyA4PPZjl/jrB1DDZzuqTfr5tynzfAm2YQID/fliHNYeludb8cTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 04:56:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 04:56:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base-files: add gshadow entry in nsswitch.conf
Date: Fri, 28 Mar 2025 12:56:13 +0800
Message-Id: <20250328045613.161315-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:404:14::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 981f4b72-c62d-4610-764b-08dd6db4ecdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8MaqDrafjFWyPYkaorHwu2Bbv0TEMBXFar+f8t5PlIHsPAvBrmTxV4cmjYQH?=
 =?us-ascii?Q?ZuTP9m9t/FpN+kkp5l2BwEp+L029S552CbTeiQBcL7mX7+UdKu+3PTc1IGyp?=
 =?us-ascii?Q?iyMfiQm1Xuw1qz276NaV+L1o8geGZaAtXT0LKSA85/TSGZ30MGUtKZwJMG7u?=
 =?us-ascii?Q?A3d9Rbbhfo3vpvEBu9b7S+ZVXp29R+1aV2v4Uj/6M3fr2odFupe3rW6q5cIw?=
 =?us-ascii?Q?aczFAZhBC5ub8XiV87q66+R6wAZ32cCHWgzIox6xXUKnP7zrHFW6XB5HsZOK?=
 =?us-ascii?Q?4zw/GE0Hpp1ax55w06QbJYlyHqdc65Pjp7/3vIVPss/J1akSNOw3neDS/l2Y?=
 =?us-ascii?Q?kQlegDDA962iAiI7mfM+Ijxolw8z3nwF9s2x6H/L0+9hRlzavtxbMm1pdow9?=
 =?us-ascii?Q?YHWZReRB7RpQ/hmKm8a2lvh7PMr6INlguO/1CMYE1elH4y5ixrvb8S/5wyqc?=
 =?us-ascii?Q?/hFBDAe47/9jxnxVn/28xYKjXSj8t6B7C/2E3+RaEOAltijD85Olznp69PDy?=
 =?us-ascii?Q?aREH/9y+zh/ZfKAV5qwGnUU/bzp+IZCi3+qjtQSlQCT1wS1yRLnW6lR0CglY?=
 =?us-ascii?Q?i+tCjzVoSq/ndiMbnEKEyZPb0CYw8woCUJ3y2nDX5q19crOS1eT5kFlyt0am?=
 =?us-ascii?Q?7J5CAH1obcDql4KSrNGaVFgmRBjqKtsUgW6dxVSlx1kCfTCd13OFRrpN4g95?=
 =?us-ascii?Q?U9vxMJIK8VoQyeX4rrTcoNKZF/TCCIAO/RReoDmbKuYw6vDGbg5WkSlBOsLz?=
 =?us-ascii?Q?AKFcRflkn2UTGO11N/JtqBLZRaUdjhQVddsk7VRKLjy5pp+RI4x5GdGtS0uv?=
 =?us-ascii?Q?jwFPcpWc32cBc55sr8uBdzOgoZGgZiB9raEolVyNbtlrfkaFpOxqUAekzYw5?=
 =?us-ascii?Q?tx2c0DQL2AmT5A5pudtY9jYAHv/dWZ8heBD/t10FR/iFx8XaGwTTzkpv2CtM?=
 =?us-ascii?Q?9JbngTsX2PPbtz2UuFEiKZRrlIXqLPqV19QkZ3x04o/T3yYwIXVveDgEepL2?=
 =?us-ascii?Q?5jT+tPkxoPif0Ql8PAHiGd17zHohF2O+ie0HdXBI0w2+nm66cyCHM5PYIbHp?=
 =?us-ascii?Q?BaidA2/dlfuLFP4N8ZRm+9faDw4Bk2ecgj3gUuS+fznGJZENDGi4aV4869Iw?=
 =?us-ascii?Q?iwJWwJeyFjUuhW/EHRFZjv4+vYkdHqlhoeru+A1/r1XNPrexzsVKmIz3YQlp?=
 =?us-ascii?Q?6GZOFn2Urfl/KdQKAfL2C2yarSVjWqSN62IqjhafNUhV84ZF5CSugBxLYzYQ?=
 =?us-ascii?Q?OYjsCUoTlFEF+FkhnFrRSn7++usWUMUI84wlTxyEz6i/C18BYdKk3hTA5neP?=
 =?us-ascii?Q?lKuvpaqFofBEsc0xZyVdYgSMG+POK+VZs1kSHZzphbzxBjDP3qnVv50BseKL?=
 =?us-ascii?Q?IYyhbcNiBc2wTSVaneYZJlDSvOFE0ic2dgNhp5bpoZd9ci8h1dmr1+17yNVs?=
 =?us-ascii?Q?PnPfYTqH/ZeG0ECbfh+pF+5w89tI9m1O?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VLKYsza9POnBRJSJgaSmKiO79tsWqOYolASbxylbnKKj7uWG6oMEZx58Jg94?=
 =?us-ascii?Q?2h308EGOebPXu0un3QOTChGCHAbOgLKIYMOB5getkhlzSu7tmp/NWI/ovPxV?=
 =?us-ascii?Q?MJgWC4AAZMobczY7GWpusbt4bPIlWoNyrmMh/1y/AKTJAGHe5KlV0RE0isEp?=
 =?us-ascii?Q?1fJb+mFH3kvlJqzNXAUlSjtx94Nhhz6Zs1m/hdupqgTHuKkVNiyImPEB2PTQ?=
 =?us-ascii?Q?qpfAMErDJ+jEN1syYcbvF7eHnbuzFo650CsvVpOc/kpjg6Xg91utcYq+xh5g?=
 =?us-ascii?Q?75cnLv4AXfcTLiqXWUyp+CVp1matafbCf3CmUUucoiwzes8gNZKL2oCIB4Rb?=
 =?us-ascii?Q?QLJRMdZqpd2JuqD8Cai3Mi/vXa411rrbSiev5zbjwq4jbxTGr5QZ5g1SsETc?=
 =?us-ascii?Q?VEMLQSjqQY4yUExyiEzpWd8cZotyq7V598kkfL2Qx7vF/0y4XeRrpMuZdNNd?=
 =?us-ascii?Q?wRSs9UVE2bL5rawfbZEcv5qlQ05ctfLhyaIsx/nQ4Tfxr9vz+JRolS5Rs2Vi?=
 =?us-ascii?Q?ILcqi1Iy2MU7VOBsRsI9S1AHvnRqvJNMybY1qde1vdxU1HPH1w3ZYQMFTCBT?=
 =?us-ascii?Q?Vw3NZ5nm5sOcz8r/kpN/lzwoFboiSyw15C5X5RqESX2r1Bhdmbene9PSuaGR?=
 =?us-ascii?Q?kuO4oxDMrBfvY2HeBQ6/wU/vcrfjKQitia53GXFF6OHm01RXGOXiG/Cb+sV0?=
 =?us-ascii?Q?t4DtScEg8Ys0Fn+JffUY3aJrQLGmimDtS0c/qMlkDA2IgJQVCZlbKh8axCJD?=
 =?us-ascii?Q?FhBaIeixZQBs73N43ouBu7KmMuDSCT6yeIvtcBdr5JnW53v3r6lY6yQQhOhF?=
 =?us-ascii?Q?u+qyU5/AnsrnqPfmX29sIPaMt1lZzElAvLpPIwUGw8aGGDn3iz0wLWG36HJx?=
 =?us-ascii?Q?yOTwXzyMDa6Jt0blnEcbgIbfL8eQXv+cPZ3H4GwDqkTQUuAIz44xZWw1OENv?=
 =?us-ascii?Q?xuAWPTEMdJeHvdugN19hp6g0GnhyA9Zeyxwj9glRa/DAvWG4JEAWzlkgfLWz?=
 =?us-ascii?Q?Qg1LK0HQRSI9KWY+v5RySL9ioMu8CwpcGGPCa7LRuB8hijgEbniy5qXTpYEX?=
 =?us-ascii?Q?pLCGT+dVQVGU1CQfq5zOq5HCFnqQHvifPfst/x2ssJ6qIDk+bCs6bKH3eseT?=
 =?us-ascii?Q?Xb4T6tTRc4vuS50idetc9GFkP4VVqu4sPDz51CjJox1GlzOPGZZvNg+l3ydK?=
 =?us-ascii?Q?ZL5zDLWN40ynrUGfZO8YSlpv+su35NwjlIoLabFFFqW0FmVyXZN7PAZnO6ey?=
 =?us-ascii?Q?+UlWs2Z71xFRB3WPjP9FMjKyYALnw9DmZoJ5UaiBDDghiZtockBYNCW6ai71?=
 =?us-ascii?Q?NkXnuVrL9yxl/ls2StWLrnRq0U/DmqQhBGtxadvQJkkjHAKlICPc9FvJUy6/?=
 =?us-ascii?Q?7v3q1fZ0mJGs2T179C2OKgR8X7rryzR0QgffNH+6paMhGG58DJWZMOiHF3mY?=
 =?us-ascii?Q?qBiKJrYdTd2+EWLvBZlVMO3q8wBgdMj/cUwfbzz3sVLlFIg3GNvycB2/Q2HE?=
 =?us-ascii?Q?muBfwsti8koQ1HwZhaHDi/0X7COSchazzdde8WriDT5xCNGYIotPrmv7FjdJ?=
 =?us-ascii?Q?slkoK47L4qprDwI2Q9vCTAKejeGE9MbXpfAPqZKy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981f4b72-c62d-4610-764b-08dd6db4ecdc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 04:56:39.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH427EnwqWVXntEWYLjcoE0arSbIimcio3u8lK0ohqEmT6wMK7zB3C5fCqucMyQ6uZTacP2qn4YZRO7kCKfHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e62c0a cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-K_oIF6FHoAQftIDVSYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lOy02uinuEsMB0Ne5Q43l6olGIbN1nYu
X-Proofpoint-ORIG-GUID: lOy02uinuEsMB0Ne5Q43l6olGIbN1nYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=856 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213809

We encountered a newgrp regression in shadow 4.17.3:
  root@qemux86-64:~# groupadd g1
  root@qemux86-64:~# useradd t1
  root@qemux86-64:~# gpasswd g1
  Changing the password for group g1
  New Password:
  Re-enter new password:
  root@qemux86-64:~# sudo -u t1 newgrp g1
  Password:
  Invalid password.
  root@qemux86-64:~#

In versions prior to shadow 4.17.3, shadow used an internal
implementation to support shadow group because it could not correctly
detect whether glibc supports shadow group in a cross-compilation
environment. In 4.17.3, it can correctly check whether glibc supports
shadow group even in a cross-compilation environment[1]. If supported,
shadow will use it instead of its own internal implementation.
Shadow group support in glibc requires adding a gshadow entry in
nsswitch.conf.

After the patch:
  root@qemux86-64:~# groupadd g1
  root@qemux86-64:~# useradd t1
  root@qemux86-64:~# gpasswd g1
  Changing the password for group g1
  New Password:
  Re-enter new password:
  root@qemux86-64:~# sudo -u t1 newgrp g1
  Password:
  t1@qemux86-64:/home/root$

[1] https://github.com/shadow-maint/shadow/commit/da6b9cff02d583ef169a0bc0c1014b19b5fad2fb

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/base-files/base-files/nsswitch.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/base-files/base-files/nsswitch.conf b/meta/recipes-core/base-files/base-files/nsswitch.conf
index 06f03d22a6..53279c12b7 100644
--- a/meta/recipes-core/base-files/base-files/nsswitch.conf
+++ b/meta/recipes-core/base-files/base-files/nsswitch.conf
@@ -7,6 +7,7 @@
 passwd:         compat
 group:          compat
 shadow:         compat
+gshadow:        files
 
 hosts:          files dns
 networks:       files
-- 
2.34.1


