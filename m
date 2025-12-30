Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081A1E95A9A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64542.1767103318810699131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q9puSvZL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDAUnN3613429
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:01:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=; b=
	Q9puSvZL18z5E6G0T69Aoo/lTaOmmke2dtihqo7bGN1HSuuTCfNpVt42RQwoIrwc
	DLv5DL81EQxURHAOvPhLHipMr/TYsqIK3HrU0Pqrgkj1fkGE1JEV/xS5mgaW80jz
	zea9yx50m2asCPBPlJrhFWODCST3NTwExn5713pnaSJjo4dUshBr0h/EwzKL1KPU
	1jNbhV/Wf/aiQbftSC973AnAqLnQPEEPMoWuS+v/1VYp3GkytEHH6ozrE5JnSmPS
	qlvMfdodvj/LR5i58aX57YDnn5PE5CiLA7BvPZZ/gGQRhiOvBcWVqA9tHyBHjuZo
	HrYWCWainof0Tm+lCDidaQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukam2f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+RIE4kFic4Sz/ZzjGTc+eC8idzkfkizfswfW8wo2xzwy7lFSoTb3Ixjj32zNJNSdmKRX3chWZP7ApgtefbSaQS1H9JE588LzVvCtqm8LlU4YXSKmRXg/MIrb8JtJWRnt4cj7C0jyOPTkuJMi4Kk4szQaUthy+p+9Xb/8jIwCW8m1aG7v/auMPqRa3hdUdQyjDnfe8WSwG+g9x038zoysIy7FYAWWnlyqXaExttPpaxYQjaCUBkF3crKStMrT2sXO7U87DF2Qx7FlFgU95kqpfjMHkcS5MJYmtQTkrj0rm2APJD6PITRomHacjTG+82UXBH5KFAp9bKY2KpssnfxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywc68ekzT/geAq2Juo1DaBle/gz+6ClfRpHHvyeJnKw=;
 b=Z4Jl2KjOw8S8MJGM9wKtkFCpe/WSiWLrvIotKOWfIYP4JbJ930SEeWgSTAtHLMlDScCPBq7l80xrgWfTEzgGepfm18emYz1ScJjah9s5E3gb4I/lZpqDBS91giBFbUK2BLwG6sm53SpH3uYYAeFzouWIYpwiDS5g/swRzbTUCwjZALNuDNAQahB/y5niEDm4epf/ymGnNUGu98vH3anMPoJUfplnvAlbrWG1EA43CWYPfky/rQ/5AyVpYX4Adu3SIdu1LBcJ8YUoxDZkB+i5DVSyuEEsFHD5PyFgk39ewAThofq0jAukj5xdQpKo2bI+e77LXBfmMqCFleCwPRD35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:01:56 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:01:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 03/15] rust: install Rust library sources for 'make rustavailable' support
Date: Tue, 30 Dec 2025 05:57:22 -0800
Message-ID: <20251230135734.1973083-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
References: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d4164f-1b6d-4fd2-a253-08de47abfe08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QI/ar7UIQlenAP1h4kOKQQ8tQq/GXrUL2ugD8PoF+Ya3FuJh/zQd2GAZHT2Z?=
 =?us-ascii?Q?0aWCrmXfzzQUzTswDlBnZADSadDPkelmwc6G1XyiA6xP5QZbfjFtyBNJrStg?=
 =?us-ascii?Q?UPEEtUn8zKdf77vCgzPS5tKIdP6hRYyiCTQlpGEBZFUdbDWLwYpXepF5p5iM?=
 =?us-ascii?Q?urLPLv/v63Y6m6yD3YD8QtwJA7ptTtg2geY0ilROYVIXSH2SxGLdU7g6lBLq?=
 =?us-ascii?Q?sY2M6u19TO3hj0a3QL9ViulHFNFhtElbHB0dkCZfgmu8UkBZsjEiLB7pGujf?=
 =?us-ascii?Q?acwj0yUYYkQOUsD3XEpSFIgzcDBukBO9z4gsn7BiIeeDkTS+kX1DIyBz4Ldk?=
 =?us-ascii?Q?tLdSJv5uuq/3cOiBqhsuLn9ixQdywjkyoUy/BXbtbiGBiMly4uX+4stQB7wO?=
 =?us-ascii?Q?7bTuQ0CsAoBV29fClJ63yKc2KPZrRbhxsiHnX5de3rVayD8IsCzHz7K9pV9T?=
 =?us-ascii?Q?GDJZVvHZZ8ZwwPtEYUPWfrMz/j2poBfcU5AU5o6t2nTago3ouTjrVOWAWO6y?=
 =?us-ascii?Q?VItqXNK1tba7+EWxII0xB8UOy/8w/dmUYax8o5F13ce1pmFuaaVrH8RxHYRE?=
 =?us-ascii?Q?ZsuR19RlHSZ+frSgxh6V8waRJt1DtBoFwW+USHUmN1359Jf3UaA5JQH/zEd3?=
 =?us-ascii?Q?qC+kXzQLaA2/sXeyVcbyJyNYnRRwgUeGcjbeAGwj0Hvb9Ba1pJgnUhQgAGkC?=
 =?us-ascii?Q?ptH/37TM6Ry8PRppd+FPTN2WsnE8Rg0cseHy3jD8ZoBgPWC0/SKS99v6r97T?=
 =?us-ascii?Q?RbYwqAz2LrO1cLOMcDpdbiGT2oWgu6j+QT+gO7lmbfAXOAQZ15RxfG15367q?=
 =?us-ascii?Q?9wpgq/zslcsMjcjBufKoKgFa4dvkKaxOI6pw7GUdjs/ZVz5BFbu1WOLWz5D4?=
 =?us-ascii?Q?TDN6lGLvPPK70dCLMFgxTCWIsiaEgj14i1hn23JAVOvo22gjrlivIMo9Sqiq?=
 =?us-ascii?Q?O5iOJhXtujzkSTCfEx+y9Hxcl0IUeA4e5GdvGrufeRqn9VfSTchjRkVxnsSe?=
 =?us-ascii?Q?3WzrttUN4guX+RdZQWo1Ju45gJIeRyOnTtNTSoIKCzYL+wtMh/BJKFb5kjYO?=
 =?us-ascii?Q?5hfD9TNOcgPmUby6n6j+CLvZI8yM5g8ehbcWR+4vJSm1Bj4hhY99QMV2lcGo?=
 =?us-ascii?Q?oVMRMwpPfbTqCgaAonnkasEQuc9Dfdcjy5yzJFqf17BS2yq413V9sp+ROtDQ?=
 =?us-ascii?Q?rqXCCnCtSPw2KYnCEOjyGVblFXJtSw19ItYfZYQZni9DurcJXp6D6scij4+O?=
 =?us-ascii?Q?/VsygZE+4+tfW7YSk1w0v83JND2MYDM/MrlQpzq+Pwj9pirzFaGDkQk+1XEG?=
 =?us-ascii?Q?LrMQvJ9qQ2mDeII888O5TN5Y3QkyVWJk+a7YN1oCEfE3P+Z1mxxxpSoG7YwI?=
 =?us-ascii?Q?sX28WxiJDuY/VPTmuuemPOTmA6HWkIfiBBz/sREt5bS/3IdX1yab2IIoxzyx?=
 =?us-ascii?Q?fEtm8tlJ02Cvto/DSMijS5Y9o1b0bJlwbn84akIlsJSlECa7sA7XGpiPMICc?=
 =?us-ascii?Q?OEfL6SzAV2YuU166gc6rW1IbxvAZ+6EftP23?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B5jx0aRJOc05MIue+0G4QbXDHsUo8jAZ9yH5bGNIrDpRzalq70q8Izjq/UJa?=
 =?us-ascii?Q?q1rpgedg8fgXUinhlu7vwjHNPDKHAZPYJE9qMOC0UUxtezph34sjg4XverWd?=
 =?us-ascii?Q?i+xJUZwSu3qZOxAcUPEZUICFaiiO7yxlzD88m2WNUdesAsMP2Rd2l0SJ46NU?=
 =?us-ascii?Q?4xYi1TqRiNUFM1e7jqIVqINMsWUQl+fPFbR5Cmz8edQx+VYpLehslB8zTRIB?=
 =?us-ascii?Q?3LwGkZoGwShjAMKXrx1xJhmWsKVPf6snljgjvvJi1pa+yueUNkZ622uuRNP8?=
 =?us-ascii?Q?cOHBWcTxme9nqosnN7UARkEuQbZE2XpP2eGzKwlXCV1NuDUOW2b8YbiMojXU?=
 =?us-ascii?Q?yOz4qfxk5uafXqsKgAcByJHgH3nqnmbIOkPS+UssaUOYR0pO7qU/B7ob9Wrk?=
 =?us-ascii?Q?7ClMnTzGm3pgfCt76GgaQ1pnqcF3r4ZTz2A5NQuz6PJp64NM2nUB4gXQUz+r?=
 =?us-ascii?Q?t3vMZASLASkPEFctGxDbusqOnkCckOz2kyAqCcjXLcu7juL9lVK0RzTcHrUh?=
 =?us-ascii?Q?r5zKB0Zfl+mL4PDXU5kC0TCpsDLNYb9bkRsFXI0JZcHGkhe2U/W11u6KX9d2?=
 =?us-ascii?Q?yGTylELPL8i/E6VP5BzgzeVDlQQumD/q+kN1nGBeIABBcJtCXRuS+DVLqdFQ?=
 =?us-ascii?Q?LLNMS9PINFE8Tm2k1dVWyA3kikJ9p29fJzgJa4F8YDMm31g0YeUz0hvjq2hB?=
 =?us-ascii?Q?4pCoeqlNERsTSc1VGjgquqSCFaTihfS4EGcOe+TYgGAbFxo2oQrt9eYCVkWZ?=
 =?us-ascii?Q?C1NyF9rpR9G3PSdGpHBMAkeqhuTkbcsEkTRC0CKlc5/bVHUzR/rCm2ZXWOtc?=
 =?us-ascii?Q?eK7c3f7z3ZtbhmJC3VqqHaaETYYtkVngnp3rynqv1Uf2rEwyJGqO6tYNwy47?=
 =?us-ascii?Q?ZIJmGP4CNYf9hHzXWIYWCKWvVMfn2WcIA0D2KPQpnQJgIeU30pKwlJYT4hUK?=
 =?us-ascii?Q?5ydRoI6ZxgWr92lr+eye9Q434HooZoZl3ZR3XouAYL/bcgmpm8i4hFsrwIuu?=
 =?us-ascii?Q?1JMmLDbRWMgLG/dsblkq69rXbqfycMhh2fncYsEBZXJ+b6lxJCCxCWTNfbQM?=
 =?us-ascii?Q?2RJM+M6gtx1fK+4DJNAA/iQOuYcKZvGYgm3PthxBNwtWZDUpd4g86OpTQiJS?=
 =?us-ascii?Q?uzIxzwq13SdXcRs5K3tu+GsYwKWbV3mr9+7u+qQznErrKZmWzBBAJoz2Irpr?=
 =?us-ascii?Q?q1KYMQ9ph0PlQObQRshGgySCzLH3t7pYvwiRxp9IXopK4BXcat0ozLJUPLMQ?=
 =?us-ascii?Q?kfNId2XxrNKYNQKnWcNxg7M2Vy437pq+G7ngGEqYZv23k8vox4jRdjZeiEF/?=
 =?us-ascii?Q?n900YOktXTlSXgQsRoy55mpdlveYhys4XmODTC2HOICXXirFX4hfK4r218WV?=
 =?us-ascii?Q?zLGqB4mmaG9DpCRkMQNro6N9IeOt2mADWuNBca55NZCxmZnmgBWbYUeAywhF?=
 =?us-ascii?Q?IRLwz8wPIbh41BmJUNKSIZsGzFEq546QzDJukItiV/F63n/j9sYGs1/yU6Gc?=
 =?us-ascii?Q?fbWP1aU/v7iEZ/+YIQ4FS9HDMhd+EM7Dph5/1S1utWlxgwGHeWvb5f/SwUTY?=
 =?us-ascii?Q?U5HlT2vWcvLZoFyQP8xUystW8r6l68B16QZUZ+yrV1jvjyone5LLQ8usH4XW?=
 =?us-ascii?Q?kUfqu/2Jfm1j9Njkvt2wt9HCv7UmN1pT5W7bEGbsmAveRyTpnJ6u7OQnj6fR?=
 =?us-ascii?Q?ySO1rujGFyfzITG8dxgSTuAf2c5Mpn0O/Q1vLOUuHaAAbC5kJvUWUI2LUwdR?=
 =?us-ascii?Q?AWWGeRoLzFrqfKOiiD6WJxh8kx8Q5FY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d4164f-1b6d-4fd2-a253-08de47abfe08
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:01:56.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSSfK9KvsrBf/mbozakRNcU62Ib7JKItt50uXCPeB/vpiM6jnPtXLzGbsQtVdJ8qcqB3HWXsyT6xZrOOVyIp2o8CvFRZ/ZKEzyre2nUSyfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953db55 cx=c_pps
 a=p5SqRtR3VJW1kgksvcX22A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KEuQCu96zQzuzKkljhI994IYIf4gUYcT
X-Proofpoint-ORIG-GUID: vIptto0oLnFHT89TU1wk0oijhU88WgmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfX4lYia2Fhh8RO
 DEjplZpKya7lz5R/jKtpMfHATIKgOIfTQ8UyjLRc7yZbBxXd1KoeQZZGG1V3yeSB7TT1WSLj9uE
 oxVI79RTwgcWei9khP6LVfvy7xgzefOQGRysgtbO2g00jWvYknYyqw2IggwXuJvtsZBXRVxfm7Z
 DQ3Zj5T/PjyIG414h+HCg6dq7vl5eMaKg0dK+KabbIu1SWASozc+72B2IMtVGCamqqkvb0bvJA0
 B8unHdwpQz/s+lzJ3Xth7g2Oe+4YEtCNCdN1qMQNWgnhjhz+ivJoDw3ZQ9KThnIo7q57yjj21ce
 ncEDf/IVk3FhDtu/YtcBxZgRbdlynBHNrpPU0rVmAxM5i5OBaHPNqIbhcUM07s0lTZzJJcSCbuP
 aauBePdr33GS86BtCpKP3fkbArKNnd/fv/AEDF228Xyy9Ui9P9q/M3lte+1xislSB+K/zeAztne
 r1zgJlENtX01N9Gx4TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228663

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
index a25f65f674..7644ecf2d2 100644
--- a/meta/recipes-devtools/rust/rust_1.91.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


