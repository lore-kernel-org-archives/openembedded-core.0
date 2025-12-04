Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387A9D1CDC6
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 03:13:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34117.1764817999390932495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 19:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rYEaPPSe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B42xxVp3674199
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 19:13:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CJI71SoMduxtLpGRhkn+dJ1fXyH/+KzSY1j+4S9wXw8=; b=
	rYEaPPSe9zHJHwXg2CwBlBAbIFV1kjzX9mV3AaeY9V55bzeQkSO5eH8DFx/Ez9+H
	SNCTcubILLwBRD5tWBssUnzXy3sqpPBMqCv2T4Xyu+/h7NEQo4VqpITlkQxpiued
	8QcSt3QNwJh/h6qIwILdi/uvj2ZE/abJJgFDT5Eb35HKB0ksl+XYRZGBTME50CvG
	/YNqlR/RqDADpVPBhIAbxQhE1rnYeXHA6K2YVzJ78PJx9dazwlCpQLJhv7D5xMQ/
	EQc/7IsQWAj9OQVvmS4ZcM+bBfVKu9daYK8LAf4aGu55rx/SLb8IX5J1l8XiXtVy
	mlld2pwBydC29OgKorzJ+Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mwnr8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 19:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeAyLCfnRgxJULPHJ8kmbwvOnbPpjeNCf16aZeDuO77BmCxEhDSP+hD7S38iLrGTEDf1DIHyB7xzLClpIKK3CzQdranq4KOyv2rcbzsHAMh8nBnY/G95eQXwis7c4eZ2tjWnvYoy1dj9n/AAh8kGuBN40isNJZU4Ex/Mpf4XqbEzSeh//+F5rBzCf1AIEcBNvIVCamw9ilxO12wMabxhpAuDuNGbeNf444lPG/bzfvoxOysBThv6OWqpk5PdICB4EpP32pX7PsP5PXC4gLdlu65E8Au5reoKpDkbg7u5W/pZE+/imoxY6Ij5c40RblMMKcUtCL3NuELW93KlQjGnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJI71SoMduxtLpGRhkn+dJ1fXyH/+KzSY1j+4S9wXw8=;
 b=UhNIKKUSoAYEwRmFKFTAcQ0LeDt77GWl+33PW1ZRt4P7qqV0FN1uaO/3iYCmJjamH/13K+Za1Zkqo2VaFJFjFzmmXl9A8GaTbZFeOZSeP3hODOffQfVsgzeI/hBl49YCmu4FTc2Uj4yoB/ReEQAGfKuW4Ju8VYNBAGMMnSMWb6jRyKjPFeDlcNlhpysoHwJ3kjA5YAZKqMSZba6qdlIAuiyZYPn7MRl4DaJkV6pxp6bPfmElPCia+6//oe5vlzbWnIhhVTDUqP/fH65kESICLcKenObdLnBJTmF0m0DTuE8urRHcFpa1zfaaeHpx67ey8p9AAaVOgC0GjVKFPJzD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 03:13:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 03:13:15 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex@linutronix.de" <alex@linutronix.de>
Subject: RE: [OE-core][PATCH V4 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Topic: [OE-core][PATCH V4 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Index: AQHcZIxHUgLvpuZBtEyV2eWV3Yqdp7UQzp0A
Date: Thu, 4 Dec 2025 03:13:15 +0000
Message-ID: 
 <CO6PR11MB5602E24A548BFD94AEFC929BEDA6A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251201052523.1222217-1-Qi.Chen@windriver.com>
 <20251201052523.1222217-2-Qi.Chen@windriver.com>
 <DEOU2MMC87XK.2WWY757LXHRIT@bootlin.com>
In-Reply-To: <DEOU2MMC87XK.2WWY757LXHRIT@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=f787e7d5-11b8-4fb2-9d1e-bdb10ba2a20c;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-04T03:12:42Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4781:EE_
x-ms-office365-filtering-correlation-id: d79c4595-507c-47c3-1080-08de32e310ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UVVNdGZWK044VWR5Mk5sVW5NUW9yMElXZSswQ3pqNEdpa1draS9qTzFRRFNm?=
 =?utf-8?B?Y3NUSUVXcjY3Y1FEdytvYXVvcTFlVUUrUjhlWmdhaWhPUGhVZ2tzNDFQTHp0?=
 =?utf-8?B?N3lDY2Vnbi9GM25UcC9GM0h5UVgvMUhGa3ZYVkxCSmtuYjd2a1VRQzVzQTZI?=
 =?utf-8?B?TWhXSjhaU04vSzJCMGVGNTB2cEtpdlFwZFQ5S3Y3c3RobFR1a2dDaGFPNVBr?=
 =?utf-8?B?V28zc1FWYTB4N2J2OU5GWC9Mb1NlUm00RXpVdzlaNmkyYkFvcGZ3TnR2YjBr?=
 =?utf-8?B?bW9iaG9YYnlNUzVIdUYwVmNVSld5dnowVTRBQ2dPODdGeEFLR2w5d250WVR4?=
 =?utf-8?B?TklHUlNlb0taYlJGMGk0Y3pDaEVDMjJqTDVKaWlvd3FBdjVBUTVvQkpXeGxk?=
 =?utf-8?B?T2JsTnNXNjI0Q20xT08yT0VTeVBHT1RlVm9FeGQ3ZnBkMzd6U05vUmM3TjlG?=
 =?utf-8?B?OE1KZndKNVgwZ2tsVGNDV3ozbmJDTlIycmVWbjNQalR5SmZjRGR0aFEweUJR?=
 =?utf-8?B?VDRYSUd6SE9COWpUdlVuN25vTVhtcGNpQ0JyUUZBOXExaWFwbnVsOVU5NGNq?=
 =?utf-8?B?Z01YdW9IUVdkUHFhQ1VXcnNXREU1S3ozRVM4WjNkN2NqTm9KOEtWRFVTRk1i?=
 =?utf-8?B?QnhSdU83MC9sVHJiaVJmaE9IRzVkeHpLWG42cDAxQlVTTHlHVUE1bGs4M3ZQ?=
 =?utf-8?B?clpHekQ2cHRKQ3RaOUE5ZUJxM3J3K0M3ZXdNMFU5dzQxTy81R2J6SFdQbFZt?=
 =?utf-8?B?NEJnRjAvTy9sOGRaY2pFY2FVanRwQmphcDEzeGNRelBxTG1FVjNCYW1Zbkxi?=
 =?utf-8?B?ejBjZ3R3VmVsbUx2UGlDSlpTRE56Q0tqL3JWNUtnQTRTVTJxVEp3Z2kwQ3Js?=
 =?utf-8?B?MlhhREx2di92ZHNVOER1blVnVnZWcVA2Ry8xa1ZLWkZnQURPZUJ2UFU5b0gx?=
 =?utf-8?B?NC9vNDNWdWQ4RGVybytEcmtSR1QycTlvNi9sR1BhRVF5UHNFYkFhZ3B5Yml0?=
 =?utf-8?B?alVkS0laVTZoVHNodFZyZGN2Y01Ramx1NDczNlNlb1o2NU8wZW9JYTFqQ1Fi?=
 =?utf-8?B?MFYvRVd1bFZCb0plQ3RscXJGSnZNYTV0SE16eVpFakoyT2pzNGpucDgrWDdX?=
 =?utf-8?B?MXArS1RoNUFOZ2FLbVEwWnNuSklXWW1odmZGV1UxZmRVRkNSMlliNWc1Q0Y1?=
 =?utf-8?B?VTBocTJlRGVxcWFnWkFyVmY1OEhyaWFEMGZiZjRtUCszNm92eFRXYkoxcHJ4?=
 =?utf-8?B?WUszck9vdWxOaVdYN1Y4ZjJFQTZYMnRkT3pxSFdkaUgwcGsyWXR2MEwrWlor?=
 =?utf-8?B?UlArTFJRaWRwYkFTbWdZU1NscnVEdEdWdmo4WGFSS2FoZWo0ZEY4ZHNqVWpk?=
 =?utf-8?B?bGZ5eFZ1UVFMZW16bzJ0S3k1T3RRck9MSDgyWjRwU1NFaHdOL2d4ZlNSdTlN?=
 =?utf-8?B?dXlBL090NUtkaHlaVUxyY3pYRjFUenQ1ZVRLWkpxN1NUWUlRZ1dTSExjVmJi?=
 =?utf-8?B?MUJUczBSRC9QSzk3WWliRUk2c2RXelJKTllISzNBWHBNSGVMZmJLeTF6Ry9r?=
 =?utf-8?B?eTZiNnFzWWNDQWVBSzBrOFlRL09XbXk3K2JDbHlYd0FvRzVQeXNhdU5xa3NQ?=
 =?utf-8?B?WDNlWVYzMEFGL1VXak5saEVYZ05NeDZqSEpUNk10czdSV2JLbVVwc3ZnWUtQ?=
 =?utf-8?B?YzBBVkVDZXQ1dmZRZVlMN1NBRENSQXVTaEtvclhVMDNPMmZsVjVIN29BRWNa?=
 =?utf-8?B?TzlhRTBhWUNFYzFNc202MWRYRExYMElzeENDSTdOY0JvcTkvWFkxWEh1Rkcy?=
 =?utf-8?B?T3NYL3I5Nlh4bFFtb2JheFlMVG9Vd0Q4R1VKUGNweHUwcmkzUFQ2SVZ0WWcz?=
 =?utf-8?B?K2xURk1WOUpiSUlrRVZVQzRrTFFUTlpIMFAxRzg2Zm9DZDVjeGFnT2ZWL0VK?=
 =?utf-8?Q?ZsTliQv91/bjpPfRAYOXXivDnrw36CSo?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YXY4RmxVQ1Zvc0pRL0lMQTFrajBxQ2J6QjJaRDRRVURyNDdzRCtKU1BMekQx?=
 =?utf-8?B?NlNQenVkSUpVbWh1ZU9aU2pnSVIvV3dXOHFiazlxQmxnT0xWUk1OU01DdFdZ?=
 =?utf-8?B?TTRuRGpnZ1hmNXU5SjUvaDQvWjNCUXQ5T0ZBWDFVTzhsaXY3UE44UXcyYUlh?=
 =?utf-8?B?YVB3WFYvUThGclR2OXVmeHZ2TXlubUNwUUF3WGtibWErazVyWXJmSFNyNVlX?=
 =?utf-8?B?dzRaWDJBOFdzek9zdmxub2JMMUlJS2VyNWh2VFBrbk5IRkUrM1IvVmdjYzk3?=
 =?utf-8?B?ODJtejc5RU1wMVVnTzdMREE0dEFQNkQ4WTZZczRKWFhWalhFUGpVZk5GMmo1?=
 =?utf-8?B?bFRzdElQL01Wd3ZldUJINnVGZkV4Q3IxNEJ0M3o4VHhDYi9uMnNSSlk1RGs4?=
 =?utf-8?B?bHkzbHNCVWlmSzhnVUN4OTROTzZkSGRLbHlTSXJYQXg5NUNvcWR4d1JCMThO?=
 =?utf-8?B?YUV5YWZpYTQ2YkFxRi9xVUlxT2hiTDcrRlNSYzJWL1RlSERYVEZRQmJIcEFl?=
 =?utf-8?B?QWM5SSs3c3VWQUg5dG1yNWQxUkIvUVZ1THR0YUJuRXFUbllZaE5QWlJsanpL?=
 =?utf-8?B?clAvcnRwR25aVDZBR2pESDRPWjZzSitydkR1VXJCT1U5NjZQaitySGFNSTR4?=
 =?utf-8?B?WWFLWFY4T09kMW1xWXQybDU1WUVUZ2tKd2ptNmdPNVdoY3RUR09PcnJSbkQy?=
 =?utf-8?B?MzBwaTh5bk1mV0lVQklFdWdqSzZHM1EwZGt4dEo1NGFVWG8zMWZuVjJTTjNI?=
 =?utf-8?B?dUI4Sno5NGJpbmk2bE5vT0wrZ0lDSUtJalhtOGhaSUhKdVFDYkVmNGkxZDhv?=
 =?utf-8?B?dnEvYXRmYnlocjVXU1RmWEhjNjRZcmRSYWZ1SUVJNzR6OGhWRGN4K3BObmtK?=
 =?utf-8?B?ZFhZTjBTVTByZG8wQ3NQRlZRWXZCN1ZrQzAwVUlrNGpZRXhMRmlRMWxocFpv?=
 =?utf-8?B?TmNoRmpRaXc0QTN5bjJJbGc1YlhnMDVPNGUxYk8vRTh0ZWZ3c1htcWZ2aUdM?=
 =?utf-8?B?L1lQbDMxOUVFYVhZZDE1KzEvb0xieG5reTlOT0Q4cjlZKzBSc3F1enQrNEJL?=
 =?utf-8?B?c1ZJM3FpMEJFcUtFY3p5ekNBOEg3dEM3dHBUenU1elk5blRxR3FmUk96UFRw?=
 =?utf-8?B?cGZnOURlemF2YVZTL0Y3dkNKNndpRnVPSS9PT1M2aTZzaWpDaTBaLzJlQXNr?=
 =?utf-8?B?Nk5qRGVVWE5XOUgzQktQRk53OVRxbSsxNkIrclRoT0syZnNydU5KT0NSZnp1?=
 =?utf-8?B?YWw5dkFVeGFNQ08zVFJMTXd2a3Z2WTdDNnFWc2N6a09wVnV5eGpqQ2tLL21j?=
 =?utf-8?B?MmpFYmNRWFJyNzF6aE9MUjh2bENzdThnK0xhSzdKQUl5VHFSZ3NGbFJLSXA5?=
 =?utf-8?B?UXJteVRhYXBmejJUME1RYVJZUHNHNEIyNzVTb2VGQTNnRmtjemhyL1hnYVRz?=
 =?utf-8?B?bzhUZmxkZlZaaE10STVJOEVMbm5uVjloQ0FlK29rTkFUV3htWjJnRUN4RVlT?=
 =?utf-8?B?TEtVMVQ3d1hlT0VIMUV6QlloTjg4blVpMXJxZE0xSHBheTRYZWFqd1BEN0Mv?=
 =?utf-8?B?U0cxUnZLaEdyY3lteS9MQjY4LzRjNm9nTWlCOTMzMkFMUlMxaW8wMlU3Q1c3?=
 =?utf-8?B?MGhRUzdncUdLZHZLa2w5M0kzZER4dERySXQ4eW9rNTBnOE5Ha3dUT0pWR212?=
 =?utf-8?B?Q1JJUHJlN0tmcmh0RkU3U3p0VFFkc1dEQTl2MzFpM2J6T3g3NGFSRDF2ZXpM?=
 =?utf-8?B?RmIrbkpOM3lpYk9vTG5URE1PYkk1Q1hEWUZTSlFkWHV3ZFZ0N1BIcW9nUFpO?=
 =?utf-8?B?VWNyOWpHQ252RkxCaFd2akpuM21aZ0NLM0lNZmtTdEFBcVNUVHlVUDM1cTdk?=
 =?utf-8?B?UysvWEZQTkNINFU5TEJONlpRYWhrdmM0WDhqdUI4Sy9XN0dYSDJFVURIcysx?=
 =?utf-8?B?VmpNMkFUQWZyeTlsaHFTQmJNOTAxSlFxTVpXMzRoTVE2Uk9ISHNndnhoRTJw?=
 =?utf-8?B?ZHNUR1d5M1J6NHhaUmxHYkpmWkNaQjRuY1VvbXVSZ3NxMmtRMk5oUHNFbUFw?=
 =?utf-8?B?QjR6M0hHRlMwdXI5Y2VUVjFOVmRoZnRnb1FMUnAxSXltSzJuSnV0ZStUT0pT?=
 =?utf-8?Q?JGqe35qPLCiNo1LBTUaFczYyb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79c4595-507c-47c3-1080-08de32e310ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 03:13:15.7283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqzHZfCy/C4QyjMscpXKaAOLZvJ/Wn0/hjgbYSEWmdOedCKSSupTibarCqfKMGLWDFia/5fBBzXRiFaCFq9uUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: w5u0w4HCeOcjQUZdFwydzXfK8trv7ObD
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=6930fc4e cx=c_pps
 a=A0DLv2vQdyrz0cYTEbm3ig==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=Qtt1gTZ7qNvDxCCDtCQA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: VbmJNMpYSCIAgPt8uLvLW8_nVEfbBqkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyNCBTYWx0ZWRfX4aJNPo0vcsbm
 n4RAM9DGnN7dSa+Lo+kKmmCNRmq6H727Jhah9QjvrnBEd7+BunYBlBgp635f3RtiEVx+jWUDRTv
 6i9wMORqI4zmbCPcwwmHbNgkdXDpwJqA7Fz9pWSgXtUMPw9OLaM2CmTiG9O3ZLrzolct1f+H18Q
 a++/KBG4sxtrkGk06eLcLjeAPsJDvWM/1zfyhgn/cfrLcmRWf9L11/a7tlbuLyy8DNBh9v2Zxs4
 8Xft2SvwVmEruWkpQ94KqPxwWpnayXcSl2tIAjSn3ekRQqzGX5YllMCN80A+joBBf5qvKmLdGwa
 bbdWHqYyAh8MXm+rY9gOv0byoPxLZC6WEhbAXHp1SHHG1mQ7xHIRhN76ExB1wkEo0iP1nPklcTQ
 ZhWKXKNgzVICe+5fJDXiqbM0cD81yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227249

WWVzLCBvZiBjb3Vyc2UuIEknbGwgbG9vayBpbnRvIGl0Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0
aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiANClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJl
ciA0LCAyMDI1IDM6MzcgQU0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KQ2M6IGFsZXhAbGludXRy
b25peC5kZQ0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCBWNCAyLzJdIHJvb3Rmcy1wb3N0
Y29tbWFuZHMuYmJjbGFzczogZml4IGFkZGluZyAnbm8gcGFzc3dvcmQnIGJhbm5lcg0KDQpPbiBN
b24gRGVjIDEsIDIwMjUgYXQgNjoyNSBBTSBDRVQsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4NCj4gSXQncyBwb3NzaWJsZSB0aGF0IHVzZXJzIHVzZSBFWFRSQV9VU0VSU19QQVJBTVMgdG8g
c2V0IHBhc3N3b3JkIGZvciANCj4gcm9vdCBvciBleHBsaWNpdGx5IGV4cGlyZSByb290IHBhc3N3
b3JkLiBTbyB3ZSBuZWVkIHRvIGNoZWNrIHRoZXNlIHR3byANCj4gY2FzZXMgdG8gZW5zdXJlIHRo
ZSAnbm8gcGFzc3dvcmQnIGJhbm5lciBpcyBub3QgbWlzbGVhZGluZy4NCj4NCj4gQXMgYW4gZXhh
bXBsZSwgYmVsb3cgYXJlIGNvbmZpZ3VyYXRpb25zIHRvIG1ha2UgYW4gaW1hZ2UgcmVxdWlyaW5n
IA0KPiBzZXR0aW5nIGEgcm9vdCBwYXNzd29yZCBvbiBmaXJzdCBib290LCBidXQgd2l0aG91dCBo
YXZpbmcgdG8gZmlyc3QgDQo+IGVudGVyIGEgc3RhdGljIGluaXRpYWwgcGFzc3dvcmQ6DQo+DQo+
ICAgSW4gY29uZi90b29sY2ZnLmNmZzoNCj4gICBPRV9GUkFHTUVOVFMgKz0gImRpc3Ryby9wb2t5
IGNvcmUveW9jdG8vcm9vdC1sb2dpbi13aXRoLWVtcHR5LXBhc3N3b3JkDQo+ICAgSW4gbG9jYWwu
Y29uZjoNCj4gICBJTkhFUklUICs9ICJleHRyYXVzZXJzIg0KPiAgIEVYVFJBX1VTRVJTX1BBUkFN
UyArPSAiIHBhc3N3ZC1leHBpcmUgcm9vdDsiDQo+DQo+IENoZWNraW5nIGFuZCBhZGRpbmcgc3Vj
aCBhIGJhbm5lciBpcyBlbnN1cmVkIHRvIHJ1biBhcyBsYXN0IHN0ZXBzIG9mIA0KPiBST09URlNf
UE9TVFBST0NFU1NfQ09NTUFORCwgcmVnYXJkbGVzcyBvZiBJTUFHRV9GRUFUVVJFUy4gSW4gDQo+
IHBhcnRpY3VhbHIsIHdlIHdhbnQgdG8gZW5zdXJlIHRoYXQgdGhlIGZ1bmN0aW9uIHJ1bnMgYWZ0
ZXIgDQo+IHNldF91c2VyX2dyb3VwIGZ1bmN0aW9uIGZyb20gZXh0cmF1c2Vycy5iYmNsYXNzLiBT
byB1bmxpa2Ugb3RoZXIgDQo+IGNvbW1hbmRzIGluIHRoaXMgYmJjbGFzcyB1c2luZyB0aGUgJys9
JywgdGhpcyBmdW5jdGlvbiB1c2VzICc6YXBwZW5kJy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCg0KSGkgQ2hlbiwNCg0KVGhhbmtz
IGZvciB5b3VyIHBhdGNoLg0KDQpJdCBsb29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgdGhlDQpj
b250YWluZXJpbWFnZS5Db250YWluZXJJbWFnZVRlc3RzLnRlc3RfZXhwZWN0ZWRfZmlsZXMgc2Vs
ZnRlc3Q6DQoNCjIwMjUtMTItMDMgMTM6NTU6NDcsMTY5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0g
Y29udGFpbmVyaW1hZ2UuQ29udGFpbmVySW1hZ2VUZXN0cy50ZXN0X2V4cGVjdGVkX2ZpbGVzIChz
dWJ1bml0LlJlbW90ZWRUZXN0Q2FzZSkNCjIwMjUtMTItMDMgMTM6NTU6NDcsMTc2IC0gb2Utc2Vs
ZnRlc3QgLSBJTkZPIC0gIC4uLiBGQUlMIC4uLg0KQXNzZXJ0aW9uRXJyb3I6IExpc3RzIGRpZmZl
cjogWycuLydbMTQgY2hhcnNdL2V0Yy9pc3N1ZScsICcuL2V0Yy9sZC5zby5jYWNoZScsICcuL2V0
Yy90aW1lc1sxMTIgY2hhcnNdaWIvJ10gIT0gWycuLydbMTQgY2hhcnNdL2V0Yy9sZC5zby5jYWNo
ZScsICcuL2V0Yy90aW1lc3RhbXAnLCAnLi9ldGMvdls5NyBjaGFyc11pYi8nXQ0KDQpGaXJzdCBk
aWZmZXJpbmcgZWxlbWVudCAyOg0KJy4vZXRjL2lzc3VlJw0KJy4vZXRjL2xkLnNvLmNhY2hlJw0K
DQpGaXJzdCBsaXN0IGNvbnRhaW5zIDEgYWRkaXRpb25hbCBlbGVtZW50cy4NCkZpcnN0IGV4dHJh
IGVsZW1lbnQgMTI6DQonLi92YXIvbGliLycNCg0KICBbJy4vJywNCiAgICcuL2V0Yy8nLA0KLSAg
Jy4vZXRjL2lzc3VlJywNCiAgICcuL2V0Yy9sZC5zby5jYWNoZScsDQogICAnLi9ldGMvdGltZXN0
YW1wJywNCiAgICcuL2V0Yy92ZXJzaW9uJywNCiAgICcuL3J1bi8nLA0KICAgJy4vdXNyLycsDQog
ICAnLi91c3IvYmluLycsDQogICAnLi91c3IvYmluL3RoZWFwcCcsDQogICAnLi92YXIvJywNCiAg
ICcuL3Zhci9jYWNoZS8nLA0KICAgJy4vdmFyL2xpYi8nXQ0KDQpodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNS9idWlsZHMvMjc4Nw0KaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNDgv
YnVpbGRzLzI2ODINCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzIzL2J1aWxkcy8yOTI2DQoNCkNhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhp
cz8NCg0KVGhhbmtzLA0KTWF0aGlldQ0KDQotLQ0KTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290
bGluDQpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQpodHRwczovL2Jvb3Rs
aW4uY29tDQoNCg==

