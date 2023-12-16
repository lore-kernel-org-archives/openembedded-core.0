Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE2C41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 19:07:42 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.47])
 by mx.groups.io with SMTP id smtpd.web10.1488.1702753656229922812
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 11:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nyc7DeSZ;
 spf=pass (domain: siemens.com, ip: 40.107.15.47, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P15l7uVXkf4oRG31QuzRSxqYIkGAxTLYAiISPVFc567nbv8TL99M1nyGQchHk3Rtf/r0jD5HTZgXQaFCCZzdL6IPRnuRiCzMIyj2lAB1KiFHUgYP2pObrq/xoS0yxhctxklGNMI49arEp1GtvwunX/ITHQxrVV+MRLRnNpsinbjHYW9Y4mW8/+BaEHp6ccQq8ICCzoO5nT6ELKxcDmmpwWMf+8NFFxf7ejg6P01/EF/9Ta9LBG3FqbjqAZFGkm7p/SNDsaYqBQZJTbXuyNk64a+UX08znE8ytoBxp18W6QXuXYa8ihIwMMtFG+MtxpB2u3F2mYpfxQ6/1paT5pDywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVVhgM805/Kde1o6c7+N8LdHZKeBfj5vrDt34j5Qdfk=;
 b=A9dKxGtcwD7L7ZxIjJEiAleEA6uQalI2hOyVB/FaCCXbCnKHf1FXQoF9gke53tz/cIEfwZjjD5bh87PU44ghhjvULxX4SI8qHm20zMPuJzUEjDaHIZn2GnboH92LnOvjaXtj8yTgHkOcEYArGNUW22/tgIE3zPi5aejxsPEulI2kc+YTih3ejSIX3JlfyKMGWizIZIJvEGIX2756Pev7jncSKWaeEp0PDsP/FsKqbOggO2fxrQoqxbyoE/O/S8FQcBkQQzBYSQ/Ia3mmFZ6IbM+m8jk8mcUSpty99gMsbhEr279mlTUjuWW8pOCekDHBmXeOV4wm8PQ/S1sWi9FjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVVhgM805/Kde1o6c7+N8LdHZKeBfj5vrDt34j5Qdfk=;
 b=nyc7DeSZzSKmfO7HvgvbCx1Z7Y8ogyP4CAUat7rWGV3XT30OG/I2oyROSM//5WlHIfaWnf6WxrlHV+X1xN2SoFwyqg+6tgjgCU1ZBEEQybAoLnQZhx0dGWs/hHTz/bpLh9ZD1wmKM5XDBcNbDU8xm50Qlj1kK/LHHf0y+riYZiB7Hkjn/wkfj99IwhxzZl6VG2C3jGR8r1/wurCjSAVVVX6DTJ725PHBYX3/6CZu8yYGsL7HyCv9KUkD/hU/6SULgQ193862DduVCIINhuSNTymAlvNBuostUMcBzwyLAKxqrOUiUR3Ye8sdIyYAVW+FtbvdRQ5jqzAyapmTvb5PeQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7374.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:616::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.33; Sat, 16 Dec
 2023 19:07:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7091.034; Sat, 16 Dec 2023
 19:07:32 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
Thread-Topic: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
Thread-Index: AQHaLghqvY4g3DRDuEa9HK2v46vwZ7CntbQAgAAIf5CAAASqAIAEhtwA
Date: Sat, 16 Dec 2023 19:07:31 +0000
Message-ID: 
 <AS1PR10MB56972AE01E7024356314F5ECFD92A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231213210703.667740-1-peter.marko@siemens.com>
	 <182ad0e88ab88b269d5b256406ca9bfffaf129cc.camel@linuxfoundation.org>
	 <AS1PR10MB56976720657BE061DEE39204FD8DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <333c5c8aed1e90baf856d16be2b33769e7ef6220.camel@linuxfoundation.org>
In-Reply-To: 
 <333c5c8aed1e90baf856d16be2b33769e7ef6220.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=02a49945-e889-4b44-af9a-fdc8cfb8162d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-12-16T19:05:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7374:EE_
x-ms-office365-filtering-correlation-id: 5bd85d0e-1b78-42df-11ef-08dbfe6a40dc
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m6gAwscVnyfWW7KVzxQx3BS3EcgPHvSsheWsFy9dYMI8S/g80pF9ZS5BchHLhK6zb5GRM8fUkKD2I5n4kCB5j2MNcuelPEsPmB0ELm82hXE/znbuSbEPZ+b6qiTj4JqXl3u+fs/saAhA+DEzgXz85p6UfM0a5X7nVDUENsR63w8ZQMxJpCINx7jB8fpHhvOLJx0fO6Pnwioa39emn4OWY/xKA14VNw1TJOI4UTQC/e7nqSg7lloauhC4FBc3eeQ+L12ghboNEbHCwSTb1cwA+KkK4DwcFghwC3Okl3ab8nlIpZ10Jf12/vmjD2g63Q8hdb+9OM5bXqRI1q+EZrzx7aH2iq1VV7nMTJAxteL4gjGKbio3oPqipnKp+joBWIghsKgLEUSfW22928BSc6V/skXc/QNzbz+9f8Ph/wTAq81NHHT7o2lEOPR6sSq401eVs5buznRCbUvM4Uz84y/oVos/AYcwcI/mFe/3X0AwA57bChEIw+8iCZ9BdKeb2UIdn5DH9n7c3RdvA7XHbaIrgQvuy7fnLlq58XA3OUyUQYx//ZigifB3L6/bLI5gDy28BJ3Usxe1k4BjItZTK5RWe/sVMjH821FfB3XmzXTXyGoL/TuNK50iJYhj5YuPM5W0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(7696005)(9686003)(6506007)(53546011)(55236004)(83380400001)(5660300002)(52536014)(41300700001)(4001150100001)(2906002)(478600001)(316002)(8676002)(8936002)(66946007)(76116006)(66556008)(66476007)(64756008)(110136005)(66446008)(82960400001)(71200400001)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NloyRWlRb1NybkNKNjAwNTdUUVRxVTMxTHNzNEVoL0prVGNHOHZtZlNCQWhQ?=
 =?utf-8?B?TEk5ZmU5MXJCcmcycEpDV2xtcUZBTmRsWlU3emhTQjNBclpKVTV1MkdJZVdL?=
 =?utf-8?B?RUEzTGNJSnZvbWR3YTZsL0pSdzl6eVd5ZG41S3dTOE5ESDM0R3ZuRmI1elgx?=
 =?utf-8?B?aUhuZ2U2b1NzVHY1eWxuM0NZdHhqM1NLdVdFakVUZEE5OVVhWGlCM0QrU0t1?=
 =?utf-8?B?RmZ0eDlhanhpMVNaVlh2Y0VLZFYzeFl0S29kbnlxUjAvNkFhaHp5TnhuVmUv?=
 =?utf-8?B?eUhVR29HV2YxRnBLNkcyQXk0U1hlYWdDSStKQ0YxNG16WCtiaFA4NndsWnR6?=
 =?utf-8?B?ajNpK010NGJIbmZ5Qkhhblk5bXZqeEpOK0ZJdUZ2OXduR3VDRzBKbm8vQ2pO?=
 =?utf-8?B?SnZYVWQwd0dNZWdyM21ZYmpXOTVzTDBMNjI4YXMwckJlNStIUjJtRmVneWg0?=
 =?utf-8?B?NnlOM0N5TVFSYXc0ZmZsNGFydnN5ckFLWmk2VGFTT1FpQmpsV25lQzNrcFp4?=
 =?utf-8?B?ZmpnUm0rRFp3Ykk2TU9UQkdwaUlta3Ywd0ZEZW1xdHh0WTdEWTEwYlJyWU53?=
 =?utf-8?B?aElsaXdpL0pFOTA3MktlK3BGS3hPeit5SU9rTklneEZTMUF2cU9JbTNHL3dF?=
 =?utf-8?B?dW9aamtxdy8vQ29WdWZRZkw3YjdQazdyNkhZRm5KZzQwWG1IR3hlN3QvS3hx?=
 =?utf-8?B?dVZLUjNBVUtIaHdnMFY3Qkp5cjhyWmxTODBmUThtVS9qZlhIRDRvYjlJbGFh?=
 =?utf-8?B?QWtUVVlHVlRLZkhISjdaZWJXZm5jOHRwTE1Ka1dSMGRXT3hwYjFqWlFsWTU3?=
 =?utf-8?B?L2tWRlRDQWVXbCtobUVZNHVGcnJIZ0x1dTdBRWFCYlhMelBTMVRZcXNRYVJ5?=
 =?utf-8?B?aXZkbGcrT0VXeG1DWTBQa2RpQ2dEZy9CdGtGUXhOYnEyVzltMHU5YnNRWWdU?=
 =?utf-8?B?S1V1MjFwVmlISzduekI2REFtaTBXYzdYQzFkVHAwVHdPRTNteHJUYkdkdWFz?=
 =?utf-8?B?bTNsSjNpVmpCT1lpcnp5WWFJNWpJaWVnVDl5YVpFU2o1cU5PdzREU2VkM3FZ?=
 =?utf-8?B?a2VGSXlxSnI2aDlnVDRWdDVQQWFhN2tyZFNPRWdMN3A3N2FzdTFZR1ZrUTdv?=
 =?utf-8?B?RnhOem1WTEU3dXAxcENRU3J1UFU1Zi9hb1lpSlZPSEU2VUpmeGpVcC96SFNU?=
 =?utf-8?B?VjZCL3VNQ0xMZk9aQThPbmxQS0IrZmZIZHhqWWhZeS9BNThYM2UydGZJNG1n?=
 =?utf-8?B?YWJJM3gveHpLdHJqelVqaVpLL0tIY1ZDRktOWE51MkNvTGxFWWNmUitERVpW?=
 =?utf-8?B?ZmxFd0o2SEVzbzJTWjFmOEcxMTFJVkZzaXN0RGtOem1wUHkwRmZHZ0tpa1po?=
 =?utf-8?B?d2FDMFlZek56SkcyOWlMRlJUL1dsUFo1ZEMvREs3Q3lLQnR6VEkxNDRQR3Zn?=
 =?utf-8?B?bjlGOElRY2pLR0VYdTF5ZVZ3SDUyY3Q2Y3JqK3l3K0UyWnh4MnVuSDdvcytK?=
 =?utf-8?B?RldVcnFCdmxCcmRzOXBaWGwzbEN4MEZHR2Q1MTRhb2YvZDk5dVZxRHlBVnBr?=
 =?utf-8?B?ZUVxTU9ZSzZ0cTVCM1JhZ01BWWJ5RG1PZ1VIMXhWR3p2M3kwMHZMZ3J3VFVw?=
 =?utf-8?B?NytjazhSVFNPRkZTbExEY01RVUFLTUExZkJnTnlBbGxjcGFwcnUvY1M4cndP?=
 =?utf-8?B?bEV3QXRETjN1WEdHOWNlSWRIbHN5bXlNY0h5Z1hZRnl3L3I1RUtJY2pjRzIv?=
 =?utf-8?B?R3UvaFdJQmhEMEJoTGl0N3JwN05UVTNVbDNHZkliemtWNGN0QmtRZDRQM3Vh?=
 =?utf-8?B?Ky9SdTNyQTRnK01uMXBIZTdwSmRocDFxeGI2azB2UXU3TldrTE9tVWFNN1lQ?=
 =?utf-8?B?Tmw4cTlOU1BqbkNiaGd4VDY0WlNUYjIxQytVWDd6RWEvcGluZFh5OVJEaTd0?=
 =?utf-8?B?M09TTXhOUXFxZHczSGN4dW1xMThPQ0dmRStUWTNvazhrYmlXc2hadnczcGpz?=
 =?utf-8?B?Vy93bDE3UnhsMy9GWk1qRzBNZ3dvMlYxc1ZOT2JCT3dnUTdVeEs2VmtlNXps?=
 =?utf-8?B?VGdLeGdVTThCck1ZNkJCZHZxZURKbHEyRktTTDJYR2wxVkR5dGhYS0hIYnJn?=
 =?utf-8?Q?nCUCmsU9mhEaVd6WFoxDrLdUG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd85d0e-1b78-42df-11ef-08dbfe6a40dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2023 19:07:31.0655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9esvWRmrxmJ7Bed+ZFGMPRACBqKNtrm+FmpVlddL88sytFHIlYvb7buwBHYFT8Dx4QnScJseoA71P5/TfxJSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 19:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192568

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIg
MTMsIDIwMjMgMjI6NTgNClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRl
ci5NYXJrb0BzaWVtZW5zLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc7IEthbmF2aW4sIEFsZXhhbmRlciAoRVhUKSAoTGludXRyb25peCBHbWJIKSA8YWxleEBs
aW51dHJvbml4LmRlPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gZHRjOiBwYXNzIHZl
cnNpb24gYXMgcGFyYW1ldGVyIGluc3RlYWQgb2YgcXVlcnlpbmcgZ2l0DQoNCj4gT24gV2VkLCAy
MDIzLTEyLTEzIGF0IDIxOjUzICswMDAwLCBNYXJrbywgUGV0ZXIgd3JvdGU6DQo+ID4gDQo+ID4g
SSBhY3R1YWxseSB0aGluayB0aGF0IGJ1aWxkaW5nIGZyb20gc2hhbGxvdyBjbG9uZXMgaXMgdmVy
eSBub24tc3RhbmRhcmQgc2NlbmFyaW8uDQo+ID4gVXN1YWwgYnVpbGRzIGFyZSBlaXRoZXIgZnJv
bSBmdWxsIGNsb25lcyBvciBmcm9tIHJlbGVhc2UgdGFyYmFsbHMuDQo+ID4gQW5kIG1lc29uIG5p
Y2VseSBoYW5kbGVzIHRoZXNlIHR3byBzY2VuYXJpb3MuDQo+ID4gU2hhbGxvdyB0YXJiYWxsIGlz
IGFuIGluY29tcGxldGUgdGhpbmcgd2hpY2ggaGFzIHN0b3JhZ2UgYmVuZWZpdHMgYnV0IGFsc28g
bWlzc2VzIHRoaW5ncyB0aGF0IGJ1aWxkc3lzdGVtcyBhcmUgcmVseWluZyBvbi4NCj4gPiBBbmQg
SSBkb24ndCB0aGluayBJIGNhbiB3aW4gYSBkaXNjdXNzaW9uIHdpdGggbWVzb24gbWFpbnRhaW5l
cnMgYWJvdXQgdGhpcy4NCj4gPiBUaGUgdmNzIGZ1bmN0aW9ucyBhcmUgc3RhbmRhcmQgYW5kIGhh
dmUgZ29vZCBmYWxsYmFja3MgKGUuZy4gdG8gaGFzaCkgDQo+ID4gSSBjb3VsZCBtYXliZSBjb252
aW5jZSB0aGVtIHRvIGFkZCBvcHRpb24gdG8gZGlzYWJsZSBmYWxsIGJhY2sgdG8gZ2l0IGhhc2gs
IGJ1dCB0aGF0IHdvdWxkIGJlIGEgbG9uZy1ydW5uZXIuDQo+DQo+IFRoZXkgbWlnaHQgYmUgbW9y
ZSByZWNlcHRpdmUgdG8gYWRkaW5nIGFuIGFyZ3VtZW50IHRvIGFsbG93IHRoZSB2YWx1ZSB0byBi
ZSBmb3JjZWQgdGhvdWdoLCBwYXJ0aWN1bGFybHkgaWYgeW91IGNhbiBleHBsYWluIHNjZW5hcmlv
cyB3aGVyZSB0aGlzIGlzIHRoZSBvbmx5IG9wdGlvbiBhbmQgdGhlIGNvZGUgZ2V0IGl0IHdyb25n
Pw0KPg0KPiBJIGRvIHRoaW5rIHdlIG5lZWQgdG8gcmFpc2UgdGhlc2UgaXNzdWVzIHdpdGggdGhl
IHVwc3RyZWFtcyBhbmQgb25seSBjYXJyeSBwYXRjaGVzIGlmIHdlIGNhbid0IGNvbnZpbmNlIHRo
ZW0gb2YgdGhlc2UgY2hhbGxlbmdlcy4NCj4NCj4gPiBNYXliZSBJIGNvdWxkIGFkZCBhbiBvcHRp
b24gdG8gYml0YmFrZSBnaXQgZmV0Y2hlciB0byByZW1vdmUgLmdpdCBmb2xkZXIgaWYgbmVlZGVk
Pw0KPg0KPiBJJ20gbm90IHN1cmUgd2Ugd2FudCB0byBlbmNvdXJhZ2UgaXQuIFRoYXQgaXMgYWN0
dWFsbHkgbW9yZSBtYWludGFpbmFibGUgZXZlbiBpbiB0aGUgcmVjaXBlIHRob3VnaC4NCj4NCj4g
Q2hlZXJzLA0KPg0KPiBSaWNoYXJkDQoNCkkgcmV3b3JrZWQgdGhpcyBjb21wbGV0ZWx5LCBzZW50
IGl0IHRvIHVwc3RyZWFtIGFuZCBzdWJtaXR0ZWQgYXMgbmV3IHBhdGNoIHRvIG9lLWNvcmUuDQpM
ZXQncyBzZWUgd2hhdCBpcyB0aGUgcmVhY3Rpb24uDQoNClBldGVyDQo=

