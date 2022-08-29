Return-Path: <cthompso@ciena.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E0FECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 16:08:38 +0000 (UTC)
Received: from mx0a-00103a01.pphosted.com (mx0a-00103a01.pphosted.com
 [67.231.144.234])
 by mx.groups.io with SMTP id smtpd.web12.39.1661789309449836582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 09:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ciena.com header.s=06252019 header.b=BxjA5jOm;
 spf=pass (domain: ciena.com, ip: 67.231.144.234,
 mailfrom: prvs=424047fc7f=cthompso@ciena.com)
Received: from pps.filterd (m0174892.ppops.net [127.0.0.1])
	by mx0a-00103a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TD42tQ003525
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=06252019;
 bh=qCO7Hs7hFz5RxLb0jM9ptquijBQTFIratCsZBvRIaiI=;
 b=BxjA5jOmL49HWXRtx+ArBKOH1zj22Bu9ce+ugzhLZNCcVGyjgbGAiaWX0n1OZk5sIQ7R
 kCT7TxyS/Q8Ur5IyHmxvBw6sA/nve0LT8/rTFveuBFDBIcOxtO53F5avNQElNKH/mLf+
 PK/vsqC/XTaMoLxrZIX6I6ee7E/TNvvmFH7PWdEPjYp3/6n1HE2DP35nRFET5Arq4sD8
 Df4b15lxK/j3TaWNUtBK8EtbE58YibhZEMs+S/7M1e+1Il7Frbx8oGZSzAbKK7vFXo4G
 RhSem7jlDwwF44rf3U6FdrhKHxz/HsbwqKZnNAkm98Pxdeejqd7CyDN5vCB+aV3LJna9 ww==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 3j8x0xrh45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 12:08:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzRxfbZlhcd492OGodzkn5kOAjeAeFy7ZFgeQpRpiLRaj76TVICJDG3bCAio2wfHJhVF3vjjNji05QhJiNJfHBUTju3xelqZfibaXiaSIb09CwHL+9y/jeYG3sl8OhKFxcnirSuiaRkOv8ewJxbzJazyzJkB8iK2GbNB+Nx+IgkgSmgph6yGdlrX+BdAKUACNBYn/n+V/DA7SP/H41V1HNxXyJ+mRDxtQd9ibsMZV5kRreqm+XtK/65DQcQf/va8oFzvLf+rvzlXlupJoh5d6YQuv4fV4uCoRB0RjqCRpZuTZiiDlvI32tNytiuw9GN2WwBLLj929TR/6oy7JNnERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCO7Hs7hFz5RxLb0jM9ptquijBQTFIratCsZBvRIaiI=;
 b=fEjIWOj4f7rmyCv6upGiIi72a7obFboryNEjqznimGN49fjIr5eNaXgYazGW3e+1nBwYZGePRhd1tCt5US9dJdQ+tycIM7Z4D6AG/tdgm5p1V3GCkPTdxN0PK2suPmXmQpmhMUSoRtRLxNI6grtFU6z3opsUZntvcxOkTIcRdY2Qq4t+LGDHD4LLyvuYhSsHx2sVQQBViZgnFaXxeIEg+56cy9nf6xYv0YxJimxV9VMtEAmr6xfj4SBOyrRtUC+kBIutZ2meaDWgzizF2LP3wLoC0CFzSXHfHdMzIO0cpnxwu6WpZWT+UG78Vn3OhrtqtWkCAC0SnW+RF8q1QInS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from BN8PR04MB5777.namprd04.prod.outlook.com (2603:10b6:408:77::23)
 by SA2PR04MB7562.namprd04.prod.outlook.com (2603:10b6:806:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 16:08:27 +0000
Received: from BN8PR04MB5777.namprd04.prod.outlook.com
 ([fe80::e46b:e339:929f:ef95]) by BN8PR04MB5777.namprd04.prod.outlook.com
 ([fe80::e46b:e339:929f:ef95%7]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 16:08:26 +0000
From: "Thompson, Corey" <cthompso@ciena.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] runqemu: Use qb_network_device in
 setup_net_bridge()
Thread-Topic: [kirkstone][PATCH] runqemu: Use qb_network_device in
 setup_net_bridge()
Thread-Index: AQHYu8GSWVD27SGyIk68l6EwIC317w==
Date: Mon, 29 Aug 2022 16:08:26 +0000
Message-ID: <YwzkeiI74JEGnBbX@gax-cthompso-01.ciena.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73deac04-4a65-42e3-b2fd-08da89d8b503
x-ms-traffictypediagnostic: SA2PR04MB7562:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9WNNatq73kwvsuXkNgOrm+HMD7QVkNNbgEM5np+zBU2bucT07hmFenYTVpiozevnK1k8MS279io3jzGZV/vEuyoDdTF2cQ5X+9xt3kLZXDyK+CqsCLjV02OE8kzCArM4yN5KxH4oQBXOTC01WHTyjB9ng7JrXJ5KoTSlKYFWiWUxOC8L2ANcYKosXfbKkmUg5sj5Kga60hoH7QJ4VTr6IJzkgYqxUBxvOtOPIkepDpwfOBSvmEhimzPmZ4kiaY3CHsSFzc8+rUIeVzIbD7kf2xcu3CxLBjluWaW3InOkf7oS6KGgUWgJQR1tcfTgKjl1zfvP1p7edzVFkPm8gMFGQdS7vSH8uAL+kJetCouk9d+MeEYpptxjkRkdM/eZ3sMJqKhpeAm5UB4d8Fcv0lJD1yh4801GtuefsRemWby6549Qc2ZqgQon1O8UFWC/HG4aPdRt/vgLrTweEvaRTDK6+EtVbPlPDwSyRBWHCJ97O/coHsowoHmIPeLWE8vqvVxRXaiN0kc8UoL4yV9O7lUdfL2RB3qvlAG2JLvcESKVjGa3fehUmPMTFKGLppG5irhvDoQryXYbucrNjKCjIgOQtj0Yula62URar2YpOZstGXTjXoDMKZAmCqAkUQrXQKeX3l19xFwhL9Txu0Di9SyLasZyTtF3g/ajFuRBX8BxS3HDRGMuWcw4XQBqFjFWqu8ssFo9UiojiH4zWtuMacvqk4fJxozkHkfniXEFey0r+DBcCK1nI3Ef0sIK10TfQ2awPPTCCBDmKfuAdmi/xM6/zQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5777.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(122000001)(99936003)(316002)(38100700002)(6916009)(71200400001)(478600001)(66556008)(76116006)(6486002)(66446008)(66946007)(8676002)(64756008)(38070700005)(66476007)(41300700001)(5660300002)(4744005)(8936002)(6506007)(6512007)(26005)(186003)(2906002)(55236004)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5NUIexDIsZ92ExLu//nXJdDEJjIwjQBtD3S6Eo1IFlCAKH+cc9dfH/DHkyb7?=
 =?us-ascii?Q?r5LLKtmP4ZJNCgRwwDjH0eiW+8SKctiGP2kvShhOhgybyefBrTPgWwPrwjXf?=
 =?us-ascii?Q?HP0YYPLChgpD23Wd3Exjgo1X/fKTlD2RyV6vE6DkW+zV+tQu6YE1A6OFaKPv?=
 =?us-ascii?Q?V4guVclIE80Gv5vnmfoz6eyrYmWqUakM3UJPBgql6AXIUXfH9bvRAv3eHw6K?=
 =?us-ascii?Q?uR+QWTD77iS7+w9JZ6ALmFz+8ilcfobr4gyjOTitJwoPLjqwsf42InN1KdzG?=
 =?us-ascii?Q?JV4smrsuZqG5Ww9tQ+E6yn3rZEsZHt67LzOabcsLH2dJnFkxVPCo98MMgNgm?=
 =?us-ascii?Q?aQ8JnyUUGCXLJR8HyuAq8JA+qgB0A0Td+ejeMhzsX0Oxiy5gFlu+ynbxA1Uw?=
 =?us-ascii?Q?0efb25QZb8mZk+sm8rNahoYFbme2NqwhqYC2ksGfESNaezJ9Qo+kFuYQD2ca?=
 =?us-ascii?Q?CzgUKNW3Xd01XXrIMYbsuotIzHEDB8MBqB+CoVaNd+rdY2DdhPODaprFXCjc?=
 =?us-ascii?Q?k3+3a2+pOxoipN7dr+mCutN9gEvr1DoCVx6v+PTEsmepSqj598/BmjmAomP5?=
 =?us-ascii?Q?RXxt0QV83uruGDFfXkv0r2Ti35iywUXDRPpQcbJU5HcOwSBxWp8qGqVaImCp?=
 =?us-ascii?Q?jGjmgg4E4qnlq9mEQg03nHg9C5PwtgdH1aNUKsJWJObZSCX42TOGcJuZdRmK?=
 =?us-ascii?Q?tNx9PKJ5C/KEUlpaMDf3JZG2KjaeEFkkmI/eAWATdIFx31UmwgpDTldZ7gX0?=
 =?us-ascii?Q?qCmrMjsUTmcutFD5M8rUIKL5sfb+iJHwEsD7cl8Z53swMJEebZ6B+MqeBXzf?=
 =?us-ascii?Q?igoeYYoj11D4ZrYF2/QWO2k+Uam7o4RFP+1sdoBN9LMcvjMK/jewxMDxjsmC?=
 =?us-ascii?Q?QveI2e0HD6L0pKW6Z9+uD9222DipHs2FPOpdLI+X3HcUrHvtaz2LmRrn4s64?=
 =?us-ascii?Q?9eoAAp55FOpAgt7SDo72ChU44evdcDBKc/XZ9gwkKuPfJAaaPD61xDF7y7e0?=
 =?us-ascii?Q?quezeNv1ZNin7gsXWwnZSiYORaL381Vu28wRq46BNYyYAomqaYou5lNi2dN1?=
 =?us-ascii?Q?TDxaC5rSp+EL29sC0c/JBAGS4Oo4sAhX+dxAYVuMoEmq6yMkyU2bAK6i40u0?=
 =?us-ascii?Q?jgDKgkpvM5sUDiV/+tpVHSPQvJKlGe1QjqcKCtTLo0nRyRbZMB4vnPUHfOPj?=
 =?us-ascii?Q?0SRMFpjm3aMng8jDIKMHW3ISbRHE1PHuynecPLf5wt43e+L90xh4Q1hU1HL4?=
 =?us-ascii?Q?NyEpsr9In5V+25BS8hBPgEup37iKRyMo/dBXTESUq861jiJWJqXnHnE/+SAf?=
 =?us-ascii?Q?KrzyH8tEWLZouEfspmZ9BG4UmBNJalpZSprGGQn7/F72651st/b+9FicCuOG?=
 =?us-ascii?Q?NUvO8Il8xL99J+Tra8jyxUxtF8W+5E3oT4uzuOUhk5bzHC9r2WEDxD1bk7lM?=
 =?us-ascii?Q?apdMkyglLA5KfoXI3gnHFhCArzAEaw5bAod2QIhQ1H8NlNMlKTI3l9jOExtN?=
 =?us-ascii?Q?3W4oU8kYzOGdibugXwfQ67P2gDebQ+S+UGDexhUu8JyXsnH+NhkYpkXUOu9F?=
 =?us-ascii?Q?11k9HfK7bsGoFPK4zIiOFvK5+CWCMOjSN7WcRcDOYamcazxIAf1srlxGB7Vm?=
 =?us-ascii?Q?ZA=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_002_YwzkeiI74JEGnBbXgaxcthompso01cienacom_"
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5777.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 73deac04-4a65-42e3-b2fd-08da89d8b503
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 16:08:26.9050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 5WLrpSt6+iRkhjZB2sBIw64Q4j8yWgmvj4AlHXwS8kxzzCtxBuenQR97WKtpwpVAwLQa3SPkTlpXzkjUdfQ8Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7562
X-Proofpoint-GUID: SECwjtd_2DdRh5L6sVEcFV9Hde1hofTr
X-Proofpoint-ORIG-GUID: SECwjtd_2DdRh5L6sVEcFV9Hde1hofTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 16:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170016

--_002_YwzkeiI74JEGnBbXgaxcthompso01cienacom_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9450B926496F3041A0CDBE4D9267A87E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hello.

I would like to be able to use runqemu in bridge networking mode, but
the hard-coded device type causes issues with some machine configs using
Xilinx BSP layers.

This is an attempt to resolve that, and also to support multiple
simultaneous VMs by substituting the @MAC@ pattern similar to the other
networking backend modes.  The problem is that in bridged mode I had
difficulty thinking of a good source for deterministic unique MAC
generation, so a suffix syntax is introduced to the runqemu bridge=3D
argument.

This is not as automatic as the MAC handling in the other networking
modes.  I welcome any discussion or suggestions to improve the patch.

Thanks,
Corey

--_002_YwzkeiI74JEGnBbXgaxcthompso01cienacom_
Content-Type: text/plain;
	name="0001-runqemu-Use-qb_network_device-in-setup_net_bridge.patch"
Content-Description: 
 0001-runqemu-Use-qb_network_device-in-setup_net_bridge.patch
Content-Disposition: attachment;
	filename="0001-runqemu-Use-qb_network_device-in-setup_net_bridge.patch";
	size=2764; creation-date="Mon, 29 Aug 2022 16:08:26 GMT";
	modification-date="Mon, 29 Aug 2022 16:08:26 GMT"
Content-ID: <4BA66379B90AED40833362E788E9DD0C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBhZWM3OTdiYzAwMGFmZTMxNWFiYzJmYWY4NWFjM2I2ODcwMmQ1YzdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ29yZXkgVGhvbXBzb24gPGN0aG9tcHNvQGNpZW5hLmNvbT4N
CkRhdGU6IEZyaSwgMjYgQXVnIDIwMjIgMTU6NTg6NDQgLTA0MDANClN1YmplY3Q6IFtQQVRDSF0g
cnVucWVtdTogVXNlIHFiX25ldHdvcmtfZGV2aWNlIGluIHNldHVwX25ldF9icmlkZ2UoKQ0KDQpS
ZW1vdmUgYSBoYXJkLWNvZGVkIG5ldHdvcmsgZGV2aWNlIGFuZCB1c2UgdGhlIHFlbXVib290LmNv
bmYtc3VwcGxpZWQNCnFiX25ldHdvcmtfZGV2aWNlIHNldHRpbmcsIGNvbXBsZXRlIHdpdGggQE1B
Q0Agc3Vic3RpdHV0aW9uLiAgQmVjYXVzZQ0KdGhlcmUgaXMgbm8gZGV0ZXJtaW5pc3RpYyBoaW50
IHRoYXQgY2FuIGJlIHVzZWQgZm9yIHVuaXF1ZSBNQUMgYWRkcmVzcw0KZ2VuZXJhdGlvbiBpbiB0
aGlzIG1vZGUsIGFuIG9wdGlvbmFsICI6PG9mZnNldD4iIHN1ZmZpeCBtYXkgYmUgcHJvdmlkZWQN
CnRvIHRoZSAiYnJpZGdlPSIgcGFyYW1ldGVyIHNvIHRoYXQgdGhlIHVzZXIgbWF5IGJyaW5nIHVw
IG11bHRpcGxlIFZNcw0KZWFjaCB3aXRoIGEgZGlmZmVyZW50IGFuZCBwcmVkaWN0YWJsZSBNQUMu
DQotLS0NCiBzY3JpcHRzL3J1bnFlbXUgfCAyNCArKysrKysrKysrKysrKysrKysrKysrLS0NCiAx
IGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL3NjcmlwdHMvcnVucWVtdSBiL3NjcmlwdHMvcnVucWVtdQ0KaW5kZXggNjZlMDM1Yzlh
Zi4uZWM2ODg5ZTZlNSAxMDA3NTUNCi0tLSBhL3NjcmlwdHMvcnVucWVtdQ0KKysrIGIvc2NyaXB0
cy9ydW5xZW11DQpAQCAtMjA4LDYgKzIwOCw3IEBAIGNsYXNzIEJhc2VDb25maWcob2JqZWN0KToN
CiAgICAgICAgICMgc2xpcnAgcWVtdXMgYXJlIHJ1bm5pbmcuDQogICAgICAgICBzZWxmLm1hY190
YXAgPSAiNTI6NTQ6MDA6MTI6MzQ6Ig0KICAgICAgICAgc2VsZi5tYWNfc2xpcnAgPSAiNTI6NTQ6
MDA6MTI6MzU6Ig0KKyAgICAgICAgc2VsZi5tYWNfYnJpZGdlID0gIjUyOjU0OjAwOjEyOjM2OiIN
CiAgICAgICAgICMgcGlkIG9mIHRoZSBhY3R1YWwgcWVtdSBwcm9jZXNzDQogICAgICAgICBzZWxm
LnFlbXVwaWQgPSBOb25lDQogICAgICAgICAjIGF2b2lkIGNsZWFudXAgdHdpY2UNCkBAIC0xMDQ2
LDggKzEwNDcsMjcgQEAgY2xhc3MgQmFzZUNvbmZpZyhvYmplY3QpOg0KICAgICAgICAgc2VsZi5u
ZnNfcnVubmluZyA9IFRydWUNCiANCiAgICAgZGVmIHNldHVwX25ldF9icmlkZ2Uoc2VsZik6DQot
ICAgICAgICBzZWxmLnNldCgnTkVUV09SS19DTUQnLCAnLW5ldGRldiBicmlkZ2UsYnI9JXMsaWQ9
bmV0MCxoZWxwZXI9JXMgLWRldmljZSB2aXJ0aW8tbmV0LXBjaSxuZXRkZXY9bmV0MCAnICUgKA0K
LSAgICAgICAgICAgIHNlbGYubmV0X2JyaWRnZSwgb3MucGF0aC5qb2luKHNlbGYuYmluZGlyX25h
dGl2ZSwgJ3FlbXUtb2UtYnJpZGdlLWhlbHBlcicpKSkNCisgICAgICAgICIiIlNldHVwIGJyaWRn
ZWQgdGFwIG5ldHdvcmtpbmciIiINCisNCisgICAgICAgICMgSW4gdGhpcyBjYXNlIHRoZXJlIGlz
IG5vIGdvb2Qgc291cmNlIGZvciBkZXRlcm1pbmlzdGljIHVuaXF1ZSBtYWMNCisgICAgICAgICMg
Z2VuZXJhdGlvbi4gIEFsbG9jYXRpb24gb2YgdGhlIHRhcCBpbnRlcmZhY2UgaXMgZGVsZWdhdGVk
IHRvIHFlbXUsIHNvDQorICAgICAgICAjIHdlIGNhbm5vdCB1c2UgdGhlIHRhcCBudW1iZXIgYXMg
YSBoaW50IGFzIGluIHNldHVwX3RhcCgpLCBub3IgYXJlDQorICAgICAgICAjIHRoZXJlIHBvcnQg
Zm9yd2FyZCBvcHRpb25zIGFzIGluIHNldHVwX3NsaXJwKCkuICBJbnN0ZWFkLCB0aGUgdXNlcg0K
KyAgICAgICAgIyBtdXN0IHByb3ZpZGUgYSB1bmlxdWUgc3VmZml4IHRvIHRoZSAiYnJpZGdlPSIg
b3B0aW9uIGRlbGltaXRlZCB3aXRoIGENCisgICAgICAgICMgY29sb24gdG8gc3RhcnQgbXVsdGlw
bGUgcWVtdXMsIGUuZy4sDQorICAgICAgICAjICAgICBydW5xZW11IGJyaWRnZT12aXJicjAgICAg
ICAjIG5vIHN1ZmZpeDsgZGVmYXVsdCB0byBtYWMrMA0KKyAgICAgICAgIyAgICAgcnVucWVtdSBi
cmlkZ2U9dmlyYnIwOjEgICAgIyBtYWMrMQ0KKyAgICAgICAgIyAgICAgcnVucWVtdSBicmlkZ2U9
dmlyYnIwOjIgICAgIyBtYWMrMg0KKyAgICAgICAgIyAgICAgLi4uIGFuZCBzbyBvbiAuLi4NCisg
ICAgICAgIHRyeToNCisgICAgICAgICAgICBuZXRfYnJpZGdlLCBtYWMgPSBzZWxmLm5ldF9icmlk
Z2Uuc3BsaXQoIjoiKQ0KKyAgICAgICAgICAgIG1hYyA9IGludChtYWMpDQorICAgICAgICBleGNl
cHQgVmFsdWVFcnJvcjoNCisgICAgICAgICAgICBuZXRfYnJpZGdlLCBtYWMgPSBzZWxmLm5ldF9i
cmlkZ2UsIDANCisgICAgICAgIG1hYyA9ICclcyUwMngnICUgKHNlbGYubWFjX2JyaWRnZSwgbWFj
KQ0KKyAgICAgICAgc2VsZi5zZXQoJ05FVFdPUktfQ01EJywgJyVzIC1uZXRkZXYgYnJpZGdlLGJy
PSVzLGlkPW5ldDAsaGVscGVyPSVzJyAlICgNCisgICAgICAgICAgICBzZWxmLm5ldHdvcmtfZGV2
aWNlLnJlcGxhY2UoIkBNQUNAIiwgbWFjKSwgbmV0X2JyaWRnZSwNCisgICAgICAgICAgICBvcy5w
YXRoLmpvaW4oc2VsZi5iaW5kaXJfbmF0aXZlLCAncWVtdS1vZS1icmlkZ2UtaGVscGVyJykpKQ0K
IA0KICAgICBkZWYgc2V0dXBfc2xpcnAoc2VsZik6DQogICAgICAgICAiIiJTZXR1cCB1c2VyIG5l
dHdvcmtpbmciIiINCi0tIA0KMi4zNS4xDQoNCg==

--_002_YwzkeiI74JEGnBbXgaxcthompso01cienacom_--

