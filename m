Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E78CF9C47
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36761.1763652431470629325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n3Y2d7b2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKC7Swj2707645
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LGPw3r0tZE5BcnmFCrDR0SHBWMPmo2d7trzyQ6B0dMA=; b=
	n3Y2d7b2FBB+P3IQfLrdPduJA0Fk1GTjiB/zsuqAbqhYivDuoriLoikcHyxrFfzj
	XPigEh2BV9FGtpKzyU2uqkaEXaUBPsDyNGY0jVuGxSkcuaoxW3BQwvA4U+bQFC54
	oI3dITT7ntd/VTNrAa3XePtv5fwQYJ8oLHni6MLb1tgoG+x2pg4zBNosTRKs25NH
	XODQDwwzBSUBTUPCBqLGFnvYfvIrOOwi47F1sAVoG2q0uTVlF2WTLR8xVJQJy2s0
	GsrygTrGHx+lINbTBnb2Jo3NohInDtqwJRpaXom6vr7SReC2sjxay/1OUzI5dwxb
	mc7WZ7E1f0ZvTgW+22az9A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3rrnn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 15:27:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2c8SwrpG9LoXAts6SmZRbF/XZkDirb3JB27sa2ZcOtIaz3HUbja+aOXSq0KkmStNWJp8YhkZyTwZwUtsHdwSuT54rgPrNSLp46S52wsMEaQyPbYovyd6nBeW4vh0woDoVAe6Hn7toHB5pH68n4zWWTirtigOlr1cjAa0CS/JyIriz2unFo4RupB8dCLlEVht8+iH+atFJxSjTXOzhiz48EIa3IlZWMep9hcHOuDjk1AfR9hFXrgdy7SCiFD06djvIMKQQoVyxySqnXMKeywxmVepCza6Sgme5smO2FVoBAMUwgyCBwzioQxAMXUkAwWieQ8Y2IBy76iAvOLl2f46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGPw3r0tZE5BcnmFCrDR0SHBWMPmo2d7trzyQ6B0dMA=;
 b=Oxik4T9+sB7efOEwC7N6UYjV4y26ZF9IlmDR1dQhDtGwFeyib4dzooy7ooxPqq5FdnG4aB1mnV2a5L6ABniAoJRvrYlVhprLKlyPWatY77tFTOGEvFmKAP/8vZ5p9tU7B86CE6KccrVG0zNILGX1MqkGGUF/6F7wV9y+hNSkfk/hmPusAuCSPqC/4n0vn+9uG06ULpUhBjQgDnssRFJBpaccsgC7Jkg9ocmjy6QwFI+UomlWmK7oaMliYxCsdY9k9GO7K8V1zJbO30jEtkzU+RWvr/a/fqtjBuJZ1yjgj7gTEwH9sJK3mzRGKNfZv5KCd84Kw2By7aQGGRkjkzP73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 10/11] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Thu, 20 Nov 2025 07:26:48 -0800
Message-ID: <20251120152649.1128685-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2f3677-ff7e-4e87-93e5-08de2849446f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l15YZjeI37nLdBxVEMI0RxiUanIdiw73IYdQH3BTAbxawW77QAmlJKfHeO1l?=
 =?us-ascii?Q?yJGbN7ybdGwfM7kqDARChJET7G7Vd7oTbcisSvjpI7unZOdWY+0+c7rsSQxk?=
 =?us-ascii?Q?oswX2lkyjQnziexJr+ntGuOVvsPwT3ZgL9RD6FytxBLEoa6KagD5F3du/u82?=
 =?us-ascii?Q?FvxbOsQonhes86RmQZW8mKqiAO5rvPl0SbiOaGV1jNsb9+gsamMqMvU9N48n?=
 =?us-ascii?Q?cnYDnSXQfozjjZ8nZNHt0Xgf+C4zxw3BLdr2tf/CNgRyT3XVLHJTGuvEdyfE?=
 =?us-ascii?Q?BIEYzIp/6xAaZCZ8hkb7r21gdRvikFmYISThNvH4pw5yqB1uM/pot7mbUbrd?=
 =?us-ascii?Q?2b3xd7EGTGCGMd4glGhLwA+y5tgLNXLvahpSwwWfNyQyilkadwStFeZG5B5n?=
 =?us-ascii?Q?H9L0wsGpyy+ZNlu8KJUmvWSz1PmdBP95isyhcrUf0wcA0ntoRIJQA+QuwDw+?=
 =?us-ascii?Q?MuvxYxRFb1ec2rtsEImVzjS4dmw864hkPA14ri3p8o9CCbzgtif8fQUcSY2H?=
 =?us-ascii?Q?X9BrzrnbxII64ArbvrY3Pt/pb41BLKdmmTyor1kSnHLfMCWJYYEcjcBTXP4n?=
 =?us-ascii?Q?V+mUCExgbgrE3mIiBOjU+naml8PD0UCvsqEF5HCiSOTwD8yFy+qXjJWWoAVg?=
 =?us-ascii?Q?YlxBUA5eJPdePEnsj96j1DVlDhv/+lAf+/hIrg7U9z5CNvLmJ1n/AgUviHFF?=
 =?us-ascii?Q?36vMNrCUyAEVDYLETchmrPEQrQQI9+oD5f67pRatchfIZ1GfQPqMZ5W4w9AW?=
 =?us-ascii?Q?vT0aa+t/saLF51JbImvJq9BpvEQtJDc5q8/2mLJ4ls87++ZRXP0SM8+sKQOE?=
 =?us-ascii?Q?UBJiUkeyKa+phS0Nps0vvAVeVDK3O5/IZjEvCsX69ydkl5X8RSR52rWPiZed?=
 =?us-ascii?Q?DU3/T6RnLquT2LSpcTSURl5RN48Jp0WC8VCow3R1fkZ10DecLr+tOaXU2eOb?=
 =?us-ascii?Q?BvzEngGBYJJr+MqFgXXxbR0i4zA9cflIPMPqmsCy9P7KtJkLSvscm7TT6jCT?=
 =?us-ascii?Q?j49EZfH5ik4l3d1c0fX76J/BZExl5i0edGwXVM+FFLsy5eBp0vGZcS6SNfaA?=
 =?us-ascii?Q?pOVtFGILrIStK1PFYbfLihTMY6ESVe6Pzpj7oHC7UfnzEEJ/fdQXtV21Gnau?=
 =?us-ascii?Q?AjibunPDLBdPfp4lmX/bsWuaKAAPnZmZ6Hgzswvw9n+ZKyfvUlmt9zkkPple?=
 =?us-ascii?Q?npbdx2AmejnkFZT8KRXRq57ET3Hj69aNkd47L4GwF+vuUafWVtQDyHoyQ0Hk?=
 =?us-ascii?Q?qfxlf4+4znRk9br207NSXHCP8/dT6E8K/oH1xU+jC/o/hYU/9YuKvt8hEOa8?=
 =?us-ascii?Q?sZp7r5sqxHjzEOG3qM3n5rPySb5MWxLAMTEbNY8ceWh5qIbf2/mnTF1fpQDL?=
 =?us-ascii?Q?ejFiceIqm+o63Hwdx/ukSbLhB+mWwvpxdGm+sSbqiFUAzdefzVxIR83/4GGH?=
 =?us-ascii?Q?u7WZ8/ylneGDiHQJQUhLMgnHzzDRowiTLDX63rDOz3GlyfKgFucJOZ6GZx1v?=
 =?us-ascii?Q?B8882KiL/elS5r+4LS2HnSlfNK59NfDQWTK8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IeKA7vQ11FIlzwxjmNH1jmQt1nru+OCS8zlO+gRjKKKNG/8z4/rfFeIUIMYQ?=
 =?us-ascii?Q?s5B+uOMptxEr3LkamV/zfEMgO4VW/ULpnWG7xWu6wdbSJctRswNQZxw2Z858?=
 =?us-ascii?Q?mCi86x5tx0gZy235y9VTqfqXkajgziM9pkirHbgXP1w0hxkTiV0zsVh/6DPB?=
 =?us-ascii?Q?DZBFPwlb+6UP52GhkFMmMpj2pFb2LQ3+ICbqsD/FiB03Q8vtSWFJqtDWExZ4?=
 =?us-ascii?Q?14CIV+M4o0tKKW9F4tLIiGlnJJktvk8qMq6saZt8m2i7obl4cD+TcGBcCLcu?=
 =?us-ascii?Q?FsAYA5wH2X8p/KAfjWCuNy335elyK8DLCPynHQiifrEaMtPJO8yY5Oug0np4?=
 =?us-ascii?Q?g3SDNbVnWU6DyRBQvLQ6P9UeQxtsqEDrd6EXodsUqx7z490TL7uRyanEB/JD?=
 =?us-ascii?Q?QBbinSgnG6on8WtiiUbszgeH3xv9cj8ZWLyNcXxOvKQd09P7L2881Ac+CUpf?=
 =?us-ascii?Q?b0C0tlBoHilpoesj8keVv0iDuGKs18VHvDu3Omx558sukagD43Si9Oz1IQ3Z?=
 =?us-ascii?Q?zL4AQ/A9tlhDz8+httQaMIa/PnwnFwe91QvSoDqLjlOBTN+Imuw8xyJDXtyC?=
 =?us-ascii?Q?DXGzSj2gnhVNhop9zZm5puJgJcQekJK72PzCGlblMZ4H3uZ1MK2b8l2RdKqY?=
 =?us-ascii?Q?MRDNY+9IXbvRaQvKma15l/27HjD2At35WCNjLejo6JSnI4FFns/PFxmRkl/A?=
 =?us-ascii?Q?U0HHv+IDqoRSmQv9uAf0c4vwJE0IhDOSDsy1F/eUuoeVBgJbxPdEoVFzPK3W?=
 =?us-ascii?Q?+/s+PEY+ME+vhUPrs9cJBL2xZsMlyI+38KCS8WE4Uug5nEvU5PIALUP/H6KQ?=
 =?us-ascii?Q?dexeNXJx+pbZGiA63PfanNDhfhhOgEqJbLizzFs/4bQV6kma1j/mwvDmVbss?=
 =?us-ascii?Q?Glp7+ga5CksMWhwfDaqdczKUikACPZSxzTqMYw6rrzii11yILr7Z50tUW9tE?=
 =?us-ascii?Q?nziCkc5zaknYlBSAZMKougiFwgUxSlZtyHc4ORQz6WOjRVzw0G6b52zPW5b7?=
 =?us-ascii?Q?9iJmZXUvxgjwONnA0iP3uhPS4jhPQbAZBuAh4BbFfNl9Bx5cGtq0EpFZsXhv?=
 =?us-ascii?Q?L0rGrTY4j+rWBiKqQ8qQZGLbgP3PI1M3TfvHBMHj3n1HqWjsMGLkwniz350p?=
 =?us-ascii?Q?8/cbKOEnf1XOls+BlNJn6AtF/wVacvlxhtjtD0VZP8NclLLVR+/3T1jDxjfr?=
 =?us-ascii?Q?y3BVGYmAQv2Xs7vev3z/ijnsake1wktvMsRd6heejSWpT4cfRC7h/UUNG9un?=
 =?us-ascii?Q?Kv58LRxLJtnva/JYbr2vxoc9kRQxkm8OeyJhxmRWIM8mrH3LNFlWBx5zpziI?=
 =?us-ascii?Q?rf0Vpx7nMzbPVbr8qFBj/T8PbHXnru7My+RWLka3XCnbi/Yvpj98i2/9hjdr?=
 =?us-ascii?Q?E60Nd6oI7d6TWA/f8AfLlC9AM4i/sS5/ENacsMo882tfmCKWaWjZ+93esK2O?=
 =?us-ascii?Q?N6NK+Rs9g0DxQFjSoJIYeU5idRevhFmvK33EqWJD6j3dlcOcj/nrfEq+CTtt?=
 =?us-ascii?Q?yQSbMvNOA6LPsEq76KJ6HxlZ1sz0MFl0+tPydccMEjbLn5Joc3IWb8Aw3Ow1?=
 =?us-ascii?Q?9gLFC5lvtnyy0F9ZaEgvwvWEC7fY56IWAVuvqGxYoAIo8h4jm8VJD0k2rr2X?=
 =?us-ascii?Q?ton/dXdbM7y/Tkg7l8H0TwQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2f3677-ff7e-4e87-93e5-08de2849446f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:08.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK9sIuLOZzgAQ75++E3feDA7JrdTJv473NTH4aozwAHGRoXdowRXY7Fo8pCtYWU99NgCHCr+ynROscWBpm0BBHpYSjREieoYoW0f4/slS9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfX1/zPV1LqsNiX
 0+Ro15T9ZCXpa9A6Hj7ZbqkQKxFPPNOv1h6GjHPeTkStEfwfoPNQaQSt1VTCkXCLfhsPhCWlL8e
 1doq05heDkOhrhHNKQYNoZD6CdRpqzLDw8Le8b5KY29rVgkt3RO3MbJGE/IbljYZgPgZc3qFwDr
 CCjtgTWza3fiLbp6ExtcRrAXaVRGLm1gP51ADsS9YJ/veIbckCgXBI1eHewjwBQnko101PT+GMn
 r8kpXNxwuMHjTu3MJdbUGwFQX0lcBqZ987qI2tdV2H6mz1fZtQPIpGaYQ2t5LiFixkDb7UXBebQ
 abHtuqpo57fiMEcnx2V8QHwOzgjFD43PS6AHrt5RPyrVvXGXCSE7iw+q9tMEij6Y1P4T0FsgARC
 rlH7Qo6AkISFIOXfppuayaGNe3QDzQ==
X-Proofpoint-GUID: hqbWueSgffxnU0aFgqNSce5cRhgyem9E
X-Proofpoint-ORIG-GUID: 2ehGetU_FxDwSLCADZpIg5KbSXyDwnxR
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691f334e cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=VriWPxvw67vVHQydT3oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226633

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running: 'make prepare' in kernel-source directory after enabling rust config,
it will throw errors since only makefile is present in rust kernel sources.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 411c99ba30..615c53dd22 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,10 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


