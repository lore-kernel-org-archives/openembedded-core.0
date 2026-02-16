Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E167E7BDBB
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:10:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19182.1771247411740364454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=d4MVAyXP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6507c3d7b6=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7KtEL455565
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:10:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=r0looWze+/0E4EZWmSZVo4
	NS8FOcL3MqmTMDcEanW3o=; b=d4MVAyXPLBU9PON85HwFd+Th+PJTWupM1gD9s9
	rZR30pirWXaluFyk1JzJPuxNdsJJaTCIy26Go+1PK5YMRIJgeAs6Tjh7gnA97KnH
	sOw8XbGv8msMNmibYpV6G9t9XlwedAwbXngtTJp3OLoi0R1HOUnSTcam4PulKwAy
	FHHFRprhcDTxln5Tceo7Pf0n7TA2XPZgBkazQYSVQGe3m4PtyjQXzW2aKLRYJCdS
	M/3EM7P08IFMjbe0aU5RVWKi+ey0zqLWs2xX2jxGIK1Pwk95cDMQODxylxg26pDJ
	szPCasvSBMZyhyg/ZaV+C5EDv1Qnm/4C4fY5x2ThD5L1OQDA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4can72hjna-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysYfyEfv67mPfm3rX0rBDnhp5NOiyv8VzOneCt6upIok2r0v0wqT/PMkT7q8QuVtqfiTWE33RPZR3aMVSCht5TZn5rYYslgsLzmrFp1t4b4sHlxYViNmIoUkCFOyXs4Y3Dnp5RssjdjlTydlNkUHj8xdqxpae7z6vukH76UQEhshcQXRubv4mlW8lf0xbOp/HUD1QGtnkAsY5iEjk2JtJwRSmr+poCOtzzNgL/grchQXI9bQhU1wq0+WIz63Iv7YljHB6vU3XIHYz1YkgVoWfkp7LM033OCPZuO0UZin0Z9q9tx4sXp4keAFvkzGWCtgXMUH3rcP46omZ8xopJjgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0looWze+/0E4EZWmSZVo4NS8FOcL3MqmTMDcEanW3o=;
 b=FND8/vxtTRnCvYRbfN76SKbi2rmQqZk/y9o9HkcoYBjR06B6Qq4vQRccG4Z0sIvzsKyQJxk+Y+CrfNejq3O0FuQM8pY47KsbKg2QXGFOeSYbo5pXJCu0V+rLc4qA/MvZwqtYE56b16760yuqBdw1GpQFwAizQKLrJ3hy2wr4uEI5dGeHo/YPaN56lywJbayQ0dFt1OQ2U9ievStE2rVxZgpXtsXw0yz6E2Pb+s73dMOMIQ5joPq9S5cjMQlwJe3dfUXl2I9mFZlp3TWZ40JeITexolheGanAfKL9WjfeAM4lO9VNmdEbvsh9Vh57UC0PLWz79uhdkKJWGdnsCAdqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 16 Feb
 2026 13:10:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 13:10:06 +0000
Content-Type: multipart/alternative;
 boundary="------------UbxbkI86S3kJryJxe8Ei4LMh"
Message-ID: <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
Date: Mon, 16 Feb 2026 18:39:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add test
 for Linux Rust sample
To: Yoann Congal <yoann.congal@smile.fr>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, elmehdi.younes@smile.fr
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
 <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: cf086a39-d613-49d6-9811-08de6d5cb3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3JTa2FpWHpkT09paFRXK0RlV0FzL1QwUmRZMHI2RWtMRmFkTitNcGljei9S?=
 =?utf-8?B?ZDVodmVQVWt1dDhkYm1QQk5yeFlCZmljWi9SQ1ZFSE9sNVVRb3IzNkg4ekkz?=
 =?utf-8?B?UHFMbVdwMHozYytHZDZ1cVNCSEMyczAwMm4xWVM2bThvOHNjdXhLU2dCS3Fx?=
 =?utf-8?B?SFJibU5JTkJiSVdVQVlrWjJqZFVnOU41Z2xzU2EzekZ2MjNSZWVZTDVVSWxv?=
 =?utf-8?B?anp0Tyt2cGhicDJySFBNUUZoRk41N01HdDRTYXJjSGYvTmt2WmIzMWhmb3p3?=
 =?utf-8?B?TWt5VUlEUzIrKys0VUVaLzVsMFdNUG41eWJhUXVZaTUwL25iT01XSEpJRm9M?=
 =?utf-8?B?NFIwSlFZZmVnLzZ2U3NrclhKMUhZdUw2SFd2SHhNbVhjN096TGdpNGs5MDNv?=
 =?utf-8?B?K3dpRENRbDFlWG9XR1ZmOU5haEQwZXptNVBTVGoxMlc5azlDUmZ6STVCU3ow?=
 =?utf-8?B?M0NySGJJQzZkeWM4bGM2TGZGYnJlNmYxckFUOHN5b0U2QmhxN0Q4RE0waGFF?=
 =?utf-8?B?bkJMcS9jc2srNU1zeStJZlBFQk4zWTE0cllhY2F6SWRiSFVveFo2d3pTM2VC?=
 =?utf-8?B?THpqQ3pnK09Gdm1NZlp5VHhvTFlFQjZSNExXR1UwZWIwN0lqTGQxK0hSTjRs?=
 =?utf-8?B?ZDdDbFp4cXA0U21hS0w5N2x3VC9iWnRjOHB2UVFGelZFdDlMSUZKMXBPeHdJ?=
 =?utf-8?B?aFVySGl4QkRVVURiZGcxL3NrbDRLai9lODF5MEtRRytQa1R5c3dzL1luTkk1?=
 =?utf-8?B?OENEbXdzeUQyS2JkYjE0LzlVVzFCV2lBcmxLN25vdFQ0Q090VDVybGFycFhO?=
 =?utf-8?B?VmplZjJUM1haQUFJMFM5L2orYlRQS0pPaEZZcWNqRm0zU2xjY2lmUnlPc2la?=
 =?utf-8?B?bVRVTkFpcnVoTnlIaENFSEovdWRRM3FQY2VZZEowT3laT25Lb0RmQzdJQUds?=
 =?utf-8?B?UDViT0RibmxqK2ZyYURxc2FuT2Roc0pCUFptLy9jVm80ejB6U0laaVZrWDRR?=
 =?utf-8?B?djFEL0U4OS9aY2FaQUtRU0VWbk10bDFBRWNSNWxsaUlXNytITkxUMlBLZGgx?=
 =?utf-8?B?ak5aMGh4UEg2RTR3WnpnYVZQUnNZK2JpTG4xRlJPbVVUYjFCaTFTYTNFbkNF?=
 =?utf-8?B?QldJWHkwNDJpWHYvaVFtSDQzN095c09JRHJkcVZnNGtPK0RFTHAwU3ptN2pU?=
 =?utf-8?B?Qkx2S1hHN1BRdWNwRDBiTEtQUkp0aDY3bEhPQjMxZjV1VFVrc0RvdWNWWnFU?=
 =?utf-8?B?ZGw0SE13MW82Snd2cGhYZXBnYWhWVDdhcURIR1pNRmZyVTE3K1Y4em9zZEZk?=
 =?utf-8?B?MkEyN0VmV1ZJR1MrN25BRTdDY0VMOTlYOTIyZldsN0c2ekFLUjNmdlFMUG9i?=
 =?utf-8?B?N0EwVlI3anY2S0FXcmxUN1M4aFJSR2NQcHFkQUswQm5ubkE5Tm5kNkh0a0cx?=
 =?utf-8?B?dHFxSlVvVk44TzJVakh1bHhzWEQ3ZmprYXJSb0hzTmJ0L0grdnNNbS9aNDBO?=
 =?utf-8?B?WTRWb1N3S3FCMGpiRWZzTmZCQzRhcHVGbDc4OFdQVHIwQnd4QlV6TE1BNmZN?=
 =?utf-8?B?akRTYXI4QzVvZWt4N0lhc2lqa3J2c2FBMUszTHZGaTRsc21pWDVqeElYbnBj?=
 =?utf-8?B?MkxIbkxEMHM3U3hVSTNGT0lYd1NXOG5Ga1RhVFJyaU5JY2Q5K0tyZnNicDh2?=
 =?utf-8?B?Q2tUMDhTUnZpMFZ5S1lrTDZaa1paQnk1NSsyRDZlZGRYQWtNSEh3RDViY0hM?=
 =?utf-8?B?Q0xMWC9wb2JTakJqQWVsZW5YRko3QnhnZXYxVTJVNWJtcDUvM0RKVjVLcjlT?=
 =?utf-8?B?QytEQ1p6T0NiRVhSN05RdVhuR3JNcWJKN3pDcmxiUFhKMG1zc1g3ZlFteUFB?=
 =?utf-8?B?ZFBydStLaGFQODJJMDljZlB2enNLU3ZsUHc5bTBIRTBweGFNaG1ydU1xdElq?=
 =?utf-8?B?R3crS05Da0o0OGhYMlM5bElwVWhNczVTZUtmeExHcG5VVE02TWs3cjk2UFhz?=
 =?utf-8?B?TFdYcm4vY211Y3A1Y0tDbGhGZzRZUG1oWko3d2dDU1JtNXZGeEg5U0NEVElx?=
 =?utf-8?B?aDdoL3hHU0ViaTZOSmJLT25WTEp0Qmh4WlZ2ZkpEUEt1SnZNUHdldENQZUhy?=
 =?utf-8?Q?yvgc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3Fia1RrcWp1c2ZzMXRQQTNuT0ptNksza2szOFJmNnhzSzN1VlN0TGVtN0c1?=
 =?utf-8?B?VXFOaW9OWmxpbmN2SzY1OUE0SFF5bC80M3IzeVVKOXFlSnRtWkYxOFlEZ3dS?=
 =?utf-8?B?aGFwdE4zbDBONnF6Q01VdFBRL2xDVWQraXdrRXE2SDRzOXI5T2o1T1VMcXY1?=
 =?utf-8?B?Sm9zTWZXVkI5MDFnc1NJMFRCKzJjK3dtYzBTSXZrVmx3Q2hMclBTamlYVWVX?=
 =?utf-8?B?RkFXc3ZOWk8zTlNLVk9xcW9RWGU0NkxuVmErSGJQWm11S3gvcXdJU3NORW5Q?=
 =?utf-8?B?M2N1bndvL0YySjY5djh6MGhkREhwK202b1E1ZmNCRUdCdTU5ckpUMW96SXE1?=
 =?utf-8?B?U2JlZ3h6VmFqQytFaVJwQXF0QUVZa3czTXRVQytYbU90RjNFRWtobDcyeVJp?=
 =?utf-8?B?U1Bpc3VySVZTQm41cnBacTIrNTVZQ3FlL0U0Z2JWQ050Q1FTcGlyOWFsK0d2?=
 =?utf-8?B?Y3BHYmhxaC9XVUdOR1RYdjVHZnFkQmRxQkJTMmNjS0dDWW1LN2VFUEQvRk9T?=
 =?utf-8?B?ZXoxSUw0V0ZldzR2N3l2SDhqcFFZNG85MENvR3lhWWY0NTI1b3RmZ1Q5Z2VK?=
 =?utf-8?B?bXRMZW5mdUN4OGhlOWJJVmlWNFp4VmVSbVc2dEQxRjhOeitzRjNxUnN3cVlm?=
 =?utf-8?B?Yy8wNEthODBQdDNIc0ZMdUZTc1haZ0p6dmgxNTM0RXc2YVk5L0twdXBWcXBF?=
 =?utf-8?B?RmZKaXNqZUpKbVduOS9YNnA4WlJZaG51UlZ1ditoSlhBYVVuV2V6SHAxc1lr?=
 =?utf-8?B?aFR4b3hETGh2bDBPNUNsclJFaXJKWUZqdEFsTjRVQWt4OWljbVlBTHN5SEZR?=
 =?utf-8?B?YUlXZFovNFN5eDVYV0pRWm4wY0xpRkhhUkdRT09yVzQrRTlmNGZZT3FUSFFu?=
 =?utf-8?B?dDUxUnc0d2FtNUtaaDh2VktGeU9nRTFFMVN6WVdkbWVtMjFNbmtCZ3pMajgy?=
 =?utf-8?B?SWhhL05MdnN6ZmxnOG5XNWIrN0toTlI0WjRCQXBHdEtYWUtRbmJiRWhqekdt?=
 =?utf-8?B?MVkxZWpxM1VhNHd0bzdVemZITFFJV1ZPdnNvdERqUHRkVzNsdTNNRVhMU2Fj?=
 =?utf-8?B?MzJ2YzVXR1RxRzlHL2hVWTdvc0ZhTlFDZkhFM2psd3dTeUI2QVN0TnJIellv?=
 =?utf-8?B?NTFLcjVSTXZhT3dnQlY4dDExblNtQW8ySGtWcHF4U2h0enNUZlIzMWxEVVBM?=
 =?utf-8?B?dGgwWHRGZjIya0NUakZYYmZGVGl3QXhsV0ZUWU5idUlhdEtuSjVSb3ozZnRQ?=
 =?utf-8?B?RzI4akNVU2dDSjJsL0w5ZHJTNjRlSkZLZ1RjWitESnBsSEFTWU02dmdoWUt1?=
 =?utf-8?B?cmE2a1lMYngyVGt0RlMxWHN0eDN6NVdiaDd1VzdTSE9lMy9PMWM2emlINjRV?=
 =?utf-8?B?bGp0ME9waU9uelY5VnZGYVgyWWZCNWFUWitFMlNCR3BwTXprcEFVZC9jcFB4?=
 =?utf-8?B?MGl2Rmo1UTJsVHVBaHFOaWczU0FURVBmS1c1Y296dHBZeStwTklpaXNaOGhq?=
 =?utf-8?B?QWkxNXZFZFhhb3RIdEN1QWUyRW4zbUNSVC9LQzFYbWJtN0ZqaGhFNmorS1lH?=
 =?utf-8?B?TERkRkJ0QlByOHJVZkIxYjFXWklMWWdua0xGdWYxdjFTNmYxaEtaVUpRazRN?=
 =?utf-8?B?aXZYTldhVTJPeUtRTW9wSEY1Qk10RUg3NXhIRER0ZENlSUwyTnliUTc1SU5U?=
 =?utf-8?B?Q2tVN2FaUVoxWnZBV1hRNkVMa0VNM0FpQkFPVnNXSi9oNFZsTVAzZFJhamNm?=
 =?utf-8?B?cTdsdWtWN1l5cFdZNXozMXB2QzFhZFRvVFJGKzlRVzZYQ01pc2R2RGpZbHNn?=
 =?utf-8?B?MSttVFgrVE80UmNKamxpSjUxRlBBRDRrVUF6cGtUQTNoMmk2cXEveVBkb0ZE?=
 =?utf-8?B?V1VIU0xISGZsMlk2bURRc1hyZ2pVNHpDOXU4ZXJacDNhZ3Q1a0dlb2ZuSWpa?=
 =?utf-8?B?elEzWHVuWG1STDdYc0t3K3FCRFBZUlUxNXlVbk94NXhUM09hYzgrTHk0MkdS?=
 =?utf-8?B?OG9NMVpXM0ZwRUpnN290c1lPOTM0WUtmSm5JVHlqbVJySEVoN1dON2FRYklP?=
 =?utf-8?B?ZmVEVU5wcWU1SGs1MWhsNDIxYjZLaHQ1T2VxRTBCcjBEbDNXMzh3bk5DMXRT?=
 =?utf-8?B?QWwvUWUzMDQ3Nk1VbldpSDNrTC92dkhQUXlrbk1SeTA3NWRzcFVLWlNBT1ds?=
 =?utf-8?B?VFNOc01FL2I5bk5PVEdBb2JMaTRHMDVMZ3VKVENzSlV5SHNBOTFvVmNxajF2?=
 =?utf-8?B?UHdWemsyejQ4aDdKSHk5Smw4TEhsaElmY0FXRjZLQllnU1RqL0w3Wi92QUUz?=
 =?utf-8?B?L0VtcjhFc3NOeWdCc2xjT3VWcEhTUFJhaEhtcDNvSlVQak95VkRIV2UwcWlX?=
 =?utf-8?Q?UBCO/g8BI63frDUU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf086a39-d613-49d6-9811-08de6d5cb3f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:10:06.0676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqJpVMJaNn6m7r6PagWZvsCbPpJOw+BmeBA/bWLFryE8RSGtHAGjng3nOLGs/tp9vWXi0PJHYkmn3ATgZNUoik+ThSc7IwK177rrnpqkPQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExMSBTYWx0ZWRfX76qhpAAcV/IJ
 7AfVbl1dJd2pay7ZphMMa6krjMe93qNEEv+EZPfl8cSftqwkuK7idYqu91Rd8bZ/XgPh6XplyZ9
 +Z+LjRveBathSRNA3U4h0Zi5vFsk8x/E0MXiI9swpUt5D6vkmDBJFyqmOdp4cyUlqGKTDxmRjnv
 TPsWZ6nB2aMyICHpv2hsIrZUMdf7oq7K6C6pdBu7iCuUJQTGnikY0yaOgqUgBvU3dRckYkh0Wtx
 xuyUYZN+vohAWzdf9EIVn6bKA52e49zZQPtOCl47sZJ8eKiUMhuakul3Yg+W8gcA69q367f445g
 /8PyMo+K0LqHliI2QLFcffpJ4hfpdanJd8/R7Po7y/6R0OGNdQWnq/2GCuX9/iZxUTbRdvAHQlg
 ggHH2lPZfLLNIlM2FalI6RoCS6uPGzSc7T4Y6BC9xIZf+Ppk//zc9398S1ErVOkuM1Y/Ad01gtw
 zKMo2RsMbmgEroHXIcA==
X-Proofpoint-GUID: -8F8oXJMpEXPgC7t2X_Zj5J5inqqPJV6
X-Authority-Analysis: v=2.4 cv=S5LUAYsP c=1 sm=1 tr=0 ts=69931732 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=EPYH_FzKnyUI1ERl--EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=LVVdaqqDU9W9cF4QaU8A:9 a=hwHj5Pm0KoWxCzyu:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: veSaGK3w_5yQr39qOXlF6c_2hWNy_0je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231197

--------------UbxbkI86S3kJryJxe8Ei4LMh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61G7KtEL455565


On 2/15/2026 10:31 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sun Feb 15, 2026 at 2:40 PM CET, Mathieu Dubois-Briand wrote:
>> On Thu Feb 12, 2026 at 7:10 PM CET, Harish via lists.openembedded.org =
Sadineni wrote:
>>> From: Yoann Congal<yoann.congal@smile.fr>
>>>
>>> This new case tests that the rust_mininal sample inside the kernel so=
urce
>>> tree is buildable and works properly: check that the module can be
>>> loaded and that it prints correctly.
>>>
>>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>>> ---
>> Hi Harish, Yoann,
>>
>> It looks like this test is still a bit intermittent:
>>
>> 2026-02-15 09:27:44,140 - oe-selftest - INFO - runtime_test.RustKernel=
.test_kernel_rust_sample (subunit.RemotedTestCase)
>> 2026-02-15 09:27:44,142 - oe-selftest - INFO -  ... FAIL
>> ...
>> 2026-02-15 09:27:44,142 - oe-selftest - INFO - 11: 13/57 404/671 (87.9=
9s) (0 failed) (runtime_test.RustKernel.test_kernel_rust_sample)
>> 2026-02-15 09:27:44,142 - oe-selftest - INFO - testtools.testresult.re=
al._StringException: Traceback (most recent call last):
>>    File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/=
openembedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 506=
, in test_kernel_rust_sample
>>      self.assertEqual(status, 1, "Loading rust_minimal module failed!"=
)
>>      ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^
>>    File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqu=
al
>>      assertion_func(first, second, msg=3Dmsg)
>>      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>>    File "/usr/lib/python3.13/unittest/case.py", line 900, in _baseAsse=
rtEqual
>>      raise self.failureException(msg)
>> AssertionError: 0 !=3D 1 : Loading rust_minimal module failed!
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/331=
9
> This is oe-selftest-armhost on ubuntu2504-vk-arm1.
Hi Yoann, Mathieu,

I tried few builds locally, but not able to reproduce this.

On the autobuilder, We ran following builds which were completed=20
successfully on ubuntu2504-vk-arm1:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3326
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3331

Additionally, One of Mathieu's build also ran successfully on=20
oe-selftest-armhost ubuntu2504-vk-arm1:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323
<https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323>
 From what I can see, build 3319=20
<https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319>=
was=20
triggered from a-full/3219=20
<https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3219>=
:
However, when checking a-full/3219, it triggered build 3317=20
<https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3317>=
,=20
where the rust kernel selftest passed.

I can see few other builds were successful on oe-selftest-armhost with=20
this patch series. I=E2=80=99m not sure why the failure occurred in this =
case.
Mathieu, could you please try running a few additional builds to see if=20
it reproduces?

Thanks,
Harish

>
> Harish, do you have access to an ARM host to reproduce/debug this?
> (I have looked but the builddir for this particular run was already del=
eted)
>
> --
> Yoann Congal
> Smile ECS
>
--------------UbxbkI86S3kJryJxe8Ei4LMh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61G7KtEL455565

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/15/2026 10:31 PM, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DGFP3A56EZTR.1TWUE93WL575C@smil=
e.fr">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Sun Feb 15, 2026 at 2:40 PM CET, Mathieu Dubois-Briand wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Thu Feb 12, 2026 at 7:1=
0 PM CET, Harish via lists.openembedded.org Sadineni wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">From: Yoann Congal <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:yoann.congal@smile.fr">&lt;y=
oann.congal@smile.fr&gt;</a>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yoann.congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
Signed-off-by: Harish Sadineni <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&=
gt;</a>
---
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Harish, Yoann,

It looks like this test is still a bit intermittent:

2026-02-15 09:27:44,140 - oe-selftest - INFO - runtime_test.RustKernel.te=
st_kernel_rust_sample (subunit.RemotedTestCase)
2026-02-15 09:27:44,142 - oe-selftest - INFO -  ... FAIL
...
2026-02-15 09:27:44,142 - oe-selftest - INFO - 11: 13/57 404/671 (87.99s)=
 (0 failed) (runtime_test.RustKernel.test_kernel_rust_sample)
2026-02-15 09:27:44,142 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
  File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers=
/openembedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py&quot;, li=
ne 506, in test_kernel_rust_sample
    self.assertEqual(status, 1, &quot;Loading rust_minimal module failed!=
&quot;)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 907, in ass=
ertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File &quot;/usr/lib/python3.13/unittest/case.py&quot;, line 900, in _ba=
seAssertEqual
    raise self.failureException(msg)
AssertionError: 0 !=3D 1 : Loading rust_minimal module failed!

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3319">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3319</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
This is oe-selftest-armhost on ubuntu2504-vk-arm1.</pre>
    </blockquote>
    Hi Yoann, Mathieu,<br>
    <br>
    I tried few builds locally, but not able to reproduce this.<br>
    <br>
    On the autobuilder, We ran following builds which were completed
    successfully on ubuntu2504-vk-arm1:<br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/2=
3/builds/3326" class=3D"moz-txt-link-freetext">https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/23/builds/3326</a><br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/2=
3/builds/3331" class=3D"moz-txt-link-freetext">https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/23/builds/3331</a><br>
    <br>
    Additionally, One of Mathieu's build also ran successfully on
    oe-selftest-armhost ubuntu2504-vk-arm1:<br>
    <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/2=
3/builds/3323">https://autobuilder.yoctoproject.org/valkyrie/#/builders/2=
3/builds/3323<br>
    </a><br>
    From what I can see, build <a href=3D"https://autobuilder.yoctoprojec=
t.org/valkyrie/#/builders/23/builds/3319">3319
    </a>was triggered from <a href=3D"https://autobuilder.yoctoproject.or=
g/valkyrie/#/builders/29/builds/3219">a-full/3219</a>:<br>
    However, when checking a-full/3219, it triggered build <a href=3D"htt=
ps://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3317">331=
7</a>,
    where the rust kernel selftest passed.<br>
    <br>
    I can see few other builds were successful on oe-selftest-armhost
    with this patch series. I=E2=80=99m not sure why the failure occurred=
 in
    this case. <br>
    Mathieu, could you please try running a few additional builds to see
    if it reproduces?<br>
    <p>Thanks,<br>
      Harish<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:DGFP3A56EZTR.1TWUE93WL575C@smil=
e.fr">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Harish, do you have access to an ARM host to reproduce/debug this?
(I have looked but the builddir for this particular run was already delet=
ed)

--
Yoann Congal
Smile ECS

</pre>
    </blockquote>
  </body>
</html>

--------------UbxbkI86S3kJryJxe8Ei4LMh--

