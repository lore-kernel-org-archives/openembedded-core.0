Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186C4C369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:55:27 +0000 (UTC)
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net [130.76.20.194])
 by mx.groups.io with SMTP id smtpd.web11.30516.1744836922120418390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=S5qcTGHk;
 dkim=pass header.i=@boeing.onmicrosoft.com header.s=selector1-boeing-onmicrosoft-com header.b=Gj+NiInH;
 spf=pass (domain: boeing.com, ip: 130.76.20.194, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 53GKtKVI030121;
	Wed, 16 Apr 2025 13:55:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1744836920;
	bh=fvwfcsVABsXQMzt2W+Ma6FKfNDytRZUjzCKZT4X/EmY=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=S5qcTGHkRo+1j07v4WK8/T9Yss8vOG0MoYms+BaxrqKm85etMEvntByCtaccqVXOe
	 UrA3fwMv1R6xDThfbV1cs8hhD858+eU5jIe6HCvNXRixMWvChmIykoi9BJLlOuwtHb
	 NH5x253yy9wUnRx5YCkGnR4ZdlRyxGP0amLcxujtiQlDYpRBFSwtV4cKr6Baqc0NMM
	 B7akkrpRPZlh73jt/PurilwM1i5db0EAppU70MbLN7R9t0o0u+9xNSIcAChhlCI5At
	 zYfXlAXeR1wD0nk4qQXfT36211Ou7Z8WUAPgi+xj+l+w6SFjyStcXHup7HxaF/IUPD
	 w+ErBTLryJ5vg==
Received: from XCH16-09-02.nos.boeing.com (xch16-09-02.nos.boeing.com [137.137.111.47])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 53GKtCDP030013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 16 Apr 2025 13:55:12 -0700
Received: from XCH16-02-02.nos.boeing.com (137.137.110.54) by
 XCH16-09-02.nos.boeing.com (137.137.111.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 13:55:11 -0700
Received: from XCH19-EDGE-Q01.nos.boeing.com (130.76.23.13) by
 XCH16-02-02.nos.boeing.com (137.137.110.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Wed, 16 Apr 2025 13:55:11 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.23.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 16 Apr
 2025 13:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=tekVWYw/AQwRmvAsJicJDawMUxOJ18ZB/KHdNbuw3oymF6yOvCLJeTqlRAA5PvyNjlbTonu4tUTB7oJDx4YkmQhomHPriorUicqy/iC++Tat9IwcsnyIr06Q/5xhfLcq3Aa0OR3sP4ThQJdar2XM2fnf1qu54h25FIpIjsyKQ9SZ27qT2H5DihC1oNopt15JJMeH5aHxFL4EPwpvWq1L8YtfeW1SiiCYa+ibMI6wqD7XawwfxXq7d6uX/+BcMX47qEDukEt2fZPjL5yDXta8mMXtaMOCwtXqXnw3QzCdqV4gdmUS/HrAsJ7gfp/I3DWjIBh0maTcPT5msLHaQsoovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvwfcsVABsXQMzt2W+Ma6FKfNDytRZUjzCKZT4X/EmY=;
 b=BlRdEPxYhAznkvrEAlrz/Qm0CCzPtAyFIKxp7LJhpZ6PYkpBdLH9DQ0EcZL8ijn4VCDAeWLfYAjBNZzMHz96pSIIcolRkl27tceIdNMDC2BP0EKhvaCoflD5VX2A7aIYyLiL7Xtkug07+IFGdtxs5tpeyGHILbTqmaQSNQBkXRHsa+tO+Qg4eOs5RYC9P10O/hEvyC7V4qzk4+lCyFzBmFkXW7jH7Nje0WtXyrveSzUp5noQBKWPo8BWvcUnqx6aX8bW4Lxj+eMUanpKHlK34IdeGvPxkVwxT/6iJ7W6CyDAMNNstFkNP86B2xISVcObwfcBj/JtRxBae+zKVObYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvwfcsVABsXQMzt2W+Ma6FKfNDytRZUjzCKZT4X/EmY=;
 b=Gj+NiInHeVtoV4N7S16ezpEDFzSDbpQreBFMmMNLOz/n8Il/p73pDFsoGCoRwFwG2cgjxBl/uw3kqwRv0Bp1qW4Z+az5Ik/f5YbQF8k5fP4qKljDCPsfS8K09RXblcGxlvXLB/riLnujmoAkbEgwdELhJIsmUqs1yqkhHep02og=
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::5)
 by BNAP110MB2256.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 20:54:57 +0000
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f]) by SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f%4]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 20:54:57 +0000
From: "Tran (US), Thune A" <thune.a.tran@boeing.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Topic: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Index: AQHbrxHPrEBuwHd1GEe7SB/IjTi7BA==
Date: Wed, 16 Apr 2025 20:54:57 +0000
Message-ID: <SA1P110MB22502577597BE3CD0A37FB9CB7BDA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
 <69747a29-2c7d-471f-8c2e-acbda9c3146c@gmail.com>
In-Reply-To: <69747a29-2c7d-471f-8c2e-acbda9c3146c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2250:EE_|BNAP110MB2256:EE_
x-ms-office365-filtering-correlation-id: 8927f52a-095d-4941-9a2e-08dd7d28f267
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZWduYUdjLzMreXkyb0tGUVJWS2RsR05vZWZVNTFVMlpibG5UeFNBUnJyZ0dK?=
 =?utf-8?B?c3RPLzFRYlc1amNmcUduZWVtUGRkbkpEMEwveVBGS083Sy9WNjNIMU9aVkY1?=
 =?utf-8?B?RXpRZll4U0JKdW5sUitNSTc1WjVTZEcxMnBjcjh5UzBlT0VacTVMM3o3YXJs?=
 =?utf-8?B?Z0dYSkNnb2ZqQk1VbndyanV0Q3dGV2h3NlBGYmQyS2lOL1h3UUlVWFU3TDVs?=
 =?utf-8?B?VzVTT1BYQzRxSnJxeFVGMmdTM1FGdXhoenlQMWtpUFJjYTkxcjAzMDIyM2Zk?=
 =?utf-8?B?VUlwbExnUWxkQVNUdEZ4V25YcHZaNGZlSEhkd2FKYURjYVc4S1UxSng3MnVR?=
 =?utf-8?B?bEdsSTd2SEZXeEpFU0hOSUNuSUpzWW9XcU9ZeTFzU2FLK1V6M2JIWEhvbVk5?=
 =?utf-8?B?d3BVT29NT0srQnJCeVdYN0FMa1hwZXdpc01xT3FJeU9iMmRwei8yT3VNbHVK?=
 =?utf-8?B?Q0pGbUlrSldIUERpS1QrblUwNFovZ2hXVSt2VGJCR2p4dU9tdHZmTkJpSEdk?=
 =?utf-8?B?ZEtDY1B4QXpSWjFqYXpUeUdYYW80bjBMazhaR3pRZGFkWWJteGNaYVZzeko2?=
 =?utf-8?B?cUFJbUxkaHVxVXlVOFpORGlKN1hCRnFzM2d2MU1lV1dXdWlCYUJSSytkbEtY?=
 =?utf-8?B?U1V1dmZrb0FnQkVzRjhhcVZyelQwdkVtd2dBT1F3OXJKRHZPVlFRZkJURzVv?=
 =?utf-8?B?R1FMWml5VVZPVnd1MzZPa1VTRjhzeXgvUUR5V3BtbVlxcTE3L3hqdzViUXlv?=
 =?utf-8?B?YllZU0txdzI3MStVM2hGSHJtKzJOUTRzVElIZEtuWmRIQ1dQN0Y1Y3NYQjNj?=
 =?utf-8?B?Y2d2cG1wa1dSeU93czc1T0s4dlg0TGtqTXpubjM3QWc5RlFQZE9WUURyOENL?=
 =?utf-8?B?YWUvUEJWWDlnNDErV3BLWW1Pb2VrQ3p2NWhybUZkcVZXbUtqV3kzWld0NkNr?=
 =?utf-8?B?S3JKYkJnRzJmWUhkSUplbGJpWUpSbmp3SlNzOG5CUUw3VVptTnNob0VaTXEx?=
 =?utf-8?B?SVJHY2Y0UVhEYTEwMEhUbjE2N3FaYVY2L3RuNFRyaGVrODVvcEhIbWdJeDZV?=
 =?utf-8?B?bnVWTUROc2tRRXAvMEJhQk0zTVNGalFhZHBPSFdDc0pmUkg5bW5pNzR3UFln?=
 =?utf-8?B?Y3RiWU1KbTJWUWI3UDJ5RjdHQnp4Z0JyeDhVSFZUcVgvSW1MU0xxRVg4V0V4?=
 =?utf-8?B?WFh1OFZMWFY3YVg0TW8vVEE4V3pHSVZkZmNhOER3cHJIVFZzOFBTQVY3YWps?=
 =?utf-8?B?Ny9rQ0dHYTBneDM3SUNmM1hucUs0TkZjckRGVVlNanFEd09ucitLdmkwZmd4?=
 =?utf-8?B?V2VuamFXUVNKeUlpa0QyUHM1dVV6eFNGczU2Q2E4blRSSTRzS3kzbGtrRjlt?=
 =?utf-8?B?V0JiV2JUWTJ5ZHYvQnBDS1MzOFZ5RWoyQ2JHcThIVnQ5bXhlWWNIRTFRL2ls?=
 =?utf-8?B?b2xJOFcrd1BMeitHcE5TaU1mVEJUOFEwdFNmTW0yZlRab2NoSkpJM1JvQTNS?=
 =?utf-8?B?QVQrTW9IekdveFprUzlEMlg4d2owUmtXaGRvRTNMb2k4cDl6dGkwWEdTbUJX?=
 =?utf-8?B?T25yVlRTcGs4T0NIb2I4QnY4YkowdFQ4QXRlQklObkgvT1dVMVpLMUFuSy9j?=
 =?utf-8?B?VVN0OXVWY0htbXZjRHRVaFVMUW1zK2ptdDQ3VnZFRUFrTDNtQWpMR3Y3bURG?=
 =?utf-8?B?WHJtRDJZa3kvMnNLcXFvRnhZR2hOYzllZEV3QXhsMXYrdk9td1NDalJ1eUdS?=
 =?utf-8?B?NjJqUTZlMzgvbUw1Mjgxa3J0b0NOSlExbUd4TXNaU1RkVlFxaWRwZnJselN5?=
 =?utf-8?B?T3krUFdNOTdwaU1Zc0Urdm9KQ2cyb1JEdGR5andnZEFpWTJ5M1lsL3ZpMUpZ?=
 =?utf-8?B?SXZHZWY0cEZTQ1pXNXZHN01WalFwdkl6cWVHRGd5c0hDV1poNGhpMDZ1NGRa?=
 =?utf-8?B?Nms4MnJUajZZay9odXpNZTgvb1ZKekh4NG95aHB1UVpzS282dk1uUjFoZjYv?=
 =?utf-8?B?MXVQRnFZTXFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWVKTGVkK25YSVhTeW5YdnpGUW1xWHRxSDlKVVNkVFFvRm1TZEJzZGY1NTJO?=
 =?utf-8?B?UU9lNmN6SjY5TjlFY2hRYWVlZTFtang0aXo2WDNuekxFZGVyM214Zm1kODI0?=
 =?utf-8?B?aTh5U3I2eklIWVN0YXhMSTlqWUFoVGltbDFsMUxsUTlVRmFFaXBOVXFyZEwv?=
 =?utf-8?B?Yzd0ZnYra3JlMkJCdTFaL0psNnd0UUE3YWpwSWphRUtZMWd0WVJyNXJxMnhW?=
 =?utf-8?B?Vzc2Tkxydk1EYnBLZjY3Q3k4WFhvY2lZbFEzL1ZObWw2Y0tGd3Qwd29QZ2ls?=
 =?utf-8?B?UDY2T21KdnQrekx6cE5aZ3VVejMyTit1bDdmOXQyVHJSdFNFRVZKTjZ0R2Jw?=
 =?utf-8?B?M2VSSVhKbUw0SEFYVkFmT3NHMmUwajNSWnl3Q2hBVGpUakZ6aEJJMDJZcG5j?=
 =?utf-8?B?OTl4Zno5ZmoxS2dLdlhHSDc5Vm9saUhaR0dUQmw5NHFKLzl1MGw4ZTZDYUpT?=
 =?utf-8?B?UG4wbmoySW9TSkkvbVp3blg0dk9xdisxNktzSzZMSnJ0V1VxcUlRVk1WWWRz?=
 =?utf-8?B?em5lbmEyZVU1cllnRlNCa0hmS3FKTDNCVmdKL2FPNzRQQk9lOUdtRUdHdlNn?=
 =?utf-8?B?ZTkzL2ZIaW0xaFVJSHoycHVXRzRQMmptSytJbitCL0xUQlltUWJ4TlhjclhT?=
 =?utf-8?B?M1hHcHgyL0ZrQ0hNcWJtaXUzU0Q2U0x0Mkl6YWtxdzhjNXo4V0FHMi9VTW1x?=
 =?utf-8?B?alRUcVJ0QmRzdE11S0ZaNml3MXB0WjJvUDFVOFlZdy9KYVVhbHJlMk9qaG5v?=
 =?utf-8?B?TmV2T204cU9jbUkxeE5WMFUxbFBOdElHSnR6QjF4RUp1VWwyaUZRdkp2dlNH?=
 =?utf-8?B?QUZPQnFpcDd1am9CVHh2eC9lVVZhdC8xMndvanJsVlpvRHI4Y1FGZmN0THZS?=
 =?utf-8?B?ekxteWtMWUVyNWdSOUkwdjAvckI0aWkxeStLVTQ2cFAyelFzMCsrUnJseWMw?=
 =?utf-8?B?RUNTZnNORGlDUW1GZUpjTThmQXNvWmZVaS9NOU8vZE0wYk9SeWpxbFVFTzhV?=
 =?utf-8?B?TDB5MTFabjVLZEY1ZXgzNzJLQitsVXhPSGd6TnZuajBEYlUwNDExb0pZS0tJ?=
 =?utf-8?B?aWpxWFVaNmlyeVZRd0hFVWtMYWJzMUpMS3c2TUdCcTRLK1BkMXNWNVRkK0VI?=
 =?utf-8?B?Ymd3SFgwME80UXp2MXBHUDR2cm5GQm9IdmNDcE1OeFBhekZIUWVnZzBsbkJt?=
 =?utf-8?B?cTc2ejNIZmxzd2hjUm9NRktBdmRmNVhkRmFCT3R6TGhBU1I4VGFRNVYyNjZr?=
 =?utf-8?B?RmtldDVyMnhVUVg0TlV5TEFLTENVTUNOcFNpMmc4Y3ZSR1kwcUZiYVI1Q3Mr?=
 =?utf-8?B?YUk0elFWbzZFQ05oczBqQWI3amdSRVp5Zi94Y0pXa2VkMk0rV29Xa09xQU82?=
 =?utf-8?B?RitWYkhHVGdxOVAzQXQvaTJwQ1IxNHJuWXlxb045Y3B2dHh2ckhIa1lwVWxL?=
 =?utf-8?B?WVdxMHYrajByUlYyZnFjOUFVWlJyWkdNTVQ1eXhGTHRtek5WaGY2NWlxU2pD?=
 =?utf-8?B?WkhFZzJYZVhtUW9tRi8zTENVOEpSVUdBWHl1VHgrVUdOU21RV1ZiaStxdU43?=
 =?utf-8?B?TGsydmxqMitmZmpDSU5qMCtzdzhzVmpLRU9uQndMUGVrelEyOTdNajR2anBh?=
 =?utf-8?B?MXRha0VFRTNpOG95QmtLWis4cVA1ZDRDaWlKWTdEeFYxSWI2NGpQWTVtZzU1?=
 =?utf-8?B?S3YrNTdWeXdRVmJQdFNqVUZUTEp2WE9MZXJkVUZ0WlRmcWhpTFNBMHhlNlI4?=
 =?utf-8?B?eG95MTFKQ3BZQk1xb0V4dS9Nbzh4OVFTb2ZSMU1haFVjRktoNGxZV3Y1ak80?=
 =?utf-8?B?UnIybjdvSjFkTGlLOTZvREg4aTNKbUZJNlBNTTZ3UGdSZmJFNzNReGp0N1F6?=
 =?utf-8?B?SnlsT0hoL3pwQUxHQk80K2NPRWx5d2VWMTZwMjVuR2pkMjJROFE5K0hvUG5J?=
 =?utf-8?B?NlQyKyt0UU51TWtLaTlCa3NZdVloNkhnWEY4QWdoYkpXMXN4UEpkejc5eTBE?=
 =?utf-8?B?Z0N5OXVmOURJdkE5QzZXT0xXdm1PdDZiZXY5SEgvRGsrWFlqNnh6UHB1MFdO?=
 =?utf-8?Q?xwONyt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8927f52a-095d-4941-9a2e-08dd7d28f267
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 20:54:57.5208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2256
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215017

PiBUaGUgc2FtZSBpc3N1ZSBpcyBhbHNvIHByZXNlbnQgZm9yIHNka2V4dCAtIHNpbmNlIHlvdSBh
cmUgYWxyZWFkeSBvbg0KPiB0aGlzLCBkbyB5b3UgdGhpbmsgeW91IGNvdWxkIG1ha2UgdGhhdCB3
b3JrIHRvbz8NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4gQSBxdWljayBsb29rIGF0
IHNka2V4dC4gSXQncyBwb3NzaWJsZSB0byBtYWtlIA0KaXQgd29yayBmb3IgaXQuIEknbSBvcGVu
IHRvIHN1Ym1pdHRpbmcgYSBzaW1pbGFyIHBhdGNoIGZvciBzZGtleHQuIEknbSBub3QgDQppbW1l
ZGlhdGVseSBzZXQgdXAgdG8gdGVzdCBpdC4gV291bGQgeW91IGJlIGFibGUgdG8gaGVscCB2ZXJp
ZnkgdGhlIHBhdGNoIA0KZm9yIHNka2V4dCBhbmQgYWxzbyBzaWduIG9mZiBvbiBpdD8NCj4gT24g
NC8xNi8yNSAxODo0MSwgVGh1bmUgVHJhbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4+IFRoZSB0ZXN0c2RrIHRhc2sgb25seSBsb2FkcyBTREsgdGVzdHMgZnJvbSB0aGUgb3Bl
bmVtYmVkZGVkLWNvcmUNCj4+IGxheWVyJ3MgbWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvLg0KPj4g
DQo+PiBUaGlzIHBhdGNoIGltcGxlbWVudHMgdGVzdCBkaXNjb3ZlcnkgdG8gaW5jbHVkZSBTREsg
dGVzdHMgZnJvbSBhbGwNCj4+IGNvbmZpZ3VyZWQgbGF5ZXJzIHRoYXQgbWlycm9yIDxMQVlFUl9E
SVI+L2xpYi9vZXFhL3Nkay9jYXNlcy8uIFRoZQ0KPj4gaW1wbGVtZW50YXRpb24gbWlycm9ycyBn
ZXRfcnVudGltZV9wYXRocygpIGluIG1ldGEvY2xhc3Nlcy0NCj4+IHJlY2lwZS90ZXN0aW1hZ2Uu
DQo+PiANCj4+IFRlc3RlZCBieToNCj4+IA0KPj4gMS4gQWRkaW5nIFNESyB0ZXN0IGNhc2VzIHRv
IDxMQVlFUl9ESVI+L2xpYi9vZXFhL3Nkay9jYXNlcy8gYW5kDQo+PiAgICB2ZXJpZnlpbmcgdGhl
eSBhcmUgZGlzY292ZXJlZCBhbmQgZXhlY3V0ZWQgd2l0aCBubyBlcnJvcnMuIDIuDQo+PiAgICBW
ZXJpZnlpbmcgZXhpc3RpbmcgU0RLIHRlc3QgY2FzZXMgaW4gb3BlbmVtYmVkZGVkLWNvcmUgbGF5
ZXIgYXJlDQo+PiAgICBkaXNjb3ZlcmVkIGFuZCBleGVjdXRlZCB3aXRoIG5vIGVycm9ycy4NCj4+
IFNpZ25lZC1vZmYtYnk6IFRodW5lIFRyYW4gPHRodW5lLmEudHJhbkBib2VpbmcuY29tPg0KPj4g
U2lnbmVkLW9mZi1ieTogQ2h1Y2sgV29sYmVyIDxjaHVjay53b2xiZXJAYm9laW5nLmNvbT4NCj4+
IC0tLQ0KPj4gIG1ldGEvbGliL29lcWEvc2RrL3Rlc3RzZGsucHkgfCAxNiArKysrKysrKysrKysr
KystDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL3Nkay90ZXN0c2RrLnB5IGIvbWV0YS9saWIv
b2VxYS9zZGsvdGVzdHNkay5weQ0KPj4gaW5kZXggNTE4YjA5ZmViYi4uNTA1YWRkOGY4YyAxMDA2
NDQNCj4+IC0tLSBhL21ldGEvbGliL29lcWEvc2RrL3Rlc3RzZGsucHkNCj4+ICsrKyBiL21ldGEv
bGliL29lcWEvc2RrL3Rlc3RzZGsucHkNCj4+IEBAIC0zMSw2ICszMSwyMCBAQCBjbGFzcyBUZXN0
U0RLKFRlc3RTREtCYXNlKToNCj4+ICAgICAgY29udGV4dF9jbGFzcyA9IE9FU0RLVGVzdENvbnRl
eHQNCj4+ICAgICAgdGVzdF90eXBlID0gJ3NkaycNCj4+ICsgICAgZGVmIGdldF9zZGtfcGF0aHMo
c2VsZiwgZCk6DQo+PiArICAgICAgICAiIiINCj4+ICsgICAgICAgIFJldHVybnMgYSBsaXN0IG9m
IHBhdGhzIHdoZXJlIFNESyB0ZXN0IG11c3QgcmVzaWRlLg0KPj4gKw0KPj4gKyAgICAgICAgU0RL
IHRlc3RzIGFyZSBleHBlY3RlZCBpbiA8TEFZRVJfRElSPi9saWIvb2VxYS9zZGsvY2FzZXMvDQo+
PiArICAgICAgICAiIiINCj4+ICsgICAgICAgIHBhdGhzID0gW10NCj4+ICsNCj4+ICsgICAgICAg
IGZvciBsYXllciBpbiBkLmdldFZhcignQkJMQVlFUlMnKS5zcGxpdCgpOg0KPj4gKyAgICAgICAg
ICAgIHBhdGggPSBvcy5wYXRoLmpvaW4obGF5ZXIsICdsaWIvb2VxYS9zZGsvY2FzZXMnKQ0KPj4g
KyAgICAgICAgICAgIGlmIG9zLnBhdGguaXNkaXIocGF0aCk6DQo+PiArICAgICAgICAgICAgICAg
IHBhdGhzLmFwcGVuZChwYXRoKQ0KPj4gKyAgICAgICAgcmV0dXJuIHBhdGhzDQo+PiArDQo+PiAg
ICAgIGRlZiBnZXRfdGNuYW1lKHNlbGYsIGQpOg0KPj4gICAgICAgICAgIiIiDQo+PiAgICAgICAg
ICBHZXQgdGhlIG5hbWUgb2YgdGhlIFNESyBmaWxlDQo+PiBAQCAtMTE0LDcgKzEyOCw3IEBAIGNs
YXNzIFRlc3RTREsoVGVzdFNES0Jhc2UpOg0KPj4gICAgICAgICAgICAgICAgICBob3N0X3BrZ19t
YW5pZmVzdD1ob3N0X3BrZ19tYW5pZmVzdCwgKipjb250ZXh0X2FyZ3MpDQo+PiAgICAgICAgICAg
ICAgdHJ5Og0KPj4gLSAgICAgICAgICAgICAgICB0Yy5sb2FkVGVzdHMoc2VsZi5jb250ZXh0X2V4
ZWN1dG9yX2NsYXNzLmRlZmF1bHRfY2FzZXMpDQo+PiArICAgICAgICAgICAgICAgIHRjLmxvYWRU
ZXN0cyhzZWxmLmdldF9zZGtfcGF0aHMoZCkpDQo+PiAgICAgICAgICAgICAgZXhjZXB0IEV4Y2Vw
dGlvbiBhcyBlOg0KPj4gICAgICAgICAgICAgICAgICBpbXBvcnQgdHJhY2ViYWNrDQo+PiAgICAg
ICAgICAgICAgICAgIGJiLmZhdGFsKCJMb2FkaW5nIHRlc3RzIGZhaWxlZDpcbiVzIiAlIHRyYWNl
YmFjay5mb3JtYXRfZXhjKCkpDQo+PiANCj4+DQoNCg0K

