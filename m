Return-Path: <douglas.royds@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A68C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 21:56:05 +0000 (UTC)
Received: from SY5PR01CU010.outbound.protection.outlook.com (SY5PR01CU010.outbound.protection.outlook.com [40.107.40.143])
 by mx.groups.io with SMTP id smtpd.web10.2040.1748987756728905620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 14:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=selector1 header.b=gY1bGnOD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: taitcommunications.com, ip: 40.107.40.143, mailfrom: douglas.royds@taitcommunications.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzz9aL/e5ztOIcqR2Ouiwc3Ub/5G+TdmumCtVJAKSFVhSVUFApb4WfFbVLBQYo068KXgEjTkTuVsSJ/Ub8NJ2JFOi70EUnAbBe3bWHDwQ5VKnFbOG95PZ7jzcjuFoh7cOYuIyJD1Uw28z4FuOHq7cV4F302udusk2nG78KH4/eEc39O6mNFRNcBILWzsbpsRSW+fA6gBvcfSZMMGqvdmnGJd18tLWxr1XFY3i6+4gk8xkG0CtrFt4+mY6VPzFFOvGtERNYbzWGdtj7oi2HQLfPZuM3RHNlBS9eaDkxZkfyIxUTuvMYWZUkoIDALoHaCMo/V72bpBnZYfXk0jKOgkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tn3Qnf65ZfjrQ+blGbGYLAOAoFYCmaRUzvhUEvK06+0=;
 b=xKJrJ6CLJZdoJFIaIJOKOyhoDDI05uU2F4Euu9OMYXrkD2NzCnRe64C0mR+UWtuV1nXqQYkSTqSpGfBqXPAodE+QOuhx11M3d2lDF+ZhFpz7FLD0hA9XGDdEIpP0m3aPaY9pk9FJA/HTK0+lymnkGqBn4ED6bd3PiLHsJXL2/IRPnYIbalXVUlNKXL9Wn6DvX6XG2tolrq97Phyk0n0Qi3u4nWbetJEuKhLws2umATg9yGCq5Y2ek0O/SxdNIIPB/M7Eg5kQsCkiOoDgI7pqWBwn2gX9ULEcH5uTe7k5++wAeD1wDd3jOnEUdKRFuzpA72QwzmIIjRGBMX5On4azlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=taitcommunications.com; dmarc=pass action=none
 header.from=taitcommunications.com; dkim=pass
 header.d=taitcommunications.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=taitcommunications.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn3Qnf65ZfjrQ+blGbGYLAOAoFYCmaRUzvhUEvK06+0=;
 b=gY1bGnODskrCZiZzwQrLRb1Llhd0WWgYjrGl8olbZrpY55KaSV2IgZiMzrVHQvvKNy9FHPD+J0QsNoyuvP7LDZLXz60ziRdrJ9i5nR455u6kRIgra2g3gjeoWGVqQscF+6FaS/9u1T0jJ97925KFsDtwpvO23s+e4ZvQ8Ca56KIbNKTz9WW0CWLfi1efhy53NnNVJDlfasoAbMiYueSVuP9pugkfBqG10vw0+OKqnfzTiDGRKSxsHW2DMo0xSnB+Tjqd0rSkrVRknafu4ItXNP9aFmybnysbLfyUh2j87h2fe4ot9yxiPD1cMycO/b9N99lfDYYsiSY7Tf/7dgp7/w==
Received: from ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:10c::10)
 by SY4P282MB4246.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 21:55:50 +0000
Received: from ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4854:ef86:5be5:d20b]) by ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4854:ef86:5be5:d20b%7]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 21:55:50 +0000
From: Douglas Royds <douglas.royds@taitcommunications.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"peter.suti@streamunlimited.com" <peter.suti@streamunlimited.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
Thread-Topic: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
Thread-Index: AQHb1GW06TgWhOkpVUy+htoULC2CZbPxM4Q1gAARYwCAALKDsg==
Date: Tue, 3 Jun 2025 21:55:50 +0000
Message-ID: 
 <ME3P282MB2531A632687099F4A94BDA7F946DA@ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM>
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
 <18457EF875184E76.9693@lists.openembedded.org>
 <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
 <CACMGZgYc-31tzF8UuLLhMiuJ5kKA1_UN2t9JXzPG7DyoNJo-bA@mail.gmail.com>
In-Reply-To: 
 <CACMGZgYc-31tzF8UuLLhMiuJ5kKA1_UN2t9JXzPG7DyoNJo-bA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=taitcommunications.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2531:EE_|SY4P282MB4246:EE_
x-ms-office365-filtering-correlation-id: fe574944-bb77-41ca-5659-08dda2e9674e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L0FEdFl4Q0EvdVRIM1laaGgxWEpiODhidFlmUENja3QvcVU5SG1YNmVrMjNE?=
 =?utf-8?B?SzVsRVFTZnB5OUFKSmIxSkpOcTJ1RFlMV0RZWDBHNTZPL29QdVJIQk1zUm4w?=
 =?utf-8?B?VkVaTDBBVTUrRXNoWklKWW5ydkxaaUM5ZzFGNFZmc0RvUHdsQW9hQ2wxNUls?=
 =?utf-8?B?VEFNaURaYWVtVFBKRDdsUmJQUTVqWEJBbWROdlc5empQeUx3Qno3d2hsUTFp?=
 =?utf-8?B?VGVpVno5QjdEV3JmNElYMHYwbVRIaFJERlNIZFBocWpqYmhkMWhia0xpN1oz?=
 =?utf-8?B?OENVUFBGcjNVekV5dWJtMFk0L2F3TlMzbUhFd01XWXFVYUZPZG5xblVJRG1l?=
 =?utf-8?B?VGN1cjcwNTF0cDdUbU5wcDZZdUNvT0RRMkc5bnNYWUFseTVpb0Z1MitGa1pk?=
 =?utf-8?B?V01DMlg4WkhVU0tSUFUxTEFwdmkwRVJ5MEhsVlQyWHRTWGgzanlKL2xoMXJN?=
 =?utf-8?B?b0ZYWlBiamZmSXZHTEFocGF2Z3puK1U2SDlFUUFYRTdJcUdyMHZwd3daNWE0?=
 =?utf-8?B?R2JRZmJpcHhaZGZtSDF0V3RnbkpNZDN3Qk4vQWFQMGEyem40Nk5QUjRQVG50?=
 =?utf-8?B?Y1Q2U2tVMVk3dFlWcFd2ZkNtcms4T0NOQTlGZHNzRVUwM0JkTE5CaHVJRkZN?=
 =?utf-8?B?QWhlN1pNaW5vVmx4bDNobnhGNVdxUVVPK0lHYjdOajJ4bmVRZFhIdXZ6Rnp0?=
 =?utf-8?B?ZU5UcklHWC9lL0JSQWhkcjZyUzk2S09VZGVkL2IyZ0JTNmdMMlJDcWwrK0ty?=
 =?utf-8?B?OGR4Y1RZQ3NUdHR0UzlBanJ6cWdDQjg4UmpwVThveFExUzQ3aURIWnc1TGlM?=
 =?utf-8?B?OTg2dERMZU5KRU8yenZ4ajBSbmJ0VDNUbk5SaUJ3TzFTdWhha2h0Yllyam9T?=
 =?utf-8?B?VkFXNEwwc2loeGZwRDFUMUpGS0RTcHJLSlVKU2tMbUMwRDYyVFN4bVp5Mzdt?=
 =?utf-8?B?bTNhSjM3TlRWSHV4ZTlhN3FlaGZJNm1QTFZ1ZlRRcmJWc2F3a3BpYVRPcDM4?=
 =?utf-8?B?ZktwSmlSZnFXWGgrOFlDNmpzOHVxWlpXUkgvL1d4amFzNEZDT0R3cmhiWGMw?=
 =?utf-8?B?S0pEaXFRdFNNUUhxVnlTMC9wUFBVYzRMTkZaYzd3ejY0TkZLQitTSWVoNTdy?=
 =?utf-8?B?ZjJsbmI0aUl6MEdBSDM4QytiTERCMWtJT0JKTkFGdjJMVnIrcHI0bXBxL2s3?=
 =?utf-8?B?U21BOGpaR3Jqbm11NG9RTC9sK0pLNThXbkFOOUdPd2tDbHpGOUlzY09kNXd4?=
 =?utf-8?B?WHNwcjgwYURuekgzYmtvV1JQTG44QUtBcnZ4UGJvWmMvYStYM3ZsOGc0c0Zt?=
 =?utf-8?B?eDAzQ29Kb3RvamMyWGlQay9iUiszSUxwelRIZWZHSVBCbHVVWFpZMVAwaVNP?=
 =?utf-8?B?cCszRERHcGthWjFtODllOWc3WjIrcDFOL1V3anhTamZYbURib0FLQkVJbVJ0?=
 =?utf-8?B?VlI3NTUvaXFrdkhFdmhUdEhGY3plOE85S0owSWUzOUp6VVU4M2JtUUxXZGdL?=
 =?utf-8?B?bUk5bEVQR1daVUNpYmt6QzBYN1JoNlFudWFoNlNBcXlFTThiZi9QVnJkRU5N?=
 =?utf-8?B?dmpxM3lvY3dMWVdoTXFOR1U3ZnRUMU5idVRDa3VHeVFrWCttTklDWTJkTnJP?=
 =?utf-8?B?VEZlN3J2dzlDL1BxaTBWalBsYmU0ZVl6eVJGTTBHTysxN0JKZzlCQWxCQWxP?=
 =?utf-8?B?ZjBVYldWdnJlT2RJOUpSeEgrWm1xOGVRbnZUWlVKazNtR0h4d1RrWDdRVmZn?=
 =?utf-8?B?c1RTWXh6dUJRZXo3aHZyeGlJRVIwTzgwU05PbzJ6cEdIeW9nOGhPb0JYZXZ4?=
 =?utf-8?B?Sk9WRXdicjRCM1hNdm9lbnEyODNoWHFXZ2QxQnh1NXFwZ3ZkRlVsbjFxb0h4?=
 =?utf-8?B?TVpXY2FRNk4zNFN2MTM3SVZXMFI3Q3FLazJ4dGdCdWJEVUJBNHUvTm1GNTJt?=
 =?utf-8?B?M1JTVFRtVmVkcEROZWhnanlhOGViVVlqYXhoL1RIRDhFcFRTNkpUOHFvVTNU?=
 =?utf-8?Q?3jTtgzd8asxJ//R6SoCQOpQaEoEDRs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmVFbkVKY1Y5eUFXaHpOUTMxTlY5UEhDVlQ5ZUNKSVRQOVhOKzhhRURvQkZB?=
 =?utf-8?B?anZiK2dvcjV0RTBqeUlLTmpXR3l2eTRxcDg0bEMyeHV4bUVOKzBtdEtlWnZm?=
 =?utf-8?B?NEh0Q1VhZlpIMFpMbkxMbCtGclNHODFYN0R5dVBhc3c2cngxSjVIZXJSYUxl?=
 =?utf-8?B?MnZDOU5pZm9kOE14WFZCazJ5aVNIR2VoMU1nRTV6Mndob2QrUWUveXVkdS9W?=
 =?utf-8?B?b1cwN2FEUUM2NSsybGcrSEZaN2dJTnFXT3pIaStJTmdQUXZTRVNsRWVYbkM4?=
 =?utf-8?B?KzVpOGp1TFU0WXFWa2c4NmhramNiZGlTU2xYY3Jqa3c0QTgyMnZNdXlsNSsy?=
 =?utf-8?B?V3U4QWZOSWFGQStJaHRMUzlKM2tLeHpPOFdBSzVXdDByM1ExN1RoTEh6clI2?=
 =?utf-8?B?TXFNUHp1dUllSk95Y0VRV08wT2taTS9tM2hxS28xakJ1TGhBYjAyakJRTUor?=
 =?utf-8?B?U0EwSzFwVVFRWXlVODRRaitEQXlkcldTdS93dFZWTzFTTGcxNG1OOTdzb2Fv?=
 =?utf-8?B?dmJtdkNVZ0xCck9qOFh0M2RWNi92eXY1dnhZb1M0TDFUWk1MaFBwR2tISGxL?=
 =?utf-8?B?TWJzVmtxOStSdThmSGtYWlZQUkVUV3VzRjcydmxIZTNFS2tMMkNKT3VESmpl?=
 =?utf-8?B?WWE1bzBmaHZLaVpYUGpJaUVhSWdZTnZqMEJHUmF3SWtudXgwUkp2WjRUWGtJ?=
 =?utf-8?B?dlFseVppTXRJdHRNc3VlN0RsQ3E3RFUxd0xWN0JiRnVNTWYvV0xOcTNld1Rt?=
 =?utf-8?B?QW1BdVBoSU0ram12aStSZ0ZheXdqTnJrNld2ZDNYNjJ4ZUtvM0xFUnlyVWVu?=
 =?utf-8?B?ZWEwYzdHZWtOQllJY2ZLK2dRRWU4ZXpZcllLTTBsNklxSUpmMDlrL1FpdEs3?=
 =?utf-8?B?ZFFDMEY1Q1JJZFJPKzNxWFBrUFpqdHFjK0xXSjl6OForbE5DaGczVnYxOHIy?=
 =?utf-8?B?RUs4d1d6ajE1eXZISzlGNTZ5b2lNWDBYWE00M0ZEUlhWT3FYcW5JOXFzVE9U?=
 =?utf-8?B?WEhQTHZ1djhYc0lkWUxEVlEzTjREbXNMZno3dHFSUWVQb01VM0ZvQnlJSUNS?=
 =?utf-8?B?bmhmRnlaU2NPTDh1WVkyVVJWTVNYaExhbXVmcS9GVnkvdzhhdW94dGZLcE5v?=
 =?utf-8?B?SlBZRXRuQjJRdWlsZmlGQTVnQjRTL0k5emQvQTdqcExJU0o0aGkzellKQzJu?=
 =?utf-8?B?U1R2UmpRdjhyVHFuMHRKa2RLMk1rdm41ejhFQ3VJNmlDVmJ2dGY2Wlh2NzVx?=
 =?utf-8?B?UkwwcENYS3I5cy9sL1JIYWtDU01YTUVJZitWWmc1Q0M0V3ZoNjFnZGQrbkky?=
 =?utf-8?B?U0piQWFBSHY4eTFDQXFjZDBTaTQyMlQ5NFNMdTk3Uk5qN2FIeGl6TkF2UlJK?=
 =?utf-8?B?VXN5bDFrZ2xabFg1K0p1WnpMMGFHK2N0VVB1d2FMQlFiNkNVRFhGWDNCa0w1?=
 =?utf-8?B?TjgxS3c3ejVkQ2JPOWdoVGRqNGFkaGNJNERTV0trMmVITENWVzU1dE1DTEZU?=
 =?utf-8?B?a0JKUElRY2lFbEd5M2NkNU9wS0hhOWRFRVovRThlczZ2aGJPcm1salV5NDZR?=
 =?utf-8?B?VGZPd25NY3hicC90YVZyRUJLTXBBd3NKYUNZaThwOHRFRURlZ2twK0taOVll?=
 =?utf-8?B?aXVyeFRtdlVQakdpa2taajA5TVQrYjFGeGZLbmEwZGZFTTN6ZjVOeHdXRVh3?=
 =?utf-8?B?aVFMRU1Ld1lHa08xc0hJejVuTExjc3E4N0xxbnFBZDMxalF5SXJFQkc4SUp1?=
 =?utf-8?B?UjRDS1ZCbUtwRlM1WmVERjlEL0dmTzVDWmkwbnkyYU1YZUZONU5lSk03VTVv?=
 =?utf-8?B?M2VCQTVQYU1zYzVpVFNidTdiMEZMUk5wUDhLWm90eENxWDBRQjZVN2ozQnly?=
 =?utf-8?B?OW1yNWgyRUJjNkoyQmpwU0ExOEptSGJQYzkzcGptWE54bmJqNWdPdUZqUXp5?=
 =?utf-8?B?SUJrT1A2SUY5eHdkUFo5dHp6OHJzc1NPSFl1aFpLWVRHSEczenpHY0JuaXVy?=
 =?utf-8?B?U0xTNEI1YWQwNU1ib0ZLU242aStUZEFRTG5WSWZrWG1Wb29WdmVDazFTTnhR?=
 =?utf-8?B?MjdnUU90bExTdU5YSlE0SnQwZFo4eEN1Nkk3Ym1CQW5MZ2Zvb0RBTW9KR3hX?=
 =?utf-8?B?a2RYNXZYdjU2VGNaWnVHTzdNZWdvK2tWazU2ZkxmVFpGaFBMM0tNbkIxSnlw?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: taitcommunications.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe574944-bb77-41ca-5659-08dda2e9674e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 21:55:50.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9ac1691-179e-406f-90a3-6d5b9a817466
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZS24xY7RsOOK2J4l6K93+A1HZVTSNVGbmuBIlzV9xQ78xzHu+k6J5BX35vSyW6zSmXJPGM0TIYiIC+YG5RSw2Cj2fORbANveEuVA+pDl3rCj50uZ4b5vmPz9ixeAOQAP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB4246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 21:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217826

RnJvbTrCoCBQZXRlciBTdXRpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5zdXRp
PXN0cmVhbXVubGltaXRlZC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4KPiBPbiBUdWUsIEp1
biAzLCAyMDI1IGF0IDExOjU54oCvQU0gUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgMjAyNS0wNi0wMyBhdCAx
MDo0MCArMDEwMCwgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6Cj4gPiA+IFVuZm9ydHVuYXRlbHkgUE4gY291bGQgYmUgc2V0IGRpZmZlcmVudGx5IHRvIHRo
YXQsIG9yIHNldCB0aHJvdWdoIGNsYXNzCj4gPiA+IGV4dGVuc2lvbnMgc28gSSBkb24ndCB0aGlu
ayB0aGlzIGlzIGEgZ29vZCB3YXkgdG8gZml4IHRoZSBpc3N1ZS4gSXQKPiA+ID4gZG9lcyBoaWdo
bGlnaHQgdGhhdCBpY2VjYyBwcm9iYWJseSBqdXN0IHdvcmtlZCB0aHJvdWdoIGx1Y2sgYW55d2F5
LiBJdAo+ID4gPiB3b3VsZCBnZXQgaXQgYXBwcm94aW1hdGVseSByaWdodCBtb3N0IG9mIHRoZSB0
aW1lIGJ1dCBJJ20gbm90IHN1cmUgd2UKPiA+ID4gd2FudCB0byByZWx5IG9uIHRoYXQuCj4gCj4g
TWF5YmUgdGhhdCBpcyB3aHkgd2UgaGF2ZSB0byBkaXNhYmxlIGEgYnVuY2ggb2YgcmVjaXBlcyB3
aXRoCj4gSUNFQ0NfUkVDSVBFX0RJU0FCTEUuCj4gCj4gPiA+IFRvIGJlIGhvbmVzdCwgSSdtIG1v
cmUgdGVtcHRlZCB0byBzaW1wbHkgcmVtb3ZlIGljZWNjIHNpbmNlIGl0IHdvdWxkCj4gPiA+IHNl
ZW0gbm90IGEgbG90IG9mIHBlb3BsZSBhcmUgdXNpbmcgaXQgaWYgaXQgdGFrZXMgdGhpcyBsb25n
IGZvciBmaXhlcwo+ID4gPiB0byBnZXQgc2VudCA6Ly4KPiAKPiBJIHVuZGVyc3RhbmQuIFdlIHdp
bGwga2VlcCB1c2luZyBpdCBpbnRlcm5hbGx5IHdpdGggdGhlIGFib3ZlIHBhdGNoCj4gYmVjYXVz
ZSBpdCB3b3JrcyBmb3Igb3VyIHVzZSBjYXNlcyBhbmQKPiBwcm92aWRlcyBub3RpY2VhYmxlIHNw
ZWVkdXBzIHN0aWxsLgo+IAo+ID4gSnVzdCB0byBjbGFyaWZ5LCB0aGlzIHdvdWxkIHRoZW4gbGV0
IHNvbWVvbmUgbWFpbnRhaW4gdGhpcyBpbiBhCj4gPiBzZXBhcmF0ZSBsYXllciBhcyBpdCBpcyBz
ZWxmIGNvbnRhaW5lZC4gSSBhcHByZWNpYXRlIHdlJ2QgbmVlZCB0byBmaW5kCj4gPiB0aGF0IG1h
aW50YWluZXIgc29tZW9uZSBuZWVkcyB0byBmaWxsIHRoYXQgcm9sZSB0byBrZWVwIHRoaXMgd29y
a2luZy4uLgoKSSBzdXNwZWN0IHRoZSByZWFzb24gbm8gb25lIGhhcyBmaXhlZCB0aGlzIG1pZ2h0
IGJlIHRoYXQgbm8gb25lIGVsc2UgaGFzIGhpdCBpdAp5ZXQg4oCUIHdlIGhhdmVuJ3QuIEZvcnR1
bmF0ZWx5IGluIHRoZSBtZWFudGltZSwgUGV0ZXIgaGFzIGZvdW5kIGEgd29yay1hcm91bmQKdGhh
dCB3b3JrcyBmb3IgaGltLgoKSSdkIGFyZ3VlIHRoYXQgaWNlY2MgaXMgd2VsbCBzdXBwb3J0ZWQg
aW4gb2UtY29yZS4gVGhlc2UgYXJlIHRoZSB0b3AgNgpjb250cmlidXRvcnMgdG8gaWNlY2MuYmJj
bGFzcywgbWFraW5nIDk3IGNvbW1pdHMgb3ZlciAxMCB5ZWFycywgYWxtb3N0IDEwIHBlcgp5ZWFy
OgoKICAgMjEgSm9zaHVhIFdhdHQKICAgMTggUmljaGFyZCBQdXJkaWUKICAgMTQgTWFydGluIEph
bnNhCiAgIDExIERvdWdsYXMgUm95ZHMKICAgOSBUb2JpYXMgSGVua2VsCiAgIDYgRG1pdHJ5IEVy
ZW1pbi1Tb2xlbmlrb3YKCkknbSBzdXJlIG9uZSBvZiB0aGVzZSBjb250cmlidXRvcnMgd2lsbCBi
dW1wIGludG8gdGhpcyBzYW1lIHByb2JsZW0gYXQgc29tZQpwb2ludCwgYW5kIHRoYXQgdGhleSds
bCBmaXggaXQgdGhlbi4gUGxlYXNlIGRvbid0IGRyb3AgaXQgZnJvbSBvZS1jb3JlLgo=

