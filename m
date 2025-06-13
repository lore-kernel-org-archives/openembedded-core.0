Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349C4C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:44:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.43])
 by mx.groups.io with SMTP id smtpd.web10.8427.1749815045390269056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=eGA4o4r1;
 spf=pass (domain: prevas.dk, ip: 40.107.162.43, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/sOMs/Od0f7uiLG5YAd37Feyh9cxgsPV4+f2ZhgvdZm5HvCp0ZbI1S7UbqKzyvQIvMXUrvznbQmU8kObgMNt8fW95I+q39Lc3U51x6xdUnt7dXBigk94Gq/Snktx6SjaexTtygvwgH1qpcaYGBW6/yKymLUh4k8mLyHspnpN14nQsppnlMS9K2ZGIgCDEPxQZK6SJTGoMpqOn8kx3a3KmZSUN8LTVRgANPOrCw78Ng0jsh6YhfbUFPqOrZPugHvLS3A4rs5DcIMNm0EdDRkTbOc/jmXtetAa7u4cnWCP4WJRNViqZTQE0rWASvkIm6yVSJnywFn+5058E8Fxd96VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zYYOpGRia84KygsbB++5FGHusQBvxc9+4O+mUcp9dw=;
 b=rR1Jw3fQwjfFvOwaDbsEyawT1I9KGwXUT7VPBoXNOW0GpGv6wAseeydYDfmbeYG4BiD8SIHq4fkwl53ee4RzN/PIIm1cnXirst21DVngHr1IG1n6EHlJ3DUMGvrBEJsOXGmZTGmEPE6S19XElMuuQuSEDjH1M1TMr+8BC1OUyCnTWe6NYUYFA+rm+00H77MIfSoLnOrjlrvyAxPlSQC6hIyVK5hSnbA6aGuz7O7Z5NlvHO80SMSRghMqfbT4jM2QKimUswx9J1DnB8j2B4ZPs8RHtVkjKO0HZgVHrq1PFgWo+7HoLVqUTZ0OQG2SyvrUZ2p54VP5rMHATYmZXkQSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zYYOpGRia84KygsbB++5FGHusQBvxc9+4O+mUcp9dw=;
 b=eGA4o4r17Z4+0C7SdcijCsZi7yoo4uobt/S2j5xEPVdXiEjHvRlkfbw0bJIs4xRBp2SpUInr/6+SKFX/2SRLw6MxayO/eR/vcQ35WXMictpSTkZrKwXagEURuMvnQZU6WXloNRe0LPmalabOknLM/MGppVTNYF4xLDBugMwDRAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GV1PR10MB6009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 11:43:59 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8769.025; Fri, 13 Jun 2025
 11:43:58 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
In-Reply-To: <18466AB4BE83FB99.2470@lists.openembedded.org> (Rasmus Villemoes
	via lists openembedded org's message of "Fri, 6 Jun 2025 11:39:05
	+0200")
References: <18466AB4BE83FB99.2470@lists.openembedded.org>
Date: Fri, 13 Jun 2025 13:43:56 +0200
Message-ID: <87bjqr27er.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0097.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::6)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GV1PR10MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 92074da4-f23c-47fa-c824-08ddaa6f95ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?roXw8SypBlEBM2JusFaOmCH4iD8bqsagHC0b2Pe1TrIM5BnyUyZ3+nUCii4e?=
 =?us-ascii?Q?6nIdXDFuce+TRZmDlhHJ9h/x6be9e5Rg2n9/Hzwf5O6si4pvQuao7uKsSKdJ?=
 =?us-ascii?Q?Qz30yeZmpZOrqdN2jirFlbzxext3DXLRjb0KgGazeEiRwspFZakpxdyEvHMs?=
 =?us-ascii?Q?rFbUtdDrOPRcvOk9Nzpcp7DOzUD1KJ5ShyOovejChQ5SZvgiG6A0lk/fm63v?=
 =?us-ascii?Q?04PPv5N/JbwyeLroZ+Ckzw4Q3ejL741E9iHPNDid7PNgKwtTFFG6jG5UvhvP?=
 =?us-ascii?Q?CFQYrkSLeZsyd4Yvn0YnD8B/LUmHYGdl4ArLlwH8xgxkWi6pI4TrDYvBF310?=
 =?us-ascii?Q?K+OnArcAo69fMkPgaWDgLnN98bjYUhoG3eXCYFkkU4lb9jKv2J2svaEwR7Ab?=
 =?us-ascii?Q?T84y7xnL8bC2CUYj93f8P1INNXd4MdNeb7SEiFV5roTvIwO99Bv1fBZPKs/q?=
 =?us-ascii?Q?VnJYCO5DyELSx88PezUiWYrOd8gdn1MjBHVuahYctJZF5xuy9s6mErWwduou?=
 =?us-ascii?Q?cxTcJti2LoxzfERbdg7tDhFiPEFqocEXqmN366WDEWPaUF9FbTUi3F84/1QT?=
 =?us-ascii?Q?fC7XdnyTt2olCQiVOx82Ew14Ctr7x8WxrftKOphvnp0SwODjYWhcEf8paGr9?=
 =?us-ascii?Q?d5iy7NekOap+vDa116uTTPsvxlZiXN0Qi6nBoFsdjAotpKreBXGYkVkpU0Cr?=
 =?us-ascii?Q?CGr3CIQUJO/dBefyosIxBDcQDEvgyY1Li5s16O42N4f++aokJ32BtE3bvC02?=
 =?us-ascii?Q?tZDic4IrNkKxhKZTuGMi5oKic7B/4uMtm1cEfOTYf5e1JBLGTaPJ4E5resW2?=
 =?us-ascii?Q?u7EORoQiq/FlDpvSGqAZ0jasfnyt2BlSWh0JOG2RvQDfzpmzaVj1njMTubR2?=
 =?us-ascii?Q?03GECNXmieaOBrkJ5plH42mMAAXzrPlU1erD+mvCDVgKnofJxiY3RRkr0j0e?=
 =?us-ascii?Q?1O0xwxfZjTKiiEDzhuk8s1/FACjOJs/2GQce/yQDFZFLb7dxvH9ANCMx2Bz/?=
 =?us-ascii?Q?OokRTMY8zLqKBlGf3c2SuWR1F4PB684FaRj2MTdj98WAh62rHQt4DvxP/DN5?=
 =?us-ascii?Q?92Rf2sebn3PtZ8Qe29XZYXWOHbf4KWsFkKbHxFtjOtuzNtcupj4j7kBCvLaB?=
 =?us-ascii?Q?f2RFJ+5cDhkBS/HblmjzWZT068OlKyfLlhz4a9D14eke5xroGBVMZMtMm7vj?=
 =?us-ascii?Q?KnTW0ISKGuXy1sBeGacOWD5E2eHf9ay4JOJG03SzktjtR/WXZSSSDlml89mD?=
 =?us-ascii?Q?ARNpoIo282lR323vnmwOC2Ao4h9Sg7V1D71voKfG9cIaM6GmxeQRPMlD7Qpf?=
 =?us-ascii?Q?ZmoxWMjL9r34fQYhYrQ0Yu+f7uwNCRyg6QGitI25+Irca5HJzKzp8PMNUvf8?=
 =?us-ascii?Q?rComvBM68/x5YzYCMNYl9ENE3Xlb6YvPL6wxocYjKJs3dXZM/FjhmPCv4DT8?=
 =?us-ascii?Q?0K0j49G+H28939UMrTut7tvlQlRRPJCyd5lwxb22mE249IEUWcHicw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zm3lJJS8vhlBzUv33GyA2J6GDeCQkdpwdTU/+p48qtJUXn+oJFIBJst2ZUMH?=
 =?us-ascii?Q?cUE93Jk/1+Su8NepvNKBChh/4B8nUlfjv9MoR/IS+yIy8/hJv6cFsmY3N1+v?=
 =?us-ascii?Q?IJ1tHpXEaenPsJDSK0AOoGRzLQfrL3Wd8VyxU7GXKGZS8QBUAwyG5BvYRD9F?=
 =?us-ascii?Q?BzanfgUrLEChHK7+mQQ2QBfKxfO2z9zW/807CenN05Z4RWRPmz8UD81eP3Ze?=
 =?us-ascii?Q?r/qW/QpAXLxZWyUiaR1fec4OOCz0/dq1yjOzzzAkzE8mTDaPRtEmsCVpiKc0?=
 =?us-ascii?Q?POCUVrvx/hxmc4jH7NIFB+Jzw/mJQl7CshRxfyVIZlRQfnxqf7YJQ+VgN7/L?=
 =?us-ascii?Q?l4lxKZcVw8xIh3Fk8yzjNA5kCLYwS4JO69yNjBZlzyvbTQxxBMRfj5VNmmls?=
 =?us-ascii?Q?mZn5mrkKpLJQLflHUi6luhXRBAIX2Co0QBf5+ILBNYkWMYSNbmh+WD84BY8t?=
 =?us-ascii?Q?K+KAPIPwdPwGBOth65+804HyXLxX2O3a8A2wYd/20MHt2I/ecd4FELv115wh?=
 =?us-ascii?Q?06pBTduuhLDfrn855qD30O6fm+7IUAP/CeF+6rLZRhRye5c0IVTYPaG2QNi3?=
 =?us-ascii?Q?Xn2nkyXhPtim8DwqhMnZ9AinGlszg4py0TgOYW4GOiLCIL7WcBcyOUVlPfLq?=
 =?us-ascii?Q?z/PtUgyX/TXbxkJKKMbJc+k+IURv0lw7Bqzazj4vfCV5fPjmUUcuvKD21o4J?=
 =?us-ascii?Q?2vr2/Z8cn6T882Fa0VRpZ6g7EK+g0vY3YvzTmmd3IUuH1G34Ie2MkdnZvefe?=
 =?us-ascii?Q?UXrX7hhHboXe7gCPwD1TpiyoH5r9QzVt4QgZX3w09dT0LMe34HuQsJm5ow1t?=
 =?us-ascii?Q?bACAUhA+dOuUkcR2rePvfsBHAPU2JomgLzfW7U6DjagpOa1kMUeBPjTNXn/h?=
 =?us-ascii?Q?JZHl4y/Fpfrou75S99+KB9Rp2NVuWrVDzEg+1sX8rCUFood0WQKH6Vv//ftZ?=
 =?us-ascii?Q?3egcGfIXr+qoiv2bUJtCOT+tWtK8tDjwRKvO7DYwf+FBVx2k3/OvUKP+AAj2?=
 =?us-ascii?Q?sPD8kb/MuA/Rrrx0YV94BAOgZI/LfblcvVDcp3FEqUP81bPQRIJNB0jRVvS3?=
 =?us-ascii?Q?wrEhvNZLyA1/K0E44O2Ra4d2AS4GWZE7JP+SgUyCpR2xv0k7ke2oAZx+8OFd?=
 =?us-ascii?Q?PXqeFVT2A3nLQf7m4nYuskgti0GxMUFjDLVaVb/n6J+5ajO5snWj/PdfvyBm?=
 =?us-ascii?Q?2E85tIosw7l2m/kEC5bMmRoO+PKNIlyZiBXRWygmgod9pZxDI5oefM1qzlX/?=
 =?us-ascii?Q?K8CtnrRy+hrD1jSmx0TJJL6bOaY4KTz7x4H8Nb5hIUpCbO9GjS2L9a3JVazW?=
 =?us-ascii?Q?E83T5hB1fPde++owhF/GEe/M3IhideaQIxIgAOe/BAj+qKy9gc3Y8PYHt7y2?=
 =?us-ascii?Q?tO53MHiBAyolQchpqjlJs1A9jOdLgpUohUqB1NN9T2ooivjNl7ZcyDd3kpAh?=
 =?us-ascii?Q?Ci4SPGdvpLgfOuGHGFVqacszlsjqvH5B3NRoG0EcP/YZF7wsJrM7dNANpGc2?=
 =?us-ascii?Q?vZPH+CTNHr3Fw33fy3JW3qPyibjsKM+tVfGCpxA51ti6CAhjFG/dQCcZoOEG?=
 =?us-ascii?Q?WH9NoTBDGzudpP7RC4rb2f1bNftNC26aBTf9jnLVjahCZJOScRtCO8SYSnB6?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 92074da4-f23c-47fa-c824-08ddaa6f95ab
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:43:58.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73dgBb/QTKvAHHul3+qkSp1MJWkv6rwCF8zj7UhhkHESsDfpTmjsJIdJ+K76b4aa0XtJYfexwQ2myM+MiCgHiSLVC/YDIbqrgUGSKY4sQHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218592

On Fri, Jun 06 2025, "Rasmus Villemoes via lists.openembedded.org" <rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:

> From: Rasmus Villemoes <ravi@prevas.dk>
>
> Currently, files and directories created under ${SSTATE_DIR} when
> fetching from an sstate mirror are not created with group write,
> unlike when the sstate artifacts are generated locally. That's
> inconsistent, and problematic when the local sstate dir is shared
> among multiple users.
>
> Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
> move the mkdir of SSTATE_DIR inside that.
>

Ping.


