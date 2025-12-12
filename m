Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2415D4415F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:09:33 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9720.1765534167267026672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AXQ8m2Dq;
 spf=pass (domain: axis.com, ip: 40.107.130.20, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVPZ1OERJMHMNbpYnr6RMulSPoMqc1bbhO643VDSQK1doIE2yne12TpZAsapl6b6eQBU4y3zj4osUK4zR3+sYQ34ILOHtqurfwCPH9x2uLOWJ+KrQqD35GyzQRgmllXlSOgtHQPXS164pQL83CpSc7RkEGm6mt9+/EuS21byFAStUBKEAmVXirEzVPfCFoMQ+DolEN60m3VxS4xZwKv9OBeekO/r1Zrl1+zNoIOaCkIbEWjutsmF8HUjE9oOj8m2sl5bvWYE3w4bwGGY0SfUAQ4pMCJP1NdDmStH5WWc5ARz8DwzOhaXdEI+1WG6zPy5xPDT5vsFBzHQHVktjB52SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p89rf8GAoQ6fjRQbGV6I1VDo21I0gFr57OHwaMIdGfY=;
 b=V6wgbxWQJ17uF/AqVx5fvhFHgB6wtcc6msRg+tI4qpRWND7KPyalJiDTtsR5E6haYQNLnQG6IYp727XiGEohxH5ziGDF21oiYUtzxQzcily1G8YrV0jKZ1Hf81oq2AEjVObUgk1g+UlAue9FiHAlYwaoa2DgvEnDEddywjjUmbYg9Z+qoyvFiNWpIXTz4bF5OP5s2XGKA83Jfq/eay9VEFX5kbkOimNWJJgq1dLfzI42OywLflC3FYLxrEBFs+3ED25HZcyymxQrvqLMk3tZIBl4O2RiZLqChk8TGwyxjIOju7hTdFkUcTLp7Ih+tLUoaiEV74jJq7B5cjAApmzh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p89rf8GAoQ6fjRQbGV6I1VDo21I0gFr57OHwaMIdGfY=;
 b=AXQ8m2DqtnO/Y3lu97wCujjTTNMtBCSnhcPUgLVOTFsqsVJ8WsMCgLWiw8nwulbmtyeq5X2GJ9lHSau7Z5LvwTbO9yEkH/tZ1wCstv5kgv4emFr+3xs8eXqu3sEDDQVzoHD/FNZIQe9YQzjyrCFn4NYwEVen4+g3fHn9gJCFuE0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10818.eurprd02.prod.outlook.com (2603:10a6:10:523::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 10:09:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:09:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "m.schwan@phytec.de" <m.schwan@phytec.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 3/5] cargo-update-recipe-crates: Consistently
 use single quotes in Python
Thread-Topic: [OE-core] [PATCH v2 3/5] cargo-update-recipe-crates:
 Consistently use single quotes in Python
Thread-Index: AQHca0iObwaG4M29sEOGBd+IxYnZ9bUdxvCA
Date: Fri, 12 Dec 2025 10:09:23 +0000
Message-ID: 
 <DB5PR02MB10213EDE4ED6133357DF91544EFAEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
 <20251212091927.3741063-3-m.schwan@phytec.de>
In-Reply-To: <20251212091927.3741063-3-m.schwan@phytec.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10818:EE_
x-ms-office365-filtering-correlation-id: 5525d4f4-ce88-4f68-5ce1-08de39668657
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?EGdmTkUzdwRiix6Qpfz9+DpL0d1aToqs9ET4xAZF8fdwohlLoYwxed/piLjy?=
 =?us-ascii?Q?ipC9ZxwZd2vY4kVt6vcLglBkexgM+PbOF2edFhQTIBhn2+eGJP5dU3F+46g8?=
 =?us-ascii?Q?ZDRfG9lW+xXFcm2sZRGhb9Y0w8hmrOPfGE81KxCmWLZP2GWCkD+37KOEUI2t?=
 =?us-ascii?Q?TAZi7PH8ZEP0JriMdK7sl/YV5YRBm8G8x6gGKu0dJfC/IZU8dsiZPbLaUBW3?=
 =?us-ascii?Q?9eSIA0UbcBWXEXoB6mVazKTSaY9FL8kssjE41htXNH0EFn08bH0BaiWIo1zG?=
 =?us-ascii?Q?VeBzQDb5cyEgU5E+glDHYgxbrdDrcQvAo4Mhec5x8vlc4RQqPC8+YNvvLxuN?=
 =?us-ascii?Q?Tp9MYnoUkwMfiUgonR5eDec4r/ttIJPVafdJAww8aZ6m6Jwr7Cq5wy7VxCRC?=
 =?us-ascii?Q?vkWCH6zi9lv7l4GjMC3VpTW20NM4LewcIUySj56DunS7QSBDds9clpPQjmiN?=
 =?us-ascii?Q?HvKhCMw1+gzIpQgR6bDtb2+mK1LIWLldd6URjynV0P1bTNag7NjoT3HxguKN?=
 =?us-ascii?Q?tcQwvO07BSen8PK1rbljmfQOH5ckCJVas0ZIfVorSb1RRPDHqvdF70nNUG1z?=
 =?us-ascii?Q?DmV3NGiQMD6u+Ima4GsEIJo3RNOOu1XgJTvSlGvh5GtIwLCEhbods9sAK34t?=
 =?us-ascii?Q?SDL9ytUfU/3eowGGIk38RZp5fjCKHu0n0HLYklk8LKcndaQUTJdZplpdoC/p?=
 =?us-ascii?Q?r9A9UizUmbyhEEgjhpxMWV9APN6dGxv0jP1uuuiI/VpjcSGs7W9MBTQnE62T?=
 =?us-ascii?Q?6+ezRBN8loNvMKbekXxDmQ0WcJoEH7NM6GoJAPVzyHfh5GRY9yRcn/Bm6Vlj?=
 =?us-ascii?Q?rUy2u3ReqBg3hdFuuSyiBU3x55j9xBqbL1sPYAUUa9JI8ltwyvQ2vtFv0VMb?=
 =?us-ascii?Q?YjwZySu+sMjarW1BWj/N4zoEyDgYrLdEkDAXVQ5rhuqQA2vE3cMaR4deBCH7?=
 =?us-ascii?Q?oVQcVGb+qjJPk8X+rRRjHULOXtVbgxr+xzzKUt3XE4LnU2y+VZkzAK4lUPU1?=
 =?us-ascii?Q?2PIUMbgBf/lsHrp+0Q3P0xtA1y+Ol0fahk1gA1QPl+Hf3XvAO+4yS5bsjm6S?=
 =?us-ascii?Q?HwNuCdz1yw/stcLdCpMXpuTl/v3zj91igZtp38ee8JSqdZQ5lfHfKbFoTQtw?=
 =?us-ascii?Q?2NHpBUQ6VPUv6GOwPZ4djW0PuQU1fxCHXUITrq+uHMAxDIw1dsptsc+PG+vM?=
 =?us-ascii?Q?TT918mgNfq7k7kea9F/4L4+la9HjpW2UNCX1VLCWIxLT5qtf6qUe3NxWLoPB?=
 =?us-ascii?Q?y7b9nJywxcmIw+hi5zzCbFUcJycfPDZbZj4PbJr3+XzdMzASqmkF1lEP3/Dt?=
 =?us-ascii?Q?EYB9HDwKGosOvjio4LsiD6czhnzSD396SjF3JAyr3t5c5rkvDHCAqDumJjNk?=
 =?us-ascii?Q?6H9H8I1W36O+YrawNvkXCC26UPnhvKV6jSQl5UNPxZtgn8T1GvhxJDjX9nOn?=
 =?us-ascii?Q?uZ8rXjTLEN+e1w5MOVEej3AxPbPNQQtlyPvl3+wlWs0ZYlg7+WLC0E4Dhwb8?=
 =?us-ascii?Q?bq6MqbwW2LIc1j74EtyxkgiO6kkQ1kApesIR?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DSnG6HYmyPpdqVA9Ww4asqxi4+YyQeNLqCpRVVg/salCJbS8jMScOyE8P0l4?=
 =?us-ascii?Q?x+tqvhNrJDnORmyoyHhD7FbQCqXHWCnvRuwC2TjmyWdDEg6VaZkYSSrx23ZN?=
 =?us-ascii?Q?CKeORCcY4TDm25CBa2yGVLjKOsuGmCCFfbl28Cz7Ohe4+N4eKY52WxfPJ6Kn?=
 =?us-ascii?Q?DyMUYxNsmr4Gz7gtbkbbBIeqMJ57ND7UbN3JjojYoWi4Szovbq/5+XYqTnR6?=
 =?us-ascii?Q?je+ncsGQkswqJleILXZQvmaMSIKuvyN7B39FNzNe1KQpkDuTgyAmXq7XUvaZ?=
 =?us-ascii?Q?tZrkqPikrGpzLGJwxjqamnmAfNAwjA4S+zRTDCYUMZE/VfKuRSbhkrlmMscg?=
 =?us-ascii?Q?nXIsXfntYFLxJ01I1fulSDuiq7bwZlgDnQC9RDK8htznrgUCDX0D160VXgbH?=
 =?us-ascii?Q?f/h7RwyE/Yzbfd1xrPEW7eorm0zgFa6vcl/NKgXvfPHRmS9OltDWd4K20v8L?=
 =?us-ascii?Q?j9iaPWXrxjPQTjKBHVWs4vxZBy6cs9prcQMTgaC+PggxLr7dLnAeYfZZf7q8?=
 =?us-ascii?Q?S4S1xXZ41+l4bFrNJSqgl2r034VoBcfzJaIILnH/nC94WNmYx6Hpk0sB53Yi?=
 =?us-ascii?Q?dSQ7+1vLKzsLyij40l3aVTwJvuQhXCoA5iomypjaoQFVP2eJHD0LsFsKo1rS?=
 =?us-ascii?Q?1PFccTxwi7PrOc20DVXsjKqT11Z2gbmhzU318+7GjCk+Dx74BO12IfMk8W1j?=
 =?us-ascii?Q?7LvGKZhakL2TabAYQ+nMWzuICobekUrehWih9BilFCj8VpKFVw9EcizPDa1/?=
 =?us-ascii?Q?UZpDOETYYOmlR3TFh2HXrnp+B+G5UKWBiEsbx15APvsoZIX7SBrIaEcA/JJg?=
 =?us-ascii?Q?NJLGAQMiSewioQPpZ+cPfN9Hs73AA9qMlL0y1E/NtNh4wLTHIOF26EueXQAV?=
 =?us-ascii?Q?SDd7uy7vqsdBZDoN/jEZ3otPcz7/pcBmLkcamUSYVNkG+M20fcpmeFxpT7Fi?=
 =?us-ascii?Q?CYArq9kmSHp50rKbEB1IAtyH5mpdsZYwnGdKSbmfXI4wqBtK4t+zdHNDr620?=
 =?us-ascii?Q?qdQYrn6EJwWscWx/MKUBFLivp6WNwMqIiO4gmz5nJ5uh0eKeDYzvG/FAwXfO?=
 =?us-ascii?Q?7mCRCKeVCWNg4prky8GkKpKXVjHMqLgWwIzabi1IUL+WpxpnuRSJ56Hd073H?=
 =?us-ascii?Q?6DkTzlKCG+lYb/nb0qLNaks6N7oeiT9FqZ2zjCtL3UoYgz5hY+RksgM5ZOO3?=
 =?us-ascii?Q?aL6H8Qt5d+3QKJ7SqKNtVW3MzRCczU7HyPi3Jb6rl00qAjJlYuW1OcAX2Y8x?=
 =?us-ascii?Q?m5+yiCH6vNl5C9Ilq6u/8DPv8m8L4JMv7K9aqg24QRG7XqHULjPu5u8WIYLu?=
 =?us-ascii?Q?xJg4Bs5twZpVBwRkvydKJP5Gbl8kraQmaJQh9Egyts0MyBhJ1DJPN6oMw0s9?=
 =?us-ascii?Q?EN6OcIdGiI80hS43Hzqa9xl7QHSyFtPqnZ75BoIWn75VZp1JVhDFjCbvOkNH?=
 =?us-ascii?Q?XP4h7okRycNkA7HM8bPWuGS8FU9Hz5HBsDLkCyc+A6hGl0/pT/B35qb3ZmLt?=
 =?us-ascii?Q?m6hrIxhyvkPiae8khIxVQkhdt7LpOyB4jj96t+0JUrky+P/UW+WeOpB5Nw?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5525d4f4-ce88-4f68-5ce1-08de39668657
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 10:09:23.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wq9ecX5iXlN5pnYkKedKxCwKo7bewFj2X4w0WISBS908DtFuye69sXch5NfzXG/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227578

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Martin Schwan via lists.openembedded.org
> Sent: den 12 december 2025 10:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2 3/5] cargo-update-recipe-crates: Consistentl=
y use single quotes in Python
>=20
> For the Python function do_update_crates(), consistently use single
> quotes for Python strings. No functional changes.
>=20
> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> ---
> Changes in v2:
>   - Split changes into multiple patches, for improved readability
> ---
>  meta/classes-recipe/cargo-update-recipe-crates.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/met=
a/classes-recipe/cargo-update-recipe-crates.bbclass
> index d3745392bd..6e82bd4a51 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -45,7 +45,7 @@ python do_update_crates() {
>          # we need to rename crates with name and version to have a uniqu=
e key
>          cksum_list =3D ''
>          for c in crates_candidates:
> -            rename =3D "%s-%s" % (c['name'], c['version'])
> +            rename =3D '%s-%s' % (c['name'], c['version'])
>              c_list +=3D '\n    crate://crates.io/%s/%s \\' % (c['name'],=
 c['version'])
>              if 'checksum' in c:
>                  cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (re=
name, c['checksum'])
> @@ -56,7 +56,7 @@ python do_update_crates() {
>          return c_list
>=20
>      import os
> -    crates =3D d.expand("# Autogenerated with 'bitbake -c update_crates =
${PN}'\n\n")
> +    crates =3D d.expand('# Autogenerated with \'bitbake -c update_crates=
 ${PN}\'\n\n')

IMHO, avoiding unnecessary backslashes is preferable to only using
apostrophes to quote strings. So I would skip this and the one below.

>      found =3D False
>      for root, dirs, files in os.walk(cargo_lock_src_dir):
>          # ignore git and patches directories
> @@ -76,5 +76,5 @@ python do_update_crates() {
>          bb.error(f'Unable to find any Cargo.lock in {cargo_lock_src_dir}=
')
>      open(target_file, 'w').write(crates)
>=20
> -    bb.note(f"Successfully update crates inside '{target_file}'")
> +    bb.note(f'Successfully update crates inside \'{target_file}\'')
>  }
> --
> 2.43.0

//Peter


