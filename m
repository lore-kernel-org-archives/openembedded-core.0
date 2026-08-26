Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA522C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23342.1787780773263369396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HLOtl/91;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKdDpZ405591
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=; b=
	HLOtl/91mS0aPctYzef9jDRrKIFwU7X19xdE7oFrZDxP2xTk15LBwwtE5Uv1VLfa
	ETV1/t0rK92dcP1DgBnacrKg/GsxGgV3kADTwq7Qi5ewkMXx1i5NTb2XAH1LV2ti
	0lnk3Wvz3YNJuaTHjmJBEVyPgJM1EMTCiswZWTrnKPqbaCa3/C2pf98AXdrK0lB3
	jYkr4fKHrTgcoHs3u8ImbF3m5hyLSU04fxfLLkr3FMcYhSw0ZQ/kjdiEyIblAvTN
	MIIEq9rtO8JQqoIhGsSVVYLBpbCCNwJnQAvcXwO+LwD2qZebXojXNk3OQQ2PNO95
	pxwdca0wDrcy7bcYUq+Uhw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILTyqI30BVsjaxjP/SDlzHvSqmRA9KPNngWInaXLEHGMwiaWw0IHJtFVzPilrIaFhh/AGPk4+N2/ozRsH3/oDC+PmIbi8esiErC5eC+3x74Kx1RQCycFOqtsOMx4ZITNUZ3BMjgHmNQxDIX2cv2OqU0bw9/noi3TpRjcmMh5mD6tccL8USU6axAwXwLZVy1LjRj/UZfczHkfsfu0R+NtWAXZM0xbkMJSwu+PkgcHc/fmdYIuQYrT9BSt4Q5oXTcPXHZtTnPwy9vgnQ2XPpcRp06draPLvKYCTwFMDDYbrukqUes0+9W2S0IZS1t4yODWd0TrujL+bX6/2RSjFUVZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=;
 b=oh6Vgi896hyiSCou0nIHVV7rpsey5t3+HS1CQ8rvT1KOqSfBjoZ30fHjKfibFqUE2AGUkGs53BGVnnw22rNnWPO+/siqO5Pp2GhEBo0/KvP1b4+k7OspL4Rez38VP2SGUau16+hTEiiH6ImJpAmsD0TBFYoz2kcrDlw8tBofgGW3VBErdp34+EJjR+TxSije3UY/L2mS2F1vYqneOPRMWpLmTtO88vu4Hzmyr3PJtO0Njje8UAyow5puPb1u4Ar2q4VcPe/d7LaH7jb2ZKO1kRRSA5aSGYQ/+gobpDHPrVpJmcC8r+J6Lo4SxcLzKptCZe0yhL4PHp0Daodxin0SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:09 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:09 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 14/16] package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
Date: Wed, 26 Aug 2026 14:45:46 -0700
Message-ID: <20260826214548.3002838-15-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 78acc1f2-dc7e-4c12-1763-08df03bb70da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hoTWdA1ii7oWOyXr00+mdjJ6VtFPKsKBsyDN2sytIbZemGI7QQiZa0ykOwCl8V2eTWvf+dHXhqLtRyFSmoBoDYBeWOb24pYbZn9GpDU1//MXno/OvLq5Hy9IfHwmvi6G/86KWGXlYiUWe/lQwFuSPZuHxcRRKQR60lYcGKh8EbbPcg4UECs+0YdCn2ZaME8EkxxqCh29IuWNxSagjHFl6JmQ2kU1aXkbi2YZNuruqhY2hf16MJS2dfY2XjnNUlCpMkWhRzF4YQXtK8C6wOXrRn0xCfu3s2U2COu4i8mEi6z73iAgwrecvg3AjSdohAAh52aUr2s74kKca998mJFdWSgfWqxIVPb2OMEzvfJX/WLQequxT4gPi8Yin08wBECyWQFJDxNp5bNp4gs4UWwoCQEL/ChhDSguX4x/5PssCGq/cDe9ldCchgsBt8RupYgYnuYsCQlrpzNfowz0ksvw79W3wljucjCNrHTRjy9qaxZAO5yv6IKfchobX4wkH7LDfV1p3seFeDlVVWVQmqkqY1bXJELCPQi9eUYoc50R9caL2rGMFaeOG/goIfqvIkVWIl5SS6YcrUn1yEePDAJP1oz+hisaBSXOUQeEdWcTDu56RNY0RiUwWPGOB0dd8GopgJWN9G3iaw/7sCFwYN44D+Fl80l5kUMQd0ZyiieRGsNtKwfhnGP8eFMeXMvnVmMRZim/4evUcF1xVnf0DQVvGF+t0vw19CrSDY70lnfAcHc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M3sdHGpXWM/JFlyAwKph4MugS0BSSMP0ziF72Yu0pOY5O+uRFm0o8pLOsfj2?=
 =?us-ascii?Q?V9XOfysaO/+523acqumNM9Zk4sIGLsA6RBYwWzOMaoyEHNFA9KdooiPcMWBb?=
 =?us-ascii?Q?gJTMt0gRbVQvgBbtxxlYEr9gjBsqjbCBvXOCZ7ATK2aIar+TVOlnzo6rfsiV?=
 =?us-ascii?Q?h7LHL/9+/Bd3mpKJSvwKYyepXEOgyWC14jysXcr6eFt+t6FDV5G8+jwE70+J?=
 =?us-ascii?Q?Ns9sRVLbsfu2HaxS+GHkhBG9Cvfki/40fmROJ7MRbq2GT6+zyoDPgSN6RGmR?=
 =?us-ascii?Q?Wei1U/SixIfDQzervR3vtpVviO+B8EJwCAKt/58hOOYu0S0tjNlevgil8YMn?=
 =?us-ascii?Q?BfGY+p4XKI8lGhUONhMvLqM/i3hw9PUUPDypRn8/+AUpDcBznHoWMsCHHw5o?=
 =?us-ascii?Q?YHp3tjSj1GYlFt3fRAeM9iMNnuOAQzmbT9P0BJnbTErAFDZEZ54Ip9jZnWAI?=
 =?us-ascii?Q?3Vy5xSdXvxQTtWoP8/S1IPh4jnA/4/Dt41HPnPATOzy0a6/kksZ4DadsF5fX?=
 =?us-ascii?Q?R/wVn3SF6HhHS1mAXG4tO3j7uvHLgrpIl3d9Xy6ajFDB/GdXobQYhSybHKnn?=
 =?us-ascii?Q?tNGsYNysf4J8XzqaGmCmq8SJi+ps09r7zPcUpnOYakgsoPGHbDiuSIcjAGOg?=
 =?us-ascii?Q?dgvz2Xg2VqztdcdR6flfcFClMtSwuYWJmWDuGg/vnQXxpvenmKGZw0mSPqEu?=
 =?us-ascii?Q?pie6J3vRGLHGpPjxE6CxCZLpSrWwjXiGyguGhyW3608IzlL2BEBcCcSexISH?=
 =?us-ascii?Q?3q9a9n6+Q/cTmBjFJoDKZcEIhHP7hNWHoiZBHH6dDcCNOAtPT4OqmBguqghp?=
 =?us-ascii?Q?9sEtMve262yAiI3EFHOSzjE44DfQK62lvckvUmxcSQM4+0uZMwdEilj8F6SM?=
 =?us-ascii?Q?W6DXOmEylxVTGH7u/Bcu29dLclUWcgXjCrjadSUgKbmdwgI7vv59rI0uSNAe?=
 =?us-ascii?Q?Q46oLOJgpD80PR3NmCIceSu8up8Lc/V5Xn2x9ctelqCE3KLX7EsLnE387JTH?=
 =?us-ascii?Q?XP8o45ft7vx2hz8GoIw24OMzT/7BOIFKBd8B1d2EI/71mXvpEOwKn4Qa8/G4?=
 =?us-ascii?Q?enOGgcGUi8ufHLEeVE5wJ3VFbj3CO/a9QVL23dMECqBMgscBKlNNrFlKj5XJ?=
 =?us-ascii?Q?Pdpc5UoG+V/iFnBXCuvtAjH2dFFhDc4MfYHY8OuW2xaC5VZwnvZAx/S0Zjzi?=
 =?us-ascii?Q?uwHf6sfRCGZ1I0IxvEMpww1xEzHbPShnJhAaMgOkAuvu0LCpNajNWTf2cvDm?=
 =?us-ascii?Q?5BOQLkIp2NvdVJoiPBOrvLI6twx0oGzsbL+PNzzKB4eWL2VSlsznHHpsy3u9?=
 =?us-ascii?Q?QfwtSMYAPBQ4Yx2nrhbSHlpPlSPp5HggPKQZ/YVhVg061j6uuhiwxU8Mf34t?=
 =?us-ascii?Q?pGRh9wQxqnAh9nFh7Dah6of8WMmPUlcdjApjEFfxog+SiWDvivaOwzj5laqb?=
 =?us-ascii?Q?PcqrAFDJ2DBOyTfXojRe/Shlm3tTuziTMOuR+9/QoL1a6akIPW94VJpX2i+V?=
 =?us-ascii?Q?BVYNNOsf8ebgh8NKI87FE+zZ726KSEAEjb9y52rk3tIb/RhpVcZ2SZOyIfp5?=
 =?us-ascii?Q?HTJl4+YZt7M7yU089jvsp+beo56W1GZGvOir/qpLfSj+QMK7ytylONQwqvYR?=
 =?us-ascii?Q?MxChhfLdqqTAO63pld1H/JfFPkU5bdpuAXqTOHnqA4puBTI8KGxeOlU54YXy?=
 =?us-ascii?Q?llpxJ3VJfmhbna7zQb6U1EujprW702xcDu/XZ+ljA2WS8aqfZZeq3RKXRHAF?=
 =?us-ascii?Q?7e3C7VFo/SvbvUcjkFLeDtjsdzl8Ce0=3D?=
X-Exchange-RoutingPolicyChecked: 
	uzkSQbCn597NTIjwi18l0kqruwr8SdSnm4brb6xCAlO8MEyW4ERE7dN786UCm4yfFBBImU40dF4UKEaiqf4xtMcZTIl7pJOn3ZPaVfWp8T308aIphUqZiBTkjtoEN791pnws3MDyiYci8UDwFJlHnkswHztjLlMh5Tra6t42/PWovwcyyle+U/YZdFvJNqYbyWuG5w/rQYJwbOzzUwoJXGZN/dX1QXQXbotdPS4/i0Sc0Dob3vLyAq7NRTFEY0M/MV8lqOmrWuFfyh66A/7TJJrlE3HQetmFQRdwwxufj1ENFbHyz+nrunHJMR1eyvXyvdPtRS1dbXoUftA995koNw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78acc1f2-dc7e-4c12-1763-08df03bb70da
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:09.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6HC9YOwUb2lLqBcdyFmUchn04SG/jrCrib3NoeitEYvDdCGexUV+mwOQPhK+z9k3Fu5PdRPNvmP9crO1oGOr8fPxLwW7QB7Y4sWBpU/e8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea4 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=bFbyjWf9jMRZ4lLZV1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: J9cAUzqBKThffQcpJACvme0W6QhywRa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX/Vn1oKTB8t5a
 hKxG9jvtbPbgvBE2zOIMBE42oYEfV7fIAB0hwtSNXjJA6kT/Pt34ABSpN9ZnuDduD9XO5ob81Mj
 ZyPzYA9PN+P8sGdXr4+9xAnBOFF1h8jvb1LeLV+weQJNJsKs2fFE17zHI34KcpGqeCyNS8jzgLR
 HhBTr8C8OeXToaY7TqqY6IUtPCct3MiDN4EC9xevx38Z2DmBD8lxV/82DwwzkB8MUj5HbOCrBwC
 cZWTI82d2uW+pkSTjDVxINf1Iz69R828ZZ/fyI9+ppjYEIy2YjXfc2bN05AvKAwFAfyga+M3jPp
 DHO34+DHfS8vSch8JiAoXWxdTEpUgmgRMHUPB/GQuUgeSZIa7JJ1sUlaZVAj0QXI/Vj7XsTqsJw
 ouSXr6TqYNGbk6zBv6K1ky/T/pjFeyvsMLRIzF1aeuHRRhSb4sQF0kM4RTggcSybQRP7KrAGIMe
 PHqA2OlAZnDjJVAFhgw==
X-Proofpoint-GUID: MQWapRlxnd85-AQQJ8w_GTBS2m1AY0jI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX0FsFxN/bFUIf
 7HuP6iaMlVwni7WDD+c/cSk9aCqRIIEMfjDq+jcnuRcXo5fZ8FvBEpJEjVEC6XRN7Qk5SzLHrBM
 XIFaY9ec5Ononzf0j4+z7lok38uELaIM9eD9h/QMjvIfgAZae5Hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244431

RPM 6 replaced the monolithic __find_requires/__find_provides scripts
(RPM 4) with per-filetype fileattr dependency generators. Each file type
now has its own macro pair:

  __elf_requires / __elf_provides     (ELF binaries)
  __script_requires                   (shell scripts)
  __pkgconfig_provides                (pkg-config .pc files)
  __desktop_provides                  (freedesktop .desktop files)
  __debuginfo_provides                (debuginfo packages)
  __metainfo_provides                 (AppStream metainfo)
  __ocaml_requires / __ocaml_provides (OCaml modules)
  __rpm_lua_provides                  (Lua RPM macros)
  __rpm_macro_provides                (RPM macro files)
  __usergroup_provides                (user/group entries)

None of these are appropriate for cross-compiled embedded packages:
- ELF deps are target-arch specific and would resolve against wrong
  sysroot libraries
- pkg-config, OCaml, Lua and macro provides are host tooling concepts
  not applicable in an embedded rootfs
- OE already handles its own dependency tracking via perfiledeps scripts

Suppress all of them with %{nil} to restore the RPM 4 behaviour where
OE's perfiledeps scripts have full control over what gets generated.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 1e016971f5..71d5c5dee3 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -600,6 +600,18 @@ python do_package_rpm () {
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
     cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
+    cmd = cmd + " --define '__elf_requires %{nil}'"
+    cmd = cmd + " --define '__elf_provides %{nil}'"
+    cmd = cmd + " --define '__script_requires %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_provides %{nil}'"
+    cmd = cmd + " --define '__desktop_provides %{nil}'"
+    cmd = cmd + " --define '__debuginfo_provides %{nil}'"
+    cmd = cmd + " --define '__metainfo_provides %{nil}'"
+    cmd = cmd + " --define '__ocaml_requires %{nil}'"
+    cmd = cmd + " --define '__ocaml_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_lua_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_macro_provides %{nil}'"
+    cmd = cmd + " --define '__usergroup_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

