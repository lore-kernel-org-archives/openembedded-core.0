Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BEEE01FA
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64808.1767104206189141168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X92YP6ec;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD9Y0p2560404
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=; b=
	X92YP6ecbOwlUwHejbktwDYlz7lLax+VhaH/68uwj3MRzEpww8ytoeDZ+yuEUGXC
	YWnojpKSRem9eC8oNVk5LAWWysj1KSX3IaS6Vk743CL87GU1mUq4PZpz3K2coH+G
	nUMGbvtd4QC+e7ll5SYQziWhrZnjJI2x/jCCynM935ZXcnKjmfRJH/5ipHB/2uwO
	XQNJO0CA3VJmH0oj22Zvc+dbAgoNywh4gIxBdnAo12nxgmbaHjIkNsDOz6VQQbsy
	M4WgL5EA9IY/MCwCIiFS9zUBMh4vXSUs24ldjyhunDm8J0WuuTh7rPDEYpJure1c
	cFvAz709KxhwUvTgRfYMMQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010049.outbound.protection.outlook.com [52.101.193.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtxt3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2bWheINT5bIGtz0EiylooS1jXJcPyT+ASdjuLCtgVLgidYhRFcLouqBun5DqlcAPc2o1KIYxFyjzx51VRuhDEekGj7iOdfolHEyx7XBSUD1ZQ1Cf6u4zo/YSgqfDR5n06HuIJuCggTBJPfgaKcVgL95U/+rZdm7lKHl0W+rCW4npuYoETBKEFmig420ykjv7dUjM8x41NEdqS5wxKWRjO4uayu4vw4fDI6m4v7T0Ol7ZP/6SHrQNSDGcu+eVBNzyyGv5n1QdcDd8HUmhWgxrtplFR+1rRbEYakbhNolhgkUoP4iw6qQ3F0wasMN0iEwR0m8EW9AWGqNSLOJmokWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqyLIP6r5DuXj6u8HBgcjE0zoaPxXTO2xQ2SFmbB1w=;
 b=tVm+Aw+v4iSZf3K2hHs/EUuYPy4AbQVi2h00Oi0/saJ6DJZwJxcYbQP/eJ1AnHu5rM8HZ7CJhSkfL+Z0lfKFCSekpWdaBl3DQJ+fUpGmnJVEXypVtMnHZBCXFwlPQd0qmWoIwXr+0X3JtfNfZnzWlCRIvBIlXCR7OAIgsRYdnGcqGDdqABeJWrHVjEDiEdXEaBKwC9I+g8205Lxaal8g48MEGW2zGDAzVC+ppStCfYKP6YYb3FYBHrpo1Vjq2qPZ7IwpKk2522sxLt/t8Afx0Q32Dy45i5wSJV8x9aJ0uSxtRcGKm0nNCwbEI76GzSi6VGTsNQcYRYG4hEQGjxWOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:42 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 13/15] module.bbclass: Prepare out-of-tree rust module compilation
Date: Tue, 30 Dec 2025 06:15:38 -0800
Message-ID: <20251230141540.1974380-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ab5549-d575-46a3-e63b-08de47ae0e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zXExtxRMIaUxV9spvilFWMltq2h8sxEBmkddqQxAgcJrXfSStzOi796XJc/d?=
 =?us-ascii?Q?dTTBUe+etw5ZMtbsPSuLXoBE5QPxZIvbxHd2oTqr0xuLh8iIM6WJD9EaVF1M?=
 =?us-ascii?Q?v8czxHUQnIcfurTOGb7us02Nu6d/hmW9WqXcaM43zUjRBh9nVInmx6nkGwM8?=
 =?us-ascii?Q?5/09yCOWr46pFiw+zPwOJNwJTPHVjTSrcarAu/UQHLmYSa4MVgaVUQ8gv8sc?=
 =?us-ascii?Q?JC+rz4dkugfzcH8Ycovdt4NANyHCSMKael6lW5eNkI+L1G+AVVF4taZ4dkID?=
 =?us-ascii?Q?wMduYSi/8y+7yqPNMSh1o7nREono77UH2+rUxKmf/7Lmj56JaSypHcHH7P7T?=
 =?us-ascii?Q?s1BbnVeeBIao1kl0z4D0UlHscMGdGF7tdl2mows73VEVSd/GuML8wUYiXccJ?=
 =?us-ascii?Q?HMOT7oJZwrD8otc3uWWq0PjibRSahnbOolPqQMnN6YkZq5bvh0aBTft0s9Dd?=
 =?us-ascii?Q?Cm2l98Ro3qVHEsLaeIgNNc0IvaJdJv+oKDpSOlTElxrVsOPQV8z72QdNmdkK?=
 =?us-ascii?Q?4iDaHxpe62sXSp6PoyoTLFsB+m112q9cKFQdk5RbJ/IWPX05BO4g+esz/DTQ?=
 =?us-ascii?Q?ibGeeqGDyOINu19wJNaAUI0TZUBIuwUdhxiI5xBhtBvawUJkkKPsaHIkr/6J?=
 =?us-ascii?Q?zsvTYyOXvmADcB/oJRpdD3wxERPxPfwrwWG4oTwpSFg9n7GC/YrqdBDjsEZE?=
 =?us-ascii?Q?QH15Z8+s6PfElteCa0tI751Z3KcvDFwI5X5+eOxBgV+67oc33SlkH5lw7ZjI?=
 =?us-ascii?Q?WXM8zXqaHYNSDDjvrW4OOY+df+7H001Llm3MnbBK+pNsYm2n3EvaDEFzJRqt?=
 =?us-ascii?Q?t4b8tgpqhXrVqrHek26rqx1yPjfMJYKsl1KJggPitq28M7OBw/IDHV4I55C7?=
 =?us-ascii?Q?/51sfo7XLlGaJgG6itl26Kt2xHfoq83Juf9rqmzq4Kwl/ZlXkDkLJqEv4MLT?=
 =?us-ascii?Q?sa0CiI0JmsHXSBZLc73ORArl1zqPXyyhOvtiVJb6lLmCNeu83k4t1jvZHSlc?=
 =?us-ascii?Q?94eXGU4b3rG0zELs+1THQ39FNdsuahXhcS5T5LTHqKtclYRi0d/Z2oVHjwgm?=
 =?us-ascii?Q?JfUqvaR16lzfBSbgQZM3IoOrAuWPfoVP1eUBgHOxyh9a4brMWKkp0PVhB5Bs?=
 =?us-ascii?Q?MFHVsMc152V0C5qCeLjSgyQPSncWLkxX6wy/GKQ1EG++4XskksOMvrd2yAMJ?=
 =?us-ascii?Q?ZP2J+UFq6RLzMLD/6HTh5ihWLR+wUk22hC5RkqiZ75G1NC6YYrVHdeEiy6nc?=
 =?us-ascii?Q?ZKO1YWYYK6tGpzn4U3/JnDgYXXFf6oW3dFUm7PS5X1ulABZ493dLrCG6FScl?=
 =?us-ascii?Q?xtZOEvSZ9eUG8NcrBa3v4Al4eQSuU5jQj7zygUoNsTlOv/UNFVjxXtMSo0zQ?=
 =?us-ascii?Q?oGF9BF/JjShhj30xVAuPGmEuh1g4wZ94WDr3NuQRwhajGTGT2ZrQyicCQ+Bn?=
 =?us-ascii?Q?sM1FUCFO6RZQOBA3GnO5qSU5PBjVOhE1at4gq+J1SVK2ciioMhtKRd/e00m7?=
 =?us-ascii?Q?h9J0nu1wkG9pY8tM65w/vAtKhMHu6zsikXcv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BrLfVUysl94YS9GmqVnlvxZLCzJYrqy/4eNC5/9T9uRpvFugxYVGUe59CR2o?=
 =?us-ascii?Q?YTvVHzQSZkadIHdF+BnQrgdQImfs+nzGV9Xt9s0oqSU2OoHmQSJImPCCX9wt?=
 =?us-ascii?Q?n1KUGn/ZZIL6x/J755jOcO2FFIOev3GP7KzuymSHjT+AyLiJb5JATBgpgRTO?=
 =?us-ascii?Q?nq9tGtmstzMBVL5gXeVYjsMf1141a41Ys98GBLwEg03WM76utwyEvwMaqP15?=
 =?us-ascii?Q?H2llLiGHXDY9Q1ZBzruYopM/nzdQcVAvy9xGqCymbJB9iQNXV/JZUhlC8IUB?=
 =?us-ascii?Q?7GSyE9bCLQCFOCRHzjSTnq5o3WPu+gZywbubrfiQSG5AYUuhvQukS7digDaU?=
 =?us-ascii?Q?RQ7wyR/1mQwuGE0gVoN9N2296TwWn7Vf17wqkrSSK/JQnOr6nbVy7jFf2y7R?=
 =?us-ascii?Q?tdd0HWexzZyjsm49ik/FmXz1Z+rRtW0DyuKgEAkpMoRnY8R8sLPH/gJ7Hgpe?=
 =?us-ascii?Q?EOtrcstdLIV0XmYMI10MKmmWBs8CbsSZ5eEiK7qdckMg3AzUhXgilunNw0dY?=
 =?us-ascii?Q?2R09zk4NIkY0iOpA2f2QHG7J38cFXPz5DhYRVBW2dOFVhb1lufqXQhcL4DpZ?=
 =?us-ascii?Q?0XYNUlznu+5Ft2bip9X6Dyctn8syppfZYjZYZK2yADNWE+V2Sh9YoeebUAPF?=
 =?us-ascii?Q?1T5dbqFwhG4+icw0bHI+sulAHL12LpLUG57Rco650WzoB8SjhZ1kYLyiqtqP?=
 =?us-ascii?Q?Msc6dPnu4o9FAdRjMa8/zWvZdOJHG1FH28KOWf7d6pOfLCXfAA5agW9O2oV6?=
 =?us-ascii?Q?jxwou6yqGpCfhw1T+u8LzLrMvwgUhPyMSW19qhtHxy9Qf7h/YehdlpR2EIAo?=
 =?us-ascii?Q?dYV3RBEJjxnEYQfXUBoh7apvmCxSGdHSx2VujOrPaJRr/FVv3kvMV9tzgpZc?=
 =?us-ascii?Q?hge/fjJsiHR6mpqbYclnPBvSJoksIiiBPWFTy6LphMitCYUDyeKG4B93A0YL?=
 =?us-ascii?Q?8j7L2UuSSYjM8xhYz2h+trVSKWnLng16/qGCrIOJRFAGNhKc4cQ1H6mOZnCJ?=
 =?us-ascii?Q?Avbglo1MbA0MYRdw6m/eEbM4MUmcfIYiXCjXpmyjCsA+ptZ/Rjsg3vnKTW1h?=
 =?us-ascii?Q?557wt2/Uwb9MugKRAYJvNF+hvOJqQ9Ni7NNVkdnrbPiIZu7b0oGF6Zu63vYX?=
 =?us-ascii?Q?DMwKvxXr+tm8UymxFp64e8Tv8+TFXn1iuiprIpFV13z0EMkrTXtdMNSnwuIY?=
 =?us-ascii?Q?xBZEbahuOWwYutXFfFzVUXYFEjC28OUs7yUdoQsKCaOC5mNelt6nxOp/cWhB?=
 =?us-ascii?Q?cR9TOPR0VxT+6pEsX5yy2dgc0GJ+cLrP7x0Q422Y1F04KNjZj6uH8XII7qSv?=
 =?us-ascii?Q?ByJfSqR70BjaBAcmzY8Kktbb0bOySICcLEWc4vxYxu/WcvqjbL3xtewz25Qd?=
 =?us-ascii?Q?RaQ4duzaZ2qOWp0AF/I4ZTs52urbF2zAn1iC1tjuYmi4UdrH4wLjw8004PIj?=
 =?us-ascii?Q?gpIZEx2WbIbBGG017Mi/Nm/InqisqDFZx9GkBjsaJDX9SNNwybiHCVJE6wRy?=
 =?us-ascii?Q?+RKw0XlK/ViLO8yjO1cRx+tewyqKxSMhm2jjSl7KXy+9CXoG7O4h5t7d314/?=
 =?us-ascii?Q?YAxKSs5sW6SpwpV0Bi6T5WPoqy7AGZk8aQlT3jufIbBfJjlnLElQZfd+mSpO?=
 =?us-ascii?Q?1gLf8Ag1vFvwgqSopMUoNFIQmlKd592uvv53bfAsZLCLDvl5vTSIL4XXJb9F?=
 =?us-ascii?Q?un9fPCmdUgO2S+TMvPezEptN0z+IVlDA+6/S1wJaxDEgVYEt3rZmzy+V1Np9?=
 =?us-ascii?Q?GVprZNURvR9bMSbtEErC6utAkvIG8aw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab5549-d575-46a3-e63b-08de47ae0e62
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:42.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDvypTiH8fTKDO732Kv0K6D0UcXDUQHEtf0zgOkyuJ75vyXwQKNLuyj7oJ6UVSsqHPbOl7/O7uDE0xUTJLZMw3KMHGOYZLjcl2GQ3i5jd/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfXyMULOcb3mvtl
 hZqlEE3dOpQ49f69EnHlPr5pGY6pHlrYT747nbs+TfJXDhRIaJa1DikQFfedMX3eQNNLStqkf0n
 9CoHiZ6xlqtPlj+MOfWt7pfMJnHQiVCGure910P9cFgGI49xGnBIIp2+fwHeI5HuRk/RfL+YS7h
 NgUOlIzR3DD8UaRf9ASzbUXRpJQ4HjlyGz/GYB025xzZL0viLRxT8CNwNKP71eP7p7cdBAZIhY2
 KJFddG3m5GSdzPU3FluzMC419OxURow4CXw7x1JWJyeFJseFpqKdQ25bXfvBYPdDb91YKm8Fj02
 Ip8A7SvWqbZLCNSMICjqiDm2958lHoTlPd3X2+0kznrtSy9K3LVaG1G4f2DIBrejkeI1ICOmP1y
 lz87J9dztKPT9BwrfbeESetSgoDVMP3bSf8QRqJa6dRM8cWGay4O4Uz8VqEAZZ5gVaRDkC3vf+g
 fTwlqJh8qUQXnl2ySNA==
X-Proofpoint-GUID: qEo7cP9qfNdjXMSeHc6RNO51lRFu980n
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953decc cx=c_pps
 a=ZSUkm9skZvR9PgEjA8jAeg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=7FkU8PZzVy809Xrk7IwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0m78heJw4eRf8xXwrs5HNEy9KbAmEl2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228679

From: Yoann Congal <yoann.congal@smile.fr>

Conditioned to the "rust-linux" DISTRO_FEATURES:
* Add dependency to rust-native
* Remap ${S} in compiled output to avoid buildpath errors

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/module.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 4948e995c5..7dbd4194d1 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -87,3 +87,11 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES:${PN} = ""
 ALLOW_EMPTY:${PN} = "1"
+
+# Rust module support
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'rust-native', '', d)}"
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
-- 
2.49.0


