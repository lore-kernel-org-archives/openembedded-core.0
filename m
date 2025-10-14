Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B3ACCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18818.1760453750256711047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gKHvIO+V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EBJX9L2621474
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/fxc7bo42BBhnVJN696jJxsJD1p41EJuerJxqsoZuZc=; b=
	gKHvIO+VO9z/bpkAJfdZd+mt3wV7tQ37GI/ME5QxOUX2dPySMeHvaXlI2n7FvSdq
	0rVRC5qQFm5iIz/3rRw7Wpw+8U93TKsieX7v1Emsu6YEqRGrZXESkj33H+At4KOu
	4EfkY7nYrAwfAICO03+dYXEcOeMdx4q8uITfdnJ2daeYqDzNXp33+3Toqh6f+QWD
	/DkFNoJr8G+BI7UC1w0k3+LzeFDXVKMuYnH79olXkeC/mXvznsKLEfFef43pbPbI
	P+qJn58t/o0xCb4BQArto5eH2/fFRRsUQBNiCfu29waEgKG+L+u6y5RrX5pHqpT7
	twyaI/vTVBPg10MvucP0HA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdtyhh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/TJsiDlhZnsR58tAik5EmcK2NoASQMazcunfnViE/gDNdy8HIHxL96vh/tkcuDwA48oH1gBnuMi02wm004FhkJ8AcHjqM9jmXc1yqh7NKS+lT1aGJAgqqIWiE5ukSrQtC7HPlQjiHq7B7FJy5rdYKM8hGKmJUivUBIlyE/00Ou9yTdZh6ESK0u61J5MqdOHY/Jh6+U6FBCjYsQDHF+ARBGvLfM8yyncaF3ipY1DlOw3pqJjG2/vSTWA+j7KoST0xbbQP7Wj6si2kvHN3mESax873JEaUGOFucWcDdCflOgaviurCoNMVhtWrRRK46r+67BoNEeoSpYE7UJEvdYJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fxc7bo42BBhnVJN696jJxsJD1p41EJuerJxqsoZuZc=;
 b=ub7ntwSehzs+z9kHJUnpuE0Tir7KHM6oXcSNlujw3yr+OBmlVr7lEKItX1cGw801YTwZHhor595fkR1tF5aW/r3RSMoIH6E6x7LMGmefoaz1otazDMUfe8LnsZVQiKZrEsdZPuIGu0BpJLKXXpkzHWC0Hj9bD2I/V38x6SedIyRfEF4osOuOT/niHbMxmJ9akCtBU24v26JLIdg8xvYK8dT1VylKiyhXnhO/keijqIVs4bFDH1Gn83Pm+CblpIafYIC9xk8dnr/aDoIiDx7vJseWgu5RpLh82S4C+29OXNwtNKgU10yTofG7jbDZDzz4s5/54Es+ITDGQus9e/8ORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 14:44:45 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:45 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 09/11] glibc: nptl rename __condvar_quiesce_and_switch_g1
Date: Tue, 14 Oct 2025 07:43:45 -0700
Message-ID: <20251014144347.536537-10-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 098a220f-886c-4d14-1956-08de0b30373b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?smYJN2iPjd8GAcLeSGViRNsuyBUE9KK37fX5lJ/0DtCbIi4lnu0xR2jPGRva?=
 =?us-ascii?Q?Holh7lWXCxNTnWi+6y4sqdUz+SfCIIZ+bp7l0a84Eygn7CiqxSur2uvNRIkF?=
 =?us-ascii?Q?ZQ9V7osxGVTR82wHzu1aJvohtA2Ui/Yt6MysltKx+aDAmt/9tAESxKWC31a6?=
 =?us-ascii?Q?AhT5z5BiaH9KNMYNwhaz9r0HfCedtoyZxrlG/cUH+qkat+3vkjH1LoqNgEI5?=
 =?us-ascii?Q?5Felmmo+0e5/+NBxD8aq6X8nQkinkLCY0nqbf5W4Tk1jhU7F7oNASUzcwcZw?=
 =?us-ascii?Q?f+SF0nm6PbvvhLqAb8QecbJNIJ72TNqPl3f1VTPD+ciCb1RgIuajQ0FP97GL?=
 =?us-ascii?Q?rBOuxaMtZpKVf1/Vn2PwuhbwAFClG57lpSPLgA4sJNv46o3CNxw4ax5ZS5FX?=
 =?us-ascii?Q?e1v7NohKBqjhgPFOjj7Vs6+MwmHOrLx7riYuBnlvAz+CihULsK11Np6GuO7L?=
 =?us-ascii?Q?Jntx/BfUeHCsSGnz7KMvcY7OTX8Y+/C/wEbEaa6uQ1hSSXQhon+DBoPM92T0?=
 =?us-ascii?Q?TC/xyhsE2Viacl0zpda6A5D+05PxVkeUG8oEspuUg8U/MItm1xy8Np9HDekZ?=
 =?us-ascii?Q?LzXairOLqZtsKw1oVnj2Edyzx8KIOwqoPBhd62/EibMndkWrYwn5VNDUnyED?=
 =?us-ascii?Q?nBuiBtw+XD21w0a7z7B9dVpFmvsR4e8ogJIr3iMJvAOxdyx0sXprzq5iKVyt?=
 =?us-ascii?Q?GrJd9g/h7aK7iAfNZ8mND1pCXu3zC/sHneiYA4VYvPIZScBngLtjC0vMzAk5?=
 =?us-ascii?Q?wHfTpWQXnR43ikXxuiZ+y0IJQm4eRWCuRXzZDk7maE1Vu+kGvegbG7/IFwHp?=
 =?us-ascii?Q?wDnaL1A0/LXH02MNVHygcOHrUG4NZ78MdmY7+j65f1qo5rz6Wnx+7nn/kvTd?=
 =?us-ascii?Q?7UVEiNm2aDJq+4BCsQnryZ3ngymlvjlYF2hq9aUGYYcQHDM6Cyf1negmaXIi?=
 =?us-ascii?Q?pwGw1VGa5S4H+El2k3X5g5QPE2Cd9Y8Ku9cyvrgJHuCoKI/BQaXIQ/8pCZp0?=
 =?us-ascii?Q?F41noOyE6JOazh2r6YOAiFUg4PjRA+F6+ENWaCLmNCvi+KZJzucSrEYPDiD0?=
 =?us-ascii?Q?L/xFxuEQVM5k12isda5uYPRZ5eNknC2qOQUlOHS/1CJRmckA+U1wFc6zazq2?=
 =?us-ascii?Q?83bGDkFbEe5+zBKuFYDDBMmO9h2jWmG3NXRbkv7AOtYAZtYTb9M5lUOfzVFg?=
 =?us-ascii?Q?U/vTrNx0icE1OHGnAVaB6PlDkLPBhyY9ZG2dCoU2m0jcFujSGEKFvwXSF8ag?=
 =?us-ascii?Q?R7KAtaosxFP08cdpImDaMHPKvd2Jnygf4lexags8fjBgNeBkhKYYxjmszqf0?=
 =?us-ascii?Q?qDPmrqmlL5W5WpBCKSooG9KKJweYHk2mZ/R4K27EjUblo4Wml3SBhho3E3Ut?=
 =?us-ascii?Q?epJRiUTNZOphNHGWYhg+PSKE9aiXMFOt/QhNxAB/HvONooGD9PVuidCdXcHS?=
 =?us-ascii?Q?iaAQikV9yq5ZejCTrzzALVQXHrmIFgT0DAPXlHU3wd+JQA5+0jRpyQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EOQfTJ/xXsenFeI1BwHEb8Zs/0PKS3/QzaSWqM/qugCejBO1FyJRF3G6qYe0?=
 =?us-ascii?Q?7k/nG9jE+Q497Jh1kMwFUNXTjht9p1I98aven48dwD/Wqr4dvlH8vH10v3Ss?=
 =?us-ascii?Q?IJ9863OvhnLiFb3O46lF5j1QdWZj6sTFJcxLuInjhEmHETq8muZPxo++8/7u?=
 =?us-ascii?Q?kLIQbfXiQE2Le4IFKwKTqOU6nRjnE8isfrkN4O6uAHfloqCdTMULIMpp/gTr?=
 =?us-ascii?Q?ZwJ4mGTjUnhZ40Tc5SYStF5pzqjSnJrvI7Kqu3m+vpJHMi6Tmc0XE2qAZPz4?=
 =?us-ascii?Q?Z9cevrGzE/+NoSdn8u/Gx6t6qjvogmrDTh6qYbEnGYdw/8t3gE6bJOG3xACW?=
 =?us-ascii?Q?Tg83jD85vUScGbwYF7uZnp8/bM5ATT5CfyQ7C8e1bFBWQ6rPiY7rvTyvnLuN?=
 =?us-ascii?Q?kDEcwSG1GRroP3Rlkoz39gj18dp5gnfZZS7+EKQG1eono+Q5v4V3Mgtmdfkf?=
 =?us-ascii?Q?Sl07lZ7GCAjB7Ueanx+NuKnnvOJnJ+7OJgkl7L8Tf4tagIPMVEQqfG4dBzRi?=
 =?us-ascii?Q?nMA4vsrydk/OZq12dNOzSkqgHWAyrTFZuRd9OjIA98y8Dp2oExZxCjG6ShN8?=
 =?us-ascii?Q?leOtZYHr8KxQ9j70bWMhJzMAjYT76x3pETUBSylwcxGu3PNfVOX/cX6lm0Gq?=
 =?us-ascii?Q?kaNeyiW+zM+MPwdzVVCK9y8eixUkBPFnUTHbpToAY20oqZBs9pOwKqJwUDGt?=
 =?us-ascii?Q?xcvSBjHq9BxbGrVvqcoV+7IjTU0YO4NxNpFkZfWOWftfzigOffBA5pBVZ040?=
 =?us-ascii?Q?XNun/cjeamk33GavsnRHPml6BtugV3WkhTPp5/hdfOB0yY8IVxI+QprqXWJo?=
 =?us-ascii?Q?sUkX+h3nxKkfNbumcOXIHLU1HcRhqcAt5jCrS3fnTv27FseQhFRv67fKdm8+?=
 =?us-ascii?Q?1h40h7Kpm31B8JIikeCKJNjVnJNc3u/gFslQT4K97ck+mvjkyiCZK9i+hzAR?=
 =?us-ascii?Q?AmJBRHT/Az+hnR0q/rkVdQ0d+y/yzqIVm5QtaBeZv4VGJPWaLbJTen0/yEcF?=
 =?us-ascii?Q?K2qB1pBRbM7GxGIshzvLi78Z8rXkFNXlWH0yoAzHA0DgFLBvqrQg5xXu3EKu?=
 =?us-ascii?Q?/nBuIfLq3iQX/5yqSOzrK/Dn6CGKC/O10ItGpuqcQDTymBMMIe5fRNrADOYS?=
 =?us-ascii?Q?4zaNWZlUc43BleqYOahDgPB5CH8ELILn6qRlI8YTI+pIrqq/2gc+R2KP5vKc?=
 =?us-ascii?Q?73bi3W3RqZZ8yCYh4WlWw5fAyWuHqMDMleB2BQI08K9mhEZaOyDcn+9hmNHQ?=
 =?us-ascii?Q?J1x0GC7qLq7eO/dk/Zo7NO5EW1gpP9QLkJlvSmtA79Z16DD7sKHdQEetmOSY?=
 =?us-ascii?Q?UNpA/mcp+j3w6qMjBrKjEL65EI0BR4bdxTP2riDgpjsMOCDuEXs+CJdFOSXh?=
 =?us-ascii?Q?4a3mXJC/ipxiqQKMmZTODI/FOdRc3Pf8wlRes/9Ba+ZreCIFY40+Q88NAbSr?=
 =?us-ascii?Q?h9rEGpy+DLYUEKH7rhLQ3wMcdDXGrqO5UBqPA1Cck8pLBZfPT0Sdu4CO5mI3?=
 =?us-ascii?Q?zMbwYNNmnBNJfnmEsY3jakaD201Z1Pf0PKfre4p75qLCTcIsmyaON9+5NGa0?=
 =?us-ascii?Q?0ntr75piRyGrz1XdUeusq+HijSUanDd5VbfYSgzCoCD72IuS69AYJ7fKd29K?=
 =?us-ascii?Q?++NrIQY4BprML1nS7/fWvLI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098a220f-886c-4d14-1956-08de0b30373b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:44.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK6/gYZOnVKWIntMrQMBqrhiCxUyYJBThHFH1lv5EinRsnLCfxZ/kkSzQ4eCk0Jj5KEP5haVVaxLhCiIoiDQpyhF770lbp1j8FgtXqpMwPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMyBTYWx0ZWRfX7DtP20+otps8
 AjwPC4vY41oFDi2DOAbz+uTNHfKMzMsZS7//KmH7Gpit+KPkaGHxe9hFKD734lJksazZkjEi+eR
 zH5Pr7E2IKgjJSTqOLMeCjilQcgmYoOyoNwd5E5RK9Z60x9mA6aMVdYyesn2jQCmjWnTV4CjVli
 dgdEak1fYuMrgoDuxEY5lbUy4H55t+qma8A5SYjiM8c7dgGZtHFC6/4QJhNKNHRAEBpD+JOoPss
 EbeKdpB/XAW213X7h6hTQbwJryQeyxyKziQ+0ECY2Sw3/PGZWNFqvYiA0SJWsw0IJbdvCiHEmJp
 M0VT7T0Vmn0zbBYuh8C612o9GJJAxk18ruGCwV/JtMnlkkYC2IDOkdrYDWkCs9Pz/rOdj3gWhl2
 Y2/1N86e9bKB5yLBes+UDP2I2q6Ryw==
X-Proofpoint-GUID: udSGMMyY1eAGuGbMsCqGbuRfqfGzzCPZ
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee6475 cx=c_pps
 a=qaGWf3H7ZUycNCJ7m3WmPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=uyKIICsDoPcSdIl6ehEA:9 a=5OXmESjOoUQA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: udSGMMyY1eAGuGbMsCqGbuRfqfGzzCPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224832

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002281.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-8.patch          | 161 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
new file mode 100644
index 0000000000..83d9ca01a9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
@@ -0,0 +1,161 @@
+From 20d84dfa0b9a32f88259269bbeaae588744ae4ae Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:33:50 -0700
+Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
+
+This function no longer waits for threads to leave g1, so rename it to
+__condvar_switch_g1
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002281.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
+ nptl/pthread_cond_signal.c    | 17 ++++++++---------
+ nptl/pthread_cond_wait.c      |  9 ++++-----
+ 4 files changed, 26 insertions(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 5ae141ac..a0743558 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 				cond->__data.__g_size[g1] << 1);
+       cond->__data.__g_size[g1] = 0;
+ 
+-      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* We need to wake G1 waiters before we switch G1 below.  */
+       /* TODO Only set it if there are indeed futex waiters.  We could
+ 	 also try to move this out of the critical section in cases when
+ 	 G2 is empty (and we don't need to quiesce).  */
+@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 
+   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
+      which case we can stop.  */
+-  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++  if (__condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index f976a533..3baac4da 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
+     return FUTEX_SHARED;
+ }
+ 
+-/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
+-   leave G1, converts G1 into a fresh G2, and then switches group roles so that
+-   the former G2 becomes the new G1 ending at the current __wseq value when we
+-   eventually make the switch (WSEQ is just an observation of __wseq by the
+-   signaler).
++/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
++   and then switches group roles so that the former G2 becomes the new G1
++   ending at the current __wseq value when we eventually make the switch
++   (WSEQ is just an observation of __wseq by the signaler).
+    If G2 is empty, it will not switch groups because then it would create an
+    empty G1 which would require switching groups again on the next signal.
+    Returns false iff groups were not switched because G2 was empty.  */
+ static bool __attribute__ ((unused))
+-__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+   unsigned int g1 = *g1index;
+@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 	  + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+-  /* Now try to close and quiesce G1.  We have to consider the following kinds
+-     of waiters:
++  /* We have to consider the following kinds of waiters:
+      * Waiters from less recent groups than G1 are not affected because
+        nothing will change for them apart from __g1_start getting larger.
+      * New waiters arriving concurrently with the group switching will all go
+@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which finishes closing this group.  The value we add
+-     will never be negative because old_orig_size can only be zero when we
+-     switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.
+-     Relaxed MO is fine because the change comes with no additional
+-     constraints that others would have to observe.  */
++  /* Update __g1_start, which closes this group.  The value we add will never
++     be negative because old_orig_size can only be zero when we switch groups
++     the first time after a condvar was initialized, in which case G1 will be
++     at index 1 and we will add a value of 1. Relaxed MO is fine because the
++     change comes with no additional constraints that others would have to
++     observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index 14800ba0..a9bc10dc 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+   bool do_futex_wake = false;
+ 
+   /* If G1 is still receiving signals, we put the signal there.  If not, we
+-     check if G2 has waiters, and if so, quiesce and switch G1 to the former
+-     G2; if this results in a new G1 with waiters (G2 might have cancellations
+-     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
+-     new G1.  */
++     check if G2 has waiters, and if so, switch G1 to the former G2; if this
++     results in a new G1 with waiters (G2 might have cancellations already,
++     see __condvar_switch_g1), we put the signal in the new G1. */
+   if ((cond->__data.__g_size[g1] != 0)
+-      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++      || __condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Add a signal.  Relaxed MO is fine because signaling does not need to
+-	 establish a happens-before relation (see above).  We do not mask the
+-	 release-MO store when initializing a group in
+-	 __condvar_quiesce_and_switch_g1 because we use an atomic
+-	 read-modify-write and thus extend that store's release sequence.  */
++         establish a happens-before relation (see above).  We do not mask the
++         release-MO store when initializing a group in __condvar_switch_g1
++         because we use an atomic read-modify-write and thus extend that
++         store's release sequence.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index adf26a80..40a74342 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -354,8 +354,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -387,9 +386,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       /* Now wait until a signal is available in our group or it is closed.
+          Acquire MO so that if we observe (signals == lowseq) after group
+-         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-         store and will see the prior update of __g1_start done while switching
+-         groups too.  */
++         switching in __condvar_switch_g1, we synchronize with that store and
++         will see the prior update of __g1_start done while switching groups
++         too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+       unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 7ef2c8cb4c..265dcb9129 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -69,6 +69,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
            file://0026-PR25847-7.patch \
+           file://0026-PR25847-8.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


