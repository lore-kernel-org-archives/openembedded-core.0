Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60009CA5FD3
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12568.1768931680445187442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=afRKTm3u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCxPNu1857110
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=; b=
	afRKTm3u6fIh5dI701Rn45X9yffYgxr+P/dHbNNrEsCOEGLqp8Kiv9YZCXz8TJqc
	dDs5cO0809O5PO3SZjsaN+wLS/CniN7lX6os86ykdWoc2lJV/QCDCDxpCkmqSMLi
	k69TrsX0JQO8448w0aY073f22wRtA4WLUqEmTrODJbKe2QTZGiP8M7TITHBWM9FQ
	OeJLY+N4wYCw1qhAQOGKAeosyBZ22iXMT6ype3h5Bh7fnVZ3nX+puWa17Ko+uvKs
	djEQTpziFyw5NTfnBLIUJorf6qjUGq+xu/93PWP+DQSI9ka8k6dTyBCbihHgHv74
	tikPlHUruqDSDLEww3joYg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br1d4bcqt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 17:54:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1XPkApS2fv4XZSOqtQ+4xSwhAU50gctlXqSaMiXz2Mc6UJ4Ed/nQk63Y+Zx4kMk6l5iYzGuiLxI1vcIOvhAwahluTZPFyLUW7hRpl2crBwLX2xurEiQlK3kulku63kmZxDdYhhU/wRSWZGruqLdTMYlBZkM9opSmGnBz06pb4EY4uH3n/k/YwNp3QuJHidxx/76jkKQCwJ+nYzMvkeOl9T6iatl+Eb1EEregEjqBDWVVlYn7WdLt0QyurtxHcvneLei1Hz2YTHtTd3SpxfcMwNr4sCyZwNf56W1mA0fmhzACo7F9iUJIIqzePcd4LzRu35mPJezzBwdC25cz6JXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=;
 b=NDRknhvsgzDfYPxszfuTD/meqgI08wjCBUaoDJZg+cqyhHGsrvCp2b4O5cWomesgDa+8cdnYBQrp+FHOnrGkkifpGhtt9d4GL1/c7+8Ok28WyoiiSis3eCtxypGwPgq+Cd1GujlgyqNdG4lw4EXb8AhgghLtfms6OsZcT4RE8z6OKmCkqm5LC0ivpyMN9BF1Ofy+r/nbKZKIbOwP0OFV9RgNekvcxkL8lMRlhiEZcmorbxyrctKCkEHHsPUWB0kw3OUNU2GNLkPF8AKcY+1/TgphQ/59EXilesbApe9cMyoOz9fKl035odlhybi1cRnX5T4nj6ifqIHS9hw4+n7xzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:36 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 14/16] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Tue, 20 Jan 2026 09:52:44 -0800
Message-ID: <20260120175246.2052341-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 88200eaa-67aa-42b6-e28a-08de584cf9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LU+nGC6w57HMnWET9jPh/K791pn7/K7Lo3qAl4CXJj4BYRYXOsNvybxyUAL4?=
 =?us-ascii?Q?KYE+1YzCTTF8rmjo8bSL/1j8cWM4cBbkMSmrt7R2GYjTFpUz922s1nLNfNwr?=
 =?us-ascii?Q?XO0zg7VYjBSaNwXY8fL/fLqg/QFXFFwtYPQNpiwYY6uM4/XQd+i4ePRsBYE8?=
 =?us-ascii?Q?dpUejeADivDUKkI57CT1664WeE4PNYDkJ87oj7nClFoNtP/HKEV9yxYd/dKg?=
 =?us-ascii?Q?NN6jDCLv/SbRVLoEJi+jtvqVVCDE+r0p8hFuc594M63/GQ9TIGH9REqFt7KW?=
 =?us-ascii?Q?rTC/qAGnp4BczRduXogvUsuFB67HXgz8eCZ55pJ/XctF2vLvmsnS4SM3g0Xp?=
 =?us-ascii?Q?BOy6B0CeCLtikRNN//6r55dsi/tlMXhqzIerKXHyjf7LC3U7Dge0yJTy8xI+?=
 =?us-ascii?Q?eV98ZCAcVtr9KItOBfNGhlHGsDMHcx3yH9pNiF+U4wtrjQUnJSh7QO6tPAw2?=
 =?us-ascii?Q?4S6r/Y+5cABM3aVogNSIo1WeTImxmA0DZZ5l6AzgBPmOo+zlUtSjoe6OjihW?=
 =?us-ascii?Q?gf48Djtr7sTO0+e7AykgAUNh1SvGLX8jDzeOoW3ODQABRiIt9yeRuDows6AW?=
 =?us-ascii?Q?jouwxjozPlboPatIYG+U2YwCP/tMRAgXivnrB9oM9n94wQvL4jURZCbhHgiA?=
 =?us-ascii?Q?o1q7fH0KHhBZ6xaXsTzmvwQVudvc+5Yt9YK6xJlUV+oyR9fe7qzelIJvoC9/?=
 =?us-ascii?Q?jo+t8gF9UNF+RSLdQdrJlhfpYU2THlM0bS0xv8SePs/QDhO1FbzDV1shw7XL?=
 =?us-ascii?Q?bCzaeN+kly9KutO7kSdHnXStcHCoBJJtORj59RQUqq1aPReUBfYJCiWHbVbY?=
 =?us-ascii?Q?8FZziozG/CFykmWftrsyEGernH8ZP5ZCVNn/g355MYCjHlXWPLW4FQhn1wsY?=
 =?us-ascii?Q?xbc9gz4wchU/4DMVxOYctFZe9lgbqW3f2VxFL3OrkoO3wXfgXbYgs5IW+1k7?=
 =?us-ascii?Q?hKZ1I7diKDbf/AVjTmVmqrVeVQ+OICH6Wrsy/NILzjsqnAh0+QvNkUnjjVbv?=
 =?us-ascii?Q?+AT39aQE8od9HBbOEzWjpM0BsTbiDSvNwxEzV5oFu3BzfpuEEZ2rS7yOg2Fm?=
 =?us-ascii?Q?a5tzP50ACWSjqYHzdU951wgKA0GE4n7TbGeqMkIiAyk43b7V2RDBamc9q8d0?=
 =?us-ascii?Q?WLpwRhDaZAjTKvNY1CxI5j8bc7zxRze+mrPkqlbUkbc1kY/PosllhtZ9Voeg?=
 =?us-ascii?Q?F0DT5vMlJuX/HpIWOoqwKkRneCvPD0TEJuEx6HYgVn8FIEtn/ol7ri/iBnyT?=
 =?us-ascii?Q?SVQLDlbH2TT5XRgXInc+txukAXq0uDBr9//P73qANL9pGHERUyljPMAbC5hW?=
 =?us-ascii?Q?webZYJG7mMvDZHD/r8es8lYPRIDzM0S6B7l66kQ97uXulS+XYsAf7madWAYl?=
 =?us-ascii?Q?mEf7m4pv7R2ptRpgxyDXbopH8WmSJOKUnCc574Aam4rHPEL4fmBDJ/Wx6E/g?=
 =?us-ascii?Q?YMXuIHeZKrL/n1T0kVh8/8GgGkNTcpkzJum0ISIbqo/soriCWF9o+2MFeP5z?=
 =?us-ascii?Q?vWgG6Rg/pJVYP91rRv/y3DXXCkszC3QubYdej+bq0eINYytY7vD7wy9sTK8P?=
 =?us-ascii?Q?H49XEjI7EjycOaE6BxLNWD0mb8tfKXwHIq8gA2q1twHcB9475qpDazrZ9sQN?=
 =?us-ascii?Q?kObggRpiOGVnxm7ICUANRFg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cFWNxFcGp1tPVq/gijbAGWssCdQ9WQgX7ot3V4owqZS0YeAZTwBrTd1VbR/0?=
 =?us-ascii?Q?wdfOM77ZBu1IeKYDXD3Q9QPr2b6cy7mSdapnPM4/KKk3x4C+kSjwRauSFwam?=
 =?us-ascii?Q?W4aNMw1QQvztS10Q6OPrcOJp3+O7HlxFjey1bf7JBEZD5SrvM1HnBw1n7IfK?=
 =?us-ascii?Q?n28wg+gZ1WIgn5N7QeGcpBz7s4M+2ZBhTPEtxvggnbAm8495ugZ1MteMRju1?=
 =?us-ascii?Q?opxrkODapT1KF3Zjuq/PskGFAGEte79nHssNbjW7xKI8B94vPvL+ULG8qo4K?=
 =?us-ascii?Q?diOuaiKnFVKq/3gkF+qEBxZ7KcjofnlnE1g8zL8LE2PjXj9WaTx6G0wo4DUh?=
 =?us-ascii?Q?oAXvUK1Hy6nLaByuhjTZhTdKpM4+hFT7TmVgtOKBYwA8jgPlTbjLde2oCDsG?=
 =?us-ascii?Q?ap+Mq4DEhqIMBchvLEr6M7Wg06eqdn0KTRWz7tr7DDmWwK9Z1cPrWZt4ChTs?=
 =?us-ascii?Q?jzlpDyPVCbWyGOR29A+6v2LnjPZ1CmjHB3PJuf3vAR7dYmrdsI0YsQtP5Z0y?=
 =?us-ascii?Q?GbKXX4qVhzM+cbnv6/izI2b2OwYkNNmTgEFUIRXp6xvSyJRuWsv9bmGdMQxy?=
 =?us-ascii?Q?lt3Y90c3Bk2Ylu9jFEVVQPB5pheXIDW2p6mDMQM/QKAZvhW+BxqD2ew0LgUO?=
 =?us-ascii?Q?SJPXBjTo3dRNaRRRs3CDv7qQo6IZUAZ4IvOSH69kCVZoP/Wq713+D0AzDrLj?=
 =?us-ascii?Q?3hAWCt48BxGp204YCKs41Mepisys7o25QLwz8JlMlObg0pI8lVAAywMnEl/N?=
 =?us-ascii?Q?8G45U/ZRbB5H4FT6pPXNolau28fZyU6J/4LOnGKv2EG7W+9ip6FAoQCuSJ/u?=
 =?us-ascii?Q?WNmPezRrWrRcynmPnd33h0ew96cDVsHGm3OWzeOPHopdO09OT2mmwBwyImsa?=
 =?us-ascii?Q?iOC/MGWz3TpZ7tdPqCJx6DqKdpNdZhgkmQlX51edrLo410WyCvuRDG8kLw6e?=
 =?us-ascii?Q?s84cJdkxgeCS64Ukl6l8FUsKaDsMMX+EU32ONxz3ViyZqcy+zOOYERjyaYVP?=
 =?us-ascii?Q?BO68I3umC4/UovIRTkSg8FdprkgDjxDp7UlG/Mvj2XkqYybtSMIeCe01jzRZ?=
 =?us-ascii?Q?Yus+Vs9RxU+XfmUIp+YmJQPqv2+1EywqeJ/SG2J1sOG6+8H5DObFI760TwbT?=
 =?us-ascii?Q?B1O4ewbd3/oMHZyyVNWvY3ecjxJWYr6LUsUX9CYYrEfpayJdtYREjgNy360L?=
 =?us-ascii?Q?DnB9/LFy9C2XawbRo8h3LEWwfRdvQk/PhrQOKAmQxUIjYZjvVclVJrENGJJ0?=
 =?us-ascii?Q?fsMwqZkU5OzAQsakMpqfeJqVy9qu5d113XCHWSOEWQV6+3TgS2WECNPVwwZ8?=
 =?us-ascii?Q?kjcRJiopu3+iXT7FhSeFvZnZdBYUk5icWw5IhltQka7lDTyZs9HJDB3tZqVI?=
 =?us-ascii?Q?q6najzLr6eVgimK0NElPoA9M+I5pcwnB4EgPc+eMV0yAFtIMJFP2b9NTjjyF?=
 =?us-ascii?Q?OP8/le860swYqZBtZU64wQFtmHSsLATtNiL4Y60tINCsqYg/9Ktf63tZcyuM?=
 =?us-ascii?Q?8Kadmm4OM2rbaj5xI2xgsWMUbYiRbnsMMyCgIEQjYx+gz7++K74lhZoEIsX6?=
 =?us-ascii?Q?aFcmCw4S/kLrZ0jHt/oUPMxPMEannu08ou78qDaizjnoeF86SYg1OiZbPG9V?=
 =?us-ascii?Q?PSVRGwjLuKZuNc0fuxk3QzO1sNwe8aO5ySrsi+smFUw5fG8KgaiTc4BCG6QC?=
 =?us-ascii?Q?Hor9ZL3k69bQCo2ePOrTqOQT22nXmsYVnQJa20U3sa84LeYS5fzxeNBwuZFG?=
 =?us-ascii?Q?jPL3AY5nluJKR3EjjSxMjvx36Nqn71c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88200eaa-67aa-42b6-e28a-08de584cf9aa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:36.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbeiLVVcSmj1GONFmO1sOqJV6YxOqIrVuqbKFXoFInSlKQy2/ux8CpRxcjrvn9JQEykLzINEvho71O3Ireu8MeQIOq12uQSiuG62yWdZZr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: X9tTGphWJeaI3Q7XV3PcNdLtl8ke4Cwz
X-Authority-Analysis: v=2.4 cv=Rs3I7SmK c=1 sm=1 tr=0 ts=696fc15f cx=c_pps
 a=YlG5uxA/pALHGIum7WOvew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFuh8EWA25_V8OYOZC0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7ls36ekdjWdqUx2vSzVHmw7OY7MOcvB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX3cFequ51yizR
 cBUQ/zKj+v8jiRu3s7jYrioPMLKbi2/lujBSwye1wmcM5D5Oqqd1kXMzUtmR+PUMRqTbj/qJpkk
 sCdoDR7MPO1z2YvM5vPHa40J4STzeLamPBV4AvQYCZtF+KdLUzZSE02w5zS8jou0zXrHrGoHGYc
 tPXV7x3jtXgw8nnOivggp+p4fO49rbagxAAwN90gRbc5FaJy3uqztTzADfnFOW44NAtHyL8v+jV
 FHRb2gX8O07smJlxshaANod8sxo7cbcr7tT3m92Dy1aMRdjb4f/Y7uEMcxpeiBsW8TLz5iwj6Yy
 4DN9Yxi9CqeERwFLma9F7ogcrahRT1/cUXibL32g6BhKv05GW5BZqW/OnIgJgz/6kYnJZnhNDrt
 XxcrRilEvx9A/ASOzCfqH5bj8pPC8yiL4ufbUAbIL8sPybE/7Z9G/Gca1Cg25vYp8ugcv7U6/lb
 vObBH6hF4pjT5GFdXwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229761

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..642fa80319
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module features_check
+REQUIRED_DISTRO_FEATURES = "rust-kernel"
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802" 
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


