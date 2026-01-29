Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9931DD6B098
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19151.1769704773881120520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Tyhd6gnJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAR4Gk3180227
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=; b=
	Tyhd6gnJ0mmhqy3KOG9UH0WBU+OZjL27ZpFpRLi9aY1TFD/4xh/AUYudXr7MTYdA
	EHKZYL3MoaBG3QT86SymNc4Dsi4Ko0m7yZ+aK296aWUEf6NC9BkbIqa4WJf1r41U
	EvtFOm4BIAgAVzFNb4sOP9a9TVlLPk3nG1aZ3dhV3YjWHzsdKwOoSAdRJzvs9NB1
	jtUAP0ok+hBnB0tLD2mJlXT8mUw14DNqm4DI0qeAON30OIukNWgDcSo0YLqf7WlO
	xhIo2NItc6/Lb1NzUOO7LRiMMpBanbsn48nfGYdPoWSvnLG3AiNQ3txnAi9QNKNo
	rITiou0i7PL1Px0iNgkUUA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwjgsvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgP6cX7CqSL5ATgymmHHCWdEppwsb2+vrrL2E261GwXXlcQqIOG1ahd8kg/O2DbAbLazerWmJhwtm5XNyChfzSmBklL89mi2G8Hrpz4G3vQP0GaHBpRMPWUSLdn5YgyXI1FxRtGpzXQktSS/BMPpYmXxRHFojDaKSmXg5FvzIzggtSsfWJpLHAcbTb4p4DI+kxwaN6xxHB2smLcyNANLS+nBgJ8BN0+RFnTEU44zjGN8YPcaTInosX/3FHbWfzArLSYDaZ2osHMG3BK/81DgFPsQA12aG9DNFKLkSRugq9gS5qzA36332LQXNu/h9onXFYK2F4Dbc1lMXhtzqvZ1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fNPJsNUzB15zY/Z7VL8Ab7MlDGtE5Jq7HXUqGHSuak=;
 b=jKsqe/LbUZFRGhOio+tNPl+3H8zLT1CEXNN9XHhi/asFQhay3xJyzIKTP2V8JWoWnj322wDcLXRBWaBOFG5PIJ1sqD0nxRw3v87UZgeampqK7GcRg8jF7k4OpOM0smijw7t+eOXqroOJTNqasF65FG7u/iCvgYgAxttew5+hp51uVmiC3aL0VpwcEZvLPMkVma+7iykgAHuL5tznkHHZ8R8AwcNP9eXS7/mab3ZqfmHkhYVNs5YwoAM4rfn0c/B6yb+L5y06FMaasxmluYaZNEB8tcAC2Fm4SbXrEnzRj4k+b2DNdFf835CRhxcb+oMqoNbyCf4Dr3GAjEK229kiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:30 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:30 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 03/15] kernel-yocto: enable Rust kernel support via 'make rustavailable'.
Date: Thu, 29 Jan 2026 08:38:58 -0800
Message-ID: <20260129163910.2612040-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: aa22219b-fbff-4de7-d3a3-08de5f54f97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HAMThlD3OjeVlkEFSZWIRWc9vwnI2qN+bALUGibG1o74DisJeXrrHYw+RqFv?=
 =?us-ascii?Q?h1wh8P48092LDN7LvMcxkUlaueEwPKvFv7zmOKsLuH0CSVT4Gja9LAH4/g41?=
 =?us-ascii?Q?T58Djaz8PaNSms5pCwJTdrz0jZta1+dcjtiCwJ77MilmGEvecuShIq7Q8DgO?=
 =?us-ascii?Q?2TOffyQfIMGup6tru71uTWsVVqwGWYsrJYX6WT5UhqxZO7t8NKz7REPFLsL7?=
 =?us-ascii?Q?wARniGBkO2dRLExn4h0NRYqh2MrMXGT0qxAvEjgsXA6qdlO0zGwNCrvcrR8I?=
 =?us-ascii?Q?lq1phJVh6WoPlfzPeew282kwxL8GNROhWHCHhyQ2UInDYGpn2GBFfx+85U2l?=
 =?us-ascii?Q?8zQT3DD5leBa7Ey2CM+3HuzvCQFsm5mRetNt8wie07RcrS1ZlEO/NDdnyRP3?=
 =?us-ascii?Q?cx+5NPrgo/9Ey19r5flHqljtqdcBvIb09tuV1KmCDfh2HVq0k6PjWR2ZLHfD?=
 =?us-ascii?Q?Gv9nzL6vMICzxQh5YrlOUeVXjAJkX80BbgsZawEf0V364S/QGtUcnGriL0um?=
 =?us-ascii?Q?xpkyCTWqCWWPGRt2uXO6IdRzFlQBV1HqpeMajHc0UGjYidFyvCTFPqQvtC6s?=
 =?us-ascii?Q?8tvrV02seADhrnUSPhUlTFnJJD/sJsu/qDs7tlhwCDScDu14ky6RsD4YQLRh?=
 =?us-ascii?Q?PdN9A+nSC7Dr1IoyMmKYUNoQNx98zb2IODclwUm3WR7iTiRGiSE84hVLwtC0?=
 =?us-ascii?Q?skAHYQljhuMOvlaV5GUTtrx7st2oWuWlqfGZEHtzB9tQopESvLDzXiikvPWJ?=
 =?us-ascii?Q?Yr0f/9ZBrreMedRIZ8+h382c0+M3N2FDVmceK7bj1XP+T+aNNi3WIZSfa36Q?=
 =?us-ascii?Q?b6VGHZkf+FEu5JHZfT5eCFwz4tv92nr2wiTwGdB2prjukng2TB9pQJMzUyWH?=
 =?us-ascii?Q?8jXEVYfZwUAdGGjoTra4hbMtmSIoUDkvGbO36lUlX/BQjzZCO5WGfje9cFF/?=
 =?us-ascii?Q?j81CqHU9Z4rw+eI0/dmZZCTFBd49AjXy3wCQBe2S6EtQU6P9EoWchTb7Fmiy?=
 =?us-ascii?Q?j4F+yu3W3z+5r1l+ote8TCQgDVkPPhAmR55Zk4geebhH3vsgV+1wtKSVP1nu?=
 =?us-ascii?Q?pJCcjIqyqxcR/zzf0iE/EHfyowHnuCtOMjFxRENeoTG/EitEfgSYFypG3RIl?=
 =?us-ascii?Q?6A2IUQVJrq00RwQmpyR6YJXsd1mx31Sv7/T0A2YEbyi/NOObSOJDLRtGgXl6?=
 =?us-ascii?Q?1pQIkiMH18lpCR46JSUgfJRUI8nCc0gz6CmRHx5ayaXVz0sJ80dD9Suu42tT?=
 =?us-ascii?Q?R27adeFbt6kGxuvOBtf2Rw1Vr0fXG6hua6/R8MkUZKFsW388t9/3NP50SbcJ?=
 =?us-ascii?Q?BDAAOi1/h2NGT96twnPKsWYgUy3BQg7I0zDUGmKnu6bnow11gGmhSGHXRWpX?=
 =?us-ascii?Q?pgp9dLO/tCDNrAQtAMIPXqYAmYRCKWaPd8fiiP5WvR8a/VVXuwMZSeLGegrG?=
 =?us-ascii?Q?zQZHIoyiTmxxzNNmN1sChtAw5naSkParMHI2AR+PrugcAkVRk/qmXzaUomUw?=
 =?us-ascii?Q?dCr1GGnIlv7YB14H+mjGo+AbJRwTxBZy+38tuY6sGULZr99NxCQMGULsX+CG?=
 =?us-ascii?Q?Bq9oxwaZxJOVjc2fwcPjzRtDOvuUg5O9qst0PTC0SIyPmnicSO4G9EnUEbR5?=
 =?us-ascii?Q?mqgHfnYNqIUFV3sbRmmzV0I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u9PNpGzJIwPC86ClYe1vnKdf/lM3864OyQMSiwrZI1ttz/zokH6YAaPOSpu9?=
 =?us-ascii?Q?eS2D5/mm+c5gMtqmdjkzrBJ3r/Vbj9GRh13fdiNTfP31yIxh4uOPiU1xzykV?=
 =?us-ascii?Q?rrwo9LzUTDyxpHnNqzQxT55eLXHdZZbSca7W3Ogem5vnsy94etUpHiqzUMss?=
 =?us-ascii?Q?I9lRTMYC5+W84+9GannUU0LCOoA3UaBNDzLZeCQ7bbY0Jnv9QuB5ndKM/oGE?=
 =?us-ascii?Q?j+aBv+w1jHOlXc0zKqSJE+YJwbxDZJuxxqCgNBDhERnizB5A/EFa2KV6Xu2P?=
 =?us-ascii?Q?AwDPHpDrm8eKA84sdfmF6rTDGaRqiHF4vjLepMEYN3x0Kahc5F1baumG/UJr?=
 =?us-ascii?Q?v84uqQ+XzBbQEbSimfPuSaoQfCuDovIZPJKCWvxRcRVimxrnYAa6MnHtA+Zz?=
 =?us-ascii?Q?Q2gq56d6xGvl3MxSMtqQqReFFQ0K+jvlwrJM+j0S8p777KxjLo5poLKIQxic?=
 =?us-ascii?Q?jOwtgG0+Fu5g4PfmAvivZFaVFvVUgii4jzxrW2+bVY5XcR643DQ9B9KSzRIV?=
 =?us-ascii?Q?wYb0Czcv6A1bBw1JNmOwBoawACyyanhwjVIyQigLZbHewGHSCjjar0vWXC80?=
 =?us-ascii?Q?k2+xb17K7YHr7BJv5DsYufutyoq5LLjx4d7k0B1PXXQNZOSdsdD01i3e/9k9?=
 =?us-ascii?Q?RXmaC38ZETKkxm/kWzv7i1Ci3ZyUUruvPYQPXfvhKxjJqTekPfzfqyNkstd6?=
 =?us-ascii?Q?g/nzUlz+REwB+akzy9b6VhAWssJ6KXzjE1mEK/JydmkuBkhCv08dd1Sqow3w?=
 =?us-ascii?Q?Te3ArUXGb02HQRjHhHaCCzC7pmaHKi48iU0Q3xI4Bz4Unwnpt9qQfrUytwBE?=
 =?us-ascii?Q?MFXtbAyH/cszIXW2oNHze8uciwcBmVcRIOQ4K/zm8eBMG2JMALlvtOC5pB4W?=
 =?us-ascii?Q?WQfW4OV2ZYR7HPdxyuwDMTXf3pHRww6h9Lnc5KukhOkzMh0kGTsQbgQNqkmK?=
 =?us-ascii?Q?qahUXpS8FcS63JSekWryQNn13cgRTVzkDmFCh+6S5yKiA9l9buwemF0PwO1c?=
 =?us-ascii?Q?ZytW/ETHqCbkTx9sbP3j13C927QzTEFdXg2fXy0EPVC+wQ/Mpu4IJqIV3gNA?=
 =?us-ascii?Q?K9bIz0P9Yafpx8gKzYEKhn5jofdoLZ0AAuaJBsmCGEjx+SXjNCHNMBk7EC/o?=
 =?us-ascii?Q?LceCxXDZE6aSmvqK2edIoHXDZvMVoPxUgy7GM/js67Q5BFxVL4LrGSMzXrQf?=
 =?us-ascii?Q?6yvk4wyXbAFZy6ch40YIbXrq7vd5v7Zrg/4suU5AEUT4CwZkstGk/hsMIw+W?=
 =?us-ascii?Q?eqKGlJ2goRl/4ZyfOJUf2IKFc53OA2dUUkIyw24bp/v1h196twlv4LqGzKzj?=
 =?us-ascii?Q?twKEsL6jgNPIVvm/Tn5WTgWgV/Duzm1NWbYliLD5Dq/Jwthmn7XR0gMcuuIU?=
 =?us-ascii?Q?lZRupx32ezj9WhqnndbU8OX/P8V7iSXyW3xQ399Bt4Z1xtGfyYHwncRmLoKT?=
 =?us-ascii?Q?ZD3nU6OCX4dvzzx7jtbawzQRpWNl0czStZlf3dPYPxu4IgifPiiUl3F+wsSq?=
 =?us-ascii?Q?F/ok+IIAdypHVWHBocw3b9+sLKuW0K+N7YuYQFMl8EURkCRQwWdE8u9HzPR6?=
 =?us-ascii?Q?NKdlKkMKzydp2hLsfavt9OI+yEwwde6DZ/eCW8CjDcHOwcVKQiydeXJbhWpN?=
 =?us-ascii?Q?IAQ56FuqA2EG7VGmGyDV2L5RdQYSPsXpIyfT4rTg7LWz/gUq7hj+Snl0irkj?=
 =?us-ascii?Q?jZp00dYBEuLlW4TF2OnoSxO8iChjolUCRhOiGLZsbveMAZcbLtKgs1MOWHz6?=
 =?us-ascii?Q?TGXG1OBezAXMXURgZ4MCYvKmHKCDgnY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa22219b-fbff-4de7-d3a3-08de5f54f97f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:30.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxIurNclVkDre6KDDwuVbLs6f1iA3C0ypebPgN9O52kytyLbnmKnLSkXM/9qCRp4I3GJjSAfce/ipVSvqxGpxTfiNiHaMfRthbRrewJovhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX16WRnnSpFbSJ
 Ivh5PTVgiR2nzWMn8fGsGwmxvC79XNEKIXt2Hhiqy1rB8T6ojz6eh9fM0oh/HIcWQ2LvFvd6DYh
 Hwy7sSM+i35nKES1iihA5+zHXdUCaMObWV2CK4wTo9TmQkW4ItNRkKbpDCpyOD5rG0QTvw2d2yd
 rUKy8fJ81jN7h9QvHRYOmy9zdHUsD54CJD04O5J2hrziURe9mOtXCTQAYdA00cu4r1KUe4IdN14
 dzNzwiDImTAwsR7z3jmfMjFtZwyH2XNSxFS4mFAJ9tdqfNqkoGg01aAxC763plXOJFqMfUFFbEN
 txAGON1JI9nTO++kp0hfifBRKuQ6RVDDdsI37pMtw2c75h5X48B1xb7dVN2v7TvtCI8kzmXll26
 oKla9PIB/5ziXYlSfTywS24h97MPeT4y4yVfqPnI10aVoO8K8H38vE6I8R9BzpaaYtvydB8/JVO
 eq1mSUIpSY34WT8ulow==
X-Authority-Analysis: v=2.4 cv=I7hohdgg c=1 sm=1 tr=0 ts=697b8d44 cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: on07Y08tXIi-W67upM4lIC1TZ2Khdusd
X-Proofpoint-ORIG-GUID: vyG45M28hBBH-GSqcv2CRD0KyWXOL11h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230143

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This change adds support for Rust-enabled kernel builds by:

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..4323c4c80a 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,8 +463,14 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
@@ -506,6 +512,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


