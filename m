Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F47D767DB
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:08:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14594.1766142511338418481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J1/gf6nD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ68v0Z962892
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=05h5acWlD
	UNftU2bhF2WOCyY3vL2t6Y0MbIJFVoDdQ8=; b=J1/gf6nDLnOlkjTckTlxk4JAa
	2r8rT2QlAKiPqjnZbXEEIdj7jpePr5QSIzyrv5tMUdVo47MKPVeuFTA5ClKyXTI/
	X3S34pkzBrDZqqivL3EobOouifRgsrvtLzkJ5ENlJ8AyljsHIy1/E38AVI4Oco+u
	r6KTEKHZ/HGM7W7RJ2/X+28p4wEB0oq0cDW71pkHIY2Rytghb6eUL2hvfu4t9+4f
	5JJQXmSTHtgj7smaPHidpnkjvlHLYzHLnhtN3KtSkQeBVJAgMUJEGqlv9J1DoZF5
	sBhnQfpMRSoRbErF7/9Qx3O8D+Y3LbAQpGsA6loz7XbL1ZuCtFWlGC9mzxHHg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2xgr11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 11:08:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8fktWPhJ0+J329Vg+bin8STCd8FoC4W7QQ6kQQQhrYOtg1RBroZ7F3RsNYEHgey+4y8XV6FdJJVH2/muj4i6J9QxLaD0swTR4V0rmISqGeWCLlcjRsm9qiKsgryYMzKYz1x0zzKzbFb/eoxGQlHs/mMvs7aLhzVAdQJlvX6rkZOZxSPtXyWUaMQRuMagyfPizq5Vp95t6plmcXUgzjzpr1wfv0vTTtv+rdavo2v1s306f8MFm8auWsju39OqoPpYTj9NhLeV0vP2XqkP73dFnzVLnQyR+n6XWRJ0fMunqJ35osz8oNvC1Ou/dFEK2kPGrHm6cogGevpSu30TzUrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05h5acWlDUNftU2bhF2WOCyY3vL2t6Y0MbIJFVoDdQ8=;
 b=KfoQ6ZUeNvDSBS/NFO/v1WjIivzjMAEWX6K7m5qYJ6JDixlstNPjGnE5zKFon8eOP3RjLTaEyLiNGh/gGqb0f+kKFeMuHtA/0QZnPz9W60GLpu2Hn23Qj4STOm2u1nglyb5tTVpWAXvBMxS8WDFikXYcUskRwvwVV60VrVx5uLdae8lggCyZqOx/nyuc7m4fHYnkeZG6sUjWzEdGN9FxHH/BLgNRWVm5aS4OQdYj7aCoEe5rFNjjzIq4kz17MxJ6akPcNUY6buB+GTNRUFBQZ4R6ES6QfIjNnCojNV309eA4MCzy/X5Qsfw/btt4LmouJ92htu+SOWDs4sVXD8dhQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 19 Dec
 2025 11:08:27 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 11:08:26 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 1/2] binutils: fix CVE-2025-11839
Date: Fri, 19 Dec 2025 03:08:09 -0800
Message-ID: <20251219110810.1758148-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MN0PR11MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a702b0-6f82-4fd4-a1ab-08de3eeeeef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t/gGzn/QueXsbnhMVQjh9RIUgaSJ2X+KXlTrcNa10MZJUwQdHt1/ED0NThlG?=
 =?us-ascii?Q?fugS1eSTcUdJlSblPE2doLG0Q1dEoHEIFeONjX6x6JJ/dy6CPEr26I04a+ac?=
 =?us-ascii?Q?WvyquB5aUYTxiMYrXVsbOmP8cUcqehqnDgQ5yA66wIrX44+Vw4baJn0p273I?=
 =?us-ascii?Q?woboE5tVxdiWpcVJhBjOFxThI2nSYeKoirT1ukbppsr+8CGxGRQUukhP3bBj?=
 =?us-ascii?Q?FNLs5RISqN/j6gRbZVJ/hv/tj9Vvyey38FpgILqH3wIWSVUh8IIs/HLtfMSk?=
 =?us-ascii?Q?69js6yjxdP/rD6p5XPm6PTbxxqZxv5E0D+6yi0TZ5BEVNrqiP6oLpMOBWF4F?=
 =?us-ascii?Q?Mszjk9OQE1r5fwdwEyGDWRPY2f2XeRRyq/oWWQxyUNe6wmUiBj1T1DDcwWKR?=
 =?us-ascii?Q?WX9knhRIg9s3mY1qrHoixoDzEVTVmqIaXCwZdgkg+qFcOJJD3mqZRVyvFVMY?=
 =?us-ascii?Q?WejuDc0VjjYFUjdnTbmbufLN2+oDG8DMoxK3rnpMUqpGtIUQqjkOqWoH3ji4?=
 =?us-ascii?Q?PEBsPU8Jhokd/YUMnMqEGHuOdK6vbhJ2b17KczYTvc8T3x4JsgzMsKL+87Gb?=
 =?us-ascii?Q?xTq6g47RRrxfsEIobDWlwB1AUmQjFDc9TnZC1ExWJKA0tdbPp0RLF/WgIEyz?=
 =?us-ascii?Q?3O5JhDAWwZpFp3c5dA2PHZZs8ixhGRhvCpSEFo/kIrDAdIE4vDC1Zf4YApyn?=
 =?us-ascii?Q?37ZnpnOsZW4vMeuHV/3zPyrkqnEHn98Yo6jtcvpoznZfDOQVA0F6n90TnSXc?=
 =?us-ascii?Q?TklNCSvAHkXwjq0mPR1QztGCpf9q+795HfNVx1EX+j04IpWFSzw361wcDhW4?=
 =?us-ascii?Q?654smCXIywhHB97WZ+XZwWduBC2Y08cYqv2l9zdlfHpWyjZLa2M/1jH8reUi?=
 =?us-ascii?Q?vZNCp9Qi3oRFSgubyBJQ1YPQ2ktRpqdmlnAzRXJb9c7X+YQa6INto+wCl5LM?=
 =?us-ascii?Q?ieJGYgP3+CDCJbcqq07JCxRz36y6++KVZNcSQcc6ktTduBBhBnV5EKqA37Va?=
 =?us-ascii?Q?hVEUWInv4wyqLHwGKwZSf//C3YuGC3VcIpygo2vHp7ltlpwAoL9acMElI1NA?=
 =?us-ascii?Q?J92wfcACTq+oVsVz/h+laAU6JP/KUdtQzE2TJOB+kCh1uUZAhMuLrEf9uUjz?=
 =?us-ascii?Q?ZR7GsJInM1ibv7uTdE2HKfL2L5bnDNtJaRQEyr+y7MqJsrdB88g8+OXkVWVj?=
 =?us-ascii?Q?JHbMz53GraEkd1uPf2CYmIEYEd0kkEpvq+F75l80IPCoUyFsw3D14fwhxlTB?=
 =?us-ascii?Q?3lOx7mw9Su+UGMwGuELniNH8D4oeH/gwWZS6YhwBixbGDTxOlg5ySRnUpGd5?=
 =?us-ascii?Q?l5Bty57rXkXNC9o2NrLG+v6DALNNs1A2vko1VPoEMe0uRW2ti6dvrwKvY+7k?=
 =?us-ascii?Q?AWrWDdTkp92u5A8lY3cJiDv3QQgzN2E/pkZkUTiaYpw5RFG5C4+U2tXfFvOj?=
 =?us-ascii?Q?YKXtX0yzB4EoVyIT/LrtiGZk2WRkZg9BXwgsrHcO5Xio/NzufrUKcw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U+kOCHxWSkXSWjntN3kPie8slSYtFcKZtEeuUxsVT7ZaXkd02VxGL9YjNTlO?=
 =?us-ascii?Q?4d7F8Fax4E5yOemB1IqDkMgE3/JsBmjnxWKCqBXlZxDVpF6jUs80KkxR2HpY?=
 =?us-ascii?Q?AgZSKmFZ/LOp8xzcY8cEEMTyAT+b9XgDrepLLMjXvV+qhKZfFGOQ23QRLkRd?=
 =?us-ascii?Q?tpCiy+0LyzAqm2Qbo6eTZ+9vVTpEiNWR3QJBmDqwJlIzDCwpNVyQVB0LntN5?=
 =?us-ascii?Q?f23CTLKpEueVb/Q9ZottKdtU3JYgr4D2yJC4KTJI6yS8MT+s47n0mOod2I6I?=
 =?us-ascii?Q?YcXnjV/ojNQPkHNmeM493hzWxmnFXdBf89+8B2GQK+dmYz2IJW98ZCYbIklw?=
 =?us-ascii?Q?F9NnM+KFyvuUHbZXJuQoUKWNlAyYrcH7SUb5lAeX6NZh6/bBI3/0FIpY6hDw?=
 =?us-ascii?Q?jcP/2HLuQSV6ldvEGhkI9wzmPJrIdrqkbieIThMyKC9fTqVmKw3BzeVd3aur?=
 =?us-ascii?Q?HkLBdERVy/Sp85mItOIVmNKpvRoVukcpCn1pL4xoAiZ3eS/cHxLSfFqkEz/M?=
 =?us-ascii?Q?Dfag8/7FNL7TCrQ7YDR7OlCAlYS4k8S99wHS+7gwBQ7Z9qGwa8tHmE5S2Zxw?=
 =?us-ascii?Q?TWHbOSgHxrXJp+/T1kz/mTD+2r/uBY4mdVKc1oeQnGCyBweaDNFMriU0pbX8?=
 =?us-ascii?Q?lOmW0tNYCgdZgkMjbeja9H9ZneNs1u1dzbwBe1PDAcsbeIc7hlN7yMA1A+h3?=
 =?us-ascii?Q?38DvaS06jpJY3mELxvOWB3n6Q7S3zCn2xaoZJ8bDEKxDXXihvEaohT9HXV/0?=
 =?us-ascii?Q?0N0TOYccCxdBkyQk/HZRT2JvrpEZVeVyt/DJwem+bEHSd8XJ3sciq5wAlLFd?=
 =?us-ascii?Q?gMehKFqzJDVlcEE5Do2eo+zlLg2ZcJ7ww3OB+sYYgn4GKSgZWPfIiB87tyYJ?=
 =?us-ascii?Q?N4BMHMEviswmdnlx2ZZb7rajWDGft8nqD3W17iWpDpWPY23X2LEGxJUMDhg+?=
 =?us-ascii?Q?+f6rJQed0lsWy7yoFwpALtjEHk1k8e8S9iK6w0OQK7kinHoBSD0csQrYRypF?=
 =?us-ascii?Q?AodXbI7TqHkU8K5lStZkn60Uc2AM0y9VTiRftvK4xhHl8viXvpcJgd6F2nDn?=
 =?us-ascii?Q?h5DDGKU5CbQ7qMXZKCRsKGHaEwTF36jqZexQ/hFDuvyWYNTUrg/2m2dFj/au?=
 =?us-ascii?Q?DGirQLPDBQ8x06YAetjV45xnAeJQpX/gprG10OWzJ7Af0rqXYZMjXf0sFQmF?=
 =?us-ascii?Q?SWdaJG3yQHLHVjOpdb3HsKBnG6a3xZ2nADnEfPeX63zbCbLBlQc5LfFuRPcB?=
 =?us-ascii?Q?c/z0kPWbZMz6S0/BRauI76WDnuI5cIM7zODuzwyy7/MIazyZSCEO+Hv2FThr?=
 =?us-ascii?Q?rOo6zRstNuI+ti1+ekomGmnhfuHpORHBhBNC2aPXahovPb3+v4yIjdK+gTzQ?=
 =?us-ascii?Q?jnEcoCjZf8t534so4wiHzDlDHn5vxbLzzZz3paxY+Cq9Z8JVaHP2aeuXlxDI?=
 =?us-ascii?Q?vHdfzNYgaUteJ54+1EzpuQRInoHbxupKBWYsRp6bt6A+PTQ9uu1Z/o+QsFJv?=
 =?us-ascii?Q?P2EYdYhpbtVFAUCB6J7lFpGBPoN112nyUL+jhuG7S/PxODLRCjk/cqiBATPJ?=
 =?us-ascii?Q?l2poilZqbLkimTXKnbBnhWHQ8LDkPXVFbyS2/f+R/8+ZLCUCgogwLzAqlTF0?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a702b0-6f82-4fd4-a1ab-08de3eeeeef1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:08:26.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: li1ndeuvwKlsuTt+Rqz67NDSUjkLfkvZ2kxAIZ4GXC0nwokzy6qBZzHoXq2qcOIYRZcb9qjRafdINi5t3p3GaC7xvQ8xdOHF55rpgbouMBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: aDTAYK1nNPsIygFgnFviikAxMFS6rUwV
X-Authority-Analysis: v=2.4 cv=eMgeTXp1 c=1 sm=1 tr=0 ts=6945322e cx=c_pps
 a=7VyIIgRwdngEQeabsf1mSg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=dHwC8glK4a3Alx4pFYEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hIVVdC3hkkHl0Z-J9xDSo1w31CvDpAuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MiBTYWx0ZWRfX800bRSVG9QC3
 UvzL6gAYSQz42d+zT8nxJaXt4AAEkEbyfQUvhbN7awHa2dwWv2eVWYbP+NEuGW/pn2ENPOhXTG8
 SY05TWIQ5bdLnS/rQfkQYFHkdVL51WhpJ+KnBzm0b0fT8PmdIeElvNzhtbBw9wxLgkqqNK1vAXw
 uEOD6KxInx3Zu0zjya5wcXWF0rinSm+2rtAbqUmBWjL+MtmBde2f3UwNgfsJA+xiwUnuTzE3E9f
 EMa2GHXZ8zMv4lSSczuGiTJVZY/B8Gb7f/JFQ3oemmkJ4h8nF2Xd2IZrau8ah/IZKOXCucY7SLn
 eZAsUqyp+zWr4nsOGTcmIsyBgKIry9U9BDhkPF9u4G/otnzJWuGUqWmUJy+QAiyPfpRr4C8Ik4I
 ak3y/lfHzqTymAXFdLFisdkB5L6JpOz5kZPt87ZbciCZXa8rQVaM9nF1nBz0t+WZPlvfDQ0kH6d
 rHcDorB2eHLWBttxzGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228210

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0049-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2fe4a17e0d..426c00ce3f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -87,5 +87,6 @@ SRC_URI = "\
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
      file://0048-CVE-2025-11494.patch \
+     file://0049-CVE-2025-11839.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.49.0


