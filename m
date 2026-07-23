Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E117C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:52:59 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21723.1784807571932937722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=jPzepSrf;
 spf=pass (domain: prevas.dk, ip: 52.101.72.39, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgCqJiKzIfTT9S3+pugcj63Jmf7KTJav0D1QZVM+YvutTRj3HWW7xUq5FdC2naPYsvttv2wRpe8nVXAfu9NrrNRGREIYczzoD17YFAvlJ5S5W1MGfHqxAE7wdU8bNjwLJI41MLZxqv7quOKgCMTyDFG6tNUxV1B1NHawBzpvJFsKKz9tWqayBGuDlE0wX2kmIe37vqKOUoFGxOOVBLz+POCLxeSvf1kS1IsfFLM5dODdTljcal2Bupyyc8yMEv9qph52v0tQFYtww2GXrsyJWMGTu1XsbMOauNUbj6gepz8/wUl5dN2gI+zoIZqNOdq6Z4GSp4jeidpZdVKt9WzH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6GiwQlSHePbQiAeY+gHrCIW6XRIF/yoAdfuqoa1U/0=;
 b=rvjSTkLZ/zlDicQFZRPVLH+srRyoRsfHHXDBbpGteCPDBP2J7YYwRdXVSScsuZXAhfcSwrh87dUfswwoF/ZY2HvMmmYri5BDHsmCCvfZ3DxrD5c80p3DjCL3fQYf9k7ZIUqaLKhOAq+n1qGeAYhNj8NjvfIVRQD7vKkJ/qyc484lGvyxTZ/BFDoG/dDHzg3FwA4bMimV8AVayp/Az2S9xicFczfwm/eEb8fD6wILcVg3sZjbEbJ/FF1f5K0Nz9z6eK3An2p6qQ7GZyavw8Re4gADq0ukj0Kr3aEC20IKHGQcH6gaRrDCRnePfyN3NrPBXFoQhavsF9p9mPYiVfbQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6GiwQlSHePbQiAeY+gHrCIW6XRIF/yoAdfuqoa1U/0=;
 b=jPzepSrf0ypyos4pkisAMzH9gnHgBwWJVjfyoYT+2uBu6mIoojDhaFVJRQsx1MfNg/4OIJViq/zX3usdTH0/6HIC3WMxARvE++d4JMFJ11Jazo2Tw2dCvUFNYv7XbiDY3kdqIxkdInk/LB/CA5L7PKq+u1DyLtD5AGqDupm5GGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GV1PR10MB6148.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 11:52:43 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 11:52:43 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Sam James <sam@gentoo.org>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ncurses: stop moving terminfo files from /usr/share
 to /etc
In-Reply-To: <87v7a6dplc.fsf@gentoo.org> (Sam James's message of "Thu, 23 Jul
	2026 10:26:07 +0100")
Organization: Prevas
References: <87v7a6dplc.fsf@gentoo.org>
Date: Thu, 23 Jul 2026 13:52:42 +0200
Message-ID: <87mrvhrkhh.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPCP307CA0004.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::17)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GV1PR10MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 08210682-afbf-4175-8432-08dee8b0e7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	edaO9M0ZIbsSirjhP9+n37MiJQvHuytAxgMaCntyEk1K1HVcG0gaGc3Yf1RDs/qRM93CvTklt8kakl1VNN25M31fK9AAlekhuTZmV6+DS9XuA7oQJyGEvThSoIr7dxvLU1boPLG+tmT8S2dMGmJStl1rs4nConZuAPfH4wtTDiUHqk11n7bca7R/wMYZqivdpN2HRTRqPNS3pAAdJc7Pr09Jb94+JbEvM0c9lPkZPEebeFBuNWmLttVqR3LjpbhdsQEt0w8PC2oOb753dfbbnRp/1DTnzSDCQ8WYxFaBQh1IzuTSFVd1U2V9TavgrCCco+5WjTcSFrcIGPKaVO/gqr4TY1vXMDfGb5W5ByGyoolVXbUUuJbg12+m2oLI3+PJQr+dFyhP9qHN+Ohoie62cDtJ/S2onOJXnbMIVKoIKgk4j6H4JEwpPvIr8emD7IpVWyt6iReLEj/oZ8voNdW9rzm/8vMl58m4P6IULs2mrpqx+RgM+xEGin2xvMCoJSPPU1IeJKAy7WqdyE1Z16LuVruVArsBxsZ+ygVP3gTpuBVrS7M23bCAAxOqTFnBSCRi2YBLKndyHsQ4Wiczvrx+HycgRb1f7jvMAv4CALsnXmE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W7FmaWJZ1Tn/HmbciihD/sIPrYbCoZruImz2ErOuKVvOJhe35XkqukZIRHmk?=
 =?us-ascii?Q?R8c/9nPqxuouGnLUBtiy16QHtnNLtLRnFwm5uXS6y+ReLThyhb9aPQ0LzzqL?=
 =?us-ascii?Q?hQDKU40wZMlYFJ0xJmmdkEIv7qibo4Qx3a9f+HozynvoaB414Zki4rxiFRsJ?=
 =?us-ascii?Q?EdWLvlRC840Q1HqqwV5iRr1/le12oc7XB9Zsjoq3oQhsjE2KeLEZuKz2BY43?=
 =?us-ascii?Q?W97ZWCpvCZOod+v7EeMmGqUC7GcGYqi7Q9gvDkNh3xC+cdfKxuSy7dYsZ2W5?=
 =?us-ascii?Q?PESX2/VIJUmdf6RryZFxRlOB5mvx4r/SP4JoPaZa9v+zwy2Z3Qak05bhZtiw?=
 =?us-ascii?Q?j2TNxPwVHPM5twMxMsiqPhpXJ3YUov+9fC2bztWukuX079Pc7di9bVYC4UYP?=
 =?us-ascii?Q?Zu4TaBXbXJgwDL/pEkdwjevVnWk6YeUUpWnJiEukwlYJtJzvGOBaTvDWGUqw?=
 =?us-ascii?Q?OoebHvwd/PnbLhbWpDx7vhqRM9p/HSbZlOo3YNqlcCEiM4xQ6q66gFoEVQl1?=
 =?us-ascii?Q?zkDMkb7ZjKPIpQXFw1a6zGHr4TC6q/m0NdVfXL/S5CgiA+9WyqgM3MW1KoOp?=
 =?us-ascii?Q?4SQm+EpyZniQGd6KEKJziWo1X6RaqoX+my2qqgdzgqMU6NXfsjlCEdT74a/k?=
 =?us-ascii?Q?9ik76jAhzQBYh4xUDDgNIxul+8VLBkmPhAMn72kLSbQfKAlqNiD5OaMz8HUs?=
 =?us-ascii?Q?sEe5fxQvlSOHhOQ0gWySYtslFr5W22echFRCy1aGlnQ/7SeJuhoO4Wnx95CW?=
 =?us-ascii?Q?6nolcZ+lyNf5P8N/XczT8kAzIKV6S4UZDYUvLXkXUuprBEYKtPyOytv323gL?=
 =?us-ascii?Q?dTvPqlraLR8Atl/hUTAFTfsH5MC1fZrbyVfy6txNlBhRWZFOcgBxoX9N5IsQ?=
 =?us-ascii?Q?8P2+pKCAacIZpoz7hKOL+Mqp6nJyqArc1g2jDAldmaEBkkIFnS/6N6468hoH?=
 =?us-ascii?Q?EanclZGI4fbxQNbDCSHt1vb3JYIXUf2k4LNvDXF9AtkEEDglOIWh27S6P9Mu?=
 =?us-ascii?Q?o4qirqUiHsIs2j0SiYxkUyt9apvnPL810eBFOWnHZOJW69aXQo15+BjLdtdV?=
 =?us-ascii?Q?CpVKxgi3tFJLlJdJEwHqFHSlw2HMs1Vcm8iu/MMnEmJ+N6HlMHkQAufckemE?=
 =?us-ascii?Q?XYI6XwMp/tEWUXES3gwdTC+raXjZNK6rhS4eZJFe9gCHStR7ifk6Xthn8Xaa?=
 =?us-ascii?Q?e80xx3muXjQcQT0D5lrwKyq7a7uK6J87q1dqNHZRn1kMEhxMUbMihxhyiRHT?=
 =?us-ascii?Q?bhAp3myUvLcUm0Gp5bfGoX4/IP34pxKQg3ebLBvePIcvUrmQGCR3DAX/E5wI?=
 =?us-ascii?Q?3yf//ax60RwLtZtATFVNMkHEHZsrbOpdqE8mw0zoGHPWr1wR/Kf7k2vPxVnq?=
 =?us-ascii?Q?LLBHB60UPch11uv+BfAirQo8uTRzURrkk+XbN/lfdD9/rPtxVcWlRKpGLw4m?=
 =?us-ascii?Q?m2UDGhVJjK+bbiGrVPfugKEZqHEXTSLNLdsB0zHyeKVYQIMFTMc0LWpQQ3Pg?=
 =?us-ascii?Q?m7jPbKtnF35+idONf7gHyq11Qy9Y+6JHcqMeiQvI1vJXGjGmappPOv+WXgj5?=
 =?us-ascii?Q?KVb3Xc7sWKCQcJtww0LtfSK3vpoBIYILSA+xoPRnND+Ij8rSK8YMFXVS5Lpz?=
 =?us-ascii?Q?7fc9klms+qNr8FgnufwsQMH8EHROrtc+4pyahMT+8ytdznLI6brVatuK10PT?=
 =?us-ascii?Q?hDtO9GFOT9tHqfSC6Lz8yyXv/rpmsJPI7C7XP35dqLc+KEOxudp3ljKbpmNA?=
 =?us-ascii?Q?RXj8taA6bEpt1W8oVF43zs6rt+9eVVU=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 08210682-afbf-4175-8432-08dee8b0e7a3
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:52:43.3626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaMpHCknlklDP2D1MO+9tW8ifSX/AKApsvyJRMTIVPYIGYNHk1fg3dNYdsc+1oFAoSTVJk0q2ohOOkTFWg8RHQfQlgpWJpCoTI/hyp/4Ytw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241825

On Thu, Jul 23 2026, Sam James <sam@gentoo.org> wrote:

>> Why it is done that way is lost in history; the gentoo reference
>> doesn't help much, as gentoo nowadays certainly doesn't move the
>> terminfo files around like that.
>
> I think we still do:
> https://codeberg.org/gentoo/gentoo/src/commit/bebd3a1055b402d62afced244235e6fc4917cbd2/sys-libs/ncurses/ncurses-6.6_p20260411.ebuild#L414
>

Hm, ok, sorry about that then. Not a gentoo user myself. I only checked
with

  podman run --rm -ti gentoo bash

and looked at /etc/terminfo (doesn't exist) and /usr/share/terminfo (has
all the files, including those "basic" ones). And based on that I
assumed gentoo had dropped this at some point in the last 15 years.

Rasmus

