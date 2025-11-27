Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2D1D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 10:51:35 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16012.1764240694791104691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 02:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fcD/xf/s;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fcD/xf/s;
 spf=pass (domain: arm.com, ip: 40.107.130.25, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uobmAG0RbSQVrVXjEqQYYgxHQEKRpJmUa/h5d+83Y2xB8YS6xnBFbDgLZNbw/y69IiXRYYS7L0Ebrsfxp83aY/aGW3JN3EV7FX8nUEg477w8sM7sB42AqE6y9+aRD5+nzJx70g0vBLlki4rXaqUBtz51JIsI9pbBJzGL2pWQNeR8Ui1UNkg7Wvl4KalxZveYZP3imMdn5N2fg8bFAETS8yMNxcNx02rdzvHZSy+WuyHvwWBPMI/IJto0vRn0uakdYEuhobkgW7GsCf+B52k8b3AvTPu8nwLpxZ0PAkhEMKsDMi11TaceEEYDNz9fO8xARcoMLyesP32o3Iaw2BsPyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QpejXhtPAd1SN1pcpB2jVs2W9y84zQXBzE07EQMQIA=;
 b=BYL3cZy7AIn9jAHpv9IZ3zzgGG18uLaoEcCWiqXVjs8WAjj9SyCLxykHMyAFVAFu8QmcvFvzmtXsNSbqAGnvLPHGsdIswNdhb8x4BXcVyCgk79iLS8OnPZaD+WqIe15jHF8y9o4/WuWCUJugFD6S4f5UHBbLohEb6ayRbqyJ1C9yEyOQnwCbP3qL2sCP8Ht1l8memkE6I5hK0p9b9/PFzWmSV3hAqIKNaRt8Itou5Bwq13dwwWchsV1DCL+mYcgXrk+j/TvCD4MtQOYaYG1ku94YuPCISTzhWnnygJ6Yvqxp+6lBzfsQcnQTD9uYqLeiGTexFxGzWWjrTpQyflY3Sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QpejXhtPAd1SN1pcpB2jVs2W9y84zQXBzE07EQMQIA=;
 b=fcD/xf/sfatVPZz/1HEGYn6yxwUzuxQhfc4B9pTzo5/FFACbZdjH+K/81Nlhv4AF+Zn1jZuC4jlopKY798ZVpL3zaxjcv6BA1Uitwg0KG09lTMGCXK0qQCETrXqFskwmSH3hW7yLK0u00JJwLlM/qQy6EWIpFrBYf3h9snyZtl4=
Received: from DU6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::25)
 by VI0PR08MB11293.eurprd08.prod.outlook.com (2603:10a6:800:306::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 10:51:30 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::48) by DU6P191CA0025.outlook.office365.com
 (2603:10a6:10:53f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 10:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 10:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+oWlvEFnmMuPlkDJeRr6vlDXLlICFbIMnox6xDA4stujaakMhX7Ol7E5r2/fQvZTPfcGDBt06c79iWf+Ps0R19lh5qfk6mtOylEvGMzN7F6Q1gijIWypvAk/st5e5+JtiHvTApB2K3YaU96KK5fwfMaF7p8CUrJ7mR1gGrsBNh66hg2ZaSXZRK9C0f05e6eu4tFIuswigIrLddLcKl+hcFi79vFHG0upOdOzXYQRkmsSAMHBOLgtJh3C4/5abeXluqFoF6/O2Y1g5gKR6v7oCbzaoA3lPZ0k0JNZfhpKm7nPO0pCBjeUgHONeU5pJctndBtPZU3kWzRJi3CsJt/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QpejXhtPAd1SN1pcpB2jVs2W9y84zQXBzE07EQMQIA=;
 b=Cl+bdlT59FgRioPs8DZiuE+2b4utBb03izKNafuTJd5LY8lGlWp7PgpfwX4Vy4HGXQZ5Mg++PIpM9wFk5FZ2kTxfBY/iuWHgNH3f4dfAE3oFbiKo40m+BPRPNOmKx91uSizvAGcEL5l4/zDWNcM+gjToWGcYPkExhtgyQogOswmellT8Z7nt1lKsgUSXut5KfUzKOAXvo9d7giQxHRktVYpqXAE2bDCmQyFYpYQ97RAPDISmv7/viWo46+2/UieTiOubghiS/Ujwrn+mQ7tKBjBlG031QgCz6B11R62Y6YHjRirptAUCPxIDnMzt+kvCo76l+mPBtvUpxeYc6dlNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QpejXhtPAd1SN1pcpB2jVs2W9y84zQXBzE07EQMQIA=;
 b=fcD/xf/sfatVPZz/1HEGYn6yxwUzuxQhfc4B9pTzo5/FFACbZdjH+K/81Nlhv4AF+Zn1jZuC4jlopKY798ZVpL3zaxjcv6BA1Uitwg0KG09lTMGCXK0qQCETrXqFskwmSH3hW7yLK0u00JJwLlM/qQy6EWIpFrBYf3h9snyZtl4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7391.eurprd08.prod.outlook.com (2603:10a6:10:352::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 10:50:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 10:50:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/18] python3-pygobject: Use SRC_URI from
 gnomebase
Thread-Topic: [OE-core] [PATCH 03/18] python3-pygobject: Use SRC_URI from
 gnomebase
Thread-Index: AQHcTJNXB82lSczZYEm5YmcPAvZ4JrUGfjcA
Date: Thu, 27 Nov 2025 10:50:56 +0000
Message-ID: <83FCA803-98A2-40F0-A46F-7ABFD0CFDB72@arm.com>
References: 
 <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
 <bec5466d6ba8633810148122642b7658bbc2cdc6.1762154252.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <bec5466d6ba8633810148122642b7658bbc2cdc6.1762154252.git.joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7391:EE_|DU2PEPF00028D0D:EE_|VI0PR08MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: c591484b-6fad-4e9b-b4aa-08de2da2ec2f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dUo0NGM3QWlwRk5vblErb1hZUUppMGtERnZMbUx0V085VTc5M1AyeGhsVWpN?=
 =?utf-8?B?Y045SWIxcklBM0JaRC82K251ZE00KzZVaTNJOUZxNTFLTjh1eEV0WGgxSnJH?=
 =?utf-8?B?OXJ6WHV6dFpuVmJKZS90UGtIUzNFS3pPUnJ0RFJneFVPeHpkdVJ0eW50bFc2?=
 =?utf-8?B?c3FZZkszZWlSMFJtb1JrcnRoVEhXMmdWc2Z0RXVjc3ExeHVIWmZUT3h6Nkky?=
 =?utf-8?B?cXdjTHlIRWZDanBsNjc5TTJWWlJxUlR1Unlxb2d0TjVBdHVJdlBjUUV2YVE2?=
 =?utf-8?B?ckhqaUVHVERoLzJ4eWtjRVFlQVI3VWE4QlZLbjNHZjJXMzFEc1F6NEFnVmpO?=
 =?utf-8?B?OCtYZEdRRkFJMmQ2YWZYMnVVaXc4RzMxS1NBNkdwbit3SU9CcXJjb0hOOWJI?=
 =?utf-8?B?UEdJQU9SV0J2aS85V2J3K3pxZlFPaUFQK1oyeHhFeGwzWUtLTTloZTNMRU5r?=
 =?utf-8?B?dFN4eEJjVTU3d1I2VkYyWUFYQVZaakRubGtCVGxUbi9TZnVnVVg2Uy8yQW9K?=
 =?utf-8?B?T0lObVhyaUhmYXFsZGI2bXMrTGZiZGt1ekNlVWttZm9QOVIrdmRJYnJxR1FU?=
 =?utf-8?B?UkdnRHpZUk5NL0dvdTBDRzJBbVQ3Ukx0L1NGNVRYZEtDaVp0UW1rM0Vtakwz?=
 =?utf-8?B?UXIzTnludEQrUW1pTUpsMXF6dWdnNkxlSGVoaWhZeGR2WEx4cFVnOHl6S1Qv?=
 =?utf-8?B?andESXRFM3phY2NiQUdUYnFBKzRqbk9PbG9OUW8rSjJLWmEvbGVCZnczVExT?=
 =?utf-8?B?Q2xjZmpHQk1UOTNCUEtqRDVJTUJ5aW9UTUhMdldJSE5KYndYRitiSzQvaUpL?=
 =?utf-8?B?L3BneGFuS0ZLb0Z2SUJSVnNZeGVuNVdnZzZvOXlnemJiSlVhUDROM3crZGd3?=
 =?utf-8?B?WFdwNEV3UFF2bkExWlRFQ0JCeE85V2JZYU93blB4Mk12emZDeS9XY1RmS3BE?=
 =?utf-8?B?aDdiV3hPb3kzRmhZTDZwMVd5Wm5vUjdLWFZCWHVUZHhDWDV6QkpJY3FFVlFI?=
 =?utf-8?B?UmExOE82NWMzeVA4RnNBeDZreXdtR2M1dE5QK3ZaQUc5RVAzU3hSTnZSdG5h?=
 =?utf-8?B?SG1kSGVubUpaSHlGaXJaNktHNXUxTVgvMVpsQVJBRGJGQnBVdk42Rmd4OXFK?=
 =?utf-8?B?OWc2bEVVMTdTc0xWL2FIWGZCYkg2eTFoczVqcVUwVm5Cb3Y2bm13UzVKRDMw?=
 =?utf-8?B?SHB0dDZ6TGtjb2VNUTBWOUxBUUxBOVlMZW1XVVlKUFNCcm5XWDIzc3VSVFI0?=
 =?utf-8?B?SnYxTzBwczlzUGVKQjdGU3g0NmhHNHE3NktiUUVueEx3WU1XRzRhSXBLeWpv?=
 =?utf-8?B?Vk1sRU9hSUlPNzJyemlJT2VUcEZreXpQRlpad2FXL0ZxNVRuRGVFMFk4cXFW?=
 =?utf-8?B?ZVlPTUFTckZUUmNoWVpBbk9GZW5PaTZqVCtyWGlscWVmcHhtVU5tdTJRQXNi?=
 =?utf-8?B?RTY1aWdOejlJMnltbVVvMGNqenY4dEdnZjFPb1FWYkRFb0tiRUc3eTZORnNJ?=
 =?utf-8?B?UWpSTXpTcXlGQ2x5ZENoc25ZYmk3RHRId1AxNmJtRU1CdmFuUnFJMS9KMDIx?=
 =?utf-8?B?eDRRTmc2NG1ZbzF1WjJyUVo2bG40SW1aYWlXL0ZVUkg5WG05aTZQTE9aU1Zn?=
 =?utf-8?B?YWZVYmZjMjFQdFdoalVQRzdsZU92bFQydWtNZzVtcGJrZkNEemZTUzF2RnVm?=
 =?utf-8?B?d1RKeVpMUitwZ01tbXV4d2FGbTZ2aG84cjB5UWZLUE1ub0tmaEJWWCtiT005?=
 =?utf-8?B?ZzU0cHVaOW02OFExdURxWkNTb1pQNG16ejY3U2NBMVl4eGRacGpZY3o5L3pr?=
 =?utf-8?B?WHoxWTRMd0gxMnZOaW95N0Y2SDFKYlNOVURtMkRiSzdtTkNDb0gyeXFuM0l2?=
 =?utf-8?B?VGN3b3FBWXBqaHdjc2VOVFROK3ZERzN5Q2t3T09lUURBSkR0ZWloM0xiZWJ0?=
 =?utf-8?B?aGNJMHJHVnh1RXZSeExLbnIxWTd3YkF5NzZrcmxIejc1eTRUdDRNUCtmc1B3?=
 =?utf-8?B?L2dmVmR3ZnJ4WXEvK3QwSktrOWFHR1ZmZG9SR1orNVo0bUM1NzRCRDZyUWxH?=
 =?utf-8?Q?GWc+6y?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8210443240B1A145B4B32ADDF4FFB06E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7391
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78454208-71c1-4310-06c8-08de2da2d847
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a1JVb3RVWmZISzk1dUUzRklaek9nMVlRZ0I5TzVnc0F5eUpaQklxSUFYOVpy?=
 =?utf-8?B?WFZtTC80Ymt5azZZalZ0a2tnSHJPRGV1RGhkcFZqa0JwVWdRYVNXQjdsaUdQ?=
 =?utf-8?B?Vmx1R3BWVEtSbTVPQzhGUEJTN3hJUW1zTU5UU1kxN3ZMcktJMGt3MFY2TzB0?=
 =?utf-8?B?VVYweFJzNGVta1FDcmVMZzF2N1o5dkRJWXR6NFlGbU1jNGlNczNIQUh4dUU2?=
 =?utf-8?B?SUdOL21iV3RyWjdzbFdkM2k4eCtuK2lZb3plY0liS2pkZ3NiWTVDc0NPSTZI?=
 =?utf-8?B?NW9Dakt2VEZIbjVHN3RrMGdOUWhaOVlHV0orWStqQ1lTM0JKdUNkNWJOdmJw?=
 =?utf-8?B?WE5JWjZoZTg4d3pwVVA1YzdnVG02bkxLYStLZVQ1aW5wLzhodFNvRmFtb0xG?=
 =?utf-8?B?eTJLeGdhZVhVVWRKSFNRZXVrMnI1RG4vZ0wvOXEwamQvNHZrYzBsNUNESHpP?=
 =?utf-8?B?YjRHWSs3aVh0SFo3ZWtPemMrRVpnZ0lPbjZoaWd5c1BodHRWYTJhYXdVYThN?=
 =?utf-8?B?dWN0QUh4UFdubFU1a3VMcDY0UzdVNFF0NSswTGE5T3puQXRJNUZ1Y1JObGtk?=
 =?utf-8?B?MFpXQmJnNnBScytUeENESW42ODhKSUVqUlRMU2NwMFRrdFpVRWp3dDF4c0VV?=
 =?utf-8?B?WVNrYUJyUm53WmRTaElUYTRWbVJ6SHlmSSszUGxObXA5VERHTTVqV3FYZEdo?=
 =?utf-8?B?YUgzdC83SmpqdmlYYTA0UVBaWXJIZi9RSStzajRpeTNnbTk0cWw3TEhSYkl0?=
 =?utf-8?B?ellOQWtKU3ZpNkYxZnp4Ui9rWWlFUk1nWFQyZ2xOUzJGZVQ4ei9FZjhpdmZK?=
 =?utf-8?B?SlR2MHBBNWtqSzQyK2NCeVJXUUtLZ29sNTBkc0hUYmxSd1lJTVErNHgveGFj?=
 =?utf-8?B?dHNyNko3Qm56TEdXS2JoWm9pdGFmcERrdHd0OFZzRElKcGkrS0dQUmc5ZUhJ?=
 =?utf-8?B?NU5QUFhxeVlvekEvNFRSOUpQY2NKZlUrcU1GWm9Dd01zRVoraWlBSmZDcEhG?=
 =?utf-8?B?VnMvL3JjejRJSjMrSUxmMVhTSWNCZnlEajIrQVRwVVJIU0YvUGt4MERodm1x?=
 =?utf-8?B?aDI3MnFuTzZEWks1Q1RRQlFjcmdBUkdJa1hnVzhCSDhNSjNLdzNBNDNHUS8x?=
 =?utf-8?B?ODJIclJsS1ZHakUvRjc3M1E5eUZYRTVWKzhFdVZmczJiR2R6NjZpVXFMSldi?=
 =?utf-8?B?QlpFT3ZFUjBMOHRhdy9lNktGZ3lqcU8zSitHYTJvYW93R1NqaTlIcFdpeWJ0?=
 =?utf-8?B?cjQwM1pYbEQ5Y3VXY2x1cnBLZTAwbk9MR3g0NWJ6RGlLTCtlSEFlKzIyWUcx?=
 =?utf-8?B?QzhKNURVL0Z0bHMxZjhrekpqU01uUnRtMEZGWHdKWm5pS1FRUlRPSXl3VUhI?=
 =?utf-8?B?bncrYnVZYWtNb3grbHJXcUZpR0NWYU5zYlhGdHJ5MzlZemNEdEVUcVhRUmxi?=
 =?utf-8?B?WnpUTzczZHFhZFhkNVc5enRUQkFYLzNPcTJtTityMTROeGZCMUc2UFdmQ2Vw?=
 =?utf-8?B?WnA4aTNWMldxbnZpQ0c5WkNySU54MGNWSk1qUWJ4UklLV0ZPclFLRWZUOU5L?=
 =?utf-8?B?VlAvM0l4VU52Mi9Uemh1Z3NNcVRJTjlESkhkaVRJK2p6WUF3ZXZYMXU3NytH?=
 =?utf-8?B?SEtNR1VMcklQS3Q0cjFzb3B6bTlib3VoSkl3S2FKN2ZkeXBRRU5JeXo3dWdV?=
 =?utf-8?B?STlsSGpMb0N1SFRaSW9NNWN0dTRiOHZ1WStGNUZNb1IyVlo4dnV3NzhIQ2Nu?=
 =?utf-8?B?V3BTSjErQ0IycTkwV3ZxdUpoWko0a1V1ZitwQU11T2RoZXBvMTZDRnNaQ05F?=
 =?utf-8?B?eG5lR0MyQXl0TG5PVVZEMUNpTjk0YW1Id1lrcVdyOS8xc0RqWXJNMGhkQlVB?=
 =?utf-8?B?WUpKSEdQckxoQUxadURnWVpmU1QzWkNkQVl4WHl6b1RoK29vajFQaTRnZ3g1?=
 =?utf-8?B?aWk2dGNtbE5TSWVBbkNKVDRGVzROYXpEblE0Rk0xeXpnZXpnQTVCUVhuL2RX?=
 =?utf-8?B?NDhVOHRUNzdFWWNXN1UrUDBGL1ZXZHFPa1FmTmp1aTV1SVVqMHpGTzZpNEd2?=
 =?utf-8?B?SGFRdVUxKzNCMzRBbkVYVHZEMXpzUFhsdFhUOHg3emRabFBydFZRRVdoZmlL?=
 =?utf-8?Q?QZ48=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:51:30.3194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c591484b-6fad-4e9b-b4aa-08de2da2ec2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226831

SGkgSm9lcmcsDQoNCk9uIDMgTm92IDIwMjUsIGF0IDA3OjI2LCBKw7ZyZyBTb21tZXIgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiAtUyA9ICIke1VOUEFDS0RJUn0vJHtTUkNOQU1F
fS0ke1BWfSINCj4gK1MgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQVn3igJ0NCg0KZ25v
bWViYXNlIG5vdyBzZXRzIFMgdG8gdGhpcyB2YWx1ZSwgc28geW91IGNhbiBkcm9wIHRoZSBTIGFz
c2lnbm1lbnQgdG9vLg0KDQpDaGVlcnMsDQpSb3Nz

