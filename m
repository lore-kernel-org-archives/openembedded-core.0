Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017F9C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:56:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web11.8000.1745413000699547919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=od2cxdR4;
 spf=pass (domain: axis.com, ip: 40.107.20.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUzKezN3DjIm3hxttqllkxdDYhuNyBvMfBTWgHnfrlGZOFILD52duA3ZXneDhs/IEuHA3PSVuhepmIXmbxM6RZLeBLQasQ9r9CaPgjhyWSEQWL+JsXQlZ51KHgiFgyUGZH/sfl5cZUd5SUgqkxN0+o/J7OfDZ8HAqqjvdlxgbt7Y3dWuiG5eXr7Hn14s/c87MmkWWGoiWkYCDlW13SmhZuVRER537ZJ8SkMhfy/ubSLq5w0RELeaJufxMS94HbYG1l3JVALeHrp8eS45fgQRW1grAmPqzBA+z/MAlZIOAueibOOaX2RXrU/VZ4Dkz82p/BqbOgmLHnilBS7vrK5fcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSWAM28IQv4EQdxKZnRWR6YaCp7hb+S9PV4mpvJA+OQ=;
 b=rK4qktRdKR02e2sEu1fwCqFJHJFYepPkfRxIhjU5JUDMtS3Ii9ZX6SJ1mhmmFpVRLbbFWdo+BTQkT58g6Utfyhym71wMxkM1mjyO9abs3DgFQsGbN5I15HJefXk4LaedBdjU7giOih76i1jlcJQWw5VM9ixL1qUhx3/jOtfo1+RymSYkQRZBRo6VDhU62J6biBOPcudD4s58crLF9BvXaB1wJfleN0sl0i+j2v0+vkHDee/zoO1/ed+ZuyOLYov9nUQNnDtWPikZ77XHvB2XfG9H14gbvWHwUkpbdMZvTBQUb1O4CQkjyDttYd8k06wPMEpy7umkaptOJEaEwedIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSWAM28IQv4EQdxKZnRWR6YaCp7hb+S9PV4mpvJA+OQ=;
 b=od2cxdR4znS8ocuwNCduzHG96X7/V2rKHLCou9fTZAjSeSL8GgAqAmBDBG7G4M3/msuHJ2uDNZJs1GMALyEWdAl+ghfjrqIxpYtoTlrH7563UxGdkk50FCFSnEAmRZbWpzEhU1hJnZ2anCSyIRcpdKxFoTxzw2dtbxt8YfjFFlQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB6512.eurprd02.prod.outlook.com (2603:10a6:102:f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 12:56:37 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8678.019; Wed, 23 Apr 2025
 12:56:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "patryk.seregiet@gmail.com" <patryk.seregiet@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] linux-firmware: fix FILES to drop RDEPENDS
 on full package
Thread-Topic: [OE-core] [PATCH v2] linux-firmware: fix FILES to drop RDEPENDS
 on full package
Thread-Index: AQHbtEzMKnusV+OJhUCeJ1eKdz/YPbOxM+QA
Date: Wed, 23 Apr 2025 12:56:36 +0000
Message-ID: 
 <DB5PR02MB10213C9F8254790148ABE5B01EFBA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250423122619.109306-1-patryk.seregiet@gmail.com>
In-Reply-To: <20250423122619.109306-1-patryk.seregiet@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB6512:EE_
x-ms-office365-filtering-correlation-id: f5de2307-3538-4f9b-184a-08dd8266485b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RGzI7P0g2jxzKEu2IhiJ55ut9F8PE9QbA0AFQ2fMpz3oyvMgnBquazWr9lFB?=
 =?us-ascii?Q?9M3dLyH9J/jJpnZT80LmAb2uxPGEc6H1rcR81h4m6XWHq9zKdjdIjG5mC5uy?=
 =?us-ascii?Q?KnIT9pRpW35iyBf+mjRBZOwsAmlGJ9dxeYa8Thyq1BGchCQqWLEw2ZsZa4Be?=
 =?us-ascii?Q?131rFrtyFdXShTc7DKBrZI5PtKqGi2mDNfIWF1VR0UPiiu6nFU/xbTXF9zFm?=
 =?us-ascii?Q?KzpZEUaOW8xLL5C4dYKaEHb/iOCr8llMIJGznJH2CVNvxCruDkkOkdGWAytY?=
 =?us-ascii?Q?jlPX8z9PqwsRnh3rddSWTj1y2Vf3TU72S3AkY0vmzXLTI/dIk/oQd3tECNPb?=
 =?us-ascii?Q?RprCjVPdohp8l/N0K8x9B9o6b2hIgks8x2eu8yOL/RXlxYzlTAeLFzEdtk0U?=
 =?us-ascii?Q?o8/22hwk4qSr1VPSxCHEaV4mvwFUHkrWaJ+LkkcAb/4FWAlhl+Vu2/M7Tv4o?=
 =?us-ascii?Q?6NcGzAIe6FtIEApuOAbGkDChfCApSs9tGm+WojFM5amTt6fMjyfnYfC1s6m2?=
 =?us-ascii?Q?FRcVoDYdbcsqnAuF/zPeRVfWGOgd4tc5zHrOlBvGn/rfQpNUDCcOd4aQoNri?=
 =?us-ascii?Q?NQGiRyGf5jwBhr8GbYe+BXlNvivn8R7CwCP+GJYLRgezok+OZFk68ycdt4CS?=
 =?us-ascii?Q?Rwq7npCDi2jYyTqALE49+G+QK04Fcq+lW4EDF0XvapmGoRMJnL0amckeVtHT?=
 =?us-ascii?Q?e7E0D00wBLy7R+xT/MfOpOTtaKCbKyvRmVoS3Hegg8FxdXigPxjNSG2ottec?=
 =?us-ascii?Q?RJaOBYnnb0Ja5wrHpk9kP8+fZNchKT7EZExWDPaOdYceHlpNZFljVeiSpJsP?=
 =?us-ascii?Q?NFuWVawTN1w87pXtDZe1FHExWvJHcCPpFe3IBj4l2C+qKQzp/EZ3Ku53k+Cb?=
 =?us-ascii?Q?dah1c51YONan8iUZjVkqK+iC5zDUbEFoe2SI7gbJk7u3snVVosZv0fxf2Qws?=
 =?us-ascii?Q?lknSBIIK2jipnJks4mtnAdp0gwirCyvgcho46gvwbhIujCKpBPjZmLfBxEHb?=
 =?us-ascii?Q?uou77e1uoWWbWLh34NAgPYyfCX/mfs/iofMNPySVfHuqcwfQy9lM8PZedame?=
 =?us-ascii?Q?Mm6LkkuvCwX+DQHrhJFnJgHoA12qB8Kyw7o1BuZ8/KEV8evq+0Z0Un1LHKeP?=
 =?us-ascii?Q?SFd/Q0GP1Jjygahu1pmVXnDTKSJIUBEddzHv00iFGalM20uebJwOCQKGqlMw?=
 =?us-ascii?Q?5zn9cAjgWaGJYtUxerg/DAE6fifj2N8b67hWTAl57bxytkaM2HAfGrSSxcZT?=
 =?us-ascii?Q?g0H0Vgh+dBIXC4WZJwPEuQGCaJtSNURCxyz4BDcWtogrNDW7YNn3EwkAsqXw?=
 =?us-ascii?Q?KVCDsAdgRZgm9OEthXik3dEiqFKsu9DaYI7YPOtGFzhdlr6QSmyuvt6QgE6x?=
 =?us-ascii?Q?+mu06TPGnYjhEa2byWvDVvSSwqaE0U/mtUxrmbxIayCV4gVzZxSzKNbELDw2?=
 =?us-ascii?Q?mwXW6M7bKksy7OUiY6vRP7ECaQ1HS44k5ClYitAJmE9K+SkMbf7/yg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/xfZrzknKksaIch7ru2J48D/OJapgt9kEEkB1MtYoK+D4LtzZhN7zuknMvDx?=
 =?us-ascii?Q?85lvkmjC9JGtgVp7nppVsZDfddh7zEIM+aInPmEaqBJqg2qAefigOPHx44WR?=
 =?us-ascii?Q?HLExhfiSxAllOJHdSmbVcNf3kQqJ3AWoU+irHMWTLFPa4EjaJepdBpjVWeZr?=
 =?us-ascii?Q?ZLgcSKmZPy3QmzbMBFK9R38nCXGLDDmVTqHWa7O9cFUrLLNHFczdGN9KMqni?=
 =?us-ascii?Q?Eh6hxopikyG4g0CUuXE263mgZGswHU8qut6b/wpnQLQvXbwpgdspgKGgvpcu?=
 =?us-ascii?Q?+t/C/gW2mM14B4ZikmZ6ySeaBWYWRvzWfWQ7lcdq9RTR75TM67bEmtCAAuPX?=
 =?us-ascii?Q?bGw2No8F+7ivTaZ/u/4Nz16P8nvG46nhYTCbYUr8Dzhtj/nEzM5wA4nDatNh?=
 =?us-ascii?Q?DIhrajWFjbgP7Jc3jAeXraNEAqPM2iwB06GJm/UjhTgdhlTfP45zliweN+ZK?=
 =?us-ascii?Q?5Y+CXjle7p7d+1Of2zh4o3VF7IWeVun397DT1xc73jceJ1GrzDdl46+sYl9X?=
 =?us-ascii?Q?mUDh6VN4Qdy7q4PiqB2PW67OsZSAUgGfv6hUkYKbk7RKw/Nn83EJftO6ejQ0?=
 =?us-ascii?Q?Jegj2vLr73mLWDez1QAL7FBfLQVCmTLAEqVPfXD689HCnCV4khF29s8MaoVB?=
 =?us-ascii?Q?EPpHlDbPNz7zvGnxxxAw6TdnfDzNbhVpB55q9Qg0YlRQsvKESqlyQTV2FhT7?=
 =?us-ascii?Q?ZUJRjrAXekpXmUMIAJp//iA1+jwonDyodM5krtLnDHfG7dKDObi8tgpWxRpS?=
 =?us-ascii?Q?14avLAZpOcStz+/P+V0hG+PSJoeb/vayXh+wSKvK9W4jcKBTj7/p6T3K83eb?=
 =?us-ascii?Q?E/vGKm0M0ihXeX84gHUsa1z7wu8ruwgauUfAYkkkEEUmFaXd3r0+SzwhAd1U?=
 =?us-ascii?Q?8P4CmYy8BcTFhikqBZmtM1NdLx+ItiURY9jow+7kOiiaijTc/bzxJE+2Ewjv?=
 =?us-ascii?Q?q7msSg+VruF1Jqv5BbSoLhUTRPDV/YvvUoHmKu9xp9RGwKPcxqvT+ZpFKTuG?=
 =?us-ascii?Q?Ljxdza5sfjY9z29IXeJnWs/mjjlcT3Sdd4v/7CnguLXOYetz3w0KxihXnvZs?=
 =?us-ascii?Q?m7vvfZLUIgk/PWA8i18dArEuraXmEPdlDoUPUIHAObNXOQSMfmGkjilUSXdv?=
 =?us-ascii?Q?8kXmnzjA1qhG2VXtJF5of1tlvbXH2pVB/CpA5qmE9ac+RM1FzWd2kldTLdPi?=
 =?us-ascii?Q?ZNDDyuRMHxE1TQl5pDoWy7pG2wG37PX8kLmVurrC/QtKVXQCqYEHBQmw4LBB?=
 =?us-ascii?Q?+a2pfVoqyYXvKUuSk9+dLst9CM03liSRimBAaIg8WN3qoFahl3athLSlWMkb?=
 =?us-ascii?Q?2/nxhYKnRT1vgng2MgaDMVEAqKwuTmVJj95YbLkVpLaXfoDl8+FaUrW2RNb8?=
 =?us-ascii?Q?3dPXA8qO0cAJU+UQd1/Z9C5NYteOatWR4yr42Z6nsP+Zh1YiPKaKWxt3rAi5?=
 =?us-ascii?Q?ujZ752tAfcNXkgbrkDVh7MoiW7M1EWPkzyUYqBzKTuvzzTbv2xL1f2rmQpw4?=
 =?us-ascii?Q?N5Y4p5QE4CY1Jb7rktpjQgctEDowKTuCBTD+OySCgnXvagDBctKcaU67JdPj?=
 =?us-ascii?Q?AIJxX9y6XNTA/x5zvM0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5de2307-3538-4f9b-184a-08dd8266485b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 12:56:36.8504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abLUdLYf/YDaVEvIlfvC7inYtUQleEKEJGv5YqK5LlhLfJAlvKr1t0h8CRTC1XIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215292

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of patryk.seregiet via lists.openembedded.org
> Sent: den 23 april 2025 14:26
> To: openembedded-core@lists.openembedded.org
> Cc: Patryk Seregiet <patryk.seregiet@gmail.com>
> Subject: [OE-core] [PATCH v2] linux-firmware: fix FILES to drop RDEPENDS =
on full package
>=20
> From: Patryk Seregiet <patryk.seregiet@gmail.com>
>=20
> linux-firmware-rtl8723 and linux-firmware-adsp-sst
> contain symlinks to files that were previously
> packaged only in the main linux-firmware package.
> This caused both subpackages to inherit an unintended
> RDEPENDS on the full package. This change resolves the
> issue by ensuring all required files are correctly
> included in their respective subpackages.
>=20
> Thanks to Peter Kjellerstedt for figuring out the rootcause.
>=20
> Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
> ---
>  .../linux-firmware/linux-firmware_20250410.bb               | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> index f12bb2c6d3..a548645f00 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> @@ -1257,6 +1257,7 @@ FILES:${PN}-rtl8723 =3D " \
>  FILES:${PN}-rtl8821 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
>    ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
> +  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \

My recommendation was to include all the related 8821 files, i.e.:

  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \

It feels weird to only include one specific file, especially as it is not=20
used by any other file in that package unless all the rtl_bt/rtl8821*.bin=20
files are included.

>  "
>  FILES:${PN}-rtl8761 =3D " \
>    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
> @@ -1760,7 +1761,10 @@ RDEPENDS:${PN}-ice      =3D "${PN}-ice-license"
>  FILES:${PN}-adsp-sst-license      =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.adsp_sst"
>  LICENSE:${PN}-adsp-sst            =3D "Firmware-adsp_sst"
>  LICENSE:${PN}-adsp-sst-license    =3D "Firmware-adsp_sst"
> -FILES:${PN}-adsp-sst              =3D "${nonarch_base_libdir}/firmware/i=
ntel/dsp_fw*"
> +FILES:${PN}-adsp-sst              =3D "\
> +    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
> +    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
> +"
>  RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
>=20
>  # For QAT
> --
> 2.49.0

//Peter


