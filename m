Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BB7E95A9D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64804.1767104191764349130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c5xtz/1H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD9Y0m2560404
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jj6+kRu57TojOfTBEx08616I9oX/K/F4UZovynHwmsY=; b=
	c5xtz/1Hbpvtwf1sVhQKR0L4O+rTbzt/ue/nhhzzb7l235GnYfOX56Wm7ATuPQsW
	p/eOI7VNL7y6LTs72/WWHqh4VYH7RhzCEewe+3dhtZH8YbbZbUnQyEg/5u9E7csU
	J5tIn1+zCVHqkjfJ9nUMxLFqqMR0fOxSot8+V4nEjQzEBHlVDMKHiRb/hGmVobUM
	44h+iF6QXg65oA+vCEICUqVStJQu5bs5nZPJmJXSovf9liS1AdvSvWbpJgoCeL3V
	2U65OOvPDF5l993oMThVCuE+c4C/DfekcTuVzlBI3l5F5BkqlAI4mXRlzU9fOx3n
	MmdWCsdV2lr+iHiwilwNGA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtxsj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtOfBfXBz/WwRz1BLHCEps4IyRB0v+qELWem8SyetCvmqWutuGGsv0JnXp1RS7yfY/GO0SHQSVxt22IdlacJQ9uFJiUbtLJ9R4F7EPt7a5pDZzKv0X58yajsXWOHMRYR+qMeD3Ss0zohBoJfiSDBRRomCXtZwovmpE86jGH7SNeZL084uRmvP8ij7iJawx7FJ4aXnAVSYF8HuF/nXpZSCGh+DFACFQ+YOYCkjPRBYZuHF+z4pqnzks5sZwPSXSsR8kBL5GOEWzYa7CBMwHgI1OVLez2EruqkA+gW+tUB2Lg9YOosKW8E5e6WivGrshWvyqcWLPB6jSMn6IWmBUcMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj6+kRu57TojOfTBEx08616I9oX/K/F4UZovynHwmsY=;
 b=MLZdDG+jLAy/APq0ZXpF/+Rj/LHCnpowKCZRFPzkicFm4ebBZv5MCDriXKyHPL0wzmx4BsjR2PN7W0Mu2IAqc+NrfWaKAVDpK+9KnbtdJvTMk2+TCcT+akJ9m1ZcmcWLWnZId+YFtOABumaH716U7mvGC2jDYz7AIpIgGvRebjTEcLFcd/f5fjsrIr/V4EOOpLZN0ix5GNL6SRAKlQ4xyqctowGU8zgA0H5PIe9yJf4MbWaHKWe8KlWP40QREd1HDtO8GYy45/S1/gBN3e4FhmjM9V0PgCnaIxzYlAusSVxnLlXF62m/ObRcwKYRAWEoAcXbSHWh9gyBgbWAL6sk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:16:28 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:28 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 05/15] kernel-yocto: enable Rust kernel support via rustavailable and staged rustlib sources
Date: Tue, 30 Dec 2025 06:15:30 -0800
Message-ID: <20251230141540.1974380-6-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7c0176-e1ba-4e70-8f5b-08de47ae060e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NHyaNw5kVj3f/dXLJ53+SEVbdmNq4mAjN9JsrMLgm7AsV+IlpiSGhay1KLNu?=
 =?us-ascii?Q?2ypf8PZ/g36Ie7Z5DJ5ZxWy4qO3lkA+QYCZmFZKdSg/xUfir+WurpqcONoDP?=
 =?us-ascii?Q?TBLN0QNjUdsYq9VQ5YczB8jw5hTrdpOTST8YQtkrtZ5PAcZMgL1nwLINhyfh?=
 =?us-ascii?Q?S+Tco6tOpHCZwBOPhP/p/PFhKYWSEG1BhrwUVSs0Bsech1CXQMRkAJtXSWBx?=
 =?us-ascii?Q?+gFhppCYyW2sYkqsUOnXj76P7EVONhs1h+7cVx8gkZqmbxevkWOb+jEkcMI5?=
 =?us-ascii?Q?gvchDWX+Lne9kBSWF6l/VS9pQ0JVsP9CwIgYFfSvZ9hPTNDXZ25qsDvxuYww?=
 =?us-ascii?Q?/e7B7kVNxqGFI1mZ3iXy6dtdwPJwKye4zTajTaLsZUkq38JxktD/lfD4k+uQ?=
 =?us-ascii?Q?zvvrHsMmq69Ok0SEHnyfEME9RLdKUIm5pAxCoVqGhvOlgNHIqX+X2UoClzk2?=
 =?us-ascii?Q?zUkcpEbbUs7xt+b1tQ1Lsor8V9Y2Dxt1Tr7JRKGx2yKwNx3y7KKzdGZL7lcY?=
 =?us-ascii?Q?iibDSTGFbCKaijW41Tz/SIAcFWvmRMqyCTMBDgmvEtwStVRCs33d2JoMyZxm?=
 =?us-ascii?Q?ysV+0JzNhARhzlD3TnUManOXI9d8N1fcLW6zOt0LDoRX3Nt7FG/xRQx+R5Xb?=
 =?us-ascii?Q?ObwJSMOAvG7NzyZQOZNRJX0nsRQS/D4XFa8I5J7lG8KZhYaycs2NBJZoq8bx?=
 =?us-ascii?Q?DAuuP4/kno6Q/PIzyd3RUG7zcoOxuV7IeRgIAiFPiw+UlGJ25+obLlIVaWJi?=
 =?us-ascii?Q?f35artaJFYBvi2f/H2OJ+Gz4oVSCCFfd8fuX0NKXxT8Ua9o1uZoncTeiwVam?=
 =?us-ascii?Q?ei/1f9Y0rtKKOloqQs2Kk0ImNITTBAAN1AR72ofha8zmlWDFBopjpj3wN1kr?=
 =?us-ascii?Q?LPPIo5l7K+BEERS3cBl3RgeOtY6Ga4vefjXal4YgZfVisnPh8hktH+D7WK4B?=
 =?us-ascii?Q?iojwHF8dUyh30uWgtFAc+qooZ8Z7YqSadUI57dYs4EO/nuvo0z8GWTTATF1B?=
 =?us-ascii?Q?fGtefKQHKTznr0qr4ujnrgF8F9V+oIbcVEOi8Ov91KJX9OXVwNOFoEBoaFVR?=
 =?us-ascii?Q?nQDRn88LyYTJhLh3w1XKJwhxb9lRwLPQ7QRE9mniwCHZOHMphijSQK96LpJi?=
 =?us-ascii?Q?ZiqqT1M6n97d3DjY1TMYMD7TGVp2OK21DGN6oihPV0uHN+T48cc+R3qVVOC/?=
 =?us-ascii?Q?t6VQumUf8DXdUMLt+rncqeKNTJszlJMVKJT9iBwJR0/MEZNyrs/Fc44oLXQN?=
 =?us-ascii?Q?AxDr1Au0MsXSU/5Hf4MLii19Mf5uBjOIQd40DjAwWtcP3wSpXcHiaYay2oiF?=
 =?us-ascii?Q?0xuBrlP8qmwxO+sgx4vJhXB7f5ZRypIsBbXoCqon7ridM5jS2qHC7p3OP/W0?=
 =?us-ascii?Q?v7aHOHuZkQhoklTidhKQqn124EZRhHjdIlksA75nOqOPIlN3k3YcPBsnDa8V?=
 =?us-ascii?Q?1l9UVjO20R+3A5TGbMdjDhd07kCzijjQLyeCxUud5QiZotc6lOrDF7zie/Ja?=
 =?us-ascii?Q?5S5vg+MxK9KG8Q/zgbSp4x/1a7AaEHn/7fU3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zgBjTSTbZ2363zbFwvFd0aKu3MbM7cq8O1aGxa11QkoKoD2474eyuYOGf5bJ?=
 =?us-ascii?Q?t3PqVlEBTHFnSEkmf/rowrbDx4KU8q5CWm5L8/SDg1qWy4CtJ8P3BtdM/Lqv?=
 =?us-ascii?Q?HapjEgC281Cn6jCdSMRcEcmRhGtMF8txB3154XSbkGjPQIfRdYLxZgOq1lCy?=
 =?us-ascii?Q?lYoUImiu8bdoY2dqFZVjbMEINLHa1KxWAM7jnQJqW++HhlFBTZIwOeVyFIjG?=
 =?us-ascii?Q?0Qvly4anaB5h2rbwbVpVKrNo8pZb0WPU0V7o+jrGKWYXDuhk1gzw+sOeJKry?=
 =?us-ascii?Q?b+G2Hdzovj7PVL0B/VbT+Y2OYZQ9uwUo+v+aRZ8fjGx05MHgJMQ7v07MQixb?=
 =?us-ascii?Q?/dayQYRGed7uRuJb6/SCqJDr4i6i4QHh8/by8Bg5fqTvCXLHGTHLaoZAMhM7?=
 =?us-ascii?Q?GF8hwrhYVuCK8I/dTAo/SdKwJkuNpmy/PspVzWqdedX4cYk2k64G1N7cGxhy?=
 =?us-ascii?Q?Id2lnQ2F5VqC6tsqoNdbmk9xZlZ49+O3ZmDI506bidQExZipBn6UqQfsIY9Q?=
 =?us-ascii?Q?hblqml49JQbIALfYw2gTtiAM5lyKx5HM3Pgb+oeWGWnyRNYWDUi7FVicTDaW?=
 =?us-ascii?Q?qEoQniV2Vy7Zw2LD6lscDQfTGqDQcUwMTLwkeGbgB17nRsXFm3BYmsPs2203?=
 =?us-ascii?Q?93TseVRW9ONGqGj3rTpaBpf2A7aL5sYl/mQ7VlqrAAbWUVlT+KTEgg+xqyqF?=
 =?us-ascii?Q?HhCzFAD/JxQ/puL0yUF+N6nD7GA9JM7I90JUykLjsWnl78k9L1GV4NqhFoqw?=
 =?us-ascii?Q?ip6Gvki5m4Agn8GEtZBToGAkonKbXkPrIGd3QY99pizbPgEDlywOQNxjYKcB?=
 =?us-ascii?Q?N2YHwN1u1omVyaWD9936gkTwvtWQOcRf7Hg4OiCQ3o+kIbd3YDHP/5fAAG95?=
 =?us-ascii?Q?CbAKnrpSomW2s1L7960L6KnuwRpKM5KmBLAUvY5ZlM6yYfHJjsnOOlkmBACj?=
 =?us-ascii?Q?ifRRK09wyjIA1UiaIGQYNLGL24ecsglYygI72WaUBuuR9zaM9GUZGMjLdjb8?=
 =?us-ascii?Q?drc2Q7dQMzUhdvw7B5Sth/4Dt3IS+2w0pa8dCMQXVRbChg/KdG3FXv8yuTYa?=
 =?us-ascii?Q?c6zRc9aMEaZ2xOVLQUyVx8/jynO+aXyrwAm5iTTVK1fi0sMsO0/Ey3KEcMFy?=
 =?us-ascii?Q?xrQlj1j+hGk7fukBVJTaGX0Sg9zsY7sPTq34Os3+lTyvy/OOKgVQoRw2w14M?=
 =?us-ascii?Q?eOdmVPH9TyBPLHcNPMhy1O1VnTKKrLniU73YTsvwOyiiV7PjTR6Grr4+T8dq?=
 =?us-ascii?Q?WV/gv5ukHE5Y2CcQ9FmELOVyHtyAnG6sZQWYTHwubVPkUrR4VRqbe2o5uGlc?=
 =?us-ascii?Q?kyBMvucSfAtcuoAiFGC3kWrymYG8T1J3OlI5AxiAzL+WWXntZ1XBFyjrdABV?=
 =?us-ascii?Q?zmsFKl8SVhQjvV+1x5vVZJxD8Ks5ZyP/SZvqntdvCHrmbMavF2jLMyNX3CSp?=
 =?us-ascii?Q?myY16z4tNJb6wUbusNo2WimBUaHBiezhetcZS37qCMKuf7a4+tJFeBTin+Dq?=
 =?us-ascii?Q?da2gZv58VVn7gsbQwF37gZ21uTLTy3O355LH+aZ12v0riyLDhl/W+uPGUrto?=
 =?us-ascii?Q?WP2mYCfGgl+ScFv1QX0+g74Ao/O3T2ALwnF9jCnGcT82KGlYsRplj5wVUME1?=
 =?us-ascii?Q?qFghAzfMVWJw4jltFN/FrPOrnv7mv8A8hRzhfTOlhSSf51vN7Kbunbgwisyb?=
 =?us-ascii?Q?1/lxPMIdjpR4R5N6VrPokPMgxKvfDri5O1pBDAOrXAh2INYZAMvAqSQVEB2M?=
 =?us-ascii?Q?qOKbSIhg/OtKWzXmCpUZvKKUDXDHuBE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7c0176-e1ba-4e70-8f5b-08de47ae060e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:28.5653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7tJmQW7XfzijSNf8w+1y5DwJ6VNuH8uR4tBFJZmHECE9nXSNjcPCaYdxK1terKrWrGa+N4VJy2h1NqXwA6UYmnbm9LE34a1TW+z0srAM38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX2r0OfFlf08vq
 ctti04MENZL1mTf9yBXVP9o+IkBU5/oTGfU5+cUYLLXPFy+Te0ndLP+79mI2SL3LvmZEQJ8qkYK
 sF8gEeyJqC9UaoFVQouPA0ZUAEdW9nqPM9bLcoS0JBV3M/DdCzVWD/Y7BB8MB+bqyyJy0Pe3cRW
 lVpRUhQhT3MhGo9zzz6fNG5XlwBdWcY1xQHu8Ne9RLyjNgnWg+DykHMftT8S5rzUp4WZwo9rSbT
 WclmJfe0xx5XrEv0OGiIf+1R0huLnl+vwawfQ+vdjmD4l53easSBLfsIZBu6d7WCscNqHC5jrSr
 U0me88HCG7NquRZm7TkY4lP2BH03+AZGoIwgHK6kqMflSocFYCNg4ueAz0caSukdTSe4T4fjdYH
 H6iNkQnMJzZTR+bBYOPoZM+lB7WamE2odP/F8BPwiSIceRoM6kFudoMJX2LlJ3Rs7VtJrdb+ckt
 RycAmb+vL/7k618IR4g==
X-Proofpoint-GUID: 800-2NmaLLqTG4YEiKUJIG4FrmRhHcvI
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953debe cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KBKCkpsJIyHxgusp-7Kq5UfCj9FsxIqI
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
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228671

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building the Linux kernel with Rust support enabled (DISTRO_FEATURES += "rust-kernel"),
additional preparation steps are required for the kernel configuration phase.

The kernel Rust build system expects the Rust standard library sources to be
available under:

${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust

These sources are required by make rustavailable, which prepares the kernel
tree for Rust integration by validating the toolchain, generating bindings,
and setting up Rust-specific infrastructure needed for building Rust kernel
components and modules.

This change adds support for Rust-enabled kernel builds by:

-Staging the Rust standard library sources into the native sysroot when
 rust-kernel is enabled.

-Extending do_kernel_configme dependencies to include rust-native,
 clang-native, and bindgen-cli-native.

-Invoking make rustavailable during do_kernel_configme() to prepare the
 kernel build environment for Rust.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..dda235d4d0 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,8 +463,20 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		if [ ! -d ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust ]; then
+			mkdir -p ${STAGING_LIBDIR_NATIVE}/rustlib/src/
+			cp -r ${TMPDIR}/work-shared/rust ${STAGING_LIBDIR_NATIVE}/rustlib/src/.
+		fi
+	fi
+
 	do_kernel_metadata config
 
 	# translate the kconfig_mode into something that merge_config.sh
@@ -506,6 +518,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


