Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C6F106F314
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.105])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43649.1774518226556914031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 02:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=KwzahFDD;
 spf=pass (domain: navimatix.de, ip: 52.101.69.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnF3z+JUxTYt4JaRHj4nte0fISAYs2uMyu5lvyyS1RbdeHIRWguZPRp8VivLQtdjzk5IdAN8mLKF1ACgiek5yNX4VAS6Lgoc4xqcUqnfoUKlNNNZSYzVElNOw/dPSGsC5BCgdleQkmwUjj8B2VXDoccsFV7vg+UzuylPjC4hp2u2n5mtEDluLLjh3Znrt2BOPuF8gptiTsydBJRD2DGjbBidpYWWd4YMLtu89iybmKXYqdepQMLQtOlKJzsix+tJN/dkooE5AQWlOjqbMwvwarcLpFIPaGj2PRoj7eClrke746yy9ykKiA6m0vk6R3yKQLe95gULT487+e2yGpr3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO/yebHzuVa0+AZz28p7ujkvqtJm/y097HRTDh6wgbg=;
 b=MJM1hflJTFk0BrxLQNSMXFRhTlGPYzMAsjkRJ4vOQP68XwEQLZsEnFjgg1Feo/Atw64fFLCkKqVKJ17ZMXumylTxjmELUlGnEVXTloyjEaXY1HWH04w9cmds5i5q+A5woLwEYSILZM/NenuymyR8+zBR5Ny7Q3BlL5lOflhgjwidJEGkIMkVUyHq7ATZqyLMvyaVJmDrRVwb30jcmqXpjz64gXfeXNzFEqy/ZdFWMeaUOIHxinfKjMYlUnVLE/mjfmV0IGyZ8nBUZoRBIM0vgIU+81R1H2fCBy3bYDdWOE3EuIxt3K9KPxP3KvmjMD7yseUIru5vSUOFFLRHkG/SCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO/yebHzuVa0+AZz28p7ujkvqtJm/y097HRTDh6wgbg=;
 b=KwzahFDDaTaYgWkKQ9CkzdTjStWg7bAYv2O8VdeoRRK5hmUtm5qerMdlO4SXNLiPuctx87WlIzNbCJiEjsqJXuVF+NOyRpuXADRVTTOHlk+7oW7KYLswo9CTmXJSQxsCNQXsGj7fm3w8qSOToakvndmaWTrmWcWGchu8KC10AHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB7385.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1fa::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:43:42 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.022; Thu, 26 Mar 2026 09:43:29 +0000
Date: Thu, 26 Mar 2026 10:43:39 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
Message-ID: <acT_KkDva9SHEzxc@navimatix.de>
References: <20260325171631.1048346-1-JPEWhacker@gmail.com>
 <acQ9L4xr3OE8nYqT@navimatix.de>
 <CAJdd5GYyaYytJPp=ruw4bP9yVxHnfFS8C1KG6+GMPQAiswpV=Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="6km25zvjijkx7sjx"
Content-Disposition: inline
In-Reply-To: <CAJdd5GYyaYytJPp=ruw4bP9yVxHnfFS8C1KG6+GMPQAiswpV=Q@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3c4ce1-02aa-41d6-6f30-08de8b1c22f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	spnGTu5768u635A29MVtaqcueMzf4GJRN9S5f201M9RwNcEWTbh03lLGXHv4hPXAXMYnO5oukhnsXFacFTX+mndOnPz8uTAW7KyZW9E6EcREzAfxjDVjMdWgOkVD47977oXlNDmphLTVi55yBmBZLKVdEAeZ7690cYQU8HHSIzp0dEoeErFooTitZnrYhMGT5KBJbvIX6No3w8yjDQeLn9OB6vGTLqQHlUox7B9i5E+uw8Z6d6iJPz2nH3wHAI+L8afJb1sF7ITt/p3yBwmhwzYFYQddtUEOO8VNpltaB2WTTdWRkb27sN3v+9RPzMt329fXtkSN9SiytZH5IBZrxO5JE7AN5tPwi5xMSgZqvVSU73KwXMlgQ5V11XKJaRWaHx0t7H+HRCNLfKNCq8GlR4WAGEUquYpD+G4qpuxA+KCDNzZyrt6R/ET3c7mkWyfLzVEeC5WTYOO4zZp58eGoZN4/hRUmF102t9HcOwT0tksirEx7smHBsnWydnk/VoXCzV+0mG7dIqDlb6ji1Iugkwdj8fstQfbQZAOs9XFamGZG8H1CiFM9uuBqiXyCDRrhwpueyLFS1Kn8dNPNhmscCkuG4PY8i9hpA5w6QuP3k1JrVdEaRuEWbBgxl2caT5RIF1JRo0kjeOZWyHT9oQOqMpIGQrkoOwBwQUpIIAig4dVGyGYkJjnjgGzDcZYeUBz/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UDl3djJYOUoxVGpGWHlDc2hwWjVwWUZ5T2M1VXo2bG01TXN0N0lLRHdDKzBK?=
 =?utf-8?B?R3hHNGtKblJaOEFpVFhwZUhuUUdpNmhOdndITk1ycXNUcDVRVHVrVGYyZEVh?=
 =?utf-8?B?OEVvMzZtOEw1VUdpOXo4dVZpVERXcmxoL2huby9DMEpzMWVPY3VsU1hIQ3Fn?=
 =?utf-8?B?TEJzdENCdncxaVVJSUF1RDJXNnBwZUxvYXlBVTJtL0F3YnNtVmJsWXdJYWZn?=
 =?utf-8?B?aFhDQlJmZ2lPcmF2Tm1EVlJ0N2l5bytCZUxLRE9HSS9wMTdselk2RUJBOVJN?=
 =?utf-8?B?V29GQk1aZDFoVXhFVzJWbWNaTGpIbDlNKzNwWUlNY2UycWxaRWdZNmJ2SkdX?=
 =?utf-8?B?cWZvdzYycUlYeDBvZlpadnpybWorZmFyTXdYd0k3QXVoYkJUNUtCTTdRNDdR?=
 =?utf-8?B?eDRiOHBXRmZDSU44RDl0Uzh1QkpOc0wwQmpGejV6ZGg3MWxBSklLUFVVMHQ3?=
 =?utf-8?B?NHRtdm55MlZLaFJGMnYxVFZweFNkUDBiUmQ4b0JXblBjK3RwUUxPejFMTXIw?=
 =?utf-8?B?MklvRXppeXlpS0hiSHkxRW1UODNuOWlQQ0NBS0dBSGJhdUIzTjRxZ3l5MlZq?=
 =?utf-8?B?RnNzam5UMGZYRmRpeEtzTjdzTndBRmFZRjZWM2c1bE9KOVh1bVRTYmVoeVJ0?=
 =?utf-8?B?Z0N2R2VabVpORlFFNkxkOERrU1BNUDJNT0c2TEFLU0YxRHpoVTJSbVRBaStW?=
 =?utf-8?B?YWtVVmdOalUrcDM2eFgvUCtqa0dXUTAxSU9nRzhuR0xtbk1ZeDdIa09QQmJU?=
 =?utf-8?B?ZEoyNTdmWlowWWYrcGptWXp1M3NVZmNSN0RGV3hBUEtuWktIVmtMK1hzZHRz?=
 =?utf-8?B?MXdWSXJzSjRaRXN0WklranhMUEl4WFJwMXhjc2c0a1JJMEsyd3VJMUN4YlJy?=
 =?utf-8?B?dU5jb2pBNjFvb2x3M3ZzS1FFL0c0TTVVeFA5UXRqYkpUQkFyMjNraUdrZk5B?=
 =?utf-8?B?RmdTTXpZS0c3SG9kdXkyL3h2SmE2ZXZXKzg0Q1N6TGVtaU9XeHhMYi9jR2dN?=
 =?utf-8?B?WlJpU3ZyRFV0SzR0NHpaSHZMYVdINy9aSU9UU2I3d1E0a2dESHRxMGZycnBB?=
 =?utf-8?B?N0pWK1RVNm9KM2dzUkZxYmF6OVdGYlZZajlLVHhQTS9FYnBoMVhiNStDdjRN?=
 =?utf-8?B?Y0llSDZaZWNKbWlmcmh2RHg2RUgrMU9kTVdZSGVBbmh3b2R3amR4aHgyeVAv?=
 =?utf-8?B?MCtYRWRmdWdqRzhBL3NOSnhabENuSlNRREZIQ2RBRE15TW1EV1c0L2ZsR3lU?=
 =?utf-8?B?V0pVUjUwRHUzZzh6UXI4cXhyNGJEZ0pzU2k2NnVEOFRxSFROTVBJOGZxZ0N6?=
 =?utf-8?B?TldLNzNabjFjaS80U1R3aHg3UlZ6NUsyV3ZCL3FVU0VDbVdmeHRCSXdGYmtY?=
 =?utf-8?B?SGs5aHFqaGF1UWpNRUhUaHFwTTl6MDF3aGZ3ODc4UmdmN3c4TXVhYjdpRVRZ?=
 =?utf-8?B?MEg5ZS8rdnZDblo3VkJiRVFvSU4zUEQ1TWZSTHliYXQwTFZndERpQlFUbzhC?=
 =?utf-8?B?YjVvNlhSTUVKa2I2VnBtWUxYdWhrMDU0bjZHN1B1YVhaTHROU05NaTdsd2hF?=
 =?utf-8?B?WGwvcTdybjVTY3N2QXZPSjRFdXAwWlJib2xRQnh2eEVKN3luVlRtakN1SVdB?=
 =?utf-8?B?eHBOc3A4cHExMXRSMVV2OEFyNzJ2V3o5OHVqNVVmN2VvdkVMOVdYNHFoUlIw?=
 =?utf-8?B?VzFVYllqNG9LWHBDSkcwbkFZWmdtMEUyWitaa3ArVC92ZkpJUXFYU0JsZlk4?=
 =?utf-8?B?SGRGelY0T2lqN1U5di9od2IrMDVnWEN4TGhNZHd3ajliNW5PWlhMU3lMaTZQ?=
 =?utf-8?B?OXRUZ1hYZ2poQ0JSMFc5VjhKNDJMMUpQa2VtR050Q1dXdDBVUjkySWcvam5y?=
 =?utf-8?B?ci9WSVZlQ055QlJXbjYyRTl3bVZaTGRpZ21sRW5vT3hETVdCMHdlUithQW5H?=
 =?utf-8?B?c3BpQWF3ZXdoYzJzbVVjNE41NFRVeExtMC85eDk3SzM1a0tJUzhzOVJDNWhU?=
 =?utf-8?B?d0ZKekkrcFJCY1JpS2ZuNVpCTlhOaHg2ZDNocE0veUpFclhXa2xlRVdWTWEy?=
 =?utf-8?B?aU0rclZwRTFsbEJrK3N5K3VpSkpMalhmM1M2YVQybzIxVWV3NUhFSGMwUmZP?=
 =?utf-8?B?R3NHVlJyOU9FSDZhWFA3WDZkbDFFQ21MMDBxZU8vTVZ3Tm5xR3ZCdVRXNm0x?=
 =?utf-8?B?VlZFYkIwcVZEOWhJVWRsb0J2RTRhcDhZL0ZxcktxRE95K08xYUFqWGlKSWNw?=
 =?utf-8?B?Vi9xRE5pN2JVYWNyOTZ3YmRaeXgraDhXcWE0NFhtNjJUVjgxYmwyNHNaY25l?=
 =?utf-8?B?OGh2Qjl2V3pITGlvOU5CL1hiMmd4VWJrNDNrcTFiOGsrZHhGZjM2SWJQVFI1?=
 =?utf-8?Q?Sk/RQZQflDZhyq3E=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3c4ce1-02aa-41d6-6f30-08de8b1c22f3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:43:29.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XP72j0xNU2IdMhBr+DM0ZXliXoh6t9yApf9p/fhRT16vAfwn0J+qLrrcRaBvf5QOYsUjbhm0JJHeHR6zkzCYE14PyhpDTaIasyM/XJp3YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 09:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233959

--6km25zvjijkx7sjx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
MIME-Version: 1.0

Joshua Watt schrieb am Mi 25. M=C3=A4r, 16:17 (-0600):
> On Wed, Mar 25, 2026 at 1:56=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@na=
vimatix.de> wrote:
> >
> > Joshua Watt via lists.openembedded.org schrieb am Mi 25. M=C3=A4r, 11:1=
6 (-0600):
> > > Removes SPDX 2.2 support in favor of SPDX 3 support being the only
> > > option. The SPDX 3 data is far superior to SPDX 2.2 and thus more use=
ful
> > > for SBoM uses cases.
> >
> > s/uses/use/
> >
> > Could this be delayed until after the release of 6.0, so 6.0 would cont=
ain
> > SPDX 2.2 support? For internal tools we still use SPDX 2.2
>=20
> We already had discussion on the OE arch list:
> https://lists.openembedded.org/g/openembedded-architecture/topic/proposal=
_to_drop_spdx_2_2/118281203
> please feel free to chime in there.

Thanks for the link. This helps to argue that our tools must be updated.

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--6km25zvjijkx7sjx
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzI2MDk0MzM5WjAvBgkqhkiG9w0BCQQxIgQgj/B/PFpa
rl37MvZwiLBMx8pE3yq4tHcq62PTl7ro3sgwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBADkvh/tR75ch
Okc/nohtO4LCeNBciarRrhI1XUmwxk0Gi47Nsyq6Px038yrij8C3DjFsokkYszTLvernGVbn
VIQi+/2pU4X3qzuOfHYZhZ5/lNaCtX7gYgcwr/6EcLLgGlIA5n5Ry/cdkTzl6iO5N/qqCGgP
VyXUl1Be/dGoce78REha2lShdZq0A86iVPMIS4PpjHJP2MxdhdmqjPRIb3JoXSJJ8Fq8pXY0
OcwPdXRTf0Iupbj83YSTHjJu7PW02Z/cdSlLJbblNZQ8aGJPGG+s/QwoHsluxt65eEIjIgB4
O2lbcJUQ3wjMmulDtUkcgjplfi2yo97jObB2xDez8B4=

--6km25zvjijkx7sjx--

