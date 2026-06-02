Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438BDCD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 16:42:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2805.1780418519438755861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 09:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fy7vHnOz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06130d652d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652D15h31819687
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 16:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=c1q488JCX
	44/XceKUUEaCeVL7b65TFm4pjDhD9lEriI=; b=fy7vHnOz3SzgOrYpo2rgv7wC1
	Os/azgzu5DKpexQEzMQRp3P0naAyTWcVprDxWNuhbkAdBF6r9RPlyj8V35niCyO6
	0GfZf5i5rqq31UE4hglttl+xf999TdXMZAPlRBSF9yCPeTZoiovKj5rw+bK6YUJJ
	cDXyG1/gbcdL0ygEtC3Q3kSSyOgsOX3HEFXTOkzmzwwSvHHCFEJgphs1aAobZ7+H
	4YlYrDnudYiPLupKIm67H+7twFSjV7/BmUpkk80H+xPvml6nTGaFuSbezlaUNhFF
	LAGbMa8Np89MtL2PWSk94Oce3UHag3RWK18nwXqgSQTCe2ReLYVHHvROIJ95Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn4056bk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 16:41:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=py3kfpVXP+aR6OH3mDSneysxkrXQeehj4UR6AnBtnGVyYkAqEtBOBvX/TTeXC2b9deXYeJZV++P/vTaB3s8tPnpVQPPfstj79JASVlCMsJo3X/58+lI54hhKquk0w8S4D0VO45YMvT4EUlLW1ZbbiGdc4w3Wt73HGAIN/pS+8muJvCkEL37opjtyomW7wVgT4HJ689gnIPZ1eJfDTpVxBWXwPw1ax2w2AoiTT0j95Gx/OVAAkPONbaXqX0hB4ilGeui3EXP+AtYEOC9s4OD1G1zF3ZUbPQQNKj6dbeKLmb7H0dF9fAd9rd9/WGOQmTJ6/ucNiCy/aVFD9ToZIhTJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1q488JCX44/XceKUUEaCeVL7b65TFm4pjDhD9lEriI=;
 b=kxVsb0AFlCblkDSDOYNv0KyUY320XE+fs3OCwOzNmCSGqzz2SAVEPqMJ4BzSTf/tY/imjk7UE6pR7TL8t5cdcQzi2YvpVI+nxRivqecZUJgpRkmocN2mBX3ALd3lAzD4RinR49eR3rt9IJHlgz0p2dPknZ88IOiJF5WY3QVo/i9qHYa0Tu4fJO/Qx1r+8XKkOArRr54gKUFSpWngUZ3n4nZuXfY4J8rvYBufCWk48YgT2a+hWetzC6myzLuCl3lbC1CifMRsS5PYD/dH+jsROKaigHn7k31y9USFkEgPnIUbj3zPWHrmzkr/Q09pN0Pk8HBQHdUxvv8R9CW3CP7kcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:41:54 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0071.014; Tue, 2 Jun 2026
 16:41:54 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, richard.purdie@linuxfoundation.org,
        martin.jansa@gmail.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 22.1.7 release
Date: Tue,  2 Jun 2026 09:41:36 -0700
Message-ID: <20260602164136.508127-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:408:e7::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f760658-f13e-4273-c996-08dec0c5dab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|3023799007|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	fObE4uZvjUmHiLRNFMX51fC3RzUtTDqny5CixG99Pa432OWEtny45Wbirn36VDHANKG2gnosKaFhPeD1TyF8RF4stwDavP/0UdA6Tbt1/jmCGoO+/iFGvx1/mPqbYfVyyPyB5ceGMtuNM7yj8ligtkR/1mybFU8VybrEeKI1Y2VOIU5vhCQqg0IjORAJseSI5zwnpYbOEhS71enk4rmlYR17OQyH3Ilkna2AWkKK8V3MqraFfjf+RRw88GeED6KkcA65X83H5y1DmzkNvzl6legvsEc5fwFZshETUEGykltkdWCoQJaW1IJTrgLB5oyQybXvT9sxf8fzY+BegBSnWd6NBoEkP5JZU0kmNHwalBKab5ZLNPum6+2FoGngoSJaHiBfhbj8Bbbr+CloHcZYnYFO0f4jsTV4c4UqvlBpCyYtCI+f6n8Ban9Q5Z3VVqMGCd0kN9BqSWFUu4em7hLvg1NzIys+oKhn2V1vOiMOnsL9zeq+nueIwPS7140T76ZsOH/HxPbuLjTrXx1K0B5qVUTcABqkeigfKzS1fB8+W/Xn9fn8QvqQ/jQ0O5+EkTs7ALpv05OKWl/5kV8RLNlDgDHOiNqzA4xFz3f88F3ZY6qKGN9odD01KwxVhTkoz/BLIixjBB6ULco8+LCriOUYKBIWh/HvrV0ylHkM5J5+kPYjHIgmy7DMXWxgPTLAk9m5mK+F22pttx+wbkRlE1n33eqxI6g7KZ1TDJ7u51aCkyy9352ilSdp3dlIudXpC+Mp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(3023799007)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5NRujWtWkmXST94WnAwb9bXjJ9ovTReJ3ZD6l0TOkTuipSy+3MEG1v+xe1GW?=
 =?us-ascii?Q?LGz2QdKz3b00b6qTY3fVo3l4D0UOK+ITaj4XePto70DTvvWzMWbkc+QWZWFs?=
 =?us-ascii?Q?sRmWWPSl4r9jzlXQAJDcnL1W5HaXzI3tBawRJ1K9VrCH7mFVfet+EyUm8lxZ?=
 =?us-ascii?Q?7EA9q5xl72c2AsAxpjvx/U5oaVISosYQJNk42Zou2zOnb4HCtkbo0LFgK4An?=
 =?us-ascii?Q?BCGhunzTebRF2kpT8o1INVrue6UDZIw/i8t6ySQjHtGTyhkvuanlEmRfeijS?=
 =?us-ascii?Q?Zx8GmnL6/QRSrpD8zSdMOdpiFfw+ng9cLMJq1cUmcbDVb0bEkIyESHGLARJO?=
 =?us-ascii?Q?ONo57VFMlYBHqpBDMG6BlIy5ASod96riSQYL/rYNLBiJ3x6Gfm181kIXPjfx?=
 =?us-ascii?Q?9W1CndXSLR9X0Z90hGgvKo8fJjQQ3KedAyC1Cw0aI9fUKg6B27Xrz6dNWUIa?=
 =?us-ascii?Q?8wZ/V5cggALZ9NzimyiCXEpT9+2G2HQfrZtjjcxAuapISPQ062cDI3Du/d7w?=
 =?us-ascii?Q?r2/mDm/Fss4HwdNNkNyMT4heKnNtgqEWtV/WpuOIcB8swyBfncbNyDpf2vhd?=
 =?us-ascii?Q?cMX+XRR0vRp6OB2TtRaANe/l9+pjrmtb7ABAkB+exJO+R2WZU1IQjrrJFoFC?=
 =?us-ascii?Q?GbIbnutPsItrd1OyNojUdQnFmqmWK09memtRjwJW8DuuEydyV15SsmqadQMb?=
 =?us-ascii?Q?2ZbSxca8ChBCeY7brcU4GQp3CJXcZd/hecdMx83D/X8ls3xE5ojdpLQ98NjG?=
 =?us-ascii?Q?9r/xtw0pOdm682D1kTfnqoCuzBc4m8smCOCw+44v7VmV0QzAeDpKb6YxK2/6?=
 =?us-ascii?Q?etPvhj4khwjcKr84DsdeYNkd28LjH6usynUmf1Uy0bsHdhvFDJ1zDSv81qGA?=
 =?us-ascii?Q?AOyRa0+7Gr7e9pNsJiUDD93RO/iTU+4PpR0Z0PuqxkqdAN3W6euVK1gJUh6Z?=
 =?us-ascii?Q?l4nX3GZITuP2uBLTaR4p+yrOP59vn7szBO7an74XZ7s7b1iwZlq7KccGH5N8?=
 =?us-ascii?Q?sEthrHTYpO7NBLTem2GVjz5L0ye/9b6ZVvTygmcPLSNJEmRAS0SgKLNl0hVG?=
 =?us-ascii?Q?LINyQv7i28MSdJ/jFuyJvxpBvRNdWZuFhFQ0OEWtQYHPRFBMJDod5WirLVIC?=
 =?us-ascii?Q?9F9SZI78Zfd5xnXiaNzUVT1YOSecr2LtePc6/icfaa0TcVWck+Cm7zaKTnLa?=
 =?us-ascii?Q?htAlKgmdklUQ2L8bSS07MJyYARWIWpcKbRc/85fish+dJd1M1PscqWCsUex+?=
 =?us-ascii?Q?2iGMqWCiFoIJrozIRPJXb2AdMHPwxsPpTUCIM8RFA4ndFHUvYwC4oPdpelZ7?=
 =?us-ascii?Q?wsM+fBMp31zYi6ivVCxCHfic87G/0fO/NAvaLubNtBPwnUjb4mtjH0HJLeht?=
 =?us-ascii?Q?wlOoeDLxzAp64MB2NVQt4BjDtlV4b5zX7u22wdMDvy9X1rew+liJHZF90j04?=
 =?us-ascii?Q?Qqm5jDKIChQUGAsjL2tYg4wZd12axJCAqdAtcpQ0Jesd0U0u9JU0elDNfvXx?=
 =?us-ascii?Q?7EmVnvCM5DFM/RNVtVuVmaGrJvld7AnAeuSv1nIDPGyPvQ/Ry0OlmWuy/Kv4?=
 =?us-ascii?Q?Ts7Cm3B3KGrlMj3v/b897mgvySbRcztRLoChPK3tSl6+megG5tWEezJp/Mr4?=
 =?us-ascii?Q?3vls07ghFG1yczXNCgZHU1gsJYEa2sGDxCfB6zKXHucVUDnHsFdOSLA5moh6?=
 =?us-ascii?Q?yzogOtWxSca2d5aZ0sBnBWq5Kg341xNznNOsebmFsvEuZBH3Y1A0ReK1EKq2?=
 =?us-ascii?Q?PH5Ntwxd9iD4blCrXAx6rDIdowOzKs4=3D?=
X-Exchange-RoutingPolicyChecked: 
	ipkw2F8yuGuzK5RCg+Qgko/zpfLFHpq1pVrVzGhx1vZemBG4vUruyBId36RcP89DzMfcr3QtA3LPUXYW07LhnRlgEc0WuiVYNaT2nkm7v9LbehDyE/wtLGlv6g9LfLWeQbRikYhEBpfZ+pdVBaxWPWCTZyGjMRw+d8p7fWOYpsZ4ZHJUiYOBKSfYeHI3noTAdMVPRGtMwSP0qSu03n5zhYWmBYPibZgTffMV/LQMjL/2icgGnJBZOGVUQ10L/wqGk71w0VMvnqAU5fCWZV/8722gVJmme/WglHX6rtdMSLaFfhVlIEYVgOvbN4JL8cRC2wRY0553+CX1KEWboEfd9g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f760658-f13e-4273-c996-08dec0c5dab8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:41:54.5676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLHmmCnWvx3obQKqG4QzZWkZh1gnM1n80dhbQzwiygRWvtDbA2mpJ7ZxuPY3WDB1jQFTqq8k9EFsc6BcKBhJKZ8raplzteKApqzt+Kr617w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ByhrDBncCOeahNbIhSOwOiKVDdNm17jj
X-Proofpoint-GUID: hTaBq-tylpjq5J2AnObuu0mE2CFyQcvg
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1f07d6 cx=c_pps
 a=J2EZj3tNR0Bt/EAJeTok+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=C8rUU9GRYl3giSPTkMsA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MCBTYWx0ZWRfX12sHsdCjFbmU
 UWW5FUb4syFouFE3gyUUp1K3WM9A1eAbrQjmeTAlCBEm7TakLZpgE+apAtxYNHW3p6G7G3amhuZ
 PoFpUa5YcHBYWzNwXSVwDxDrwgolToAsCivUrfJS9EQXkfygJ+j1bdqwy/JyVWrHaWfp/sP9F6F
 8c5JUD5wGcn/5uaA6d4xfySn9dL/ood8E/avEW6VWTkFDIWeV9ocWsNdETfbcKsHoXaAyybUWVD
 oBivhP2yWEQg29FtqnH/1/eoNyLDLo2jEFa9+h2sQ1TraCW25o4EHRCNokXIWQ/h/QOd01gTX0p
 b3VDFZxTF4bQLKt+8mqqW4MkXmPRZLKrEHUSj/TNO6AEoHbIIHOK5LfOTk1yj+uUdlpqlM2oYtD
 Fy6Sfq7/aJGjXwg3bxR367tismMG0fhiTyXeZ9B/Uittdab5g6u3j+Pc9APAxpaVvHyEEMuY//I
 GZRj/bcg/em260u1skw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238065

From: Sunil Dora <sunilkumar.dora@windriver.com>

https://discourse.llvm.org/t/llvm-22-1-7-released/90961

Brings following fixes:
a255c1ed36a1 [WebAssembly] Avoid crash in LateEHPrepare with empty cleanup pads (#200322)
a2b779045093 [SystemZ] Fix off-by-one error in backend (#200141)
2615295c15ba [libc++] Fix multi{map,set}::extract not returning the first matching element (#199703)
a760d7c07024 [LLD] [COFF] Fix handling of immediates in ARM64_SECREL_HIGH12A (#200060)
294ae8d1e62a [PowerPC] Drop invalid range metadata when lowering i64 load to fp in INT_TO_FP (#198705)
6db0725886bb [X86] lowerV64I8Shuffle - avoid lowerShuffleAsRepeatedMaskAndLanePermute call on VBMI targets (#183109)
c43c9b426055 [X86] lowerV64I8Shuffle - prefer VPERMV3 byte shuffles to OR(PSHUFB,PSHUFB) on VBMI targets (#182852)
6ac68778a76e [X86] Add test coverage for #137422 (#182832)
ad9524f38657 [PowerPC] Fix i128 vcmpequb optimization for loads with range metadata and small constants (#196801)
48967cc1a0d4 build: adjust LLDB and clang library naming on Windows (#185084)
8798085803f1 [libc] Demote compiler check error to a warning (#198033)
6e5effc4990b [LoongArch] Revert "Add patterns to support vector type average instructions generation" (#198306)
4d5dffb59420 [ELF] Initialize Symbol fields in the constructor instead of via memset (#198129)
823afe046164 Reland [C++20] [Modules] Don't profiling the callee of CXXFoldExpr (#190732) (#195983)
e624f1204282 [CoroSplit] Never collect allocas used by catchpad into frame (#186728)
81c69e140401 Bump version to 22.1.7

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index af4ea1b14f..66902616f5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index a7934951e0..1dd7903f32 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "6"
+PATCH_VER = "7"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index c77c39d47d..3e171624e1 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2"
+SRC_URI[sha256sum] = "5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


