Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DD6D6B09C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19155.1769704780605450764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HASGAeXV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T6JCAJ1549685
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=; b=
	HASGAeXViho0pTA4fUBPryD39U4FTW1a1gBzqlXi18QVhiWeaRL5pV+xttk0LiLs
	Ndjp5xO79UFe0La4xBchtU7hLDZ3kmZUgquLgEBZFR6RxWEI8JR1P0+EW1+zd9/q
	x6MerFdSC4Q4xYIavViQge6bGlxNg3vgVa0RcFqokGWXiPWu/goNGQBA5EmbuB7A
	rYpQAn2ks6bQ4udzC7gFekb8qYm2lYz+noUpC0+wqjV/vdc87JOWw7/5ehI71fXS
	GjsAs3oAQVu+zf588/s80C37wSjt0AkHtJ3Wqpvr+Rl6gwDhCVQIo5PAZZ+YwMv/
	pqOUHnBQNOrNmPhomD16Ww==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t8smn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgLIGnnNiNpb0nGNJRlwgcLPQfQNlDp8NEOkJgnTNpSX0Is2RaTz8wA/Uc/d7oFyQBD4D7HBQxEITULshhUQzWQ8s5WyOfD2Ty2b0TwYlztYkOhxWp7Ee2ZPyWWh6HAwgYTm4SOZjaXaDk7rrsLVnsBkkgAqxaJxN0Mu39xTfzhVdfAh9sW4YwwJa6e5TGLp0xTl1gs61R+Qp2uqvmczERxiD0W74t1Cqa0MAqvzb3SQVwzbMTxw5uVzJ25Izj7hOMUmlDk1EPsoPYF8ZVeSk6TDJ2vm3Ik5L+oaT/SZxbbIQYgXFAdjgYt5Ev+2O72LfzaqUdnfvoI9HGYH0Q2KOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXT/I6Dfxn9DiLPrD+J+U6LQvETCL5/Ok2ih/g05DQ4=;
 b=BFBk5wwCaq09Ph6ivrkryv2KvnpWyPw0/BCkvy2Eu6ApcDKYh+FHlunCIPqtozmXOhI/Z+891aUjVqPL02m33IHx3UtfZwYjrxSaTkjCikXAcSBDpTEUZ9vmOFflHWz/Wno9z7BYPSeQlAkVph5kwZePcSb662STGfL40UIBOVVxa6SsmaxHecm+bb73rGg5nHrIYzAz2WOVI6eoT5FRXkjmYhP64qQybWu13UI6PxSDhdFBE+eBSamTcz/zBrbbW9nizroyrxOx40oJYduQIAhLXEDMoc+EvG5uB2jtyhPKZJNE3hPIXuBEfQBC1TvB9HETHWYE/X1r6/8Oxa0hRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 08/15] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Thu, 29 Jan 2026 08:39:03 -0800
Message-ID: <20260129163910.2612040-9-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b6d02bd2-cc09-49cf-a670-08de5f54fe10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3ClU3gjS1UgRBIy63w9U6CmrCo1aw2tUQdl9Wn1RnskhiqfCDATLN0X3euJX?=
 =?us-ascii?Q?L7WV1LIV9TWkU5spQchjQIAPy5M8D7u7vzaFnvBQjcOxs355NJPwOh4m8axq?=
 =?us-ascii?Q?ICGJOnn8c59bk9BeyuYKu5bF6uNjKniMCe/0/q+pVoKumZTHytXI3QcIujIC?=
 =?us-ascii?Q?uzO5rd6FS2r7Vy3qqEqzIsfALbBfTDVeMeYVEHRn+bLmQF9YE+zBTRXrwD/i?=
 =?us-ascii?Q?cRS1qRtY9tLzCnT7bhpHIT+XI3pWml4brUR2KNd4RbDMwXRma6oQEG3VHN8l?=
 =?us-ascii?Q?0FmJBre6tFTBsGrFYsfRrZHR0KX0Q4d4byGnQGqo1znKTkoz6zJyl4LA1AXV?=
 =?us-ascii?Q?SG5D6CTjJ7aP83qr31X3e+nObeJjqBxVcqKwlUxVFG7TRQIUGWmgPa593y9A?=
 =?us-ascii?Q?1dn5ELCLZQ3edgmxHDMtaMXBc8Jn4vpG4aeDanIITZSSSEcF7dbOQIPO05ys?=
 =?us-ascii?Q?Yz1azbqYfB41NOq2fUyfbiwjHRYV55mPKHzK/f7ftAiVr21xDj8ynA76+8r5?=
 =?us-ascii?Q?YIkcrLkWMKGWmEb04qk2+yprhmGb6ssTn2cG2Oi6BZYmQh/vXAQkPAyR4fdY?=
 =?us-ascii?Q?zbjupI3VapwxzfQlg1uYqCHrtyWouBS0UYR/CMiCH9wWFZ2hZgk0zjvkVlQ2?=
 =?us-ascii?Q?LHVaSq6UdPBKrrP/ZxkEWLoyA8UGxlqJbf91xyYH2Ypdm0/un5x3iFy1I3NE?=
 =?us-ascii?Q?dnvM4K/Skt8wT1IUPhnYSfueBnKTzwDYV3J9ANfqGF0qeDilcui1J11M4dfI?=
 =?us-ascii?Q?1+e9b1rGn1ANJPXMy1/GfC7uILjVETQimyKg1rqztkRR5Wa4XzAJkaWbdPul?=
 =?us-ascii?Q?6k6kBq7z6Y1Qg2TzgO1a2O64KItXjiZbMVH1E4cz9XU8pJROfoANitGFRCrs?=
 =?us-ascii?Q?9wONEglkeNzQt/UWRsKMMq1db2HH5deViw2U5juM49rUZf10yjukNEfocr1U?=
 =?us-ascii?Q?pQXc1r6vDSW9r721j4GNKbeXrtXaLulsYzgPXe4UIUjG3knyYkJLznRgxhc5?=
 =?us-ascii?Q?tIr/48nabaqiHOP0dk452AsPaz9OQNdVraH0dyig14wuKCmsxi/g+VO+Iv//?=
 =?us-ascii?Q?KWuRMBZdTn0jfLENzR9d+RFbXMC7+Ul957kVOeQjwcIW6EcX5mSl1SiErSKy?=
 =?us-ascii?Q?iKsKKGHeu03a21+YUNUTvQfwveFI/hsBbqf1slyUx4zwQWNOlvTpYUGRb+bm?=
 =?us-ascii?Q?+KY3WHZVTKdESjcGrN1Ea5GMGhqNk3GfKxNFk7m6SafL6QYuepI1ftl0NrdV?=
 =?us-ascii?Q?FZzWSFxwREbjdCEZ9VJjqrBlMNxttcztLhtjP1j3xFYzi3nj+8j8nyLqmddu?=
 =?us-ascii?Q?heHkIgt5Y4bSGzUKGAFcb+ssD+oMtLQtihEKN3NTMy+B9Jy02TptGAckNC4i?=
 =?us-ascii?Q?NA7DF4nNG4E5VHgQCRDxfr21MR3iE8Zb368dUK/yP75yqBykRcNLvxxB74QP?=
 =?us-ascii?Q?d//yZgtaT85MGM8N5iNsTGCwytC7aa4RZcXp261dL70m0wPotlVz4NBXPbWF?=
 =?us-ascii?Q?c0tB6OafCA3PgcpTcwSZIAjLNh/DrOUr3brIDnzxliJ44ipqyAUVa8yhbmjR?=
 =?us-ascii?Q?Lj9kCCJBOjdJP4lhHP4l3PzVXYezYy1GNlYk9QbpkQ1fO0ueLgEVze0JP+Z7?=
 =?us-ascii?Q?uPfRdkCo3Jv8OOVCnZEwDlk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tKYfhp3Y2fS7SIDKlbTaSL8v9QI8o5RCjYLDJ4wtkVnN+W/A7SfC7Vf4Azw6?=
 =?us-ascii?Q?RKmyjGGdFHdAtB3XZ6+xi60VukgIaq9GfTA432+o/SprbdTOFvmf6F45UKlw?=
 =?us-ascii?Q?nS1yceI8VSOGLMiqJpTD9zyOcJWIL8kabFjrs2A/zOdcjZaACQHuPisRafXk?=
 =?us-ascii?Q?XX1zk0sJxTj3+/7LfOS3KPs68j5HtC7zfm6PjIKF9F1U7sW2dxc0Xv7t9Vlv?=
 =?us-ascii?Q?f7AY6NUmAINnjdUH08+OESC5wxjnUQVeGV9eJk7gxZmpcrAdofFCwcLi3KbN?=
 =?us-ascii?Q?SGntMcVjKbfanf7I5+t/r4wVCkaBDtAgLyq/tStJnPkudttdlVi82Pc1+eWk?=
 =?us-ascii?Q?H7F80y9CNMJtAZqkgSTfop7dJ9sS9pCdKoqswll7cBBlgJxSLivLyw+DHZ8z?=
 =?us-ascii?Q?gJEKFTRvYbAb5Uru+U4xZXifLZTL8wT+RFrYhcN8kHrVLNdQjrj4MgHgJ0DN?=
 =?us-ascii?Q?41zlc9wK5t3L914tQAQhWzyu/Fc2ZRjR/Zkug496kUUdwhKJR9KYFTPGD43H?=
 =?us-ascii?Q?gJzJ57fS6mvZhdQAAOb/zrWdpBM4KLu8K/KbONH7/TkNlcCRapVdgkDByDqM?=
 =?us-ascii?Q?WtW1ZI/h+TBmQs61wgBoZfrFv+HX/PtXHGbjAvjVTTuREyZp5tlwYwHZdOOy?=
 =?us-ascii?Q?26p8kqhXnnj7Wx+dnamuTDTzW8hfR1oW9eGQ0N776yC+lxKq9Hmclnit1izJ?=
 =?us-ascii?Q?3AHsQVrArNtH38s1jI2JJuglsLe+L9NVNWQqkSeih3a9g7yPahfUc/inKq7L?=
 =?us-ascii?Q?7aYQiKzJbnb1VmqjyidOhKDA7ev+c1u3Owf0/UiM0I4abryPTg04nTIEHifF?=
 =?us-ascii?Q?nonDlXQQwPloJTrv5BRTtIxD2bWYJ2fXk1wKeBqyEGu70NfDtC0zndt6wN8G?=
 =?us-ascii?Q?Gi3rdxpC7y19LcsNSCGwAZckJ6ielZ21JhobiON/GfAIGOnWQ2+OYELuFNKi?=
 =?us-ascii?Q?mjUvGr+K5k1ypcXvQPdFVurIAkrc6XfCiSZmDWQuZMhMiFZZS4N0Tiq9rtBa?=
 =?us-ascii?Q?Ze5CtKeP1Mjnox5Im/DUA/+waDAMY0LF5GhxS6QDhJvaXQ6WLkWlzJIT0x2F?=
 =?us-ascii?Q?wXnRvFaLr1+HiOZPhNg2Lb2hN90JTsskfJkdg9QQcanMDo76h496ZOphn46Y?=
 =?us-ascii?Q?lyJTixxnIRUjwqpk/5ufC8MRu3fFvk37dCxC5BLx+fQz9Toc/PxYBU9CtABR?=
 =?us-ascii?Q?gexvNIPg1YEB220RwZfTMolI8/qH2FXTquJyLR1ApndPb6+Svah3CaA2xfS8?=
 =?us-ascii?Q?DE8Z1ZhZ6s5Brv+3O71+8KCv6vIXauwCtFWu08JqdZQ8/4biE2FiM2DxhJBV?=
 =?us-ascii?Q?/0bBw5b0ZIF86h67EIwwzHIE89IHRmkdhJiTk7I97xj9M2+fmXfHQ+ME+Shu?=
 =?us-ascii?Q?iWYOxa/ATEl6iFv8uM+zM4L5yOvRRclduIdrc0ypLgUy+EDjNV7E4TpZQWSW?=
 =?us-ascii?Q?ebddJga9zOcrE8OPL4xC0kqRMtoJherGpJ1baDunfGfGutM7IAGIB5+Zoj7K?=
 =?us-ascii?Q?bc8ybwYYoBiA/khjU7v2kegfrxgjqWopbIUoHkYnbENoCjYJoCp/eHhToxYU?=
 =?us-ascii?Q?IlcJP69bAp5TxmHAlXApQ7HD2LeysfKKwslMWaIeUUU4+b5yTeofj89gs5lt?=
 =?us-ascii?Q?Y+FNUTwCRJjNQ++K7hMoYn2YiUWbfP4aoUz2z/ONmE76MlILFOfYCGd2Dp3h?=
 =?us-ascii?Q?7GBegvaBapvWCcgdda7ewW65L/z2kN5yA7tSsQx68CPjbe4dNZEsWYhBOUth?=
 =?us-ascii?Q?T/1P1DKI9QvzVOHo0OYKZ58ZSCmof5s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d02bd2-cc09-49cf-a670-08de5f54fe10
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:37.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Da51uWzVm1VOxnJSj5nJZwihSeCM4tcNHFNsSZLLhTltD6rnN/XpkmZ6lpMxzI/PcuXHmVOQ0EYi83RL/fzOBU6Xx2O31kxa/oel6qJxXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: JS9k1huSLqMcTYN-bn0LZA50nnMx7dTo
X-Proofpoint-GUID: aawtevqIn2wSMbGNrPdZOp9iUoOsuJUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX8KKAlzYwh4rR
 BgtBi3Rr0Ym4tcSQxDf+z+UddH4pE5Gm9SJKuEklKaTCeubd31H3161VIGPjnhpw5H11H8/DxLG
 EETLdVsRZgNJ8Ostt+cmQAT6b3BwZH0Ko0ILYlVOOHB7xbkJwz/cnZBrg8C9MrB9sVL/ke2w233
 iqTmCl1Z2+ODMOOeAXKJaCH9uAOUCGASb/0T2Tj8gkWaTLsr/TgPZfWXObjYEheLk8Me//M4kqb
 RN68o0F/hAqb270tYXuWWSPT0sCFPwpSlDxUvz6H9NJKG7Div7KT4SYRUdrnSisAiNkloU6ngGY
 pfWicbDJEHRumHaq40Ggj0gfFL5ZoeXtGN5F/BEbz6VKN/Ik5ctHYbrkULIDewyQ4fqV7WGwqEQ
 ZTxDJw81ma1N0m3LbYlOu5p/GcedA0UfZV6VAw338CabpZcM1EkY1BaCkzkNhNAO28KEm/jg3ya
 FqujUZNJSVqGKq6ll+w==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697b8d4c cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jGeDP5ryJtbC-vnzprAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230149

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the  target & SDK
fails because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the  target & SDK, copy the full rust/ directory
(of size 2.5MB) into $kerneldir/build when the rust-kernel distro feature
is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..07f082132b 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,15 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects 
+        # needed for building Rust kernel modules. Copy the entire rust/ directory (of size 2.5MB)
+        # to avoid failures with 'make prepare'.
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


