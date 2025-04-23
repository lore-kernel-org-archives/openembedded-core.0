Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99663C369D5
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 11:50:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web10.6221.1745409051811329959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 04:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=IweQJR9Q;
 spf=pass (domain: axis.com, ip: 40.107.21.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNFzAhAzJy2qvyyqp7ajYZ4v6bt+zH6hkwQbf9yccty3AEKp6Ct4FI15tLhvqp0dAncu27B8ur/R1KRI985HVsYB+QK43sW5okuO3zGHFJkNUjWcB8KJrSALHLAGTJbxgQDV0VPTZwQRKy+pNFFbCwGMOwbyjlHRTuP30duI+HZzTafJ38cOLP0PRC0H8u8xRWVsz6LS33lLvtDb7Qwno1xw3+Cr+goEw+8kN7thwtsdy0R23xKcXRxN3SBOb4sIBZPjxPWLqafBDzcUXCc65g9U8DsQhkBUAW658ex/mEGHlg3jXT22FqFO8LNZ8cmPb+l6sP6JV9nXas/VB9+Xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F07wvsw3XU3eyvAu8WZ5ZpjeSs3m/oTnQAyC/C72VOc=;
 b=yim9JgLCFQVpoOSYLRtiWs1pGEs4PuenRKlnEWqYZb6BEYiouZoHy9A3GOVgKVWsXo4WidYSWgg7HKXpmRybTK6NkBUVmNPYpDdd7jaK5eHzBY5IU08xwqIg9Vho5ouvUUnvc6qYfOulGmwgujRUiiYN4VPs88vSihxxyDSFYfayVipPG2KYXlZpD9HYOARXOg3O+smraxqaP+1rN0LI4XzHBDKXZ+cAmENrHQDu7PHrgQIgVENAlVMNpYM3BPUxrLA1wwolKWwuokQ+JXEn+ICyAg/zhHnhcGRuN8eiwN9nR6WMNbdGV+Js71QgOXAWGHC/lzhhtboV6KhDplwWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F07wvsw3XU3eyvAu8WZ5ZpjeSs3m/oTnQAyC/C72VOc=;
 b=IweQJR9Qbg1wKnOo+KGsJXTBa6HEDch4LClS8i1chmlD3o+OWzAJrvCR4ga/ppuo8I00ogr+q6b8xrv2yAPEz8VJ4fX/NYYRRuZZ7LXVjZQiAGaRFk6PvSdini3pOlQZYLawagSysfNHlq/Uy++YaruKjKfqzqUe5onFOPZRBmQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9188.eurprd02.prod.outlook.com (2603:10a6:20b:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.21; Wed, 23 Apr
 2025 11:50:47 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8678.019; Wed, 23 Apr 2025
 11:50:47 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "patryk.seregiet@gmail.com" <patryk.seregiet@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] linux-firmware: fix FILES to drop RDEPENDS on
 full package
Thread-Topic: [OE-core] [PATCH] linux-firmware: fix FILES to drop RDEPENDS on
 full package
Thread-Index: AQHbs80SkvAy4E5zFkKo/1ypF6HxqrOxIntw
Date: Wed, 23 Apr 2025 11:50:47 +0000
Message-ID: 
 <DB5PR02MB10213177BD17F9DA6B9474CBFEFBA2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250422212432.3495828-1-patryk.seregiet@gmail.com>
In-Reply-To: <20250422212432.3495828-1-patryk.seregiet@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9188:EE_
x-ms-office365-filtering-correlation-id: 3278322e-0779-415f-2505-08dd825d1658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+HhwTMaEaxDJRsKfeQdPRSkidUzEwj6kdmyg3pP82cF8LRyLjVrEPoLS4fcK?=
 =?us-ascii?Q?dNEqR0PMcDTp3QXk06+oDLcbJCnUZeKR7bpCLXeuUGXBPBFn5h8dJv5llBp+?=
 =?us-ascii?Q?Q6wFjaGgFyrPJiIYCXoC5egqnvshH0oYtxpuI9oOK9bDpDDzbzVtamwbNQx9?=
 =?us-ascii?Q?C4FOfX7fbpzpd/nhGGSOW4tYmNdulHQH1ZMLWvrypCFkBJskiXQ3rkMYNWIt?=
 =?us-ascii?Q?0UKuypt3OQgUaJsA0RxWeex1YcTmX2d7cOiSZtkxuOOB9jrXu9v9XTcxOCYP?=
 =?us-ascii?Q?rwMU/oOOrB+ZhHNFXHbOOHMEEWd8vfFY3qAlFPoidV04RNJOZSSr3a+Bo3vF?=
 =?us-ascii?Q?ZZDZVYKk9eFwO8xxhbKK2aREDYQIUN3JVNdTtaC7/6l3ZYotgQd4nv5NHf4W?=
 =?us-ascii?Q?lR3E4dMWC92LUTAYKK11G8EIVeP/tEi0g9zCwDuzxMBUwvFgXUzGyekxtO9D?=
 =?us-ascii?Q?ERi1H8UiIm+lt8x3DYBZDAdlSvatFRdWouFf1s33srl7mHamNVno6417QKjD?=
 =?us-ascii?Q?Hs8vyOT8fAzXSTv1qicQnjmTxNbketNZPHeU8xcQQVrVzo1ZycLye5yzGK2j?=
 =?us-ascii?Q?wkzdkNEi7MHaShnxDUqset1r9W/923jwCUi/y66/Yz7FXVAvMjh4ljh/Fs8G?=
 =?us-ascii?Q?IedkGgkDhhp3x2NH/H78GSuViB3J0+GIwytfn+rEbRndetmNroOSNPNXrFXe?=
 =?us-ascii?Q?C51Rq5TGMCU3fli33M+NIoXBxz1lNnj2b7UB30VpgDo5NLAZ4rmCjEApERKP?=
 =?us-ascii?Q?YkgfwlMV1b3CZ2U786mj8JqM3OO6rM+MxAgDx00WnKmuGv3hNFYPdhrzOeBw?=
 =?us-ascii?Q?GNSkKN1jHxCmclKE8AsN3rvFnFeqAVA/LGPGLiulLUtfvLUC8PUNZqiaqBsb?=
 =?us-ascii?Q?odHucViC3jfT3vF+teohV11l/AVIfLPhEp3FFpbfIMZ3dP2WWgqiDA2aBpAz?=
 =?us-ascii?Q?cS1UKMGpoREFQSRKHEfDhe5mNk6jmol1nWty9WfHRAKB5P+HiwZJhdocXcWr?=
 =?us-ascii?Q?vTNe1524x7pYBJTdH5+pgEmaIsjYyeSrpUrZC603/AmZFaYmUFKK2pUP/PNb?=
 =?us-ascii?Q?7brX4y5t0UAyzjfpglTnYC82uWOvnDp6ZRvcYgwcULvnwQXxiyRZNYc6hMjR?=
 =?us-ascii?Q?uwnjhv6nWVPoEP0oZRFoyLvtwOdJgpey1A1SuANpT3isQgQOE7wi+hgRndhh?=
 =?us-ascii?Q?ABkGKarevQxk2JLR+2EnVANI+VNlqmR1PTSJXpd+XgF/RNAB2EM2DEHF53t/?=
 =?us-ascii?Q?vVdaf/oRA8INKCdr5WNhrkNfAgv9FeaeF3dSEpYjWUcgi4rfAriSIBZw129S?=
 =?us-ascii?Q?v7DwPTrzp+3xG+2raR4IZE2O3wuSOO5T6wc+XjQw+7yYUje6ojqe790i9t4/?=
 =?us-ascii?Q?klUDHrcQ/cjkqBgnVEfvb9L9EbPPJuqrCYYvkUxJ3ty71EJcTE9JhHgILClz?=
 =?us-ascii?Q?VnG2c8TfXh53Zoi5CwgyhcBpisEioYsYjAb6nQL+iFi8ofkdDd5M5Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pibfLSltKlouocXM3GX1c0YvN1IyalG86CSK1ccHTvQXMhkab/0el9hUtUsd?=
 =?us-ascii?Q?H01pDZ0rgyYuVb+d863LkvagNPw6SXQi6ckPW3RHbEbXnlIrCptQ8T1EE4Fb?=
 =?us-ascii?Q?qpVBrXxgtx0fessa+RS2rDwed12ytxMiJ/361+v84UWHjDwRyeV0Hmxp6+ol?=
 =?us-ascii?Q?1J5wcykY8jgmlu8SE3FDaa6X5ijy/GgLpfTB0RidenoCBDD0gbBGc36bw7rE?=
 =?us-ascii?Q?JaBa/S3JbUwnsN0CBsWFy5RIXURSHmh08hf/uNfynTLEysclqeStJ1fi5eT+?=
 =?us-ascii?Q?kITi1KgQN6lw4Pb08t4To18cXV08zROIWIKyi9NEcdNpy87hnfSAYS/PF8SX?=
 =?us-ascii?Q?vs/NBU9VOi5T6XQHQYsXyms0hNfZEqR6o6kuEtVMHMMQZahYFuPEI0N8NnF5?=
 =?us-ascii?Q?CTzvJyuY187a0P0YitX6PEQBJZBh60p5gXel8TXwWsgmTcHJ/dPuI/4die7G?=
 =?us-ascii?Q?19vdXGRewBcwnRRwc/icgATGcY2KWGAqwsZYx6z4VgVJ3TaQpzH3vJiqUkyx?=
 =?us-ascii?Q?iUYkPiHMSj0HH8K0rIIt/IUsaxgvuHN/yp5/9DpMLn7eolIbff1JbbjsS6un?=
 =?us-ascii?Q?D9vZw3uwHlj06iqJzYfRa3HjGqaO6A5XVO+F4WmLo+x2bOo+/MOUsG32/O8i?=
 =?us-ascii?Q?ex7RxxACqqrhZIVAdcNqYzr4ALa19Sq7eD8KJLdQ5f4pDO67pvi2ILMw75/9?=
 =?us-ascii?Q?c1x7xKLiOGK9znOLcgxNuUuPIyC26jbQmUGSdh1YEDHMLFPUG31BjJltpcAU?=
 =?us-ascii?Q?z1nCmlPDOPRe+1fc59EZdYPFGnS7gAbWuBNc6EPYluxJV34C8RxpgbWwU91Q?=
 =?us-ascii?Q?11iZAZ80fnW6AzhAddn9qxziBQ6IS3+bNKz2a0st/7DYglzyRJCaANcGxKZ3?=
 =?us-ascii?Q?oQjIZNRzDa1ku3MFqK3+OzCz+xembC9fwBuyHlT3XWUiFDf9DmJscjcKjkfc?=
 =?us-ascii?Q?x6pMQUZFod3qb8d1Tg+x/tRis2H59qnrETxtwqIFtL0u/Sk5DqOzK/p5H2br?=
 =?us-ascii?Q?N477jws7q+pRPLMATVYOVj7LWRu2ynuHmT9/hn5dlB62vcQHjszEoj9B+Pzo?=
 =?us-ascii?Q?dDQzELCeY5MqrNIff8edc3izdulbZlPpi/VX9r80/XJyeUll74URrGHNsO/M?=
 =?us-ascii?Q?KAbW9DGRaHdyv6ZRuTryd+yNqt4KOopaw9R/oDqSKmyAdGHnNna+rEvQbali?=
 =?us-ascii?Q?G4/HOKPbjmkkWLQc14hzycT8CAcHGWLPHCBrLXzCEzsPtNeqHmo1cedQUq4h?=
 =?us-ascii?Q?wQsJjTcnRU4HWf54qU3kXfknx87L30EhMrAMcmZ71m7fJl4iuNCiFyT5RqXG?=
 =?us-ascii?Q?w3yt7r+puVVSxTnZmvxmkP8elxRKPy5qvfQZBQqlU9gJlM693g41BFm7es/Y?=
 =?us-ascii?Q?Kz9PB5UTSVHCjJel8mp1PDQEryDhxz3axQ1RiUD/Qocm5Wvhd5XGeufsXuAc?=
 =?us-ascii?Q?Qngi8pessLUL0jPhtKP7PxDmu3bdD7Ct2kn8doFDQPNH7VY2puGuvXcYSyNa?=
 =?us-ascii?Q?Prqzlbm6Qw3arQ9o0YvXSDDnYBRdkl1CdqY4pU2wbzxN7v+3C3TdO9Auykg2?=
 =?us-ascii?Q?3puXCXQKdggNoOQIq+Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3278322e-0779-415f-2505-08dd825d1658
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:50:47.4542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yPt9N1i/3d46/GYlzK0t/psUw154zUDWQKFhmnQeW/IJlgQoCAUHHblIN32Rklxm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 11:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215282

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of patryk.seregiet via lists.openembedded.org
> Sent: den 22 april 2025 23:25
> To: openembedded-core@lists.openembedded.org
> Cc: pseregiet <patryk.seregiet@gmail.com>
> Subject: [OE-core] [PATCH] linux-firmware: fix FILES to drop RDEPENDS on =
full package
>=20
> From: pseregiet <patryk.seregiet@gmail.com>
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
> index f12bb2c6d3..7e5c4e25a0 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
> @@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
>    ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
>    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
> +  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \

I believe it would make more sense to package=20
${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*
in ${PN}-rtl8821 instead. That would match how it is done for=20
${PN}-rtl8723 and ${PN}-rtl8822.

>  "
>  FILES:${PN}-rtl8821 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
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


