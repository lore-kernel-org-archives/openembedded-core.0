Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B20C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 20:27:46 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web10.611.1716323261811509986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 13:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UzBk5JsD;
 spf=pass (domain: siemens.com, ip: 40.107.8.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvtZdrsmpihO4TY6OO57mcDbzD7o5rjIhYfPv6dok92+LX3KT+l5qavQgciNEi203xPxwhRQObVI4uY9JWBUg/ooG1z9NWfDrUBADBcSSmNq83CFgI65irFDONBHFbjjkVHVq+RJAkW0QwdZ0uGilhfUmBVzfGlZm7AVmJRW76g5yjhDSGiZn7iHR6UeucGDXYoxICDTOU4Qw/pcqsUtH9UJos889qQt0zMGgaFTf5QkTuEws9L7S6kqPE5k7ti9xCb+X8XFA4nSfo6OLeSQEEebpYrF4gaTvIdqui43dQyZlWTwGy4h66N7s1QOtczOZriIBU2fxIGohjKhuRyHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B1TDyvKhzI3yenYQ80GklwhYSCpePSiFda2WFzU48w=;
 b=YTk/YkZRUS8P+kQnS5LY/P1NC9et+Xz+L6QNQfvDkS/TLIrf4I6iMwAN67I19Kl5/sm4Z4Fp85PCHles1/i9R78+1XbqxUzFihGk8v8JY8qjUv7CjJSzB4aspuasll36ip5z0UseuHERPZzenGGtuPz94FlM34o3dJg6OxY3x92knsNjyfsYkBvfo/MkSRNRAYcTsaeeQl+AhqoRwyy8mkShy+jMTy8HntXGWvRmW/Fvs0nCCB7izo6y3n/aygC0BrOvAhDPcxW1aiHB2wVzaXslLRTWTztRW096SN6dPix/kcVt0Wp6KC3KbzDewfae3bLwg9ipaT2wldIPv8Quxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B1TDyvKhzI3yenYQ80GklwhYSCpePSiFda2WFzU48w=;
 b=UzBk5JsDrmMi7YL5b+ZaFnnGw4iF4CfFRTCqu0HEB9ExaK8DH/skdw0A63fAGJR0KDn1xDCaP2KHaDE09jDuq4aw3euHsNJPrJUvCj1SJP7ILaD3oa/e/vmx0YbGsb9haOioVN0l9k4mqS/q02uIhgp99sumJc1qGRPoolm77QjBUHpl5l/a2fTyHd5iCF6i1ACensiScp2iTTxf2cO6MGcDIuDtxwySC6HPFECvgA70z+LPYtbKBhA9oROVrPS7H64783WzhfIhZQ9yl+uPdocqCsRF04V/46WD/9t0ZVoZcvgDu/+r8UqRZnB+/8BOxlTED+8DJB63ol+BA+X6mA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6573.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 20:27:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 20:27:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] ncurses: switch to new mirror
Thread-Topic: [OE-core][PATCH 1/2] ncurses: switch to new mirror
Thread-Index: AQHaqWqnM5JSS6yj202DJz6gAqY4P7GhfTEAgACSfICAAAhmgIAADswg
Date: Tue, 21 May 2024 20:27:38 +0000
Message-ID: 
 <AS1PR10MB569740EE17E630660EB69AF1FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240518212954.788524-1-peter.marko@siemens.com>
 <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com>
 <AS1PR10MB5697E1CD2E2A7DD06150D96BFDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj-OYGdScmGziYkH=QrCu0sCVkE4K1dv6fQy-mgPpuLk6g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-OYGdScmGziYkH=QrCu0sCVkE4K1dv6fQy-mgPpuLk6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d460aa88-393b-4070-97e1-fe2648d178d3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-21T20:24:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6573:EE_
x-ms-office365-filtering-correlation-id: 9f18a530-2357-4c4b-c25f-08dc79d474e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RlhjYjZPckQ0S3orcXJEV2N2SXd5M1F0L25xSGU1ZU8vR084YnpWVmJPbUFi?=
 =?utf-8?B?U3VCZWxya3VCUWlnZVVjelV6R3F5clEyV1kveVNCRjd2ckhxTUpCR3hDU2hB?=
 =?utf-8?B?dlFGNnIvR20yQUlSdTFLMnlwUWxlcjFaOUJBS2tGN0RRLyszM1FpWUF3WWRi?=
 =?utf-8?B?NHdyejdmZFROb3RrRVdHMzFVenNrYlhpMzlKR0VkME9MdGV0blIyWHdMYXRV?=
 =?utf-8?B?NkJqWVc1SnRvaGRWd1RtMWpCa0d1UVNSTUVMUjk0Wjcvb2dnUDRhUWI0a0Yw?=
 =?utf-8?B?Z0FwQkNCeEFUU2I3T0VkUDdtTHN6VkJNMm8zNkpUclQ2OUUvbFFJZWdxWU9R?=
 =?utf-8?B?b2JRclF2MXgyczlmaGE4LzRZRnYwS0U5T2pXVVhPVCtVOVBCcFpMSjA0RTA0?=
 =?utf-8?B?ZkNpU2NQd0U0TC9TUm5HU0VkY000QUJ5UmUyQ3c1RHRnSURJZ0p5bitsMXRq?=
 =?utf-8?B?TWc3VFl6bVRXK04yTkJaZ3NaaHVWSDVteldNdWRtYXJaT0F5Z1l0SWNpWjJB?=
 =?utf-8?B?RHdiZ3ZUM0lPdXhzb3dmTjRsWkpCSFRob1J2amd1RXZGNEc1aVltN0hhWld6?=
 =?utf-8?B?QTBvYVB0VEJtRFZ6VlJTK2VxYmpHeURPMHA1NExBVkc5eFlsRG5KakNWcG41?=
 =?utf-8?B?RzVaZnNqU1RCejhyMVJTRmVnSG5KdE1WTGcwV1pOd3JEbERiOFJZTkpra2xY?=
 =?utf-8?B?RzdoWWhUMVJpZkRNWFdvTGJCQ1BxQ2xWOTFQSStVaW43akdtYnI2a1JNL3hN?=
 =?utf-8?B?ZzFuUDFlSEFoczI4MERYMmlkNUJ3SllBVEhUU1JJdXd3SDdTSmpsajg0TDFB?=
 =?utf-8?B?WEw1MUJZWUpCc05jbmxxZitnbmc1aHBET3lPVjUyYjNBSWU2UG9FVXZCbExr?=
 =?utf-8?B?TzM3Y3dHTkpyTnhPNWNvZENiODZKOE9kQ2lmSTJxVlpaa0d3RGpZb3RIU2o4?=
 =?utf-8?B?SEdiOExzdzhUWmtUM0FkcEdhWWpySzU1aUxDNzE4Z2RJWllwQjZTTGNNNUFS?=
 =?utf-8?B?L3h0UVZ4THZnckhoMTNjWmpKV3psdVA5S1VoZndTVzZiVlAyVlIremcrMjRN?=
 =?utf-8?B?TWliYnJNQ3RnSU5pTUJvcHgrL3kyT1lxZjlQNGdNblBsQ0NWQmVjTS9wUDdO?=
 =?utf-8?B?bnpRby9qSDlwN3ROTGIrZnRJZGxkZ1ZNVDYzaHVEcGt1Tk5tcW9sTFdLSDlM?=
 =?utf-8?B?ZmlIa2ZKZ1lwMUVwenRhcmtGY0s1N0cyQW9RdzdicWNZYU1SV21ncGFJdkFS?=
 =?utf-8?B?d1FBQ012QzJzdFkwNmVxV2JubHBXV09VK245dVJORUlPY3JGenNzRkhEUGw1?=
 =?utf-8?B?YTE4MGdlZ3V6Z1FTN3FwbU55SmhyNmQxVW1yT2pGTGt4WDFaWWhvUm5wcHl6?=
 =?utf-8?B?em1Hb1ljMXAvbTJFdTN3K3Fyc2lNTHRBVWZGTU9qVkdodkg2d0Y2OGtoVUZk?=
 =?utf-8?B?LzRHS2Z3Q3pjVjRGMzBqVlRwUUxlREg5cEgxeFpEUEJFenBueDJ6VFh0U1VJ?=
 =?utf-8?B?UTNlcU56MHFvQ1FzT25hQUFSdkk5eHgxL3VOTHU2UkxXazk2cTIxbW1abHN0?=
 =?utf-8?B?djRsSGhURi9sUWQ3NzdydVYwMkNsV2FNNkFtd0tiMEVIK0JBREtPZkhpUmdT?=
 =?utf-8?B?QlFCMFpKSWtQdVdGeTBsdjc0dkJuNGtLRTc0Um5XV0pmTGRpQ1o2bUJ4eUlV?=
 =?utf-8?B?aDljZ3BGNVRUbGJ1TWhzWUNLYVJ4ak1sTUl4bTdyM3BEdUxGSDBVR2RnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TjY5enYyN29ua2VnZjRPNitUa05XdmNFaW9MSEV4L0lhVFh6UzlxRjFISjFq?=
 =?utf-8?B?ZllFN2w4bGp4K3pKeTNCN2ZkVUtzV0lJQzdrc2R4eXIxN0NqSW1TVE1xeW53?=
 =?utf-8?B?YU0yVHo1UDRPYXZET2FYYm1uWmJDRXdWZnZXTEZRVFZJdU5tZGZlOU5jdy9z?=
 =?utf-8?B?TXN0UkNhS3dzbGJ6Ym1DaGUyWkg4a21udS96Tml5a205VlluK0szekFSaGY5?=
 =?utf-8?B?YURkM3VJWTlYKzdEcVVCcmdNcHhFb3V4NWRWZXhKZExENnJPdlYrRmNWMmRX?=
 =?utf-8?B?UVlERXNRck5FYXhRWlc3SHNOYUprVWd2T1ExMVNKRE1ST1BJbG9mODF4MWlN?=
 =?utf-8?B?Tm5EVWFCMUdDc2J2ZFpLaGV0bm5laUh4UmQ4M28xRS9CTjV2QTI2VVFaaTJj?=
 =?utf-8?B?WGtRSm96QktZSFJRejhVT0I4U041VEZCWFdqeUE1WXRFcEdpU1pVYlE3ZkJq?=
 =?utf-8?B?c0dET3BWSkhFZmcyaTdyTkN2N3JudUdNT29LWCtuR2pGNmNhQWg4ZmlodTZD?=
 =?utf-8?B?aWVxOU50dlZSSGJ4UW5yNXRyNndwL0p3UFNZZGNjbm5NVnVhVzZ6S0hFN0Yz?=
 =?utf-8?B?YUJHS2JwN0pBa2VqZ1hnOXJmZlhBVlU0MUQ3T0NXMnZIRFNtTnNQR3Bpakxp?=
 =?utf-8?B?SDkwaXQ2RzcwUEQ4S0w4ZDBQMFRUazFDOUkzckMxb1E0LzMyQ1kvQTRUeU1R?=
 =?utf-8?B?dWxhMHMyU3NreHRzUW4xQlBsQVlBbS9yejFrMTRNUkh0S0hQcDh5NEx4NVVR?=
 =?utf-8?B?eVlrbExka0Q4RzA5VzRKMjVlRUZ3Uld2Y1VQSFFHZGpmVmNBRE8zZktvVXhm?=
 =?utf-8?B?NHlZdnl4cFc3UEd4TjRqMnVQMWdXcXRPcnVNM1lDQ3hRYWsrVForWkhTWlRr?=
 =?utf-8?B?dlUrWWFqTHY2QmhydzlHVHFJQUlZS2RTek9NOWgyY1FHNERUVWdPNENHekl5?=
 =?utf-8?B?NDJCQ3hJQ2Rab1NFQ0lGV2pISmZrNHM5K0k1aVp4UDJ2dnhkb0dVa203Vmw4?=
 =?utf-8?B?ZzU1VmFpR1h2L3JHLzJ6dVZ6ZHBNdVZMRy9jTFRKaGh0T1h4NUU1b3d2UDZt?=
 =?utf-8?B?bnlNQVJ5dExoME5hVGl2dU90dmxKZkFnOWNIanBNakgvRldvODZNcU0vMnpo?=
 =?utf-8?B?QU9nNmo1aG1obzZ2eENDL25OdEhYU3k5eDN4d0pORGZWMXExSGttendDTVo1?=
 =?utf-8?B?SUFTV1lqSFBJYVlraWVteXY5OVVid2pHdTE4K3k2OHJaUTdBRDJpNitHU0ky?=
 =?utf-8?B?VytRdDV6TndLN2MvYVpqMkl0YVFrNmpnY2IrTkpnVUVOQTlvUW5hTDhUOTR4?=
 =?utf-8?B?SCsxMTM0ZFF0enRnV0RXT3NNY0J4aFFzSjhrYVhLRXhkeFBVNUZ1amxpSGtI?=
 =?utf-8?B?aDdVQ0JXVmJVS0pDWFd2ZDhjSHJFNjIzcmhkaUVhR3lUWXZETy9aVmF1RXlG?=
 =?utf-8?B?NjBvN21ERkcybXVTMDNxZEVJWU15NnhtWjNiRCtxRnlFUkxtNG9TR1hqZjls?=
 =?utf-8?B?Z3IvZ1UyYlNIR0xDcDVDVDRQVGxqUTZMRjFKc1ZQaWRsSUhadmx3cjRGL04r?=
 =?utf-8?B?UisvVFgxWG5tTXB2ZGluaDE3bW1zRitwVVJVQXhORVRsamNmbVBGdVpxSGRZ?=
 =?utf-8?B?dkhMaU5GUHM2QlhwdFYrRDdTNHFNTnd2ZFVlaWZ1TDFlaXc1eDgxakJha0VR?=
 =?utf-8?B?NENPNVhXTVQvUjRLODc5RUVIMWYyUXpDcnN5RmE1ckJlaytvM21WZEEwYnRU?=
 =?utf-8?B?bkRrK1hRSWhSVXArNUlrbFRqUGp6bmpKZFRmcDJFeHNNUE1YQ29ubVlqWWp5?=
 =?utf-8?B?S05LSFlQMklKR01QS28wQzFZYmtLbWNkWld1c0xzeFY4QVBLdVJ3MHV5Qmxz?=
 =?utf-8?B?SjducUtBeHdzbm1ncXdBc1FESFdHMTdWVStveUplcVhOYmh1ZU9SREZMSFhC?=
 =?utf-8?B?Tk1qdjA5OHpncXUxQ1FSb3V5ZEQxVWt0ZDlPbkRPQ0lTM2xlcW8rSXVGYllN?=
 =?utf-8?B?VmV3WGxGenFuM3M3djRsZlViWTdnT1RpU3NWR0JaTkFvUTIzY29qWllTU1hL?=
 =?utf-8?B?Z3N5SVQxNFNFOXE2OHVJelA2anNTUURZaFpTNG9IVDRwTTlYM01qbDliMlAw?=
 =?utf-8?Q?Le66Y6B9kWVFIhjYY77M8KgPX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f18a530-2357-4c4b-c25f-08dc79d474e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 20:27:38.0608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVZdyfMnlysqy5uMSA5R0OCj+nyTYGNiiguMyT8gzBzWGjiE897Im21b7QJAOMMAHpJQCux/OlHTbGWK+IslJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 20:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199674

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE1heSAyMSwgMjAyNCAyMTozMQ0K
VG86IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMu
Y29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggMS8yXSBuY3Vyc2VzOiBzd2l0Y2ggdG8gbmV3IG1pcnJv
cg0KDQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgYXQgMjE6MTcsIE1hcmtvLCBQZXRlciA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+IHdyb3RlOg0KPiA+IEkgYWxyZWFkeSB0aG91Z2h0IGFib3V0IHRo
ZSB4eiBzaXR1YXRpb24gYmVmb3JlIHN1Ym1pdHRpbmcgbXkgcGF0Y2guDQo+ID4gT25lIG9mIHRo
ZSByZWFzb25zIHdoeSBJIGRpZCBub3QgZ28gYmFjayB0byB0YXJiYWxsIHdhcyB0aGF0IEkgZGlk
bid0IGtub3cgaG93IHRvIGNvbmZpZ3VyZSBBVUggcmVnZXguDQo+ID4gSWYgeW91IGtub3cgaG93
IHRvIGRvIHRoYXQsIHN3aXRjaGluZyB0byBpdCBtYXkgYmUgYW4gb3B0aW9uIGV2ZW4gaWYgdGhh
dCB3b3VsZCBtZWFuIGhhdmluZyB0byBjaGFuZ2UgdGhlIFVSTCBvbiBsdHMgYnJhbmNoZXMgZnJv
bSB0aW1lIHRvIHRpbWUuLi4NCj4NCj4gQ2FuIHlvdSB0ZWxsIG1lIHdoZXJlIHRoZSB0YXJiYWxs
cyBhcmU/IFRoZW4gSSBjYW4gY2hlY2sgaWYgdGhlIHJlZ2V4IGlzIGV2ZW4gbmVlZGVkLCBhbmQg
d2hhdCBpdCBzaG91bGQgYmUgaWYgc28uDQo+DQo+IEFuZCwgdGhpcyBpcyBraW5kYSBvYnZpb3Vz
LCBidXQgbWF5YmUgeW91IGNvdWxkIGVtYWlsIHRoZSBtYWludGFpbmVyIGFuZCBhc2sgaWYgdGhl
IG5ldyBnaXRodWIgVVJJIGlzIHJlYWxseSB0aGVtPw0KPg0KPiBBbGV4DQoNCkkgaGF2ZSB0byBj
b3JyZWN0IG15c2VsZi4gSSdtIG5vdCBzbyBmYW1pbGlhciB3aXRoIGhvdyBnaXRodWIgcHJlc2Vu
dHMgdGhpbmdzOyB0aGUgdHdvIG1pcnJvcnMgYXJlIG1hbmFnZWQgYnkgZGlmZmVyZW50IGFjY291
bnRzLg0KDQpIb3dldmVyIEkgZmluYWxseSBmb3VuZCByZWZlcmVuY2UgdGhhdCB0aGlzIGlzIHRo
ZSByaWdodCBtaXJyb3IuDQpodHRwczovL2ludmlzaWJsZS1pc2xhbmQubmV0LyNmdHAgKEFyY2hp
dmVzKSBsaXN0cyBodHRwczovL2dpdGh1Yi5jb20vVGhvbWFzRGlja2V5IChvbiBnaXRodWIpIGFz
IG9mZmljaWFsIHBsYWNlIGZvciBzbmFwc2hvdCBtaXJyb3JzIGZvciBpbnZpc2libGUtaXNsYW5k
IGFyY2hpdmVzLg0KDQpQZXRlcg0KDQo=

