Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F54CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:28:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8071.1761647316475276715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cRXd7c0k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33963afc6a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA1OnI2867755
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 03:28:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Yj+x9fERZ
	1cgeTR1shTvln2uKGdLV4jp+RvdKciNJD4=; b=cRXd7c0k2yE9IbAnts8tBH8Q/
	kQ0rQY2PsFbhEn/OBVqVW+KKSZtLnBNWv81pTA0LdlBsq79JHfQXGDDsIerNeLHu
	iihYUoXStIQ1H7SGE4J8RSC77pALWLEt1+c+c7Sd5Q57i08xD1rLrwAnZLZyKarf
	+/T53UCzvcWlw7OIXS6R1lQFTyhLj/zRM/R7eHvcqZXtJ9k3bq8CdxJ8AYFdhcga
	qtyVgwZxr7QEORvDMRD0blXud+JJlUheu1alo1+3CDS+PiGhioyIL8UudR8au04t
	4yL02H3weij/IOZEu5kAkbmQRkxByOBbl77HrsF81KHp5Z3aKBwqT3Jr1IgRg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2s1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 03:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsPNCSQQVkIir9N9jg7WxdtOpWMCR/AeDeBpXvXgjwsuh1ViKjCm1Q531K3NpLo14J4PCdMMVT0liJg5JLQ2SHUc3QUJeyH1sw2dZgYhws+TFvywj+PbpgIJUL0T/iV76N9Z599kFzuES2s9GEw+PYAlPQ8N5ZdZD5WhoGPNL7s1kZb1s7bdAzEXDapXvLvkdJoRM863pNTYJXlFqB3BQbgu3LRieuPI0/DI4KL/g5jgM7iPRPIxGV1CdDbmYivjas54teL+BN63fn8Ncy51gYXWm/6mJJp94DOT65ue84t49oWST1rXmxZTF45fBe3GIUfYE7av63yWU5cnTB+f7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj+x9fERZ1cgeTR1shTvln2uKGdLV4jp+RvdKciNJD4=;
 b=xoK/ISGJQDCBPbXG+4AO3u2cK/uRR+FsI/R2Oyxsq+WcgWaTzMmo1mz9ioF7+CrnVpnyqZBTm3MlyWlRgDxvkx8c4OGhnoQuk1oLjVgMnTGdKv+j4n0FMJ7rFC2/aDfr058rAFtcLkcYeLgu/Y1GwI2HbNtmZ2dfxKUvDZtfO7FwsBsLi38qdOD48BsbcwbcyMd17/wIpHT/hlJmdTS++Cj/PLFCVSAG2dQJE1CIW7FtW/2QrWe2sEVnFQ7OJDcNxlKFNjxeK94wjZLPiMQJEylMsXibleXSS4O4UYyNTqxYG9lXMgMWdsCt2hGmBg+WYC0Z7tFT4GNBNd49L0Y+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA4PR11MB8916.namprd11.prod.outlook.com (2603:10b6:208:55e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 10:28:32 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 10:28:32 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH 1/2] binutils: fix CVE-2025-11081
Date: Tue, 28 Oct 2025 03:28:01 -0700
Message-ID: <20251028102802.370840-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA4PR11MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: e28490b5-bde4-484e-79d7-08de160cbe73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?32IEsraBYg0/Md2dXbZ9smB+TQTU2AhgpX1A8xxKpRpUF1SlJSEg6Sx56r2p?=
 =?us-ascii?Q?fuj7Ye1LsQM5Ok3UjVf4vlDhjOODmOnm6F6ZDIPdsnbUUMCVCvwr9z8jK7xE?=
 =?us-ascii?Q?cxm9L1C/5w5pcrjS6t6XwBt+Qos2ArpjFHuQrpUc/H0CjGGgHRyye0NHVyEF?=
 =?us-ascii?Q?n4uWqJwVYLpAee1dM+qCBZH3c9pliAU9PuCbImYGm7DwZQeG/tnIT86M9V61?=
 =?us-ascii?Q?fsgxUqpIp9Ku3WJ0xUUe4/vHDWzkA0jjY3ROzddpZnZIuwD+Z+DIpY3Ok3BC?=
 =?us-ascii?Q?Xz56NmXT+0U8GNndTSdRnrw6c5Zbe3ntLa3fgzHIgdNIQCmFxREBVGWNZkdn?=
 =?us-ascii?Q?jTvOQcNR0EqT47hlZhUnX80UYWxVH3k4wGNgBlJMAw5LJATKRieJZY++K4RN?=
 =?us-ascii?Q?iixDDOvdteAWcglw9VI6H/e7jO8hckwvFTvS4UJPDBe4LSCL6gwd0JSHk5nY?=
 =?us-ascii?Q?DLZE0B3H2YlT+66XMggXYBfMqknBZbSyXCgIRfLsbTCXbqydGwlVv4yU61ua?=
 =?us-ascii?Q?IyNp6WaGjOJoYVMLfSAjD9rIkquPwrDKiMu2L5ql8SrAWIDFKpEk3aCfCxsp?=
 =?us-ascii?Q?4fJma9KF1UfQlGFtvsmJDSZrwiGkU3EQ+6lnxgTz9uxzcTcOHevOPGstUysS?=
 =?us-ascii?Q?AIDKMst+QFyRwxp/9F36IjlCOCT/wJPVhAePnL5l3cnV44pPsx4TYszB0Gql?=
 =?us-ascii?Q?WFodonLycxlgFGf3nC/FrDpHVKwSSwlV8BZsGvjgemAlUNXZBoGveAJjjLLo?=
 =?us-ascii?Q?yS7y9eaKivGMx/9ypUY1W6D9xkTPitTvt8dJ1uGMwOOUz4/KnPPq5dLOhZM0?=
 =?us-ascii?Q?Jh/7MZePoZ1IiaavS+cNETaE7ojO2IAcm9vgZmlEZ/p3SKgi0mu5MjLCcCQL?=
 =?us-ascii?Q?2ELHef8VMI33PmZlRTMkbFWn1mVGvWlpiQC2dJ/FZ8yo4/jPjPveKrabv9r9?=
 =?us-ascii?Q?1n2CtyDJC2tWuJzCGJvIWvZ+xLv6QSyWX1p1TdvYZKgKERkdh4gyyWH/BY60?=
 =?us-ascii?Q?Av/8AE7smNwFf2qlwSgOkUzdKczjZJ0ZEzpp8Y+g1yc1vjnzWC/Kn4xc0ChR?=
 =?us-ascii?Q?w/qXGeAGM9LLKgS8wkzMiWF5RnxHZ9+3yBmWT3Cp7/pgj8W4wKpr8wae6Mgf?=
 =?us-ascii?Q?PJnj6j5mTfmIfg5VvtvLm+br5svPhL0mVK/MJqSYQclLfHMDp4jO5aZcpY8v?=
 =?us-ascii?Q?a+OR0xS59JuT8aiGYIg4ItEhTGLDyFb69zetaEsVVEu3daBH+ZY6p0DQ6hrB?=
 =?us-ascii?Q?N4+adElBGMpP1YbfLC3xQo7Q5Xi1cA46AdTU7l+h6P/mBsJeJrNbcv4Igt5d?=
 =?us-ascii?Q?4tfqZ6Ve0ShEkr3NBwrheKnET1JdPtwIJ29RbxB8QndgWgHinZRpGWRFFZe7?=
 =?us-ascii?Q?PjJCwA5L/oAxsNgc3ufxSeDiDxAvXvrEm0/YvzAtS9r2uL6QwsRK3pZBn0SJ?=
 =?us-ascii?Q?5cGnpwjo2AISjQyfCPY5PTXuEXqvHM9Wdk0Z7PepaFAVWC3vq2mCKw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cWPVb4AwkNgOmmrBOM1ALTAu5W7kfqLJWIvYlUxUXG1mGEc/O1/BLpbKIXPF?=
 =?us-ascii?Q?iJ8bTFR+mV4BQWcjEGnuDfmNkOkKRMqwBtjItl1A+AnxwKqk0wRikjHN8KCT?=
 =?us-ascii?Q?ja1GNk8YM/rTjJpWGzX13VM78+M1nTl5fTSeCZqQg1Q/9Am50LWGDXK472/m?=
 =?us-ascii?Q?pBvJr2Te2MpayKayW2z0sB/ccIaCiN/jVy//ZzPgapgTjseO4OW1io1TXzV4?=
 =?us-ascii?Q?RT5oD6fk/iXxGtxVWSfNRkFkoQtex8q1SHj7jwCPhYYd9cO3sF6MOnh/DX6Q?=
 =?us-ascii?Q?W0JVkmbhl/GHnZiGJwiIm8+npRwoQad4g8Kmi6U1mIPHAbZiDKAWbBXFFmU1?=
 =?us-ascii?Q?Int5obcpA3mzBzjxg1RxcWSB8x2oEQ+UHVLs6k5QzOCI15aNI/pfIEPHq/QQ?=
 =?us-ascii?Q?vPjeLgyeAdQcK2LFKvfGkpGmZbyGTBBcQSBF5faltlH0xySeIt/uPj8zJaHo?=
 =?us-ascii?Q?Axwi7dciqXMtFqzhqHpKn+NJJieDQc9WDPOWnOfMfNwGHKxGx6yhDCpxzWEH?=
 =?us-ascii?Q?6tXkWyReyO2WbgwocuWp20rpx0PPfafArwUh/TrkA3py/BC5eF7bIHpB35mw?=
 =?us-ascii?Q?VJeax3IP1wlYN7oA0SwSwDYNwX3+K606VNPl5WV4xcwrH5LqpBfsN1KcA1vL?=
 =?us-ascii?Q?8HytsCS6rzHaFIlnA2WXrdC87ZBrXJoojrn5iAzI3QWiH4YadnOt7SjnTe5Y?=
 =?us-ascii?Q?0tTyEXCVndnca5dCogWdBMc24XFXTAS30Zysdc0YMvn1cxTDD19tWS2+rsAe?=
 =?us-ascii?Q?8lSXxgJ4xgegrFZ0sKQcV+P6BeY/oTqZF05bOJOKCOVMOSx3TUAsc/NykHvH?=
 =?us-ascii?Q?tYBaeBiqbCCqLPpwLIFWaK6yR/VDdC3dHQHF/sYzBijD/4H/SeSsrJlDkYnb?=
 =?us-ascii?Q?2fnROLgVuR2dVss7bJoW5+tebGIRzfAR1BAdpe+pbd/W5kFq+YTVaPYTD5FE?=
 =?us-ascii?Q?1sUJmXe1POJbg4VSlZdIixbQCPdlF4dviRWyQU8K37Rz2oq5zOyJ4mbz0/Oa?=
 =?us-ascii?Q?sgIxTKQ+nto9PHDXzY6f5FZX1zE6II2G7OgMF55OkVbV2ZbaZJbNuHM/4P6p?=
 =?us-ascii?Q?VsRyXqj2DtwzZ+mHFT2u0i2CGlNz+ILz1GeA11Pfg8hShlWudbfFiL/HmXsT?=
 =?us-ascii?Q?SeBfex6ls37KS8o3JVVglmAZhexZzByK7+hua0isK34FBZKhqwDek4NPn7sS?=
 =?us-ascii?Q?50YhudfPirrvV61tBD+ZbkIGpNVZqCWs9niFk3KxVxP9k0a8TMxckiffcVTR?=
 =?us-ascii?Q?nScHQilingYMYuYWgDgwDU+MQofV06S1ayCDNKClqlPUb6ZIHtT9xmH6yG2I?=
 =?us-ascii?Q?6lB8/DDwHfO7drPyBA2Cez/MuGAq972O7hRJWr/z3D5shtGomP8YdvyB40xa?=
 =?us-ascii?Q?BcUvy9QuYAEHokdVa23X3pQcipKB/pzz7U3aCfYVuwUkRJjh6OKuKD9bGjfq?=
 =?us-ascii?Q?oYIIVd4E3vSXgUl99/ee7ZEq0ppwAhDaqvSNPPx0ED+e5EcfqBnVSgvnYNIU?=
 =?us-ascii?Q?YVTzDVPGA+qfygQEAW7bre4f1qZ+b/pgQmgGOpfYWgROWKk4ZoKWcCWSzq5+?=
 =?us-ascii?Q?hLXNT1ePp2wXU1XejB9Y/ujgZ7/dNtotd+aI9qkiwyYmL9q/XdPaHN4l0CSK?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28490b5-bde4-484e-79d7-08de160cbe73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:28:32.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgoJrOepwJRCDwq2POJnFe/fMNK71qiqNz6Z1rxm812tHx+Bkhcg3FFs3Fbs0yhCGxotwJrnOe6ipJY4t34SLEG3eXjFKr4wG+970NF+YYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8916
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: s-VOMI4v-f8CO7IoSc8On3m9FehBkM6G
X-Proofpoint-GUID: _3CKTc7PZNBZIvQwXNyVd9E-I6LcmeEX
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=69009ad3 cx=c_pps
 a=sI2t2Ij5wXDMAk54xGiwVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G8xoJTEVNainHG8ybTEA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4OCBTYWx0ZWRfX5edi7zcyCV6L
 myTyY3Bi7gQsWbN3uUn3g1ir9PQ6jb0+JMkoVIXV97mJMGHS83PBz2qFqq2gehZZ7OjQVwRFcEz
 n0hITozM8+nNy6TmILEWNpLOcg/Fmzs1txPDPmlwOmpdBi6/Y5JeUR+1ibLV8pkZTm931OxB8dz
 gq4GbWoSjMQ9HGafKF9oS8UtzV96e0rYuk4m4dn3hV0Y3cUL5oYNnZiGowDTMaO/Q3pE46Ym996
 S6k8rDK64tm5sCM7sdWPQ+xTbi4HZVFa0jwGiNlhcFjy60WHcc+ZOx8ydMdHvE39R7LRJRgFoAy
 I9jaZ2JxGhVIgKlwSBAfMAUy77woz4LnXH76u2WnA3UNJix+6tGsqwGzAx48n9dmxzmotlvnFrD
 V1NXWTG965xjq3LkLwAB2ZK7XWbDqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225391

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0026-CVE-2025-11081.patch        | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 3e180b6018..5447ab0da4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -61,5 +61,6 @@ SRC_URI = "\
      file://0023-CVE-2025-7545.patch \
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
+     file://0026-CVE-2025-11081.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
new file mode 100644
index 0000000000..31dbef52fa
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0026-CVE-2025-11081.patch
@@ -0,0 +1,84 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4418,6 +4418,10 @@
+   else
+     match = name;
+ 
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
++    match = ".sframe";
++
+   for (i = 0; i < max; i++)
+     if ((strcmp (debug_displays [i].section.uncompressed_name, match) == 0
+	 || strcmp (debug_displays [i].section.compressed_name, match) == 0
+@@ -4923,6 +4927,36 @@
+ }
+ 
++static void
++dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
++
++{
++  /* Error checking for user provided SFrame section name, if any.  */
++  if (sect_name)
++    {
++      asection *sec = bfd_get_section_by_name (abfd, sect_name);
++      if (sec == NULL)
++       {
++         printf (_("No %s section present\n\n"), sanitize_string (sect_name));
++         return;
++       }
++      /* Starting with Binutils 2.45, SFrame sections have section type
++        SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
++        check explcitly for SFrame sections of type SHT_PROGBITS and name
++        ".sframe" to allow them.  */
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++              || (elf_section_type (sec) != SHT_GNU_SFRAME
++                  && !(elf_section_type (sec) == SHT_PROGBITS
++                       && strcmp (sect_name, ".sframe") == 0)))
++       {
++         printf (_("Section %s does not contain SFrame data\n\n"),
++                 sanitize_string (sect_name));
++         return;
++       }
++    }
++  dump_dwarf (abfd, is_mainfile);
++}
++
+ static void
+ dump_target_specific (bfd *abfd)
+ {
+   const struct objdump_private_desc * const *desc;
+diff --git a/include/elf/common.h b/include/elf/common.h
+--- a/include/elf/common.h
++++ b/include/elf/common.h 
+@@ -528,6 +528,8 @@
+ #define SHT_LOOS	0x60000000	/* First of OS specific semantics */
+ #define SHT_HIOS	0x6fffffff	/* Last of OS specific semantics */
+ 
++#define SHT_GNU_SFRAME	0x6ffffff4	/* SFrame stack trace information.  */
++
+ #define SHT_GNU_INCREMENTAL_INPUTS 0x6fff4700   /* incremental build data */
+ #define SHT_GNU_ATTRIBUTES 0x6ffffff5	/* Object attributes */
+ #define SHT_GNU_HASH	0x6ffffff6	/* GNU style symbol hash table */
-- 
2.49.0


