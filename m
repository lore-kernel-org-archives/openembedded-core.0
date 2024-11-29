Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79098D729F7
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 18:34:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.web10.120602.1732905242719411011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 10:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vV+Wvvzv;
 spf=pass (domain: siemens.com, ip: 52.101.66.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx57QAbvbLid2kXqKXzYOjj7zog38KsFH9OAUTIxeAgznMy77qD+s/kunIwxpvnD0e50nTwCZUQHbH/mne6rXfv45mObd6NOMirpBRKr9SKNdO7/ATkNFmRoxIphklrcMgYrD7lkAA15Ii7P6gX3B8v6dMjkd8zt2O1IZnhcwLJBgtZtct13SzeY97HaGcqkOp2ZiohBQpfKjgFSQ5owwnj3ImmVC70RC7npPK0kzmktmh9mBMQSqN571ZBHxkyAHdxSf64osdwtOtqEwWTN6Igc8B5upRyZ8rSQbbHEwVpS3xly9zVPdWeYV6+n7Fld4UmzoZhS+xpFGEKIL0JzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RucyfRYdx8kM8jfk4lDDd85QIIgNTcG9hXy3ykwhvXM=;
 b=Pem8Bn5Y5L89wVUUdx+GCrCEHPd/bLWOJ4iG20R0tpbDrvCFvaohJF1PAMdJhJ8klUY01TOMjfzKzdhzzojR/gOqUd8PxmQrl0pJqGerJQcbXOxxovr2IOWpsubmrbLSEdFLGZXwYOPqGR+csReE+ljiDHwilu3V0Qxdn/jRW7fAkUrod7hpIZaNlLFfBHo1GtEAXZzqvwcEr+KofJApXucKIkp5liNytU0lk8KLow5daxmRdyw3Mb8i7ycwrvjagkn3B7q4mnepGhIBpgs6L6ENLjYfXz15kdKYOBmEEMgUS8gk4YZsyqNtMraQDA/ZcaX8zJcSaacIY36yeHXaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RucyfRYdx8kM8jfk4lDDd85QIIgNTcG9hXy3ykwhvXM=;
 b=vV+Wvvzv1Nr1pH8T585xxj8ottM+HmmmeOYigVsaKO3UgewnRZP8ptwFobsrrlJYqEYd+qyExJo6d3/pd0FWa84oZRpPq9ZPCew3EiFcDrUcufeg8Yep/C7743FVYV5eeOrAeontXKSB67nBvgumFP8wuzzNU34tGuUvgbxksxmVSovbiXEfocoMNV6EIEGMeADE0ze56fRyXeFAGrXNjTcuvzodpWsHRl/mANyaAJKc4AO4xxexemoGY/aQQ4S1SLd/1sW/xs8bVtkCNC7wDIiEGPc9lmyViNQ5FmYR46Bvt/uoCo6zlfs59Cp2bydqHVZMVO6wEAwixooDKxO74A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DUZPR10MB8290.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 18:33:59 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 18:33:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
Thread-Topic: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
Thread-Index: AQHbJf2GZJQ7sxHz3UqG5JH2Mbf4ALKWORgAgDiUv6A=
Date: Fri, 29 Nov 2024 18:33:59 +0000
Message-ID: 
 <AS1PR10MB5697F7732BD8CC377EB0286CFD2A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
	 <180155B44E341F73.23694@lists.openembedded.org>
 <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=85957289-081d-4291-90a9-85e02d0093a4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-10-24T18:28:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DUZPR10MB8290:EE_
x-ms-office365-filtering-correlation-id: 8ced3843-a245-4cb9-0a1a-08dd10a463d9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SG9YK0paUVNEcUNVT2FkZnduNFg2ZHR5RnBCMlV3aTlLRzBRYmE1Qkc5RGlE?=
 =?utf-8?B?Qy9IcmlHODJHYmZGUlJlaDY1NUJtTU54TzlEdmd0VWhBMWZ6U2ZCZFVzdkJM?=
 =?utf-8?B?b2NrcU1hWkJHZm52K1pkcGtnOGxmVzUvTWVMSndYRE8vRmwvZ0lvNDZEK1lk?=
 =?utf-8?B?bUdpLzBHbktFTUNjQk5lZU02TW9xS1Rxb3dMMXJHYkJVaWZwdlJtdjhJZVlo?=
 =?utf-8?B?NXFTc2E1ZzZ4eHJhdDZwY2l6REU3c2paOUdRNUJVV3VXY3RSaGlqRUFRMTEv?=
 =?utf-8?B?aFNua2d1Wm5TbW1oQkJJL3dZbFdObTU2d2xlZ2wraU54NWVxQkt2QlEvdVoz?=
 =?utf-8?B?cEFZUWt6dGV4amFiRkhFVE9NSVRTUTduRFFmNVBCc3p2UTFiQm1iOTFBSEhJ?=
 =?utf-8?B?YmphOEpSaVFzM2Y1N0ZPcDJmc1A5cWtuUW9abGVpS0prT08waTFZdkpaVWcr?=
 =?utf-8?B?VytoZk9tTEhNM2czVyt3YzU4WjVtUkRnZzNUK29LblhpVlg4YkZ3RDNON1Vp?=
 =?utf-8?B?cHBRei9GT2pBNDhxbllyaXFHc05BaHlGejZ6Z2JxcTdtSnpxeFRjQ01xdGU2?=
 =?utf-8?B?ay9EV2RYdUR3dytuMVVtTW9CdjVBV2t4ck1mSmFaN2w2WnFtN3ZvRzg5MlJl?=
 =?utf-8?B?cDZ2T1dvc2V1WFFOWURtdzVXenRwK1Y1Q1NXT0xJVzR5TmZGUHpubzBMVUdm?=
 =?utf-8?B?azNYRFZhNUViblZheUNSU2JhNTJRbVRnVGxtRWV1dEJmbGMzb3hNRXV2OGp4?=
 =?utf-8?B?WGdCRTl1Ri9IdS9oblJWdDJ6SUhWVFEwaGNFVU84S3plY2o0WGt5MnEvT294?=
 =?utf-8?B?MDVSVndvdWJpUGJOL2YvbFBDd09DQUZETkdYOWRxV1YxcFN0d0RWVmlYWGtR?=
 =?utf-8?B?Vmg1dnRldTAwaUpTWXNkSXlFU0hlQkVtSmpsQ0dycHh0U0RqMFh2VFI1WU1U?=
 =?utf-8?B?SVdFQnNWYWRkSkhDb0FMZUwvbE1DRmoyZ082Ym5qMlJEZWxEK25LTkEydkpx?=
 =?utf-8?B?d2N5YUhmcG5rZ3JCekNNbUlrbTVPNU9qcTFNTHRRcUJjbytnbVNoaVZpNEFU?=
 =?utf-8?B?RVV1d09kNzhuNXdTTDNpTDRnYnJ6cEZSMmw2clJRSWJuOEJlVTRraTlDYVFK?=
 =?utf-8?B?Yi9CVXBhTUp2c2RReWpzd3dZN2NJMExHRWpJYXg4dnlLRWx2V0Qza2xjakxE?=
 =?utf-8?B?L0xkSWJZT2lLdjNWOFo3Z3pLaTgzZ296Y00xdnBVNUJod3laSml0aktOL0U2?=
 =?utf-8?B?dGVQQ2xIZW4wY0tqNnZGYTlsb2tzZFNQTlJ1WGI1aFZGaWc0c3NUQmtla1Mw?=
 =?utf-8?B?cCtGOU90eldCUC9nUTJLUk9XSy80WG1Tc3Q3akpDOU1qYkpCM0JaNXhSNnI4?=
 =?utf-8?B?YWVjZ1BwZC95enkzUGxEQzUxejBYdCsyL1dwcEZMN1hFbFZpcFA2ZVYzTG1Z?=
 =?utf-8?B?cFoxdHFOend1U2xITFNzdEJWZVJyMGpTcytmSEl5amlBODErU01Jc3BnT2lM?=
 =?utf-8?B?cWsvYVowSlZjWXZveXdxdW1DcGR5ejVsMUlSeXhPQkFOdmpoRU1vV1lrZjd3?=
 =?utf-8?B?azFTU0hLbnJGNnBqd1kzcmVWZFdRLzFTS0lvU0xCSE1JOWZ4UTkyUDRmNThC?=
 =?utf-8?B?UlhnQkRWVkxMdE1xTWZoUGhBakh1NHhjZnhLTG9ybWxYazZnM0IvNFJEZnE3?=
 =?utf-8?B?dDdyMkZKaXROMHBZUmVHQUFPcHY5cUhMYVlnemlZUnFEOHFFTHNwV0VXMkVh?=
 =?utf-8?B?d2R4V2E5T1ZMd3JIdFZhNEtyUUJJV0hVMDZmZmlMV0JwTTRiQjk3MzFUMmRT?=
 =?utf-8?Q?XUkxWhoblwaJ9hKwJNOXsYX8Km/Dub+HpFgi4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N3JuS01VOFFvUW1VaEdaWkxxZEdoOE9TVkQ3V1hPWUNWODgrZ0NVVEVYMmNo?=
 =?utf-8?B?em1HYWhtVEx1cld6TGpuM256RkdoMG9HOWYxcmVzemJpdHZMT1J6UURLS1Fy?=
 =?utf-8?B?a3N5Ni9SNVRvUGtvTHVQS0lVaitBTnk4VlVxM1JxWSt0WU1VeVVMMHQ0U3E2?=
 =?utf-8?B?NjVJclVRVDVLTk44TnFwWWRrN3dVR0h5QVBCZFV6WThOTkhIbnd4cXNPWHow?=
 =?utf-8?B?UXJOcHNaa2NHNllMMUQ0YWZuclhkeGJaa2JZTGVyOS9CcDZXd0kxVkpNMWZG?=
 =?utf-8?B?TkFrdnl1U21uWEY5RFFCVHorR1k0aGJyVVk1WmtSV3dnbENMdEtDNVByWWxq?=
 =?utf-8?B?a0pRN3lGMmFSQ3krOVZSUjdONm1xbXMrZVd3c3lPM3RjTmhQcUt3R2g5Wnlh?=
 =?utf-8?B?U2tYN0EzVS9SZFRtMGFEZVlvT1BRN1lZNThwMkNlbWd4QlVFbFRlaU9RV2NL?=
 =?utf-8?B?bUE3VlhaTGdoVXBsbGRFNmJucTNSYWE3WHd5bXZ3T2U3RXFaZE9YdFBoc1ZS?=
 =?utf-8?B?cUlrUXMvVld5bENsRk9PRDVJcndhYXVuYk50Qkx4WTYzV2FLQ3ZiZ1dhbWU5?=
 =?utf-8?B?Y2xBUXZNNXR4ck02c21USUlaTC80MEZjYWZaNS9haHg0WS9hSnYxRGttbkx5?=
 =?utf-8?B?RmtjendEMUZTRzFOeGpiclpxNTZEclVWR0VjK0orOXNyU0pFYlNqNnE1ODZH?=
 =?utf-8?B?blJzVVV1ZG1GaGlRNGpZRHVwT2ZBSFVQeXJCZGU4MnlRVWhBWjM2L2phLzJt?=
 =?utf-8?B?azM0V2hnRzZQMWk5eG9WeVBkSVFZUkdzVnUrVDhoQ01iY3VGaU5oY3M1TjJN?=
 =?utf-8?B?RSsxMjVha0FuOU5rTUpMR3F2VHVRcXNCYkZNaytIN1QwYkN4a3lXS3R5c25X?=
 =?utf-8?B?OGkvWGVLUVR1QndtK1QvU0YycUE2enVIUVhoSGxLRW8vSUtuVHVaMjcvRG44?=
 =?utf-8?B?TXhnNWNYSXFKL3NQZEJrMUdqcFdkM2VBMnRJSkV2ekZ4ano1N1Q2eGRhUERP?=
 =?utf-8?B?TXgvL0NDaTBRamN6SUFmYjBSRTQ4TjB6RWtnVkdBYUU1VWRrUVA1VDQ4NUdq?=
 =?utf-8?B?RmhGeE1WOTBZQlk4RWdqemNHMzVMWEQybEVzc2gxNytMOVIxd1I1a2hDU0x6?=
 =?utf-8?B?UFFhYi9hS2hpbkt4MFltamVaQnFzdkhmSnp5SnhxZDFGNlhqK3VzaHNFN2xW?=
 =?utf-8?B?djcyTldQVUdkUFJhYTVLbGdyY3VPanREWkhZN1o0NkpPUitieDNFTHZwOTh2?=
 =?utf-8?B?SmVLOEJ5RUorUU1OaU9wbjhlRndndzdjYytveFBsSkJuZXhJcXA3N2xGT0RV?=
 =?utf-8?B?ek9vVEd4WlBiZTZENjZ5cXFCQkhaT2V3MXFjenRxamZmc0lXY25SUFp0SXkv?=
 =?utf-8?B?NzU1ZTlDK0VzLzg0TUFlSUJMODNlTXB3Vm5aL0dQa0ZESk1TaGJ0QXRIME1F?=
 =?utf-8?B?UEk4VjVwbkdXc2I5MUVQZlpqWG1BVW9tZjd3VWYxalczaFVrRzlPNy8yd3ZM?=
 =?utf-8?B?ZVJYcVRrOGdQdmJvV29tRG91VmFLTFlLM2ZHQVoxNlpSYS9TY0pGTkZremJn?=
 =?utf-8?B?NlA4RUJHT3NPRVUyZWU4TlgzdXRnUkUvc0NnMEVKb0VxMnFvMVFqMmRNYnlk?=
 =?utf-8?B?L0ZEQXJieTNZQXZkckxwZWh2ajFTM2ZHRHhDa3p5OUlWVU5EZWNqd2lTWHNv?=
 =?utf-8?B?N2RML1NteUdMbnYyU2E0WENCZm1Lc1pBSmtyNEFqRERGeXNycHQ4NkRyU25R?=
 =?utf-8?B?bGFoUDA5V29mcmlBTkpYUTMrdk1Oek1mVVFObis1WE92dWZSRVFodFk1UVI0?=
 =?utf-8?B?cDVId0lRb0h6OFh1QjhucUJPbGE3R1ZhVDl3T1BiUDVWbnFuaGp5MlZPcHBo?=
 =?utf-8?B?ZitjQUorVWJKci9ScGJGOC8zcG9hckx0ckRHSmplQkp2Vk5qNi9hNmxtS2wv?=
 =?utf-8?B?RTVaSC9DcUpweXhpcDEyemRaRGFCcFFkTG91ZHlIbWp3amlicmdQUVJsNHdq?=
 =?utf-8?B?aUdRU1R6WTBZK0w4a25BTnRtcnV4QVBVcHl3Kzhlckk3clprRTlSdUg2cFlt?=
 =?utf-8?B?bW9JbHJGMVJkTzJId0lzSU1lc090WWxXaVc2VEZDQ1Bqem9iV2VOVzNPMkZk?=
 =?utf-8?Q?3E6QTt1G7cmgGjXvt0dfpvtt4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ced3843-a245-4cb9-0a1a-08dd10a463d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 18:33:59.2003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBD2HSCeGf00ZgjYgKpnsxB+bPEReVACnvQrnFIm/TYgFt1QOpf+kOt72mXCE0r3A5tMYzBnRf8uYP/jkzj+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 18:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208031

UmljaGFyZCwNCg0KY291bGQgdGhpcyBiZSBxdWV1ZWQgaW4gbWFzdGVyLW5leHQgYWdhaW4/DQpJ
IGhhdmUgc3VibWl0dGVkIGZpeGVzIGZvciBweXRob24zIHRvIHN1cHBvcnQgb3BlbnNzbCAzLjQu
eC4NCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21l
c3NhZ2UvMjA4MDMwDQoNClRoYW5rcywNCiAgUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkNCj4gU2VudDog
VGh1cnNkYXksIE9jdG9iZXIgMjQsIDIwMjQgMjA6NTYNCj4gVG86IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29t
Pg0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdW1BBVENIXSBvcGVuc3NsOiB1cGdyYWRlIDMuMy4x
IC0+IDMuNC4wDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4g
U2VudDogVGh1cnNkYXksIE9jdG9iZXIgMjQsIDIwMjQgMTI6MTQNCj4gPiBUbzogTWFya28sIFBl
dGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+ID4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgU3RldmUgU2Frb21hbg0KPiA+
IDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBv
cGVuc3NsOiB1cGdyYWRlIDMuMy4xIC0+IDMuNC4wDQo+ID4NCj4gPiBPbiBUaHUsIDIwMjQtMTAt
MjQgYXQgMDk6MTkgKzAxMDAsIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjQtMTAtMjMgYXQgMjA6NDggKzAyMDAs
IFBldGVyIE1hcmtvIHZpYQ0KPiA+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
PiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+ID4g
Pg0KPiA+ID4gPiBSZWxlYXNlIGluZm9ybWF0aW9uOg0KPiA+ID4gPiBodHRwczovL2dpdGh1Yi5j
b20vb3BlbnNzbC9vcGVuc3NsL2Jsb2Ivb3BlbnNzbC0zLjQvTkVXUy5tZCNtYWpvci0NCj4gPiBj
aGFuZ2VzLWJldHdlZW4tb3BlbnNzbC0zMy1hbmQtb3BlbnNzbC0zNDAtMjItb2N0LTIwMjQNCj4g
PiA+ID4NCj4gPiA+ID4gSGFuZGxlcyBDVkUtMjAyNC05MTQzDQo+ID4gPiA+DQo+ID4gPiA+IFJl
ZnJlc2hlZCBwYXRjaGVzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBN
YXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoC4u
LmtlLWhpc3RvcnktcmVwb3J0aW5nLXdoZW4tdGVzdC1mYWlscy5wYXRjaCB8IDUzICsrKysrKysr
LS0tLS0tLQ0KPiA+ID4gPiAtLS0tDQo+ID4gPiA+IMKgLi4uMS1Db25maWd1cmUtZG8tbm90LXR3
ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoIHzCoCA0ICstDQo+ID4gPiA+IMKgLi4uc3lzcm9vdC1hbmQt
ZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBhdGNoIHzCoCA0ICstDQo+ID4gPiA+IMKgLi4uL3tv
cGVuc3NsXzMuMy4xLmJiID0+IG9wZW5zc2xfMy40LjAuYmJ9wqDCoMKgIHzCoCAyICstDQo+ID4g
PiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkN
Cj4gPiA+ID4gwqByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL3tvcGVu
c3NsXzMuMy4xLmJiID0+DQo+ID4gPiA+IG9wZW5zc2xfMy40LjAuYmJ9ICg5OSUpDQo+ID4gPg0K
PiA+ID4gVW5mb3J0dW5hdGVseSB0aGlzIGNhdXNlcyBhIHJlZ3Jlc3Npb24gaW4gcHl0aG9uMydz
IHB0ZXN0Og0KPiA+ID4NCj4gPiA+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG9wcm9qZWN0Lm9yZy8j
L2J1aWxkZXJzLzczL2J1aWxkcy8yNzANCj4gPiA+DQo+ID4gPiBJIGRpZCByZXZlcnQgdGhpcyBw
YXRjaCBhbmQgdGVzdGVkIGEgYnVpbGQgYW5kIHRoYXQgcGFzc2VzIHNvIGl0IGlzDQo+ID4gPiBk
ZWZpbml0ZWx5IGZyb20gaGVyZS4NCj4gPiA+DQo+ID4gPiBJJ20gdHJ5aW5nIHRoaXMgaW4gY29u
anVuY3Rpb24gd2l0aCB0aGUgcHl0aG9uIDMuMTMgdXBncmFkZSB3aGljaA0KPiA+ID4gbWlnaHQN
Cj4gPiA+IGxldCB1cyBmaXggdGhpcyBmb3IgbWFzdGVyIGJ1dCBpZiBzbywgdGhlIHByb2JsZW0g
Zm9yIHN0eWhlYWQgYW5kDQo+ID4gPiBlYXJsaWVyIHdpbGwgcHJvYmFibHkgcmVtYWluLg0KPiA+
ID4NCj4gPiA+IFRoZXJlIHdhcyBhIHJlbGF0ZWQgcHl0aG9uIGJ1ZzoNCj4gPiA+DQo+ID4gPiBo
dHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vaXNzdWVzLzg3NzQzDQo+ID4gPg0KPiA+
ID4gQ29weWluZyBTdGV2ZSBzbyBoZSBrbm93cyB0aGF0IGdyZW1saW5zIGx1cmsgaGVyZS4uLg0K
PiA+DQo+ID4gVGhlIDMuMTMgdXBncmFkZSBkb2Vzbid0IGhlbHAgc28gd2UncmUgZ29pbmcgdG8g
bmVlZCB0byByZXNvbHZlIHRoZQ0KPiA+IHB0ZXN0IGlzc3VlIHNvbWVob3cgdG8gbWVyZ2UgdGhp
cy4uLg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiANCj4gUmljaGFyZCwN
Cj4gDQo+IEkgd2FzIGFibGUgdG8gYmlzZWN0IG9wZW5zc2wgdG8NCj4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5zc2wvb3BlbnNzbC9jb21taXQvOTMzZjU3ZGZlMjE2NTdmN2FiYThmMTNlMGNkYjNi
MA0KPiAyZGQ2NGZjYzMNCj4gV2hlbiBJIHJldmVydCB0aGlzIGNvbW1pdCwgdGhlbiB0aGUgcHl0
aG9uMy1wdGVzdCBzdWNjZWVkcyBhbHNvIHdpdGggb3BlbnNzbA0KPiAzLjQuMC4NCj4gSSBoYXZl
IGNyZWF0ZWQgaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy8xMjU5MzYg
dG8gaW5mb3JtDQo+IGNweXRob24gbWFpbnRhaW5lcnMuDQo+IEkgZG9uJ3QgaGF2ZSBlbm91Z2gg
a25vd2xlZGdlIHRvIGZpeCBpdCBteXNlbGYgYnV0IEkgdGhpbmsgdGhhdCB0aGUgb3BlbnNzbCBj
b21taXQNCj4gYnJlYWtpbmcgdGhpbmdzIHNob3VsZCBiZSBncmVhdCBsZWFkIGZvciBzb21lb25l
IGVsc2UuDQo+IA0KPiBEdXJpbmcgdGhlIGludmVzdGlnYXRpb24sIEkgaGF2ZSBhbHNvIGZvdW5k
IDIgZm9sbG93aW5nIHByb2JsZW1zIHdpdGggcHl0aG9uOg0KPiANCj4gMSkgd2hlbiBydW5uaW5n
IHB0ZXN0IGluIGNvcmUtaW1hZ2UtbWluaW1hbCwgdGhlcmUgYXJlIHR3byBjcmFzaGVzIGluIGNv
bnNvbGUNCj4gKGJvdGggd2l0aCBvcGVuc3NsIDMuMy4xIGFuZCAzLjQuMCk6DQo+IFsgICA5MS40
ODI0NjFdIHB5dGhvbjNbODYwNV06IHNlZ2ZhdWx0IGF0IDEwIGlwIDAwMDA3ZjViMDc2MGY1NjEg
c3ANCj4gMDAwMDdmZmVkYTEyYzQ0MCBlcnJvciA0IGluDQo+IGxpYnB5dGhvbjMuMTIuc28uMS4w
WzFhZTU2MSw3ZjViMDc1NjYwMDArMjNjMDAwXSBsaWtlbHkgb24gQ1BVIDAgKGNvcmUgMCwNCj4g
c29ja2V0IDApDQo+IFsgICA5MS40ODUyMTNdIENvZGU6IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAw
IDkwIDQxIDU0IDU1IDUzIDQ4IDg5IGZiIDY2IDQ4IDhkIDNkDQo+IGM5IGQ5IDM1IDAwIDY2IDY2
IDQ4IGU4IDc5IDkwIGY1IGZmIDRjIDhiIDI1IGNhIGQ3IDM1IDAwIDQ4IDhiIDAwIDw0OD4gOGIg
NjggMTANCj4gNDkgM2IgNmMgMjQgMzAgNzQgMDkgZjYgODUgYjAgMDYgMDAgMDAgMjAgNzUgNGIg
NDggOGQNCj4gWyAgMTE4Ljg3MTA1N10gcHl0aG9uM1sxMjIxNF06IHNlZ2ZhdWx0IGF0IDEwIGlw
IDAwMDA3ZjdhZDVkZDI1NjEgc3ANCj4gMDAwMDdmN2FkNTBmN2RkMCBlcnJvciA0IGluDQo+IGxp
YnB5dGhvbjMuMTIuc28uMS4wWzFhZTU2MSw3ZjdhZDVkMjkwMDArMjNjMDAwXSBsaWtlbHkgb24g
Q1BVIDIgKGNvcmUgMiwNCj4gc29ja2V0IDApDQo+IFsgIDExOC44NzM5OTFdIENvZGU6IDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIDkwIDQxIDU0IDU1IDUzIDQ4IDg5IGZiIDY2IDQ4IDhkIDNkDQo+
IGM5IGQ5IDM1IDAwIDY2IDY2IDQ4IGU4IDc5IDkwIGY1IGZmIDRjIDhiIDI1IGNhIGQ3IDM1IDAw
IDQ4IDhiIDAwIDw0OD4gOGIgNjggMTANCj4gNDkgM2IgNmMgMjQgMzAgNzQgMDkgZjYgODUgYjAg
MDYgMDAgMDAgMjAgNzUgNGIgNDggOGQNCj4gDQo+IDIpIHB5dGhvbiBwdGVzdCBwYXJzaW5nIGlz
IHdyb25nLCBpdCBkZXRlY3RlZCBvbmx5IG9uZSBmcm9tIDggdGVzdCBmYWlsdXJlcyAoc2VlIG15
DQo+IGNweXRob24gaXNzdWUgYW5kIHB0ZXN0IGxvZ3MpLg0KPiANCj4gQ291bGQgc29tZW9uZSBj
cmVhdGUgQnVnemlsbGEgZW50cmllcyBmb3IgdGhlc2U/DQo+IA0KPiBSZWdhcmRzLA0KPiAgIFBl
dGVyDQoNCg==

