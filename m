Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C55CC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:00:58 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.89])
 by mx.groups.io with SMTP id smtpd.web09.20171.1663596054346458765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=p46ZIuHm;
 spf=pass (domain: kpit.com, ip: 40.107.239.89,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY6Zu35Q3RZgwLjChbsmerJkojJEh7IoQZS2s11ohehnfZE+lN1alRij2PDTVSEr56pX9e7sFg701FDnIRgniGkPbjNtsjua707WhllxfV5Rscjgi3ZckLpyvY3/B6qvZuP2kKhbP9Zo4ENsX+JI98Bn+bgIjT9l5z5D7+UaIOcQtfT3JWamR1KdwTFfV2oWp1ALDOPCq/DJp+OXVv9Xz8ur8j/GknYm/lGFQ9g5f+wj2lyoEo3fDz+LciZ+ipJKOnzEvmPjntl2lDNzl09X3EA1iOFyR49tmskAVTaryx1cR9PHOBy39bddy1EpOpGgKyajWY7CdYzx66qS5ZXl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7nnklqL3PrxoGPvE6OINBQpKyNstZGfmfDrCF2iCP4=;
 b=aeGXj8uWS5zQ0L8e3/JMpsQCsZJvDh6IbAQS9MljO4F47MzLDJi1VOrfdGK5tfTiILZ4PAfwzTuHsrpaT0RG/XZSZiFEaCwiEIOrPwcUxqwjaBRgI31FJHMQUztq0zkSq7e4soofANBeEXC94HXxxLgo/dUkHOuhh11QVxr14molbDfVqC1Cbyxg6kDDN0jjN6wgWHs8a9cjIJsavluEV2sTctiw4fgF8p5RJnFwokVVqN5z2wltyPgpSJN7s898pBcaxO9Gxl1dfE28a3kKsSX7DikFhaMCzFlgkmEj4TP8YuBu16m6GqjdxEJ1oNM2wb7DtAXR3euPwaftBFy/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7nnklqL3PrxoGPvE6OINBQpKyNstZGfmfDrCF2iCP4=;
 b=p46ZIuHmrotoGVp9Pyt8gZNvV2AshH1ffg7AqqWZ2DBLuSIz9bFYZI2Tj8rOEDwVJ+6AMepOgmtLNTE2g7RRJ3falKIcsCWiGGb/NpnR77QIG9RQC3GCLKQOEq3sJBR640j5SJqWr4O6TEujvHxZm+3yUPh9OKbyF6fVqxbLaLU=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB6657.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:75::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 14:00:44 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 14:00:43 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: Re: [OE-Core][dunfell][PATCH 1/2] sqlite3: Fix CVE-2020-35525
Thread-Topic: [OE-Core][dunfell][PATCH 1/2] sqlite3: Fix CVE-2020-35525
Thread-Index: AQHYzC+QqbQXnxZ5mkqYsxJFfEIiEK3mxwTM
Date: Mon, 19 Sep 2022 14:00:43 +0000
Message-ID: 
 <MAXPR01MB432773F699962D3CCA1F7B209D4D9@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <20220919135536.5360-1-virendra.thakur@kpit.com>
In-Reply-To: <20220919135536.5360-1-virendra.thakur@kpit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|PN0PR01MB6657:EE_
x-ms-office365-filtering-correlation-id: 33f79935-fa05-426e-1668-08da9a47582b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JFUaJO/ZUmFDcVHrzmPqXVXVfoambFqxQJR9QmJJO4OYDHz2WzuPkX3XHqJg8Vb27/iheApRyd7uFU14+JOXW/INC8Vlf5bJ0s22mbue/uj9IeIUV1rOc+fMGi3Uze5u8Itk+jThrWnHonTXchoi4Y3/9SCtzORdglmIp32HsSAmYarLSrx665STwgibT6ZK/OLLk7KVkGoy63WzKUrDbkXAAoERuuxx7yAogpmzp3k3NHkheLKWYNhZ9a4yIz3MUgFc7XuvxMvjAbeI0j/4lW3dbc+k3P5U4/mJ2M1YUqjzDaHNKRm9t7inULlgNtI8Q8JAoY5Z6loG/2URBvoJLvh7os7YaLLEq+dR0oeZTQyLkiFuGx4pkGG0Jn2EcLw/blS/72m7t9rooPKCTkjsrUkJuAAKqElPbD4IHynTlFw/ik459EpJ2EaSRPV5s89WEsxFlayQNtOhMfK8OkOrjk2oB3TG2ZG+v1sGeoCqssVoItv/zECcwg5Ejg7Llp11Uy8Y/S1GgrcOqKizzNq2h6rzQiSACu3AVhx7ATHzI1RJh3MS2aXBTk7BMYrFOdbDuzNgJnEXlhitIb2FLoS9itdxiXGlo6vmVNOvL3Ntqjt4OtWNSXclXInvdfbO1CUwRm2NhE0GIFhWYoMbdkH5e2+pvIeEAQM95K8G+nma56SdRItPLVf5btHEM3CRRoapZCxDD+5gF16MZFC39JvJ+yVEd8/KJHi1OCK2maLHd8d4aSsBvNrldM4NefRRt1K+UkhvWsh3ld209EUd9nw21IiuXkQkTbQUdxTG1FZMhRLsf8MI4J+rCbHRsW7zTjzm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(2906002)(966005)(38070700005)(7696005)(53546011)(41300700001)(55236004)(64756008)(6506007)(55016003)(84970400001)(45080400002)(4326008)(33656002)(8676002)(91956017)(76116006)(66446008)(66476007)(66556008)(66574015)(83380400001)(6916009)(66946007)(316002)(52536014)(18265965005)(71200400001)(5660300002)(186003)(8936002)(478600001)(86362001)(38100700002)(26005)(9686003)(166002)(99936003)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D6DgL3dlDkDtwbd4rmZDgikQejX1qBjtAvikgfKxq3hLP4I1nPK+P3uA0Sxp?=
 =?us-ascii?Q?qzFHsVf1ulw3bC+ZegmXHEsTjUwB4GlYxFvqQBWeU/TodjzB6xNv4wGpp2ss?=
 =?us-ascii?Q?m5VzXPB/eZFrxS/EfS9lJVUEaXhqdpmqxBfIBSf92dKe8xdiQeP2OjDtAx4S?=
 =?us-ascii?Q?pxxjkWe7UenQLgrLYuM/98mo511HWFUVloxBJxadhY+6YMEF37OGHFPsaOuE?=
 =?us-ascii?Q?ePCXulynrZ9jKQaj5dWDR9NK9D/wOGia+/uorxcUqkgh4PGMGE/emKUewCjR?=
 =?us-ascii?Q?HwCGowLu712PL6xQj5CaXn/tv+3TkDaA6YPKz4UOz5f9v16bfNX5LSCp71+a?=
 =?us-ascii?Q?Sg6tbPMuGqFkJpc8a5lVK1/VnhnJQ/BEyv1aO9TE2UnkEJw6/rWnyT/s6lP6?=
 =?us-ascii?Q?Ym8VyXWTZ9OnHCtKSbQXv9dSK6BmmfQttH4E41j2XvjLFchrOJjyb5TtU9e3?=
 =?us-ascii?Q?KZzHF2kJ/mD61cDiySDuRBJXAo5K2JVQKDxU/C2lTwf94JKvQ6UOBtHfv71H?=
 =?us-ascii?Q?hnRAe2N1z3sSHqqSSoy0eC3UTn+FYVJij2Vj8maa3aUk5qQspfaXFs2Ir0db?=
 =?us-ascii?Q?5IzP36v/wlgkXZ4GToWPZkXIelMjg7kc1b5zF6Zcqv27/ip2U+aHnJ+vdVcd?=
 =?us-ascii?Q?PEdEZTt6nx2yOT9vkEkXQX7A+/iax2a+vFua4rzqX7UuoNqdG0e//E3JM/zY?=
 =?us-ascii?Q?asnI3m0bAnx41DLo1A9SyCqlSuTRrawi9AM3cdoD3ThFXauyAunwUXLWKpqK?=
 =?us-ascii?Q?jWJvxHD2SSitJ2T0fOutPfLKV8AoSjoCMG2nF5xPtIGtQNIWXCpmdZ+irBfk?=
 =?us-ascii?Q?ya8t+YTfWJIgEDkItzd97sDxsFjtR6UE627qYghC9AVEhggGMZLsJVaRaBwY?=
 =?us-ascii?Q?qOBTrpefEiuMX4CeXBxUKCOXST7k5Hiwj91vnaSg3ZPLZetF9WkdlDPnAee5?=
 =?us-ascii?Q?nlqTPC7NB+cB8eS16M1pP53w3z9GJ1BQspItk5zO1mYDlygGV61jSF1+EuxI?=
 =?us-ascii?Q?gR3lJx/XOVYNsYn+NAbSVDj5aBI7TkRj8Pjcc3fVl1yMTsauPkRza6MGCjku?=
 =?us-ascii?Q?gQSkAXxqK/m/e3PM7gag3hutyzYHl0Nk1FNSMG3YtKCNGJrG6GTJZ+CJUEP9?=
 =?us-ascii?Q?ePptgr/PeTUjeULriHw8laorB8hXxoRLZBf18G7eFBksCTocE88ruavGulGa?=
 =?us-ascii?Q?eUQrS8wBfBy4N5mDeZEYai3hzCYEDhYI+jgjsHG4GvLr0m9Hqf7+/jSjnVaN?=
 =?us-ascii?Q?ylrIVNB5UuuEqrDg3yb8cT/AbXBdwhSHn9xMnCuaHrRctJssH0wm7jrYXFWb?=
 =?us-ascii?Q?dfciLqJIPAz15nf2wwIAGb7PgQMuStY0CZNhNEc49k+r1FxUiURJnhnBVH+T?=
 =?us-ascii?Q?dO74ulLWDpUYB5eaGN9GM53lOmGsJHl266CPDfZMl7U5AhoKZ0LPNemwJ1BO?=
 =?us-ascii?Q?21Ekdr908mqMu+0j3DZpUs/e39icTIi92uU6jEOhzfwIpjt8/mE2Jal9a692?=
 =?us-ascii?Q?uuY5n08fQcAiUTKJdwaGA0Hp8w1XwJnH/uYc85sru/I66zjaOm/TM9odIFlk?=
 =?us-ascii?Q?iplN9N3cJrJ7VH9Apj0=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33f79935-fa05-426e-1668-08da9a47582b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 14:00:43.8295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 OySTXqky+wUujghTrJUeupuv9sC+r/PDfKAQpQ2o9mxkwKaYpnXwZ4adZ8Q70VO/onplbERDnCeCjVsAyrT3oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:00:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170860

--_004_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_"

--_000_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

please use attach patch in case there is issue in do_patch.

As observed earlier KPIT mailer is adding some extra character in patch whi=
le sending patch, which cause failure in do_patch.

Best Regards


________________________________
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Sent: Monday, September 19, 2022 7:25 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: steve@sakoman.com <steve@sakoman.com>; Virendra Kumar Thakur <Virendra.=
Thakur@kpit.com>
Subject: [OE-Core][dunfell][PATCH 1/2] sqlite3: Fix CVE-2020-35525

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2020-35525

Reference:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsecurity=
.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlit=
e3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;data=3D05%7C01%7CVirendra.Thakur%40=
kpit.com%7C66ef6b4f62da4e9c4c0e08da9a46b263%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637991925705182386%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dyr1oVWwognNVO0Puv8gHuRzVm12EXvAtc3LCoJmhYuU%3D&amp;reserved=3D0

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../sqlite/files/CVE-2020-35525.patch         | 21 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35525.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35525.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35525.patch
new file mode 100644
index 0000000000..27d81d42d9
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35525.patch
@@ -0,0 +1,21 @@
+From: drh <drh@noemail.net>
+Date: Thu, 20 Feb 2020 14:08:51 +0000
+Subject: [PATCH] Early-out on the INTERSECT query processing following an
+ error.
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%=
2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;data=3D=
05%7C01%7CVirendra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4c0e08da9a46b263%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991925705182386%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;sdata=3Dyr1oVWwognNVO0Puv8gHuRzVm12EXvAtc3LCoJmhYuU%3=
D&amp;reserved=3D0]
+CVE: CVE-2020-35525
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+Index: sqlite-autoconf-3310100/sqlite3.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- sqlite-autoconf-3310100.orig/sqlite3.c
++++ sqlite-autoconf-3310100/sqlite3.c
+@@ -130767,6 +130767,7 @@ static int multiSelect(
+         /* Generate code to take the intersection of the two temporary
+         ** tables.
+         */
++        if( rc ) break;
+         assert( p->pEList );
+         iBreak =3D sqlite3VdbeMakeLabel(pParse);
+         iCont =3D sqlite3VdbeMakeLabel(pParse);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index 3440bf4913..48051593e4 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.sqlite.org%2F2020%2Fsqlite-autoconf-%24&amp;data=
=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4c0e08da9a46b263%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991925705494829%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3DF4jFw0UZvxcHtGpqurisDSojtRr773gSMtHFP%2FbO=
3Ks%3D&amp;reserved=3D0{SQLITE_PV}.tar.gz \
            file://CVE-2020-13631.patch \
            file://CVE-2020-13632.patch \
            file://CVE-2022-35737.patch \
+           file://CVE-2020-35525.patch \
            "
 SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b78=
25a2b6b51949ae"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
please use attach patch in case there is issue in do_patch.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
As observed earlier KPIT mailer is adding some extra character in patch whi=
le sending patch, which cause failure in do_patch.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Virendra Kumar Thakur=
 &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Sent:</b> Monday, September 19, 2022 7:25 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> steve@sakoman.com &lt;steve@sakoman.com&gt;; Virendra Kumar Thak=
ur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Subject:</b> [OE-Core][dunfell][PATCH 1/2] sqlite3: Fix CVE-2020-35525</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Virendra Thakur &lt;virendrak@kpit.com&gt;<b=
r>
<br>
Add patch to fix CVE-2020-35525<br>
<br>
Reference:<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2Fsqli=
te3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;amp;data=3D05%7C01%7CVir=
endra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4c0e08da9a46b263%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637991925705182386%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;amp;sdata=3Dyr1oVWwognNVO0Puv8gHuRzVm12EXvAtc3LCoJmhYuU%3D&amp;amp=
;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool%2Fupdates%2Fmain%2Fs%2F=
sqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&amp;amp;data=3D05%7C01%7=
CVirendra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4c0e08da9a46b263%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637991925705182386%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;amp;sdata=3Dyr1oVWwognNVO0Puv8gHuRzVm12EXvAtc3LCoJmhYuU%3D&amp=
;amp;reserved=3D0</a><br>
<br>
Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
---<br>
&nbsp;.../sqlite/files/CVE-2020-35525.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 21 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/sqlite/sqlite3_3.31.1.bb |&nbsp; 1 +<br>
&nbsp;2 files changed, 22 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-35525.p=
atch<br>
<br>
diff --git a/meta/recipes-support/sqlite/files/CVE-2020-35525.patch b/meta/=
recipes-support/sqlite/files/CVE-2020-35525.patch<br>
new file mode 100644<br>
index 0000000000..27d81d42d9<br>
--- /dev/null<br>
+++ b/meta/recipes-support/sqlite/files/CVE-2020-35525.patch<br>
@@ -0,0 +1,21 @@<br>
+From: drh &lt;drh@noemail.net&gt;<br>
+Date: Thu, 20 Feb 2020 14:08:51 +0000<br>
+Subject: [PATCH] Early-out on the INTERSECT query processing following an<=
br>
+ error.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2Fpool=
%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar.xz&=
amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4c0e0=
8da9a46b263%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637991925705182386=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3Dyr1oVWwognNVO0Puv8gHuRzVm1=
2EXvAtc3LCoJmhYuU%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttp%3A%2F%2Fsecurity.debian.org%2Fdebian-security%2F=
pool%2Fupdates%2Fmain%2Fs%2Fsqlite3%2Fsqlite3_3.27.2-3%2Bdeb10u2.debian.tar=
.xz&amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C66ef6b4f62da4e9c4=
c0e08da9a46b263%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63799192570518=
2386%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3Dyr1oVWwognNVO0Puv8gHuR=
zVm12EXvAtc3LCoJmhYuU%3D&amp;amp;reserved=3D0</a>]<br>
+CVE: CVE-2020-35525<br>
+Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
+---<br>
+Index: sqlite-autoconf-3310100/sqlite3.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- sqlite-autoconf-3310100.orig/sqlite3.c<br>
++++ sqlite-autoconf-3310100/sqlite3.c<br>
+@@ -130767,6 +130767,7 @@ static int multiSelect(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Generate code to take =
the intersection of the two temporary<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ** tables.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if( rc ) break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert( p-&gt;pEList );<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iBreak =3D sqlite3VdbeMak=
eLabel(pParse);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iCont =3D sqlite3VdbeMake=
Label(pParse);<br>
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb<br>
index 3440bf4913..48051593e4 100644<br>
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb<br>
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb<br>
@@ -14,6 +14,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.sqlite.org%2F2020%2Fsqlite=
-autoconf-%24&amp;amp;data=3D05%7C01%7CVirendra.Thakur%40kpit.com%7C66ef6b4=
f62da4e9c4c0e08da9a46b263%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6379=
91925705494829%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3DF4jFw0UZvxcH=
tGpqurisDSojtRr773gSMtHFP%2FbO3Ks%3D&amp;amp;reserved=3D0{SQLITE_PV}.tar.gz
 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2020-13631.patch">file://CVE-2020-13631.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2020-13632.patch">file://CVE-2020-13632.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-35737.patch">file://CVE-2022-35737.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2020-35525.patch">file://CVE-2020-35525.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[md5sum] =3D &quot;2d0a553534c521504e3ac3ad3b90f125&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;62284efebc05a76f909c580ffa5c008a7d22a128=
7285d68b7825a2b6b51949ae&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_--

--_004_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-sqlite3-Fix-CVE-2020-35525.patch"
Content-Description: 0001-sqlite3-Fix-CVE-2020-35525.patch
Content-Disposition: attachment;
	filename="0001-sqlite3-Fix-CVE-2020-35525.patch"; size=2469;
	creation-date="Mon, 19 Sep 2022 14:00:14 GMT";
	modification-date="Mon, 19 Sep 2022 14:00:42 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjNmE1OGRkZWNiNDYyZDM3OTUxOTU0YzBjZjdlN2Y3NWM2ZmQyOTVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogVGh1LCAxNSBTZXAgMjAyMiAxODowMjo0MSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IEZpeCBDVkUtMjAyMC0zNTUyNQoKQWRkIHBhdGNoIHRvIGZpeCBDVkUtMjAyMC0zNTUy
NQoKUmVmZXJlbmNlOgpodHRwOi8vc2VjdXJpdHkuZGViaWFuLm9yZy9kZWJpYW4tc2VjdXJpdHkv
cG9vbC91cGRhdGVzL21haW4vcy9zcWxpdGUzL3NxbGl0ZTNfMy4yNy4yLTMrZGViMTB1Mi5kZWJp
YW4udGFyLnh6CgpTaWduZWQtb2ZmLWJ5OiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0
LmNvbT4KLS0tCiAuLi4vc3FsaXRlL2ZpbGVzL0NWRS0yMDIwLTM1NTI1LnBhdGNoICAgICAgICAg
fCAyMSArKysrKysrKysrKysrKysrKysrCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjMxLjEuYmIgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvZmlsZXMvQ1ZF
LTIwMjAtMzU1MjUucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxp
dGUvZmlsZXMvQ1ZFLTIwMjAtMzU1MjUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxp
dGUvZmlsZXMvQ1ZFLTIwMjAtMzU1MjUucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMjdkODFkNDJkOQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9maWxlcy9DVkUtMjAyMC0zNTUyNS5wYXRjaApAQCAtMCwwICsxLDIxIEBA
CitGcm9tOiBkcmggPGRyaEBub2VtYWlsLm5ldD4KK0RhdGU6IFRodSwgMjAgRmViIDIwMjAgMTQ6
MDg6NTEgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gRWFybHktb3V0IG9uIHRoZSBJTlRFUlNFQ1Qg
cXVlcnkgcHJvY2Vzc2luZyBmb2xsb3dpbmcgYW4KKyBlcnJvci4KKworVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cDovL3NlY3VyaXR5LmRlYmlhbi5vcmcvZGViaWFuLXNlY3VyaXR5L3Bv
b2wvdXBkYXRlcy9tYWluL3Mvc3FsaXRlMy9zcWxpdGUzXzMuMjcuMi0zK2RlYjEwdTIuZGViaWFu
LnRhci54el0KK0NWRTogQ1ZFLTIwMjAtMzU1MjUKK1NpZ25lZC1vZmYtYnk6IFZpcmVuZHJhIFRo
YWt1ciA8dmlyZW5kcmFrQGtwaXQuY29tPgorLS0tCitJbmRleDogc3FsaXRlLWF1dG9jb25mLTMz
MTAxMDAvc3FsaXRlMy5jCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CistLS0gc3FsaXRlLWF1dG9jb25mLTMzMTAxMDAu
b3JpZy9zcWxpdGUzLmMKKysrKyBzcWxpdGUtYXV0b2NvbmYtMzMxMDEwMC9zcWxpdGUzLmMKK0BA
IC0xMzA3NjcsNiArMTMwNzY3LDcgQEAgc3RhdGljIGludCBtdWx0aVNlbGVjdCgKKyAgICAgICAg
IC8qIEdlbmVyYXRlIGNvZGUgdG8gdGFrZSB0aGUgaW50ZXJzZWN0aW9uIG9mIHRoZSB0d28gdGVt
cG9yYXJ5CisgICAgICAgICAqKiB0YWJsZXMuCisgICAgICAgICAqLworKyAgICAgICAgaWYoIHJj
ICkgYnJlYWs7CisgICAgICAgICBhc3NlcnQoIHAtPnBFTGlzdCApOworICAgICAgICAgaUJyZWFr
ID0gc3FsaXRlM1ZkYmVNYWtlTGFiZWwocFBhcnNlKTsKKyAgICAgICAgIGlDb250ID0gc3FsaXRl
M1ZkYmVNYWtlTGFiZWwocFBhcnNlKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9zcWxpdGUzXzMuMzEuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9z
cWxpdGUzXzMuMzEuMS5iYgppbmRleCAzNDQwYmY0OTEzLi40ODA1MTU5M2U0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjMxLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zMS4xLmJiCkBAIC0xNCw2ICsxNCw3
IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5zcWxpdGUub3JnLzIwMjAvc3FsaXRlLWF1dG9jb25m
LSR7U1FMSVRFX1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjAtMTM2MzEu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjAtMTM2MzIucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vQ1ZFLTIwMjItMzU3MzcucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMjAtMzU1MjUucGF0Y2ggXAogICAgICAgICAgICAiCiBTUkNfVVJJW21kNXN1bV0gPSAiMmQw
YTU1MzUzNGM1MjE1MDRlM2FjM2FkM2I5MGYxMjUiCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjIy
ODRlZmViYzA1YTc2ZjkwOWM1ODBmZmE1YzAwOGE3ZDIyYTEyODcyODVkNjhiNzgyNWEyYjZiNTE5
NDlhZSIKLS0gCjIuMTcuMQoK

--_004_MAXPR01MB432773F699962D3CCA1F7B209D4D9MAXPR01MB4327INDP_--

