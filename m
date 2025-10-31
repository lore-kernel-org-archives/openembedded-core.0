Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669FACCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:11:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8644.1761891086193101972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TnS0KXYw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33993df286=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V5AZB31599214
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 23:11:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=; b=TnS0KXYwVb3a
	HSqH7Ag7cslLnmrO5LCUUWMslehf9WAOuJWXkR1GSfQ87AzW26cBGQmCOTsgAjca
	3JzuRiA7v2r3TTqXZ1rdzJfA9XLOBAnx0rz7DmS4rRpO53VQ8KKfskxsfuCDTqur
	iC4ifFWGmlmCJVwPRAY4mCAJRExw1lN76fmKM/E9oE0Q1wu8Ehu47DTZcK60xgvg
	paLVaArZlX5WdKJ8z88AczF66BWhsRKEuMgFKwLl+Ojp26utGzUjs3e8Xtt3x3Tk
	Ojrn7dfEt+GowHFiq33CqOzqxcpAfhXOYvMnO4QV5Y4nb5tkrsiBNniZdJNc/9hK
	Tfqb+BlhOA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a4mg204pc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 23:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9Znli7r3esSxI+pNejp3dXTJYXWHi8LVADnNs9dRTvR8EPLZiPpovJtaOSrWAFZcRHIQx/Fnb22FnXgXoRcFuvSNypIug+dAKNNCTCKUDsZUk+yXV8EotmReGOcm8n0jpIHY6AFxlGzW9E9X+DMY3HgUqeb7zhBNpe3Isshl5pa+rN5RsRhd2RcXPguQd5+xhDl/e4lq069wTvkEMgLGyGimq1GjJOEQ34agN5ZJuszb7Uaph1rJuqtScGzBvWwb56STWARjzr1qidtb2e3nGqNzUJkK3CRZ+BZMLRQia/z/rDw2AQ/CP/1AZOo4cCQru/D9x1/qsn0aZg7EPOPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7prakq0UA5a4IYAVmBiKFGmmq/yQ9TbTzo/cS3dknqo=;
 b=Q490qzBEDB71ltcjiqSzaMPMKmPLsQypzsK6LcRCzcsXE2D7Gvz3/SxtXBFTwRQ5vH2rRsbv4FMY5pjKfDQd2f/0HH/Pu4HT2PTANNaZiKrvzJaqGOTwPMCZDbl0SV7RX9giZftJ+SKwyOzu69i/bAvnT9+1KrVlpNWTYGm7gq6ayyjZldEcgveJQkL83ntOachwupMy5UdvKA9G66ZBoyGwZ3skQxACthNFtutSeLi3SO1pPUYfHkMNazAIDdHjV+mq5eoYf1Ncv7NxRFbVwyiA+6JqNQWVagFCuHM38vJ3EQLbXqhbdtTwWWKGSH5xP0KkPJjo+PrlKscsuVi75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 06:11:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:11:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V6 3/3] xserver-nodm-init: avoid race condition related to udev
Date: Fri, 31 Oct 2025 14:11:05 +0800
Message-Id: <20251031061105.2693258-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031061105.2693258-1-Qi.Chen@windriver.com>
References: <20251031061105.2693258-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fe1dcc-e29b-4e06-3aaf-08de184451b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gAczGfo9D2yxDsscRIvs6MWEtfqa8FbqJYEZmIHOChoooB3X8ZtqMUgJ9cEJ?=
 =?us-ascii?Q?0dbM5IG2ndALGdk6wUW2D+9g2eZoowtvroZKaGWKzEKZfYSIUuxzYxJZKMwA?=
 =?us-ascii?Q?ijCL/CgaoC/lfEO0NJDge3lGCZcBS4jk54fygdjZOQfVVu5TlanSoIDMOCV/?=
 =?us-ascii?Q?DgzVpPqjnvWk772UiScDGsj+Dtme1cBD4M4meiZRUE8keb7QaJX2y2kELJuN?=
 =?us-ascii?Q?6ovvup4d4mKzmwkM8gDzwswj4oSeE0fDo3/F+WGXMemmEJr22qFiTaAExoIY?=
 =?us-ascii?Q?2PY64P3Ua3z30zorc8B+OrPix7x2LrqQj1Iy0sxe2zlkDt32pfLfTpdn1oCg?=
 =?us-ascii?Q?o90pMdCRSarVA6y9/9Q/xMc3U0QiyvuS0eBwkT9lf1hPLg6lMGDb9TM11nBp?=
 =?us-ascii?Q?ZD4ZQxrRUoTzdRdcnOfu43Uk4cuvMtSbz4vjbJ1u62Nc8mkxb/j9l32xiKRq?=
 =?us-ascii?Q?V2vPLxPz5a/LYXSSaQQzazlY2yuP0arfJ3FaZpO9HMG3ScVA8v1ksP0TSb0S?=
 =?us-ascii?Q?bcH8Evm5IOeK46zdiEbhp/g40Bhn+mUqe5iOWrpP1E38Bwq6BfScoojr0O1+?=
 =?us-ascii?Q?2ktZtyF/U0lGQ/GrrX6DN0MCmvQT9Oi6H3MYkaRLmR6s2sqoR5+OH8VoqaV/?=
 =?us-ascii?Q?54vJhQd/EYQXdSu7zrCPQe0BrNj8km75nO4petlFRSgutDnELof3nyxqYVS8?=
 =?us-ascii?Q?UTL5T3PcbAXXCplwfC5JSSEtaZ1zdEwASouIw83PBv2K8VzCyFuJRfFFXL27?=
 =?us-ascii?Q?joUp7k0NsRyNHt8+K1gkMX/tOzto/T9Hk3RLt5L89Ay9FKZvYx2kg9SmNHPH?=
 =?us-ascii?Q?9J7RFAG1XPQQDrfrDL4FLEqqyikOD9pP+hsS7Xy8uv6+3uJflurucdwQ54nG?=
 =?us-ascii?Q?iDvsayqpXHs+K3jQnHpwo4ZaXa9IbogcZVqb/a5w9Du+qOjWFP1glE9lpehP?=
 =?us-ascii?Q?TU5ZknAQnKfN0Bo38Umi+8IDWTA4KcWUwrwujHP+9LjYQPJVw2PSlPgguiy3?=
 =?us-ascii?Q?3pn9ykypzpFAv5A7AnRLgIK5afyXOv8l6JZSb5xdhsHuY0oCwDIfYLsnSFva?=
 =?us-ascii?Q?EH++5Pr4DtE/ySoc9fSnX5CoLZXoBou9aWSN83NalfmX9wY+YVumIVGHpJQB?=
 =?us-ascii?Q?hgs/vt9/zehGcmvLfUBxgxzwLhfe12Jl0x375AJAkTLHwplzsJO7o0xMOEnV?=
 =?us-ascii?Q?8cuHI06yVbL4mmbgcKcXVKavVRr1WqRD+imI70rN2bDIdMlx7sKzD77y0g5w?=
 =?us-ascii?Q?rfJcWiHxB2Ns5kUmlfrSkpOIp7/d+/1UdFZldzU0hGsbaNSuBZZnbSheJC+g?=
 =?us-ascii?Q?B8EquBRCuSSlxZbVs1TrWH6gaKPJju6bu6THWctZjtYuWsbGy1dJdWiuuHN6?=
 =?us-ascii?Q?QqT4Wx1433mu0m4RasHBOkhYqRJE5w/+cNj0TuVqp4TzDxHxzWdhFBcxQwHo?=
 =?us-ascii?Q?aiQ5ttAFdTRmcbSNav6CbCFwL6s45utO+diI7ppDs4Lvj3RQFYS9m6XwQgbe?=
 =?us-ascii?Q?qjoYp3AlP0qLDqd0li6sPiuaIxgcHzyGuC1v?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lvfEV+3z4Sp+8AdQJnzu//XKJDCztahOE2JIA/8Kv8QT7EDxVa3L6fbGgRK4?=
 =?us-ascii?Q?ED8ePcfun08p5l8LwzSKltwhTj/wtUI/HqOtegkC/VXgiPaewvwdEzz05TLn?=
 =?us-ascii?Q?VtpF8buqccTAYmqjAU41DFbC8I+fA8YXLaQJx3vkFC8MrlsWn+r2fHq05Za8?=
 =?us-ascii?Q?umfGcvsJyV1Fi/O9xuXyEiLFZKIf4fyh95BRJQxjDe+Ie9FHlZBbjDwJeO/K?=
 =?us-ascii?Q?tjz560yjz2fJ1qjwCM/OMW9oPICbFaqr89OxI0kVXemUjyFj1K36MrRomTk4?=
 =?us-ascii?Q?tH+r24E6eHfR6g76kJOUvB+C6CNsTN8sA6dX/IfFZmZ7ubfQ7WYeKguih6R0?=
 =?us-ascii?Q?tqJvfDzb5pee8uyJGOoNDow8zoFP18T7OJn0/X1eVNURMNihACkDGUsArPDp?=
 =?us-ascii?Q?iuFggiM00UPmwxItdkXPx1QEC2FgGPEn582+D8SvwtiRaLeqmYrMK1ywCYqc?=
 =?us-ascii?Q?lE573Sy8YeGtIAk6M50kMjNEjHqDNRYoMY/EQSXOoEbT1WXd1UFmJsdPBThG?=
 =?us-ascii?Q?Zgkehs31u/Wdnsxp2VfPwbdPYZ/ZTTYSsUblsoMuMnFQoCeNnrV16iebmc3i?=
 =?us-ascii?Q?stZAv38UFV8mtdGPfYu8sH+jFY79B3eVdKkStBz63CQGKfrhy1ZPYEECKTpy?=
 =?us-ascii?Q?44IQV0lCd6o15e5oa3qNDxt8aLSrx9KjFBuKEwEEVODivZMC5Fzud5hTPcjH?=
 =?us-ascii?Q?0BeDGj1S+PHyzh8gHkcQ1U793LxkaAVxpLTtvh8LraBeJ3fZjEpJ5bZp02WE?=
 =?us-ascii?Q?62YiVgNlwYRJTICiFEsFFvydF0sBYMlWwRMLT9FeDxf9lKvW3McB2al2hQG3?=
 =?us-ascii?Q?ksJsD3PP1I4TxS/UXV+bqTEGLiKZ3QltHLMyTx9FbRnLBBnbuavxCy1tWqwC?=
 =?us-ascii?Q?xY8N1Fkn/oe9mmFHtC/oR883NmdvZY0HtIzPU/nVrc/ZJ6xqiMjfMOKDVBrQ?=
 =?us-ascii?Q?0f7/ewGHgKGrIEX269kx/UcJ6eofBFSe0hlksIJ6ffmSUQLDLF83hylcWjSV?=
 =?us-ascii?Q?QwrOUIn4pP6nTD15eGlDubL7JKqe79ucub5fEIOwio4TlGqWQVeDhPzszNRz?=
 =?us-ascii?Q?ys0GOfbJ/UjP+vZYd6Z+9jqO86xPtTLAnX6QQN0dhTuL3nmakMJpcmwu42be?=
 =?us-ascii?Q?iP50vex1/2l7V+lyxTTVbEzf+CL0CBBqiS9YTNgMvOgKWfSuJjgT/+HxqU+Q?=
 =?us-ascii?Q?M/wyAq8B2LGvSBubipDvkcCVOGQQZNrhr2p67dFajIC5UOs8hAp4u9YZToSE?=
 =?us-ascii?Q?ssNRI543HYedGCfCwu520m+cFSydSgI3+I3SqcOR/xFO+mSfOqSjNAXIKsik?=
 =?us-ascii?Q?C2c6MuWBP4sYN2PKtBuzQ82jlsq5uYVD3DAZVXHyxvrZCyJQCguvBS7t0nlg?=
 =?us-ascii?Q?4r928z/ntMQDmhYT0fL5Cj4eE6B2d+mTN/hpzBCdUv/hMplXun93H59Cb0w2?=
 =?us-ascii?Q?bemjgPS7Kk/VUGBv0SbujJ0AF4jV4pZv1oLNoYTTt9ULi6o9fC4XrGELAHOo?=
 =?us-ascii?Q?vkPLDlyY1MUYXCQWSsSCQ1syDDBckYK9f7V/mZWhaQ9BZk18esS1okWN7XLo?=
 =?us-ascii?Q?b0tGQ56pHK7XSei2963DTKPSZZYCR29F9FCk9SuC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fe1dcc-e29b-4e06-3aaf-08de184451b0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 06:11:24.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxvezQwDovAYY30bn90hocj+22O0HvNw6n2AfncF7ZpHSPmGMwy0BSpadpDf8mj+JOzhdcEPACEFw63yPwu4Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1NSBTYWx0ZWRfXx7qH7Rv6fD2u
 rvucJ29ah/hVXxI8wIvv7TCKYKfLqpTt32H1vRnvpmEIjEZ5Lf46nsVLRfGB5PE1/uoSq7OsNgM
 gSSzxGbHvKiTBPa/imepZ8ZMmKRp0tptUrsd38HX2xDMLsJIl7O588ZYlA5O5dPDLclLKmvFUfg
 7wmvFn1cUFa3hwss4cONwOgZofrT+nPqPzX8nlHs8vb2xtTZgfXAl5rAWrGTyS1fxQlWZ38Ctw4
 e0VkRsfW51BdH7mFL/nmqqw0owJXTKfAjfUlFxVJwyW0LYfs1O2lFr8/xuPt324mvXogh85T8eQ
 5FFmYOlYeJ29Ysn7om4QBS33sAHQ5fgkCx+q/5NvXb27TjNmX9K/4odVAHS5/ICxPhNplTzqfag
 +n1QChlpTK1/xhLmWq7MHMiNXjmUTg==
X-Authority-Analysis: v=2.4 cv=JemxbEKV c=1 sm=1 tr=0 ts=6904530d cx=c_pps
 a=MRNWLIXgA5QtCoQasNiLPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=et4UR6atNtKrrsjGgL8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Bga4L_PgNyPv8SPq4MGFPR7Iy0clbX1G
X-Proofpoint-GUID: Bga4L_PgNyPv8SPq4MGFPR7Iy0clbX1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225530

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to 258+, there's a race condition error found
on qemuarm:

  failed to find screen to remove

This error is likely to be introduced by the following systemd commit:
https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

However, I think the commit cannot be reverted, not only because
there are a bunch of changes based on this one, but also because
the change look like a reasonable one.

Before xserver is able to handle such issue inside its codes, this service
need wait for udev to settle things before it starts. This can avoid the
above race condition error.

Fixes [YOCTO #16045]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm.service.in        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 87dc4f8fcd..43aaa84c0f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=Xserver startup without a display manager
+After=systemd-udev-settle.service
+Wants=systemd-udev-settle.service
 
 [Service]
 EnvironmentFile=/etc/default/xserver-nodm
-- 
2.34.1


