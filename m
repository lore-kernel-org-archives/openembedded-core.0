Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129F7D42BA6
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:23:29 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.60])
 by mx.groups.io with SMTP id smtpd.web11.90956.1731428606527602295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 08:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=DEnCL0sP;
 spf=pass (domain: infinera.com, ip: 40.107.102.60, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix4djcEzp3FjlSLdWIoUt7KGghPelB/lWFKGW7O+SUTLNV+9TvKTKVQLLYBTvtM8xWE8SWV9dGZq/WtCI3HQRMJRvfmDlKQiv1+Wq14dMSNSnJICEsYPMSuyLxzYDaw62/6NwwyKVvh6H2MFIq0CPPqBhwjhXfkaeScBnKnwotOtjxRi4miPgtDJ7UE0ae0tASzGiyLa4HJKNDp1+spmzGllLW8hq+d4oBy2jlBgNcJNe17J0AnnIaWaDma5mr6Bkz46sA6sU7gzar2SBfCgXLgCteJtqUVq/g4Nm+NfJ2+VUqi6A9+V+WboRbm+QXBHScial87yADxYOilC9JAQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi65qfvuhK9wkpCA0cGS4aUvMx7VcgdShchUZM8rbxw=;
 b=L2yV+wAVZS8No0Dm15MhZQBZSRXOhuJiNniRfpLkUMDv57MCQ7Sh7WjiO8q/L1hvqcFVJUQ7P5u+iJ02JGnNt46t02eB9Y0hv2m2BAUY8tXAQ4sGtjq+y1iPSSru6ITgz14ExlgUHtsQj3A8ObKrY0oxcpZQLZcELR/imfmHEJME2Y6fW91BgEDtsRbtV178EvTGkGBT6cMjCCMlNmOd1Iat9hEeXO9y43j7ugR954GfWA2CdLTeWk/QTuLCKYh9iXhkEbJeVzVRbfaRx0gHF2mX+cQls7bny3mw5zgW8gy5GZHYOwUhDv1gdmsyxxeyBuJdP4ZmcyQYHxDjvU+8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi65qfvuhK9wkpCA0cGS4aUvMx7VcgdShchUZM8rbxw=;
 b=DEnCL0sPzsN+RiSCc7dTppBCf0H7WohsNZNSFWURP5gxCw6+aLHY88bTXK7gIQcL5J3wKU+SdvXKNSEfN0cKKov/JRyQzjwD3QTugrqTf+mUcMWSYpfTb3uPA136CZlr+rG1ygvKlvqjpULVb+eG8oAEE0FXvwWA0Wk/FgtmHCW7nCzyO+/vYw2we+7gjZv/p9LjnGNlf13lgOdCkYLDgumSi8gQQDGRtyEoahkTQPNPTbZEmiM+fk9mP5AJtc4u2IpX2y85lYtcqEk03XgFD/5XiTS4JXtmN6WZLtklT44rACJKDMRgYOYEnh4FfMSCf40tQu11wK2kl5mqHcAn3g==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by PH7PR10MB6036.namprd10.prod.outlook.com (2603:10b6:510:1fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 16:23:23 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%3]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 16:23:23 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: musl multilib arm/aarch64 SDK uses wrong size_t ?
Thread-Topic: musl multilib arm/aarch64 SDK uses wrong size_t ?
Thread-Index: AQHbNR8xYlQvX4tw7062Piukmltn7Q==
Date: Tue, 12 Nov 2024 16:23:23 +0000
Message-ID: <ad103c6730541411ac525bda25bd73409a1ab227.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|PH7PR10MB6036:EE_
x-ms-office365-filtering-correlation-id: 6e5b99ce-3588-4631-2846-08dd03365447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?alpTL01SZVRBeGxLMTJXeFJ0UzZwYnMwM1FzV0I2RExuRXBaNnY2RWVIVk80?=
 =?utf-8?B?czVpK0RjNkFXMmZTaFV4THlFQzJRWElsZkZJUE16UTd6SHlzOTFUZkxVbkZH?=
 =?utf-8?B?Q3pvVE9ZcW91U3kzS0llQnZMT1pFNTEva2QzOCsrbUxQRGExRTJkRjl3bkNO?=
 =?utf-8?B?SGdwejJWby9PN1NIOGhnYnZZVURzT1N5L2ovOW5EbGMyb1RTQzlPY2g3UmV1?=
 =?utf-8?B?eGJJQlNydzVzZklxTG5hb3dqRVdHSEZsQ0ErbWJpRnZ2dE1UVWpjOG1KU0t0?=
 =?utf-8?B?cmRvU0UybkI5MEpRMUJBQ2cxUVV0c3Z2VWZrSVM0ZGpGWU1DTmdmdHlsMzZj?=
 =?utf-8?B?MnVoV1RtYWE5Tm16cG93ZGU1K0NSMkN4NWJqbXV2MmEwenRrUGdGL080bk5X?=
 =?utf-8?B?RUJhckJHcWhBcFRQdFRkelFuZVRXU1JVR3JSNHpXNVc2NmdhSEhFUlo1U21V?=
 =?utf-8?B?ZTlQSzhrQ1NWOUdrVWtLOW9sL1NIa1ZFVGlVOHhXNFZnaE9yQWVzQWI0Ukc1?=
 =?utf-8?B?L3U4WS9nNk9lazI2U1N2Y2dNZkRVeFpxVVZWVzY5NXZqamk5R2ttK3IwYW5m?=
 =?utf-8?B?Z1ZWT3A2RGxGV2VDUGswSnU5SVV5R054OE8yRVQ4NldTaVRHUFoyMHp5MDJO?=
 =?utf-8?B?L0hsNXlUdTlnblNjVkF5aVBWTURFdllmOGt3bkI1dUpicmN4NzFnMEdYNWli?=
 =?utf-8?B?NzFDeFdPWnVxY01RclBBb0NIQWxhN2dScWxHWWpWNnpUUCtUT2Y3QUhyTG1Z?=
 =?utf-8?B?NjlOUnlBTUFBOTVmVDNoM0FnaE9ZUkpYV0JQZzBtWjRYMzRLYXQ4V2FIU2Z2?=
 =?utf-8?B?UEdUQ3VJVEdML1AvUXFTcDlMd1EzcGc5bDVIMjJTNy9VVHJOVVQrckU0ZlVi?=
 =?utf-8?B?UUs1MnZMazZweW8xTExwYXQzYjhJU1RjbmRpNjhQblNjaXBuNG9SVEdhYVpC?=
 =?utf-8?B?ODV1ZFc5c1FmNmZTSTdkT0EwTlhHU3hKM3czbi9kTHlIS01OT2p1T1VaRjla?=
 =?utf-8?B?RTVmSjR0OFRtdHhRNTdVblJBQ2RvQk8rbEFBTFRiWHVoVGJqRGdoUk9tZzh2?=
 =?utf-8?B?TlFBQkxLMTF0YmR2ZFF3NHM1aXRJdFB2bWorTDRIWGtBQVhaMUo0c2dIRVl0?=
 =?utf-8?B?KzZNb1c4RU84RWtOcXZYTmdQRnNETUJ3cm93NGh2c255Z2VCUFZtdm5KUll3?=
 =?utf-8?B?aTNmdVNFQ1VMRTBkdG50b2o1UCs1SHlERGE3d0R5RWZTZDZDNHE3czEzdlY3?=
 =?utf-8?B?RVByR2lxZU5sZGg1NjcwajdOazQzKzF0c3VZcVBKb1o1ZGpDemhRK1Zjclpv?=
 =?utf-8?B?T0x4L1ZFd01IaHUvOTFvRVFVNkg4cFpxS1lLdjY0RjBLbGcyOGhkUVAwd2JQ?=
 =?utf-8?B?Tk9jYVRFS2lBYytoaGFxZit5SkIzdnF1bmhDK2EwYlAwNERYcE9RVFd5SVI1?=
 =?utf-8?B?NHNqc3VTRjFOUGt1N3QxajE0Ly9xb0JPRCtGdXdwbVpLVEUxQThXbXBvRnFD?=
 =?utf-8?B?R21mSllhSFpJUUNTMmk4STRPYU8rdkxYUld1cTM4OUkrUFY4RWtuQVJqeXYr?=
 =?utf-8?B?Y0p1TGVHUm04SEt1RDNCdVhMZ3orNUQ4SVhia202RXBSNHN5Z2IrZDZyTFdH?=
 =?utf-8?B?dFJ0Ly9PbUs2bGpqTkxOTitRVFc4UGE4RDBBKzBaR1NTYVE0NDhGUjIrYUFY?=
 =?utf-8?B?dm9qME9hVEEvTTVkeTZ3bzB5WmNkMnc3Ums0L1RFeWFxbTVPL2R4ZVVDTmJ5?=
 =?utf-8?B?anpiak11QkY1UWZoTDcwUGNBWFgwdFV6RjM4ZERhOHcvdGJzYTlubmxOdVlo?=
 =?utf-8?Q?loKq8UG0Dky6+I8MGRLTfP+GR03iQwpKtPv+Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmpFWTMzYVV2MmhWVW1WSVczcldMa0ZOaXUzMmNoR2R2bnlHZ2hWdno4dzNm?=
 =?utf-8?B?UWNwb0RuN0hKeGJZbXVSWEZLaWpwcDh0U2M0NnQwYkRQUjVNbHMzSW8zUzRq?=
 =?utf-8?B?ZDkyTHdvYVVybnFHblJkRklQQ1R3cTdkN1BYWVJ0eFNTaTU1MFNBWEp6Y0Nr?=
 =?utf-8?B?UWxrZXVjMjBWdkRobjFwTjI2NDhoNWhtaXNCejFLTWFrL1FsSDBybkUxMjNR?=
 =?utf-8?B?Q3ZsQ1NpVXMrTTVacWM0MncwRlJlK3lFOWxxRGJuSUtaOWdockR6MFYxSlVu?=
 =?utf-8?B?NUhWa082aCtwNjBidlppMkdkSzZyMTFKQmd0dE91aGtUQ00zRnFWMmIreHdD?=
 =?utf-8?B?dEh1NHJBa2xZNXEyUUwwRFNFM0d3VFNtU0JnVmlrWm96QzJxVTk4MU45RUc1?=
 =?utf-8?B?dW5NTTRNb0VMN2JBZFRNcWw1OXBMSkZjM3JLVXBpbnFPeVF4QVBhQ1RVanZJ?=
 =?utf-8?B?ajFOU2JRUFFIWkpNMGUvOTVQb0wrUSswWmNZbCtDY3B0WkVLRWtSYzFzQ3ZP?=
 =?utf-8?B?Yk9Db0o3b0xSOUFjY3R0ZnZrQnlCTi9pY1hzYW5oNTErRVVLWDlJWmlHT0Iz?=
 =?utf-8?B?dUp2eWs2MTJWK1lmNFNKVExEWEhIZUZrSk9zRkRwYU04cUpnQXIza3hUb2tn?=
 =?utf-8?B?SnpqWDA1ZlJnZkZIQVhFcHdSSG9HekNialBYcm5YU3R6SGE4UmNUQjBiMUNE?=
 =?utf-8?B?d2hFWmhlMS81bEFwTG5kNWU4YWxpUUx2MGFWVjl3Q0Y5TjZvY2lWbzY0cDV0?=
 =?utf-8?B?UWRjS0V2QzNpWFF6R2FCaDNZWFVIaUZ0YU1pMlRsM1o4cWNrQW5qcUMydUg1?=
 =?utf-8?B?WndUYTU0bG1Uai9OZHNkMldBa3VJODZkL1k1ZjR3ZzM4UHoycHpZbXl4WWNO?=
 =?utf-8?B?MVZXVWZjSExkUmRDdlpLWHU3Q1FWRFloSlhZZmM1ajdxMGJVZHR3VGtkYWwz?=
 =?utf-8?B?RHZ2TzB4V3czdllTcnY1ay9LSTh6Szk2NzJCT0Q1N1dpdVBwVDBERFdpcEQy?=
 =?utf-8?B?bkZhb2hhbWdidEZWbnJLLzQrbUxta3pkK2ZCMU43VWR0eUljQ3NLZkk4MHp3?=
 =?utf-8?B?cnh5NkVpZmhQQmtBbTJGQ0JwUmxhYXZhV01WcXVrUUdtL2FXMWhvdlFhYWwz?=
 =?utf-8?B?ZmlLV1JqRWszWkkzbjRkZnJnUU1WR0dHVzFaSDRPOHNRWEgzTEhuVUxqeERy?=
 =?utf-8?B?S3R4bTBOajdCV0taY1IrU3YzMGcxS2dPNU5NUG45elBGNk1pWXdjUnZYUUtY?=
 =?utf-8?B?U0FMejlZRnNLWENWWTdkbFBOS204S0Vnc1lYUVhKUFJvWUJSeEdXTjRES2VD?=
 =?utf-8?B?V1FBb0tZWUxDNzJCQkVOOUtkMmh0UmdkdjJGaE13TGNIMjNYVDZ0Smw1R3lI?=
 =?utf-8?B?V1gwdlRSd2FDZmY1RXBld1NBcmxjWGZtZzZCdGk1eEtsWHhPNmk5dGZTM0FZ?=
 =?utf-8?B?VkNnK0ZwWkdERllhYk9Za3FFclVIK3JXV0VZWU5mK25IWTdXNFJvTnJkdGZp?=
 =?utf-8?B?OEJUcXRPSm9YcXkwZGhUbEpmR3M3bGRIMmZMbDI1US9zQnVlTkxheTBRVWMy?=
 =?utf-8?B?dWl4RFpDWFNXMFlIa3psdjMwTDFRbWNoUUkyakFPcFRQd05ubHQ1cy82VEIz?=
 =?utf-8?B?cUcrOHpPTldoLzBDUTVDQSt0YTBHNUI5bTJUbUdkSWd4ZWNkSDRvbDBnd0lD?=
 =?utf-8?B?b0h1dHdwWEMyT0E5ck8yQ0NUSE5JbWE4dGFmVk9xVFZOMnRzZWVhR0d1aWlH?=
 =?utf-8?B?NGJOUitsalFnMXc3Tk40NGcxVmtRdEl3UkJpNkxHaVhzMnZuOG9wbnpoYXdK?=
 =?utf-8?B?T2NiN0hhSHoxQndBODZPOVJjR2oyaGZ1YkxKSjlnZGdFZklLY2ZGVmdFYUUv?=
 =?utf-8?B?M0d4TGtBUmtkaVZQUDVTV0pZbVBoQnhSQnErd0FhUk1TUkU2QUhLWDNMVFQ3?=
 =?utf-8?B?MTkzUXBqN1paM0wrRzZrclN6Nm11NjAxMVhrSTBuRjJvQjYwZEdPR01XdXpo?=
 =?utf-8?B?ZmdBS3c2TDlFeE04cXRoa2d1MWpZNnJqbHhKKzZMckZNRytKVjY5U0FDVUNV?=
 =?utf-8?B?Z1JWVUEyTWF3ay83VlpFZ3dhZlo1bFlWTE5CdHFlbldNaEU0bkFSWTVVZC8w?=
 =?utf-8?Q?o0i9Ew1EXGWQeGnHQrguKigHj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2F9B27B6B6D504BB6510A3A1D9644C4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5b99ce-3588-4631-2846-08dd03365447
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 16:23:23.2946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JG6xB2xMDLnVEwaTZiF+OCWjykxXYkiAlZBIGdomhAyDPaVs2+OjhTONTK3yYtkF1wpFC9OZ9RCt39FP9av41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 16:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207059

SW4gb3V0IFlvY3RvIFNESyB3ZSBoYXZlOg0KY2F0IHN5c3Jvb3RzL2NvcnRleGE1My14ci1saW51
eC1tdXNsL3Vzci9pbmNsdWRlL2JpdHMvYWxsdHlwZXMuaA0KI2RlZmluZSBfUkVESVJfVElNRTY0
IDENCiNkZWZpbmUgX0FkZHIgaW50DQojZGVmaW5lIF9JbnQ2NCBsb25nIGxvbmcNCiNkZWZpbmUg
X1JlZyBpbnQNCi4uLg0KI2lmIGRlZmluZWQoX19ORUVEX3NpemVfdCkgJiYgIWRlZmluZWQoX19E
RUZJTkVEX3NpemVfdCkNCnR5cGVkZWYgdW5zaWduZWQgX0FkZHIgc2l6ZV90Ow0KI2RlZmluZSBf
X0RFRklORURfc2l6ZV90DQojZW5kaWYNCg0KVGhpcyB3aWxsIG1ha2Ugc2l6ZV90IGFsd2F5cyAz
MiBiaXRzIGJ1dCBzaXplX3QgaXMgdW5zaWduZWQgbG9uZyBvbiBhYXJjaDY0DQoNCm11c2wgQkFT
RVZFUiA9ICIxLjIuNCIgaW4gc2NhcnRoZ2FwDQoNCg0KIEpvY2tlDQoNCg==

