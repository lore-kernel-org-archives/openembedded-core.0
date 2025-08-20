Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C39CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 09:08:50 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.web10.15605.1755680922224615162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 02:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HPNQGR9g;
 spf=pass (domain: axis.com, ip: 52.101.70.3, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7GWuzRE3yivMcXOpy+eT9IcaZoP3RYCcIFYs2zpzU8BsRC6A58JbiIeLuB5u6P1RMdISB5sLsUCNje9p1jDfvthCBkF1UrkEreqJShgxkjLuwwabIX5wf9A+V6bHw33/0Prormw5+xCXoaaVgZWDISAhduR/JBTqA6xUAGV+Tzu2rt6cu1NCJ1EjI5PjDDBN5G2SGYm8oJv1z2qhlEyJf1EVjAuvTCKSyGsoVpw6hJeMwFDvrOp8m/syP5l2hmbCfqySzk2dhMUCuoSNEaCDnfQ5z4y694Ca4fnj54WTy7cVRDM8A1vrer4AQrOarPgoQopYuYC7m3HpU+cdDNe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRmnP1lcoJ2HgovRT5i/iJu0Y2Hfgj7ZwNiKhHIpkf0=;
 b=c+xWq4NEkmfShPWOPxB/1P8WB/eHEHzm2wsvC08fz5FVzsrsfbqpS3cnze8WM8iqX3zEuh6v06Z2K55a3wKuRxRGvLumG5Tm7iVkxVxgXpum2HUdpoxtvR1GmYkyahtymSJorKowBZ/zscuBM48xHDGan7rN424uiV3J2MGo5zgujjUCy97wr7vvotpDEx9XZVoDZo3xuN8UDNmb2yakYpdsRjAAofEvqJnxlUVdTl/0WuNHTPJPE2Qbdc/RqPJwmucQcxM9zbdsYPaCX8fwrq3GUySTvYoQ4SOUc6hvmP8aWPB1+/RYgaCBKvZBCX2hdXKmj6C0uW01DB4pODB6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRmnP1lcoJ2HgovRT5i/iJu0Y2Hfgj7ZwNiKhHIpkf0=;
 b=HPNQGR9gzslpgwcHFPYtLCFp/n3yGtoucV6XKzTmyY354v9FQrtZVsdG3dZulecwMJTv6fVk3bLZWsVisby6DdMjy7QdIS337Dng3glhQndXqHJn4GuLi5OTNuAooi7lnwl74kjz/Zr8B4mghBtKojJC7qBmKdh1DfKzvmt9NnQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6428.eurprd02.prod.outlook.com (2603:10a6:102:74::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 09:08:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 09:08:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv4 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcEMycF9WXsHvT4UOGMQ/YapscnLRrObsQ
Date: Wed, 20 Aug 2025 09:08:37 +0000
Message-ID: 
 <DB5PR02MB10213A1E35598F2EBC48B4F7AEF33A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250817201832.2462509-1-pkj@axis.com>
 <DC660IEPZE9T.1VEW6S4PFZICU@bootlin.com>
In-Reply-To: <DC660IEPZE9T.1VEW6S4PFZICU@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6428:EE_
x-ms-office365-filtering-correlation-id: b99f15ba-e099-4b1f-f4ed-08dddfc9264d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UEhkdHJhUXFRMXhlS0dTcGJjZUZzbUx1M2VlUTRRZFpiQTBOTzM4TFdDWHdt?=
 =?utf-8?B?TGtvcGZia0lNTmtWeFhBU1FiRW10SDY3RFArREViN1RlOVkrY3RkM1RKcXha?=
 =?utf-8?B?eUJSMXp4N3JLYTQyTnc3SEk2TnNtcFZ4aDg0QXVlVVZFK0RPbVpnTHZKZXBt?=
 =?utf-8?B?Yk0vZDc0S0JvT0trWmlsVDJYRjJKS2xCZlNrTnJkcDl5bHBpWDBzakZhK1hH?=
 =?utf-8?B?d2lTNWc5Qm9uZTNRVnRVQ3dkWmlzREZndkJseVIyWE5vVTR5VXBrNnNndTg5?=
 =?utf-8?B?aFRmUWFERHIrdkVCVnhEbjN6QVZnSlhXdEhlb00zdldlazhKb0g0TmRDd05u?=
 =?utf-8?B?cmNGTFhnVExDS3NlNUxJekxUV3paeWczNXk5R3RuMEhjSDNCRWkyM203MmF1?=
 =?utf-8?B?VmsrQ1d1aHdoNWFlT0NRQUtob0VzREFIOTJjQ0hNbWZRWkgvTCtyMlY5RVIv?=
 =?utf-8?B?K2lCeW1JVFdxNWkzNXZwNFZncTZGWHU4dGt5T0ZQaFFNV0I5OWVuQ2xvbXdN?=
 =?utf-8?B?NmpUTGtHQW9yZGI2TGErYmc2QjM0UEJ5VFB4REhaVmtHSTZXbzRKbU13YWJK?=
 =?utf-8?B?dDJ3NFVSU2NuMVBpLzJJNitsZUk4TExHT04xUFB6aFRSZEpKbUxmSlF2V1Bj?=
 =?utf-8?B?VFlyY0s4QkxzYS9Pd2pMOHc3RlU3RU5NeEJMZFIvV0FiTWZLOXJxK05GRk13?=
 =?utf-8?B?WlQ3b3p4MlhYYXhYODZFOG1oZG1uRnVwc3VVRXBJNFlKT2F6VWZpR3VGME1J?=
 =?utf-8?B?d0pvdlBBNCtkeW9IYmREZEtGNmdGUDMrRk5FTm1KUTlxMUtubFZTd1hmMDE4?=
 =?utf-8?B?c2Q4NFFreVlmY0ZKUFM3eUVMN0tmM1liY3RINHQ2cmpJUHY5VHhpbXFXbnR0?=
 =?utf-8?B?TlhQKzZjZVRLeiszdUgzY3luSDkvd1JBbVhHR2trVjFyVFBtdGhiTVFNU2Ur?=
 =?utf-8?B?S09qaDBoNmg2eWdEdmlHWmQzTkJZOUwwZDVVNDQwOHdPVUxMMWdMN1FwU1N2?=
 =?utf-8?B?bzFrY2ZrNFEwa3RiQkFrRm9ldDdoeE5yNm1wMGFjd1NHcWRzTTFFb2RVaW1Z?=
 =?utf-8?B?VWdyUjNheVRqU2cycnhsZ1pQak9UUWNyeXJkS0lSN3R5YjNWaTJ1LzE1S0N4?=
 =?utf-8?B?bGRRdkNRallOY2NsWlpiOWlnQ1RGSkdDdXhQWStnU3IzTHY2VXdscFFJdFpa?=
 =?utf-8?B?aERYTGhxQ0JSUW5VM0JzaXkyMXJjdjBoM2hjcjZ5Nyt1ZCtWZ2x2Wldqejdj?=
 =?utf-8?B?YlVDUE9yb3VJRk9QcHVZV3NtUm4zNHZKbXdtVk9MWURieGZKd2RrcHFtTWZ5?=
 =?utf-8?B?dUtYU1c4R1VuU1MzRlVHdzBmSGtDK1VYQUdhRlBMUjJlK2JkWjBodkZGUTkv?=
 =?utf-8?B?aDF4NFRtVkp1OWlaamJ4dGExQXlJS1lPNVdqTmFDMlh3cWJlNjlKbFhyRXZ2?=
 =?utf-8?B?b3c0a3lpQjdKZEtXcFk4OUt0U0V1ME1uQnlVbklidCtMUHJIcGlDcUtuTmFX?=
 =?utf-8?B?ZnFEazRHT1hxUThVZjVteTdkcCtPSGFBbHVWUG1tbVFJeTh6Rlk2bXB6Q1JV?=
 =?utf-8?B?NEp6NVdDQkNXcnIwWHcvS2cwUUZLQmcwNVZQbmc5cnBDdCt5VWkxRE5JOXBk?=
 =?utf-8?B?VHhpakRxaUVKaUNhM3VOUkhhTEhzRU5SL2svenpJL3lYQWlkOTdNYzA2V0tM?=
 =?utf-8?B?U2pnS0Y5Vm5lOEszdUpSUlQ3OVY4M2hBYk5BK0lJSCszYWRYZzFIYnBjUUlP?=
 =?utf-8?B?bi9tQTNNMjF0WlVPLzFVMlNrOVNLcHloekdXVTQ4Q1NhOVZ3eEZzL1FrQ0JM?=
 =?utf-8?B?WUdYY09WK1l3dWhjY3FmaWs4UEVBM2JYZmIxcXdHa3JpdjJGQ1htRHFhSktt?=
 =?utf-8?B?Vnp4UzJRb2tKbEMzNm1mZU5QSnBYYWZvUHVzYjhMb3N3SzMyUjIvdHV5c1VH?=
 =?utf-8?Q?8X78C+8tj5g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUd0OTBRaFdZUkZaMUhBMGpIMkhtOXJlOEJ3VElPd0xnZDA0aWhhZ3JOYlNj?=
 =?utf-8?B?dVQwZDM0WGFHblAxWFdOSktyNDFOUDlFYzdSZ2diUXl1R0ZDb2M1SVE4OXE5?=
 =?utf-8?B?Q0NyaFBqdW9PUmx6ZTNxMkZTZ3I2MENMcDF5L2U2NS9HZlp6MVNaVkxKTU1x?=
 =?utf-8?B?UzJLcnBjMjBWWEVZZVBNVlQ4d0hTZ0tCdWU4MEZhMlEzZU0yUk5pOVUxNDlP?=
 =?utf-8?B?UEhvQ3B3WXFmWmNlVkI3YVZGZzk3cEFXajllclYvVUUyUzJVZWhBZHY4T2R5?=
 =?utf-8?B?eTF3a3NKZktKZFdTNjBwTm5VNmxoRGNqTVJpZVBtZFN5KzQ2dS95a2V0a2ZO?=
 =?utf-8?B?N3dsV0RCcGRSSnB6T2NPSmpzcll0YU50K3hhazU0NWFLMmY2QUZZU1BMd3lF?=
 =?utf-8?B?YzRGMjYzVXZmT0ZOWEpYUWo3N2FkNUsrUmZxRUQ2ajdEZEZhMzZCazlPZnQx?=
 =?utf-8?B?L2ZEaWgzT0ZkSU5ONWR1M2V2WllLaVFlQ2ZHTmRTSUJQcHRpT2NqTnpTQWRs?=
 =?utf-8?B?ZFZTRWtaczBrZkxGSUU4b2tWVVRFOTY4cExwTFd2Q3N5K095bjQrcmtEWnpT?=
 =?utf-8?B?M1IvWnNGdnE4dCtDT2hTeFhzSmNTYVphZW9Od2k0K3J0V1Qxbyt2dk1zT0I2?=
 =?utf-8?B?RXlYTTloT0N1ZXczQXFFVFU5cU9IempxNWRZbVR4NVNEc3YwN0Yya1pSdGpD?=
 =?utf-8?B?MmR0cDFKc2R3a3IyL2ZzMWVWbTh0UElzR3B5b29MTkNHZERyTU5mMkU4c01E?=
 =?utf-8?B?MlBMOFpVQ3dnNEpjZlNKdW1FZEhDaXVtR01TRTVCa0o0MWVvblliWWZKQ1pG?=
 =?utf-8?B?U3A5V0JTc0VwMlpYYWFRelppZytKa3YzeFBsSnd3MEJFaVRSZmNNaE5qUTlk?=
 =?utf-8?B?ZUc0WlJSU1F3MjVuMlJjMmx4ekl4cTdYNy9TcUxaSGN3eDZYa0JhbW1PUmlU?=
 =?utf-8?B?ZDllc2Zvb213ckcwWVpsdFBXV29CcW5WdjJpSS9ZZFpnYXlSWnYvRFRVZVRI?=
 =?utf-8?B?V1Z4SU1Hcy94NmRKajQxaStoQ0lHdmJwY1JjSTVXMkxaQVNSVmRpL2J0aC9L?=
 =?utf-8?B?YTkxc1RLejNKTk5UR0tPeXhHUnpNUTU5ZzlrT0NBRTlFNzAyS0hUU1IvNHdh?=
 =?utf-8?B?NWVHU1N6Z3R6djVaT2JOVytTZCt1RDZBK1BGdFdxcTdjMkU0KzNUd1RmdU1S?=
 =?utf-8?B?NkNoUTNnSW9DOUd3RUNIMmQ3WjFsd3VjYzV1c28vRWorNlA0ckpBTGZadUhY?=
 =?utf-8?B?Rlk2VFlCclFnb0h2TjRlRGJxbklTWjVYT2lVRW1QQUpKeUVuWlZvSkRrZFRC?=
 =?utf-8?B?bFdMdHpudzloYWR4SXMyVys2ekVQK1oxdHlWTXhJQ0hJQzNQMjExSWxXeTVV?=
 =?utf-8?B?cHp5YmNFY25hbW5UZENVdkZmdVNlYThJVnI3cGlnVmtYTFV1dHYxaFNUbWk4?=
 =?utf-8?B?SGVTY1VYRGxDUnNnUTVRLzlGd3ZEbFJoQUVRN3hWQjkySkt0dksxcEJ4R3dk?=
 =?utf-8?B?NnY4RlBxSTE1Yis2K2tYSEV5SFhDOVJremdoZ3k3OVUvZGwyaUpoelJua08z?=
 =?utf-8?B?b012ZGdUSnhQVTlJN0xkaEUzbThGR2NDY1hWT2t0VXJCOHdrNE1RVFN6RWdo?=
 =?utf-8?B?Q0dFZy9ianhUdUE5UmxSRXF1aGJUU2JkNC8vRzNEbjZ6WFhaYVN4Qm05T0ow?=
 =?utf-8?B?VTdaY0ZhWWtqTGNrenYyNlVEb2ltSDdtYUhoU0Vka3hEdVRLaDd1VzJCSzRR?=
 =?utf-8?B?Y1lTMnlDUjAzREFma1U4ZlQrbG9DNUJJQTFKQ09ZMkY5dXNHZ2tnUWhRbHBE?=
 =?utf-8?B?WWNXR29ZOWRwNUxTZno4SlgvRWwvdUE1b08xNXpxTVBWbmovSXFGYXhOV0lO?=
 =?utf-8?B?blRYcWwwdjZYeWN2L295UHJ0SFNJTlZhYzFoZHNDOVhjQWQySysxdk9hKzNY?=
 =?utf-8?B?S25ySk1qcFlYUm1uWFJPM2ZMaG45c0dDWVNaT3RMQnZyV0VIZlA5U29jNUt3?=
 =?utf-8?B?NitaWi9RU0tFVUxVN3JkNUhTd1BCUmhGeVBqUzlYb1hsOGRYOTZQT2F0ajJV?=
 =?utf-8?B?Y2xaQ0lOaGljME96YThNRmN6M0pnQmhXZ1NaUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99f15ba-e099-4b1f-f4ed-08dddfc9264d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 09:08:38.0239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItLb4eiOgTaNI7OvHAAbljowpkvD5UX4P7lpENhv+aOkpHMch9jbAjwfrOQb0CbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 09:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222162

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDE5IGF1
Z3VzdGkgMjAyNSAwNzo0Ng0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjQgMS8yXSBzeXN0ZW1kLXN5c3RlbWN0
bC1uYXRpdmU6IEluc3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwNCj4gDQo+IE9uIFN1biBBdWcg
MTcsIDIwMjUgYXQgMTA6MTggUE0gQ0VTVCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEl0IGlzIG5lZWRlZCB3aGVuIHN1cHBvcnQgZm9y
IGJvdGggc3lzdGVtZCBhbmQgc3lzdmluaXQgYXJlIGVuYWJsZWQuDQo+ID4NCj4gPiBUaGlzIGFs
c28gYWRkcyBhIHBhdGNoIGZvciBzeXN0ZW1jdGwgdG8gYWxsb3cgdGhlIHBhdGggdG8NCj4gPiBz
eXN0ZW1kLXN5c3YtaW5zdGFsbCB0byBiZSBzcGVjaWZpZWQgaW4gcnVudGltZS4gVGhpcyBpcyBu
ZWVkZWQgYmVjYXVzZQ0KPiA+IHRoZSBoYXJkY29kZWQgcGF0aCB0aGF0IGlzIGJ1aWx0IGludG8g
c3lzdGVtY3RsIGRvZXMgbm90IG1hdGNoIHRoZSBwYXRoDQo+ID4gdG8gd2hlcmUgaXQgd2lsbCBl
dmVudHVhbGx5IGJlIGV4ZWN1dGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0tDQo+IA0KPiBI
aSBQZXRlciwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIG5ldyB2ZXJzaW9uLiBIb3dldmVyLCBpdCBs
b29rcyBsaWtlIEkgc3RpbGwgaGF2ZSBzaW1pbGFyDQo+IGZhaWx1cmVzOg0KPiANCj4gRVJST1I6
IGNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IFBvc3RpbnN0YWxsIHNj
cmlwdGxldHMgb2YNCj4gWydpcHRhYmxlcycsICdvcGVuc3NoLXNzaGQnLCAnc3lza2xvZ2QnLCAn
dm9sYXRpbGUtYmluZHMnLCAnc3lzdGVtZC0NCj4gbmV0d29ya2QnLCAnYXQnLCAnY3JvbmllJywg
J2xvZ3JvdGF0ZScsICdvbmx5LCBjb25maWd1cmF0aW9uIHJlcXVpcmVkIG9uDQo+IHRhcmdldCcs
ICduZnMtdXRpbHMtY2xpZW50JywgJ25mcy11dGlscycsICdwc3BsYXNoJywgJ3J1bi1wb3N0aW5z
dHMnXSBoYXZlDQo+IGZhaWxlZC4gSWYgdGhlIGludGVudGlvbiBpcyB0byBkZWZlciB0aGVtIHRv
IGZpcnN0IGJvb3QsDQo+IHRoZW4gcGxlYXNlIHBsYWNlIHRoZW0gaW50byBwa2dfcG9zdGluc3Rf
b250YXJnZXQ6JHtQTn0gKCkuDQo+IERlZmVycmluZyB0byBmaXJzdCBib290IHZpYSAnZXhpdCAx
JyBpcyBubyBsb25nZXIgc3VwcG9ydGVkLg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvOS9idWlsZHMvMjIyMg0KPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yMC9idWls
ZHMvMjIwNg0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUv
Iy9idWlsZGVycy8yMi9idWlsZHMvMjI2Nw0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJv
amVjdC5vcmcvdmFsa3lyaWUvYXBpL3YyL2xvZ3MvMzI4MzM1Ni9yYXdfaW5saW5lDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IE1hdGhpZXUNCg0KSSBmYWlsIHRvIHJlcHJvZHVjZSB0aGlzLiBXaXRo
IGJvdGggbXkgcGF0Y2hlcyBhcHBsaWVkIGFuZCBzeXN0ZW1kIGVuYWJsZWQsIA0KSSBjYW4gYnVp
bGQgY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUgYXMgZXhwZWN0ZWQuDQoNCkZpcnN0LCBJIHdvdWxk
IGxpa2UgdG8gY29uZmlybSB0aGF0IHlvdSBhcmUgdGVzdGluZyB3aGF0IEkgYW0gdXNpbmcsIGJ1
dCANCm1hdGhpZXUvbWFzdGVyLW5leHQgaGFzIGJlZW4gcmViYXNlZCBzaW5jZSB0aGUgdGVzdCB3
YXMgcnVuIHNvIEkgY2Fubm90IA0KZmV0Y2ggNTEyYjRhZmEwODVlYjNiNzc1ZDgxODE5NTQ4OTAw
OTU5ZDA4ZjYyNi4gTWF5YmUgeW91IHN0aWxsIGhhdmUgaXQgaW4gDQp5b3VyIGxvY2FsIHJlcG9z
aXRvcnk/DQoNClNlY29uZCwgSSB3b3VsZCBuZWVkIHRoZSBsb2cuZG9fcm9vdGZzIGZyb20gb25l
IG9mIHRoZSBmYWlsZWQgYnVpbGRzLg0KSXMgdGhpcyBzdG9yZWQgc29tZXdoZXJlIGFzIGFuIGFy
dGlmYWN0PyBJZiBub3QsIHRoZW4gdGhpcyBpcyBzb21ldGhpbmcgSSANCndvdWxkIHJlYWxseSBy
ZWNvbW1lbmQuIEluIG91ciBDSSwgd2hlbiBhIGJ1aWxkIGZhaWxzLCB3ZSBjcmVhdGUgYSB0YXIg
YmFsbCANCndpdGggYWxsIHRoZSB0ZW1wIGRpcmVjdG9yaWVzIGFuZCBzdG9yZSBpdCB0b2dldGhl
ciB3aXRoIHRoZSBvdGhlciBhcnRpZmFjdHMgDQpmcm9tIHRoZSBidWlsZC4gVGhpcyByZWFsbHkg
aGVscHMgZGVidWdnaW5nIHdoYXQgY2F1c2VkIHRoZSBmYWlsdXJlLiBJZiANCnN0b3JpbmcgYWxs
IHRoZSB0ZW1wIGRpcmVjdG9yaWVzIGlzIGNvbnNpZGVyZWQgdG9vIG11Y2gsIGF0IGxlYXN0IGFy
Y2hpdmluZyANCnRoZSBsb2cuZG9fKiBmaWxlcyB0aGF0IGFyZSByZXBvcnRlZCBhdCB0aGUgZW5k
IG9mIHRoZSBidWlsZCB3b3VsZCBiZSBvZiANCmdyZWF0IGhlbHAuDQoNCi8vUGV0ZXINCg0K

