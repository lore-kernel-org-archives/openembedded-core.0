Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CE3CF3976
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11807.1763570910713749807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OVMguE2y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJC6IXi318537
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mrn1AX1cSK5tut8vb9WUxfsTJuy9yznQ4f0DicrhY1w=; b=
	OVMguE2yksbyTGgLZsw+hXzURGm2wEIMx0zRP87Vidywc0gnZ5cRZ+GhnPRulcTg
	2VqKKR3/c/0TbQBztrSwPrmd9vSyDjQUSeGIweG2GgsuHc+hHjti6ez5EBQn0wc2
	5z1+Ogzi37oPIb9Xb3EcZfjupK8jc0JK8eD9s75YgNV1r6rW9T7Tc/FSolwPdeGi
	9imGcJi7tmkc12qxltrBJbOc2s1/mQkPKbHbE4DqW7D0KuIZPa3oEiGnQwFqayGA
	v5k3cqg6oE7rgrTN36c8fDlfEjGYjLXM5d95whXMmgnCuijrlcS7sHdw4Fb7ZjF1
	Xh6WPHM7whlrlcQW7KTqTg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-9
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyI+DfTm62/pAHbZjJpSCCAomPlLSeguAuqGRNuajQkD5gXAo+PTR3qjjmEN89gkOshGqMcJj2NZ2zUjrIGmfw3ZsrIAZW3Px4xjn/YEHtfX18uMa0CWyx6DbVdlo3SOetv9+5ABf9I7mxzNS7McZ5S0VeNnOrU1xC9ZPd58u89jS/uX9JdcaeWO/jYrxmMEK/b2A254U8rqyvGfMk+B2uFZvrxsNHkJmiBiBFsQTRHChZ5+5fNqinWtMfdAtgv2Vk1NCTJ7A8cvQJUabmBcdWCW+DaBqeG2HvbleuNWsvtP0mWy9YE45GznJbBFphFjp84vRjkUJxLSeFA+Gz7Rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrn1AX1cSK5tut8vb9WUxfsTJuy9yznQ4f0DicrhY1w=;
 b=j6LbpfOwsPqgUgiPMF2UfRiCXQwVjchFu2V7TegQvuu3vIQ5w+ZBmEfbnFwLn8N0MTOxfo6cZDarZIPigv7XvlFoM5v1wvT6tj41O/tZHkmZDDC11gTfAr6wLFC5e+w+CxxaMv9KFng8sXhdbDnnRkNRMwNWokqmyslC/jOS+f/rZI4Y8/Hq6csPSlUwmT+FrbmnE6XTIQo2spNA2rf9ZA34mKP5ZM2KhRCqp3ESKg5kbZHGXQ3vrz6h8MrU8haLFGX121oLmcgZKrPN+GSAIQnwc7RTOCcTE2nmSgvzTPX7T1NW+Jat40ShnRFTibg98IPHvMRldrlMy8ZWeQTl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 08/11] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Wed, 19 Nov 2025 08:48:00 -0800
Message-ID: <20251119164804.256364-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 704b39c1-7c3e-4d14-786a-08de278b7574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDFSbHk5RDZKRS9yUEdZRXdDU0tmVk5sWHFQN2ZENnM4YjBCbXBMVGNjbVBV?=
 =?utf-8?B?SVp6clhrdStIbnZNUDJzMXhNT2NBbVZEcUZzOHBjSlZEcTh0eCtPWlVoYkww?=
 =?utf-8?B?VGxGdW13VzZWdHhvR3VMbjlOL1l5NU80ZmR0NXdCcVNPWklCVTFadGJrMWo2?=
 =?utf-8?B?WVF0czRyNmQvL2pZcW9JaTZJNVR1VHhGSHNsOElDQ0d5OTBpYXdmM1Jyd3Zj?=
 =?utf-8?B?VWRhU21vQzJHMEpiRFRzRHh1ajd1U0I0Q2R3YzNqMkY2VXRkcXJYVTRCVC80?=
 =?utf-8?B?WlJMQmw2Nml2U2dYbG16RGVpS1Z3NmdvYUxyNTVTR0tXWUZtSHhEUkxtdGQ4?=
 =?utf-8?B?OHJFYlIybXNRbTRlZHRLM1BrN0J0aDZIRXMyaktVc1loUW4veEgxNzJrSzRL?=
 =?utf-8?B?Y2kyVHdWY0tTMW4wdFZEZFdldGsybUxBRVVVMDNJUUpRY01QaWE4UWplc29n?=
 =?utf-8?B?bmY2dlZZS05jWnA1bXJ6bUVZV1VJbVE4c0dkd3pUTFYxLy9KeWRhM1p3WjVX?=
 =?utf-8?B?cWZpRC8vTGhRQ08yT2hRcUVCZmc2YmFMd0R2VFprUEt1VHZpYWlnaExYNk9I?=
 =?utf-8?B?bzlBVG9qd081VFkzcXRqaEZ4TEQ2Y2EwR1VOcGRqZ214ZldxaHhQM2NLenZq?=
 =?utf-8?B?ZWt6ci9SWFcvdGpMdDN3MFdkRXA3cjF0OVpMNlkvQzBDSWUxaDQvc0dzUEQ2?=
 =?utf-8?B?d2JzbTlJNDdua0Nmc1BIMU5qOFpacmlhbGI2UTh4VmVaTDFvQVZZbnhVZ0tN?=
 =?utf-8?B?WHFaNGJqdTB4QUo0Mjg2aFQ2YmdJVjhsMWxCb3Z4Yjlpb0lSSzhvZ3VrUzZV?=
 =?utf-8?B?dU9mbFpoQ0dxTHJPckpTMVllRlpXcGt2Ri9RZUVyeGZ5cncrWmp0ZjNZdjZj?=
 =?utf-8?B?OXJMSEROWUxXa2hFdzU4dEVWWk4wU0hxYTZPTlpmQUxmbnBvT3JRcExQTFBH?=
 =?utf-8?B?bUtESzcxVjVBVG5GM1NxVzcvQ2ZQMVowbVM0dnZncFNHT0kwbVc1K25GQ2hw?=
 =?utf-8?B?emRveHd6d1k5ZTBXa0YxOTBtbXdOMTBWUHZoc2lnMTBxNUt4bUs1QzNJVGxw?=
 =?utf-8?B?eFhMMUZaQmxFQXJjazZZYzg0WGVRelVZUUxjb0JWRTI3bmNSMnViTk1UMnBG?=
 =?utf-8?B?Mis3ekNySkdXd0V0d0JoUmJBVjJWdGcxbVJLcFRER2k2bXVqL1B4SHZRZFUr?=
 =?utf-8?B?Z1dxUnN4L0xNZmZYUE5EWTVHdDc1ZjRMUDEzcWt2eTlTR21tUzJmdUhxRVVD?=
 =?utf-8?B?cWtxK0lVa2JkT3JoZnluendYU2NkcU1CWUxpSGtxM3F0c2pTWEFiVkFTRjNv?=
 =?utf-8?B?Y3ZQUU41WjhIZVpDdlBMN3h0NCt4Y0E0ZDJydGYxOEtHd1JxODJBUlBORlhH?=
 =?utf-8?B?cXRQT3dhRXA5NDhRRUJ4YlZFTE9UUEFtbFdxUXlJZXYwemNzak5ZTm1tM0hC?=
 =?utf-8?B?dnk0RS9DNkV5Sk14VnFPZWdFd3Z5Q3dLSzl2SU9vNUZCSEpvWFhtWXhkRnY2?=
 =?utf-8?B?Q1BDYzVOREFQSG5tNEo4NjlIMHJ4OW1VNTNzTE5GdG80eHYxbis5UmtIZXBM?=
 =?utf-8?B?aEhwT2xmZzhwc0N6TmNsREd2T0ViOGNMby9QVTcxanFRZ1VTYmIzdVVaRVpo?=
 =?utf-8?B?dEU1ZXp3VFpoanF4eldNNmhpK2lFU3E3bzkrVHFTaEU1eVBnT3hHZTNnQklG?=
 =?utf-8?B?Y1lMTXBTQy9CUlE1dDVHMzBBZndxTkFkVk9uelp1MUdqcW5tSis2SE9NaE5L?=
 =?utf-8?B?WGUyV0N6ZDZFY3pPZmpFVGgvZEkxNURZTGkwdzF5RnpmcVBYRkZpV2owdHR1?=
 =?utf-8?B?L2g3bWZMem5sTjVMMnNWRWhDQ0dOMnFLZEhKWjRjWXRTWUxqSFhmanB3dUhl?=
 =?utf-8?B?dlFwd2ZRWC83QmhHYVN0ekxUUW5LY0ZtUTFuL1NkTjhzVVZEeXBmRGhkNmor?=
 =?utf-8?B?aWx5YjBWaDFDbnF0TVVXY2d0L3lMcWxhU2lkUGFudGVKckJBU1lzY3lPK2RP?=
 =?utf-8?B?MHhzTDNqRENDK1d2RzNoZWk0aVh4SGhuNGw3RzFBeTJVR0tzY05nNWloVFRa?=
 =?utf-8?Q?FNkHDn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlJjTmpHT3VOUDhSNlBOT3R0eVh2RExIdXZFOEFONWNCODM4VjkwZ0tXUHhp?=
 =?utf-8?B?d1h3SmtnSlYrbCswalJjVGRCZGNqNzJiZzM0aEo5VHFwbWNVOCtNZWZKVmMw?=
 =?utf-8?B?dkZPUlpYVDNXeTZBMCtuU1JzYjhyMnRscXZ4SWJ5aUR5MXV5L1ZTZG1pblNC?=
 =?utf-8?B?MXBmSzJrTFBxU3o3TTJpRERTZGtndUpUYnNWbW9oSkpPcVA0aXRBdDNhTVFZ?=
 =?utf-8?B?L0Nla1YwbXZpV01pc3dDS3pQRU1uZVo2N0ZQc25GMGRrSmZvRDRRQXJpeTV2?=
 =?utf-8?B?c21MUUF4Y0NHenk4WGU2Yys4c1VVa016UGk4cnU2Zm90a2g0VlVwVWJZR2pl?=
 =?utf-8?B?aFNvaXJVOGFmU2dkQVlKUXhndGhrYUswUVVSeDl4NFczL2trVEdEb204eEZl?=
 =?utf-8?B?WXdCRmhkcGVOVXdtQ1B1MzIxNVFtUXVTR0l3NE1oQ1p6Y1kzRWpzQjFJWVVs?=
 =?utf-8?B?NjFKZGx0K0ZWVjJnQkxOdm9DWkxzNzNYYXNOUXlQNUxhUWc5U2NuNkoxazZB?=
 =?utf-8?B?ZjYxUkFxUGdlekJaa2NYT0ptRjVaM2d1TVNFWENsMXRiMVNaT1Ayc1hHbklU?=
 =?utf-8?B?SklGSE1DRmZJMno0amkwNEI2TGRBcVcyUWpnYWV1Ylp1Z1dpWVVmVm5rby83?=
 =?utf-8?B?NDBiSmViSDJpWXVoQ0RCWnFac1VpQnIzYzdWRlc4UU41eEhOVU5ZVzZ2UjFn?=
 =?utf-8?B?akFKbTVGNS9FaTlVeUhYQVcwTnRSNDRjb3ptS05YQVdZUEpvOHBNRE9EdkUy?=
 =?utf-8?B?OEdLeTQ3dGxrQXZ4YXYrdGovNE5iVVFXL01md21nSlJKTVVjR20xenpvSkRS?=
 =?utf-8?B?MVByY2Q5ZlRLbExoRmlYNXZoN3hRU3F5WVVRS25QOTFUNWZJbXBOWXVmSVR3?=
 =?utf-8?B?Y1pWVFFZTG8rUzBUQTFkenZMYk9DRWd5UWxLZHNYSUJEbi9kZGdUUHlXK2NT?=
 =?utf-8?B?MzVkek5hc0pIUVNSZHpkSSt4ZHZIaHkxWXdqT1RMVXYrWE9jeEVteHlvSzNW?=
 =?utf-8?B?L0MzNGpiT0Q4TnVaT3lQRVRJclZIL08waG9wYWpNbFRmbkpWdGZvMVl1WnlH?=
 =?utf-8?B?a0Vkd0ExZGJMbEhKRXBBMWFJL05ZYjlZYWV1cUZVbFlvR2FEQ2FPRzdvZ0d2?=
 =?utf-8?B?WEVrb1EzRXZ2U2tiT3FwM0NrcjBWMkJtRVBSSnFFM1RUVGZXWU1GUDJUQlRC?=
 =?utf-8?B?MUl3ZldrcjJhcHlHUnZzanlxa1hlamEwcnl3cTIzMkxwYmpFSVYyZVlBRWRE?=
 =?utf-8?B?VmIzU3poQ1Zld1RlL1ZSYVdiV2Q5NEN0Q0NXcFVIcG1QcnBiNHRJcHVHTmZQ?=
 =?utf-8?B?V005WGpIaG8vOXloNDVBNlR3Mnl2MFErTlRrQnhHUkhOV3loNDBYa2NhY1VF?=
 =?utf-8?B?M0liWlRJeEdOSHJxeEFvcW9VWlpZYSttcWp2K2hjYjB6dExteEt0Z096OEJB?=
 =?utf-8?B?Q1dNSUlGcHdEQTlVSHZVVGlqK285bUI2UFJWclNma3lvQ0JESlZpQUJGMWk3?=
 =?utf-8?B?dndqbXBPcXd5ckZLNER0SG5IbG0xYVZISlAxbDYyYTZhVjdGczJUUkdNR3gr?=
 =?utf-8?B?OUtzeVozSXh0c2dHWGxyWW10K3ZrNVlHZHNuYXRVZzJybFZjdzlvcEVkckFn?=
 =?utf-8?B?dDBhOVoydmRhclNnYy9qTElNZWUrWkdOSlV1SGJnYy9oWWJha1ZyTjRESm1I?=
 =?utf-8?B?YWwva2JBaDRXUHMrTFlSQ1puYUlDMkRhcDVGNTAvRWVudmdCMkFFbXZubXE5?=
 =?utf-8?B?R0YzNzF4elRWelMzbCtVMkhnLzk5SDl3cGxkeTJIM0IzTW1RbDZKM1JVTVFL?=
 =?utf-8?B?ekJ2cmJhNThETUEramRybmxLbVFybHBSOU5NalZDQXd0T3NpZ3czTi9hWUsv?=
 =?utf-8?B?cXNNWEVUVyt4c3Uwc2ZuQ1pYc003UWFtRmRxNSttRzJodmprQWFEZTBFUEtR?=
 =?utf-8?B?aVNNL2xVNVViWDFuK1lTTzVyUkFyZjN4WGM1M2o2RFBOMUZwRWg2bnJIZTlK?=
 =?utf-8?B?Y291bHdKRWFBdHFoVGVRUHY1U3lpYXZiZDE3cTVKaTVoZDJQSThyRXJjYldB?=
 =?utf-8?B?Z3RTV3Q2Tm5mUDJWTVc2QzJ5YmFkUDg3ZjM1eGZ0aE1RNi9HQUErNm4yL09a?=
 =?utf-8?B?bHVjcmVUVVEvTW52YmpUejlOTU55b0M4YUNTanZWdXRGai9CbmwyZ0FrbGlY?=
 =?utf-8?Q?1Sd0cWF7X2KeN3rYlm++qMo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704b39c1-7c3e-4d14-786a-08de278b7574
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:25.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et8wHG2gDfvOSI2S0xJlojPWra2Gqlk45cXPiWQARzFBljn7WLKCNjVbif1Fv+PpyMdJHdWcDwNceuE6SBtqjR+La6fIxJGpOQhxB0jouRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX8WGsdMTUfDpz
 HE/Ei8WZUpqW/Pp7m2mislY+jWG4YBlWYal03DmILIEDbG0vVvFT99gYtAUKhBKQ9bLqi6RDecs
 m4KRIE1jbqdnspndgp+nHP9BiTcopLtz+WaVYCZDMynr71DTbVfUek7+OoTHQc1KlOg/Xg+04MP
 ivPA9tzY7M9Aa8vcCTKs15WUI9S9s2Ha++NPuI8fkF5cvriM1aeHs5fLjf1mynf2qgO9ocVdahU
 CWl9o6JpcPWuJ5mmNfEkl8+E6plTRfBBJVEH4eQanzG14tYdbZ7JNUeFTb2PxEB3HUNavtKBf+k
 PZ4c08UX1XAx/qJeMFjV/K1gJhSI420Qb30tuKbovtb+0R7x3dFU4PEM9Em5Q7I9RaUw/CjJB4O
 4mjBhmaWLYBfnvoQ7zSixwpIK/9LWQ==
X-Proofpoint-GUID: 8G7uUtQ5Ijch0X50L2TnLB4Qitg3VPPV
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dd cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=TNbuoZVE6ZuB8b9Wv6kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jnm9RKFSjt1eH-Gw3OqGb_mTMBVr7pHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AJC6IXi318537
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226568

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after=C2=A0 enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
index dda235d4d0..c3e1137200 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
=20
+INHERIT:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inheri=
ted
 SRCTREECOVEREDTASKS +=3D "do_validate_branches do_kernel_configcheck do_=
kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?=3D "yes"
 KMETA_AUDIT_WERROR ?=3D ""
 KMETA_CONFIG_FEATURES ?=3D ""
=20
+RUST_DEBUG_REMAP =3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kern=
el', '--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=3D${TMPDIR}/work-shared=3D${TA=
RGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append =3D " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel', ' KRUSTFLAGS=3D"${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
--=20
2.49.0


