Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96125E83EFA
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 08:59:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16318.1770195592643221977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 00:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BMUw8wYb;
 spf=pass (domain: axis.com, ip: 52.101.84.13, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XatxTD8+AcnPgdajwfAb18hCW3QbZenzs2ksSwVOjQz9Lm7Pj0gSK5//Jj1517rELkg2iqtbItuCr9mNZSR+zvx1nAcT8ow5nCKEIzjmDwyXUIZ7kuYNhePR/UvfLhsSKxNe2dEPuXXROEoCLiDQV39vdCXEbQUlC187tK77nKpaRhv6+QRulE/psDVFHYmgmUknTZI8WIR3BC3zgNC8dIQ/3gQwsKHx6n+JBTD9Os5KLtr1hdmAKPO8b6IE8A+Gc/61Rd/vDFS0j25V1PGDzsYdN/5jEzeHHPvKel4bAK0cY+5WupPOzl+7zUDFJo9+dnGmfoxXSFWExs8MDAPSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6CkqXuDVW1ujFrdG1QoOtzS3HzsNaiCYcegCQxXNgo=;
 b=xMqt44TKy2xKUjMKPoBA/X9wCF38R+Sa0TpoPAjs2uWVJZWLkE8qh+0gEhoNI2+uEiSCW3EDNHvILSJ193vEJPuImpjgV6kyeQWDcW/MtnpPYxYWbkpG2eOnh92gv4G9FkA7+1Lup5EeXmLtQZBu8jhTmRDbaiiexKACR2jjKvD6gLxo4V+FTMgg1B9puQdLbTWMFgW/fRuBGJmLZDTxwy/AD7oiYbf5D2312tHQehxpWQova1MCYtDKqcS4o/mqovbMXqsonEeZkMfBlU5q+6Xnp1uWb5qKi5u7StSINf8Y3vEIhTJxhVk67XsHfdbj/G6eczAq6nNZeDXXkJKSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6CkqXuDVW1ujFrdG1QoOtzS3HzsNaiCYcegCQxXNgo=;
 b=BMUw8wYbtU1TEp2RiH9jokZcc1f3/7jIMFv7zCS2okTq3RSUC0ZdcCcK9EMaNkozXBrkDg6720t0ji6tkWCQB6Zb4C6JUBVq+JUQW8Ecjggpco58UA6WYPhtok2tSGfNkrmhaRvyay5a/hTjCtcMZLBKEhpC+jSKgQizjOVcEUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from GVXPR02MB10764.eurprd02.prod.outlook.com (2603:10a6:150:155::9)
 by DB9PR02MB6875.eurprd02.prod.outlook.com (2603:10a6:10:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:59:49 +0000
Received: from GVXPR02MB10764.eurprd02.prod.outlook.com
 ([fe80::ac68:c214:2d57:8ace]) by GVXPR02MB10764.eurprd02.prod.outlook.com
 ([fe80::ac68:c214:2d57:8ace%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 08:59:48 +0000
Message-ID: <81baa6b7-9be3-4bbd-a492-c831e839a1cd@axis.com>
Date: Wed, 4 Feb 2026 09:59:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] go-mod.bbclass and gomod:// do not have all sources
 codes available after do_unpack
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <264f0cef-de05-4515-bd33-71c136e01b46@windriver.com>
Content-Language: en-US
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Randy Macleod <Randy.Macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <264f0cef-de05-4515-bd33-71c136e01b46@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CPBP307CA0004.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::13) To GVXPR02MB10764.eurprd02.prod.outlook.com
 (2603:10a6:150:155::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR02MB10764:EE_|DB9PR02MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: d953279c-f142-473d-952a-08de63cbbffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i9dV8ZpPn8FAsji+wEKsNWoPple1PecuO8I9xEvp05ylGZaykWMNnHJaeAQh?=
 =?us-ascii?Q?7XaoEl6HlXL3IaUedEPRv52ad/RuPnLFB2jXLcYXhioi16bhcYONIRBp1Jj9?=
 =?us-ascii?Q?6bAWQzXxsy4hbifO7bapQR9QwbYmO6H2F9DB81XqN9AquBBjFv06F6OupzWu?=
 =?us-ascii?Q?wPU+oIipeMDjR6vJpLMQEgI9BKxTas5kh2Nxb6QAk8iZi8p4safe2Becvt2p?=
 =?us-ascii?Q?4mZsMHnVrdRPP0gEDct09K2R5YmLn9d6M7dFtsg5EIRWRqVtCy7zzEzuM9/6?=
 =?us-ascii?Q?kXaHwtg59xP11GfvrKdplWuQgjSw17zLdUi4nCCAVZDcrjVazYORr6HyAKr9?=
 =?us-ascii?Q?T0WxuEU+S6a6hLpxgMYoIqM12aYDYIphhcI5LMOwROO7xaH/HqJ14O2Lfsx8?=
 =?us-ascii?Q?CN+FdlldaO0U/4Qyn0vTdPkT/uoKeV5HMn2gvhGs/lOMT4QScSIoQgnjr3ST?=
 =?us-ascii?Q?amuNYKJs6cGsT6NrW0kAwd4i1oSKsrO99CpsK6LCSWF7eP1k0wUFgpdqe96F?=
 =?us-ascii?Q?ywP3uijtcUdBWZkNv77fXAX7Z5Vra/884k/TG4sb/0uEfYa1SVg71sVALPoD?=
 =?us-ascii?Q?9KDC9XBSgDYgkH5poRuOXAn6xgCkrMWtSzgzcytSn3dYdd7cWaBoLJVIvbOG?=
 =?us-ascii?Q?nBwINu2LHVYxYB+svwdB2BjBootOIqqJzJWZcjMBgIdxhAEqKTnONPFPSMhR?=
 =?us-ascii?Q?40TTNA1j2k8iqUWqgQeNj9NogieUgrMND8lKQowAQzO6Rnxk6q0F5Scf1VdQ?=
 =?us-ascii?Q?BGGJ594dsiRKNn97jWT1f75vVqeQ1BdCPUKTeKQwuY+MMirvAAS8VZgeJCjY?=
 =?us-ascii?Q?qpwRSdxuFgHoSRckpsE+KhfyiCH9eLeOrn7LnTn+M7faFoPJvP4mUR2pPN2E?=
 =?us-ascii?Q?+cOBTeaLuE4yvvxBrdrljRdC6qak+d+pu6QzwVaScTw2EwIrwFkHAQQXgeu0?=
 =?us-ascii?Q?DFL7R4cYn4ikGtHgycN72d4XERZNJcOTYgkTe3605kKi/eGd+Wxo00cq45Ib?=
 =?us-ascii?Q?xa0TQboB27WkzScDoLqAyMVdT5hY1Wmdpdl2YJcIkL2SqUX8Ui1sMO65wAk2?=
 =?us-ascii?Q?8pCxF7M6HgQ1zBdObuvUK97QkwuA9wtjivRQwc9aiW2f3LN/q+Y9dTMf59rK?=
 =?us-ascii?Q?kww0SXAo0AMyLwsR5vv/bTkdasVyAgdVubmWw/jRDj9AzAG/sNiX7yYLpIwH?=
 =?us-ascii?Q?liZ6GLT47k4Pln7+YoHR44YWlQmeE2AfkradAbpr/DvmO4VQJar20mgLysHs?=
 =?us-ascii?Q?VcPpS7/DR0ngNAu76BZ1faMKaumk0xPh4dqAMI4yJh5CLRGLSTasal0SKV/1?=
 =?us-ascii?Q?MZVoJ0iT53Z+ix8kdImVy+iFpfDpvigLK7jL8FZMBqrrMMxmOuzqu9vRKTBD?=
 =?us-ascii?Q?Fq1HYGGam6q1AFLGvaaRb4NMerUyzLt4A6lS6oDpqVxMHukUxg1DMpbtW+zn?=
 =?us-ascii?Q?OO5GpPVGFqsVb5ZJsHzJi05x85k4caYiNl0KdqmYKeGtBZNYYxWylB1iKLcM?=
 =?us-ascii?Q?xvb0YjpvOYUy7E1MWG4dlYFrpJHiLBbq0KQORbElcRjox/exmHK4n1lc9sec?=
 =?us-ascii?Q?wzb4f8ZwTo0rJNX7WJk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR02MB10764.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ztd2v3nwTu6yVuMl+kKaY1514FP6Fwk08fl8CcNWEOwJXq0cA9ZqGGwkVEyx?=
 =?us-ascii?Q?W1x8mjVyWnRUQ8YWHuXHBtM9aZdM3K8waAq8yVGtyiOKUe/5ynicYV8N9cmM?=
 =?us-ascii?Q?hLdar99Fy5S0TAWLv2r+oyafs+gCSN1IdVKwxhPoYnIWXi9lTDutkwUc2nUC?=
 =?us-ascii?Q?CW67HJRXMSBa+sJ7jQdkPDrMyVs2y0qMimAvzKyF04PNGFKaODcX4eIHV6Kt?=
 =?us-ascii?Q?3iSzpVTlKb7ZT4GolkO11K1LW4B7PnwO/PEvqclebxaereF31eHkE5AGyrqv?=
 =?us-ascii?Q?dZjE4uz7DgUoD0erYEcdp43QCbejMivnaKkpz+xAKbAWFl+xfB1/Q86bW4zC?=
 =?us-ascii?Q?fTvDzt23Kg3iRDp5uvONuyhvkjScvJtGdlOcXm/othJC27/w3orfYWBf8Kuv?=
 =?us-ascii?Q?UWyArlOFCMxBsChUTLKX5v+azjeXgTzG3qaLPdDMfnmejevGAC3TmvZC4VxJ?=
 =?us-ascii?Q?/CLZCIxX7/NJGQXlkjBRzPDP78YqMAbadv3hbrYwu8TBORr1cehGIrviXuCe?=
 =?us-ascii?Q?Cct3g49dv5i3cbs2JFjt/6+brqkx16oet1eaLXT+uQhyfoqbcNpj7tOw8xTm?=
 =?us-ascii?Q?QL9aQw9u7ffkA/EweqqoxgoagJ0l8NE3LF4TG6G13jim97a0s4gAO/hDB2/t?=
 =?us-ascii?Q?2ptnAdbjfcrx1sMlsgKGKaGNtT6n8bvIbwEOfk7EV9dNf6Js5bd6PTQmpJaH?=
 =?us-ascii?Q?HAunq653raWHUfEZdgFSKeX4DnozOzfvUnn8edcu1akbBYLrBSXzmbxns2ZV?=
 =?us-ascii?Q?mMV55XnJO57wW1pljpmZUsKlEF34HdMEJdH6gZmzI1oeNpeJObGPRE0cKYuE?=
 =?us-ascii?Q?HaJahiro/pEWra97cvI6YRm9TbMXjj5AgPRFbpL5l7u24EFM1NKi6oJHzEra?=
 =?us-ascii?Q?EmBNNAlLk0YH1f+7INV/eCUHM4ZUj6YEXD06LMCWD1q66aD53r8V9Rxrdz0n?=
 =?us-ascii?Q?ZIvnbHwEIZUqzDg5QAw4t+8/nCBbpOgGxWXn7FXopzHOaIHtLvMYeNTuUjI0?=
 =?us-ascii?Q?+stOOAF0zLcvJA9+lPcONX+jqkGYoq7pLIK38jU7SKOLFeWEuvaJBPZliMwM?=
 =?us-ascii?Q?fSL9ngqwv0mmWPVEmr/dbptqSkSAxqasgBiZxjTtdHWVD2JoWQFHrjKs5J8F?=
 =?us-ascii?Q?FTRfSlhxbQQTv4pkv0VjMWu+S2l2mDKvEts+JoN/TCVt8YPSQTK6s1o6GO35?=
 =?us-ascii?Q?fWzrfHUfRzrYpFdlAC0jNEgTIFGMCMJgUWG6PpuG93NLnhUSeRyVdIkCfs1t?=
 =?us-ascii?Q?Pt3fX7ewCig/anArb3eXNheEzlL6yE5wTji1DsEpwsxxddD2mKC/puTd0RzS?=
 =?us-ascii?Q?miyIjuQKP7eiqfPNnu2KGLPKfEolCMzML9MLTHYrpslRoUZt/oegigTbQj8k?=
 =?us-ascii?Q?sgzeA94yUCn73VaeawEnD4cNmJtGiZe99RiI6Y8qwxy1s2djZhgxPLGcDw/5?=
 =?us-ascii?Q?WzMWPg3422zjVbDFXIAJRJWPPUX7Ck9d3GHCckdrepbGMQMt1wFLDjB+gvIJ?=
 =?us-ascii?Q?BqzB9qVQBdM6oFOpiWK8udZu227yN1EINCns5xO/b03n0L2UBUr0gxHy4Y0f?=
 =?us-ascii?Q?8hhg86zOJOP82Y4k8WpasRfDthrPyG3Y3pjL5ieiMx/GZHrwSd+PYdBAzHec?=
 =?us-ascii?Q?XTq8Kg8+Qn1dJTi1X6AXxw+kn4aq+rvqsSU0RIOt2aYYBb2sw6PBg/Lq7Vrj?=
 =?us-ascii?Q?+68d4+/0sIBJ1WTK7pnoAzmNl1m+/rbhNq0/XVUG4zURwgW5?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d953279c-f142-473d-952a-08de63cbbffb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR02MB10764.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:59:48.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYHvDVVsbpDcQc8CrQaH+VyxyZ+q2ago8l0uR4B4TlR8b4QFQiUR5j7Dfdix0xGQEIyqCd9fmWn7sKECWXM7Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 08:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230503

On Mon, Feb=C2=A0 2, 2026 at 10:36 AM, Chen Qi wrote:

 > Hi All,
 >
 > When I was checking recent nerdctl issue about rm_work failure, I found
 > that our gomod handling has some problem.
 >
 > In short, source codes are not available after do_unpack. They are only
 > put in place during do_compile.
 >
 > I think that's why go-mod.bbclass has:
 > """
 > addtask do_compile before do_populate_lic
 > """

Yes, there was a suggestion in the early reviewing to keep it simple and
delegate the unpacking of the dependencies to the go tool instead of
duplicating the logic.

 >
 > But this is quite a workaround. do_populate_lic is not the only one that
 > need to have full source codes.
 >
 > For example, meta/classes/archiver.bbclass needs sources codes. There
 > must be other classes that assume sources are there after do_unpack and
 > modified sources are there after do_patch.
 >
 > Another big problem is patching. When source codes are only there at
 > do_compile, this means we cannot patch it. But Yocto should have full
 > control of the sources, we need to be able to patch any file we want.

I think the approach taken by Khem in for example the influxdb recipe by
patching the go.mod file with a module replace to a fork fits most cases as
you need the fork to do the PR anyway.

Then there is the alternative of doing the module replace with a local
directory if you want to keep the module cache untainted.

 >
 > In summary, from what I see, the current gomod mechanism does not meet
 > Yocto's requirement of fully controlling the sources.
 >
 > I'm bringing this problem up to have more discussion.

I see two main alternatives. Either to continue letting the go tool=20
unpack the
dependencies but triggered earlier in unpack task instead of compile=20
task. Or
let the gomod and gomodgit fetchers unpack fully.

 >
 > Regards,
 > Qi
 >
 >

Regards,
Christian


