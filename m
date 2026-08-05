Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC52C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:49:52 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34072.1785908985878131023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=Mpq/xWZR;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.70, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3LW10PXad3NpQ/gnmy0zAd7axPWGl0pMheyssrSXdyywOwIRSYATIrh6pFjhKzKofrHu450tuzKeDoCDGfkmEaXpgR3HyIgsFGBg8R6VsBBgSPWiZi/AxiRSVLJq9izebL+RrZ9viw77tBxMBmDFvpn+okI4xRQw4fgLffXYuU52svLIg7Omq0F8nZclAGPPmSLOWvOXdDymEU2pNJ2Dru5tFHzKLfKbjvF7AW/eGfIZ0iS3+EZmsoeYgSk/hTImuaLVB1hkLgOu75vha41EzOyw6LH+xxbgTwvTi6+ss31MCmG+YpmGq4X0AX8ezwmAv+UsZBBnDKccMwwfe7M3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS52/it4BAjB7SK/ubR7TwoNDH1OM7nc9Zj7COmlYI4=;
 b=Q9VAQp499U23FEzGPybgfyqcEPkk1AbhJinY3CHmb//8UNRTB1TDPaoS8Pr/f3GK01bwuc6ROvF/kCQ3c7CpEXX6eHt5PXqeSdBb2z5RUxKp15myGI7yB8/L1EISG2u/7JapKORrRrirMCPARbA7k7ibmIS2FingHW6SnHm+nwRORzOq1brWjapSl2ahWdxh0j9dm57qcXR7u3RpioSJBhSYsGhzwwuFgnm27rWGz63Ye0+tMeL3yzg8m3a8XlkR/tEcQmtqUV1AFxpbL/xM0v4owM39CXAC1gIZJqgv+WQFgXPHXxakBL+ja+/mPP7eSLBvco9iI+1kf5nxq2uovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS52/it4BAjB7SK/ubR7TwoNDH1OM7nc9Zj7COmlYI4=;
 b=Mpq/xWZRR1kUtgIS91bqxaFtXjGgyTMs2Wv8YMzyJahZJNjRzNLQOlFLo0YA5Z8thVurSVDjtjm4kHAIGHTXHss5ier5oS5qWd+j7PzXJv2zxrsGmw57W5eyqLbB0tvHzmvRB6XTxBvOWRDf1p5AE9RRlrfQJwZIov27Xf3DdeUCr3f3lPIXOGDD++dPK04qU/NTx73QgL0ht03Zweg7k5ng/MzQtBV7nFTMdyfKOTxFnvt5gqpcCQohahNL5dS1HoT7SW4ueNE2YEDk+kkAQ4EOC3Qq9U1YJbJKWtWcWfkXqQAoe6N5VQSwV6UsJ9gDV8AoTsM0MULFqviGBgndDA==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by OSAPR01MB7445.jpnprd01.prod.outlook.com (2603:1096:604:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 05:49:39 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 05:49:39 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/8] libdisplay-info: upgrade 0.3.0 -> 0.4.0
Thread-Topic: [OE-core] [PATCH 2/8] libdisplay-info: upgrade 0.3.0 -> 0.4.0
Thread-Index: AQHdI8Z3R8IVXTTVvEW/R2SN5mGUPbaN7L0AgAEH7uA=
Date: Wed, 5 Aug 2026 05:49:39 +0000
Message-ID: 
 <TYYPR01MB13419E9EA8CDB26259E4EABCADCD32@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
 <20260804040509.1454-2-wangmy@fujitsu.com>
 <DKG7SIJCKHS2.32EJGR9IZRUOP@bootlin.com>
In-Reply-To: <DKG7SIJCKHS2.32EJGR9IZRUOP@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MmU0OGUxZWYtMWM3OS00Mjk5LTk5YjktY2IyYzAxODc4?=
 =?utf-8?B?NjNiO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDgtMDVUMDU6NDg6NThaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|OSAPR01MB7445:EE_
x-ms-office365-filtering-correlation-id: ac39135e-615b-4f56-1d67-08def2b55711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|10067099003|3023799007|18002099003|22082099003|1580799027|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 MXBW9I0VvO0me/LPW0zjFVI6NqhI75QEHuWLRb/34WZlkZPBS3vU5Pzq3tAoT86QhoEGm+o28SwDWHQEPaW14OFY2IZl8ib/RlPkg/wGvoujaWhdL94GXvgNuRTFFUGQCjMqwdYRqONMBF6xKKd6XOhWIFnT08c3Tgsex/0zr42f5VPiCNO/kWUskQy5ba+rkO9fzzODi+1eYt7Xd8wAU8aBRhKZYhuitR9oI/mTwpdqpjuXkSAbfJzVqYx8vYUtKEkMXFrrNvFIvlvFsd42VuPcLYbeyJqFoUxujTwHkFBkICmPEggcUkyNGBcx+vSXYpJ2KSbcBqO/C29isMA348ELz/HTegz4MIRv8G2lvi8b3c6HqcmAmWo3DKSaG4vcsAKaYBuWiBNymSO7zMbNKn7q6u1pWQFXuwfxwGRwF6Sc/i4XDU1SONCZEyxDi3pHBm2vh1gxgIRQGGjdFfK0cdxYk0zWTodKHAaw7/iPQb++p8/lZMQtxpQOlOfp3qv3/TpqHGAq7uHuetPwfCFSnxn7ILoi9DP96sXXmWHo3Q93iGNQofiiOVhNgVIO+k/YvxK6MlRE8NKglS12XmzX9iMHB9LL6jSg692Yj05Akr5iQGSFZ2sHwCxTSkmQWjbICGBymZQF/EhES2FVCBJ2gRiyyXodDqpeArEwroJAK9gijpQLCC3Dbixk/yW8UcuB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(1580799027)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MklmKyswZWFKbkJFWURkVU14YzBxS211d0JVeS9ZRDgxOGJrZFBpVEQyTDBj?=
 =?utf-8?B?TGFlajVMZ3FFNWV4TXB1ZHBmVGd3VWN1V2xqVC9QN0QrOGhOOTlWdzNTd3Rh?=
 =?utf-8?B?Z2lNb0FrR2Yrd013NS9vTWVuMi9YQ0VSZnlRRUdLYzV0dGVqVzZTR2xORUhz?=
 =?utf-8?B?R3p0L01WdEFueGk1VTAyODlzdFpKanJwQzJFUlhRRjNaMk9RVExhREFsUTE5?=
 =?utf-8?B?RE9KTW1ZV1BKaVFhNSt4ZEJqM0YrMXRuNGRpWFR6eFdabHcyR3kzckhQN00r?=
 =?utf-8?B?YWdINGoxNHRYbHA3U0s5WHBxU2toM1FGdW10ak5uWjg0MEFiV1FxYVJpUWRj?=
 =?utf-8?B?QVN2UWdmRlVUUmRDVndROC9QZ1p4dkxJdmE0cXlqRCtCcWNwYnhSWUNPNytD?=
 =?utf-8?B?S3AwTmphYlV6VitnNjFReGQ2QXBGdi9Gb1UwMWZ6aTZrbEhlTjhLd1lHYlhO?=
 =?utf-8?B?bzJnUnl0TjJidDNNbnBjVVNlMXJkVnpQeHdZTWsxeGtyVEhPYkpMVHVOaldH?=
 =?utf-8?B?R3pZK2JIR1FxOGljc0prbmVWM3dia3pyeWgvcmI0aWpqeXg0akovR0hKU3gx?=
 =?utf-8?B?d2xvb0FXczRzOUwzdnFZTU95VklJRFNHZnp3eUVGV1hXWGtMVnV4L2pzeE9L?=
 =?utf-8?B?ZWRuOCt6SjhnMnUzZjQvN0QzdlM0T3VYcVJmWlp0eWZFQkNkUkthc2g4am43?=
 =?utf-8?B?L0pGa09ybmE5UUhybHBYMmQ2RTRCcUErbGVXaTdiQTROVU9IcWtmT1M2UE9K?=
 =?utf-8?B?T3hmNjl1SGlLcW5BSEZ1SDcyNWNHYU52Y0NGaXdEaTYxTCs0bVdxV01nVU8z?=
 =?utf-8?B?TVA0NzhYMXRIS2dvcWdQcE1mRDRkUjBDTjJoTldueHR4cUhFOExnVlJSNXBS?=
 =?utf-8?B?WEx0VENCTWx4WlF4c0JldWZ0bWU3bUNuRk8zd0sxeEFOQlpTWFZKcUd3b0tu?=
 =?utf-8?B?SmU3b2dhTkpPSlpyZ2VKZ2tFNUVqQkViT3U4Z2VnSzQ1bDArRXptaVRDTDA4?=
 =?utf-8?B?bW1PQTVNWnVPcTY3YVlKQWxUWHhwdHZ0SkE0RWh4T3ZZeUtrUjZKSXI5bm9L?=
 =?utf-8?B?azA5c3RvMHQ1RUlCazlSQjhqN2VvaFN2blUwSXNpbnhDQkN6WWN4T3dOUG14?=
 =?utf-8?B?TE5DalVvQ2hTaGluMWtycGQvdGQ5a3FYQy9TSloxaDBCZTFwV0lnaDNxc0FY?=
 =?utf-8?B?UHhUemtTUXdhRlhPVmVHZ2RVMENjZEZnMWpQUW1QNEkwam1lWmlkYkJNSkRR?=
 =?utf-8?B?THhEUGQwejdpTnhuWkptaGxqZm5DdTkvMGlxaXFMRTNOM3haKzRjKzl1UzBy?=
 =?utf-8?B?VmRwUzFMM2dzb2VaM2FrU2U0MmJ4bExPSlNGMU1NY0RFQUtnTTlpNGw3Yjdw?=
 =?utf-8?B?UldNaUQ4QTFrQ0NNRHY1bE56bEZrbHBra0ZCY0hzdnRpMVdrRTlJWEJkMFc2?=
 =?utf-8?B?SlpqaTZ0elpWeDNZUEF2TTJyTjVUbVFqNjhFNWcwQmRIMWdBcUlvdUZqdWVo?=
 =?utf-8?B?T3VhVFJyRSt3Sm9RN01ZbjFZcC9yMWY0NmFiTG9FYXFoT2lZVWtuMEVReVM1?=
 =?utf-8?B?Z1lFcUx3NWpWcVM1RHkyWERDN21YclBZY3RoanlkL2grMUdtN2NCTXhiOTF4?=
 =?utf-8?B?RUNoWjlBdzI1eUhXbUdmUXdJeS9USFNkaEpRZnB3RHdQRFI2NXBjZWFFVGVS?=
 =?utf-8?B?YkFGOFlPNXlrV01Rd2Rya3NnaVFoeWtRMDA5L3ZZdXBCdzhPYnZTMFJaSXBH?=
 =?utf-8?B?eDVLZlhGVm1aQXlER083TTFhUjhRVFIydkRrdGZSN1YvODBreC9UMFd2cStF?=
 =?utf-8?B?MGJXT2ZnSVBGbE4xcEZxOHdjY3VFMHdaZ2ZZeWIyT01IRVJqYlVnVGdsWWtG?=
 =?utf-8?B?cjNjN3E2RnNqRVJrdnc0NHh5enBmRjM1ak5hNFZNeFAremJCNkhpU25HZG9N?=
 =?utf-8?B?S290WlRWY1cwdThqMUVCVlNWdVNrMU1RWFY4eU0rcWdOZHpEQkJDdE5DV1Jk?=
 =?utf-8?B?ck1CMHdBajJjejFxK202UFpKb3JLWlZoZjZ1emQxWWFQenFEbytoQU1DcVBN?=
 =?utf-8?B?SHV1MGV1ZWRtbE44dHFEZC84WVBDeEdiNUdCenNTY3pjMTVkWWxSMjNqZ1BO?=
 =?utf-8?B?VDR1UndqeHpNcGM3S0YyWlA2eEZ0Ri9PeDVkYkJoV1pwbzZ0ZmhkaW54NnRj?=
 =?utf-8?B?V2dMUHhPL2ZTZlZXbkZhUnJ6eCtKUXJtWnBmQjNEVlJqdEpoaHd3YmpPYmVi?=
 =?utf-8?B?THZEZGtRVVhtSmpoOER1d1RMVlNmLzZDa1pucEhHQkxuNGZnN08xVHRPcElL?=
 =?utf-8?Q?ala1VQw5KGWq0GWrE6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CsWqPTv9vCfU57Run3oLgz2XV6oc0xTqQdQ/+NKfV5Q6ASqvBgXvg81mUgE3VJ8cw4cfg8bwLF9Psqe+d271L5jJEloqV0qxNfbe8S9yvxzx5yjxq5tYJGFQYOXoK5NFM4emCwT3OBS7pu5Uvmwj8fwbD8AQOzBYiagg3fe3tH/h7aXRRmKQZdUd7kZ8JBvE+ti4CApQo9w69dWphDcidEM0SforQY7BpGEY+Heo2qK2HHsaeWSYh4PWmQytFN+7vKepT4nnu22lWPMbjfydGqAVpteoQOaR4agtuKvMnhZYwayuftHUrsXCPKO4haT5/xcObN7IiskkS7vFniz3IA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac39135e-615b-4f56-1d67-08def2b55711
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 05:49:39.6796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3jPKdpuGSLzL9sM3IlonUIL8liwKCNeOI2a/cdGGEAtYquiIqndODtmnr4MHKWZdFQY4ftpNbqfKg7G/i4jww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7445
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242822

DQpJIGhhdmUgc3VibW1pdGVkIGEgcGF0Y2ggb2Ygd2VzdG9uIHRvIGZpeCB0aGlzIGVycm9yLg0K
ICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVD
SE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAw
MTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0K
RkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0
aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3Qg
NCwgMjAyNiAxMDowNCBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBm
dWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi84XSBsaWJkaXNwbGF5LWluZm86IHVw
Z3JhZGUgMC4zLjAgLT4gMC40LjANCj4gDQo+IE9uIFR1ZSBBdWcgNCwgMjAyNiBhdCA2OjA1IEFN
IENFU1QsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBG
cm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L3tsaWJkaXNwbGF5LWluZm9fMC4zLjAuYmIgPT4gbGliZGlzcGxheS1pbmZvXzAuNC4wLmJifSAg
ICAgIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkgIHJlbmFtZQ0KPiA+IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3BsYXktaW5mby97
bGliZGlzcGxheS1pbmZvXzAuMy4wLmJiID0+DQo+ID4gbGliZGlzcGxheS1pbmZvXzAuNC4wLmJi
fSAoOTIlKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjMuMC5iYg0KPiA+IGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3BsYXktaW5mb18wLjQuMC5iYg0KPiA+
IHNpbWlsYXJpdHkgaW5kZXggOTIlDQo+ID4gcmVuYW1lIGZyb20NCj4gPiBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvXzAuMy4wLmJiDQo+ID4gcmVu
YW1lIHRvDQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3Bs
YXktaW5mb18wLjQuMC5iYg0KPiA+IGluZGV4IDM4MGMxMmI4NjcuLmQ5OTNiZjEwNjEgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZGlzcGxheS1pbmZvL2xpYmRpc3Bs
YXktaW5mb18wLjMuMC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmRpc3Bs
YXktaW5mby9saWJkaXNwbGF5LWluZm9fMC40LjAuYmINCj4gPiBAQCAtOSw2ICs5LDYgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQ0MjY0MDk5NTcwODBlZTAz
NTIxMjgzNTRjZWEyZGUiDQo+ID4gIERFUEVORFMgPSAiaHdkYXRhLW5hdGl2ZSINCj4gPg0KPiA+
ICBTUkNfVVJJID0NCj4gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1lcnNpb24vbGli
ZGlzcGxheS1pbmZvLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbA0KPiA9aHR0cHM7dGFnPSR7UFZ9
Ig0KPiA+IC1TUkNSRVYgPSAiNDdhNTU5MGU5YzRlYjM1ZDY3NjUxYjhjMDVhNTVmMWE0ODI1OTMy
OSINCj4gPiArU1JDUkVWID0gImM2N2EzZTliZWRiMDVhYjYxYzc0NDM3MDRhMWExMDdlNzYyNTQ1
OTUiDQo+ID4NCj4gPiAgaW5oZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2UNCj4gDQo+
IEhpIFdhbmcsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBJdCBsb29rcyBs
aWtlIHRoaXMgaXMgYnJlYWtpbmcgdGhlIHdlc3RvbiBidWlsZDoNCj4gDQo+IEVSUk9SOiB3ZXN0
b24tMTUuMC4xLXIwIGRvX2NvbmZpZ3VyZTogRXhlY3V0aW9uIG9mDQo+ICcvc3J2L3Bva3lidWls
ZC95b2N0by13b3JrZXIvbXVzbC1xZW11eDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Ni02
NC12DQo+IDMtcG9reS1saW51eC1tdXNsL3dlc3Rvbi8xNS4wLjEvdGVtcC9ydW4uZG9fY29uZmln
dXJlLjE3OTY3MDYnIGZhaWxlZCB3aXRoDQo+IGV4aXQgY29kZSAxIC4uLg0KPiB8IERlcGVuZGVu
Y3kgbGliZGlzcGxheS1pbmZvIGZvciBob3N0IG1hY2hpbmUgZm91bmQ6IE5PLiBGb3VuZCAwLjQu
MCBidXQgbmVlZDoNCj4gJzwgMC40LjAnIDsgbWF0Y2hlZDogJz49IDAuMi4wJw0KPiB8IFJ1bi10
aW1lIGRlcGVuZGVuY3kgbGliZGlzcGxheS1pbmZvIGZvdW5kOiBOTyAgKHRyaWVkIHBrZy1jb25m
aWcgYW5kDQo+IHwgY21ha2UpIExvb2tpbmcgZm9yIGEgZmFsbGJhY2sgc3VicHJvamVjdCBmb3Ig
dGhlIGRlcGVuZGVuY3kNCj4gfCBsaWJkaXNwbGF5LWluZm8NCj4gfCBFUlJPUjogU3VicHJvamVj
dCBkaXNwbGF5LWluZm8gaXMgYnVpbGRhYmxlOiBOTw0KPiB8DQo+IHwgLi4vc291cmNlcy93ZXN0
b24tMTUuMC4xL21lc29uLmJ1aWxkOjE3OToyMjogRVJST1I6IEF1dG9tYXRpYw0KPiB8IHdyYXAt
YmFzZWQgc3VicHJvamVjdCBkb3dubG9hZGluZyBpcyBkaXNhYmxlZA0KPiB8DQo+IHwgQSBmdWxs
IGxvZyBjYW4gYmUgZm91bmQgYXQNCj4gfCAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvbXVz
bC1xZW11eDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Ni02DQo+IHwgNC12My1wb2t5LWxp
bnV4LW11c2wvd2VzdG9uLzE1LjAuMS9idWlsZC9tZXNvbi1sb2dzL21lc29uLWxvZy50eHQNCj4g
fA0KPiB8IExhc3QgMTAgbGluZXMgb2YgbWVzb24tbG9nLnR4dDoNCj4gfCAtbGRpc3BsYXktaW5m
bw0KPiB8IC0tLS0tLS0tLS0tDQo+IHwgRGVwZW5kZW5jeSBsaWJkaXNwbGF5LWluZm8gZm9yIGhv
c3QgbWFjaGluZSBmb3VuZDogTk8uIEZvdW5kIDAuNC4wIGJ1dCBuZWVkOg0KPiAnPCAwLjQuMCcg
OyBtYXRjaGVkOiAnPj0gMC4yLjAnDQo+IHwgQ01ha2UgYmluYXJ5IGZvciBob3N0IG1hY2hpbmUg
aXMgY2FjaGVkIGFzIG5vdCBmb3VuZCBDTWFrZSBiaW5hcnkgZm9yDQo+IHwgbWFjaGluZSBob3N0
IG1hY2hpbmUgbm90IGZvdW5kLiBHaXZpbmcgdXAuDQo+IHwgUnVuLXRpbWUgZGVwZW5kZW5jeSBs
aWJkaXNwbGF5LWluZm8gZm91bmQ6IE5PICAodHJpZWQgcGtnLWNvbmZpZyBhbmQNCj4gfCBjbWFr
ZSkgTG9va2luZyBmb3IgYSBmYWxsYmFjayBzdWJwcm9qZWN0IGZvciB0aGUgZGVwZW5kZW5jeQ0K
PiB8IGxpYmRpc3BsYXktaW5mbw0KPiB8IEVSUk9SOiBTdWJwcm9qZWN0IGRpc3BsYXktaW5mbyBp
cyBidWlsZGFibGU6IE5PDQo+IHwNCj4gfCAuLi9zb3VyY2VzL3dlc3Rvbi0xNS4wLjEvbWVzb24u
YnVpbGQ6MTc5OjIyOiBFUlJPUjogQXV0b21hdGljDQo+IHwgd3JhcC1iYXNlZCBzdWJwcm9qZWN0
IGRvd25sb2FkaW5nIGlzIGRpc2FibGVkDQo+IHwNCj4gfCBFUlJPUjogbWVzb24gc2V0dXAgZmFp
bGVkDQo+IHwgV0FSTklORzogZXhpdCBjb2RlIDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQuDQo+IA0K
PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVy
cy8zL2J1aWxkcy80MzY1DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92
YWxreXJpZS8jL2J1aWxkZXJzLzYvYnVpbGRzLzQzMjkNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNi9idWlsZHMvNDMyOQ0KPiBodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy81OS9i
dWlsZHMvNDMzNg0KPiANCj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGUgaXNzdWU/DQo+IA0K
PiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwg
Qm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBz
Oi8vYm9vdGxpbi5jb20NCg0K

