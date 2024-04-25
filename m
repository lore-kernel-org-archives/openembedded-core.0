Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF3CC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:48 +0000 (UTC)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web10.10293.1714024478495346474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 22:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=BNGwd2rX;
 spf=pass (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1714024479; x=1745560479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LfMXE7aoFLp7G0YJR6S3fPcvXTb5MPfbPUwvZIledL8=;
  b=BNGwd2rXFkUCTWksbaiOi1fduwrvp7TLsXRdTf07d5vHrEQwlu27xCnH
   HIi1qopjmCxLV0Y9JTD3dmkM085qby0uz457SDKKH3BWk7vnbp8M5CvDq
   2/p0u0NNAs4PbZwp4r0x3LafpCtYCYxczhUCeZuUwXEFx3OxT1QHsGmFd
   EztQm5pUTxXBiLjMkhnyuv4MQUvpUBiJkD9WenQSoG9FvhQDZdQazKTDB
   NephAw9Uq58nPakYj2hXh2WcpfsV0GNOjjdYdwWzN9A/98OWSDCzuUlER
   N8XyhJzGpBQZafaltAC1NIJ4Ts7EcTyoVq60H35A/9wtn7k7oA4CxUE35
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="122325151"
X-IronPort-AV: E=Sophos;i="6.07,228,1708354800"; 
   d="scan'208";a="122325151"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:54:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DekOn5J6hDuBfiE+G9oCmkLxyrm7khgqAusre2ys92k/pp1i+ZWPRx4zKrCN+lw7kQ66PpnRqkHIKqtQDg0l1kogi9rzy2IX7eXCDoEiJlkiC8rO/rR3Ktumrg+PtKlNeazAtM+ztfSlyJzSEv6NDLHR+2WCLeYgfO66fQ+xXiWmoLVL8JtpxQpJaeuARo2GNBfPX5/5ztupgikFaGm3g/YoUOUWDMOsNaHaBqKKEq80Nc6H8mTxeXICuiwPVeGPrXPdISjMRzwTRmg3gXkYv5so3YTG+vPxNwNsc9B8Uy7Bt3NgZPFUtJlcFpzpev8FXp8qtqNBmUkmGI8zn5myzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfMXE7aoFLp7G0YJR6S3fPcvXTb5MPfbPUwvZIledL8=;
 b=TfRDDi+4cJzIC7+5e2Bwr0BZtQOS2jFJP7kf7zSSycGDGqJSB8dxTw8Jys7iv4GQpc+Ooqt+ozypekqwu5vc1TH1kPcnCLuU7tdHYi5y49sDeHxNEQuCP0nQlDJmQ2Fg5aw8lbfWM/detwDfPQA2sY9d2QO3v1xxKQeJ6ZCrr8d3Tiakj/BQX7Yk8RKPbfvTuvbDFK9xsaBh8u/qS7fN4C/ctF4PBqzIHamY/QX4z4iyKOeX3we/VbT/aO9qjXkXjM6zx2BvaUh0Z8Q9oykqBQcZ8Utium204xRAyqewuoxvIaf1nx1lmohTaBuzL6HjWQ+VjxebpJ+JZro8vZ4zCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB11736.jpnprd01.prod.outlook.com
 (2603:1096:400:3e2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 05:54:31 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 05:54:31 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Index: AQHakS7v5Rna/weS7EOZ/YW4RKkdqrFtgUuAgAFGPxCAB+6nAIAAbPCAgAFkGiA=
Date: Thu, 25 Apr 2024 05:54:31 +0000
Message-ID: 
 <TY3PR01MB110569D1A6B2830B20F479B8BA0172@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240418012247.490545-1-leimaohui@fujitsu.com>
 <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
 <17C7897B23C043A5.4146@lists.openembedded.org>
 <TY3PR01MB11056C32DF3D90E8C09FB5234A0102@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CANNYZj9AA4OEuZ02Ndi0WNaFyW9kiZG91HSEjM4QToQqRZS1Fw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9AA4OEuZ02Ndi0WNaFyW9kiZG91HSEjM4QToQqRZS1Fw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MGQ0ODRmZGUtMWMzOS00ZTc3LTkzY2MtNWI2NDk0MmVh?=
 =?utf-8?B?ZTg3O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDQtMjVUMDU6NTI6NDdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB11736:EE_
x-ms-office365-filtering-correlation-id: c6b8172b-4eb9-496b-01d9-08dc64ec2d6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|376005|1580799018|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZU9GejNvdWhiSlVjaUMwNk9XN0hJQ0tXclpYT0hUQnFETk1UNHM1NHFmQWZN?=
 =?utf-8?B?TFg2UzVvUmpTcWlQRVFQNDQ5R2RPUlhhNHgxbkRCbk1XZFNka1FZN21USWRs?=
 =?utf-8?B?dnAxSytQYVFRbUlQVDNrNWlnbmZxM2VFTkRiLzN3YzFaNUVKR3c0TjQ5STNY?=
 =?utf-8?B?cGFzanNnRWhwZHNIcXZja1RHQlVsaVhIc0dLT2ZRRElrSHZKZml5U2c2SWtX?=
 =?utf-8?B?SllvTG5VdTU0dUk1UlphbEsyVitlVTFKZmV0WTV4WlhhWlpMQTN5cnh4Umdy?=
 =?utf-8?B?YXd6bkIwY1F6VXFPaHYxUHdZRmplMVI4WnF2c3JWVTQxQkYranlLdjRCVmdv?=
 =?utf-8?B?MU1yTit2cEJoRDlWYm9ROFdONXcybDRWbElpcFV3djRHQi9ybm90eWROekRS?=
 =?utf-8?B?YnJZM25oemdqb1MxeVJGTzJ1Y0xsUngxSzVkRjZWdFE5RDZjU01PRE9NMzhD?=
 =?utf-8?B?clFNdm9xSDlXLzRLOVN0OURBN1BQSlRhUTFFNGhrMlFjRDR2V2xnRUxYQWgv?=
 =?utf-8?B?UG5rcXdyZGMyUEI0bWhCSzRaenhzczRwNlZzMzg0SmI1S05yQjJsUkRSbSty?=
 =?utf-8?B?aHF3M1dLbFJnMFd1bGhENllobjlVZmJhZFpvSHppKzE5TU4xcFBlcWNhY0FG?=
 =?utf-8?B?dE1BZWtYMDNqdGJPbjBVQ2tESTQ5NWM3ZHZCVWtZU0FNN045M0FZTldNL3Ax?=
 =?utf-8?B?VzBsT2V0S2N1a0xtSC9yeDlmYmxtSTNRa0RieGlLbTY3UlJtT0RsR3Bibmx6?=
 =?utf-8?B?RC8rbEZickw2cFlxSWFBMHM3REZUMTBpOVZnY1k3ZmpsMndOQVlqcGM1MHR4?=
 =?utf-8?B?QWVpdi9RbFFWQWZHSkttLytpM3VqTDhONHhnekV6a1BXZm1zamtEak5IUEgr?=
 =?utf-8?B?YVZvRnd1UDE4V3BwK0NzbWxRcGlLWlpkZlBRenJpK2hEOG9hWDRvREczUUd1?=
 =?utf-8?B?bW53T0h6cUV6cVdIZHdXKzJGRDhsMlBraG1aUlgxclVsQ3h4eUVtRkhndUxK?=
 =?utf-8?B?a3U0UjRXZWF5UTk4N1hKZ0dWb01oa0Y1SkdDTm9yQ2svd05SWkhxVjFPNEI3?=
 =?utf-8?B?TksySy9LZWZPSDB6OUZZMnk2RW13MllZeFoxbCtZcnYzS1ExaEp1VlNSaUor?=
 =?utf-8?B?ckpzUDR6bFZXR2JFTDlLdWFzNElBVXh4YVFFTDltTm9IYmNIaFlvSmxmMnNh?=
 =?utf-8?B?a0p2dmxlblAyUFBOZ1hKZVhTTkZqU0pFYVZsM3Fpb2s1dm00a3dXaFhUb3ZL?=
 =?utf-8?B?L3VLbUlmYllCWUlCOHlkV2Z5V0RTL3M0RkhNeW56RmNDZW44dnl5ZHBEUDBj?=
 =?utf-8?B?MHg3dXVPOHVUbDZhU0lOTUhTOXUxd1U4U00xajY3MTViUUx1b0VLaGNjc0dH?=
 =?utf-8?B?QnkvM2ZpeFA4MXdtTzV3bU1NcTdiT25YWi9pd0xzZks2aXlYaFZnanFWaHMw?=
 =?utf-8?B?YVdra3pNTUtaRDlSNUtEbXlQaURkL2JzQlA5bnA2Z0RsUjRCdDRWVU5WL1NV?=
 =?utf-8?B?UStvbWFaNVhna0hBeW9OR0dyekxmV3FvY0ZwQlZoWDJDT0FhT1NMbWl6TFhm?=
 =?utf-8?B?Q1NHNWJyUHlocktLSnhabUZuUXBzYU96T2dpWXZMYTlZLzBoekJIcEVKNkc5?=
 =?utf-8?B?RGVSdHZaY0FqZ1AxWTFja3JmdjNIUXhJZURVRngwQkh0RGUzQnIzNnpWVGZW?=
 =?utf-8?B?bUZzQ0tEcUhkYWlpdm1WdkZDdTQxUHFQTDJxRDFSRlhFVDZUaENyc2ZQc3hG?=
 =?utf-8?B?aXFKYUZPV3dYbVYzVmVLYjd0K09vM3VHVVVwMmxkZ0YxdUt1OWRCYTA3Tytl?=
 =?utf-8?Q?DT3NV9S2XuIgBsJW6j681p8NqTXKimALZbajc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MjRqQzVGbVpUM0lvTDJKcnpTVm9hME9ZdU95bVRXYmt2bnRxVGtUWFFVeWtl?=
 =?utf-8?B?ZjNiV0NSc2hiQ3JzbG1FRnh4MGRPQmJvVy9XMFNVT3c3M0lvMlRaWldjcm80?=
 =?utf-8?B?NmNwekphV3g0R25xWUk0WC92ditueTFWWCtEUUhJNVlGc0xmc2J6cDBXamlE?=
 =?utf-8?B?ZXVnSlRHWFVQUTdlZzVHTDN5VTRkQlZOYXpzQVAydHYvRG94Ykc1OWhJb21T?=
 =?utf-8?B?NlFlbnM5VllwY2Q2Uk5zNWpHOXhNL21Cb0dVeGxjUnZBSVc5alVNckhZa1FQ?=
 =?utf-8?B?U00zN0hJWTR5L1pYdHhGOElwSWQrbExaNXNmdnhPTTg1UEZSM1haUEZoT2dQ?=
 =?utf-8?B?R1ZXZ2tKcGxxVHFVSHphbTY2bTJ1NUxwVFRPNmUrc09aMXF4YkZiRmVIZXUv?=
 =?utf-8?B?VEJ3VmpaUE15MXd6UGkzaU9BQ2hGZFJkUGZYN1BxNUV6bnJqSHcvUHV6R2dG?=
 =?utf-8?B?ZTNkTnpWeG1zWFA0QU9NT3FDa0NFeFVkdjYyYStnQ29LVHo1L1VBa3BhVkhC?=
 =?utf-8?B?SzRRTThHQlVsTks1L0IrNzZsd0t3UngwaGJPVXZ0aU9RTm9QK0czMFBLZ0I1?=
 =?utf-8?B?ZFl4KzFKZlp3bXptdDlKcEh0NTBqTWJHM2hJR1c2SkxwMklUMmd5Sm5sWXhr?=
 =?utf-8?B?eWZyaWZuaXFZemRqdUZIRUZTUzFQNXhzNVQvejhPc0RqNHRSamczblVBMzNV?=
 =?utf-8?B?Q0JCMFFJUHdwSVV0bzF2ZkYwNWpjbDk5MC9DTkN4cG5zVWk0bXlEVTJnOHoy?=
 =?utf-8?B?T2ZiV1d5MjV3aWV1WkJUL2oyY3dva2lYK2VMWDJNZm1VUW1ZSFptUWNueXJE?=
 =?utf-8?B?OWhYaCs2Q0RvbTZkUVZBdkIxcTJGbGZTVFRiZmpoREd1dDdCMWxiSGxONkNT?=
 =?utf-8?B?UzdidUFHWVNuaFlwRFlxaFhDcnAyV1dpQUFCY1daZlRLVjZYb3llUnJTNEtP?=
 =?utf-8?B?djdnTTZucm5sWDdqMXRqVWtkWWZrNUlpL29Rb0FwRjBiTW1Td1BDeUlQTDVP?=
 =?utf-8?B?elFOK3JJN3ZCSWdCYlVCSWJxckRPUGRNYkZBMW9kdTU3TEtDbWFHUzZwZmVG?=
 =?utf-8?B?WWV0dWk3QXlHL0FuQnl2c0N3Wk9MbWd5RGErZFBwNjJxRjZYUWRkbWpvK21i?=
 =?utf-8?B?Z1o0N0R1Q3JtbDVMa3oxSjBZeXFYTFRHVGlBeU5WbGMrTFNuSXVIT0U0SVRj?=
 =?utf-8?B?WDRYd21yZkl0RnpPbkFqVkk5ZGhwWENFRXlralliYWZXT3hCNWpCNHY1TktB?=
 =?utf-8?B?Q0dFZ2Y5Y0lFQnNnbnFRRE1ZeWRSNkxCTDJwbkFmbitvUFd1NHRxdVlnMG1n?=
 =?utf-8?B?WjlxNWI3MkdpNExpaDYxcmlwZXZOZUJkM2ptRmtaWkVwcVlBMEMwOFQ2QmFI?=
 =?utf-8?B?cjlqSXBTTUlaa3NMNEdjSTM2SEk3aGJINGFmZE4yc3dCenU1TnNibDdkS3NJ?=
 =?utf-8?B?WHFXdnNJV2g1d0JkWWVsZkN2aEgwcTZ3eGhIbkZEYWNMRlVtTHVyOXVuWlBr?=
 =?utf-8?B?clVhbkN5YUNPcVA1YXRQZWI5c0Y2d2JsYnltSk80c2dYNUI3d212NTQwYWo4?=
 =?utf-8?B?elJMT2gxd2lIa3BXajQwVytQeWMzNnNjL3pQVE94eWhuN2ZtQ0kxbi9TcHdu?=
 =?utf-8?B?THlGK1VIUUIvcmN5Wk1YOGZVNGFkY2xUYU5HNFJMSTBXNUFWL2ZWdzg1UlY2?=
 =?utf-8?B?SmhGUlJ1RlJyeFJMcDc4YmVoeUZLbEVaeTIvUFg0SmlZYm9qelJkUkRsWllr?=
 =?utf-8?B?VHVKbXN0OGdwNndhU1BrNjFsOGJmQ3RpYXpVRWRSaEV1TVpKbXJBN0wvNDR3?=
 =?utf-8?B?b1NWaVBZblIyb2FKUnlJTEFHUHBUc0NweGdCbkkvQ2FsY0NjTXhaVHB3UXhY?=
 =?utf-8?B?aUoxdlAzd0prSVE4WHI0SEVraXVJRXB0Yzh6aUsxUXB1OU5xbEh5MktlanNm?=
 =?utf-8?B?aUdvWTkxLzVnWEE0U2dQQWNncG8raXpxcm1FeGJmMXlrUW8rUmJJQjU5M0Ny?=
 =?utf-8?B?ZHpBdjlDc2Qra3dDeTJOWWpDMXkvL3BCSDdxZXpWbjRHR045UnRjMHcxMVRl?=
 =?utf-8?B?aHhrVFFweHZvcVlxdHovM0pjZXA5aXBVVDJ4cVcvaXBGWVZPL2VZcTV0cHpP?=
 =?utf-8?Q?aJuayMjbn2qD9WSOPI3Dn5806?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	o0qatd1P/0PbKjRNRLmnp2x2cJjl36rKp/WJ+ixmTjZpSZUMKOSHKPnnG50Fij1S/JsQEJBc21VSSG1Dn6ZA0xjwUfew7RolGn0HBQW8380XIiV56954wY1XzSW73E8OdQQqJjLo6W9RiMLcPDdjt6Jo+KlWaSolK6Uqy9s/MnD5BEBw8ZUZZyTYF8CFEtVXOkBvRKWp3ZiF8g75f+RzNJPy5z7sZB04VlF9bIVDw9BTZhjbTTZTGWF7cGK3hNx9GQKg6UG2U3JP0Sq+NkNbpZkiiGf3b0oejhNza+NI011thlEjaLLr/HE2hQpsC83GTH65n7Qu2dW7e0UtrjlYy+Vy7JJ+/Za0xlv4JBa+MKE93sBhxAaKpbZxKokfJboy2gq9Jv8xPxtZTWH5BG3BRfaH1JeAM/69z6YihqM4K9L7bSYUuA3qGSWVvS4LXFqgccTchcs8rONRj7N6R75UOG/4q9HCgyVC6itG9eUAjyS3FOIdhxEWL0QSldpn6bVbF1dqHlsegwiYT3hIKFN+bG/pLnxgHUm37Hbc852/Rgio0mdsGmkxkrFwKXFHWEX29mgJQrdwzdEkcV+pUX/MLbA9MJRYywbCSu8f4N/SLdzapGqUQGU96wiHfyQpwK2L
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b8172b-4eb9-496b-01d9-08dc64ec2d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 05:54:31.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NajKjkqAX+/uZupZsNLuCf7IaUmrxSKLnwvos4kw5VwyFbFZzhc9LqI/+0TdPVPIQo1ZCrQE3QMaVuqBR0+UPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11736
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198695

SGksIEFsZXgNCg0KDQo+IEl0IHdvdWxkIGhlbHAgaWYgeW91IHNob3cgdGhlIGFjdHVhbCBjb250
ZW50IHRoYXQgaXMgYmVpbmcgZml4ZWQuIEUuZy4NCj4gdGhlIHByb2JsZW1hdGljIGxpbmUgaW4g
dGhlIGhlYWRlcjoNCj4gLSBiZWZvcmUgdGhlIGZpeGluZw0KPiAtIGFmdGVyIGJlaW5nIHByb2Nl
c3NlZCB3aXRoIG9lX211bHRpbGliX2hlYWRlcg0KPiAtIGFmdGVyIGJlaW5nIGZpeGVkIHdpdGgg
c2VkLg0KDQpJIGhhdmUgc3VibWl0dGVkIHRoZSB2MyBwYXRjaCB3aXRoIGFib3ZlIGNvbnRlbnQu
IFBsZWFzZSBoYXZlIGEgbG9vay4gDQoNCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlcg0KPiBLYW5hdmluDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgQXByaWwgMjQsIDIwMjQgNDozOCBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBm
dWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2Ml0gbGliYnNkOiBGaXggY29uZmxp
Y3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuDQo+IA0KPiBJdCB3b3VsZCBoZWxwIGlmIHlv
dSBzaG93IHRoZSBhY3R1YWwgY29udGVudCB0aGF0IGlzIGJlaW5nIGZpeGVkLiBFLmcuDQo+IHRo
ZSBwcm9ibGVtYXRpYyBsaW5lIGluIHRoZSBoZWFkZXI6DQo+IC0gYmVmb3JlIHRoZSBmaXhpbmcN
Cj4gLSBhZnRlciBiZWluZyBwcm9jZXNzZWQgd2l0aCBvZV9tdWx0aWxpYl9oZWFkZXINCj4gLSBh
ZnRlciBiZWluZyBmaXhlZCB3aXRoIHNlZC4NCj4gDQo+IE90aGVyd2lzZSBJIHN0aWxsIGRvbid0
IHF1aXRlIHVuZGVyc3RhbmQgd2hhdCBpcyBoYXBwZW5pbmcuDQo+IA0KPiBBbGV4DQo+IA0KPiBP
biBXZWQsIDI0IEFwciAyMDI0IGF0IDA0OjA4LCBNYW9odWkgTGVpIChGdWppdHN1KSA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFBpbmcNCj4gPg0KPiA+DQo+ID4N
Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIGxlaW1hb2h1aQ0KPiA+ID4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFNlbnQ6IEZyaWRheSwgQXByaWwgMTksIDIw
MjQgOToxNiBBTQ0KPiA+ID4gVG86IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPg0KPiA+ID4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjJdIGxpYmJzZDogRml4IGNv
bmZsaWN0IGVycm9yIHdoZW4gZW5hYmxlDQo+IG11bHRpbGliLg0KPiA+ID4NCj4gPiA+IEhpLCBB
bGV4DQo+ID4gPg0KPiA+ID4gPiBDYW4geW91IGV4cGxhaW4gYSBiaXQgbW9yZT8gV2h5IGFuZCBo
b3cgaXMgaXQgbm90IGNvcnJlY3Q/IFdoeQ0KPiA+ID4gPiBpc24ndCBhIHNpbWlsYXIgZml4IG5l
ZWRlZCBpbiBvdGhlciB1c2VzIG9mIG9lX211bHRpbGliX2hlYWRlcj8NCj4gPiA+DQo+ID4gPiBS
ZWZlcmVuY2UgdG8gaHR0cHM6Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcsIGJ5IGRl
ZmF1bHQsDQo+ID4gPiBsaWJic2QgaXMgYnVpbHQgaW4gYW4gb3ZlcmxheSBtb2RlLCB0aGUgaW5j
bHVkZXMgaW4gdGhpcyBjYXNlIHNob3VsZA0KPiA+ID4gYmUgdGhlIHVzdWFsIHN5c3RlbSBvbmVz
LCBzdWNoIGFzIDx1bmlzdGQuaD4gd2l0aG91dCBuYW1lc3BhY2VkIHdpdGggYnNkLy4NCj4gPiA+
IEl0IHNlZW1zIHRoYXQgbGliYnNkIGlzIHNwZWNpYWwuDQo+ID4gPg0KPiA+ID4gQmVzdCByZWdh
cmRzDQo+ID4gPiBMZWkNCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4NCj4gPiA+ID4gU2VudDogVGh1cnNkYXksIEFwcmlsIDE4LCAyMDI0IDE6MzMgUE0N
Cj4gPiA+ID4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4gPiA+
IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjJdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9y
IHdoZW4gZW5hYmxlDQo+IG11bHRpbGliLg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUaHUsIDE4IEFw
ciAyMDI0IGF0IDAzOjIzLCBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PiA+ID4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gPiA+ID4gPiAtIFRoZSBwYXRoIG9mIGNkZWZzLTY0LmggYW5kIGNkZWZzLTMyLmggaW4g
Y2RlZnMuaCBpcyBub3QNCj4gPiA+ID4gPiBjb3JyZWN0IGZvciBsaWJic2QgYWZ0ZXINCj4gPiA+
ID4gZW5hYmxlIG9lX211bHRpbGliX2hlYWRlciBvbiBjZGVmcy5oLiBJdCBpcyBuZWNlc3Nhcnkg
dG8gZml4IHRoZSBwYXRoLg0KPiA+ID4gPiA+ICtkb19pbnN0YWxsOmFwcGVuZCAoKSB7DQo+ID4g
PiA+ID4gKyAgICAgICBvZV9tdWx0aWxpYl9oZWFkZXIgYnNkL3N5cy9jZGVmcy5oDQo+ID4gPiA+
ID4gKyAgICAgICBzZWQgLWkgJ3M6I2luY2x1ZGUgPGJzZC9zeXMvY2RlZnM6I2luY2x1ZGUgPHN5
cy9jZGVmczpnJw0KPiA+ID4gPiA+ICske0R9JHtpbmNsdWRlZGlyfS9ic2Qvc3lzL2NkZWZzLmgN
Cj4gPiA+ID4NCj4gPiA+ID4gQ2FuIHlvdSBleHBsYWluIGEgYml0IG1vcmU/IFdoeSBhbmQgaG93
IGlzIGl0IG5vdCBjb3JyZWN0PyBXaHkNCj4gPiA+ID4gaXNuJ3QgYSBzaW1pbGFyIGZpeCBuZWVk
ZWQgaW4gb3RoZXIgdXNlcyBvZiBvZV9tdWx0aWxpYl9oZWFkZXI/DQo+ID4gPiA+DQo+ID4gPiA+
IEFsZXgNCg==

