Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE5AC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 07:18:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web11.66547.1723533503262558089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 00:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=g+xXOW7N;
 spf=pass (domain: siemens.com, ip: 40.107.22.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9BbV+n7Z0d5RHzFUycB5trTyn2Cdx5VnLgXf/1e94LjqWMnGu6+4kDe3LWXW9uP0iPNmxZdwwvGxgkcFHfiHT8+1Blr2eu9GlAMuLNFFRN81pW3qzfiPuGfTWIVL3FYQ2GzKWHFxa5bD6FfsiriXk6PA83xY+Zmeka94nsGIVoQLFKFDwnsjhf9/4ENoNp0xiE3KxYUWcMKJxmX9TqnrYbHVlwr+SEL4f3vyfKmKuDBf1plpqtsGMJ+cwoQ9/D0L2pvXEeA7RcG2GkgvSZzEzkCJfjVkoAnAZV0Ebf7WKjxFI1g30XYhRqT7EH96Mromtr4U/n2Z/O2lDY+x+ZLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6gM4WafvND8R7yNw/25X7jWGc5hDOoBx/oV0HtqKTc=;
 b=pGJ6Pf4jjM0/dOpSTI5SD3WbFavqrXne7Vz0y4PzDTZA+62kmB4GNuYf9a7Yl2P+KTjsk3vNUv/ZUs6u64qUf5q0IfIImxjKSXxQUQNmRqd9oNDJxeVIkF7HacJZnJn31bJv8Mqkb06PFH8YnI4cwTmpoBuVPtMN45rU0cqaFL/MJDF7G7Ue8kFndXBy6omXU5SxBJ4OcaAdlXyjj5jZ5ls5knZf40R9RlFd1W6LxfMm2gglD2RnnJSzoFlLq86oqoEcV3gJXM3ypVG/de4kPEQ1RMcw5Z6I5Mntqz/LQmDIoiOWC8sFYyhsdM/pb6IlA3nMi8Sp7CUZKNq4Umv4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6gM4WafvND8R7yNw/25X7jWGc5hDOoBx/oV0HtqKTc=;
 b=g+xXOW7NS6EUaNuyJ3cEBcqzSts6zUJBVY1HszePg1Qchr8bpn9cO17kvFNRLBZQBDX2J3yNkgP0LyLe1bAfLPySBCpbVA2EQQC1HcMUd5AHnDCI4ABJn9zNSMsWdlYQgeosVqeMWQCUwWjQj2Omfrw5yub+2c1xWQn06uxLpzsA5ONLjCNTt4O3JtPU3KxR0+FA/cJz9n9tLQY9Eb94IyRoY7JIXzI9rOE0t3Ie6qr/KQzIbAjObT0gglMOCnv2SB+N2BSdZekJUmOxmX1ZN5HCT9PDgknJNqahxKj1WvsHcQ2jQLDrvpzmhxUYtCXrWbW5LLWeSvOq7UT2lzAR8A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3565.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 07:18:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 07:18:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "t.fuchs@thofu.net" <t.fuchs@thofu.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
Thread-Topic: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
Thread-Index: AQHa7U9rXLhVnd+hLkGZ6MZpgrukXLIkxXvg
Date: Tue, 13 Aug 2024 07:18:19 +0000
Message-ID: 
 <AS1PR10MB56970036782491D36CEA58AFFD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240813070642.6275-1-t.fuchs@thofu.net>
In-Reply-To: <20240813070642.6275-1-t.fuchs@thofu.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b9058284-d7e6-484e-aa6b-221d4325396a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-13T07:11:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3565:EE_
x-ms-office365-filtering-correlation-id: 524bdc46-1a86-4302-e9e6-08dcbb681ba4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ryJCNH3DPxNZLyPjJs3Zb2wi5ZfIWsBJrmM2RfABmwFhalqllJQO3hxuQBJZ?=
 =?us-ascii?Q?r6vhwsgDOC9oT8rmAsM11hNXjkBSbtrGv4WieuWRyO/cMgvcqYRYl4o1P5+8?=
 =?us-ascii?Q?qXnEk1m1CWD6XJDUpiWfe87KKCd4ZEYkws/BezDzYHxVsCBmpHs66sLcgm7/?=
 =?us-ascii?Q?VsiwwPhq21QivRAtw9+3HBQl/xTX2hDnpgsitoB4lQeas8uyATtE4hc2wZiC?=
 =?us-ascii?Q?PjnFQuryY4bs95RLn4BhRJdWaerW0NwmPAjrvBg6Z6Wb6PmfN///MPYgGM3/?=
 =?us-ascii?Q?eO+BCl4Z5+IZGGbBC+8SGQBZooSX+ff7gwxnP+2+Qa8qljd1urWuPGiuJgH+?=
 =?us-ascii?Q?HhNyOgrB+aw0/j1iEwcWh+lRBR/uGeBn/g6zSDkvkX2m8t25ei7kM0i0iwDZ?=
 =?us-ascii?Q?Ukh0GFPVw+MrzlI6Sf04QAkx5j+RiHRew5eMfaTlcqDffBC+bmqNIeaRDhcq?=
 =?us-ascii?Q?7Sclp7ELqWLrC8rDmmtWzvrZwKeuCZm96SpWZrbBCvFH+68/21fROFENIypN?=
 =?us-ascii?Q?QbyTq6D7b7tScNRPGOWJh2FWX7+SKIT8JSS0ZgXw1Tv/3nqHz3XR7rUAkl40?=
 =?us-ascii?Q?c1aiDkW+lxpNtJENakX0S3RF4VHSA353J4UGSO1Fj6ogWXTZMWZ3y7n1BxbF?=
 =?us-ascii?Q?7Pry3iK5/HXsFU4NhKCs1LqFKGPDZfu2QsVqqJUQcrlcMRpakWMwYGUdSNvP?=
 =?us-ascii?Q?+PUm40Bjv8Y8AUx13a4gQjXlojn+ySKoORb0YV19uQ2AIGEN3a+8lvTf5HEs?=
 =?us-ascii?Q?cYGus7jfHcceImHZcGEHzfh4p6pFBsAq6rhSuTXEd7Gwz0HZWo1LFV649zpP?=
 =?us-ascii?Q?6WHhgq3P9KofWZjWDgzvN1cZn8SHHx4HrvmnJA3QrmEd5jdfEanF7EHGwWg4?=
 =?us-ascii?Q?jOIfVzJYhtXbh1L7hW+fKsq6QaZcIGmoDYcZth0Ch3XBjsiYlmiGPSXLVozu?=
 =?us-ascii?Q?KVdNFXaF6v4d0WXsffxRVVjd++5XAKdkjRtqq7NfyyKsCHunUl+3sMOfyVWc?=
 =?us-ascii?Q?DbSts0NX9JkgmzLQjNdlRACVW3jyBC41vqbMhTiIU9N8Xod8fNocTJ3SwGRp?=
 =?us-ascii?Q?DsELJnEZoVmV9oY+rRRx0DXFxk/6Y+2+LAqgbtrOkiuiGI8gXCILmMId0dvW?=
 =?us-ascii?Q?ey3ftIoR0WeKduvLL4VEuuHimQrUfDXiPwe2hee4Lh3K8/u8k1wDvHDiV8WG?=
 =?us-ascii?Q?Qwk6q1dg81ZP9VnmRyLQUgZaeyWlntrz6mt5Cd74qDEe7w9Jzn4Z/tA2NIzN?=
 =?us-ascii?Q?3xYWO2s3/cgbk09sIyjK/UNJsriVMH5VkrblHRxxA1ceDZzzurgabF+CFvJX?=
 =?us-ascii?Q?mJgYw3VfZ2wr0UW4ojWOzO5SNoaSE9YVmTUXzIO2iI+4wLA273tviLycbpEX?=
 =?us-ascii?Q?LRMBVSc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?04ZDMnOvNHCJxzt9TYri3xhJ/vrVs5h16fx06aSOJ1zVtgISINlOvjE4JXc8?=
 =?us-ascii?Q?sCPBPKaKE8ePQ25hPzmmsy3VUEEL9VzueY7jmAplC5EYfd9cY+NHU7pQeE3N?=
 =?us-ascii?Q?fe1nWFvxEz5OOzJ15UqSfrFAuuiMx+NVWre64dP2oyKH+ICZ48w9dq9cO2hN?=
 =?us-ascii?Q?oi/Ugn3muA9extCieOxHWNnhoh7frYeIYzX/Bx0YR3A93SRF0Sc+oNvyEMJ2?=
 =?us-ascii?Q?TFZ02HjWv//9Sf0aaEcVOlMcKvFZBN9Fw+iMBqY/CbOYpmYmjhSNlqLFoAD+?=
 =?us-ascii?Q?xaprvG9HdOi5ng1CtlwL1NsP5h+aqdVBL+hxPHfepWuzQmyZSrRqiCi9/t6B?=
 =?us-ascii?Q?yXLUUDP4PLNz3WRXKe5YBYAa73P6aeYqBZCg7g8t3IXMLKrx32mQakm5Xwhr?=
 =?us-ascii?Q?0AFxj2B2d9UvOGfVYcLfQmuDYtluPJb4/T1VIHtO5fgoTptIzYgi4a3aUadX?=
 =?us-ascii?Q?+ea4ScGQWCt3RKK21gtOijlSy3pViNGMt0wLdUQNQWk4G77tEO++oaIupjhX?=
 =?us-ascii?Q?1XC0820VZyR+pXQAIBGjbzj2fB3nDKAlv1zv1N6ff2dQ0HPy1dOJnu7INA6w?=
 =?us-ascii?Q?eH+gUSECiXKdojYfL5NiTTJHaqK4gBC9A71oTF+11ocfXPN0J8QvdlYuQU6R?=
 =?us-ascii?Q?M7Z4oVLnyo4k/20vaQ1c5TDwz1cCLKOPTKwRnMqG7PjCUkzAVbZcbai3K/H0?=
 =?us-ascii?Q?SjtabaqLtF4lZTKRKbyGsiWJzKF4jJIdZyV3/NFhJfDAkKeAd7RiknWwd/Ea?=
 =?us-ascii?Q?zjnc4LhyrneJ0W/9/+MyoHp8/MLUVjwCBsJglXNUpPfv3gtL4ayGs1uv9Wns?=
 =?us-ascii?Q?T0piDUY5OO0yJuC5DLAtrlwg3AuRWeV47eiITvUWk/2zefEF5tInCa4zcH2i?=
 =?us-ascii?Q?pOiv+NzaTL5+9VyWIP+rGxwQjcOe7ahzv/VFciNrPX+orXy8LMr9Cc5xZsF+?=
 =?us-ascii?Q?dzi84VUueNnoGVvEWAEhHeCUl907IhYYF52M9SR7DqUgzzjhaEt2l9EwvTjQ?=
 =?us-ascii?Q?e936/yW5us5te7MXZEfE59xLEsJvng8GvvzPkhsUwbRMlrWWbHaLJnGWUv3v?=
 =?us-ascii?Q?yxarWgLDHS+PX7CsUCWIWIaPE4ggQ5zVI4xeXOvNpwMUVgDe2l9X1/RdaZbj?=
 =?us-ascii?Q?KiJSnz1uQN9l7VckrviYeAVMN/DJjV8admJoVmoJUES0/Xa5bDof1+JKxw3p?=
 =?us-ascii?Q?YzAfeSp5DYTiX9JoEMsm/NzNH+44CKLDex62x43cL1zywisbAe/N0xvXYop5?=
 =?us-ascii?Q?FO5t20/svLh8oPmz7bis//GtVjfJl5tJDvxfLUdX1a8mAj+XUwPnciirEbfW?=
 =?us-ascii?Q?QLOhIoSCDhb7yT6h/nhIBHMbEL3Q9+/JB6qGPYi/TbaESXlL+SAF0dXXjRjA?=
 =?us-ascii?Q?65y324pyO8Pize9D8hgLcgGT+dJDOmYOi7ZyrxPb3GXCGP2fOj386o5XGWPK?=
 =?us-ascii?Q?CBvRa0cu+Md5bWmPORrggZCq/DL3hARWEQdiyFNopmsNEowHhh5BDL1AsbmV?=
 =?us-ascii?Q?TaW7VxWJV8trTOUfIGNb+aajavIyIs/Yy/tFnPh1mTRmKpX/iUtDyO4W0jYw?=
 =?us-ascii?Q?1Py4As8FNcuGBKF7QKJSjS2j42QaiuLcRMG0cp2T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 524bdc46-1a86-4302-e9e6-08dcbb681ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 07:18:19.3982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cnvk4iZRvYsyUq4JJiUPXgKn/CmSsg/prJqebkVyaznB7Qej4ONGxwf7xse+sJkisFMxcuma0Eytc0UUTJazg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 07:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203256

Hello again,

This should have been [PATCH v2] (and next one should be [PATCH v3].
Also see below for one more finding.

Cheers,
  Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Thorsten Fuchs via
> lists.openembedded.org
> Sent: Tuesday, August 13, 2024 9:07
> To: openembedded-core@lists.openembedded.org
> Cc: Thorsten Fuchs <t.fuchs@thofu.net>
> Subject: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
>=20
> Include a patch to rename LIBDIR variable in Makefiles.
>=20
> Signed-off-by: Thorsten Fuchs <t.fuchs@thofu.net>
> ---
>  ...1-Fix-Makefile-variable-name-overlap.patch | 213 ++++++++++++++++++
>  .../lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb}       |  24 +-
>  2 files changed, 225 insertions(+), 12 deletions(-)
>  create mode 100644 meta/recipes-support/lz4/files/0001-Fix-Makefile-
> variable-name-overlap.patch
>  rename meta/recipes-support/lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb} (62%)
>=20
> diff --git a/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-na=
me-
> overlap.patch b/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable=
-
> name-overlap.patch
> new file mode 100644
> index 0000000000..07b52e2226
> --- /dev/null
> +++ b/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-name-
> overlap.patch
> @@ -0,0 +1,213 @@
> +From ec631bc59a5ae9a38b688e999a9044fef9211d98 Mon Sep 17
> 00:00:00 2001
> +From: Thorsten Fuchs <t.fuchs@thofu.net>
> +Date: Mon, 12 Aug 2024 12:20:21 +0000
> +Subject: [PATCH] Fix Makefile variable name overlap.
> +
> +Upstream renamed LZ4DIR to LIBDIR inside Makefiles which collides with
> +the OpenEmbedded builds.
> +
> +Signed-off-by: Thorsten Fuchs <t.fuchs@thofu.net>
> +
> +Upstream-Status: Inappropriate [oe specific]
> +---
> + examples/Makefile | 10 +++++-----
> + programs/Makefile | 16 ++++++++--------
> + tests/Makefile    | 28 ++++++++++++++--------------
> + 3 files changed, 27 insertions(+), 27 deletions(-)
> +
> +diff --git a/examples/Makefile b/examples/Makefile
> +index 91a4f484..26fdf6d7 100644
> +--- a/examples/Makefile
> ++++ b/examples/Makefile
> +@@ -27,22 +27,22 @@
> + # kindly provided by Takayuki Matsuoka
> + #
> ###################################################################
> #######
> +
> +-LIBDIR    :=3D ../lib
> ++LZ4DIR    :=3D ../lib
> +
> +-CPPFLAGS  +=3D -I$(LIBDIR)
> ++CPPFLAGS  +=3D -I$(LZ4DIR)
> + USERCFLAGS:=3D $(CFLAGS)
> + WFLAGS     =3D -std=3Dgnu99 -Wall -Wextra -Wundef -Wshadow -Wcast-align=
 -
> Wstrict-prototypes -Wc++-compat
> + CFLAGS     =3D $(WFLAGS) -O2 $(USERCFLAGS)
> +
> + TESTFILE   =3D Makefile
> +-SLIBLZ4   :=3D $(LIBDIR)/liblz4.a
> ++SLIBLZ4   :=3D $(LZ4DIR)/liblz4.a
> + LZ4DIR     =3D ../programs
> + LZ4        =3D $(LZ4DIR)/lz4
> +
> + default: all
> +
> +-$(SLIBLZ4): $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c
> $(LIBDIR)/lz4.h $(LIBDIR)/lz4hc.h $(LIBDIR)/lz4frame.h
> $(LIBDIR)/lz4frame_static.h
> +-	$(MAKE) -j -C $(LIBDIR) liblz4.a
> ++$(SLIBLZ4): $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c
> $(LZ4DIR)/lz4.h $(LZ4DIR)/lz4hc.h $(LZ4DIR)/lz4frame.h
> $(LZ4DIR)/lz4frame_static.h
> ++	$(MAKE) -j -C $(LZ4DIR) liblz4.a
> +
> + ALL =3D print_version \
> + 	  simple_buffer \
> +diff --git a/programs/Makefile b/programs/Makefile
> +index 643ce14f..d9975b26 100644
> +--- a/programs/Makefile
> ++++ b/programs/Makefile
> +@@ -31,8 +31,8 @@
> + SED ?=3D sed
> +
> + # Version numbers
> +-LIBDIR   :=3D ../lib
> +-LIBVER_SRC :=3D $(LIBDIR)/lz4.h
> ++LZ4DIR   :=3D ../lib
> ++LIBVER_SRC :=3D $(LZ4DIR)/lz4.h
> + LIBVER_MAJOR_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_MAJOR/s/.*[[:blank:]]\([0-9][0=
-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> + LIBVER_MINOR_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_MINOR/s/.*[[:blank:]]\([0-9][0=
-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> + LIBVER_PATCH_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_RELEASE/s/.*[[:blank:]]\([0-9]=
[0-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> +@@ -42,7 +42,7 @@ LIBVER_MINOR :=3D $(shell echo
> $(LIBVER_MINOR_SCRIPT))
> + LIBVER_PATCH :=3D $(shell echo $(LIBVER_PATCH_SCRIPT))
> + LIBVER   :=3D $(shell echo $(LIBVER_SCRIPT))
> +
> +-LIBFILES  =3D $(wildcard $(LIBDIR)/*.c)
> ++LIBFILES  =3D $(wildcard $(LZ4DIR)/*.c)
> + SRCFILES  =3D $(sort $(LIBFILES) $(wildcard *.c))
> + OBJFILES  =3D $(SRCFILES:.c=3D.o)
> +
> +@@ -51,7 +51,7 @@ DEBUGFLAGS=3D -Wall -Wextra -Wundef -Wcast-qual -
> Wcast-align -Wshadow \
> +             -Wpointer-arith -Wstrict-aliasing=3D1
> + USERCFLAGS:=3D -O3 $(CFLAGS) # -O3 can be overruled by user-provided -O=
x
> level
> + CFLAGS    =3D $(DEBUGFLAGS) $(USERCFLAGS)
> +-CPPFLAGS +=3D -I$(LIBDIR) -DXXH_NAMESPACE=3DLZ4_
> ++CPPFLAGS +=3D -I$(LZ4DIR) -DXXH_NAMESPACE=3DLZ4_
> +
> + include ../Makefile.inc
> +
> +@@ -132,8 +132,8 @@ lz4-nomt: $(SRCFILES)
> +
> + CLEAN +=3D lz4-wlib
> + lz4-wlib: LIBFILES =3D
> +-lz4-wlib: SRCFILES+=3D $(LIBDIR)/xxhash.c  # benchmark unit needs XXH64=
()
> +-lz4-wlib: LDFLAGS +=3D -L $(LIBDIR)
> ++lz4-wlib: SRCFILES+=3D $(LZ4DIR)/xxhash.c  # benchmark unit needs XXH64=
()
> ++lz4-wlib: LDFLAGS +=3D -L $(LZ4DIR)
> + lz4-wlib: LDLIBS   =3D -llz4
> + lz4-wlib: liblz4 $(OBJFILES)
> + 	@echo WARNING: $@ must link to an extended variant of the
> dynamic library which also exposes unstable symbols
> +@@ -141,7 +141,7 @@ lz4-wlib: liblz4 $(OBJFILES)
> +
> + .PHONY:liblz4
> + liblz4:
> +-	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -
> DLZ4_PUBLISH_STATIC_FUNCTIONS" $(MAKE) -C $(LIBDIR) liblz4
> ++	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -
> DLZ4_PUBLISH_STATIC_FUNCTIONS" $(MAKE) -C $(LZ4DIR) liblz4
> +
> + CLEAN +=3D lz4c
> + lz4c: lz4
> +@@ -179,7 +179,7 @@ clean:
> + ifeq ($(WINBASED),yes)
> + 	$(RM) *.rc
> + endif
> +-	$(MAKE) -C $(LIBDIR) $@ > $(VOID)
> ++	$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
> + 	$(RM) $(CLEAN) *.o tmp* *.test core
> + 	@echo Cleaning completed
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 47e2774d..7adfdfcc 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -28,7 +28,7 @@
> + # datagen : generates synthetic data samples for tests & benchmarks
> + #
> ###################################################################
> #######
> +
> +-LIBDIR  :=3D ../lib
> ++LZ4DIR  :=3D ../lib
> + PRGDIR  :=3D ../programs
> + TESTDIR :=3D versionsTest
> + PYTHON  ?=3D python3
> +@@ -40,7 +40,7 @@ WFLAGS    =3D -Wall -Wextra -Wundef -Wcast-qual -
> Wcast-align -Wshadow \
> +             -Wswitch-enum -Wdeclaration-after-statement -Wstrict-protot=
ypes \
> +             -Wpointer-arith -Wstrict-aliasing=3D1
> + CFLAGS    =3D $(WFLAGS) $(DEBUGFLAGS) $(USERCFLAGS)
> +-CPPFLAGS +=3D -I$(LIBDIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
> ++CPPFLAGS +=3D -I$(LZ4DIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
> + ALLFLAGS  =3D $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
> +
> + include ../Makefile.inc
> +@@ -69,7 +69,7 @@ lz4:
> +
> + .PHONY: lib liblz4.pc
> + lib liblz4.pc:
> +-	$(MAKE) -C $(LIBDIR) $@ CFLAGS=3D"$(CFLAGS)"
> ++	$(MAKE) -C $(LZ4DIR) $@ CFLAGS=3D"$(CFLAGS)"
> +
> + lz4c unlz4 lz4cat: lz4
> + 	$(LN_SF) $(LZ4) $(PRGDIR)/$@
> +@@ -79,7 +79,7 @@ lz4c32:  # create a 32-bits version for 32/64 interop
> tests
> + 	$(MAKE) -C $(PRGDIR) $@ CFLAGS=3D"-m32 $(CFLAGS)"
> +
> + # *.o objects are from library
> +-%.o : $(LIBDIR)/%.c $(LIBDIR)/%.h
> ++%.o : $(LZ4DIR)/%.c $(LZ4DIR)/%.h
> + 	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
> +
> + CLEAN +=3D fullbench
> +@@ -88,14 +88,14 @@ fullbench : CPPFLAGS +=3D -DNDEBUG
> + fullbench : lz4.o lz4hc.o lz4frame.o xxhash.o fullbench.c
> + 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
> +
> +-.PHONY: $(LIBDIR)/liblz4.a
> +-$(LIBDIR)/liblz4.a:
> +-	$(MAKE) -C $(LIBDIR) liblz4.a
> ++.PHONY: $(LZ4DIR)/liblz4.a
> ++$(LZ4DIR)/liblz4.a:
> ++	$(MAKE) -C $(LZ4DIR) liblz4.a
> +
> + CLEAN +=3D fullbench-lib
> + fullbench-lib : DEBUGLEVEL=3D0
> + fullbench-lib : CPPFLAGS +=3D -DNDEBUG
> +-fullbench-lib: fullbench.c $(LIBDIR)/liblz4.a
> ++fullbench-lib: fullbench.c $(LZ4DIR)/liblz4.a
> + 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
> +
> + # Note: Windows only
> +@@ -103,9 +103,9 @@ ifeq ($(WINBASED),yes)
> + CLEAN +=3D fullbench-dll
> + fullbench-dll : DEBUGLEVEL=3D0
> + fullbench-dll : CPPFLAGS +=3D -DNDEBUG
> +-fullbench-dll: fullbench.c $(LIBDIR)/xxhash.c
> +-	$(MAKE) -C $(LIBDIR) liblz4
> +-	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1
> $(LIBDIR)/dll/$(LIBLZ4).dll
> ++fullbench-dll: fullbench.c $(LZ4DIR)/xxhash.c
> ++	$(MAKE) -C $(LZ4DIR) liblz4
> ++	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1
> $(LZ4DIR)/dll/$(LIBLZ4).dll
> + endif
> +
> + # test LZ4_USER_MEMORY_FUNCTIONS
> +@@ -143,7 +143,7 @@ decompress-partial-usingDict: lz4.o decompress-
> partial-usingDict.c
> +
> + .PHONY: clean
> + clean:
> +-	@$(MAKE) -C $(LIBDIR) $@ > $(VOID)
> ++	@$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
> + 	@$(MAKE) -C $(PRGDIR) $@ > $(VOID)
> + 	@$(RM) $(CLEAN) core *.o *.test tmp*
> + 	@$(RM) -r $(TESTDIR)
> +@@ -166,7 +166,7 @@ abiTests:
> + 	$(PYTHON) test-lz4-abi.py
> +
> + CLEAN +=3D checkTag
> +-checkTag: checkTag.c $(LIBDIR)/lz4.h
> ++checkTag: checkTag.c $(LZ4DIR)/lz4.h
> + 	$(CC) $(ALLFLAGS) $< -o $@$(EXT)
> +
> + #----------------------------------------------------------------------=
-------
> +@@ -204,7 +204,7 @@ test32: test
> + test-amalgamation: lz4_all.o
> +
> + CLEAN +=3D lz4_all.c
> +-lz4_all.c: $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c
> ++lz4_all.c: $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c
> + 	$(CAT) $^ > $@
> +
> + test-install: lz4 lib liblz4.pc
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-
> support/lz4/lz4_1.10.0.bb
> similarity index 62%
> rename from meta/recipes-support/lz4/lz4_1.9.4.bb
> rename to meta/recipes-support/lz4/lz4_1.10.0.bb
> index 51a854d44a..f263d80f16 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.4.bb
> +++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
> @@ -2,19 +2,20 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
>  DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding
> compression speed at 400 MB/s per core, scalable with multi-cores CPU. It
> also features an extremely fast decoder, with speed in multiple GB/s per =
core,
> typically reaching RAM speed limits on multi-core systems."
>  HOMEPAGE =3D "https://github.com/lz4/lz4"
>=20
> -LICENSE =3D "BSD-2-Clause | GPL-2.0-only"
> +LICENSE =3D "BSD-2-Clause | GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://lib/LICENSE;md5=3D5cd5f851b52ec832b10eedb3f01f885a \
> -
> file://programs/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://LICENSE;md5=3Dc5cc3cd6f9274b4d32988096df9c3ec=
3 \
> +
> file://programs/COPYING;md5=3D492daf447d6db0e5eb344a7922e7ec25 \
> +                    file://LICENSE;md5=3Dc111c47e301c2ffe8776729b40b4447=
7 \
>                      "
>=20
>  PE =3D "1"
>=20
> -SRCREV =3D "5ff839680134437dbf4678f3d0c7b371d84f4964"
> +SRCREV =3D "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
>=20
>  SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dht=
tps \
> -	   file://run-ptest \
> -	   "
> +           file://0001-Fix-Makefile-variable-name-overlap.patch \
> +           file://run-ptest \
> +           "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>=20
>  S =3D "${WORKDIR}/git"
> @@ -26,21 +27,20 @@ CVE_STATUS[CVE-2014-4715] =3D "fixed-version: Fixed
> in r118, which is larger than
>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}'
> DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
>=20
>  do_install() {
> -	oe_runmake install
> +        oe_runmake install
>  }
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> -RDEPENDS:${PN}-ptest +=3D "bash"
> +RDEPENDS_${PN}-ptest +=3D "bash"

Sorry for missing this in my first email.
I guess it's easy to miss things with many whitespace changes in this patch=
.

Reverting to old override syntax is wrong, this RDEPENDS line should be kep=
t unchanged.

>=20
>  do_compile_ptest() {
>          oe_runmake -C ${B}/tests/
>  }
>=20
>  do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests/
> -	install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
> -	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g"
> ${D}${PTEST_PATH}/run-ptest
> -
> +        install -d ${D}${PTEST_PATH}/tests/
> +        install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/test=
s/
> +        sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-
> ptest
>  }
>=20
> --
> 2.34.1


