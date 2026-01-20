Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7863D2628E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13359.1768933904992443434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CgDDDRYF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K4O7O13564888
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=; b=
	CgDDDRYFzxnSrTS/v/iygFlwAT4+LOV3CGbIz2mULlEiIGfdHy2m0KddAa/z4KKz
	1KvhmTl1o30x1jid8LSIBKo95SRphzceQaA+TpBA9x6rnQRT7jN+0T18hKuLzLXi
	qjKj6oicWo9g26f5pH728hJfN5JIm6ij71rTHOwm9XOQFMXWZUr6RNHrSdqh+sWB
	qvWarj4Z2EPyFtoG9xx4Ag41zLxRnIRtoCqxJWxfmF3lcQ/0wx0aUrQ+1YKDHdyA
	QdQXFu7U5/YH9OCq9oqxQrRAmro8NrlwCnBbJCH8mgVTiycG8kuOrwU1YzIQE+s6
	OH5ls9fNLaU8LrS9CSYmNg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4kt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3sVa4ORgKc6qycOrr53V0QaWyU5JfremDsfd3MdxbrBijBfvY4HFh+RVI7k1XjHZ76lJlr2ET9uZcAjVdPp3MPoF+pmgBwx+Ezk2rMinIYsZdpvpqU7N5zznvO9vEOZ+qmX3pl7j7HMqiKkWDDTOFkDwQ0lPDJVVrSQ5y/qB0+YoatmAh4FyZvsli8agYEcNYYea0pfA1rSY57w8/GNxl20vE/QqQGNVUIvuDBOCO/UbS8SmnCJfl65LduRJnHO2bknH5UPp81y88kAUmLXRWwUDLjfwJqo+y5xsv+BUkSPFDQQyrKQ150CNuf1NeqBeIggJzHB7F3eTkxHpQaBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhALN2IRhVF/5FALzKdEDWTecbkpXaxwt3emM/ZEF6o=;
 b=S3Hp3RYJUUDAsjp6isjbTx/s4nNhXbKkZ+3ikBTzrNOENV00qczlDfRqZagFIJDhnM4I5wn0I1YHfJxXRtqqL6vXcNSwh1AC0c92p0wP/8FSkqgx/cZ76sdW9BhTzWaQz/300J/YPfN7wJ096qBR0H2mBuTd6RxGQLz+OtsdT8PUrsLKlW3Y9tV0GkqLrh9qDHSY5qXggJD6rL4brdTocwv7CD1ZTlfoNUR7u9HEWBcjyUsp+WyRu8bZjlsSFyAyW3WBWSd87q6G1IqHSvt+qsq1yNVX+SPdVnkC2ThYuJJfAMVEdvM0VRaie/p23sPyF32uBHF55b3rwOI11WrHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 18:31:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:41 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 15/16] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Tue, 20 Jan 2026 10:29:46 -0800
Message-ID: <20260120182947.857242-16-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 2847add1-0d11-4b9e-01f2-08de58522808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uBwG+aJeZkZ/9Wzfi8fTI+/9p0cuFcbwGMCLi9Hh4bbc9R85ASo9dAarAzzR?=
 =?us-ascii?Q?N2rJeQcxpEEMymnDKeHffd+pT9l5JF7oryz5mb+0qrzMPPnIU29w6gry9CBf?=
 =?us-ascii?Q?6OV0GtSEpk2Es5wCCoDriCc/0kgZQ3N2VinA96Cl5v8AITky4dwV6Dy9Rq5V?=
 =?us-ascii?Q?qH3oq0I7N2BRkUV5KgCoVxu2xqYdwUhllfh4xxYDYksi3AL8R4v+piUOAyO3?=
 =?us-ascii?Q?IBSywlZhvK+ASug8uodDbiUGtPvAGyiRJwwmqPxvSEqQg56snln8AmDji3mp?=
 =?us-ascii?Q?hBGrzTiJIpgvxPlpNOGM4lXPE4hiTLMmRUdETSx4jg4CO1XzGcjcea+5Psxl?=
 =?us-ascii?Q?FA2ZGX53a38phVcvkgYeSQwyOHghAXhkYF5qe30J5F2cFA+NHREnDR2JPSYL?=
 =?us-ascii?Q?BXS2sPIlr/PDGavD38k+71PJ/aO1I5sZeRRIqn5ojBtEAUQRGErpbYEkTw4q?=
 =?us-ascii?Q?Q27zzuOvTEK+irDfNSLD0L2ITABFeZT4hV7wDXOGR6AJI0L4QpJNddi4OSyW?=
 =?us-ascii?Q?u1scM8egvZ0KjqieKsaJT+9h/9kbgE30mvGFmnTrssVFCeHQy/91iQsaIga5?=
 =?us-ascii?Q?TXlAERrO1pAtCLjxfJzVXztZD+K0ofCNpa1mRMtgS5Msv8qMGbCsIPVww7xK?=
 =?us-ascii?Q?hp57bwzw3l0SEZnPbeDllCsnofnDtgTxUKqlNGkj8lHZoGwzthNwzgtMSlIB?=
 =?us-ascii?Q?Ytcp/Z2PovSX8b3KuSfAYDcudNhlW7LQAvYhfJQUpWucW9E29T0PFlDFwmLi?=
 =?us-ascii?Q?jKAZL+c/6fZcmBMiLm/0R7t5bSOtYrzbZEB3X4wtVLIbIBd7QPRZmomGna91?=
 =?us-ascii?Q?YCrYNlEpP2mwZLl2YVpGJD74RTjqlJqCiYGgVUxNFgLPrT22T1oUbhv4sAs/?=
 =?us-ascii?Q?swhssb1c6Yde6rhPn2bQuG5qF3riHaMwxPfAF3BpluixraxMt/FzXlEbEpji?=
 =?us-ascii?Q?V5u9CmtfYuepekeEyzBzoWbIHJEYawT/ZKIamn/SkwY1wHkAMlkNksLu5QE6?=
 =?us-ascii?Q?cOMcn6mLdeMZ07wGI9gIMp3bfz39uCv+liiZxl4r8MjOHrLSwIkDkJRVMSDv?=
 =?us-ascii?Q?T046+3jL2hMJd7oSg0nXZ/D69RA7q5atxVEHjyec6IB5a0KxR3LbrbOHmZcp?=
 =?us-ascii?Q?nAJEOQZr2IeFzlDxTQw7E6kiNquFLBnGFOOT9vBdXZHSO4RTNYiNOFYOs5qp?=
 =?us-ascii?Q?4hMQ7sULQs39pOK9lWiLePqXIKEmi/nrgBpVJJU7SM30bB7Yx8m5dVAq0Mnf?=
 =?us-ascii?Q?1ILvNQzTbowgHDwPKLTiDqfzeGRhVI04oJqBL1m+SyDUfzRBVQEVEZYO2lET?=
 =?us-ascii?Q?voOWaWdV8xjvY3KBK2FdboEH/gHlFhTIvHuZR62KEKBkV5OFu6rYWXatn/uB?=
 =?us-ascii?Q?VoMCA/D2eZGz80X5H+iPRsxz9pNcThMD76qjcQloMSfgoQK6XnGJCYV1en1G?=
 =?us-ascii?Q?fIAsTVlCWw62SIj7qDIFkoFjdeeWcGywtmlyBJUOZuBMlqCf3V8iKKUgX1cj?=
 =?us-ascii?Q?VPm70uk6sHb3T1gjDi4GaOAeGYLFZEjBM5MhUZVhBJW8eCWTaBmPyLd+E0ga?=
 =?us-ascii?Q?9IAgLwW5hZolViilX+tm72J5WDvz0GYBtz7nU3KY9JWE31KHDF/8p4yLMCxk?=
 =?us-ascii?Q?jolTuyUGz8u8WvfyI1rGWWc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1WMl8WoBqeTQkB4fuT8wx5/fJ+0CcTb5Rc01Xn4qv1VTgxcjaZ/EZV3I+6fx?=
 =?us-ascii?Q?/6nR7EyUJI+Z/fEWpl7R+U+s+2cj8CAcboPc/aHcCfKu7xuqo88VwYXctpOV?=
 =?us-ascii?Q?5v0hAvYOivGW9O9CVvr6iNjOyPhI79weHPt15dlKX1f0bwwmpdi4ZYXu04DE?=
 =?us-ascii?Q?Kw7S9dkvjqdeSatdBLWs93cvVq1dYEXg7MX2CIS/UO/G2MJzRBHWjnDCrUfu?=
 =?us-ascii?Q?QL5CIgFa2R5mjWR2s+sR1NjQobgAMi+g7an5UWHSrShZPFfS/DVM/6yF30BQ?=
 =?us-ascii?Q?IHUdpJgLSvkoLIWLy/TS5ao2xATbCNrqVwnRDr3yVwpvx2nAjC11mw7R+kL7?=
 =?us-ascii?Q?WFP1Zt7gjNqPz4TiYU6SBm5P7ff3nYr4j4AMUnCDNZ2M0+xhBdhzl+ua+9Jg?=
 =?us-ascii?Q?oluLmGM7gmU4JrGqfna13k6Ln5LGuG8px6CRqPtlo2dGo20bUjgsTIg30Qwt?=
 =?us-ascii?Q?yHgXKmDhpJHROSnZDrhiXnRaDnPf6V10PFDDRlnOfx5Yi0zX8U5mzuAmnIGO?=
 =?us-ascii?Q?vKvbr90rXN8WbmELvoXDW7vpvcTEOGnaVYjVFhbA/s7vCc7Am80X+vpk4z45?=
 =?us-ascii?Q?cX/oi7teDvmgZStguCHj819jasvfmLzX7iwhiZec/o2vocU+1xlN4I9j62iv?=
 =?us-ascii?Q?BCVCMhAzjMqF87axcQ/MypCkjvLDMe/7UPSkfKjt/OJY4YjDqonK2ZeGYINx?=
 =?us-ascii?Q?roVRaZPMvyD2wcm6bXVQmXdIlgzCOTd5yQFYInXQkXmD+0dDxdgZrzmDDcov?=
 =?us-ascii?Q?bYotQt7i0NOd3zrR1EGZGu33nQ+FbyriPBjSGnIOI2FpCMxpUKp/O7yOz64K?=
 =?us-ascii?Q?DatTZVcrD6K6cxj1r055oRhvHtQRd1OryQwdHpk0PZQF7pq8PtURq4LEPpXu?=
 =?us-ascii?Q?1HVrvX4kcqj3fIZ8d83eOitUpCCfuwAQIIMLKZH+KETEO5vmOABjrDMBXZfG?=
 =?us-ascii?Q?HEbivrTOzTZM3xdFGKM2fiRbKnzmW9OC9sQ2Olm2oocPFh/N1ZbjHWZtBt07?=
 =?us-ascii?Q?wxxyhPktItY4S3rNJPr7ErCmmnDaBZMnuI3d+2j/2BOs6V+QhX0SYFB6YRm9?=
 =?us-ascii?Q?bLXHvPQzOnLW/H6vCjjtgzIV+GOE9XpveTTp2on7XGKDsr2ay9aBxfEwW38l?=
 =?us-ascii?Q?gGDWKHI/zvvsrsCQbOnAG/SNWk8TlrlaDgKnz3bccTBtOpSZ1pUpi69a3+Qj?=
 =?us-ascii?Q?u5r6ra24CjQAx/Z+wItjtppE4SYdubKu3FHTdqK//JEV8PSNjy5xMaV0Yax6?=
 =?us-ascii?Q?n2gLuUi+bQFYh2LzPUsyIce2Uo4qfUsjafE9OPsJB6M4CvsUgQRk+/YPGfjL?=
 =?us-ascii?Q?HibYYvXzKLM9gxgDY3Yjt2TqHEqjlfJ1YXnR5EvaExk5LALWqNz4rfKXmKI/?=
 =?us-ascii?Q?Q2kP104v5G7e9KHBDv24oS3RRBTpV8BUajvjLbLPuNOJrWQ8hZrt4FTGW60g?=
 =?us-ascii?Q?tB1s1hLbpYUHbPCnPPwdWqrX9ZLbxxmMF0AvKDYylqAXhAHQo8LCvGJ1/k/Y?=
 =?us-ascii?Q?QQ5ygW5gtuPEmdSPTUXaD4YyNXsz69jSMFde8iTQa4DHuDkk6FEWd5SzyCqc?=
 =?us-ascii?Q?8y+tQauASsr9HZwEnG7L5zG16Yj3U9BdFBnP1CA9OfiH5s3CgtlwkAYqyEKK?=
 =?us-ascii?Q?hIMu6Q6XkfDtBIQG8uxCHCFrA8i2INbhlTHSbO3bXu0uo91vk7aYYwKbKvKQ?=
 =?us-ascii?Q?DuQ2tF0E6Q+k9oNcLqDd17IULI2SuAZSdEWeVSTpbcqJBEVlfZ4QXDxV7Ano?=
 =?us-ascii?Q?+B0LgGQ2WxLnqqssnAuoLJOXIBUZ56o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2847add1-0d11-4b9e-01f2-08de58522808
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:41.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYcunJq9zXuXEN0TaCFJGwB6eD1ZLlXDz5vMyVft7zhFYXm25ukR+EYs4uKBavkjnma2jHiYqRgurr89n0YywZK3/syl7cGvjgJ4DzL00Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: x6CZ3OwAZXaq9_KXCxe4MPevanIOdY3-
X-Proofpoint-ORIG-GUID: hon1XZqEacpPElew--E6zaH63sXUA31N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NSBTYWx0ZWRfX8s1uDmtMhyr+
 121/IsVzh+H+RsPIjtyPa0S9oLis+MeCJx1ZjdvfRsI8RIT3JI6W0JfZK1ysf7ALbTayhL3ekfX
 vHGSDyXOtBSDgoKYBhxYuv47wG03YgxReP/pYio602j96jx8RGPYqt1EmAcbCWC09eTrr6icypk
 1DfDr1LxGxFU83fk/lRGm/EFHA8ClEFOgHiOsgPujKR8ycNIDXdWFNfD50mKNdWaDRqnB7vVStX
 2AwZyqb484J/bvmYhVvbAWtNlaE4xp3546DvjqZriOqnrsSu2QFdxtTfJLWcZk8WBKufXOou0mI
 3x+TJnDBJ8mRTDjPGwSo9LAOSQTkaRQ+3xkVpwxz5Vnest3OI+MpyzHpKO8aqQcfl1A8jEj+AAg
 IJiS44vjo7Y3OtE6KdgbiGefDEZP4FSUa+ZPQzAEJ9NSByC0U8DXSdnSPmvtmJs/SdEz3rCGDSk
 qb82vZW4cY2kIHTPlrQ==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fca10 cx=c_pps
 a=jDwMdcx0fGNsu9pFyB9b3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=g_9fHU8KsmqnF3n0u6sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229781

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb              | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..d6b2178767 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,11 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', \
+                                             ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
+
-- 
2.49.0


