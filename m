Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5FDEEA843
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51755.1770919892015480728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Em4BPxPc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5C16e3049776
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:11:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	Em4BPxPcqxMs77X3ayd52djVFFM0GUERUm1782jNAn3aJLh6/Lp/QIwa8tFWPuJ9
	8QVpdkood8aP9QHFs2KXorA1hoxi4tFZNBMSyXc8UrbAqqsNStwhzy+66bP1z2Ds
	MnDtDFJ7ZFeVbHaeZpQ6ffjqEdelCp0sG0FrsN+IrdaJDRQkJpuZYsgkpyI3+R7y
	0SFRvqEVEjDzIGGA8knYb1EAaZlBM6EpSGvddYb8fTnExLtTkvPfQM33cHOloI+m
	px3BxsLRcOT6W4IWwvYP1jUqrOJBFaeDbVi5GFDf+e9r9tv4Y7P9ruS3gadCjOzZ
	kM7Tati4kU/X14l0304Rfw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj66r2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq+Y9LL01bfowYM0AKgM6G0xgT2tVue4mfm9EaMMt9hI14QStRH8EJWHl03cqWP/OvIQk+L6NSdlpxDPqxY+3w8Qtkyq0RXzyDQjR9osnDVQQoBOePZqRfzMaJuAo6tIIaTi+kk38y3CHvUP3PQwczVufXfDdLvPpoeL9uCPKpBRX0E/7/GL2L6j1XbHmPtCDihehpGs09ShRqjlw/UC2rap280A7jgSezChkwTWPjDB6WH2iOKWXzBwO/7Xkio0JznBFDNXOziNhPG6pkDQrKLneKkxnzNG/9NSvpF3GMeBsZg9iHNYswFC04Jxb5OebB4+EqY7rooi4m+MTEtDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=Bv2EWAhxHM9fTqx890lUlWDByyLKz3mJ22XY3gyLkvvII7uYpjusuynirik78mGIjWHN0bEd1vCEnnKJdEOisGYoAzBTXdIPgDaO1Eu0fXgCwqNwfviYYQ9IKvI393IB8e2vLwRfliyAW3JuK7kY3pWiHCIw3qXJScEcdi4d30d+1oXqb6+LYIyb1Cr7Ci0wvr0UGNyUPjhNdEuX5E8kv3VQWXpzgA5s9yswTogTaT4MLVwquS0o3O5Nzie9fp+VQTcJ1RMtj2IcdkX0cP2Cf8Yc7HL3cXGUgLHRHyO4LjdLSyvKQt73Lc7gu42yZeJvYB0MgsSwadcEfIyWncDaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:29 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:29 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 10/14] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Thu, 12 Feb 2026 10:10:35 -0800
Message-ID: <20260212181039.1826154-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b518700-8fbc-462a-8ecd-08de6a6224b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M2iTBhzfjUbtkKi0ItMiziUXcTXRWVxNYhEcGxWLGX0ZYfRfPTqQZ9VpOsyD?=
 =?us-ascii?Q?KN+VxECwhpmegbXDaEnPYCfGmYrFZ2DbP2t3cvcGsghu/X349zV/8muNuWRD?=
 =?us-ascii?Q?dWyTSE0FCS3hKMVrZBtEURKatgGp5lDEhmC0YuS36Y7EX7NKKni7zy6hQE39?=
 =?us-ascii?Q?afwCe3ubLrhprtTLju/oGhHafe/EcbZlCjZgdEl9/dUrAXTD7ivQ3c8DgKat?=
 =?us-ascii?Q?GrXpccD69Qjz3vccPTEI7DfvCBqS+p1QJrFxWzGthFqijLK7FAjyZJRpP8CV?=
 =?us-ascii?Q?LbUD8ArxLIKqkltNFXmgdSg2mYCfLpVZotnpmfcVaD9Snu/LmT0lKs79YdmO?=
 =?us-ascii?Q?0J7Ptqe0vMwNQ316lScpPJNupqS7JMrwgCMpfRBl7QkCGUFdCaviOVHA++Y/?=
 =?us-ascii?Q?wadE0+IPbXFczO8RcgIAdH7UCjiZEawSK5S0eF1NyC/Qhn4PZMtE18RToWcD?=
 =?us-ascii?Q?d1pwtHZfLGAu1jc1MC0TqbOif3TzhZi1xAABanO3ptn6M8FIHUVusImLlYar?=
 =?us-ascii?Q?5fRalWEniOh8aoWE6Ub8DWju0eLpDOOi2EpYCNHplzDT6L/JKd7BbgaTcltU?=
 =?us-ascii?Q?/UuzZ5InKlSRdPYt/0EkmDFC1QwlrVK+euS/0RVvr0yt2FEH6r9y5Nzrt/2U?=
 =?us-ascii?Q?A7o3shgaJKcJUHvBeGnJ/FNF5k80dN33VaxB56/p/jSQcWKihVR+S89Yx5t4?=
 =?us-ascii?Q?OENLeH8vLECcYwdRYLDnQM1upbWsA+d1s5WgVAGdN0Zzjy+W2QP7sci6tpxu?=
 =?us-ascii?Q?2mEAnkwsfsEOikk8ng/BiP9yoOlfhwZT63h9Tu/wFosSg5qAnz5601i7IzAp?=
 =?us-ascii?Q?5NeHY7jzp62vq88IhmlYu52Ah51Sl5yP63VGAW2JKRPh7f/6lBUBebN85Yni?=
 =?us-ascii?Q?rkCKlfRoe1Igt+KcO/QjWTg+/GoQ30cRm3eGybDSi4KOO4vpwCLgDHm+PS8j?=
 =?us-ascii?Q?8ZRr9p7+sYwPhA3wOT1SjDdstC5vNHXlg2kCUmgTdnxrp53dTuzPkjreutgY?=
 =?us-ascii?Q?ut+Mp99hPha/V8fwbqCqZgbZubL/UM5zyHr+IIlzVKMtPGruR2bRjB3nxBVD?=
 =?us-ascii?Q?kXgsdoHBAbqX5z0FbM+fFu4jjg49AEfsI9p5UGuSpdqhj58opungu+7hTyyX?=
 =?us-ascii?Q?wqf/82/g/YU0vTDtEJ30yhZDULPjKFSBtCS0MVppV/+OqJEYofMiwZ8X6dt8?=
 =?us-ascii?Q?5O/ytRty8WotviwFVcvmiwPkzhlRtfGZ7u4rs60ztb6R/nL86XrVUqGULSoL?=
 =?us-ascii?Q?0MbzpS+p/JDB8B54NOQXVYfFJEDfb7gH7FMWsqjLJGi59LQl3oNUZwGDdHUe?=
 =?us-ascii?Q?kJ3m5qQvR/yasWJpomMuD57tHNU8RTcvLn9Z/SSSUTBFHCCk/tLVrea857eX?=
 =?us-ascii?Q?ECsuuYAQLUVxpk4jMOAhIPsib1n/bp73GdhA1XfA0B6Gh4YC6OdrH5oT2QTS?=
 =?us-ascii?Q?D4Sa1qky8O2ATLWTNV15XqC3cn0FCBTRcHF1JEiIeAGrDvxQcEfh36K22fkg?=
 =?us-ascii?Q?zygaGOQ2P4oUi5o/QrHvCzkCxQmV2g25jpQNtQFKsv/utFoP14QUpp2rCDRZ?=
 =?us-ascii?Q?Bdiz0Jenm4iQoSSTNcH1pB+FRzYmiHE2mBehA9WcFUz0U9JnHAsu9xpBlpyN?=
 =?us-ascii?Q?yDy1a9oRhH18nyRHJL6dZ5w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HaLV/ZBHEqzPp8sQAqKK3E/nnWqDOGGap0sjFb+VJ0AsLO9Hou/lCOfJL+W0?=
 =?us-ascii?Q?FBqPM5hsJ0W62Vcg+fCWcJ2ROCaSepBLVPmzJ/lAR2JRHmah6ceRpd9cz1GM?=
 =?us-ascii?Q?ci8578jTt8roZTFOqyIqDtrIWeTzR65AAbdNhrOCs6Nn32e7tkaEitd9n3eC?=
 =?us-ascii?Q?A3HEVQf8PHx8GX6ompwHBcav1rCRfFCcnEXyHx/bi9E/l89KZdeP9SZCmjmw?=
 =?us-ascii?Q?GjggAJiqZOPrYPnoMSElfPO5dDIobNwcCqbR6jeARsmR1zzJGXRJ7rY4rN9G?=
 =?us-ascii?Q?td3Y6ZGE1NlJN/D3tFIEtHxnxuNi/xb72sB0DxBOAwy8YB6UD9bTDbR43sBx?=
 =?us-ascii?Q?eGEHG8aQCpZ/KmgS6ElYy7eQxozMv25t2PHZmcycTRFJ09e0upTtXkwytEVg?=
 =?us-ascii?Q?blNdUXi4fnlxFBg0gxKSGtJ/vb6KMon5D76y6aHunsgJGH0h05SZUQCBVDU5?=
 =?us-ascii?Q?oZs1joyqWjxqvOHPuAS0Rr8/tMVmZcgUOUDzx5/TPllKCOTKpOEmcd6oVhkB?=
 =?us-ascii?Q?2UkeFfFqJssoatQFQFhY47GX96/FmcI4pfWawzoQaQYtoePDjmnpExKv9uLC?=
 =?us-ascii?Q?U//nbDqv74pzQQsduhVplvEM+lYcm/NcmS72lyCepPuruuBkHwrWNVs+VfAd?=
 =?us-ascii?Q?qCwM0Fu9VDG+N7Ye57eGSOek1HSOqPcO51lr/35nwGPa8LIN4NqW3EdYQSP1?=
 =?us-ascii?Q?6h4x6lTcwmqJAg6JjW+Vo3xmDguLKeJgzm+oqJ4V3+vCNLd56PGDCWtet6jN?=
 =?us-ascii?Q?ZZ1201VYQVZSPa15XKCtBksTlE4z3YB31r3v2kW0WMW+Qu0SvMT++BDiV19N?=
 =?us-ascii?Q?VZc5MQxZk4UvDYL2HxBaA/HrlFbOwA5WXwoZkaIUUzh2+LA0e+jJH4fktxXn?=
 =?us-ascii?Q?3+iL2JoxOsezlNVs9D8da0rEfnT4+L6h3pQSJjWtotWuSwiIDZw8qvO8Z/3+?=
 =?us-ascii?Q?LwOXC9GUBaYnJ7r8kq57u8xLyqAUFHTPZli1pQGbHMhax2tf44vZPhgpSkKK?=
 =?us-ascii?Q?ZXqvczhvb8DVGWwxJpJHOCVObbs8n6UEP5DyPANWrGznJlHrDgthcaFMoqW5?=
 =?us-ascii?Q?5pse2IsPq4wUcaR6SFL/gEcjZZmcx1dcSpHJkNM7WWUIEpQVRFPyBEKdhEgR?=
 =?us-ascii?Q?EaLaOfiyJl42ac70p8ksHjC3bjAnVSzksTZjK/yZwKpprH6IL0KDyGaKvfUI?=
 =?us-ascii?Q?6eyAS2zcCfpSCbZ2P6aIsqy0vDVS/JuBfFYMId/NqQX98vFfh6Y93FuyUcxl?=
 =?us-ascii?Q?pGGxwM1N8Sg2C/C9dVoRvn8sexO6RL8qzkadLYzvbyrOiFnyLnn+H6iWXbdv?=
 =?us-ascii?Q?R2FOB1smSkKeB3XaXCSnKjivA6OBbVIxllJj1EyN4z7sd/CBnHpgq2pT7Zqg?=
 =?us-ascii?Q?lLNt1Sa2uw074wrSqwflSX9GzibAzzuA1DrJTqvQqIHczZNfwWQ7WHQTvBt0?=
 =?us-ascii?Q?W+UHgj9xKDn0olIlSHQOZ1nFyXgGlBvWLUssuv81V7Duia+xrLNDkDLkOimt?=
 =?us-ascii?Q?ZfhOvmcoUpD2I2tVCYhUWUmTGzaO7T0is+TkFZcwbPJ34h3iAZAsyb9Y+5sd?=
 =?us-ascii?Q?NLiWngDFy6jXWwO/bUkWEVs2fqnfGaTFDrcDe+g9SMSydaS+aGVWd7wwCKYk?=
 =?us-ascii?Q?GSU9VqLC3INghhAcS2zREpdckvxdbHvVzJwFwm7AR8jtU8RuzBPESUkO918N?=
 =?us-ascii?Q?gsyS2I0O8SFCrLVXJiaCGRNbBvsOIK3c7wvszp8gc6GzjIfRPqkE5zq1G65+?=
 =?us-ascii?Q?fm13+0Mc54Wreqsw+97S/xXye5dwc+o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b518700-8fbc-462a-8ecd-08de6a6224b6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:28.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taFVX+xIKR41N0aUPsmoX4LSOeDbMr5KNfdnwprONvoHiKV5wGGhDC971EPREgG2JHD4+iLeqQ/bTtuvRmePJK0wOVtTvWgwtSGL5ky+AUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8GE5WkeLDxYJ3jhkWaTvoc1t2F2Ao8CV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfX4x+i8v92Y0IZ
 Yh+F+FpFIb9zH1HIA1qka9yHPXYFXyNO8Yt4KnNPRmGieqn2QaTHbacS/le/+3b5UUHPs6qh8Vg
 tdZQySPx33HMpNqWQ4KdApAosb5jJ0Dh25DmNSYEgJ2hoGnCtMQfauHJyxGFS8U13ftYbXPxRdO
 ETHTV4B6J1RSwM1Y6kkw1YPMrPZUX3lOF5QjT4wcw7pzskIdO3rl6XZDhxow4YL61PIFPqRTqlu
 l708ZAGAulISoDqwzu398XCN+IUjhmlo3BDuYx+W7bbalYIoF4vLQmD2PpS/C5+jQp2/DNnnj5W
 2qpixzT0mLH2IRzaxTd5avU1/6y9/yOvEAiNhPgh6lWc4993n404PW3mZXQ3xjzJLJIT3rqtli5
 ygczSYGx4sawlSNWui62QE4Bf1xDTQccafFwDAmEea6QzZgpxxzgk3MebaizJdm05Y75o2MWcPH
 HihbQUBKZze/Sbx5aeg==
X-Proofpoint-GUID: sbpv_i3VHeDqTw9xo-AFOC5Idj_0_ulH
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698e17d3 cx=c_pps
 a=miQpwXaPIJxEFudIojRT/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231066

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


