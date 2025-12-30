Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650E8EE01FE
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64845.1767104197443387723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R+2tyu95;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCo2F03579464
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=; b=
	R+2tyu95RWKmm66iPLfsRmfyOE3Zvma0cDmBXo2fBuMu8rF4SW5BSwkdRxRLrLvQ
	i3QbZQjb8jhCfLuj/gTLsq0+j5umQvEzhgMdVEPPH1/1Wjk9ThMczAl41RTG4Oi9
	41GoJUDgctzJDDLbbByzaJ8nm9/12JSn03ExsBxisrsIONkpcgxHR0PDlWPg3zBW
	8iCh+nIJ6NrvvsZc1gmgkXOOwyc0nP1J7C+JAa104cjyoloup7s0Um0MTmG8bQOi
	2TSgGN7s8BWYnz+xfP+udrEXKTWg4aZDorkJhijebgvchI0esbemMYfWawabBECZ
	BZgPV5rIdQyhiSJZKX4Mew==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukamqt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4c/TNm593sbe2rBDlT/ghA4TP1kyeL0eZFQGFYKwuXag86GFErw0+Nm87CT8LfV892BnyPEsmE+duzwIIg8oyMg97B20QPyWnOshIpKxLhA11cAcqbrpDi80eAZwGC9YtswYS6bhhzMP/waYplX4oQgkwy/9Xqacf52X8Ip7j0nD/2/IBuH9gQp4QyoS+TBt53HH2zTnFJJqTxsu2752fq346x9cQ706s76voG+M0FVbqaFIHfUEHiDz6Lgdfcu2xndVT09WAkGkvrI2++XKFquaz7Gd53rttEwdUz3mOVg21ua6Arspq2aLQ4KlQHQEwo7TMwvoMB9w6U6+dKf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BDXHt2bsA4L6nYWybTJZnV4CIB571q9JgJaGZpfFnE=;
 b=OX+Y3V82R2qLK183gCYRfbj2qaWTUNj4glcdG91/imy5KCy2E2kJYTWgN1SmfB5SnuB8hUnL7/4w6v472L+X/y3q///Nja1FaUCw9K4fRfikOYi/mzgDfeuSLUovcNFApB2CJqw8Mz9MNq4YOvpKjCC2bSI/42PihJTqu7iwGsHzmMJlGjEuiv5ukzx8948cN7mOjmbQk6HoMSaHtDvgA6kMlToZutGDnWe5V53/1nH0H04gxA5k2jn0RlLGi2iL+L3qZRzLiYKpjn0hy7EwvpO7OsRjRY6hXahp6GD3T3X0W/RdGf5CXHOzHIj57MFA8n0ETMp/kp0oMxTtzX0IAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:34 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Tue, 30 Dec 2025 06:15:33 -0800
Message-ID: <20251230141540.1974380-9-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5f80e23-3726-4e92-b1fa-08de47ae0931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5RyfKoTzpYgC++eKPMHO5Y4OEQjByOrMcKHXco+i4mD/6SdBbdyDdZa2t18I?=
 =?us-ascii?Q?bqFoRrhYJA715ARaBkTJQyy9IMCkuWKitJE2439Lv6TN8cBCMauPGvz6I6BL?=
 =?us-ascii?Q?ztkfdXU0C1e/KBjQW9up8SlpEdpAzsK3avhbK5Aqh5Lh0ZAO0LKLE6AK+Fip?=
 =?us-ascii?Q?u+0vfemYP7yqfXE5ZFUKqncaUja609EdzWboNwD4BSmXeSW+m9YqDqJ2Vnsl?=
 =?us-ascii?Q?n8VLE5Nyvh1m1id4D4ur1q63uoModaaVgNp4vh4DZgJTo2PO4YTiIJTMOF+d?=
 =?us-ascii?Q?I7c1Kas1pos5eEUrl3reez5aIHUUo5ZH6YUBIC0OK29B8Fil3pwfa/UeRhPN?=
 =?us-ascii?Q?dvbTMRbJ3PbS4Ebw8HWey+W/v2Dp+myiATjreBHf8F0immffWByyDo9BPRGK?=
 =?us-ascii?Q?YRMFXiHelmWDw0QpuL7f/b5xVC6fDt7fE+/REhEBjfreZg2OzDmWqgJzOY/5?=
 =?us-ascii?Q?8DHjC8/1RrVnCw2679jkOCoDm3HaSPVk75p8XettOyL7wjw6Zo6T4I2T2FX3?=
 =?us-ascii?Q?PPWtec4Ihe5aORZbMscjk9/BfCx+/fMmkmfUALI2RB5y+SHEAu7hpLGZOVOU?=
 =?us-ascii?Q?6aCen/dO3nnWJUzlpwO1v9TfpDsf80fnx1DcE2sns0jJuzb1e/73uYRPBNcB?=
 =?us-ascii?Q?WB7Xfnz/49dJsYymdyPcL5m1IwhOsdNGo+mHjlbfP+X6zg+tBOnSc5vZNrpe?=
 =?us-ascii?Q?bsqUXR79S1eVfn4z5DIFUWGB6a06uIdztibhyZ5xz4nfUUWFPFzV8Pp3FGpP?=
 =?us-ascii?Q?rwrnPhlx+V8hI8LYMlV6Hjx3pDWUoe/CIXndPoI2aNKNHsrC6ig6RSLd7/xr?=
 =?us-ascii?Q?o9Zm4kmzzgPB19GAbpsZSfQ+L+ajL5ZHctYKMbK7NfxSqG9hplEe1KCvDw0e?=
 =?us-ascii?Q?klphz08eG3DytMfujpfMC7hZ3kMbMmQh05TZBjtXfzNyHfMh+ZAUIpECYqDY?=
 =?us-ascii?Q?obZPkS8a1U+hO0TewLiYQ9gEaotlyc8QCv5R21+Ou/Cis2OQRv8hdwlm6G2T?=
 =?us-ascii?Q?hypy0WYyEWZfyEaLzOh5xDojYk8ccI9jLAOUB3JEzPlb5LHct+poMPPrM7nh?=
 =?us-ascii?Q?RBFcF+ZvsVBOFHIhjGLomFXv9Pjui2XYRikISdChqssEuH4dtdGVJ8abLNfG?=
 =?us-ascii?Q?tyVgBml+Q/UUrYnl47ArvgDE36r5mLRVMTj1UvJmriQb7D677ZlxsyGfw6kc?=
 =?us-ascii?Q?CBqaqGFUbpvptrP+CYW9IbP5L0wsnYkHkBS0YX8FamIaFcu775JK5+QKbxvA?=
 =?us-ascii?Q?sgdwCfpnsXCFBRGhZHqphA/dpVJpzwQkogVdN3DltwzwSzhuH1eVKda3bluT?=
 =?us-ascii?Q?6tRchsTXUPFv+G45Kk5YVMluWXhZNW2zovagY4V1RoamJK76OvshalDPC1/P?=
 =?us-ascii?Q?X52ogw/jsd1iinr5NaXMrxMloC5btTvKt5lh7mLnV6V6ci/efCBSnXWdYJYU?=
 =?us-ascii?Q?EjMGsaAFAJk63JptPTKP9oatVddGLU6RSQ84cErSxB4TnI4w3Pp5K32uaFkw?=
 =?us-ascii?Q?nS77BCih82BeVwl0p3t6dRPmprAJJ4XH2uJD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+BpOIK55QSPGNYXhwdxqPep6XJyW5naU0MYQXZpxtgQfn7Q6Fsh3tKdJkCUj?=
 =?us-ascii?Q?u6eyLwkAl92fIsp+xOSRGwK/+Pe31+OWmatxwajoSxaZoahUzZRw96PakG8h?=
 =?us-ascii?Q?MfIQdpxBFOsS0ti62n6lVoWOfo0qw4+x6YcEAjJitTLZsH95lW4Ch3XlqBGh?=
 =?us-ascii?Q?fk4sGql7NTwcgQs26GhTUwAaW1FZBjnHuqXRX2RONbje00l0Ln4VpSnwgH78?=
 =?us-ascii?Q?q3cAKaam1R2PlclY6quzb11Bek9Wtyuru7ugZQDU5XsaipC5oR//DOhUoBxv?=
 =?us-ascii?Q?5LApnmx09g4zK87FZiXHrAf+zQmma5kfs7Uq1STH1kUqQh+IaMWqtmBze1Sa?=
 =?us-ascii?Q?Izc2rrGlkCox2wn9m1Y68IYeLmtlmAFXpSSVlPWD9noeVlEt9vtojCXgjP0T?=
 =?us-ascii?Q?tDcHy/22oiaIFwaCyMcA1IdC18WZBPNjxq4zGNSx1sVB45pV4WgC1BszLWJT?=
 =?us-ascii?Q?lxnPTuNGpBtoiutjMtKHfiKRSy11E4blFfJkWh4R5Tuc9HlUjlTYyXMR836W?=
 =?us-ascii?Q?eMUmILnK+oV+BKlfGY/qfnH5wBEF9BxOLC6JunJepkXNni2uF4awxGLli79d?=
 =?us-ascii?Q?RGUff8SBn7l2A3GyNnXcCf0w0lLee3ij8LyV+b6l/lG0LIESQl5fPBAHHH9/?=
 =?us-ascii?Q?umysBqcXCln9IeFIy0rvs7a7SucyBIm1rsIlyKv8EJCfpOGVQSC24eRf9wV9?=
 =?us-ascii?Q?mzW6iW6kQKqXHe6zBYJPEpPXTQpWbEL6CoIAQSTfV+TCNN2lu6UQB6KVGwmf?=
 =?us-ascii?Q?KWq4VIRtCZBsnmXEUpMFBOHX5/ipXc/Vdnh6NK8WbQdvkEGZDMIJzlSb6O0U?=
 =?us-ascii?Q?ttnuSwRipaq47uUo7yXPsm1YG9Wc6oMBvBpUQ02162qXxzV8yCy+/iQUe7xP?=
 =?us-ascii?Q?FwlhDg4XA4NhvwkUDdckIes0JiDC7uBjlEVjPWsSTUXuQcmOqJ6YVk2wMxYl?=
 =?us-ascii?Q?WOWO8tHcOpe7p8T8lRsykeghqZoF6H4+cQ8oNRlbNjB+a80A5AbgX3ACcaK/?=
 =?us-ascii?Q?lrzLz9NsO6hZvrlr74pnAYVFOEB3JLRtSYMKDReGuHOOXpwCilZivVFjNk/S?=
 =?us-ascii?Q?xbQOgYsz0bkGpUv553HWbUoUv7kC6LO3JbuKjU3jlmHfxTo9CrpCHV+7BMsv?=
 =?us-ascii?Q?GzBfPxi6ftR+R0qf4RFc7McEvYtHeDYM+MbGID3App/el2/8ZgcMHMFlV3Wr?=
 =?us-ascii?Q?/nPnPOI1Wo9AJzjrXHcZNDrP37cLLhuAk9pOEcrsI5i6R80XsCVaAeHFln7C?=
 =?us-ascii?Q?bMaCT6BScC0TeOcJSoXQeTkolD7dECECj1J4IrHh1ob3yr1cK0I0l5zxt9sI?=
 =?us-ascii?Q?eJqEVx7fiX1qC6AmQOz0sdZagk2+dqLzRhF9A/Gcbm4FaXTBxw2WlP0BPMGq?=
 =?us-ascii?Q?mjeAAxD1PvcksKMGa83PQK9LxhFYQanHwQa8Tn0pPzDCU9WHJxDIhnj/mX0Z?=
 =?us-ascii?Q?r9gBBzGQy9uJqFLDfekunvdjjIKipeZsCknpqLtkxITEXiWx78AoFSKbxHNz?=
 =?us-ascii?Q?VLwg/9bUBBngSmmPeecwLt7n+/VOf0h19TxskEpYrtAAZeAJTU+duRzKiyjR?=
 =?us-ascii?Q?fX43tvglmKQ0FiLGZ45PfYfxypmbKy+EL7u5ZEbYbGrMXYbbL4tDoZQ00tN2?=
 =?us-ascii?Q?HlFKHsumrpowOZ1/N5ii5RL3U1WjutpDhmS1USCvwJk8QSUUVwdV/h6auDEl?=
 =?us-ascii?Q?wS9wrKkF9wMNdQhVjK4wZUELYR7UNIbwvwKUK7eva+y1EbQru6cJpBB8ni70?=
 =?us-ascii?Q?dpg5Q20hk2Ulsp/o+z51aLB4GPnBzXY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f80e23-3726-4e92-b1fa-08de47ae0931
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:33.8132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mPuDcesQifXtAp8QH0lRvkZ0Bhy806O4ySDfL+y8XykwHJrgkUVhZnIsf/j+82dk/+ksHBY/G5kf6IVrcy/Oo3mIPKFUhopr9RZ4orWKiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953dec5 cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: D8oRhUV7RRJwDJCs3qX78cPZvxAtFiVS
X-Proofpoint-ORIG-GUID: mvcoAUR0-aiXnvrEyk9BBrrGgQL-SrS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX3AK5YKkp6oIq
 u8zMInFimBdYRc6nC3mDEaKVmJ1iByxaDBTHYZK5WmDYskQvvFPkmRZPXCZe73339nGvldimB0w
 9q11+QvD6uSjRMOt0/qYYDUmylNeinyuOScQaPLqbqHcVISMhCaoqyrGtvtpOUXldMy+2Ae+U/q
 Aab4ob/3/Dup8GmjA8XxLM0TCHz0KjG8+4LVElSCi9piEiCWnBkZcf2EKuMCfg9cGZDQQ5pJsGZ
 1zaBIOt3hPs85hY/1zdVXxKVxy78R6HHuQnKjLt2eF9pWF349C6dCqX7ZaMv3U9ngTFJ9j7w+O2
 fXhwCQln5muE8B+G0pGacCtPRBNVySvuISUodfrnKfkk4KGtKiMQ9YmlOYx/CBvbe0BDIFQOMH6
 ymWsbPGvxHQxNgIeMaYoSZ4irJN9SAjVNndkzM7xXaUrORRcbjmW3ZMDcHsSjqupOYUtp7ozdqu
 S8NckiN/wgyR7A5TCFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228674

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index c3e1137200..43b440e721 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


