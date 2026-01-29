Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853C5D6B07A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:48:30 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17845.1769701709013279949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 07:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=S2izvxAs;
 spf=pass (domain: navimatix.de, ip: 40.107.162.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9d7Pfse53USEOWsIBmIYNlIYB6MpLPkqcr1RHXgbIgzMm/4DZpqmGqvE5nggn2algrsCI5ofiWwP+4BRL4SptDS52NBPi1IRVMHAV4cJVEwHwq8d5txznc5bYr2Fcqzq6wubJjPDoD6KF4UVpyQLsOZnFdlPiX86yK8FTxVI9ryxbPhJx/Hvif6yV6BGumeke2sSzC/VUbuu/YoPYKDxDiDIA/03yxwnvRyP/j9bMpnla6bB5z1Ulet97tL1MzJTdGNclZ6OhZYaY1073GJT0p+3pQOxDDAVaXNkJJYYcMIUhIgsocGk5mzLulDMZhBNv+Upz0dhNgT+U2jUnmrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFOuE9v1r0qHkSnv9GV+yDIIzwf9ES/I8GwsNctZC1Y=;
 b=AaalOLNyyfTKXf8to/Q4FsM6ucXLaglu1FeGql2AnjvjYpjVbyse8UTeSXtvG7danW2gT1Q8k80WDhRCcOPdWmkXxq6/oPCkOMSJ7QtU3Vt2YZ0L7LIUpAADejAY5KtSGOnLLPUCEhnNkuJgCZUZAFxmR+SBs2VKyOWYnyTY0TCjSH3534DZS8U7Nr5nIWpWBQaHotuULSRBU7byfElc3BSts/e9FLGx+E2CwFXL/CWSPeNuDAqk0exyBJnN1bWKJjZ1YldgYz6QMfs5XDCUUPE++p3aTxTLz/ThB4NqN607mtzbYtwr7DHOjuUHEeov7Bdtt3UvJdGc7tyGgHAo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFOuE9v1r0qHkSnv9GV+yDIIzwf9ES/I8GwsNctZC1Y=;
 b=S2izvxAsSSl8dHWiDmHOJm0Ul98IoCdDxHJKEqySEvsnIU+oLVXnaLe3DG1HP5CawPns4PNemADH/vtBCQqvEJAjmCMGH2POhf5e5tU/s4iJcPokuUGGWbHQYzg2vbhskcsdAFY50VgelOBBiYs6uxXgRic7lF9yh+lvdI27j9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB11787.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:606::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 15:48:25 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9564.007; Thu, 29 Jan 2026 15:48:25 +0000
Date: Thu, 29 Jan 2026 16:48:22 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] runqemu: restore support to run without bitbake
Message-ID: <aXuAZarEFLu0TITT@navimatix.de>
References: <20260129030811.104017-1-Qi.Chen@windriver.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="vouqq6on2fll33av"
Content-Disposition: inline
In-Reply-To: <20260129030811.104017-1-Qi.Chen@windriver.com>
X-ClientProxiedBy: BE1P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB11787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e5e32-5a55-4bb4-2f72-08de5f4dd665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?lpYRagRtEZEAPg5JMpe5C2CMGce1bLJZdIR48xp8bjZS7cFphWZtgU6TU4?=
 =?iso-8859-1?Q?6YcEpod2T6P4/CbAGXw+AJ9qGqPQqtuNDql9qyFZ/e7kqMWzKB1H8g7wTk?=
 =?iso-8859-1?Q?WOxabK5t5JVVNT7bC34fFI+2zZ1PSvP1vEaF6xJSRXnyKjAluiWe0l0rvs?=
 =?iso-8859-1?Q?0qCj1ppA0RXM2NcgB/9c1N2td5r2aB9laoZZ0MNCpov5KRNMfHKkMSPJ8f?=
 =?iso-8859-1?Q?mQ/YB1sXLyEcJ+kFChPxeMmMWiezQpypkQU+0Ml6qSW+q2TdAXdQzpHi+x?=
 =?iso-8859-1?Q?m2hLx9qQSQWujbeFR4PIiZAcCN+27b5BzRE8NRLMGdsWaXIIan25Gm70E9?=
 =?iso-8859-1?Q?9klUro0SZG60fTKfTKn60Y12BVkKl6PT2yEp0IPNaqbnQHZqT0gOZy2d5e?=
 =?iso-8859-1?Q?N/9pWQ2dK1lXlNYVbYroAUdYV50TzlnxhulkrVQgly6dXtGPSO2R2AQ4EU?=
 =?iso-8859-1?Q?743pYeivSc4tF9qlCSv6VHc+Bjh5eHnEIN3zOM1lNGGKpN23BKXcTWDE2n?=
 =?iso-8859-1?Q?CUeORoiM6oJhlG+kIwmUrvyRI02evQsv/yQ4nA++WkDzkCDJNi+BtV0X5B?=
 =?iso-8859-1?Q?Sc9pL5+hWJ7D2Yo62TWSLShcWgPWjbD1VjTXHGQwxYh0Nuc8jEUnI1cYAm?=
 =?iso-8859-1?Q?VsfnB7krWaMjcXBtkZjDfbC2jNDi7zMmF7fZmLmTrB4r/78aBHkuaR2NSh?=
 =?iso-8859-1?Q?Nt+cvamVjWCWLwyMFnBhwNgy5z5M126gB0AW518ZQyZEemmVgQvB1eR2mZ?=
 =?iso-8859-1?Q?YKW8GXY5LjhpC0yS0C7P2xQM8T+yGOhln+uky21scDiKkfYcGBi8/3qPcv?=
 =?iso-8859-1?Q?lkbPRjqbr7+8pvQfs8zOKtlRd+raSrlaNMXIL9I1Wpvfc7QqDmmIT2Riqx?=
 =?iso-8859-1?Q?oCMZZ0I+HsfdJwbZSf2Bu1sk+P0rQrecikHwb58UDSK0qODGLOG2vJyFpu?=
 =?iso-8859-1?Q?zRkAMukGGBaPmZJU+U0Q0yOqU6s6OCqRIvnwYrU7dLv4DnPremskM5v9Ue?=
 =?iso-8859-1?Q?DX+6Fbyt6TLC54/AglRboN1FttCpnt3X5EunJ5c0AosdFW7ZYoKcZuEMqY?=
 =?iso-8859-1?Q?x7hzQRMpIbjvQutnVcdl7yC6Zp50it9nrqU0YqGdtCz4N16h843fdJJWQU?=
 =?iso-8859-1?Q?0cCwrovcU4uNRQ4Ju8DLYCQE6mZFnOaSKgxMEe/db+TM1QO2FhcQEQwarn?=
 =?iso-8859-1?Q?iiO9RZfs3tJOHfb/ccQ6OO0gwMDC8eYJFXm0sW1suYvuA5RI7gIGlpKM8F?=
 =?iso-8859-1?Q?rxg+jMOKgSuznMneDVVC1dzRizFUCvbUsstguooC3ERksyZINQjo9fHdQZ?=
 =?iso-8859-1?Q?JgkCxmsbgU+E8DOH1hXSBivqjz+s6V4Dw2Xw0UBJ27nL/3SKs0Np51HsVU?=
 =?iso-8859-1?Q?zx76SNCO5ERzUmAc+3zfasNo/octfBnsqSXlQKNuY9Tv2nQMkT6AGn6B8m?=
 =?iso-8859-1?Q?NGd57SHPE+HP1RGlJ2Y0kOGQpLbBP1bhZh00hUyfOLsM5y/ZV53KaAkQLY?=
 =?iso-8859-1?Q?Vy2VY39QPAjmLs4sCtakG20jG2ElWQePcD/ZHR8bBH6DshZzztZIsA52SB?=
 =?iso-8859-1?Q?XwrS35bw8TgBT31ouM/CeO2FW6ki?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?twyWU0sYwJ8hzGT3OffReESTHGkHPO/MINX2mg9mR2AOboEiVZ6yehlJlD?=
 =?iso-8859-1?Q?gYvfd+vbgnpaEOBtooDP9sc8ACupHMsawXDFn7uElad0RRE8AmAOOlyfPl?=
 =?iso-8859-1?Q?w6H9xO8VbBALVoHouyKsfVJKp3bMYoU4vSUwAV2+4dNP3WH0DrFkqJ1LFe?=
 =?iso-8859-1?Q?sqTdkyGxb4LyTVNru23XXBBwzg3QB766G6hZoAiSAm9xj3qQdibd6h/+YI?=
 =?iso-8859-1?Q?aWBWgD78EwaqJegEZYjBu+dSprWhZh3Fasabcl5wIR1JUnTbC2+Ju9FzdD?=
 =?iso-8859-1?Q?9p0E0a/bCqDxF8oNqAU6eL43FZ3XQAdGnHppmO90aBFjcaBXB7018+Ziz0?=
 =?iso-8859-1?Q?T6TTVhSJDq8GrontB8q7ERzDtaDIGAnn2ddZZ3BKngnhrKhv/hOCADllrw?=
 =?iso-8859-1?Q?QrJDBtD6PltqvBf+DvtVCa7UDHlvv6YbREbfRTlLd4LBG9Zsfjk/HXCJrX?=
 =?iso-8859-1?Q?f2fD3aegOZ+RUXlTxZ2D+pF+RdnmihI4Z4gSBrncCysu3TbL2C9J9mMvCy?=
 =?iso-8859-1?Q?bdAyoocqjebtdQW1YTExXiJk9MaFNQ+JPF5cOdPbA9j7cuGvJIM+OImfBJ?=
 =?iso-8859-1?Q?NoohIxk6t6VikkSgtbTWhxnOsfCbOukBjCdb8MNefI12zjZ4FuhGlKw3Bg?=
 =?iso-8859-1?Q?ZzIUzWF6pS6M8IXNrbpKAYD2APwQFIBYleuSnm4KlklIWkvojFF8PKhGiR?=
 =?iso-8859-1?Q?VhL7r02BM/Av/5zouA8XExtpQL0tLHiiE5XZPzcNwakWwU+sq8s3REsItE?=
 =?iso-8859-1?Q?jn+Ot3pjTCAcIOl5b+7U5teV8F1CmH4cgHbKHH6SXcItAzc+JxgdJIeb6z?=
 =?iso-8859-1?Q?BMI9Ov1t/if9rE1Dni7wBLGmGza/mgYx3DcHXlHhd3XhMUMYdKUxUcaL1Z?=
 =?iso-8859-1?Q?Ndfn6X/Hmj3tU7FfxbnTDzkRzBrqDJW8hM+yOgmUJhJa3r0+FTEGtLGBZ7?=
 =?iso-8859-1?Q?U4VRxCA2PNpynHDpH7pJZ/VdRUGwInWElyOiRElo639CgtLOcbsEruipSk?=
 =?iso-8859-1?Q?0oDTY1sgVOmeghy8eOvB5yytmrJt32N2HuWPYshDMNULhHJNDQIwrfoXJq?=
 =?iso-8859-1?Q?qpKyppMHudu3bwcrFKFBaUI/Yc3VbjfmgsD+lJxyW5AMEs1Nil4VWDDo6G?=
 =?iso-8859-1?Q?UWZTb86yqx2kXLM4XYehVzGORFzNocI0RqPzMdQJSMeykRNLcvY+2TQmmt?=
 =?iso-8859-1?Q?5dlPofmSHzELzydktOBQMW48vMS6oAcow6VbemwHqiMxxXGuDrqzS6aphH?=
 =?iso-8859-1?Q?8Twklixd8rXQoeUzxFArlWDh1hz7N+1JkB4A3Z8e6MenllzqTzufgZV18l?=
 =?iso-8859-1?Q?Nh5OHRahxxXZKcHNG+TOq1q48dzIAUce82mfqVmq/NrehbFbo/+I50CvCA?=
 =?iso-8859-1?Q?69IYGcpg1teYaBD6HCDn6NXUeew0R/8dBuko7T743kkBe4JVHyOhNPRZkI?=
 =?iso-8859-1?Q?lMQo5YyeQgozxm/PBlbeZ8DYMGa3YpV0xGRrm7G0rXq9m+CyWyszSD0yHg?=
 =?iso-8859-1?Q?zUSQcEXdcqyNphKbYwtMkqVX1p1XTk980TsPo8NTAH+SKFzIljMifjKLKG?=
 =?iso-8859-1?Q?ztGFQoTRdZx4YpHAcDC7NUhfX7LCrn5JnntS1r0RvrRcxYfNGuvooVFyr0?=
 =?iso-8859-1?Q?pfu9V5yEES/dfJgy4t08V9ixS76+mI9cH/Go3IEn7Dwh0zmuFlyymB6e4m?=
 =?iso-8859-1?Q?fkWACL3dUDc8xM65SWtUREcS+pDm7GqXt6zKZbkgk87MphvOY3Oy2UNuDt?=
 =?iso-8859-1?Q?32l2nEvYDu5LOuf9K0SmcwWfw4MiFn5xjNWuSdU3DOfZ0mWS+PY1eK263q?=
 =?iso-8859-1?Q?5Z0BeuOSexNgtVh2pctnOz7yR6atKdw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e5e32-5a55-4bb4-2f72-08de5f4dd665
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:48:24.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsXvweuzJEC7yaGNYQUYfml76K0WX4PFtYIFl7UhBh//JXcXydNKF0wQTpfFp2yxBT/hvaxoZuTJTlWWi9TjR5/IKPxGZ5d47wQn7pka9jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB11787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 15:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230137

--vouqq6on2fll33av
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH] runqemu: restore support to run without bitbake
MIME-Version: 1.0

Chen Qi via lists.openembedded.org schrieb am Do 29. Jan, 11:08 (+0800):
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> This patch is basically a revert of the following three patches:
> - 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
> - b931f74442 scripts/runqemu: remove the code block that works around the=
 missing bitbake environment
> - 8197be4dd3 runqemu: ensure that bitbake environment is either returned,=
 or an exception is raised
>=20
> The comment is also changed to reflect the current usage:
> "invoked from a running bitbake instance" ->
> "invoked from environment with no bitbake (e.g., SDK)"
>=20
> This code path was deleted by accident based on the reason that nobody
> is using it. But in fact, running runqemu from SDK needs this code path.
> Such case has been supported for years.

By the way: I use runqemu (version from kirkstone) without bitbake, because
bitbake is in a docker container (kas-container):

OECORE_NATIVE_SYSROOT=3D/ runqemu ....qemuboot.conf


Regards J=F6rg
--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--vouqq6on2fll33av
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMTI5MTU0ODIyWjAvBgkqhkiG9w0BCQQxIgQgbeWz3YVl
cnHv786rNo5a1MWsG74p8gBQbHzACCDlPN4wNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAHcE9tMCMI/e
MFiP4dIOMySsGpgqSjt8yP46Koa2jrQXijnkwJwbW42QPsFf5y97bC4VNDhL/SAEqW7bI49D
8dGtaAOwhrYI9+wpzbLkXg8LP26M6rD0NzsK5CvADQwJIp+pWPp2rJUMGjzD7tsliWzKKcsy
zjQPmaWsI1+woi/Ws9df8TZS1yB4s0x634ZJY4LlRu/fJrjQgXyeqVBCr+3W3zA6t88V8+Sh
vr4MT7yQb4ScJKhJceOz04c5AOg5vrVNtcxF6VSXGW1hnTMyYU/ge6oAA4x3p6OF7tVPsD7y
zQYKCBW4HYYmFIgDw2u0K27vEkQjBK/i7bVH8U2k3Ik=

--vouqq6on2fll33av--

