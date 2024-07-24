Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066F0C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 04:57:47 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.74])
 by mx.groups.io with SMTP id smtpd.web10.3750.1721797063221465293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 21:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=b7psL9oj;
 spf=pass (domain: navimatix.de, ip: 52.101.70.74, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyNPKqyBpCAJBiQklVYwjNBDOW62ESbryvqy157H40UZQZ17cxzJNfg5WLCLNucuqGjOrCFNqAf/g/by6jNsSPo/Oi6/naPR14D45ZLHBtfAnIVhP17UyorWDQWXY5b2vjTay4ipmHp5fIIf3iV+APFMbBnz0hNgQaCg7NmySHmU5ADf9X6qxpgi8U4Yl1dv1YtLAPHaJBZpDVLMnPaLfFk5cUAPybH7tY4ctlcc2SXr+pMqxegnWqHzA4kfkTpyLOBU+FS10OP4f3/QOsMje1SluMalg+qv9AfLf9/CGzuY28eMXAwnXiQVA+jFuisNjvqlNWJG4d2UJPgZ+tV2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlHt9pshF4PCAWyNAW+y+BR0kLTAeMwfWyZb95fIj9E=;
 b=TE62QxR2uivZ8vu9KI7P7Nq7HqWHZpKTEcLVniyi7bimi/l5ME0+rFBcKEvdSjyu7UxvJ6aIKtKHTpa8qUgqENR/k2evYhbZfZH93YIt1TdBmfG9FCe+xypZgLWH3O3o7N0b5vEQZlyQdqRy5wI8LHIgzdB67VicipZKrsdwU8GRxzCuPN2B9Rbi57fAz6puXl6xuZD/qKcXkxSRFf0k/oaS5+GFfrz8X+Xk68NyqrP80i6MJnOQ+VbtLGmw/DH6Gs1j2Btj//RA1xtn9wFNWIxVPORmXO1KIMcLz3g4yN/9g5IqzdpOxm7Te4ihbXxm/TsGWk6dsskx4sMi3yN3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlHt9pshF4PCAWyNAW+y+BR0kLTAeMwfWyZb95fIj9E=;
 b=b7psL9ojXashtNZJuPZvFXgBRID5XPOw79k6pi+1bqEw81HdVqPjuFfOQzddIFRhLd2jpKdAylHjb8+KOGwT7aPWxRdXJfk4u5krB8eAt2pG8b0WvXo0MY4oo7BEsGdXZToa1tZ3S0/PI49Xc0UAORXWJgk7wraC4WS0R3VJniE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB10920.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:223::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Wed, 24 Jul
 2024 04:57:38 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 04:57:37 +0000
Date: Wed, 24 Jul 2024 06:57:35 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: rybczynska@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: Re: [OE-core][PATCH v2 3/5] vex.bbclass: add a new class
Message-ID: <rmo6w2nlzsa2plxf3qnjgb34nu6fgqk2zbdct5zothkowdpxod@4bmp3fohorxa>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
 <20240723115315.207013-3-marta.rybczynska@syslinbit.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="xratwzq576yflgct"
Content-Disposition: inline
In-Reply-To: <20240723115315.207013-3-marta.rybczynska@syslinbit.com>
X-ClientProxiedBy: BE1P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::8) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB10920:EE_
X-MS-Office365-Filtering-Correlation-Id: 03637faf-052b-48bd-815c-08dcab9d2386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0tGSVozSVpwM1NGeGM1TFZ0OU84TjEvQmVlQVdKOGxyZFNkQTBKR2Fma2kz?=
 =?utf-8?B?ZkQ1V21rdmx2VmxSbS9vZjF2RjhTRVVmVGRMZVk5VmhTMzNnL2UxTmpDeUxp?=
 =?utf-8?B?RituQWcvZTdETEdFbkQ0dmFORkR0eVNPMlk1R1N2dW5mNzhZQTdCRmhBNVBF?=
 =?utf-8?B?RGo4TXg4NktuMnRtdW0wL2xaUWhrT1dFbU5QWlRzMGEvNzE5MExIYWJOL3Yw?=
 =?utf-8?B?NmttMTVrZ1RLSGtyM0tpUjI5OGVaNDl4ZUNmQzYwdWJxRXRzSHVoODZ1NzJz?=
 =?utf-8?B?UFRiQUdVRlBwTFBVNElyWkFGT28yeEpwR2Z4Mm5aQTB0TmFrL0REcGpOWTJC?=
 =?utf-8?B?S2JNOVBBZG1FUjFHbzNWMThMMmlXUWJKZFh4NjBPR1V6Tk5JMWUya0RPYUcz?=
 =?utf-8?B?QUZzOVVsRU96azlqRGJiL1dBSXRJbHdiKzEzYThTdS9sVUxUN2xzckVNb1U1?=
 =?utf-8?B?K2ZzRXhMTWU3UHl2SUdmZWlsMTAvQktaU0lNQ3lHcFlieDZWU1kvSVpEb3VQ?=
 =?utf-8?B?bWJwUEI4OFI5R1NySXFVS2YvbnJrczNtd0k5U1Aybis2T1ZwZ01uekpnSlNz?=
 =?utf-8?B?WFJQNUZFdkl4WU9sVHhUa0ZFUWp2UExUTzE5UjJyUUNxMnUzbEtlYXZnT3dq?=
 =?utf-8?B?QlJrT1Q4Ty9kOWZGSkh4MTFKMkdjQnBmQnprNzlNb1RpbmRXZllIQ0F2U0R4?=
 =?utf-8?B?ZEVObHc1N2ZFQ1JJdGpHcHB5aEYzL29QL1pOQ0M0djhwMTNlbStMaEJCU0FN?=
 =?utf-8?B?V3QzRXdVNzZ4bnNpRG92RjVlckN5MWhaa2JLWmtNcU9DeUMwanVCVldnanZt?=
 =?utf-8?B?ZTdJREFKdFJSUHpOelFMb0E5TlkxRjlaWnQ1NWRHeXNkcmM0UWJBT0FiTXJH?=
 =?utf-8?B?L3gza2pRRDNTTFFXZ0JCNmhGb1JIWHJnd2hOeitNd2VaZklBU2Zxd3BIOU5p?=
 =?utf-8?B?WGgrdGhEOHgwdDFJMTV5eVVKdnB1YlFGd2RjRFcrOGRHV2lnK0Y1eEN2TTgx?=
 =?utf-8?B?MCtmenl3aGFYNWo5TWMrc0FKNzNMWGF6TmhtS0pmWGo5RHFqWFNrUldSeWFM?=
 =?utf-8?B?aHpFMkpDeXJGdHZUUlM4MWgwdmJlQ2tHYkowR3BPaGJzdWt0QmVnZnArM2Mx?=
 =?utf-8?B?c2pnU040NlN4L1pMejQ4MDNxK2tENm5SMk05QkhLcUdSNndQbVpQV3hSYUlG?=
 =?utf-8?B?SW11cXo5NHkzWG9VbDFuK3J6TW8rVmVjLzdja00yZ1JCajNNaEVzb05oSGdE?=
 =?utf-8?B?ZHFQTjE0dGRiclFBQlRzRXZqNDhmck5jdG5OMTBuSVU3WS9TaG1FOHFXVHRr?=
 =?utf-8?B?K0tXK2E1c29ZNjdaS05OWGpyZDY5NUM0ZmZkSVl4R1YrV0dVQnpuU2FDZTFV?=
 =?utf-8?B?NjlLSk9kb2p3MG5uMUZvNEJKRFpBVjRjYWkwbFpEOVVPaEI5RTB4bUZkandq?=
 =?utf-8?B?WmwvQXJlOC9wMWpqQlZMZS82UE9uRVFlcURvSzFrT3hDSFBaUkN1N1I0Nnpz?=
 =?utf-8?B?bTgyMzd0Wi9sK3h4bUZBVGNDSXQyQ0FvQmJXdUZBMkQ1NGRXUEdCSDYyUTd3?=
 =?utf-8?B?VFAybnh5UTlaYVNrSnZaVno0NzAyYjRObHkvcm1HcWJ5K2lBYTV2ZmR6b0dm?=
 =?utf-8?B?aEx2ZDU2VEczdmsrMU9MQ3puZHMwakJoajdwVExPK0lIY2ZueHk0amNVKzUz?=
 =?utf-8?B?UXFjUVFQRnc5Q204a1czV2JKTnh0SGtWRXdEQWthQlh2MzZ4c2hFZUUzc3c1?=
 =?utf-8?B?eHd4YzRSa3Naazd3dGhRUE5kQXNMK0FKdzhNaWxkakdQR3Izdnl2VndsWDdn?=
 =?utf-8?B?djNLVTNoQzk0K0FaUFM5QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dy9UNGw0TzVkSTFjRTRzSHpqRzc3OGpZNGxHak5BNUxRVDdFMTV0MU8vbTRn?=
 =?utf-8?B?aSs5NGI2YTRZbUtDWnpsU0JRdWU2OFVMMkczOHhxMWdOa2FqalJOS3d6SXhu?=
 =?utf-8?B?ZjgxVUFHelZkTVEza0hPZkJLQXd1YndiUWNyeWM2YVpBZ1RkVUhxRUdUdDdY?=
 =?utf-8?B?VFdSK3pheEVLMnpVaWhxRkpic0YwdDV6K3Q5bzhQYVgyZnpoS0tGRVh0Yi9K?=
 =?utf-8?B?YXBBWVNnYTYxVWRLRXhpdFl2eWgwZlZQZDZoaDh1a2RYQkhhYzJ0SzJmTWp3?=
 =?utf-8?B?Z0ovUEtOTTFucEw3eEQ2TE1SZXVudXBPVzd2UmhjazVHbFlhZy9UcU9CeHF1?=
 =?utf-8?B?QmNUVE1TY2wyb3RwQzdaQkFya0NjMzVjU0IrZUhqUFBSNysxbjVuVEM4Q0Q3?=
 =?utf-8?B?TE4xYWZwTnVORGF1ZFVmaFRHbFo5RDZPRmJScEJxWFdzK0lvU2Y0SWlZSG43?=
 =?utf-8?B?VEprZlBydVBpRzk5akhlWk5yZ1lYUHQrY1Bya1Ara3FQSmd0ODBMYXd4eXl4?=
 =?utf-8?B?TExwZ2dLaWNOWllFU1FFWTZ1QjlZektxU1BYMWx2RmZoZFRacFI2dkZCNklh?=
 =?utf-8?B?VFo3Mkx2S2NkU2NRS2dhVGRKWUQyT2lnVElvaUxnbkd6eGRRelIxd3dVKyt4?=
 =?utf-8?B?Z1JrUWtZK0k3Q2dvSUxMQVQrbkU4Y0tGR3Z6TU54ZGxzNnMwT0p1ZWZONkFh?=
 =?utf-8?B?NlJjc3dvN1EzT01WQWZZYitIbExkM3hDQ3ZrTG9kN3ExcmxUWTZUT1NsUWZ4?=
 =?utf-8?B?bTg0NWtkWUV2TUp3VXZraGptVVd3NnRwKzI2SGxpSTJSWURXZ2x4NkVwbm1i?=
 =?utf-8?B?ajVEbWRtNThoZ1k5YTFiZ2FKNFVSR1M5WWJIUEUvUXplTHhuS2VtVXVCWjUy?=
 =?utf-8?B?TEtldkREZnF2SlZXNGdndFFsd2RhWXpmQUtwc3IrcExsdWVkUW9xS1BPUTJT?=
 =?utf-8?B?ZGpmcFBFeWNVelpPTVdnNFM3UE9wczJ4TDNFTlY2aGx4SWF2bThPOThRWDY0?=
 =?utf-8?B?cUpSVkdrMXZyOUhmdWhQRWVITEU0aFplUGsrc2krQzduVFlicDhZQ3luVUVx?=
 =?utf-8?B?QllueE9GNUxkcmtlUDlHYXZXTUdzUkNxaEpUTFY0OTZGUkdmT0hLd2x3QjZ0?=
 =?utf-8?B?bVVKa2lBSkNsaEp3dDh0WDhiMHc2U3JBYkx6eWsxNFRvMEhIQ0EyVFIzdHR1?=
 =?utf-8?B?RVE5TjdSRVJVK05DcW1UUGVIclZucmIxVTFzNkRZT3BQbUxxbTJoN05XRjZM?=
 =?utf-8?B?TWs5V0JuOHhXaWhvdW13ODMxU3hnSDl1NnR2QUs1WHZNZGxGQlc2b1dnQ3Fr?=
 =?utf-8?B?ZHJSNExPL0FWQ1lzajhzRG1WTm1wRzNMMUwvWlkyWVNpVGVUWEhXKzYrbXZX?=
 =?utf-8?B?WEVaNUpiQitKMWN2U1h3c0VWSUdydzNmWEwyODJsRFhyNVhGSytva2dLbjNh?=
 =?utf-8?B?YisyOWx1eWZubEVCZEI3RHlRL2hKMFExRDc0ZVAvZHN6N3ZNTGlkMmxEODNz?=
 =?utf-8?B?WVFYNWRQRUI0SnJDS3hFbWRGVVlHUFJYbEt4dngxaEwrWHNPQXFZUVJJRnBM?=
 =?utf-8?B?VTJyMkN0V2o3M1MwODhySkw1R0lwd08zTzB3SkxrWkV3bStHUGhlN1RUa0xv?=
 =?utf-8?B?YnFselMwbVdPSW1sckJFODVhNStWZk9nM1RCb216RFdIbmVMTVBBZjArbUlX?=
 =?utf-8?B?UktEc0FLWG1yaUZGSHM5S1pBVndIYXdzcUt1S25UZXlURU1ZUzZxQnZJaHAx?=
 =?utf-8?B?OXpsOGJCa0o0eDhWR0tDWENFQXk0bVI3NTdzRnU1T2R0eVV6cSs2Y1JVS2xQ?=
 =?utf-8?B?dHZmNVc0UGZ1c1lUdjBSRHF4NVJLTW5ORDlYRWszTzBQUW5Xa2ZqOVIvL09N?=
 =?utf-8?B?ZnRpSmdHei9Rd3pKNE0xZ0h4Q0JBYXU0SU44YmJCUzdaeHU2UFM3S1p2WGdP?=
 =?utf-8?B?NGdVcndDbzNScWNBVXNUTWtac3NXOHVEMitMamFFOEs2UWV4N1dLT0VWdzFF?=
 =?utf-8?B?ZXN0QzJzTXN1TnI5WXJHQ043QldVTjUyM21HcHZXTzRxVFEzVDIrT1dJeDdB?=
 =?utf-8?B?d1FXSEx3WjQ0clRtNnRvZDlGdHY5K3l4dkxNMnkwVHRtRGxHSEtaTHhDWDFU?=
 =?utf-8?B?YWloaWJrMTU2aWIwYjBPYmd0UmhYSXBYNStGV3FZNXYrN0dpTi9FV3UzSFhF?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03637faf-052b-48bd-815c-08dcab9d2386
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 04:57:37.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6i6KZF9vExe3E/VFaaf3shcffdWpTk0EWIIcU6Rddax6xXUicAN7LFFG/Ym7Q9qqDKtd1ENJ7bBfh36zrhnXjYn3Htdm7tERaSogo8gh+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 04:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202427

--xratwzq576yflgct
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH v2 3/5] vex.bbclass: add a new class
MIME-Version: 1.0

Marta Rybczynska via lists.openembedded.org schrieb am Di 23. Jul, 13:53 (G=
MT):
> The "vex" class generates the minimum information that is necessary
> for VEX generation by an external CVE checking tool. It is a drop-in
> replacement of "cve-check". It uses the same variables from recipes
> to make the migration and backporting easier.
>=20
> The goal if this class is to allow generation of the CVE list of

Should there be an =E2=80=9Cof=E2=80=9D instead of =E2=80=9Cgoal if this=E2=
=80=9D?

Regards J=C3=B6rg

--xratwzq576yflgct
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
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
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzI0MDQ1NzM1WjAvBgkqhkiG9w0BCQQxIgQgFuPRGYbB
M5utIyjzhtP0T0DvVX1VYW3Hwkgv1s/Hkc0weQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAK+UAaKnAWJfKLxIscIQVlnODeL1GFGs44b8so1aQ5RLr0iLs4jyONYdeedRDYdxO
V6sCRvMQ6ufVSUYSW1H8NqX2RPRnB8+3n63EHhwtntxHW+uu7l44vyPZauGqJpYZR+Ey41Vz
tftI3S4xm61kwEoIV4vvUYpEoHbM4I2pt6ZanlzmO3TbpLplUcEmYtVgWY32PdgynM2k6ZR6
cZveeUMPy4Qz0l01SQW+Z/5vd5/1bn9wbDZJO0dgAch/1iN2WWVNkJ/rMK9dRBo/2CbKFcl4
515543O4RlVQVqUKbbYnI8ggFfpAM2MPd1u78iaNKN3OgffowkNiZVDZ6m2daw==

--xratwzq576yflgct--

