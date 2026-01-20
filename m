Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D67CA5FDF
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13352.1768933893884952499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BixhfBD6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KBpqcF3616779
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=; b=
	BixhfBD6LQOPio4YQaKqCHzDo2H/SCtNj1VaZXw43rTW24gWnLOSxO1SUNFFKgF3
	gUHY6dqniS2AeQF6KA6YlNV6zVb9Zc5/vRW+D+1Cu5bler4WARB/raTZfzxf31FN
	p0q0lG+4/OANvQV3ASqTiJX0fcj3zJvIV2tQxWG1TScws0LVd4L/1w4EI/TmGobz
	DAMwX2dj8Z3WjsZcnILhT8ozL8KOZ7/uje37PLXf9+S3f2PEaS51wiAti6vYMwwE
	ca/wg2onf1E8SokFPViki0UJAfQB/cdy449JX4mEkmCWb9JdoNQz56zSDVzvdlWt
	iZI4/njR0LU34GJ1rm9HzQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukgyj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBwJF+skV8sIrqTjY5x3btHmLZmgjqvL3Qu8y+5qhhmx+ZRJicG6A7f4F29eh2xlHUkbTwV3eD2fwdtMzQFshECn7lyw6DvQfCQH+ZaCz1ixmsVYtPl0NmA9/HCDbN2GK4Lk7nK/os79kgqGEUFlJ7TdGltGYNg+cQStUrsZpUk7ua9KgcgyoTPxbbKaXYP1mJEYIjbPwLjagB+iAxMPYlQjD0zpkQU5k8HyulX9hJjou6YqXkBE6bCCjB569V1eF1nTesEsjVLD5OqwFXZCJ4rpmF6H4D542GjXhm4//i1oQlK8A1mXVvYqpNoRqMTKJwJytQnz51JF6z3/YD+Wew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=;
 b=l3R3tRRpBLEqja59THK/hvK7nQ6OGO58nYTgzGRYBwq4D5DyRZhOrEC3pDyObTgsOvHShzQ3dUCKlMkJMYhYpKz66FK5ikDv/fHEhOO9cSW1MCsrPp65lEQ5ppiJUdQAKPqCBDZDVQyVwykZc0VgHGD/vAuRaXZnLQB44NLkuP4zkKGZHagCBBx95OJiy1k7WrakzTCFV3KL4hibJBQeAmYs/NtCfiGQJMBIKCfrTT0IwMA8OSREEJY18pNj4eB2LnISNihnVHr7U+FjhZtbbNSv8c/p4jxkNFrgYJbi/3i3qY48l0mvTeW68nIalvM0DMYntSBa0h+e+c+gHoOqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:30 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 08/16] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Tue, 20 Jan 2026 10:29:39 -0800
Message-ID: <20260120182947.857242-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b83ec4b-c5e6-40f6-0232-08de58522157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r4s5ffu24Cb06l00x1xEWr5Vf4rxjnAHMN+hyBtAn9FQMupTvxmckBEQHMS4?=
 =?us-ascii?Q?hlrBZqGQ5THmJPAZUnfv9SGifCcJAUAcPmBLVaUPXfugARZ3DEK7h8uSyePu?=
 =?us-ascii?Q?GRUUMAcPk47uOtqt4LJGtUXgWWEBTa8c6eFOgE7EMJH4aL5K3iegPf89r7wO?=
 =?us-ascii?Q?d0xsXsQFSXnLZsZFEEGtKD3OMXD/lQWUtMa9gd3VW48TkIT2H335mSIdesB5?=
 =?us-ascii?Q?aMhjoTw0wKLDN5RHbkVOmHT5postL7F/Y/1XvO/6Zu5M1rNnPBiP99Pz24lj?=
 =?us-ascii?Q?fj4Qz7DFqT+PZZfFPcKVmvrxDkcZyCWATl7NQg4lGAcwwDYIR8h9IpXopuiP?=
 =?us-ascii?Q?v+dLOa25gRVY8jAW0ZjAT1CS1qa2zjpvb8eZjINabd8mqTS4jiMs8vCkH5zQ?=
 =?us-ascii?Q?pKbIG1S7vqxcbIpoc0I4XlAKPKugzoskOMsG7f5biEmyPIphMMT3jvAJGpn2?=
 =?us-ascii?Q?L+c6BjTA7YstyddCc6tt8zFI7O5gQzMVxzbiwEEuDVPV2M4uPggu9msTmEIB?=
 =?us-ascii?Q?BjgKV9BOGoFpAO0OiD02UrKeiOM8eyPKD7W3wkkjYaWahAJgDh3S581JGmxZ?=
 =?us-ascii?Q?HSW2z2msDkniecZU0xLYeWrgRfKmTLKTySIBpRcjGUCc0iANdoo+46iArf1B?=
 =?us-ascii?Q?op5xuL7tgkD1gZaHUGZBs8YIVmniaTweCw8F/n0WnNyIYzC6eIPREvkVTsaY?=
 =?us-ascii?Q?obgNdQhEI77trMER21tstqm3jeBzd49KpAQDcOEOTVk+u7OOtVuGkhgOpCZB?=
 =?us-ascii?Q?mheLnZ1fyOH9v6dhoIAL+CbLbXXQRTkQ34IdRPnBfwq7YOqBqwuURr+/2oZc?=
 =?us-ascii?Q?tRu0g3+H/Flqgfs0iMq9e7WHRCXFVkihfCs5ULBmKYeGyJMgBp7+3cFzaX/+?=
 =?us-ascii?Q?Dz0Q5EIFD40067HnkmzHc0PRnpZTswebrnNSrvASFr03iVGtW/vMChhRkLeB?=
 =?us-ascii?Q?GIKtiWTkd00Qi9e4Lk0m4CncXzTSkMwwntz4X2gIaNkjWOjDkz1XNMiMXfc2?=
 =?us-ascii?Q?NNtOErpsS+XRlmJQA/ueZxYxXqLHRi6R8fKVMK3CrMl6kQftKlhTgmtIshE8?=
 =?us-ascii?Q?O0LfQQaCKnpmHRaNoPshmBHcaYMUpYIADEPtA/PAqtSU17+Q0utaApe1MZX9?=
 =?us-ascii?Q?2Ng8+hdDn3gbAFcOSwsIo8JgtBidilKtFbtYFH7XWQptexOHsHpKDVUekdVp?=
 =?us-ascii?Q?Q1FuEClxzu/3oQ5Im0adLn/IYv25LZEi/CV+4xpMzQvuL4LyxUT/EVGLop9/?=
 =?us-ascii?Q?aq/noQM0H/uGKfXuyIW9s+L3sAxcl6z1DYObn+HSga1qdccc0vz59FJWWGoB?=
 =?us-ascii?Q?oMpWx4mWyAF/5fiPd56fRLkuf6xD7hB50N+o64tyr817+ZdZmmc56vC+M8oM?=
 =?us-ascii?Q?+IIin4fC0SlP1cnLws5VWazTcHuCedlOqA3ysaZXPvsV/s0xeP+2rxaj/d28?=
 =?us-ascii?Q?Y9tGPb2vktUuNbLvQ8ghciBfcEE4bS7CPna6bM9fpAiyjOnPtmBHKwm0e2jG?=
 =?us-ascii?Q?IZCfR+Gh9Eb+/H8MrXhN49mOtAKXTpX/I7DC6XyTko/wllCJsVd4u2+j3Fgo?=
 =?us-ascii?Q?187BRIibw2he+xfI23cgX7MwrJ7Es49LYMQUpccwH6+wYHF4TEJRl6ft2eJh?=
 =?us-ascii?Q?c2YY5KdS6LEA3p5gqW3iGbo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B8OrUsvcU16oPdYbqtGXbE7ai+YuecOgtrue21aK+8UlndVS1AlfoxlnZqKk?=
 =?us-ascii?Q?6IFiKsOYUhUlBp6pta677CdtQH9JhKggUJ7CdDSgnxqVXg/sW/KCSkQDCSAG?=
 =?us-ascii?Q?zzVDKGqVPLVallFd5QPsmltQDg01sWXH3hP3Tj5fXrD2A0UhHeRQ4UHXxrYC?=
 =?us-ascii?Q?7KdYVmWFnlKh47yOsYno6WmJqW+O7PXAjXeCGjEBlKaa/bhbbdEcDUEqiMN6?=
 =?us-ascii?Q?pm165uGyXeC9z5Cr348jz2TgxqyiCGapYbHYtT5siBf2AhKWf3F/AmaH9nC3?=
 =?us-ascii?Q?O+vSks79G999wy61gZLaACjB4oSMDKwJ7MmSnML0kV3AmvysFyg0T9VpuOgF?=
 =?us-ascii?Q?hV0Qagno1aXBDrlpRV8ul4vHsq+BJ+0XsM3fzI9VfCo033jW920LGMVqB+JH?=
 =?us-ascii?Q?Gz+nIkmAmTQZCpZ0nBP6bSJB0JcNAbV2WUQt8BrQQSU7wOKmNoAEsnNIbqCH?=
 =?us-ascii?Q?UOnNkIhAMEKdgueDKy3x9R9kW7G+af4gve3EDwS/D2zamyi1owyB3DfHL0/D?=
 =?us-ascii?Q?d6XkkGqttAR3I5kUU8rwrPUrnehh7kW3Jf8I2H3nM6iFa0uVgKSWkm81wf3L?=
 =?us-ascii?Q?2bUvF3tYApjqL82v4MxWz2PA+9ReSZNnuNeH46RhQtoJ3cv/lejcI/SZCFCE?=
 =?us-ascii?Q?JUNoXxd9N3nI/xJAU4RznK0zyzjb7/fSnjnCxn1q4M3QJwYmuBL9Upf8kzUd?=
 =?us-ascii?Q?oo5fCd0+6hzrOmotRsI8GOYUaURfxhT/AIb9EpSZLPP/G1G8yzyjdI5u0MEH?=
 =?us-ascii?Q?UJGWu8Q0fZDKC10n8u4edfRdlI1eFFFC78gYOEkJgYqia8BPhwyPyAVMHcjd?=
 =?us-ascii?Q?xaStR0wGAd8vOZO/GdfTgjgoyzVylqh9KvIwKcpKtXwlLt9/mxMoFjDT72RY?=
 =?us-ascii?Q?W4uFAyHQZicz4bY0xGnUsPbE3Zbm5dFq1oXOCAsIWz1L3/GrblNy+WcgU3ZI?=
 =?us-ascii?Q?ucBMsmAf5csaGhnRQHX0Y5nCglEOokX8rjAOnxdNE9W1JbuwP5Yt5rBO0DC5?=
 =?us-ascii?Q?OZdFeW4892xuTAdA/eO+lplAL15nk2CHH0Juk6ndZDHjrLk4066LcfCO3LK7?=
 =?us-ascii?Q?EYrzj3uxegfNn7L581zHqQzZ49bXC0EbvMPje6KfBOeS9MiRoKwyq7Ch+n32?=
 =?us-ascii?Q?TCBoL1NQZWAwiA7+r2n2JCGRKjKNkVHLGWiiZZdpznk6Rx68jVPc2ZYBfgtr?=
 =?us-ascii?Q?GE0zBBT58XO3vTw0HwXYIi/YWVf+vs5z+Pp3H4GrXM1vzWAgrwKl5iCerGXF?=
 =?us-ascii?Q?TH9M+4chaGOu2nlXRst3/QloC4VgIB3Ey9jpQwe/D3g+4PcZr/JTHzBkTcyJ?=
 =?us-ascii?Q?xjymD4oUneJG9hETyPzbzyjbGORvQHzIsxcRTZ2J3ZfgmOS8WgmLciO7kIWg?=
 =?us-ascii?Q?J4w/WJJ2M5ugNknaYqUym90UUSa4GRfVLdd9QZOfru6vtBliZC21eR9O+lHc?=
 =?us-ascii?Q?pI4Vudbbb39WkGnMBf+Is07c8vfavEWHbyz3qpveu31mDYjUfyaNwIa5vArs?=
 =?us-ascii?Q?Xl9ZZfquzqHdo5hKebm+bJG4nZwrNTKlaumXcTuax4kLAK7IwecdWu+kDk13?=
 =?us-ascii?Q?6teXY+OYFHZ6rUrB1kAM0+V3p2bNz6VKE0MpJugxPxP2pPsG7Bu3h8o1GI/s?=
 =?us-ascii?Q?aBi+jHRlJ/bbEfveCM7UJM1pOZbxF2X+mqu9LBIAH1S2WrO4Ua0sREc1HVvB?=
 =?us-ascii?Q?B+KvsqjdaXiCTQccTq3q2i5GqCACr74eTUYnB3aIRicV4RX6ap5zt5VhT1+4?=
 =?us-ascii?Q?Ue8gsdzDGaY3Xzh5muINGupEXGGPYhw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b83ec4b-c5e6-40f6-0232-08de58522157
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:30.4691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25LbMakTSwXUd4wpKLKTZpdkd48mEPxdbpElYCmDS3a3eFDrTVrHpeWyyNmYqea+rDXRKZqRiMql4cNUh/YjBuGoSQTSdPhwQ05DzvuE5yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca04 cx=c_pps
 a=fOo0+MOGfjr111H4QC4BGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: T4H3yV29GeWQVTdXyxapAiCMWqvK9L5V
X-Proofpoint-ORIG-GUID: 3RRXEw_p_PQKPQWxdCP-K6gOkeNVWXZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfXzlc0B28eSlCo
 /mrSdxm6sTqk4eBnu9N461LrFArz429FgNbdW4yHSEZ4lXkjb9VVjZA3QUDesNH5VE1igrF4Rp4
 d6c/kCm0XMtTAPB2L5svJxnpM0wYRJxw8gFMJoD+megRwPB82t2X0fk1YzYl0Cu+f3yzBMMeJE0
 cajc51WDmb9E06TeChdm4M97yO7PES8HsKahVcRDbgixjJWO/RSzJJ0MI6hAGgZueLux0NRrgol
 CdHBDxP67yQN3RBETTVEkH+8+/sjD0WiIdUspCg3wD9ZaG08tqdkZDIuPTFqZiGtTkK0IvXDwz2
 PC/qCW2jzBrEZMnPfR+o1wyTkfdvjGYfPxZwKlXsqhJPAh0CIzTEYS4dg7xfpaqxepU3gyFcVxe
 Vc8JzXDWm9Qn3Qd976m8awmM1YdLkWcjHly4gBCIsoSgQ2k7T4UJw0rwJ0ooawEb+bcQHhdYB2j
 JcbcsFcrho1ThNmvEXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229775

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cd5daaf33b..bfdafbee8c 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


