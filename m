Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B0AC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 09:46:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web08.1594.1667814392331404415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 01:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=QWFDYeMB;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.56, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/vCLEO/uyRUwb+pCBIq1O31aKYX3uRMkrK1sDe7wFJlwa0Ytyg71oDjvg9w3m2uRjS7HNElXUVGpqRCt8mExjyfuUID4CmOMcBxA9eE9A/oYv90XkBRsasA9xr+x8uEEzDYd4uoodDLno8MNgtvMgr9sXBhY5WLKZ6U2rzI0tYRVLHG2e2hoVsI6pD/XnfnHCDYBCYDTlOq9VJcMu555n0AIyMDhbH7bub6ZcXxeMPzGrQhexT5eroFEqgDSw0rK0q4E70sodE+6Mwn1NXGG25s451maNcpfMW8nlhxAgUiBBrsn+MbRECi2wc1B689iELs7/gyQpDpEQQsFdIn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VwmuR0cW01DBkiJVPKn6GmBO0yLLaFavaSm2echPXM=;
 b=dFUDHEY/NqXEFBq7RPxTs1rVQ7Xwt93+vAo/fUelV3iDplNfS8lK1MuG32sNHobuwbIBlq6sl9drwQrR/SAc4qelvvcdrFLep8H9KWbowHLWISGXRTQ3w6GCKvtrx2FjO0y53iHcohz5EO2uOUkpYsiEXMAaeTEkShgVVj+9dRdUB6Hkcx3Ri5vjb1u+N4oCKIStGC3xudzLUEWj36HCmlcbPwcrDttYXwG+PY/1CZ2QdB/Wgznw9s6KrHMSlgS9OpBs5lidrsCLgC3YS8gN8oILDHRGr29+2NJvDvY8T7nq9yXD8xCmwNZQHrAtcTp18KNkW4f9Wtgn7UOrWxZMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VwmuR0cW01DBkiJVPKn6GmBO0yLLaFavaSm2echPXM=;
 b=QWFDYeMBb7Wbw5wJwtMYLOs0BuYAE8Ew3zSUlYnCZZyVnHvYR8/MzZ3pQPqlU0/iLciZwxdmTfE+uUbDYqdFCkQOqbUCLojG3FC3iLXYhq2EpMEozSOoOd2ViYwQr5chf7V6hpLelzMa5BwZB1qzNinTTtKKvsE9pGD4YsZCF7iou4PuATBkJpliJQQQjJNALRDfHjBRj/7LKATSXjQPic2CBwkhV8gRyG/7LCqHY4G44Ky5x1Gkqd8H/XmHkCXC5MEZPlZEStA6+Iz2+KoEnAnqCUU2tpal5+8rPSGX70ZGJk3DH8kIqs8sNWiH/xxK4GJUp7FkYs0maA/OtQpP/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 09:46:28 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 09:46:28 +0000
Message-ID: <00d37819-e04d-6368-47cc-10e0aa51c421@theobroma-systems.com>
Date: Mon, 7 Nov 2022 10:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] [master][PATCH v2] image_types: Add 7-Zip support in
 conversion types and commands
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <20221106133153.2232-1-egyszeregy@freemail.hu>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221106133153.2232-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS1PR04MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 7443bd34-3752-4d73-1ffa-08dac0a4f160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3aLROtm4qN/fG8yDMGC42Ar35r6O3FCIHbBI6dkJSjkVSJMPAvzRf6jf4L67MBSZgevQG29kaa11K3xy3w+Qx7n75/IMz5lZUbRzVc7bvGSqvmoLtC10ntlxyWgtfKIG3WzLGQdMXZJrhz2Q2k8bh2f+878OyRFe3Kq+UD0UDUDRolRyNM9OVlACdsLFJYugKqhJu6r+5kKMGNG3NAHb5L/lxS2FuMYz75Y6sRsoUya5N6ra/TUvWG4nbsKmhn6OMTC49c5VjE5lESxinH1v7Ht3SDSNzpd29a8vn/lKQC1KGE/jvrM0y5afaxvQMamwSfXKZ8rEw1+4nmbdLO9FGBgYkaZfza2GGChmUvZnEQLRrsVf5RWW44wcZI822Q0Uvz+yNJxS4K1tLg1nYOKP11KGkgVAdWVT6jlb/uAmSfHYVxdHOQ2phra2+Xi+uXOw1x3VnBfok0WshBgczFbOFlEqvZJUme4M8xGMF5lVbPLDwj4V5VPfyV2u7gltqJhJaYN/ioiDMJEJyQiUqOFaN/Ft12Q4LMyyAN8AZmJAj5m84y8+OgKXECsdHR2LpOxwWrK3Ap1gGYNwWvBIqNfaUl6b4cTx66JXRNISqPhmzr6EX2vIsZkGZo+bKWCE+OehVWxBqp8y6JjORsQwOb9YpPNry005LC4S7+Q/VZnY2Vk5WOEOaYQKMzWiCFR/hilTP/JD7zTzURwAXv/oen6ZmBEg+Dh0E4a0JRA/18GUMF4fpK6BNDTT+oh+T+9MRlGJZNBY0jkZKK03656EI4Zf1m/wqrOiTiVvzaNVlQ7uwkvuGaHZgEixnJ868oQbiErCTJ10hCGtnSdlHzh5/qZaOcMYB4qqhp7uqSsngpv+M4A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199015)(6512007)(478600001)(38100700002)(6486002)(36756003)(53546011)(44832011)(6506007)(5660300002)(26005)(316002)(31696002)(66476007)(86362001)(66556008)(8936002)(8676002)(41300700001)(66946007)(31686004)(83380400001)(186003)(2906002)(66574015)(2616005)(45980500001)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fm9f3MSk2hSAJrOTWya3in1vmJ9GJPfrkAQ7Srz895/HKjZutI4oq1vuuCsx?=
 =?us-ascii?Q?SldrCgQ7R+wx1CSLEI0avuv5jfeX6AhWNUj3ORcsrIl/n9MvBVyUAgoGHXDc?=
 =?us-ascii?Q?iZaSxWdQxIs8fvjfttkVsT/20zf6LdLk3bpC4IrA/26Obz7XhezmGVUSr0Qa?=
 =?us-ascii?Q?nTTNx+fs8U4rjEngrqoMgR1CAbKQNAYUkKdJepG/BaXZqZn27OZcBkcA+qpD?=
 =?us-ascii?Q?77yYqkL0hhC7yarmy2SsQJrykJnWXrjERI9oh3O/2DaOCcH08WSTE9HyYWqB?=
 =?us-ascii?Q?kfcSNZPp2RZpjjdnvroRe9P0t2zhKzIabXN8gN06p900YzgPdLJgOGLOPM/s?=
 =?us-ascii?Q?n3ijD3q1zo1wIr/TqFuBaiJOXyY/4WZNQfl0yIOMF90As8tjgL1+bfvfoU67?=
 =?us-ascii?Q?+/2WAtfFpL37rln1TFS6cWFiyXHzfJKzvKDoENfPS2NsQ3/otMVbKWKX8Hmt?=
 =?us-ascii?Q?Lx6vId++0CtmzBSDlMJPO+eUCQFWVEOu55gR34qCLFp1hDzeV73QrSf7O/n3?=
 =?us-ascii?Q?ME1U5uNVYw7/8cmWrbqVwPIvNbPjx42NsJspiIlE+lLoEbSx50DfK07zBVma?=
 =?us-ascii?Q?DOVrYUegX4f5oyamJ0jazNQ4BoA0ep1+fxgmYiAyXQQdwb8JE4itgcaL7S5r?=
 =?us-ascii?Q?aclQZavxJzw9uPxW4fCHMfjFZRUUbgSksTXj39WfSEtMCSiFpuJZKRwJL6Q+?=
 =?us-ascii?Q?Wg2Jhs8OBPoVthOenAkpNlpH/D/7KgX3stHVHa5HEFrvYLMYIt9E9tCfq5q3?=
 =?us-ascii?Q?IBXhjZjeHxALS1Qz0mXfHDSYkC738Ns0SV+rEslKrsvcsYJhRUDnrAYoQJwz?=
 =?us-ascii?Q?0HE8ayeMTZ7Nr1TB8tgzDqjiGsEEHzifW7ouNCwUeF1rQGElfBP/wHwexM6L?=
 =?us-ascii?Q?C6DZ5fJHU9zjfulnxVRCSthxeDdeJx9bTd6ED4IlXz7SfoIEFoVjF0Yz9sDB?=
 =?us-ascii?Q?YRQvnv/1VcimWNKwHQu6t70gBi3fhLuLF3H76XvFgXjycfv9ICe3CVhrQR90?=
 =?us-ascii?Q?2sxT6PpUk0KaUREkrEFjxhhg0Y5h/HQqgqEQzIYkoU4FlKjxs18OGB1r85Vs?=
 =?us-ascii?Q?YB7bk4Nr/SvlHH35t0JPIDwUc1f82g2qJqM23z9M9n3LJlebxu4e4zMn4Nc+?=
 =?us-ascii?Q?hNJQImUOiRL2NioSLAjMB6BanosW5mFOv96G7BKPO0XnQaShrOh+pE3ttMnx?=
 =?us-ascii?Q?IRdteX3zG98jeRn/hRnY7WpHO6V7UqVvb8iUWEeorhvh7P/CXmf1AhsDsYhc?=
 =?us-ascii?Q?6k0c8Baw1m9LQ9P3GC1IVerQdVkrZFH6NnhWCbaBEGDpmNS+aWyuh6aFuYVe?=
 =?us-ascii?Q?4X19rw/EXeygc/zACkluqhoazLJZ6j0L8cxqjWNDUD4rdagvC77PenCYLHB4?=
 =?us-ascii?Q?TtLZli2Q1CWviorNJLDwOuOt5GmCabXETpmCdBHaZDsPMYiUkj7PzxdIVGZg?=
 =?us-ascii?Q?yEdq5nWc37CmzaPgLEH/dxtO2qOLfDggzKBMoiUO8WkXcOCKcl34Zn/+Weef?=
 =?us-ascii?Q?ebmovehjr6hfVqjP2dNsNj4UbFrQJ9uM0cj+Wf+8LBJ9GarcDxLk+EM8tE6c?=
 =?us-ascii?Q?crj6wsFrtcmq6auKlY/y1Dj43sn1k4/rLk8vRuYrPRFVXv18nDz6Fyd21S/d?=
 =?us-ascii?Q?unzf0x9ZArSre6mn7YNd6fA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7443bd34-3752-4d73-1ffa-08dac0a4f160
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:46:28.6092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5WVpCfonl0Srq35q7yacSdvTPPA52pqO+d2WXj7+uy5AK31YzRhllHfCqmu5la/EEd1fC5bxLwtpmRzTp/aMM3OHNJsxCFj23FfON9qm0EiUB1UYu3TfBG2AI9BQyme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 09:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172828

Hi Benjamin,

On 11/6/22 14:31, Livius wrote:
> From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
>=20
> Add 7-Zip support in conversion types and commands. Default arguments of =
7-Zip are compression level: 9, method: BZip2, extension: zip. All these ar=
e overridable from local.con for any other use case in user side. First goa=
l was to make an alternative zip conversion which can operate faster in mul=
ti-thread systems (on many CPU core), normal zip is just a single thread co=
mpression. 7-Zip can do a zip compression in multi-thread processing, so it=
 is fine to use and speed up it.

Your signed-off-by is missing here, it is usually added when you run
git commit --signoff
git commit -s

You can add your signature to your patch locally with
git commit --signoff --amend --no-edit

> ---
>   meta/classes-recipe/image_types.bbclass | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index 764e6a5574..f70c71b9d4 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?=3D "crc32"
>  =20
>   ZIP_COMPRESSION_LEVEL ?=3D "-9"
>  =20
> +7ZIP_COMPRESSION_LEVEL ?=3D "9"
> +7ZIP_COMPRESSION_METHOD ?=3D "BZip2"
> +7ZIP_EXTENSION ?=3D "zip"

Wouldn't this conflict with the output of the zip compression?=20
Basically, if I have 7zip and zip for an archive, they will overwrite=20
each other un-deterministically. Maybe the default .7z extension is better?

> +
>   ZSTD_COMPRESSION_LEVEL ?=3D "-3"
>  =20
>   JFFS2_SUM_EXTRA_ARGS ?=3D ""
> @@ -304,7 +308,7 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
>   # CONVERSION_CMD/DEPENDS.
>   COMPRESSIONTYPES ?=3D ""
>  =20
> -CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum s=
ha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 =
base64 gzsync zsync ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1=
sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi q=
cow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
>   CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type}"
>   CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAG=
E_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>   CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type}"
> @@ -312,6 +316,7 @@ CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_L=
EVEL} ${XZ_DEFAULTS} --check=3D
>   CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>   CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${typ=
e}"
>   CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMA=
GE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D${7=
ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EX=
TENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>   CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${I=
MAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.=
${type}.zst"
>   CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${=
type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_AR=
GS}"
>   CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${t=
ype} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> @@ -337,6 +342,7 @@ CONVERSION_DEPENDS_xz =3D "xz-native"
>   CONVERSION_DEPENDS_lz4 =3D "lz4-native"
>   CONVERSION_DEPENDS_lzo =3D "lzop-native"
>   CONVERSION_DEPENDS_zip =3D "zip-native"
> +CONVERSION_DEPENDS_7zip =3D "p7zip-native"

This tool is in meta-openembedded/meta-oe and not openembedded-core,=20
should we actually move the recipe into oe-core?

Cheers,
Quentin

