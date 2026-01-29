Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09DDD6B09F
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19152.1769704778170027685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X7SsbTsc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TDs8G11292372
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	X7SsbTscHkRh9zYJYy/9Nm2aurnhJybyEBOh+6Viqq88kdw0VpG0veC91nVM3nXi
	EvsPVQ2Yx3L0M5qiwF0Yc3s56iOuFSJ9xLwma5CXOJqMXBGchNXA+XmpeJqYfucM
	P/oZQ8DlgzcCRWuTzXrYz/IBXgv1GhQpDwvOt7Q7NKyHmCYOWqzXgC3NjnZv5svI
	pH8CB0XZvzK72+nDrzF6tjLcOZtIBe/tt58xPOjr2j4a/Ux4+A71RNeq1ppwlMFn
	mlV4ByGaU4/Lt16QQmcfYWIJkHqUhbIa/zUmyJ0sQ/XBJBsVZDw/GXVz5QgToV7v
	ObG/+sJL+WSWxWlmAVR78g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx148srb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 16:39:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Akkf2yG3xqyvfOP2dbMpbw0MDh1nKNmo+rXjRydceALUm1tH3Z0PuHZCNHOFS0JU01n1Gn1k51/HP4uSNysOeptpQrAeiOT3jmoht4jtAtsQsFyLbzERw2n/hOVNOG439Ms1Z96e+So9R5y2z7DPX9qv1Ofn4MxZOTGvObQABl3VF65E0Vb8RIISkx0K8VPl3ylReRSsODlpBnk5Y8pk5CTsxmuDGUOyAZ+wVLQURGZ/72nl5oOv8SlnlaJqrEJzJNzEN0SK1RfPD+RCLaQVVu6PrGsDtZGHsxYmGureGV1pXe3mmeh+JPjLyBlgmrlne6JCvPH+20lNzArQI0xD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=hVVpnuhSSpoIOBurKC6Djwcf5mnk+GgWI87GbY9HqwZ40hcSqUPHWi0AntKGXxw7iyOtuJpEb4SlQPFakcw0cqYuUgZ9gJjwxzmYf10Qe45kLkLvSgWmPj0TuRICMadzy3G3G8nCv/o80snduBew2c1ERTLM34CjAV1xlF2UEbGtzLY+LWmQ1zepU8+qmQGnraEmJPexVHbJmBUtsGJtJFoFiApXgYuXk7IyNZxCq8MMbcInJ8XqjsIL/I1uGxiWEFPAZGAxwxW0USXNKpBkS8rQHxltYyPKscuMuwx8mCSm67kl0L2cmc51DYX1yj4hCD+p8HETCkgVjrAupsPXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:39:34 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:34 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 06/15] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Thu, 29 Jan 2026 08:39:01 -0800
Message-ID: <20260129163910.2612040-7-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b68144de-5937-4bea-964c-08de5f54fc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pij/qjccjZvMXAwrdyk+HO5wMNBCRSBXVosHJOPyP1cqgGYGn7+V4DlN4a+j?=
 =?us-ascii?Q?M97wgU6ptiSnj0b/6AlP7dDioRsR2i5NgapLTieiuTcsN1L1iGnC5icqHATu?=
 =?us-ascii?Q?GXqIz30+a5wCtiHUSbs0dghx0EG3jev1vCiwuHuzxDYJ+limHP85BdaFnSQy?=
 =?us-ascii?Q?OswoEwdg5vyZ2KaLB5e5LgXBfaMUfI6qg8j224Tbah2WHBSVDhHYGhHsVquP?=
 =?us-ascii?Q?+ZpkpMVn+WIBhbz5dDiF0omcuh8f53pxx5c1Eu0d/bp1wo4ZuVQi/eoUIxWh?=
 =?us-ascii?Q?ZSJIXdTsaf/aH7/fnFSzDORbEZUeeRRHZLArEj2JGQJyCEUGTAY4xmaXiCe8?=
 =?us-ascii?Q?YbA5auGIe2EH79uk6FBXazm0i7w712nellMY5Vl65I+KtfXdWVCOuw1sEFYh?=
 =?us-ascii?Q?kqOnQvZpNHWK6YNgelrP5/R4mQ5RevxOa9iC4Ft9W7xInEQdzHWaWyRlY1bB?=
 =?us-ascii?Q?gDO/Pr8aXWjUT9dPNaLXeFaUaOq9LR4nT2J8V1RSFdMqwHcidE5a/EIIVeS3?=
 =?us-ascii?Q?nii1Gza3uKKjLufSJzGUPfKG1O4nesvhqc2FUgr28hI6atPiCZlbhrkuqPTY?=
 =?us-ascii?Q?NUn253scAJDoWIf5HOH9rY26d5s52FkneZtGrw42lxS52MaX6E5DIKmkJQII?=
 =?us-ascii?Q?80cMJPZ8YrbYBtDt5aOrWkPEb6QalplxfNi1C8AIJvYcz4wvs4SQnevgI4vs?=
 =?us-ascii?Q?QxeK+DgBcs0UYE3shmm2zxVsVJd94IMw3CT/AVsQLaVX5wpLUWebykaEoRnP?=
 =?us-ascii?Q?27tjqsVFE8zCCQHGUlTihw6N41xl+mW5cHVAK8jr/Awzdu4IigPiuAs6re1n?=
 =?us-ascii?Q?ZnGylUeOwRqW7uBTXhwMKtEtGjeNYv219zeT51nr+/Q5zpCNhurwDUUP7gQs?=
 =?us-ascii?Q?plZvCSN5057NKSF/w93QCZ9247IXzZ1lHWSe+jGB3Clez+j5H6QuOJkJoRIZ?=
 =?us-ascii?Q?RfsWBe6Y0jTSF8lUT1l7+7ei+xUJVnJTcAzC6bQGn4II3LGtg89gAqlrGILa?=
 =?us-ascii?Q?sbZYPmyezXzC+MTA3VNz6pgl8EiSuFcVmXBsV/CK9OtiJH2qyAq4OIIVKl+h?=
 =?us-ascii?Q?xGK3Dv0064qPa2r28UrZRzAQpbYiUBr5uU2AV7Ay6dguXGDEtmaI3z57Ox7R?=
 =?us-ascii?Q?3D2/u5Z90pcEnNvTT2sQtNa2PVLVzl6usVRa/4fJJxeL37kRfqnow+z/t8Lq?=
 =?us-ascii?Q?okoXcI/nclEnTjjq+10OwV36mn6wDqYysEQ+Ga6XvMqrk1vqZk+ZPGJ6UmfL?=
 =?us-ascii?Q?V0RXC5TM2xGpzpz5dLsJkJy9n0ydxEelinGOmW18lX0EwbxkM8hymycvgZqU?=
 =?us-ascii?Q?qSpfbSKx9mr92PN/o/czAaYBynsuYbSTGe/JeC+8v22ggzP13WAYH5DKQwL8?=
 =?us-ascii?Q?zaNfP2X0jHX/Uo7ew0qBT/tfJQVT3ES0LEKHQmXju0X22PeFn94uZERk31Fr?=
 =?us-ascii?Q?oV8N82X8j0PRSP/fAg14KwZpE2LGpN3NS1nG/YqVHacJJN9LYob3hu7IS0yy?=
 =?us-ascii?Q?jJoSynCqljt/BDCgS8m1N18GG9ve8w/JtVVcbyK07RsaLMDbitKIu+gklSmP?=
 =?us-ascii?Q?ek8KUfczmXLVIjPzRYrNHIGPRaB2MRyRzeJgLmy9EbZ54VWAO3MpbKxqSSi5?=
 =?us-ascii?Q?XM0mGLEpvc7GITdYccD8Unw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+0i7GB3Os3ziX4DWj0Ja/eUs0BszGYcAZjjMuvUgsVDiCgvb6jSV9gVh6D5z?=
 =?us-ascii?Q?jsum+BW+6HSkf1JNxyOQWw7HASzRFJSh9k3TcO/o0K/7c2UuGBojYjC+0zb1?=
 =?us-ascii?Q?5Fjvj2Z0nH7e2QvJSG6tIbJN8TEvM98chkIxJmUMGsiLv+uElN5oPgOMj+lc?=
 =?us-ascii?Q?EXkjmr9/HTe6cC0wIcgQTcU5p/1T3CoBrIzbIbEJ3iikrrDdKJtkift9mdK1?=
 =?us-ascii?Q?FpA2oAVTh89SL9CHl1XmuGzNA4pC0dPqNYJyiuN8ByRYJCWSQVizyuhYqV0c?=
 =?us-ascii?Q?SWk/3X9tbKF5piT9KvkeL7HGLM+kbt+UjrUBGF/7uKdk5TRRH8vpHMxjFB1G?=
 =?us-ascii?Q?5aDxWENqR3rX6OrUX2oHTo8qRbdGONI02xg6xCSZxledBGIb/OjgYPNhpYdv?=
 =?us-ascii?Q?8vdnKJDjQJMVj1IWHToNabSHrP7OO/I3ycwm9r2X7K6TyOEcQ/5n6QlCAvvJ?=
 =?us-ascii?Q?tmYS0B+wYV1JeSXqpQr2C97qmgxEmHIVilnInrMGY5/OTgaveM0gbwEOcspD?=
 =?us-ascii?Q?UmWBVe1YXZe9Z416azvUBTFJ9s9hEEFmKD2tHJIS5k1U9nDPxdm6MLoiiyB1?=
 =?us-ascii?Q?YjLkdmJN7yOpOwvbmYlETKJ4ied6TWlz5kQJqfk7lvnmHyfc/ZziPFxuLsfP?=
 =?us-ascii?Q?gupkWT2f2RwD7rVpBkEqAgXtZrAUNaI25ADOFX0BBJXYR7uKBXxdv615qq0z?=
 =?us-ascii?Q?n79H7jS7jbh+lmmmbmzgjklveBHQ0ZcHZosxB9aoiWkDRU96TSmO7em5Qp7j?=
 =?us-ascii?Q?FHJ6OSllqGN3qXZjvVNzE8BwYKZMBaADUUeS/se6gC2K7E/5XLhJOCFWAtlF?=
 =?us-ascii?Q?pGpCpvvQXy8gOWEl6M/bnWkZp+/bdlIQZR6jYk4RfVZzVk/Umcj9ruZJvr2+?=
 =?us-ascii?Q?mRtZq5OswvJivkar8VTphgQGHP98wWY0L+DZR4BAPA4bQqNMAgwoNZPqDn2S?=
 =?us-ascii?Q?Gq/DP/qD4bMvEY4cQxp04Oe8JeumM1SZY4efx/YUKT3VlYp9P7hQAzMKVEZN?=
 =?us-ascii?Q?+5SfdXn2XM5vCejA4IdOkD1lR/xl12kQISNHoBFOdRbylhuQqp1xU2mPo0/C?=
 =?us-ascii?Q?W8p1mCcGKB2a1ipX//PXTU+9UbNeaKlPhXjTipRafwveiB1jlAyTfzRF77sI?=
 =?us-ascii?Q?ea+VKNsgfzUkOxkRwK2c2NunRe+gxlx9PW/P6M+v9HNsp3tOkmZxD/sldunA?=
 =?us-ascii?Q?R5qSAeFhQZ2SF7B9qiKVygumm5c0Jl1oEwC0KEE6DmR2J1eG3dbYnraMk9fF?=
 =?us-ascii?Q?QqO1eRb6PsRfk4xwPw/rschNIIRFj8e4c2bhFJgKpSLLFBRcd2/yo4IjaaaB?=
 =?us-ascii?Q?UOLLy0nphwbpijy0SU73gtmG2NVfMUH0T9/BFPCjK5OIh6lqMHaaFbwpcfsI?=
 =?us-ascii?Q?gCNEMH3MLjntKR9pWTdk1IrFA+lwO21BZ2WRrPtHClNdCt3KYtEyUov/GYaM?=
 =?us-ascii?Q?dPmcdiGs1ma74lcVT5q2qhNUluys/gQWPlsObuWj5+BB6OfMu2utkCiVVGQ5?=
 =?us-ascii?Q?qHQjT1vwCfEjYMIK2dk3NpaWoA6QglYjMBYt19UTRDPJV5pVwk9xVZRlC92U?=
 =?us-ascii?Q?BARvFQ+LbxvbYSLwOIJyM7TroZuSTYUCw/H4CBckvryPyZnrOzjvtxtl5ro9?=
 =?us-ascii?Q?/eGZl9MvgRG/EdMOpQHzYx/qg6vv11kMv89DmOvwSoSKDpTS2MDqbRz69CQW?=
 =?us-ascii?Q?5LTYyLnwTaurJUfgMxP0egkgtQ0j7OJH8YJdImQ2iJmGY7swTW2u7PWMMHZS?=
 =?us-ascii?Q?Wxqg5OuxH8S8C9iGnZV8HfTHTQPs5dQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68144de-5937-4bea-964c-08de5f54fc32
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:34.7246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3G7EAUkEYGSQ96QRBaB5TU/SiHSs3KrZvzSmRjyLNlmu9wleJZC1xZX0HOPOo/a+gZwq0xcJmhAtARreTCz0MTi+z6NjSAFHeDVXrSTEPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Q0EFqxRGfkNV-JyAM2kNGkIBljMdaaIQ
X-Proofpoint-GUID: UZDlTBzXfCzhhUOjkqL_gqq2NsUueUfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX5h0vA1Y55znl
 ZndeKfYr9JAKhgI4UTMzXJsIEusnO8fxkgMH2kHxMdcxDzKcx6HVlsUoE0fdXPzPxlZSY6sObvI
 iClwa/YkmCFcG8ab1E+TMJ7VO2evvdSoeXAHqqFEdO1H9OIyvIagw9BLvR0iGas3Kn2ZI1uNVQ8
 7E3ILXN16muHjNem+wQk0dG5dc1Ju258IwqGfCAsXpqjoU/y2+8t/xre+MtOE3M9NVLoe5IumdR
 dV5xO8HQ910xf6gHlde+uMoqRO6Jy101bP8uepYBo36fZyKfKVNhd2QTmXn3FITNWX0GKm3YB+Y
 qdHw4MJHcv1vVPZem9/WKQTKqOU8fqx5oSi2phM6hgxUN8cB/zkk483u9FpWsgSshAMjeAkaHrY
 DUbM0FxpP4RVZkQeYCR/1y0dm7TTxa56DPDXvHh5EYXYD/AsZhFUgvq47rq+1sDGEzaAjMuV5lQ
 Y4LxM7LQ3CWS+aJlleQ==
X-Authority-Analysis: v=2.4 cv=RLq+3oi+ c=1 sm=1 tr=0 ts=697b8d49 cx=c_pps
 a=c79N1uTKLHxLQxOLln6vMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230147

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


