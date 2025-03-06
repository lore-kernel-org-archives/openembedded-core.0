Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324DFC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:51:52 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.43])
 by mx.groups.io with SMTP id smtpd.web10.10299.1741258310833680921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=LGcq1dXX;
 spf=pass (domain: infinera.com, ip: 40.107.237.43, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwvd+JobFnwxfc3eJTxAm7o7y8K8lbGF0PiyrJl+cVj3gV5H6zoJFrjXaGYyqA5fnLghmLHuq4v3EAuxmJOIv3W+pvNaDn96xecB5AumyCvNdhIIfwfAuwy1hf2Ie3vUlIHUTVD/8lDuD8uIKeLmAyf35IOCptf2tQMwekbWeJEFXpCvcJCRv7p8FacvoY4in3LCOWxzj9TI+5hyQ8qPD2WdVJeh4o9zI4DQrc1KG2L1f+PNE6byCgNbAaBQkhyto1simGpc+GUsu04MbPusiQG9zu6TFfyrwza4785jpk1ujZtdesRNhu+L6VOwZO7LdnEWv6LfP7c/wUIUl3wNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRR0JV0RBfXeF8mVcI1oIzq4BeK4we49ewLw/2e0Blc=;
 b=TAVQwpQO5XVVndBZdxvOVv+ALCWB/y/ksLYM8tPWlQNxIj5hULp2j7Kq4LcoHDXruqgQ3UR9KcHU2fbeAlE5WHXbvqU+oE4l9b3Xdt2X4kdSk0Fjkp+GKi7yEelvKJDg+ZYeqxHZF6aXQq0GJ3ECiDz3k4v/zhj+tPFmBjXpGPrxWqePaIjU9M+Zuw6CornPjuEBKtG++SdQqeKc9xVrzhSwQQbxKH3RcEJ3H+zPNZXmmKjSo3W8Rm5EZmB78AMtUDO+8NyVXNH0tvW1tw45EPIt0ztfptYpo68f1D4kzPxQe1FJpFutRflnufd76Kas173q1QcbGhe2j9LhVW4Vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRR0JV0RBfXeF8mVcI1oIzq4BeK4we49ewLw/2e0Blc=;
 b=LGcq1dXXdiHwNkkKp4ZmPRgnXG7dt59jGM0lijTmJOYzMd4FvSv+Q8O4kHfZwsx1bvpQ+fKo2AXnBInp42S8BeoKGn42leEWFL94MjwHVPXkiod63hne2cIgubwyyA1u/0ZNvrDRAPKBPhzB2xoEHGq7nz1WJF6BM4p/7BooMeLCBDDm8RWT0EjZSpLea1fprXC31761r+YvEDmwwPg90RVJjQv3YhWGWxII1wemV0B4VNRdLAd8yvPAmIZ/9g2g6rw4uFGRe3AnjBCYm1fVrksMwdf8Tjzsbg0oFQkkAO5eFXbr9WXQzG4Uzhm7QUx++38sBeqBUSsStDCF8JzaIA==
Received: from BN7PR10MB2610.namprd10.prod.outlook.com (2603:10b6:406:c0::30)
 by DM4PR10MB8219.namprd10.prod.outlook.com (2603:10b6:8:1cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 10:51:46 +0000
Received: from BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b]) by BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:51:46 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: scarthgap: lz4c is obsolete/gone in debian trixie/suse tumbleweed
Thread-Topic: scarthgap: lz4c is obsolete/gone in debian trixie/suse
 tumbleweed
Thread-Index: AQHbjoXBeslhDn9ydE6QCHXjgwY+7Q==
Date: Thu, 6 Mar 2025 10:51:46 +0000
Message-ID: <7fbe471ac48b8e92dd5c204825298bc894dd24aa.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.55.3 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR10MB2610:EE_|DM4PR10MB8219:EE_
x-ms-office365-filtering-correlation-id: a31a679e-acb2-4777-7dca-08dd5c9ce3c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UGtjVEhMY01kZmVBZmY3OWtTdTkvcGZORmZIN2ZITnFYME9IWTFpNWRJQ3A4?=
 =?utf-8?B?RGVIMEorOHBnR2VaZFhRMzA3SEJmNFNOWU1wNjkvWXhVQTRHMU51WXY3VFgv?=
 =?utf-8?B?NUJPbmNWTmVNY0o4Mnc4WnBJSzBxMUswQVh5dkhobkFHcmZYUVdxOWFVTmRF?=
 =?utf-8?B?eVRkTVBsdlVQaE94eXJ6Ymt4QVg4bFJac3NqdWQ1NUREMWcvZ2VDK2NkOVln?=
 =?utf-8?B?MGFIanVhQzdDMGhmWmszUkZwbVR3UWNycS9lUlBFWmt4TG5GME5ublpVaUIv?=
 =?utf-8?B?WCtkL0hndFFjaGR6Vnc3RndaUndFcDQyS05sb3pJRTh5Q1BxWkZQYStldHVE?=
 =?utf-8?B?NmFvYzZaUFM3NzRDTEwrMDFsRWNvaUN6YUpUejkybzgxR2tlRUpqd3MrSk1Q?=
 =?utf-8?B?L3h5WGRJaFhicElmV3F5Yjg4cm5mUDdaekdIY1RCRDlCTnRqWlFkcVJNaEU1?=
 =?utf-8?B?UUtMbmRkdnpXZWZDbk1EOW5rYjZtZHVXTm9Cak5ZaVVONlNLeldmd1N5VVZm?=
 =?utf-8?B?R0QwRG1WVEpXV0NsQ1hPTW9FQ2xpc3RVaHJvYTJrUzJ1YkNMVXVKb2o1WTEy?=
 =?utf-8?B?Yy9LRVRZTWNsSTQyTHNSSGI5N0lHamsyTlNkblBQMDFRbS92a2tYQmtMUGJR?=
 =?utf-8?B?M1JiZWtXSjRpMHVaVTVEb2dsNXhqYjJOb3pldnBxU0xaOThkU0M5NzMyS0Nv?=
 =?utf-8?B?K2lheGcwemp4d05COFBTQm91TUdvd1lkVkY2aGgzcUxLQStnZVJpY2JXaFFa?=
 =?utf-8?B?Q3FIbGRHSk1zYlRxR0Q2SDJIWFJPaGc5QzRSQURlM04zVzA0YUR3YXhReVdY?=
 =?utf-8?B?WlZxMFZpVUlmcXpEUWxsWjFyY3QrbS83elZMQTlTSGROamxVQ1Y2QUhBaStU?=
 =?utf-8?B?eXR4aGN0dW5oZWpUTFNzOUM4ZjR2SDJxQnFNM2pZRGxOTjZwRzlkT1hxYWgx?=
 =?utf-8?B?UHhsS2doc2NnN2JFR3BUeVNPcGQ1OXFtWG9uUEtZdjVGbHNIb3Bma2tld1ZI?=
 =?utf-8?B?Yisvbko3N2VTbytUZEZCZ2hhdS9DQ3BFQ0p0NGtRZVZUZ3plNis2KzFRc2Rz?=
 =?utf-8?B?TFlXRzJaeWhhSlpiVFRIb1Z3RWd2ZThRMFJHWWdEaTlDaSsxQ1VjWHNuTThF?=
 =?utf-8?B?SURyY294Z0dTS3M5VEpONWNEeXRnUHZuUVNFYnZVZFUrblE0UTluL2tobHZy?=
 =?utf-8?B?SUpXL1pxSlFBZWxZclJza2QvN1BOUGpIaWZtMG9sazA1dE9jVXBEd29ud3Rw?=
 =?utf-8?B?b2llWlUwcGJkdVZ0UG95R0RZUnVEK2NyNEpvanFZc01hWXI5dGZrYm9pb1dk?=
 =?utf-8?B?WDBsWmZPUDNzcmh2a242MDlMcFNFSWkrNHVYZXhtNFdPME5rQTFLdE4rSFVv?=
 =?utf-8?B?Wm9naFM3MUZEQlBCcVBwRDVlcmVwMXNLd21rS1Jla1puZzZuMk9Rem4vZGh2?=
 =?utf-8?B?QUpLaUhBSkRvQ2dRUTRTcmtWblJ4Ti8zcDZaSzVpTG1zL2Y3TE1wMXVnNGxY?=
 =?utf-8?B?UUVUc09aZmpTN0lWWWF2OWQrZEpBVldJRkxoeDlmcTM1eXhhQStxemtPNnIx?=
 =?utf-8?B?S2RQZkZ1T3o3Zk1FQnk4QVJDdlFGVXVKQkhkRnhlanlPL0NNMy9GQVdSTVQr?=
 =?utf-8?B?UmtNV3N0SU9LNW9ybm0yaHVDdHNtUEZvM1pwRHliNEpwei9Hc2VsQWRPeUdO?=
 =?utf-8?B?dlNlMURzSGJzME81U21LYWQ3a1NPQXJUMWNYOVY3ancyRlcwRStaSllvd1Yr?=
 =?utf-8?B?bW1xWVBnY2tKbEFIQzNoQWIvemx1SXlQUjZyL3BBMkNuUlVVZ2tJVWEzeS9R?=
 =?utf-8?B?YUI3K0tTNVVZK281S0ozYklkcjBKdDhNUFU0Zk11ZlVJNThOQkJCY1VQRHhL?=
 =?utf-8?B?RXVFZ3Rnbi9WczhuclVyeHRHbTdyMTE1eEh3WnRTZ3dDRTYxTGNPUmJMTTlD?=
 =?utf-8?Q?6gaFpQxTY6mo46bWhl2CS8bmop26Zqbc?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2610.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UDFFaWkweXdhODcreTNYbEJ5SGxTbW5EZUdjeEkzL1c2MTk2anZydEMrOHhM?=
 =?utf-8?B?UENDbzZCdzIvd2ZsczU1NlJRZmxlYmtyMW1JelVMczRiY204NG1EeGp2WUZD?=
 =?utf-8?B?REZwSm8rcjJqOGxadTcwWWlFTFFRalc5SDlvZVA1ekNoTG1ZUStObndkbldC?=
 =?utf-8?B?WkVBTndGVkpUQmlUOGFxVE1JR014azE3eFZIRlF6Mm1TS3pVQUNKUVVicEJK?=
 =?utf-8?B?R2xQT2dkbXBod1Iramc1a3dhWCtrQmhoeDVBNEhDRDMyaVh4VU1ERVY2R0dP?=
 =?utf-8?B?RFF6UEpVaHR4OUtzN0ltUC9Ya0EyUWlqak5SNDYvSjBHWEV6Tk1XUUFGazhW?=
 =?utf-8?B?Mkt4STBYNWI1U0prcENIc0l1RlJXUHRzTks1SzUzZk9FcnpLcnlKQTduaFZ3?=
 =?utf-8?B?RHVYRGhhZ0hnRUhJbmNHS3VqbHpuczlReEd3d2lkblFaK2RobHU2a2JRVENz?=
 =?utf-8?B?MHQ5SGRnd2hxaUdlVjVvM2FjS1ZGb1puakhsYzR4blo2Zkg5MVZOTmE3d3la?=
 =?utf-8?B?Y1l4QnJGem5EOU0xL1NYVFZzQmEvQ0tiRXEwUjNsSjN4ckh0Lzc1MTRiOTJF?=
 =?utf-8?B?QndIdzZiYmsya2tsVzNleHVpSmRsWnFtM0x4R3B3VmdETnlGaUlvK2d4clBr?=
 =?utf-8?B?a0JFbXNWekIrUUg1R0dBVEl1ZnZBOGF3SGc1dG5SbXhLWXdLZXZZOEkxWVZ1?=
 =?utf-8?B?Uk9DMWswMU93d282aXRoemxWVVUweHQ1MVBDaEhLK3VXMUs0dG9EUWQweGc3?=
 =?utf-8?B?WVNSQldybHRIakFSWEFRTW5YSkY0RC9zZ3Q5d1NmcXR3VWdCd3NSUjlIUlY2?=
 =?utf-8?B?UEF5dWZIejV5S1J3RE1jTDgyTWtrSlBwb2U4Zk82U1lXNjRSaUpaakpqdUNJ?=
 =?utf-8?B?U3JTeitEa2g3alpXQ3UwL2xDaTRvNjhYY0Nod001NnFJZzJlci9MWjA3V1Mx?=
 =?utf-8?B?TzR3anpjUHhaTU80eHJUeU53SkRpeE5sVEY5Tk83eDNlQy9OZ2E1T2w2cGR4?=
 =?utf-8?B?M3dsQWhza0IzdjU4RlRodThndGhoNlJjK1JIckp2R2g1R2JIL0dpc0ZRZnZU?=
 =?utf-8?B?QURLdXdpamRQekJUUTIrTmR5NVFzR0h1azh2bWtYdHRCK09IY3pZeTdGck1K?=
 =?utf-8?B?amtRNmEwdXdkeWtGbkxmNUJBUjU2ZTRvOVozRVRlWUlWUm13RVhDWksxaW5C?=
 =?utf-8?B?VnlRNUh0cUJCQWRhdmIrY0xCby9SY0loNWQvUHVyODVRRnZOR0dDak4vS1Ra?=
 =?utf-8?B?Q3ZWdXJpdEIyUHIzN3RUWnBwTk5RTFRlZE9HVmdHQlJkVStJQ29hWmRxMXhM?=
 =?utf-8?B?ZVduL0o5RGd3R2p2TlVuMFd6YkZmTnkzNUdhb0VFYzRDdzJvQmpuSnJPcE1H?=
 =?utf-8?B?cEpOVHhBTXVrNGZiV2dkdC8vQmFiUFp5Mmx3ZFpSWUVLSUJ0cUxFd1V1dUZv?=
 =?utf-8?B?YldhZlBnZXNNUzd0YWMwZEdBZU56djBtdXR3ejMzaFJyS3NOM29BbXZHMmNs?=
 =?utf-8?B?OVhBMmJ3bXQ1UHlEUzdLS0N6N1RWN0UrWDQ5SEVWZXJ1bko5N0wvQmx3Nm1V?=
 =?utf-8?B?TjFHZ1Q5akZuWmE2OEkzS0V2ZElxNWIzcGIyc2wzTEdYV1N4ekFIWnkrcmh2?=
 =?utf-8?B?eUpDUXVNQ1FzVFlnVmtZSWZDQWdhOXd5WW5mQzk3ZnpMVjNZekl5VUFtRzBL?=
 =?utf-8?B?bis1eVlLVUtqbUZ2ZEpPOHRtbUo0amEzUGpnZXFYL1ZabWEzM3I1RlhXVWRM?=
 =?utf-8?B?eDVMbTYrZm5BdkV3MFFOWFFYUERWS0Yrd1J2dXZjd2tteDk1UW9RNnhkZitW?=
 =?utf-8?B?SGt2bkZEVFhXWUlhYVNmemJSanNYWVMwTGI0TGhRUnQ5Zi9SWVlDaVpBUUIw?=
 =?utf-8?B?Uno2SC85Z1A3RDBzWDlNTlNVam9YN2R2M014OU5sVkdTekVTcnpqbTlhY2Mx?=
 =?utf-8?B?L3UwSUdkVmJldXdpNU9CZDFMbTNXZFo0UlJuajZBeEVXc2drOEFWVHljeGhR?=
 =?utf-8?B?NjNFWlJrZFRabmhYR1JHUmF2K3ZOWGpjdzhSQXNXc0dyaFhvR3MxS3JJSy9F?=
 =?utf-8?B?OVhTbmZ1dkpHeFhOUDE3Q2dlN3ZFSEV5ekRBTFJXTEV2d2VCL1VtbXJEU2Ez?=
 =?utf-8?Q?Y1TzFvqETV5AkRPl0X78dK5ES?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24E5EB53234CA4439527CB3D82711853@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2610.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31a679e-acb2-4777-7dca-08dd5c9ce3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 10:51:46.1927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DZGKvW2v9LH/QsiOCM1jSO99gPEd0LDFrmbC/gboHnEgwCZExnDdB97bD+z6WXJ/7Pwx6b7K6sPGBmV3U/PoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212383

Q2FuIHNjYXJ0aGdhcCBiZSBhZG9wdGVkIHRvIHVzZSBsejQgcmF0aGVyIHRoYW4gdGhlIGxlZ2Fj
eSBseDRjIGNtZD8NCg0KICBKb2NrZQ0K

