Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB0CE8FDDD
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6596.1766835237233410110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hUH+li5Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRAZHuv3729804
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=; b=
	hUH+li5YdFcBBREoiOYfmsunIsnHSm8WWSXc3N3JNsAHr3NeN92ibgzqQTxtvUqk
	rUTSgxrn7yaQudZc1GpVnrsAgJbjTEuCO9dCsIYCbYNrv8LYSN4N4RnRUtzvmcGR
	P1fWKe7AGKh728IEQzdm2B1tg/4SahY6thijBR0gL0PcF8M1YXtd+HIz3ORYRfIv
	fT4nzrxcd+EQjumZn6AsGbBsIa+Eav42Rca9hcXPubcLM2ZCGdw0epCfPYpLSna1
	BMIlJMuXVkcGTNNH10WkwrBmliAZq+y32oqBmPmgvmSU9NPgijdF2RQ5uavGUbxt
	NGKFhtDMAw9G+XfnWhkaog==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8mg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR75DB9b28uJ9OH8+lZT7rbSA0VqD5yWcTg8qsMsAU5Zsy5bpIrG6fNiSQK8QteAKHcbXzznVUgjIHBvgK8xeNQuF3tyyY+ibBNIhoGrjhG0vn/e1VCYvjKe+0OkxGE1gHjlKNmRA6klpSzXKsC9SUGJSxA+lARTIknTB6qK1f45mSEXb3n00MvTjLVW+6EjGyy8YZNnP2g609eIbR2BcDHm0q/JvN6tYfMe8JGcl/rkEvVSWZ3gVa4E/uzDOdDBtkEkJix2frFtZsaYCwFfNYh1uEO4hWMAxgS77UaXci5NM0M51JcdjYDK1mLb2BL/b63bCbvMLoogA7eJAr68gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=;
 b=VhNCGuv463lTwj0nUJ517eQXprzTDhF0GgyWOfdASyKxSCaHLISJE1gfuAuS31rHh/xRj/CHbn0ktiskh81EPE/1Pbk7vLkDoZ2UuUrvAUAtgV/1GBejOOarJj45BIalYznCmDoOBleyB50H4uXSdzH4tnXc8TtTVfIWG1RbaWV/6h+URTz1qlNOTaWpRY4nB+2g/FJAyaJHiwZbBEUsGiaQ1cCEVc4IXr79Th9s4UjuwROH/9YKlGi07QWxpQQf3ZH9eBqCYyQpJE7iBMFlNU+jtdOPjciSjLseFmF8Wxkbn21ieSAPmnWdEJu4aznDiScc+NKyCfdt18a5vYe4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:54 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 13/16] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Sat, 27 Dec 2025 03:32:48 -0800
Message-ID: <20251227113251.773795-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b9fca45-ab49-4e48-12e1-08de453bd0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xRQXcpM4QXzgWHyjor7E7e6pWq+eJkv9mUTSnMlWs0gViD+L6J+6rBNHaIEt?=
 =?us-ascii?Q?BvzHgdm+eixQ2pJcvohZmflkbXTPRppc9a/4NOD1aYKOpOc39bdXkHP1vD6b?=
 =?us-ascii?Q?fbu84GINl7c3JnUgb0P1PIvB/okdIou0XgxTA+IPlFPhhTI4ugeUXUN3m6QY?=
 =?us-ascii?Q?1HYxm9iMzg00seotEqPti95jCi3oTlVszizaaCEtjugdGrh3PJKf4eVja9kM?=
 =?us-ascii?Q?ejpemnlpRwmb6F2VFzY4fxx0FABrNbdwjBc87KHEVReb7oaw3CInCF6E+CTt?=
 =?us-ascii?Q?k8PSAo+YShlRVIHHIMGFxjoh7Z5EudTn788eI9/saOov3v0JnGK1sy/5wTY/?=
 =?us-ascii?Q?8JjAopU5uGXEbTF3XVbA09XcHEgiC7DrH8ichrTxZGl71ws6ZEVM1bwc8sIg?=
 =?us-ascii?Q?zRRBT0MyVT/7zwhPqNMaCpcIG9z+mAwdn5so4u4QDcs2Alo8+0EKGIvSt3Ed?=
 =?us-ascii?Q?U3QjFy2lj+6x8c4oogF/EYO1HD2x/szI4A+VAlyZdttjvZaN/HTUOaPdtFGf?=
 =?us-ascii?Q?kXXy8YeVCBL1c7b27IEDYnrRlMkwR2fY/cj0ps+XzbGpqWvCXQSUliLFxx68?=
 =?us-ascii?Q?G+5+zrJGGAp6bX2HIo9IOSLbWU+6yaaPZbLFruy/mYUVvCUw9Apz4SaPqigQ?=
 =?us-ascii?Q?ENMuVz08K12INMPPw5D8r56joI/eLg4lxslxn6S4p/f8LoUCa5buoGnCGxTR?=
 =?us-ascii?Q?pk6+sg3Kw/hDkddDZv1xP0zmpAN971WcgM1vgn4pqaG/x0AL0NyK9P2Zgi2i?=
 =?us-ascii?Q?jbZ5SINKNxK4mNHSfCtFqW3P9lhsJzSncMJQBLx0TjxYJVEJ4GxWKgDk8mOs?=
 =?us-ascii?Q?EK9mNhw9ElCN6KyHRgtuMNreBhtBS1HZbu77Thgg2f3gA+YcxXFRdA9meTzr?=
 =?us-ascii?Q?A/oq8Ww+ff83rEljtP2dvdnvYH9IgYQTO0m8YeUj+HEx3bIizZyas6qKcxmv?=
 =?us-ascii?Q?4XnNnvf0PsJRWvuTmU4jbMIdZJ2ik4iFd2brYArm/Cc3f23/X/0YiBqaTj+g?=
 =?us-ascii?Q?A8TWzg/W9ZnM/melsYRlv2WuNK+GMMCq0f6PtRduY/Y2twwxYq//FhIgUenO?=
 =?us-ascii?Q?+5Emo5hiDd0IjI1xhVJzNn42CcCHeUDZ66i8GhjQi994ZRDtjx3j6/81wSXl?=
 =?us-ascii?Q?Wlcyjc5yZSmHn1Cy1K1za6oTZCSfX8cq200R88r+kWERPzBGcF1s+GaGI2cw?=
 =?us-ascii?Q?6n+m2NHD/SqcE+uiWc+kY4cq+VqLmxWPI88TczGOxlE+RU6Nr/cQUBeJMd3c?=
 =?us-ascii?Q?Fh/qkLBgV8x3goxkGjmnGsunL1wOcr5ynLnpER73UV2QIEA0RyWq8R6r/0hV?=
 =?us-ascii?Q?abFeHBOPNULy+22nbv42vZKarUrIsewaSoIwpl7jyh/rksnfuFlpzA3an8wP?=
 =?us-ascii?Q?ShpJ8cxSrfib4BG0cuqvvNk8rEpPe28ippsv3TjknzzvoPi8k4kt7atx7Jib?=
 =?us-ascii?Q?AyQxVUmzNyzyI4LIBEnHZzqbNy+Mvd1LcghfCyYxjJrQobxzBk9mVgQytAx7?=
 =?us-ascii?Q?vdOKUIpOiuuF2RxakZKUb9il7AbTiW+sE06k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EVcpTeOGYAl31ox9Il/8g74nsCKaBQNVQIqQbYmJ8Ak495OtmOaTBm5SOqdn?=
 =?us-ascii?Q?1a0WTsNXWNgfrjZc+xfO5oME5/BlCcyukkri3CF11TcxSYzCFNKOkm30fJTX?=
 =?us-ascii?Q?1iyRA1zU5ueNk+0x+5VNOHYE3YL5iDgO43VZfiWuKGzmcAr4b3PrbxOsahKT?=
 =?us-ascii?Q?5yZAa/9m42QAkK9tiYvTwD2WSI48XwORdWOnTOBgp/fIvGeGk5vcD3GooQiq?=
 =?us-ascii?Q?GqrHf2ZEtRosKGTbZHmxMmgOGas4jnMS/V9VJ+K+9UqtPkee1HVY6LDcnt6I?=
 =?us-ascii?Q?2jBE1nyUh9Fn2kphUMUHD1ruhF96LiyG+19U6Qy0kfJFxxB7iGLZp+MEDX6V?=
 =?us-ascii?Q?xMNWVaNML2lLIWOpvvJgxxuFpdV2unUyIKivi/9N2XARUTn3JATc51omxZv6?=
 =?us-ascii?Q?nm4oLMPARqQkqsjBG48Su0IuO5o+sSKTiCy0eY4Aooc9IHJvVRHtMO43Fr4Q?=
 =?us-ascii?Q?ukM0BdBBPsZ/rf+xbDaMIt1WOkzjvGJLEAjbg9pnzQzL5HjWnHUnbXE2RFza?=
 =?us-ascii?Q?KHS9mz8H7KjIV6mKnJuOUhBpmTypd6TYTJGDROCifDAW+r16Niiwl2O+BZEC?=
 =?us-ascii?Q?WNvqgGCNI6JW+hrOcSbQACZE0Vxv/G4CB3GUTz3A2hj1bdgWzCmxMRKGosBo?=
 =?us-ascii?Q?SZC8mSuFTN3LfC5kmn4CE/9raI3AV299J5+is/1ydmZY/OMVAdRj9GVScJPB?=
 =?us-ascii?Q?gMJT7ayyspl7C0+4vn8XjHuuuw6uV+6rzHx27UhPC9Sekxay4vmpOw8tyPMt?=
 =?us-ascii?Q?prDUoJ8pxCa9ChkYoAKx8O4JFwSvXb8KgKLPoxiJVcQfwwJKlOuV4bkTkosV?=
 =?us-ascii?Q?le7DnOJdQ7hr9uFS589gXca715O+lT0SPHzADFz2OepQHZeonnMKYofBasxG?=
 =?us-ascii?Q?g5DpE6HWQj11bhBgiIWu+PRbBHaxxKX7r2Uix/24438mNN0FB/Qp+D5KEjIb?=
 =?us-ascii?Q?5Vy6ASVYMONYrW8XxkQAMCAr3TJf/uea597COQBMfOLx1K9nzbLH+ycCSK//?=
 =?us-ascii?Q?czFGAKthhBYygs4OvkfDF0biZ7niZEYjNlKomQa+G/Ew//MD4iJUi7IuG3jo?=
 =?us-ascii?Q?n5qJmp5CUkKvbtCpbj9NgE+6rJuXJIunYyRCzm9UQgbE+D9zVJWbCjVYOZSl?=
 =?us-ascii?Q?ef7x7W0OSwijY2juzd0k09mPYtDIiRkD/6ul96c/As8XODhfgwVEfpjLj9Mr?=
 =?us-ascii?Q?r6SUSxf3RwWfVHX5f0/hA/5dpV+lMhZscATRbv55OFtG/IupjN4WtZLxfR/E?=
 =?us-ascii?Q?hBUHq/fCT9WuGL3oim7ONndhJYSOD15wvjdvBamyGLq7hkSXyIfD40XI88hx?=
 =?us-ascii?Q?dVLthjz0W1zujNEES66XQoxI/mZhYA847Nx+o7IEmCXi3EWFBF/+inDtbdtU?=
 =?us-ascii?Q?22B4Q3OcVRy1wfR15YANlYWW0vqp8l8YwuJ+4K8EUFSwNhFINST5m3jLu0eu?=
 =?us-ascii?Q?S62YIVjf6aBW2+TZuP2L2faKVcMsS804s4aYKWHalVce3BKcJ9W0rMOSJgpA?=
 =?us-ascii?Q?EQo+WICgSmkTnyT6iVElf+GJ4Etai7v6PYjFjJ3WpSTpYiPcM8faKmgJIZsl?=
 =?us-ascii?Q?+0J38lE6Rh7a4w/NJTNuDP6QbeKE9ILGhiwH9RAwLQQHm62NLEGtCm6m2BOy?=
 =?us-ascii?Q?lONnRmnmk8PCQkPgZnHoIofl1GGHgbdRYbRf2oFkuXVHaJh1g9Erb1msiWDU?=
 =?us-ascii?Q?r9Ydu36C+8ZWh8kqffuN6nKyP0Mtmp208ENB6vyD+zspA71kJidAy17JoqSG?=
 =?us-ascii?Q?2PvJr1w3suXBFH3HDPl+yAsFSZ++3bc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9fca45-ab49-4e48-12e1-08de453bd0ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:54.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RezQCrQ7NUBp74QI1C7cZqISuypkRbvdgWn1b2xVJAiJeNXTdV4AYmtomgu76T+IvYFN1ij3pc4OhOd6qIVAVvok6ov/6tGGQ85pJ/Ryqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX6QJcFRKx+BGe
 FieaZCAgBhj5rQvleuPcwccXr/pkqUPCPmqnSEot746qES936Qgk8tzGg4x+0rZnjKj3lBYtPpb
 D9NPss9Xa3KZTpMox8ZqgETh6hod/A/kGOntmDH8CBcUTdqHceCUj77iwRi40sORkWdxprsS4tU
 i+YjriOqdFDDG3Dumw6Sq56kjeRjuFoAo6AFRQLJA0aaewa1tK3zdbLM9xOP5a4jL1DsgpmMzfs
 06JvZZNlmCe7Q3bzkkgXkPgnx4CCFyX7yowVefM1uTP9FBzsUXQu9rrVpN6X1RjVYGZPsdwrz+N
 OIg9YLGuM5jdX1mptwXq12rwLi2VmQ60Fic8gMK3EHkw3w02c7D/+JeZqE1QJWyOTE61yKpJvE4
 6DZfS9jtK3986mrUecEHtpNannzl1UDnYF62F/1h/5qfWXD/XfqrI//3juj/C2N76Yp/iZ55txl
 wlqhLrbmy6jajpXKdYA==
X-Proofpoint-GUID: EDPxzTD8syCk1fukvdQwbjTkcJYOAtJC
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc424 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AXdspKuNlVAGVjIo0CMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IHDgZC6lGX1wtd0tU8r9sg7IqIanrsUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228567

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 30a10b0801..dfb8604a68 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.49.0


