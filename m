Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7739EDF04D
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 06:48:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40179.1770878898391332897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 22:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Nt4AQYus;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503405392=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C5sIOv167085
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=j6Q3ULVvefXLikLFwW9fy2
	JEw8bECybuvJzZ37z/eHU=; b=Nt4AQYusL2HuG0PyC8h6tIWRO0f+g5MSkhnBZ5
	T5gaSnyRspdjfKy4LYvAl+NxPhpqA0e3/NCy2ce6ZMPzFU7jNLUNXGFnlqMaxwUN
	pw4dkhz5wJfgr6onJJwm9FC4K1JRt/ISJ/NQHSaL858dklXQgrRthcTpL8ycoVCs
	jLWIV189Wi7C4vB8vbie1+9XwZzoLFTABx1+piTMAHeUZ3iIhL0E4H64lUD5rgt/
	VJce9X6qUsirRrdc0Vif6BW60ubfaf0yEz1kWm0fT2P8W3H9o8V6JmsNghBhuagR
	RfKxPLaliG1ZbbY7YmT4ZtGoOI2F5o4WuVWl/GE2oegVuxsA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5dpb2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:48:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXiby/geuVTLUfyGx3kR11M7rcSwl0YZ4WaPXcE0PV5Pnr1yvydtnvvWTgt5mJk9mXFHvcIRFfp+mwCaB6Te4fhWNrT2KJCfyOdLJisvXDVllw4W+raW4VFKvcCdbV00grCyHa/tEGLRqEQDkJ3n3mVD7XDbkjWRLNivWHLurqbwmEgrhNeLEzEUEfF5zNf0cUqjmX80dWHhLk4VC24ekSEW0AVc69q8woS3YDGD2HdklJkmNTOYSlKtyxMho3ze9sccopEP1ABjkQvR8P2VG/Mj1PSTmGosRL7fhSAcXPMNsQWc1erwAUVdTrO0T4keY2ksd698a/uwsHjxUQ8Tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Q3ULVvefXLikLFwW9fy2JEw8bECybuvJzZ37z/eHU=;
 b=kZ8vKU1etC88PIFtu85CHs4UQ9qnybH4wwU1NsDHHCuaWo1MubPTfsZ+s9s7DcAPrx/sylobv9VPYVoyGbTBROkWKxubLViwKTUZ3PONXnYXwJAmiDAJEYS/BQRe1KlC5L63gIbPiISpRwmTmkCOB1KTBQA9Bjpj8UgIcYZldig6el6gopJQlRKouI+VmSYUQ0xQj1OoqEkbRWGoGE7soUze/wKpgQKoBzm+hbUs+4o4ZFMHB3sdVY1tJKm5ZeC7TWaBrDREFbvim08E6pSiWZl0fcY+c1GFe+5HLypyhL85EKE8qD3egVSgqPNuhJV1FNEynY4S2//0shogguS8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:48:13 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 06:48:13 +0000
Content-Type: multipart/alternative;
 boundary="------------1SBFdkYxyCiPLym0l0KfV5eo"
Message-ID: <74289f42-8f6c-435f-a97c-896557bed9b3@windriver.com>
Date: Thu, 12 Feb 2026 14:48:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260204020908.864912-1-kai.kang@windriver.com>
 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
 <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
 <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
 <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org>
 <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
 <450d9841bf6504e9f457b9b627006b9bdca25228.camel@linuxfoundation.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <450d9841bf6504e9f457b9b627006b9bdca25228.camel@linuxfoundation.org>
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To SN6PR11MB2589.namprd11.prod.outlook.com
 (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|DM4PR11MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: fe02af19-001a-49ad-05ad-08de6a02b156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGdjVE1zZ0hkdGh3UlZFQk5OemJTVFV3VXVUNWt5S3N0bWVGWlB4VTllY29Y?=
 =?utf-8?B?cVdQRlhrcFJOWHlkeDkvclNFT1ZHL0NFM3YrWHRXdjFLNWVSZG1EakJ6MXNV?=
 =?utf-8?B?VXBhNmMrbCt6ekgwVTBEMDdkYXUyOEZURHJlQ1hOaytNamRrcVZUbml5VFY1?=
 =?utf-8?B?dm5rWGpka09tVDcrQnZvU0NkYWNuZWpSQlFPVloxSjZOVUN6NDdjRWxBRGRa?=
 =?utf-8?B?QlhiRnZpNlk1U2QxRXZOamtDaU8wK25ZcFRjbzFhNXI1cWZYdFgwZVJzUVcv?=
 =?utf-8?B?T3RNRC9rUy9vUXV5S1JMOUlKcm5nSTlLU3Z5aFBQbjJXd3o3YW9uS2xCM1ZM?=
 =?utf-8?B?Z2ZLR084UEJaYmhJb2pQSGFWSVhRQ29EclNFd0NTYWZ1L1UyTk44eHBMMEwy?=
 =?utf-8?B?MEw5WWp5UmozZCs1aDhRSUZZaS9xWStJT2ZGbHVIVkFHUzQrSjZvcy9iWCtV?=
 =?utf-8?B?ZmNyc0dRMDc3dXJ6L1Y5RnhyWm04Y2g1WjFjY1lpY0luZ2I0VFdqY2dydlFL?=
 =?utf-8?B?ME81ekNWaVJnd1hYZU5yUTZCOEJ0M3hHY1ZoQWk1bENlZm82UWVQUFpleERL?=
 =?utf-8?B?aEFoODNvUVdld2IvMjRDcVY0emRqT1NLTUo5eUg4Q0ZETGhNTEJici91ekJC?=
 =?utf-8?B?RWN5UEJEYW4wdi8yTktEbTZBK0VZd3JEM05qVnN3aGZjNXFTemxBTzBiekFv?=
 =?utf-8?B?T0JzbkZRVkhqSHRadndMYnNLdE0rK21YeFVKNUt2MlNBMFNTb2s2ejFTRzZn?=
 =?utf-8?B?YVdJYmpiNzFYUThTWGlGendqS3hOS0wwRlJOa1FETFFmZk9MR2krUVpwQXV6?=
 =?utf-8?B?enRHdkZjRUZGRXBqb3drMG9nSlBqaWx1bmlDTDNUMUpFYlg5Z05SMTdHR0lU?=
 =?utf-8?B?OUhvTUdoa2RSRHhiUVFueTVVT25leXlpdHNwcUVuOVk2d21YcE82TUM0WlpK?=
 =?utf-8?B?RG5DSU9KVzdzbWVvOHdVaWYwMWV0WmJZNzU3SUdnNTgvM2kwZ2ZQYTVscHZ6?=
 =?utf-8?B?QjZ4ZlhJdk5SOGF0UFlqdHdab050dWxnd00ySy9QSnhPZW54ZGdWWEZBdHJJ?=
 =?utf-8?B?dVgzSXVzb1ViUVZrRFVzY09DeFZUZC80bXdrdDJyUkhhbUJUVXgvVXlVSjUv?=
 =?utf-8?B?U3h2ZGV1bGpHbkdrb1FZVGZSZGx4SUs2M09iSXVTckZxWWJ5U2ZxMTlhTUhr?=
 =?utf-8?B?d2l4bXg4ZU1uTmxoMms5ampUa0sxZ2ZycCt1YktuZWdncEFsRVZuU3AxSlRL?=
 =?utf-8?B?Tk5LdFNGaHl1TmhkczVuT3N2TlhMb21URjROVWcveitKODE4Q2NKTEpsL28r?=
 =?utf-8?B?MXJXYjBEUFBuOVdMa1M4aDh5cHpFU1Bwd1ZVLzRHT3FnTURIN1diRkFUamE0?=
 =?utf-8?B?UnZlV1Q5VEszRTE5WHR5alhLRU8rVEdHUU1ocmE0ek5vRnJwaGtMUmViblZV?=
 =?utf-8?B?N0hCMFNQSktveXgzcUpoWHdGejlEVU15MVZ3NXN4akk2c0NWaFpuYndFTmRL?=
 =?utf-8?B?bEtQTHhWUVMzcUdzbXhMb1VwSjlCVVpLTjN1OUpRR1NIWnlnVzFsWmZVVFY2?=
 =?utf-8?B?YUJkT2l0ZEVRWnZreFpQbXVyNnJ2NEVCNVpXUWVTN1F3Q3BRVmR5WUlTSnBQ?=
 =?utf-8?B?aWZoZFRjSTF2cVVRbUwvayt3RzVTaENYSklDdDlxbm52M1QreG5ZM2orMTRj?=
 =?utf-8?B?Q0dvbWNsTEU3WEVkRUh2Q3pWbGIvMzI0Zld3dk04Q2VEWnZVbzMyeUtPS1Yz?=
 =?utf-8?B?UWErZTN5aEtTaTRZWG54Nm5xRUpna0RuWVRDQnpjM2FIN3VhY1d3dWFmT2l6?=
 =?utf-8?B?NC8vN0Y2YUVpTTRrRkxDOTQyK0d0S2YwVkdCYTRtNjlXc3l0eEpIdU9TU0pQ?=
 =?utf-8?B?MTlNSnZkaGd0ZnhJRlg3aEt3QUhEQ29RRU5vQ0k1SXNsOEl0UnJLM0wxaGFu?=
 =?utf-8?B?cW05UGhaeG50VEpJKzdrbW9vSUVobnNpdys1WFF0RlA5NkFMZzRFWGJETjNp?=
 =?utf-8?B?MWs5TWZUS25zREpYOXJKZzNnU2Vua0d5WHFiZFROQ3JFMnIrekV6cEdzUVJW?=
 =?utf-8?B?RHdwb2FwWHVJUGhmOEhnaVZmTXdCQjBQYmJWQVdPTE5SRy9EM3NXQmU4S1VK?=
 =?utf-8?Q?lCe4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHNZWHg0UEtpanVMVEllamwvQlN0WnhUN01vaXZ5S2Z0a2xEVE85a2J2Y3pt?=
 =?utf-8?B?M1FsaDh4d2M1RTM1THRpMUQ1cDVTaVQwV1c3S01Ub3JxSHR3TUN5SzU3Zk56?=
 =?utf-8?B?bDRmS3lIUGd1NFAxSUs0aE9KWEVGU2VpRS92WjAxd09LVXdQRjBoQWtUQldP?=
 =?utf-8?B?M2NjOXdFeTJ3dkJQalZNTy80K3FtK1pXdEh0RUkwaWZEOGJDTTVqVzZaNlgy?=
 =?utf-8?B?VVRKUVZOU3ZkSFBJaTBCYms5a0VUdFpsd3djL0hBbGVOa244ckRSWTNaWnFP?=
 =?utf-8?B?aVl3emdPbWFRYmtvNnF2by81SVhPcjdSVGl5eWpWNWdZRjBScFppNUZDaVFH?=
 =?utf-8?B?aHd1OTZNTGFyYkpkK1cxUmxKMmdERFZkOXZMRjZRbS9EbFR4bHU1TjNQVDl6?=
 =?utf-8?B?WnhPNkpJRm1KQVJsRU8rbk1ZeGZ5VkRMNkxZZERFc1d0MFJVT0p3UVhpQzZL?=
 =?utf-8?B?Y3NiRUh1dWhFcUVpVWdzNXVKVm5naG9sN0JWK2U1R2xiUGEwSVBTTHVNVFE3?=
 =?utf-8?B?RktTWGE1RDNmeGc1MUhYVkkwU1VBajdjSkpEb2s5Q1hxVno4Y09OZENTR1I5?=
 =?utf-8?B?OWxYTytyRUh2WkFiSWQ2YlVUajRLYjRCQzhmUmNyNlBoUWJjd0t2S1N0bGdj?=
 =?utf-8?B?RWFMMGRpdDdobnFEZkdPTDJ0WEZ1NUJ3S3dwMmFaQWgzam9hZHFXTmFMa2Z5?=
 =?utf-8?B?LzI5N21SNlcwS2NOci9aY1laU3l1RGU0OWgzMllJMUF4RHhCdE5KUTZkbUJT?=
 =?utf-8?B?ZG1ERFJ5dExjL2xIZklFU1NkcUY4SWZVUWtMeU1kSXBSZ3JxRGp5eHhPNlgx?=
 =?utf-8?B?c3BrdUpZaE8rTWFmdi9leG9veVZFRE01WHVWekYzL2xBWVozdm5lZXJZRVdM?=
 =?utf-8?B?SVBzekNRTUV2V2lCenBvc3E2bnliV1VuTFh2RXBOaHlIQktEYndnZm5keW43?=
 =?utf-8?B?NzErSEZSTnZkK1JGTE9KV0NLZEJLU2ZEcitwYUhGUkJrdDhHVUtRVVB5TldR?=
 =?utf-8?B?VUttSFNHcHRtUXpSb2JtMEdpQnBGa3M3VFo3OHhTVllvT29ZNmwxUzUwUDl5?=
 =?utf-8?B?RDYzRmZsbEdSM3YzRUpoUGZISGNjMW96WXFJTTk4YWhQRHdMVTY0OE4yODVG?=
 =?utf-8?B?SElIbzVLWitCcnJGN3Y4aTZ4Mkl5MUt6T3lBQ2xRaTNPTGVUN1VLeVB6cVNt?=
 =?utf-8?B?amRrUS9VK0pBaWdoaHZrVzJOVGFTVzVwMk5XQnpjL1J1NlJSOUJHU21tWHNH?=
 =?utf-8?B?VTcrV3c0T1BCVmlnZkJyTkRGQnNpd3UyMitHWW5qQ3BSWm5DRUl4eUdyOGJz?=
 =?utf-8?B?WVJVRnpjRzF1VWtoWnV0WlJ1V3RuVWtyN1ZhYStPSVJ3RjlFU2JWaFVsL0J5?=
 =?utf-8?B?QlZoaHNWelBvT2lsMDdFdTFQZXBxODRqamxvSVFhQnljMEUzZmgrdlpZTC9p?=
 =?utf-8?B?azA0THpZV0pXWjBDc3F0U2VpWmdaQVVkZUdZNkxxeXZXTTN5bDk5V3RMNkJq?=
 =?utf-8?B?Y3gzdGNHQjM2NkVBMGNKeU1xMGoxNGZOSU5pNmJCeitwVUQ4aFJOWEpBYUEx?=
 =?utf-8?B?dXo0WnNoMFNjaE5sUVNCSk0ySnZhMXZnVm9iLzdGdFY3K3BZUWdIZk5nangx?=
 =?utf-8?B?TUZtemZRWVNCSEFlQ3NwY1FtYjRnZnA4Z2p3aXB6MkJoTEdpTFhOTEoyTEVG?=
 =?utf-8?B?MjRoVTZ0SWt0U0FjREFWQ0dvNDlERG9yNmRDb29od0V4c0IxdDRWY2FHbFJB?=
 =?utf-8?B?dkFtYlNmRXJxakZ4dFVSUkxEUjc5eU9heDhiOTFqQ0M5bDNOWkNWWjBER25n?=
 =?utf-8?B?d240UnJIbGdIa1FTR3NVcFg4V0lwWUxiWENBZDlqRFpZb3J6SmUwYmRZcU5T?=
 =?utf-8?B?ejR6Yk94b2c2a09CMmVrdlV2TUFPR3BhTEVSYUNzNVNScVBzbFd0RVlxMHQ5?=
 =?utf-8?B?L1ZOSDRaL3RwUlp3eWVETGJsSmNwTjhJRDF4a0Z4aEdOb1BQOE03R0t4eHlQ?=
 =?utf-8?B?OFlDYVdvaEpLb3hWNXZlLytmSVAranNud0NQY1ZRK1FxRTIyck1Fcm1KRUtB?=
 =?utf-8?B?VXF0S3B3K2RGdTQvSTFBUUV5TUxmc2IrV0JiOU13VVZjUTdBNkRnYnlLakoz?=
 =?utf-8?B?VEd5RUFuWkpTUm03Y0RYeHFJM2Myd3JvaXpXclVzMlY1UkY4M1hPVUlFSzRI?=
 =?utf-8?B?WVArbFdFcytyclpzS3g4NjZQaGgxMmtvdmFGL3pyWHJtSGhsYVZ4c2o5WDJh?=
 =?utf-8?B?T1M0VzIxNGZCeTBKKzFVMDZWTWplOEdvRFU1MHVscmhuTVR6YmlTUkE4a09M?=
 =?utf-8?B?M0RsZnNJYllvMll2T3luV0VmUU5LTSt0QjJVOFBpRXRaK09MV3grdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe02af19-001a-49ad-05ad-08de6a02b156
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:48:13.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiqBDEN7fYIYZskk9HoKdt94EsKVDH4aYn0KNAGuezXYtY8qqcknhy2aD1vUxrv/wZLpwKBAhDpMIg2Mnr0W9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698d77b0 cx=c_pps
 a=M0SbpEVZuc+hi5PQWquR3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=zsUJ72wGSPEKhyDj8VEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=6ACrV89tdyRGO2TIGtQA:9
 a=3ioy3u3bzekJP8ES:21 a=_W_S_7VecoQA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA0OCBTYWx0ZWRfX0KAKytzFtiRx
 b8Dk+f1BlXQuari0j28+M5ZJ5YOTg+huiJXqzzOKd+IuZ/WqrV128ctpTsEP9HSgGon7KFjl7fG
 VoD96Ux0be90Cr3JDo5G1r8KCx1KiOOQs9OFDxU3rbVSfajmKE7UGY04gThqBAZo6QeBuwU6Ql3
 2cYfP4K/j+5amY0oHEkq7mAjw6qxfPhGdWov5ar5/ycoIR0a2AzPMry8VrzmJwzwmV5pQ10f98p
 jnLvkZY3Qb5Tu36Mkxvqh7BfBIZDHbBaHwFPF7ib724mrUF03beZ5LE4L4x03yfqNF9jIPMIy2D
 Co0LY2oF6502k/+xEkXORXkyExiYEtQ+mfw1ZK6TPu72CArXzhVdEFqsU/u+rYPIr2wT1TA0SV0
 IH/NnfXI6Ny3gB/uH495hIDAs98J2iBpkyBxK55oV3Qyt4tflZv0rpb7z6lcZBl4j/jgbE/oWB0
 uA21iZXuKd9TFVrHYAg==
X-Proofpoint-GUID: uEEgFVm27ZCM8uuGuu6zI1G8PO9QbgV3
X-Proofpoint-ORIG-GUID: c7GhTU06G8OFvgcpVuWcTcF8xIkWyv5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231014

--------------1SBFdkYxyCiPLym0l0KfV5eo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61C5sIOv167085

On 2/5/26 22:49, Richard Purdie wrote:
> On Thu, 2026-02-05 at 17:08 +0800, Kai wrote:
>>  =C2=A0On 2/4/26 23:53, Richard Purdie wrote:
>>  =C2=A0I agree the warn conditional isn't quite right. I think it shou=
ld
>>> be:
>>>
>>> if [ CONFIG_MODULES not set in config ];
>>>  =C2=A0=C2=A0=C2=A0=C2=A0bberror Broken config, CONFIG_MODULES not se=
t
>>>  =C2=A0=C2=A0=C2=A0=C2=A0exit 1
>>> fi
>>>
>>> so it is basically a sanity test that the config is valid.
>>>
>>> I'm a bit worried about what I'm missing though :/
>>>  =20
>>  =C2=A0The original problem is kernel config_modules is disabled, then
>> external modules such as lttng-modules can't be built.
>>  =20
>> Recipe lttng-tools RRECOMMENDS on lttng-modules. If install lttng-
>> tools into image, it fails to build lttng-modules.
>>  =20
>> Kernel config=C2=A0CONFIG_MODULES couldn't be checked whether enabled =
or
>> disabled after bitbake parse. Then there is no
>> chance to remove lttng-module from the dependencies. That why I check
>> the config during the do_compile and do_install
>> with bbnote and generate empty rpm package.
> That is a bit different to the problem I thought this was addressing (I
> was coming from the rust patches angle).
>
> In that case we probably need to have something like "kernel-modules"
> in KERNEL_FEATURES and we check in the lttng-tools recipes if kernel-
> modules are in KERNEL_FEATURES. The kernel itself can then error if the
> feature is selected but not configured and lttng-modules can fail to
> parse with an error if it isn't set?
I sent a patch to preset LTTNGMODULES with '?=3D'. Then it could be=20
overridden from conf files to clear it. It should be the one who disable=20
kernel modules support to break the dependency betweenlttng-modules and=20
lttng-tools.

Thanks, Kai

>
> lttng-tools is not useful without the module support.
>
> Cheers,
>
> Richard
>
>
>
>

--=20
Kai Kang
Wind River Linux

--------------1SBFdkYxyCiPLym0l0KfV5eo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/5/26 22:49, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:450d9841bf6504e9f457b9b627006b9bdca25228.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Thu, 2026-02-05 at 17:08 +0800, Kai wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp;On 2/4/26 23:53, Richard Purdie wrote:
&nbsp;I agree the warn conditional isn't quite right. I think it should
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">be:

if [ CONFIG_MODULES not set in config ];
&nbsp;&nbsp;&nbsp;&nbsp;bberror Broken config, CONFIG_MODULES not set
&nbsp;&nbsp;&nbsp;&nbsp;exit 1
fi

so it is basically a sanity test that the config is valid.

I'm a bit worried about what I'm missing though :/
&nbsp;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">&nbsp;The original problem is kernel config_modules is disabled, then
external modules such as lttng-modules can't be built.
&nbsp;
Recipe lttng-tools RRECOMMENDS on lttng-modules. If install lttng-
tools into image, it fails to build lttng-modules.
&nbsp;
Kernel config&nbsp;CONFIG_MODULES couldn't be checked whether enabled or
disabled after bitbake parse. Then there is no
chance to remove lttng-module from the dependencies. That why I check
the config during the do_compile and do_install
with bbnote and generate empty rpm package.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That is a bit different to the problem I thought this was addressing (I
was coming from the rust patches angle).

In that case we probably need to have something like &quot;kernel-modules&quot;
in KERNEL_FEATURES and we check in the lttng-tools recipes if kernel-
modules are in KERNEL_FEATURES. The kernel itself can then error if the
feature is selected but not configured and lttng-modules can fail to
parse with an error if it isn't set?</pre>
    </blockquote>
    I sent a patch to preset&nbsp;<span style="white-space: pre-wrap">LTTNGMODULES with '?='. Then it could be overridden from conf files
to clear it. It should be the one who disable kernel modules support to break the dependency
between</span><span style="white-space: pre-wrap"> lttng-modules and lttng-tools.</span>
    <p><span style="white-space: pre-wrap">Thanks,
Kai</span></p>
    <blockquote type="cite" cite="mid:450d9841bf6504e9f457b9b627006b9bdca25228.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

lttng-tools is not useful without the module support.

Cheers,

Richard




</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------1SBFdkYxyCiPLym0l0KfV5eo--

