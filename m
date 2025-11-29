Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD03CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 14:19:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15055.1764425965637318998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 06:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pxfSntbr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATEAmei1628305
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 06:19:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Nc4cO+sq+noTSsYvm8JtFStRZ4SsUSC6Ru9/k5S30i8=; b=
	pxfSntbrHaDAR2aza7ntQ4oCsy2Dw8yH3lc2z2OvxL9XmwzVjbgQGUq0MmeUQstb
	HT6Idp+xlFoP1YIB2/6TAsLEj/fRePKO+mWejpsLwIXx5ZggAJE9i/ujENszAsdg
	Od26SJ0w6OAh47px4DPrlGTIKRfsiocsaGXg5cXlB5aVq88oocVR75raq6hu8XWe
	7tKNnQh7O33on4VlAJqd36yZev0Hca+J0oG0/hRJxEKxYDTM+IRw4R9YkVnHEUlK
	h0aD3G3xd3tOsLqSbz+T2DAr/8jAUtX6nrAjTlnCa2UE873RoYsOr0k3lwMrtTda
	DPyenDy7bGtyQxv26Lv2rg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05g583-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 06:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1+vDHH0zp5TF3Zdh7FM9ITKy3IRyGcuCkATeASvTGVtgt/PC2smmsOnVOu2ij5CiE9ygJXW/k2yepfzbeY97TUtKwuGUfdt31P4bXiMVaV1eiYe3u5KWhdb6DN9X79/3kOtUPKv/NIKIF5qMoK9BJ1datmrvE2wVA9Q1wQNjG3yx2f20wEBPlZoVDD3t4JdHB38JIaE95l3DoxOSTqKkMN8RYRVlVH7vdXnL+HrA3cK/gDwKEeExVvVknPjxysv+fI/IGRlvDAw5eHckCvB76LZQRc9Q0fXwVuxB6GF63mIFj8LUIHZWLETkx8tEctcsVFss2MpmzdCY4BgY9yLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc4cO+sq+noTSsYvm8JtFStRZ4SsUSC6Ru9/k5S30i8=;
 b=WBlEo1nUOCONVFKTJDGD+Gu0EV+fD9G8P05I67DNMYA49xw5lbFyKL19uiUcEQOPofM2wafqj5tRiNtH0otSTOedoHlvBaz2nDab0JjmTyfIQT1pSEh3XtXtpgwWSMn8FJlr5FsfQNebi+dSsK8kKmJ5T5OVV6/LDdW23HIyH3PDbxVgYnS0mOlwHstDs9mUzqlAKbhnJp54HKFfEhq3y9JUmv02ETaNT1+Lr+/CTn1QlYJ3EztO4Z4lz2BPUicTcr4OWX37JuDF57I1D7QkS3E53r6RYU6UD/BF8plCPOSOmm/eEdD6EBEiz/0Nuc+Wkcp3PZItJh9iXmpR60ig+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Sat, 29 Nov
 2025 14:19:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 14:19:21 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Topic: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Index: AQHcYOPs2c2wy+ouQUyKL86Q/2ovj7UJcJwAgABBCZA=
Date: Sat, 29 Nov 2025 14:19:21 +0000
Message-ID: 
 <CO6PR11MB5602BBEE53FBA2EB76C52E13EDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
 <CANNYZj88Ohg3uETcRsn3FFw153XccZoziQugQirrzo+A045pEw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj88Ohg3uETcRsn3FFw153XccZoziQugQirrzo+A045pEw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=02f40afe-ed3b-4955-a32c-8abd9bd381e2;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T14:09:02Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS0PR11MB7682:EE_
x-ms-office365-filtering-correlation-id: 7e7826a7-0584-4297-630b-08de2f524a92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Zjlja0dRUTFadU1hbXUzR3Y5WnFiU1FXVmdsNTRieWhNRUp3cDlReE1Kc2ZX?=
 =?utf-8?B?dXFBK0s3d3ZRTy92MGQvRHRLdllBQXpydW1JVTJwekNUbU5Dd204L2dZMk95?=
 =?utf-8?B?TXNaNDlWY29OTlJCYnhlSkFwTklRZE9UYXdmY1FwdFBRMzFiVFBRWldIODQy?=
 =?utf-8?B?dDB6QlI2SXdzcHpUZmRxMXpFRzlZcGRxMkFkSGlBVG1DanNGdU5GQ2pKUVUy?=
 =?utf-8?B?NktLNmZocTlyQThMaCtkdjJIdkdQT1VOcE05QVJieHhydTJBaG1tZENVVDdV?=
 =?utf-8?B?V0cwSlBCeWViZ3VudHZNRDJFalBFRm5PNnkvVzR3L2xxTjFIRGhFNnNWNnVo?=
 =?utf-8?B?U2hZTXh4dm5xN2RJM3NzcnJ1czB0eUZ2cWprVkVObEVmenF1K2VaKzVDNi92?=
 =?utf-8?B?cTVaOEE5eU1TVGZOSnRURUkvR0JYcU03cVl1YWEva3c0aFdvSHZyeENLVU5Z?=
 =?utf-8?B?bk9sVDNHSXFVQkdybmlLQ3FTZ2Ezb211R3VvSU9RcFA1YWxIREdZYnJDWFZa?=
 =?utf-8?B?YzFSc2lHSlI4UnVMTExCcmRNRmRnM2tTaUNjUGh3bGhOaUJPQVlsbmQrdG53?=
 =?utf-8?B?NUFaN092NHdCSTZyNitJTkE3UGpTQ21aMnlUZVd3bHN3M2tkRENoU1ZOeUFR?=
 =?utf-8?B?c0w1cHB3Z2RTQjkvUmlXUXVUT051ZktRS0tRd0wrL0YyV1p4UE9xdG5YS0lR?=
 =?utf-8?B?ajJDRXlZU3dYby9rNVlDODVtMFRwVjVZN21yY0hyYlJSUVVDb2FyZExwTTR1?=
 =?utf-8?B?dXY4TmdKUjJaQlY5YU90KzJXaTJVUkZTUjZEZkZQQzB0Q0Z5NXMxK2l6Unho?=
 =?utf-8?B?TXdlUXZVbEhrU05lK2MrQzlJSnZ0MEJPT1BNY3BTM2JZenVnQlFmQXVpQno3?=
 =?utf-8?B?NVNXNlJ0aklKZ2hsOFdhc1FUd2VtejZ6T1VuTSt2SDNTYlp3VEU5Tm1oaXM1?=
 =?utf-8?B?MDVaWm1zaWxBbGdIcC9CVm5Ic25OTGRoamJRejFtU2lENDJEc1dDRXo1QjJv?=
 =?utf-8?B?bVEyTnZtaHc2MWxZSkNuL3F5TGcyUUJrQUJ6SjhZSmlPb0xkV3lRTVdDUUQ5?=
 =?utf-8?B?WHNzbVlVek9kK1ZXRUMzenpwS2ZMakxvcDJOK21OYUkvcVJIUHA5czZXSXJL?=
 =?utf-8?B?ckRXQzM2a1lTK0ZEMnY2RytwSkdGalF2dTB5K0g1UkNQV2dmYy9VR3ZmNUhz?=
 =?utf-8?B?Q001bm1FMjloM0NnT3hIR1F2NjFDYmo5YlQvb3VVUWNlSzVOb29PaVFON2NE?=
 =?utf-8?B?UkxTa3liR25TNWVJVVpaWVBJVUVrcHlCU2tXbW9GQTBxWlVLZlVadkRNb0Rx?=
 =?utf-8?B?T3psd1psQ2pIditZYTIrbUlwWmxTdGcxaVpPS3RsWm01eVZFOFZSR0tvQXE2?=
 =?utf-8?B?UHdqTlpXa0RJOFAzbWJCVFRlaVZUNHc0cWRCUndoQmJNbHVzdzFmd3RHWTN1?=
 =?utf-8?B?ZlJFT2RkTDJCYS9yZjM4UkJEWnk4alMxN2pGcnFvV1J4aUQ2TVc4WGF4eHpS?=
 =?utf-8?B?a3VYRUpncEVabWlqaDlvWlNJK0JEQnRES1BSbWs3cHg3N0pJUWxTOUNXTDN4?=
 =?utf-8?B?MitMdUgzczJ4SlB1SDlFN3RNbGZuVVB1b1k0MnZxSlhBNXFaYlJqYTlZMS92?=
 =?utf-8?B?aDJtRTNKc3cvQmlMOTVVTFJjUGg2ZklyRi9FdVBuNE1CQ2gxOWYyYmpBZ01C?=
 =?utf-8?B?RnFMdEphcUlTU2ZITVZhSVpIMUZDd09IMFpvVTArQ1ZibG5pKzQwZk9lbWxs?=
 =?utf-8?B?SnE4Z0ZLVGw5SXRiSUdjQ3M2UWZpYVlrZ3R1dVN1MTIzY0FocG8vUGptTlhJ?=
 =?utf-8?B?WnI5UDBESElyb0RrNDVuaFRqa01MVTJyVHdpWHBoNW5DbVRPYXJIck54bFBy?=
 =?utf-8?B?YmZDOTVGWUtidVNpZ3hpNUh6RWdTRjNIM2xQSzNJaGt0RkhiU2dyZDc1NU9H?=
 =?utf-8?B?YXU0ZjNxOWpwcytHaFdTL3E3NzdvbmJOUUpzejZsb2hCQnFRV1ROYUM5RFU0?=
 =?utf-8?B?WDUyWGtNY29TUk1hV0d0ZmtIZWFiOXlLRGtWaUpDUmxBd3M1RkNhcGlEVGZh?=
 =?utf-8?Q?kMfzAk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RzkyakZxUSs4dFFueG1zZUQ4WDJIak1MVi96SjVSWEMwVVEyK3dnSkZUUnZl?=
 =?utf-8?B?bDF0YUltWExzWVJtU1JJenBoM21PUFdoYTlVNW9qVmtOcFkzeFROSjhFLzQ4?=
 =?utf-8?B?MzFMNy9SM2FaU2FTSExjQUtOOFc0TWFuNWxEdTFiaTZidmxZMlNhQUlGNk5M?=
 =?utf-8?B?RURBdFNPMHlTMzRaMkRENmpnSWdkeDRETk1yNWF1Mk1wZ0NDQllwV01FZ0xG?=
 =?utf-8?B?UUZqeFJQQytPRENFRmlUdHZ3U2NjdWFmR2FFZ2ExdnZMSThtalQ2Skc0aWVT?=
 =?utf-8?B?MzdiZXlaQk5Fc0pGeUZjY1R3cXlSaTNtRmYzWUcvelFmVEp5NGhHTXJJZU5X?=
 =?utf-8?B?cDczZEFHWkw1ZG9yQ0x1REhwcmZuNG4wR0hsRmhnbkdEV2x1bVpyZ3YxT21M?=
 =?utf-8?B?TzZxcFV6NVRjaWxKVnpibjltMzlvTWU0STMya3hXWlNTbUpXS2EwR0orYmt0?=
 =?utf-8?B?TEJrbjI1TDM3eXRzdmRPSHpVWkcya3FiT0xzL3ZZNUVIQm8rbXBVa242R05h?=
 =?utf-8?B?aHQycURjNWJ1TG9xWHp1dHhIVVBTYVJZU216dWc0bjVBM2Vob0ZZODAxNmtK?=
 =?utf-8?B?TXJGa1c5UXQ4YXV2WTd3VGtTVnBSQXVzMEU1ZUJFbHhSMkk0c2FseGJuMGNT?=
 =?utf-8?B?L1hFTnFzeXZpbGlEQWhnay9Nc3lBcjBXbktLaU83T1VvcUtRZ1FOZ0VzN1FE?=
 =?utf-8?B?ZEllM29aYmZTaU1rRHlZYTBOYUNKZ0owOTlyQmdkYzhjY3pZN3VLZ0QzVU9F?=
 =?utf-8?B?b0lSRDU3azZPbUEvb0VacXhrVG1sMEl2ZWlRTCtDTEREM1VUUDRXbjVLcXUy?=
 =?utf-8?B?MG0rZFBtYlErcWlDRUlLZUJHNzluRlpQSGgwM2dmOHFnN3NSYVBXQXlzaERP?=
 =?utf-8?B?djZGa1dmWFE4WVZQM1hBZERFdGFURlpxS3krOEpxZjJoS3ppVDJLUXNYK1JJ?=
 =?utf-8?B?dmViZEI4WENjUGUxUFVrZ3ZLbk1BWXA1bmlhZENRMFZoWTlBQnJJTnlwNk95?=
 =?utf-8?B?TmphVllJOTM3NmhxMzFUZGptMnRBT0I0K1UrTHlSbWQ2RXdYQUxOb04va3o3?=
 =?utf-8?B?WjdCNElSNjFBM1Qzek95WnlHb2tyOVlrS0NyVkRlcTh3SzB1MWZ5VDRqNXZE?=
 =?utf-8?B?eWI2b3UxczR4UzR6OUJmdDlITVZPNk9sZzBLcHhvdXNkTU9COXFjaVJtOFlZ?=
 =?utf-8?B?eXdWVnIrbXZld1NqakFpYU5uRzJ4VjZxVlhNRllhNnRMeUxKd2tLTUJsOE5o?=
 =?utf-8?B?dEVEUXF1Ykp1WEs3Z2VNQnNYWXRTK0x5UVFuQ0pPT3dYM01WelQ0RUVKb1JJ?=
 =?utf-8?B?VHdrS0I5Y1k4R1BqOXlFM2Yvc2RMT3JUaWlQRDVHSzJzZktpUzR3SDdIZFg3?=
 =?utf-8?B?TENVYjlDZWNHRkdxL2hyR3FIUmVONWl1OVNSQ1Rya2JvZytMOUdtd3QzWDRq?=
 =?utf-8?B?SWR3UDdsTDhsb3JDWW81bUVKUzdvclFqQVRDbW5iNmZJbXpGMlkvcHVxOXBB?=
 =?utf-8?B?YzZaS1gxaWRYcE55dHV6a1JGemNvKzZidm1ZdjdBQTBuR0RmenZVOU9WeU03?=
 =?utf-8?B?TjU4Qkw4T1JBc1FNMEJFdE1kTWZDVkI0dmZodzZvZGszSlpiZzhBS00waGta?=
 =?utf-8?B?NDRjYVVmSVNrZG9GWjN5YWs2WW1iK2ZaQjQ1OFNnMzRCK1ZORjlxNXpGQWxm?=
 =?utf-8?B?dDFyMTM2N1VRQkdkcXBaV1NJOG9mRFJZNnVMZDhBalQvY2pXTks0Z0VnOVQ4?=
 =?utf-8?B?Szk4OCsydjlqUE1NTngxcFRIN3Awb005TVNUVDVOTHcwSzJhLzc2T1phM1B6?=
 =?utf-8?B?NmpPYWtjdW5hL2J0NTJWVUhxNjhjc1puOHBKWU40T1MzS0d6SDk2UnFWVVFo?=
 =?utf-8?B?eEVXczlKWVZDRktTREVkeHplOHk3L0s2R2pKTTUzYVY3U1hRdWVIY2pzL3B4?=
 =?utf-8?B?L1cwMXBhb0pERVJkWjR5UWJ4NGMydzgrdFFJQmsxdDBMV052alhzSmU5VUJK?=
 =?utf-8?B?UjJQNkkvWVArbHM5SWcxMElHeVFVeGIrUnY4UnlPUURyVjI1T2l6QTE5aHVW?=
 =?utf-8?B?NHJYOXFnRFhoSjJmUmVNVUtJRDZtakkvUHBFY3dVclR1Qis3cEx0ZTMzSlBO?=
 =?utf-8?Q?QxPZx3VLvvuGN+2RzscL4Cqo+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7826a7-0584-4297-630b-08de2f524a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 14:19:21.7939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3SWwfy/JcjoxM9y26QVULgg4hutHjya9XVieAPmIeT9NNntEanW2YqcjFV5K9JZNJhNEyqkCrFsWclY6qFP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TDVDeR8TcoJcRoxrWcfvCq4yRxsMFaAS
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692b00ec cx=c_pps
 a=VQ1tsm+IcWX+DCGDUvrerQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=gb9asBkhx9Yy3jneO4cA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: yKcE_7J-au8JVBeJKZl_o0TdSsj9hOpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExNSBTYWx0ZWRfXyaWC/8pOiI1N
 eP5RHHJFwTQeyG9dvpdHlP8MGUuRFV70t1HkX763nM8K36miNKFiGAB63GmUaOSuRXRw9taE9PL
 SjDJErBC7+dJkIk6fVK4p6lCT1LkE7yb63PTKedxmI/SE0GM8H/dYQyBBamJzhCkGH5kUmaFYZV
 ry4VJBNKnc6Y2nAJQIRBqvlSj1bNeYq3v0HAp03Kml0UvBM4tSGZ5v37mtA1k04ulZ1dWtz/Qx+
 N9Q9ZTnIAkc8i3U/vuZBDvFXXSzJlVGVt7VnOJtq3Oe4Dx7TXWMNFrsrekoHyVLfAg3wKAJAM3n
 SxzdvgE0PmiEZ84+9ViL/P4sjkW/nvg+PqP7T0epNIgCiSAkQGyKHX8vnQdEzAa6aL/DDpn1KNz
 /bHxKFQsyaPaJAWA7yS55ovPS+Sgyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 14:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226937

VGhpcyBjb21iaW5hdGlvbiBoYXMgYmVlbiB3b3JraW5nIGZvciAxMCsgeWVhcnMuIEkgZG8gbGlr
ZSBiYW5uZXIuIEJ1dCBpdCdzIHNvbWV0aW1lcyBtaXNsZWFkaW5nLiBTZWUgdGhlIGV4YW1wbGUu
IFRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvIG1ha2UgaXQgbm90IG1pc2xlYWRpbmcuIA0KDQpJIGRv
buKAmXQgdGhpbmsgZXJyb3Jpbmcgb3V0IGluIHVzZXJhZGRfYmFzZS5iYmNsYXNzIHdpdGggc3Bl
Y2lhbCBjYXNlIGlzIGEgZ29vZCBhcHByb2FjaC4gV2h5IHNvPyBJIGRvbid0IHNlZSBhbnkgc3Ry
b25nIHJlYXNvbiB0byBicmVhayBwcmV2aW91cyBiZWhhdmlvci4gQW5kIHRoYXQgbWFrZXMgdXNl
cmFkZF9iYXNlLmJiY2xhc3MgYnVuZGxlZCB3aXRoIElNQUdFX0ZFQVRVUkVTLiANCg0KUmVnYXJk
cywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIg
MjksIDIwMjUgNjoxNiBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQpD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgYWxleEBsaW51dHJv
bml4LmRlDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYyIDEvMl0gcm9vdGZzLXBvc3Rj
b21tYW5kcy5iYmNsYXNzOiBmaXggYWRkaW5nICdubyBwYXNzd29yZCcgYmFubmVyDQoNCk9uIFNh
dCwgMjkgTm92IDIwMjUgYXQgMDQ6NTQsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gSXQncyBwb3NzaWJsZSB0aGF0IHVzZXJzIHVzZSBFWFRSQV9VU0VSU19QQVJBTVMgdG8gc2V0
IHBhc3N3b3JkIGZvciANCj4gcm9vdCBvciBleHBsaWNpdGx5IGV4cGlyZSByb290IHBhc3N3b3Jk
LiBTbyB3ZSBuZWVkIHRvIGNoZWNrIHRoZXNlIHR3byANCj4gY2FzZXMgdG8gZW5zdXJlIHRoZSAn
bm8gcGFzc3dvcmQnIGJhbm5lciBpcyBub3QgbWlzbGVhZGluZy4NCj4NCj4gQXMgYW4gZXhhbXBs
ZToNCj4gSW4gY29uZi90b29sY2ZnLmNmZzoNCj4gT0VfRlJBR01FTlRTICs9ICJkaXN0cm8vcG9r
eSBjb3JlL3lvY3RvL3Jvb3QtbG9naW4td2l0aC1lbXB0eS1wYXNzd29yZA0KPiBJbiBsb2NhbC5j
b25mOg0KPiBJTkhFUklUICs9ICJleHRyYXVzZXJzIg0KPiBFWFRSQV9VU0VSU19QQVJBTVMgKz0g
IiBwYXNzd2QtZXhwaXJlIHJvb3Q7Ig0KPg0KPiBOb3RlIHRoYXQgYWxsb3dpbmcgJ2VtcHR5LXJv
b3QtcGFzc3dvcmQnIGltYWdlIGZlYXR1cmUgKyANCj4gc2V0dGluZy9leHBpcmluZyByb290IHBh
c3N3b3JkIGhhcyBiZWVuIHdvcmtpbmcgc2luY2UgYXZhaWxhYmxlLiBUaGlzIA0KPiBwYXRjaCBm
b2N1c2VzIG9uIHRoZSBiYW5uZXIuIFdlIHdhbnQgdG8gZW5zdXJlIHRoYXQgaXQncyB0aGVyZSBv
bmx5IA0KPiB3aGVuIHJvb3QgcmVhbGx5IGhhcyBlbXB0eSBwYXNzd29yZC4NCj4NCj4gV2UgbmVl
ZCB0byBlbnN1cmUgdGhhdCB0aGUgZnVuY3Rpb24gcnVucyBhZnRlciBzZXRfdXNlcl9ncm91cCBm
dW5jdGlvbiANCj4gZnJvbSBleHRyYXVzZXJzLmJiY2xhc3MuIFRoaXMgaXMgYmVjYXVzZSB0aGUg
Y2hlY2sgaXMgdmFsaWQgb25seSBhZnRlciANCj4gdGhpbmdzIHNldCBpbiBFWFRSQV9VU0VSU19Q
QVJBTVMgYXJlIGRvbmUuIFNvIGNoYW5nZSB0byB1c2UgOmFwcGVuZC4NCg0KSWYgeW91IGFyZSBz
ZXR0aW5nIGEgcGFzc3dvcmQgZm9yIHJvb3QsIHRoZW4gd2h5IGF0IHRoZSBzYW1lIHRpbWUgeW91
IGFkZCByb290LWxvZ2luLXdpdGgtZW1wdHktcGFzc3dvcmQgdG8gZnJhZ21lbnRzPyBBcmVuJ3Qg
dGhleSBjb250cmFkaWN0aW5nIGVhY2ggb3RoZXIsIGFuZCB5b3Ugc2hvdWxkIHBpY2sgb25lIG9y
IHRoZSBvdGhlciwgYnV0IG5vdCBib3RoPyBZZXMgdXAgdG8gbm93IEVYVFJBX1VTRVJTX1BBUkFN
UyBzZXR0aW5nIHRvb2sgcHJpb3JpdHkgb3ZlciB0aGUgZW1wdHktcGFzc3dvcmQgc2V0dGluZywg
YW5kIGdhdmUgeW91IHRoZSBkZXNpcmVkIG91dGNvbWUsIGJ1dCB0aGF0IGRvZXMgbm90IGluIGl0
c2VsZiBtYWtlIHRoZSBjb21iaW5hdGlvbiBhIHZhbGlkIGNvbmZpZ3VyYXRpb24gd2l0aCBhIHdl
bGwtZGVmaW5lZCBiZWhhdmlvdXIgdGhhdCBuZWVkcyB0byBiZSBwcmVzZXJ2ZWQuDQoNCkFsZXgN
Cg==

