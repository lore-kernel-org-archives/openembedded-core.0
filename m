Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41958CA5FCD
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12553.1768931659686271256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PPIoDh1A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KAP2MD4186223
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=; b=
	PPIoDh1AmNWY+2t6+nuEBl9ZYG1Dqt7gkIuFawFgInF/g5cl9HON6Ch94BzWSYzU
	qC3d4fkCTQE8LXq6eP7nA6sZnQ3xiYuSyJjIeml/kCSLxMSlqrR8UqLirkblXyAQ
	iwCNWPtYzKmzOQzwgVmarpETPjisZz9+JvuZHL6ZsmscuPBO/AXrMUVvSPRWLGGf
	XE1uFxNc3P95u55FObvqcw3g62/nZUxtj0T7wreT1xjuPgGRxzER7eaShUe7rzs1
	nCCSKZq77/KpxthhyW/T0phkEqKGRV7pLrEJESedpLdjy2gxiMKXrDrYWGE5qFio
	Uly2GzpfHV/80BbiCKdMjA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu23t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pl7ZOZKuyx05oy44x0vIc7VEP12AK2Wk54VwWYFyFlDL8ujZiAACI1yui6Z+KpSzlBWubA9wfXBcnLKl7Cy7bQFIzsR45pGlAVL73XLaJ2Xtu2mDFGHWAMipEI1E6mUv+QLpVlxKTYnwwZ3rpUwUDLwzPpd9sFjUM43zaOhm55BH5kfIkOIb+TNBYYVS9xHaXqt0sb9hIGj+c+r+9u/izWx3sOaH21vkT3m6PKGOEWCqFH/Gix7ksf7sJl6X7tJOGQmHwoTUdLXj2K5ojbllOwCpz5hLYAnjp7B8ZLYmw/Zrwf3f+G3S9Ex2j5C9i85lUzOjl+uxsYgD4pKZtMDtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvKo+6P9iOAPrSYXpXs5GsvzZCQrrJY5130rRZo5kgc=;
 b=RojHZW0pz0p7vXMbgPjpRV8zfaSKjR+z9xDSnND2Xpntw2iZjMEuuSbhXXTkpm0Sit1Iahz3UfevlzVutJDsTEDGB9wqG9qVYW7Y8zMjp0cSrZQxCStqehiyZO+S2T10alHNxGjI2FXgmgE8BzA3qHCznm53RBq/Qw0IDDoId+unReIWxRcU30uzYqe5en3/Y8nAKMPxXREKWZSCtzb2BkdssC3tSx4Pbq0fCXErjSKD9MzbK1bwWrCB0iXBFtKFboV+C5EdeMRIJKt9aDPD/Eos/SnnoQFl02jH1z2fI6TB5sxFNAfzhmQo6xf+pa+cvIGXCFuyLKZ7YCF7Rr69eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:17 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:17 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 05/16] linux-yocto: enable Rust support in kernel configuration
Date: Tue, 20 Jan 2026 09:52:35 -0800
Message-ID: <20260120175246.2052341-6-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 18bf4cb2-f841-4f2b-aa82-08de584cee1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/7oClaGOoayR69c8M/HuxrECpDq2ZkPu8RH6ufoDmL2kYZAR2kSA7vC734hg?=
 =?us-ascii?Q?QDzHP13adIyGj4c4FdUGnVh+KIKYgLhBw4i1pM2leVKzEjKY640QqJX3xEda?=
 =?us-ascii?Q?8nP8BAgYcaT7jxZbxzCaMxVvyBiDX9cb89fsMEOdx1Q7JNwOo+oRGbDZMGBn?=
 =?us-ascii?Q?UNZXTsBWcZ0No1cQx0iIHCa4MDau4os3rx6BUj8P4+XWInBWi7/VLSlTbPRf?=
 =?us-ascii?Q?BwwfTKZn44t1QNI2agQj3dQr7YmCdGShBbL9gtntkrwALei5wGmELGbsGJZh?=
 =?us-ascii?Q?UE4Ia3gJ4VFSiZ8ol/3m8Bt3YOgUHHrJ47Jh4q7XT3LZOLaFd3V+z8W1TA0l?=
 =?us-ascii?Q?vEPpnwTLhuz6rJVdcmLgGUu/Wr6xYwcsfFbjJgbRJcRcGWoF3gMAI1u5fIeQ?=
 =?us-ascii?Q?XMaxIZO5XY2lN63UTsLb1P4s7QGfJmsPpMOCOWlSsMuVpVK4W8Rsv2aHhij3?=
 =?us-ascii?Q?ALQRbREHN4GNCX/vljOIn5dZDrOD7wX8+lc7hzUGU7K6aq54vH2suzB0EFUt?=
 =?us-ascii?Q?NTddFec9WBph45XPq43+jZsuTU+agOix0A4S3aqS3sf4VilJX5koNu8uUUbo?=
 =?us-ascii?Q?OEXs894cVmmTyDB1v3NSjRPxySKuJaQlbewINLOwFHmB35fHtGuM6QzX3e/2?=
 =?us-ascii?Q?HA3qoi3LOXevUCcnETP+mjOBoAjgi9qR3CUntTFPAYA2rSTOuAslZf/xkkWE?=
 =?us-ascii?Q?m4E62kZOO8FyqA9jTcQ12ZSqEbk3JMI73YQIIOEf2OUCs6C8NaxDBJp4i27y?=
 =?us-ascii?Q?0er5FZlcQeSgGTfmdC8dzg53nhOSXu4H5yhQJuScTxFR2tDXJ8dH2VXBc6aY?=
 =?us-ascii?Q?wiIv8eo0JiRRtoBQhhPb+X1oZyqlzzZ6KPFucJwNFIjEY44SxI+F5OwBnXFa?=
 =?us-ascii?Q?qkLwmCZvOfgYaRCnqqrb5FHG0X6aXVljhYIbgpjUWP0GzZmt7LTu2jg0qUdy?=
 =?us-ascii?Q?pvI0l4rMD4uzUZl8108R0/KN84pQ25tgr7+xBycNJIpDlsdqJ+I5oxbyP5P2?=
 =?us-ascii?Q?83nNhurzCQeHufrWDtSg3er6jBxiuKwcV3m8m4xS5/s7acE2ZfiTKXhxTgdx?=
 =?us-ascii?Q?v8wBLYUsEjDGfvHmynlsAFJXHNye+dn8zQgH7XgtkF0vE259evk+mbVbAzOA?=
 =?us-ascii?Q?p/mbydzmX/QFwf/YMu3tzksGaZTElaTFJzGE/GBwzMned/v6JyPAZyLdZXg4?=
 =?us-ascii?Q?RRgpOhnUOKSoOPKiWsk6ec/dcaDz+iYX+a81fRLE7a6FPdvY14UnRW0tRea4?=
 =?us-ascii?Q?iIHCB9v9PaRo38az30ktLvfnlo444gUzocg1FTTNvgnYd7fyBfZR51HnzR/D?=
 =?us-ascii?Q?ijqlzkL+grAund2J3WTNnvq5zhk+nKycFCtn/FXORw3UgB8FqHflYlN3t7Tq?=
 =?us-ascii?Q?ICjOGQHs1f7ADPO9Gvj2I9hiKVFfJd8ny0sQ88ZAgLboXS4zRO7Z9Z84qxIC?=
 =?us-ascii?Q?OhWbB7LqgQS3RuQVIGqhY3USc475rllmD6OpNJJEWNg0Stu0+AX4lYpz7Q2c?=
 =?us-ascii?Q?6ucJOv9UK2sOwv4dbaYqPhZAZz5fVMExJWp/a9b+oqXf21rVieLMIH/AJ2O0?=
 =?us-ascii?Q?h/WAGwmWu9cIF172O61aJ/2BaqzkmlcrZi/2l30Xv/+HV+Kw0H3lYromq0Cw?=
 =?us-ascii?Q?GI0/hihbI5pz/sI3bjryRbA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LM4V7BZKOYEOvbTuTxR7QZEhXb4oIu87RmrjDXTdgl+U+QpOwcbmPBxktKSr?=
 =?us-ascii?Q?f+1xt4VkVVM/Qgauf6h8aj25/8c+X436QPG/i0/c8BMaGEf3xg/FxlHmXLKZ?=
 =?us-ascii?Q?rzGZdDI0yti6Dq5VxF3UdOKSucsuyt8AsP15bteWCYi0EPVV2b22L5MMeEQd?=
 =?us-ascii?Q?HIkMzyK0zqGPMJRDE4WKa7G22L28q3GsQ1TVPalqGiOrHF+ySJOywQE9iQSy?=
 =?us-ascii?Q?U2uCBYWAeX8nPoIxhZ3Q16CUmszBTLn9VfFozIKKBLDuf7AHRSBBcD/4CLye?=
 =?us-ascii?Q?KVPWgm7JJ06f0amqyLWjA5wqQQzJ8W8jqk24ZGGgbryYN+OvfmBZ3dpwOWUi?=
 =?us-ascii?Q?to1pb1nubWB/LOeeEY2u/azt4VwfI3P47cez4IfhlWocSKqA189m/WahZtQV?=
 =?us-ascii?Q?S5aIQ5xC3Uak+WJ2ccm6acZ7eVZbOMpQqSmbqWQYjZhr60+iirFMBCHZK/2V?=
 =?us-ascii?Q?5N4P3OtU/oUDnJGDFoaBzFG4+uMQ68oPnXsGQYI6W8a8sL+BGINtufJTI/g5?=
 =?us-ascii?Q?cxddItcLtp8EFGzzLzduL9yFvluWEfk8NoBg3xWuODhdJK3G1HuENa+pyjFP?=
 =?us-ascii?Q?CMPoUG4ztgREcMlIwuLtOZI02D7997sENu16RltiXuCYz0W37uH2N45jtoUA?=
 =?us-ascii?Q?ZsRtjOBKpB9qq02rSpP4Fw1pbhIZ+nFSJPuGjHyT9KQvB/xBikIoZ0LKOubk?=
 =?us-ascii?Q?vtWOClistLpV9+7bPx070yXAGG7SZgyYRWTAt75JQNfoiMo+qDhEFf2caFyq?=
 =?us-ascii?Q?HEJEAMDFhyecZubw228qgYehkAHhn3A750+p9ZDXHuB6k1BYmJgGLPZtI4EA?=
 =?us-ascii?Q?tdTo/CCEO+CR6yPdlMND4BNfhCLsfb5v/eDsqLk/SU8EY2oCReM0WaQNPw3R?=
 =?us-ascii?Q?uMF0igBQ/USP9WY9YsQloo49+txWa/gRjs4m9AP+TWncEms2R5evxI7t8zAV?=
 =?us-ascii?Q?0ajvlUyaGsNPOGpXRWRm5GHpQicg2+788CmsxZPFbwAXHGz49To/XAU+seMy?=
 =?us-ascii?Q?p++37pf2mY8lpoVgI78JqjYhNdRbqXdKyZUR++kpEoYLup0qgYtH9xFcBnLA?=
 =?us-ascii?Q?GVyRlk0h1f4OW1Wamsvj5GHMgvIe3N8bMtquqcmiSnpj5l6IX4pLE0Ui39Ay?=
 =?us-ascii?Q?wlx4CvQx3wTPN2VdIxTy6odkuY0mP+GhRGVyJDJCleK7RtcVa8jUR467DiHX?=
 =?us-ascii?Q?pFPyinX511VfB78SWy2e7+X6ivKsbIEVTRhyKa3aKYX9QFsWO/QRCcrAnMIg?=
 =?us-ascii?Q?iKxJhgiBoPbcKK5Ih2fBQBBTUFbMBr5zkwF6rbKLff5wVQod9T0BP52opGER?=
 =?us-ascii?Q?R1jnzJvTfv/AZBUc89RmSdPdb4+Vj7+ADz69Y6QUwxyMqM0D2IAkjkJCuM6Y?=
 =?us-ascii?Q?z/Lp/4YLpcPNwU72PzSGQuD3IGUnlgXX4UE58Txon6ebdnS+kIr2+RAfGwMj?=
 =?us-ascii?Q?2B88fVQ5AowsyrvWLBezgmi9hfy0Pd2i9Bri4MvHZRWi759m993OtY90Txr3?=
 =?us-ascii?Q?NfgcgiarIPR3uy8Ar2yQAaUHnZPT0m1RQRsDB1MhivRledqfO/b8iJXPRLMN?=
 =?us-ascii?Q?bwpB+DJanW9wb43pgO7905RxFKVI3O5cBgJr/AZHGCCSnoRRlzFeQHmKTdHs?=
 =?us-ascii?Q?AG4iAZzROWv58+PwIiHRV+Ucgnuw6vQA/8+QRBKp6hnMfLQOBLbI/YJl36om?=
 =?us-ascii?Q?na41yrdDulD2FdBmzSaSQrZXzJI1B5AcUDe6YEiH86bJP3fjDclYZUAb7e+z?=
 =?us-ascii?Q?LFWWMem5w15/jv9HpJ0LXrRhj6S+MDg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bf4cb2-f841-4f2b-aa82-08de584cee1d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:16.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPx8m5if2Jqv3ifwvzKGxXTE2ZJs8v57zEVB7ISyGVLs9y62NViRv40O+LvEGz3QqO7gpotnbYUunpXYtsj9qIC612i8YY1sRXfngMc2PF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Ylj2rZO6vfJ6JCGV0QMpvBljrwAKWbCI
X-Proofpoint-ORIG-GUID: VuJqVT2B02MBTsEjLjiggFGTS3VATZjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfXyzRH4GeLRcNE
 JFnCNH5e5G4DzhjN9TJqNZ/wUNMqVwCw1hJ9tDhH04y9Ico+c4Y5guIzbdBIlYvo1EFR8tw0Au5
 lN9bG7V9GHQlnC9/uMfamPtbkz4yM3YoLyKp18qi8VpKEXhD1IxLIlNSv3Pl6/PIYCiZlv3oeZn
 0xut39a15z6aVeO14bE+gOBB6Q5heDsiIquCv9Y049HV4yecMK5i5a/uG1SecwQIsGOrx8N9ugN
 zqOBBiOa/tHNDArXEJtqVrAzZ+JJZMMELKk4DhB7pDbWl8PI4uyb9HuBxcVQynytjyLlaZd00Aq
 C78n8i0l5I9W6duk7ER4JmMuULTsQ/0pRDgxfSDw28o1kZfhP710p7SPSoXeDglPO0deCQKIJKp
 IYXlkMU6Yy4sh8vMTyRoUTQOse3vyDR4nv4IbY39P291p3fce41jqybgkNipOL4fEKaxm7zqSqO
 YPOs5CA2OcW4Dihlmiw==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc14b cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229752

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..e468fdc0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 599a3d13b8..3c2bf02221 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


