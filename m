Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A29EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:49:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3764.1686714555957979674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 20:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e/udse1X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55294c811d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35E3fr5l031283
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/CEbl9nS2mB/UqmIXW4Zw8GvRaRR4CN9H56NVgullU0=;
 b=e/udse1XXhw9hXPquSDR4Pyhrkxcw4tSFnEnIZJMfcicj7fkXmSoWHLFOV6OjUQjEvrI
 +rDyMqDnSq7EU62+aeyJMWgxS9J/eBE7qV7J6ByTK7ySzjHmpxdLBsnieQxvc8Qv37AP
 q75ci2WyaVBdpYTACUbaLiwUiyILSxniidC93+1Bcp/LDUfX3wza6mF3MX3zrg1dHzul
 T/bXpT+FpcBanTGB+HGHf/d20uToqc3vVWx6zZKNG+opTHPQf7l2uOkd/iPgLjCTXEwi
 UHQSdJ9SFlgfIt0HsgVRRr7b4/i7aLG4UuxzsZYe0tTxisyuUXo/Zso7KJ2Un6aysC/Y VA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4g583c11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpzMNCamtCqrdkSfWLW11ts7SK6D4oW2Nps3+wWaEP4m4nfQ8BhTzs8yJXSSWiyjxvt6BXlBq7Q/qmwunZJl7FJznb/bHeagim/EBaKziBHYUM35aKaUOcY7Oql6tnSK5InitKLKbC4Y0h1LtrKGzTRuxaiU3F4piacs8OEws4iW0HaTBNgmYYSn2YFbX62pjhsu+yu3nveUF9QU/lE7KcV4Wo95SpgaMpCVx2Wuxhf9EHGvgn0Kpd63Q2O9arKej0XPwyrHZy1X25Cdy/88sp9kcWgSh5aWi32BaiNo8ugur+Nxt1ZvXjlCX1vnLi6mTAezLuzFluL0vMugwREqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CEbl9nS2mB/UqmIXW4Zw8GvRaRR4CN9H56NVgullU0=;
 b=Jv0jn37FV6kyOlmMIbv0EyJfK4Y53tWxDynl0GiJk8Dtao58Lweds7QqQKjpBN4zFaO4BV+S9EJl6d6kKeV9Xe8iaC4fzt/FE+INjSkbGAgKje97WUzd4tIv1t+NlIJrbwv3ZM3nt4zuPZ5zmr5o0a/1FdpTiJgvLy39xe9f8YVNhV7mHo6XmpgfjK2iAc9dHd+g/QTf8FD/NTuKbf/XMp/sUY9Dci8Uklxt7tDo235eAv3LItJ6O3RbcYo3r1J2BKJ/X2GCd7THakBDiT0eR/N/RjawAyzB0uGyGS0ojbunadeSfzENefZ9O9XpvmbQo+T0Z03nqNXKByL5vw+17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Wed, 14 Jun
 2023 03:49:12 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Wed, 14 Jun 2023
 03:49:12 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-25652
Thread-Topic: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-25652
Thread-Index: AQHZgnbPf+HsWsQ/Lk2z4uSLB4Ef/q+J4WJE
Date: Wed, 14 Jun 2023 03:49:12 +0000
Message-ID: 
 <MW4PR11MB5822C76BA0862DC3A5254243845AA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <175D7B55E6D05C85.31428@lists.openembedded.org>
In-Reply-To: <175D7B55E6D05C85.31428@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CY5PR11MB6212:EE_
x-ms-office365-filtering-correlation-id: 9c5b5d5c-7728-4093-b240-08db6c8a5108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Frmq5Enxsqv9SYaTQ4IET6FahsTi24Bx60XT2vWhHCrsf4Co7zFzMURO/kW90+k62qFzdbo1o4J1cxI0CevHnv/fqJ245pY8WWlVwXnk8oO4JvyAnu9MgOzGQYsEIG2gcUgv9drdRVji7uS6yhVBkknsJ234IyoSl93JV39HOzWpZM2XBzTFYJb0LNDeeFTRbE2UYvyZBB2pvsVvtiTOpHgmDuXsG7LpAPsTlqraAp9hWMdrDOmgiP6cYv5J7mZ5aClPd6auI3Nb3ea0c/ilJgPqbIfRyn2no+ToUGQ5LIYhav0cKLzna/fdGiJKaMLXACr//Ru6+rYroDMcfGtyR78PdyZkzoddLnrZLyLZ9rs/6alwyesJyJS5dz7JrLUSGBhwGNkubV2ihpDDMHaAwoWLVXnswCahE9utdWts3f4X4QTJnL0TEZmtekdMy9EeZWihqluRBk9IZ+FnzwEV88CxDWP5XuCbpXK4Bs+Y4zB138kFeEYmz5PkeSyPur3n6B3B+Y/JxZPHccL8O2FWx5s6/vpDxeE9w/QDfVZfXUsBqQ+bcinQ5NYR2B/4QatrGM6VTh5YMLgGDOP+VTJDdfO6jE2dWQH7ZBHGJEWZileq4z+DdxJGLT0LnqXcSkWYqp7dRO+Tf6TGbsxNaXz4rw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(451199021)(83380400001)(966005)(478600001)(55016003)(8676002)(33656002)(66556008)(76116006)(52536014)(66946007)(91956017)(64756008)(66446008)(66476007)(166002)(316002)(41300700001)(4326008)(38070700005)(5660300002)(122000001)(8936002)(86362001)(38100700002)(7696005)(2906002)(71200400001)(110136005)(107886003)(19627405001)(9686003)(186003)(26005)(55236004)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RTOjzO+w+8JGTJ0xAPRqFFGi82EkdMqVFv9FagM9lEcq07Rxdeu6AlDlPVgg?=
 =?us-ascii?Q?B/9dNx0437mmi+XoGKuqJX5R6oT7X1TZVFxbNwBgLK1DQNHyDS9vayk7TI+F?=
 =?us-ascii?Q?XI9AjQItQmggmIYT/8NIQi60w+WXpumU2nRBa5Z7yF3IYcw7v/GFxFMC10vN?=
 =?us-ascii?Q?VbVIN/Vbzk7gwkp1uZNFjtA4TIZIxjxJreK32AIqXQcXyfqF+x151Tgpl3v0?=
 =?us-ascii?Q?XhH2Oa6CBtb0UmLrRGJskDPNP5tBlvJ8MPLeOQRxlkKFZbeKjGv0BhpTP4VJ?=
 =?us-ascii?Q?3rWmuNIjc9foMYXtW0mau31DHd9k+yIZTGHC6BufRJdaAj5E3uwbIeePLE25?=
 =?us-ascii?Q?PMVbPIrncrfK6xrZ8su2xCNqiclCId0r9PIHZb7kuAqAGBpUQ0DVUeFm26mD?=
 =?us-ascii?Q?yyP034hZiPzlxi8ODDEHWxqevHVuFO+oRKpoPVD3DHW7ed8UOLJE6LD6xBbC?=
 =?us-ascii?Q?EpjY56NZAqxqjuTDnkf/Z++GJB1TeXO4G4hDoTd8W01G/tp9oyuXk6miLouo?=
 =?us-ascii?Q?M5RHraqpu3kqRt0iOGRdt5s7scwvuEz28OFB2u98MVzazunusBb3H+tXDa5R?=
 =?us-ascii?Q?HTsMi+EL4D7uFYeDal4jfC49sSnD8jYfSI62uGzIq57KoTDISB/xMZAyWpZg?=
 =?us-ascii?Q?JwVDIxfBSsByTNBNSgtuZht4XZCfKYBqdDbsUo4dxqcE/B8hnT4jGp0AQCkb?=
 =?us-ascii?Q?HTvr15ukGMIpOzWzoY6/3Q+mssTmgXjOemLEqzp0z1Oq0g+9dTZKtlrpc+fO?=
 =?us-ascii?Q?LRcrx5FEiIspdhUa7+6vFeD3X5jySU+Sikg5V5XO05wPkGKUZkvktbDDx7av?=
 =?us-ascii?Q?owrgRgfiWleWpqJxVZLtRkCk2daMwwh05ylQ0hWI9X55e3rVdV5gktRdQZtG?=
 =?us-ascii?Q?DvLb/O/SlHOIMV4rsAjIyxoKQ3aHjvdffgGu2M0yMz8cD5vZF7kh3b4VgDwB?=
 =?us-ascii?Q?J+6KWSFTFoQEn6XCeZxvKKlOQX6EJWWyvrvrYeDwBkD1IwjMBQNlLGpU8CBH?=
 =?us-ascii?Q?mDxG/vQw8bKMV2PrYPJXFp4QKNp5sICQD1t7xho5WPN4fq1vm/hAkiaq/otE?=
 =?us-ascii?Q?fMJ4i2pLxh5ZgtNqnwovhwiAswU2V/I8+aeyPlLm2sXxHD19hetO8wLBLWt9?=
 =?us-ascii?Q?qqt/SVbLMzNHw1zslAXC0qcZsUuPbAfknhbRSZy1ZadN0IWObm/rI8JnQTXt?=
 =?us-ascii?Q?SA1IngZDd7edYSB/9WhId9BABPVwcWWpMVrScuHmRA3dztHBbkJQejgpoFsn?=
 =?us-ascii?Q?JxWLY7nFTUGjYUr7yrIncofsZ4pjuzF19izFdUfKPnR4QZy4Ur0OIx9DduZB?=
 =?us-ascii?Q?UXmkA2GTmv8w+O4wSVYMRAFSXXFkFAe5D/HMt5sMtcOc4CkdCdoE8HUIN6Hy?=
 =?us-ascii?Q?40j9Tw+pxj9LfwiCM1zbs05fdHudKcp/jHXG5r87fQ+Tt8MiqncBU9N7yckG?=
 =?us-ascii?Q?MWK28x7TnrstcZM3wFl5nLq2u+RnmOPJyoi6j7YnxDV5SfuqOAE6FWi4zMUO?=
 =?us-ascii?Q?opR9EYvgdCctxGUL0ZewTW2VML9fIhA1py2++HEuiweh204KkIt3AHnvq7CS?=
 =?us-ascii?Q?sfDTRbnQI4u0UuQ43z4aty17vbUXkXEYdbLWtca1L7kTM1DSx53kH7jAhQY2?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822C76BA0862DC3A5254243845AAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5b5d5c-7728-4093-b240-08db6c8a5108
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 03:49:12.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeRAlwYd9pH8LyT58X+H339fXgIumW5E+O7Uu+ypnUVLPJf4hEBTLT1XiHbQJ4Qg/pCIViLRGNw+G/njcOrCIvwcseYg/NAanUUj26nUeFX4/TqNzKvx/WmDB/4jozi+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
X-Proofpoint-GUID: 5PqDppCjD4zPsS8PGjK5CicB5L3ZHaKu
X-Proofpoint-ORIG-GUID: 5PqDppCjD4zPsS8PGjK5CicB5L3ZHaKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_01,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182730

--_000_MW4PR11MB5822C76BA0862DC3A5254243845AAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder,

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, May 9, 2023 6:33 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Polampalli, Archana <Archa=
na.Polampalli@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-25652

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7,
2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by feed=
ing
specially crafted input to `git apply --reject`, a path outside the working
tree can be overwritten with partially controlled contents (corresponding t=
o
the rejected hunk(s) from the given patch). A fix is available in versions
2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.3=
9.3,
and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when a=
pplying
patches from an untrusted source. Use `git apply --stat` to inspect a patch=
 before
applying; avoid applying one that create a conflict where a link correspond=
ing to
the `*.rej` file exists.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-25652

Upstream patches:
https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../git/git/CVE-2023-25652.patch              | 94 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.39.2.bb       |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-25652.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-25652.patch b/meta/reci=
pes-devtools/git/git/CVE-2023-25652.patch
new file mode 100644
index 0000000000..e8cedfcf27
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-25652.patch
@@ -0,0 +1,94 @@
+From 9db05711c98efc14f414d4c87135a34c13586e0b  Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <Johannes.Schindelin@gmx.de>
+Date: Thu Mar 9 16:02:54 2023 +0100
+Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it
+ exists
+
+    The `git apply --reject` is expected to write out `.rej` files in case
+    one or more hunks fail to apply cleanly. Historically, the command
+    overwrites any existing `.rej` files. The idea being that
+    apply/reject/edit cycles are relatively common, and the generated `.re=
j`
+    files are not considered precious.
+
+    But the command does not overwrite existing `.rej` symbolic links, and
+    instead follows them. This is unsafe because the same patch could
+    potentially create such a symbolic link and point at arbitrary paths
+    outside the current worktree, and `git apply` would write the contents
+    of the `.rej` file into that location.
+
+    Therefore, let's make sure that any existing `.rej` file or symbolic
+    link is removed before writing it.
+
+    Reported-by: RyotaK <ryotak.mail@gmail.com>
+    Helped-by: Taylor Blau <me@ttaylorr.com>
+    Helped-by: Junio C Hamano <gitster@pobox.com>
+    Helped-by: Linus Torvalds <torvalds@linuxfoundation.org>
+    Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2023-25652
+Upstream-Status: Backport [https://github.com/git/git/commit/9db05711c98ef=
c14f414d4c87135a34c13586e0b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ apply.c                  | 14 ++++++++++++--
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index eec2da2..442cf28 100644
+--- a/apply.c
++++ b/apply.c
+@@ -4576,7 +4576,7 @@ static int write_out_one_reject(struct apply_state *=
state, struct patch *patch)
+       FILE *rej;
+       char namebuf[PATH_MAX];
+       struct fragment *frag;
+-      int cnt =3D 0;
++      int fd, cnt =3D 0;
+       struct strbuf sb =3D STRBUF_INIT;
+
+       for (cnt =3D 0, frag =3D patch->fragments; frag; frag =3D frag->nex=
t) {
+@@ -4616,7 +4616,17 @@ static int write_out_one_reject(struct apply_state =
*state, struct patch *patch)
+       memcpy(namebuf, patch->new_name, cnt);
+       memcpy(namebuf + cnt, ".rej", 5);
+
+-      rej =3D fopen(namebuf, "w");
++      fd =3D open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++      if (fd < 0) {
++              if (errno !=3D EEXIST)
++                      return error_errno(_("cannot open %s"), namebuf);
++              if (unlink(namebuf))
++                      return error_errno(_("cannot unlink '%s'"), namebuf=
);
++              fd =3D open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++              if (fd < 0)
++                      return error_errno(_("cannot open %s"), namebuf);
++      }
++      rej =3D fdopen(fd, "w");
+       if (!rej)
+               return error_errno(_("cannot open %s"), namebuf);
+
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
+index 65ac7df..e95e6d4 100755
+--- a/t/t4115-apply-symlink.sh
++++ b/t/t4115-apply-symlink.sh
+@@ -126,4 +126,19 @@ test_expect_success SYMLINKS 'symlink escape when del=
eting file' '
+       test_path_is_file .git/delete-me
+ '
+
++test_expect_success SYMLINKS '--reject removes .rej symlink if it exists'=
 '
++      test_when_finished "git reset --hard && git clean -dfx" &&
++
++      test_commit file &&
++      echo modified >file.t &&
++      git diff -- file.t >patch &&
++      echo modified-again >file.t &&
++
++      ln -s foo file.t.rej &&
++      test_must_fail git apply patch --reject 2>err &&
++      test_i18ngrep "Rejected hunk" err &&
++      test_path_is_missing foo &&
++      test_path_is_file file.t.rej
++'
++
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb
index 222e545f60..5865efada0 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native =3D " git-replacement-native=
"
 SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=3D=
tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build=
-.patch \
+           file://CVE-2023-25652.patch \
            "

 S =3D "${WORKDIR}/git-${PV}"
--
2.40.0


--_000_MW4PR11MB5822C76BA0862DC3A5254243845AAMW4PR11MB5822namp_
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
Reminder,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, May 9, 2023 6:33 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Polampalli, A=
rchana &lt;Archana.Polampalli@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-25652</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Git is a revision control system. Prior to version=
s 2.30.9, 2.31.8, 2.32.7,<br>
2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by feed=
ing<br>
specially crafted input to `git apply --reject`, a path outside the working=
<br>
tree can be overwritten with partially controlled contents (corresponding t=
o<br>
the rejected hunk(s) from the given patch). A fix is available in versions<=
br>
2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.3=
9.3,<br>
and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when a=
pplying<br>
patches from an untrusted source. Use `git apply --stat` to inspect a patch=
 before<br>
applying; avoid applying one that create a conflict where a link correspond=
ing to<br>
the `*.rej` file exists.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-25652">https://nvd.nis=
t.gov/vuln/detail/CVE-2023-25652</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a3=
4c13586e0b">https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a=
34c13586e0b</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../git/git/CVE-2023-25652.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 94 +++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/git/git_2.39.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 95 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/git/git/CVE-2023-25652.patch=
<br>
<br>
diff --git a/meta/recipes-devtools/git/git/CVE-2023-25652.patch b/meta/reci=
pes-devtools/git/git/CVE-2023-25652.patch<br>
new file mode 100644<br>
index 0000000000..e8cedfcf27<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/git/CVE-2023-25652.patch<br>
@@ -0,0 +1,94 @@<br>
+From 9db05711c98efc14f414d4c87135a34c13586e0b&nbsp; Mon Sep 17 00:00:00 20=
01<br>
+From: Johannes Schindelin &lt;Johannes.Schindelin@gmx.de&gt;<br>
+Date: Thu Mar 9 16:02:54 2023 +0100<br>
+Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it<b=
r>
+ exists<br>
+<br>
+&nbsp;&nbsp;&nbsp; The `git apply --reject` is expected to write out `.rej=
` files in case<br>
+&nbsp;&nbsp;&nbsp; one or more hunks fail to apply cleanly. Historically, =
the command<br>
+&nbsp;&nbsp;&nbsp; overwrites any existing `.rej` files. The idea being th=
at<br>
+&nbsp;&nbsp;&nbsp; apply/reject/edit cycles are relatively common, and the=
 generated `.rej`<br>
+&nbsp;&nbsp;&nbsp; files are not considered precious.<br>
+<br>
+&nbsp;&nbsp;&nbsp; But the command does not overwrite existing `.rej` symb=
olic links, and<br>
+&nbsp;&nbsp;&nbsp; instead follows them. This is unsafe because the same p=
atch could<br>
+&nbsp;&nbsp;&nbsp; potentially create such a symbolic link and point at ar=
bitrary paths<br>
+&nbsp;&nbsp;&nbsp; outside the current worktree, and `git apply` would wri=
te the contents<br>
+&nbsp;&nbsp;&nbsp; of the `.rej` file into that location.<br>
+<br>
+&nbsp;&nbsp;&nbsp; Therefore, let's make sure that any existing `.rej` fil=
e or symbolic<br>
+&nbsp;&nbsp;&nbsp; link is removed before writing it.<br>
+<br>
+&nbsp;&nbsp;&nbsp; Reported-by: RyotaK &lt;ryotak.mail@gmail.com&gt;<br>
+&nbsp;&nbsp;&nbsp; Helped-by: Taylor Blau &lt;me@ttaylorr.com&gt;<br>
+&nbsp;&nbsp;&nbsp; Helped-by: Junio C Hamano &lt;gitster@pobox.com&gt;<br>
+&nbsp;&nbsp;&nbsp; Helped-by: Linus Torvalds &lt;torvalds@linuxfoundation.=
org&gt;<br>
+&nbsp;&nbsp;&nbsp; Signed-off-by: Johannes Schindelin &lt;johannes.schinde=
lin@gmx.de&gt;<br>
+<br>
+CVE: CVE-2023-25652<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/git/git/commit/9d=
b05711c98efc14f414d4c87135a34c13586e0b">https://github.com/git/git/commit/9=
db05711c98efc14f414d4c87135a34c13586e0b</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ apply.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 14 ++++++++++++--<br>
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++<br>
+ 2 files changed, 27 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/apply.c b/apply.c<br>
+index eec2da2..442cf28 100644<br>
+--- a/apply.c<br>
++++ b/apply.c<br>
+@@ -4576,7 +4576,7 @@ static int write_out_one_reject(struct apply_state *=
state, struct patch *patch)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *rej;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char namebuf[PATH_MAX];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct fragment *frag;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cnt =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, cnt =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct strbuf sb =3D STRBUF_INIT;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (cnt =3D 0, frag =3D patch-&gt;fr=
agments; frag; frag =3D frag-&gt;next) {<br>
+@@ -4616,7 +4616,17 @@ static int write_out_one_reject(struct apply_state =
*state, struct patch *patch)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(namebuf, patch-&gt;new_name, c=
nt);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(namebuf + cnt, &quot;.rej&quot=
;, 5);<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rej =3D fopen(namebuf, &quot;w&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(namebuf, O_CREAT | O_EXCL | O_=
WRONLY, 0666);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (errno !=3D EEXIST)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return error_errno(_(=
&quot;cannot open %s&quot;), namebuf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (unlink(namebuf))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return error_errno(_(=
&quot;cannot unlink '%s'&quot;), namebuf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return error_errno(_(=
&quot;cannot open %s&quot;), namebuf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rej =3D fdopen(fd, &quot;w&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!rej)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return error_errno(_(&quot;cannot open %s&quot;), namebuf);<br>
+<br>
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh<br>
+index 65ac7df..e95e6d4 100755<br>
+--- a/t/t4115-apply-symlink.sh<br>
++++ b/t/t4115-apply-symlink.sh<br>
+@@ -126,4 +126,19 @@ test_expect_success SYMLINKS 'symlink escape when del=
eting file' '<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_path_is_file .git/delete-me<br>
+ '<br>
+<br>
++test_expect_success SYMLINKS '--reject removes .rej symlink if it exists'=
 '<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_when_finished &quot;git reset --hard =
&amp;&amp; git clean -dfx&quot; &amp;&amp;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_commit file &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo modified &gt;file.t &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git diff -- file.t &gt;patch &amp;&amp;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo modified-again &gt;file.t &amp;&amp;<=
br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -s foo file.t.rej &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_must_fail git apply patch --reject 2&=
gt;err &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_i18ngrep &quot;Rejected hunk&quot; er=
r &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_path_is_missing foo &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_path_is_file file.t.rej<br>
++'<br>
++<br>
+ test_done<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb<br>
index 222e545f60..5865efada0 100644<br>
--- a/meta/recipes-devtools/git/git_2.39.2.bb<br>
+++ b/meta/recipes-devtools/git/git_2.39.2.bb<br>
@@ -10,6 +10,7 @@ PROVIDES:append:class-native =3D &quot; git-replacement-n=
ative&quot;<br>
&nbsp;SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.=
gz;name=3Dtarball \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://fixsort.patch">file://fixsort.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"=
>
file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-25652.patch">file://CVE-2023-25652.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git-${PV}&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822C76BA0862DC3A5254243845AAMW4PR11MB5822namp_--

