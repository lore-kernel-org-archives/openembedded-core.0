Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD476D26283
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13457.1768933904790559113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KtGUD1Rj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KBl3fb3609007
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=; b=
	KtGUD1RjgdsK7khsYTd3VhrTXal4TcyrE1wAxfojOAr9VwBvIgOJMXQXqPvppWdx
	4WGCGnKbhoJFaYNLjV9xNx/NDdIgDDjDYor/o97N8aoRyU0MyeWjw9vHBmFBliee
	6w78eEDVq6OmuzQIIvytK00auDpO1betWgCUppX3SA/WwOAbfv95FRMNm66XrFw1
	9YAGMJO1IE1N14kksdjoqKd8yEF5cfiDGg13qZKCpfXyj2UVO69844dHgX4a17cy
	IGiMxVRFSZqb68kZjKy2KH5+3yLBibOa5S9HCi5GWqMvhUWmcgvc0Z2POg80SmDm
	YlgeLC+8nIpuBYC35i2HtQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymukh03-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 18:31:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAOm9OyWXcVhH10qWzWA2l7WxTyZ5N5grTSxtscKNWvCDp1iZWK6qrfmLVgBpckLPEHlo8CUMz42HOTp2BbEQl5k1Bl7MkIHTUIFElxEqcwZ2dgWcEE9+9NzXu0+l8K5diGdfLIPmI6WBH77CjnCBcfyjBPwfQtGBHNheTR3MfRpMPfj7A4ZCws8hnlPoEgwvI2rp/UzBnvwrdL7ykvDcbZdZUxR0I4zh30HLah2DXMkRNAUh3l7tJYuUhImwpYe01o1w1gNAIeV+/QOxOHL+QLh42HeyYIF30AkoxnhngFy+oBlVCFaA500rkiKplJyrVYCpaHLoGzJJ2cmQkhu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=;
 b=nWSIgvcbiwVhc7kzwK8G9GNBm0MmzNCGj/X10Qb6pYNFz6ZhUBBH5qaI5vIcDHuurZF7JuQ6o5nfwHpUiKRXwPR3NArnPBxDDNAWa3BzVYudQJHJr4zp/u0AFyIBebkRK9AtazeG4zgu7UgnWc1ofijd+sFh2KqERMhQTS90fqWKuTjk7hh9d6D6pv8IPvjWu+uk+m5rxiEqhg/kuEm3cBaRLZAeE32sNz76w04kfCbRk+bmKVvNgQx3/V41LH/E4keiV5DIlxjFWsle/oEy8m+/YYhj2F/ST2I9BrxpiAkzyJk24GUQ3kgNCLchYiNsPV5MjrlPiQxC15JuSdOfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 14/16] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Tue, 20 Jan 2026 10:29:45 -0800
Message-ID: <20260120182947.857242-15-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 246cd9fc-1c87-4418-4730-08de5852271a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ne6/yTW3dXqPo1GPOQcMwjRADnvBtdaRby1YfJW7ebyjvU8GlDM/iV7nC2y9?=
 =?us-ascii?Q?phmgSq8lCFl+CdNcD382daBWmQ8zhXqsWGnCIVkzEivNxYMdkggaiYjgwBWx?=
 =?us-ascii?Q?GSFYoSQJ1QGXb2TvzyXlkoGhakGGC7QTN93DdZEE8ZP8ANCi8iERPbi94Mad?=
 =?us-ascii?Q?dsMN9VoQV4fMJfiyP43ihpbFnJeFirpZ3XiOhUlp1J1RCWCoUWYzdVtTSJ9T?=
 =?us-ascii?Q?t+y28QDXPKJgWCTF+gKjA8cO3gZ+26sB/SsY8n3KtiWSKL/oY+FKVArqkosp?=
 =?us-ascii?Q?38YvglRXlOTr02QtJCg9jzG+9X6uTQMoecAKZjCiCY0YqTVzpYmR1OVd4jmb?=
 =?us-ascii?Q?7qZNHCz20G1nbRT0i9LrDFmF9zoatf1oPgN0txsUIVupoIJUkRKK5hL3A1yg?=
 =?us-ascii?Q?xoe+tYLzloWfRd/5F73qBrbWRd8UJEot4MUhsmof4mzoIghAkeVV8jvcVSdy?=
 =?us-ascii?Q?MSXbuNbtfXT8CTq4PlyhqK3qIglT12rLA8Qm5Lcfw7vtA+1F9tWxwjDtigY2?=
 =?us-ascii?Q?wDuQtxYPcwe+Ut0SMm09dE91H8ul4iEM5aV0IuI07ShnRLylr0IbYTh7vP4m?=
 =?us-ascii?Q?sq+UcucbtCD4Tr9q31z9Uzny36myew4tWLcqqgl3aQ+GQkqsDt7whXqWc0rM?=
 =?us-ascii?Q?FNOmduCnL96Y/QwmeWt/siitIxhW+Qe79hbAlk2PJfiWJXdwvMJIxPWeTN/i?=
 =?us-ascii?Q?5Z8j5ur7hpEE5cqSVkQIxpbn845PPm/LxdhjB6v+WjZ9Q4k9mR+00ZOtXBpd?=
 =?us-ascii?Q?Qb8n6w8/8kvxZkNcThhGZek5AMKghOrO2qyKTW6DRohv76Bxk+dd2MwhqX5N?=
 =?us-ascii?Q?hXNXEBIxE3CcKQ5L8z9AW1QaYTPZUUtLBFeDhlLa0nu7FrYKmcOl0QDlF9pD?=
 =?us-ascii?Q?tRngorvTdy+hu19GSlrW2eg4rIeMgLdiOnqnVtXyj+9SjLjjf2tvaA4um2m6?=
 =?us-ascii?Q?e4JbIRy8oL9NZ9YZzd8KUcbUuvAHm1cEE7SDKzxlct+fKNcu2wp/dPoqkGYw?=
 =?us-ascii?Q?pJEqn0Cc+YdOPq93dVjt2NNcmsLjDABVqArFQyJULbrTyN9ejhsSagsVP1iQ?=
 =?us-ascii?Q?BtSU7wCnr8vlkCMk4yE94jFCrDT2VH6WrTDi+LCk7Nv895ce3/rugtKN/oJr?=
 =?us-ascii?Q?Om5/r2z3HADv+6+UzgVv+Xpk3hrAKEzs7CvBnDHzIRWEYSlf8VzaufLAWffj?=
 =?us-ascii?Q?ttdqF+54bw6MfvmAFZzOaQl5MvOX7NyWVoO+0KDw85HO4LXqO5Snq1YjVPaH?=
 =?us-ascii?Q?orCC1yufi0+zuQmDgitdOqNPgp3vwHo3YJdTKoBuALJMffgp8PAqKt/tO8Pn?=
 =?us-ascii?Q?NkcRPqPHaUxEi88z8dOVhs2C9bXZKH7JgPoKrNWmQgWfmGI2CH8lTW4rk85y?=
 =?us-ascii?Q?zIFRHA5Wk0VoqFdLj0ybKpydqXhHMKOYOf735Zr4IheVTyZ4RobfoMOH4P6O?=
 =?us-ascii?Q?xnHMrIbFB94qSbAtEOmzUEvgwwXMk/kabW+9xlodi9N8O/MaszEaR2rKA5TV?=
 =?us-ascii?Q?NxuUuUyGdtrXXtPeOi5ZXWXyyEgVLXzqwYlOWIYqfCq4r5lVRaNzSPhoCx7I?=
 =?us-ascii?Q?KeT0akgQMsiKBwz15Jj22Vyk/fmhhCZgW6OT2Xza2QW1yb1XxTI8gE/bIviw?=
 =?us-ascii?Q?5G1+PIG1Etlatlo39qk6Dfw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7v8kMOV1im/2QXp+Q2GUaHukCnBMXbrt5fiZyD6Hu4LMr0FFwzhvIji1/Xfg?=
 =?us-ascii?Q?tkuwzbgf86ote8dc3J2/NjQrqjOjbfoniK7YKromY/FizQN61zuDDyx073Bv?=
 =?us-ascii?Q?8UGACg69uLYZJvdok8PNRKmSqDyS02ggaoZIjNInZhhifGUEsXfTYmwpjHmM?=
 =?us-ascii?Q?jeuIkvYhRUddt0RZXzxd3U0IolAsJyfSR1mycMd1CM7Xfy4+u20R8A8amvnA?=
 =?us-ascii?Q?98F2VYlG6n052OaDNFgUKeUGiXPQ61fvKJK5ZO2gkRrDq90H7BkEM25M7ZZZ?=
 =?us-ascii?Q?DT/SHyoZR89aAgpve5Ncj0i9wgthvjb3ZKtxGyaok5bkzfDaxnT2AWanD5sW?=
 =?us-ascii?Q?uQioEvtqN+0kt3Yoepn4daRtBUFvEDQ1/Ck5F/P4Sar7vdW6JKRx6kewORUe?=
 =?us-ascii?Q?a9U4NZXrRr3nYKdVbwP91sqjHgx99So3ImahahUcqdWvAZ/wazdZsPzFFbD4?=
 =?us-ascii?Q?aUwFQGDEuD6oc6NWA5qRTy/GOaxbFV56FeBdw7VOLGZx5q3q3jIt+VeDt/MR?=
 =?us-ascii?Q?YUtvqb7c2GFTTxt5IrgEo8qtfeII3wnlkKDpmo4CF3Vyd83qYN1TecQ3HeRk?=
 =?us-ascii?Q?eKG5AYuIC1u4qQQDAtkoXlnHMzWgoi8aTB4z4NJnZZy0IbbO0NsuusIjcIub?=
 =?us-ascii?Q?E042ZTL+H+BZnV+UwIY1vUJTtBlzNVlyR5ndrUNwFAe1nqmXNHm3h8rWMEUh?=
 =?us-ascii?Q?wEWmMLKpJftZu5diQts+ljEJKwDk8Tobt/W6892IE/s/DQPPGVYST5UW+zI8?=
 =?us-ascii?Q?0jnNdD72JK9m4k+jSZkMyvaTaA7FX8u805tKtGykB6F0XEISvVe6uD1z5yck?=
 =?us-ascii?Q?UEi7pQKSOwd5LwHB9nJ/vn8qyCuQy5ZgYb1bOCjdCkxH6mNLqDEaKaDyn/Pq?=
 =?us-ascii?Q?vKE613PW+RgsdJm8dfDFm+G8TsE4nJsnqVL7pyRs2q+p65fMAn9zaI4ms/cJ?=
 =?us-ascii?Q?MXCIsGyQ5cwOHP5NrUtgS4c78z5p2jHk66JhpfkJPH+4xV/jX1sYx5mZnr0N?=
 =?us-ascii?Q?GhGnt6qAMcRt7lpP/yDKKQP2gNlNAOC2qv0RMBHgoM+m7Z13xbc3y9ohyRt5?=
 =?us-ascii?Q?O8d85fw97b9mE2IgwFZiTTFcoBxctM71KrynXV3iT2npuL6+4Qh5Q9B+0bjg?=
 =?us-ascii?Q?1D7iug56u8+KY9BrDKo0+SmmHa5rLIvCeIvOaT8JKgwE8BgKHXA6QFW9svVq?=
 =?us-ascii?Q?zkJ6Uo+uAp43vm0mT3LstxdDj/buQZnD+RIcbamdDuo3y5WtHvb9fMfrrHkG?=
 =?us-ascii?Q?kjcEvTwCGTurKyqVhjzpTMZfTuv6cfw3BUGcipEXak9CIJrQ3GbnxKQMiayq?=
 =?us-ascii?Q?DxU9VnobjiqRxjxAYgvnMUU7+bslWWjR15Fkc//DLCV5TNx3gnOSjw64NDE7?=
 =?us-ascii?Q?62w9WEcMRdaVBZ7V4eRFqGqH9zlG1hX/FriZSTZIBF664zXksZ1k6+VQ4nqO?=
 =?us-ascii?Q?Sdvd1AFwv1MDH1m+SOZUkTLhF6o5GCsLrapvpU/MprMOlj0rDjWenBzY2HuX?=
 =?us-ascii?Q?QIOrasrsG/sJn/XjgT/0fjlFXjCfZQ9s0QEGHPoPUqhLNfv8FW2Mq+EdGNKk?=
 =?us-ascii?Q?+GQNTlK+5Uc/dcvHcU83q+jcAveMwLwtVAg1yo4Uxh83x6AkCwpzRhf0EwqZ?=
 =?us-ascii?Q?B/psaceNCLkAlJTshbMn5MDChzEr6Q3RB/3Tumf66DOblakYsBugNrkIHeY9?=
 =?us-ascii?Q?vZGy+XcqOv8JJrKgKJBs/kT4lznn0D91KSPYQSxXatQ9D6zmIb8T0FiEjBIO?=
 =?us-ascii?Q?IH0wvh2s4RRe3C4KQbYOdLunXDcrN2k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246cd9fc-1c87-4418-4730-08de5852271a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:40.0878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXD2en1PtvYq8sJJK8lBUI2lR8Rqbb6K0JVra3xQRvqwsxwmAuID1F62Rf8FITdqRjp/tFBMO32UC38Zcwr/bXacAUa8AKgDjTiOgNZN0yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696fca0f cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFuh8EWA25_V8OYOZC0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: --s5M9hfVQ2QT16p47mEDPzCsRnBW-nM
X-Proofpoint-ORIG-GUID: 6OSum8xPO9PHCDFHhYBvt87KuX7fRdOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX0HYK+Tjhp4kF
 qhlEVk7TF+Rf+9mgXW34v9ZzEOXGDlDqpP+ARYhW3jAgkqA1nbbfeW9dRE5vkOGSAyOWsSg8JvJ
 sVW4nr8x4LI24Y4gsHviJyCBCOlNffGGLmq5zwyZ5wit/eKKN1P59emZavB5XxUvYnzo6lxB+VG
 YjdFaqg5SA6snyfSofmsqNH/OOL6+T8k5v7eNE+GB9WGBp2fCWNEYJlTesc3vJY6SCxUaqu7M0E
 T+s3g2/qPaBi4zNVr2nTYIKycgjpKVDCzNq+1PHJQx7tJbnTxkKE57qfQk5+DVQTZDUx/EUfit4
 E3QJJbgjD/GaaNDi6x3cS+Fcr9XHvBk83g4jrPO4mmrYhNWi++i6ZLQkGNcOMZ3qvzQz58D8ViR
 PP67b7LddA9isvE4eScnoK8a3NJkUzh0yS/qCxmOL3Wk43ruKJ+M39Qjyj4SB+SsBVZn4Ku9QMg
 9b4iylbwXlj7EBE4wiw==
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
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229782

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


