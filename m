Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE95CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 09:21:47 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.84])
 by mx.groups.io with SMTP id smtpd.web10.2369.1693560101755515068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 02:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=js37aAf5;
 spf=pass (domain: siemens.com, ip: 40.107.105.84, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1RHEwJJ0qxk1ryEHMMjewyMifqf54Z7YyK7KkqPDbt4mquoK5vPHxnqd+0s8i8xdFgO6TwtqIcVHUPQ6+N16H5MQ68Dfx7smH/5/Zqj9ZOALXo5Jgo08v5HejMsrsqR8NiD8bqRobytFEMhrlgyjEa2YPsbpfvCWE3QOrRFN2a5KD8BNTHb9LOKdmGuZyW0vDQqnNU43RnEkJKNa1YwkGit1E0hVIEUkindrISYvHuajJYaIjzLNvfs8P6YWCiODjwOYH93GwmpO4LsKO8z7IZbe+gVbINpiisHUV5u5yDylDcvpsZQDoKekskhiEibBg5AEwq1EpYu81Qu8+2wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuiNhV3Xy1baMyG+3VVw/WDbFU91hv1YLEk/AucAL5M=;
 b=WPjhtShTlcOsJL/SGyPXch2FLoD3TQvAGn9t0s+Q7ZUquzu5uJ+5t0+2w1wmb6LYbHKeax0urAQ+dDrRFXKQaL9s/z0yW0PnwRRvMqvcuRN9iok1xmLrfWAP0e6INxrY5kIQUe5Z0R9Zg8QrsjV0fNGYpBBC6ORyFqeeBn+/67c9GlqvEuI1P8nq2aq5WeiTiz4TPuRDvHJFhX0l9REhVFD+ibLdI0deoTDIbSkN0SAlzMYjVN8xc6EIgVr20GJlRosZtpmTc9RxhlFDz8EYP/hMaoamAhX0Y6XiqBgyZ6V5n7cIeURFWFeiw4M9TL7ZaGw2UTxGuSEM70mZZ4LnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuiNhV3Xy1baMyG+3VVw/WDbFU91hv1YLEk/AucAL5M=;
 b=js37aAf5l+hd23gH/D8sqTvud6lwPNKbEwFiLY4zgsoQ66T4fE5INfbys5GSNBtiT/yk/1BH6vbDHwYMlr3CO47SwBSFgfC60hiMrWzlR674VLU1ya2n6K50Rac5nL7upyfIL/dXmZSu4MKEt/t24+AZiGHJbZEi5f1bO0jzGpdOPBOyalcV/yZk2YEPZN9bjrfTXZtai66/R2Y/dmlBr52VTZRe+n0hXHioh+BKi4pEvaKPEcOn7hYvjJ+nlEN618b2YgitbLP8Pv+q0663Ktf8pT6GdeuLoFi0k8YPbz4jPiLhANuud4DE/O0kNiFdHtCysKoGoAVehQ/NOhevjw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3332.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 09:21:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 09:21:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "changqing.li@eng.windriver.com" <changqing.li@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191
Thread-Topic: [OE-core] [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191
Thread-Index: AQHZ3LMBF6By4vQuYUOYhTPPyDbB7rAFsIRw
Date: Fri, 1 Sep 2023 09:21:38 +0000
Message-ID: 
 <AS1PR10MB56973160C9A591A77D8FCA55FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230901090208.3242013-1-changqing.li@windriver.com>
In-Reply-To: <20230901090208.3242013-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=eceff652-99b3-46ff-8b94-6fe1b6e6b281;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-01T09:16:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3332:EE_
x-ms-office365-filtering-correlation-id: 56eeb6de-32ec-497c-3319-08dbaaccd8a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5S5KphtqXgBLlea1dIuMaSGCfL4aXhuPltW6AA0Gu+Z4LLzxadlhWn7stvocf9HHSsPsgMUCxor7q5kc9I6yZve4ooQFnUG62X4FhX3PJ98JiQIRb0d6ik1ftVgVS0idayreYaQzSiEyLKsl7ZnvHvliV5mskVMtWTE+/IqoCXaBLK9bopxMjojRkPMdwMvbYxyIbP8Sg/04Y8E/nIyjboDksjoIs+DVr14CNHksKhu2H93F1ETwbD1sooBX6fLZL3ueZylctWa/ze9NYUjMNRF9rMQTcTuxpqaPmVv58CRN1e1OhzJBcEH+qVYpUUIz4ifo1ksSQVOmgsQpShtPCzuPG8kOrBRhPx6riKVnRGC2NQ1yQ3Oblwcl9TSXCA05EVgkZ28EK5kTVGgmj8koPg+1/HJBJy5zFCQ0a5f5zslVWfqQjvPvR91aq0UYVLhbzmpd9YieQIHzMKbZLhLtuuh7iBZnVv2AW9jQMXhnn8Ao4sBdmdDr+1fpaM71Qrb61nTaHBaVwI3UEbb8125td23nZNTIJJGhw3Qjvc1o+HxYuXc2S2xTP8qE9VmxEMCx0ZN4ZPI0EwDNWG1V/kSVDQXNfrZMsOrKZBWlnp9ja4A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(186009)(1800799009)(451199024)(7696005)(6506007)(71200400001)(9686003)(55236004)(53546011)(966005)(478600001)(83380400001)(26005)(2906002)(64756008)(66446008)(66476007)(66556008)(316002)(41300700001)(66946007)(76116006)(110136005)(52536014)(5660300002)(8676002)(8936002)(55016003)(33656002)(86362001)(38070700005)(38100700002)(122000001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MhDRoAiAiEMDYfJfCni0kU3NT3bWlGvzaMltvo8HAPUQVZCGLlGn5ScFERyd?=
 =?us-ascii?Q?P3C0tNu6tEP6B3NWcnoRA0CCaf9KTHDI1LsBdIZkV53sLSvi0gYpRRGcn31H?=
 =?us-ascii?Q?m7PIQP8f3syOTcQo6bYZ1Uvk9MfPP150ybYMCafKfU9GRTBTQb50eUhpX1Uh?=
 =?us-ascii?Q?VuQeK/JSxpwWAAR0vjLZby34MX4rSxE8c4v5wsl5LyAbyU0Gp/gubpebLBho?=
 =?us-ascii?Q?KEhYuXVJA4okJ01sH4M+rTUAwfRFZSTgDPkJJrhHtYnDydxorWcTa3D0C4Cj?=
 =?us-ascii?Q?SuocQENqZ4pLbY94VkqAq+NKds+gTOYFJQW4t93UdtSvCWI6lSeAadb/zwM5?=
 =?us-ascii?Q?Qoo9F9U8SOIfC2/telwzklSXKTOL1GLro5kumxNxS4Qgcj7FvBODioj/KXT3?=
 =?us-ascii?Q?pn7Ynku9QqJvd4xwglSOFm9ceVcRlyDcTwOqbYebAyblbqOayJ9n2xVjdlO/?=
 =?us-ascii?Q?iaSlh3IbuWvA8BdGNfL4Xe2pmrVn3BaCviEh32WqjjjR2N+qV/Z21PXSkrh1?=
 =?us-ascii?Q?jYO1fiRV49UJzjYl8FvFS506M3QMEZQvIWBMdLzI1ns7mUXcCWRJ7kREHFsx?=
 =?us-ascii?Q?K2FwiqFtHHktt8vaDkLDMKy3u5uxOb1pnT1es20jkfunZGE+2ka5J7TfKvE+?=
 =?us-ascii?Q?68AqDlk9/6LZ6bVcF7A1h9ZljYxEDWTLiSJZqevD3jyOPi//N/DYJYZZBsnn?=
 =?us-ascii?Q?Eh4NT9ftKxMcChJz+FMM+eIrS7h5SKonHGqQ/5W+W4pmev4tDOuvRK/1RnCH?=
 =?us-ascii?Q?plnHeBquBL+D1oiKclhybZPWYhdZv6kQ8n4HryVF/9fjbFY+2FvjirFD+SlU?=
 =?us-ascii?Q?HCX3pCHLfDgLxZI0OvGvM1GoaHXq5nyl73bHCzMPTdgwocmdxnAg80Eui7Nh?=
 =?us-ascii?Q?jnjMJWw4PChC1kMFVMiLJtLxNR7T+TMpP40gfCjKOccAj7HhsitAkg0yvrKq?=
 =?us-ascii?Q?UyJPB3ODY9nogh3pkw+vjbKop3KPNo/YdjOAkQTWBmQkovMyOA6GlNs3F9o8?=
 =?us-ascii?Q?z0HqWMHH1Fn+ISVqEtcwJYQVCcI5NaRBUNiEsUlW60iU1+lsXBhIl7skrYO3?=
 =?us-ascii?Q?pZmuMncEGPlEbJuBIKvooEgifWzUBO45O6ffFq62yhcmktt1GzaK4mjkg5ut?=
 =?us-ascii?Q?X9JKj93RCYwqip1/BQDWWGPBSKlY1sFQ5EL8r2hSGWiet+6LcFqUFJHzkvVE?=
 =?us-ascii?Q?zUYU/p1SzgcpCYrG9bhJDNEO3CH4ZGAXnsLtk8I24l6yuFCS8669Fnyo49NA?=
 =?us-ascii?Q?SmgnNCBA8UUTVTiP5tC2f/DtiFbS/NKeK6CygSq9mzifYdE4bNRfDBcBqazP?=
 =?us-ascii?Q?uJhRJlR6tsVNUu+v2XXK4imDDdw76t9TqRG2xnhPDr2e84RG66FJs6OxFt1H?=
 =?us-ascii?Q?JLv9qOmi7/Ylv3n2HwP4YniIh7Eb09X/EfZPymubelWS47Ezt89f1uHVC4nM?=
 =?us-ascii?Q?6AdBbSRJov0bDR3Y9MNmybekp34+lNkadL4zNAq87DYFzyoDJyCOIhUkGZ2J?=
 =?us-ascii?Q?3EmW4RVgSDK9DC5r/cISEGSc591li9vMcDl+lLzRvbJWXoxunbAUpt6rHJYD?=
 =?us-ascii?Q?isuhHygRTUTZburJIXqBSHctHMH2KJv93K6At1ei?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56eeb6de-32ec-497c-3319-08dbaaccd8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 09:21:38.7447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJ1EXG+j8yOBnHwrvC/ESDsA65ZwAyPn/6JRUior4vmsAu3I+N9oHQuwWQW3xOcb7DZChUWuQb3lVD1cWwMWxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 09:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186996

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
Sent: Friday, September 1, 2023 11:02
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191

> From: Changqing Li <changqing.li@windriver.com>
>
> The error is a bug. It has been fixed upstream. But it is not a vulnerabi=
lity. You may safely ignore the CVE.
>
> Refer:
> [1] https://www.sqlite.org/forum/forumpost/19f55ef73b
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/sqlite/sqlite3_3.42.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb b/meta/recipes=
-support/sqlite/sqlite3_3.42.0.bb
> index 8783f620f4..b37644580c 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> @@ -6,3 +6,5 @@ LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=
=3D786d3dc581eff03f4fd9e4a77ed0
>  SRC_URI =3D "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
>  SRC_URI[sha256sum] =3D "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49=
da4e1eca5d088ca6"
> =20
> +CVE_STATUS[CVE-2023-36191] =3D "The error is a bug. It has been fixed up=
stream. But it is not a vulnerability"

This is wrong format since it's missing CVE status map prefix.
It needs to be something like:
CVE_STATUS[CVE-2023-36191] =3D "disputed: The error is a bug. It has been f=
ixed upstream. But it is not a vulnerability"

Also since this CVE is reported in NVD DB for 3.40.1 only, this CVE exclusi=
on is not needed for 3.42.0 recipe.

> +
> --
> 2.25.1


