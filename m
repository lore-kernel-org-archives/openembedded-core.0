Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35590C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:10:37 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web10.1217.1707415830756337164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=AleohnM3;
 spf=pass (domain: ni.com, ip: 40.107.220.82, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaPDOS+fRitwZwpqZ9cquwZbjO5sfOoh08vbzuaYBwQZIAGsDr9cWOnybqWB0Pb4ohYY7Q+iT58eVzYkwxweRY8zlCojfHxqUwufNYNNnRw2ryVbWO11jVNhFJ356Ld+o4b3eB2fMS4f7Gj/2arIX5/h1e3H6tjvaXEuu8nOE8ECQLL7gQLroLCii99U09N1N/jiNrw0/I+MLP5Jnhyn7NvMfXqlF7GlKeYioBoZ2Sk4ti5MovC17JPSotLmJEDJQfR1/WK2+K9IHBcvEJUnZSoqXgUexhv1PSUA6FavGzMBU6N7vKljc5FmkDElfFJUFMbbzeW7QRihOwLsMG0ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69mxIpBFQmi6sOeTx0IQ4oEkbGt/7/zqJQSRI3vnvi8=;
 b=oCKA0DXMiAlpu+ZZmnru3UpAMVFc2nFyHfcEpxcxtK66iKAQ0kkeKRNP7fZlbgXSFMFaiMl0laMD49a3dT5tQm0kvaAA6j7zJi4TCU7EZ3AQHB7NkLlV/Uf7TKt4zZrGa8FijUfBu+OPJYTM/nymkbDbm7K3rtFjWP9nwTtd/y4p0gbt0AMBs54U7yEkfxb3yQDurZ2jIRaAMztE0SqVFdk3Bw8dmTUcgulZo9ORVNIlyYP9RbtTRkfTn8MWW2AYYMNkcisD466ZEeBSG1ri6YDfzn0PxWPmzH88h3Z7riB4E4snNF+/9RGBuXaxqHzltGxI2yKBPpBucs/p+K6b5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69mxIpBFQmi6sOeTx0IQ4oEkbGt/7/zqJQSRI3vnvi8=;
 b=AleohnM3VVVdcfWLo9Q8ERIqKwuzr2g+PelGd4NlreatD9Y34jcRlJ4G3vAirgOq26EfaJC7c8hBVX7iVSDrH2kpsGfwtZ73rFMom/eo+bcMYch3gXnoqe9Btr3ktuy3qytrWZ+/uB3xGng2mjrL8Zp/Zs0m49ce58d0CahD2lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by BL3PR04MB8203.namprd04.prod.outlook.com (2603:10b6:208:34a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 18:10:28 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 18:10:28 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core][PATCH v2 1/3] opkg: upgrade to 0.6.3
Date: Thu,  8 Feb 2024 13:10:07 -0500
Message-ID: <20240208181012.1019913-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0128.namprd11.prod.outlook.com
 (2603:10b6:806:131::13) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|BL3PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e7d14a-ff97-4bd4-8307-08dc28d13ade
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kC1MNLezymnFD5a15qWzg7SutejfksBymvTlICx6qNXM7MBU3vR2gaox62wn9wdRYCatFk7CcChcYIlIg+puyRJXl2Dh+S2DI1DFu4zZF5/RiQFpMq62HJBobYge6EHTj7B/hzgcYtq7wx3LIp5Y2frRtcttM31kKc0Ak29txBMvXmzow7afpsGWk85DpJ2tcirNrATtpCS/7dIzWtvZBkqj9ABlF4ZVdtyZ8jtrTQQ/QJjzFV41BrDO11CwV6ZqKMKSbmxcapJ52PDYQ/mJk8uWp3dI9Ykc5CpKf/7VuFtlb4qJWOQ1+vekMlXV+DH8l5Truvw+SpYgirEZKQ3+QFIji1XmoJ9YcWdDhmQzVQnG9Re9HmhF+A39beGFFr1iU77zq5Kpca7/UMl2m9e9PeHHlX4kazR2NWrq7eNvoec4jYmF7RnAmPRSEglVWMnKLWUAqrny6XlEUz8TO2uzI/nqKFiSQTAJCrrS6PtpoSq9NCF3Tel0r2LoM6V2lK1YKs/tmhs7113dKZcphp7CLN+HqGP7t9Z/P23ZCtJ64ps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(6512007)(316002)(6666004)(966005)(4326008)(66476007)(66946007)(2906002)(44832011)(6506007)(6486002)(478600001)(5660300002)(66556008)(19273905006)(86362001)(38100700002)(6916009)(26005)(2616005)(8936002)(8676002)(41300700001)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezpySRdNFhUQnk0+DSdrsSV7c+X6KwZfvZdZehn3sXlv4VKs0+3Zd+fG/RbD?=
 =?us-ascii?Q?rl9/024NPcrai8Y0MphOp12NkEREQfRPW9URUihXtWqeECvMnAuSlQfmkxID?=
 =?us-ascii?Q?N3cseh4SL8l7+YMaBvNVhb9qLZLfkKPB34rohjhBUXXj93PpHyKUQybCFmYP?=
 =?us-ascii?Q?lTSG2qJugZZd6LibXBLg0CG7gCJx7pUnYNQpexyzx1XzEveO8rz53EGpkAt2?=
 =?us-ascii?Q?XSC+/aP09+t3SApf7JN/WynwRfE38t00AW2x0O/0rzt2ATAfLJRlPgUBlBiL?=
 =?us-ascii?Q?V/EzUXmY+C2TazPj3XMoWz5JnH+ueIHKruprDUno38lyxNJ22MU8FyCI3lXG?=
 =?us-ascii?Q?y9sJO1lfBc7mML1wo/261wOqBAsBTV9aNeJ83mF6CxMWN0tUAMvTUexQgGmZ?=
 =?us-ascii?Q?GnuvwODpDzl9PhZ/sVe5AYQiu2ashx341YURW8NC2A1PYzeuwVNmZ99fQZfA?=
 =?us-ascii?Q?w3gHJgM6/kCE6AZTsm+lAG9Pp436WCR8hlb1QlduFPN9eNp2Jn99K9Wok10w?=
 =?us-ascii?Q?1ZMu8gi+Bvfxg9Je+66R2Z3oos5X99SkQ9E7QC7H9HRl+QM6CwVHyinDiHBP?=
 =?us-ascii?Q?rIkJhljY28rO9t2HRTrVTrp3W0Im7nCDbN0XEWbbSaoEjpEkh+hLEAOKHxnp?=
 =?us-ascii?Q?fvQZA97bOEGtqTx1menVI72q+l2DFRPGzRY26mmBBg7ESIH/nK8CWiXXIS24?=
 =?us-ascii?Q?+L6riHkVkwYewA1s9g23ICXHQdbtYIdKf3zXL4LCTXxz26mKJ82rLgnwNbmn?=
 =?us-ascii?Q?2rcUpeD5EU9gnVoNSiVpSG79Ba9WzXkVpkzu7AKlBYPcJkz4nMtnd/F3/O5d?=
 =?us-ascii?Q?T8uL7TjDk0fnchOLDuA02nisHXzpGAFrtejW7zV+HMPsmkJ1scNFjVl7A8mF?=
 =?us-ascii?Q?PJSAlXWhS0SfmjyW1TuNirEIBbhk3aU6a7dTF+sOpvB0QSZbd3PN4gWGFQqA?=
 =?us-ascii?Q?A65UET4iFZXZxVN3N5ptRRbIqYO3rTQK/mpycWMIEd64UXl2CBoZ10kujhau?=
 =?us-ascii?Q?v64sLSnvYNJ5pzDKMpP4P9+ryZWecAqdT2YgZC3nGt256YgjEbZVg9dDpD8U?=
 =?us-ascii?Q?4SwFFtJ2ux9W4VK2EAsdcDqI7SAFP7R29AjCEq2ebHDmyXWdjTy2E1mb64a2?=
 =?us-ascii?Q?EX0x6qEqU4zlQ1P3WquVd/9mi3RQR/qnciTxjNirpnn9zbGwl61rTRNTMz4H?=
 =?us-ascii?Q?AOSiWealdUzLlyfgcmQUs1WSOoe/mqlf/yv/vxFuFxuPf9NGDF5RT/f36yVY?=
 =?us-ascii?Q?uq2fDhIEPXVEOUtNgCf5Di6JoBNOjar8dChJMpujhYcSDd6o5x+Y9GHkkY+9?=
 =?us-ascii?Q?goFjc0MoKdVchKelbvHozwcSo00jbAm4OgMtUwnKeBvxTPrnhk/WKWf9agoV?=
 =?us-ascii?Q?hRjP4jDELG92WBD/I3PnJXOm1RMjTrXf0r7REFWL6rXPhqtqVh30f4gtLt1A?=
 =?us-ascii?Q?xc2FR2o/vBaX6fQfP+Y6nWM9S4YLsdcoU2EsN6kuH1DM/u9jlnqbtSi6n6lq?=
 =?us-ascii?Q?zUC2wtrIo+YvT+pXpEjsU3eFqS7sPp99G2eEvG5ZpNm0Xk3jmOAhGv++nT2n?=
 =?us-ascii?Q?aiGMmEcd/7BlLLQ3XboGggLn2N3kYSzL080aWE/6?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e7d14a-ff97-4bd4-8307-08dc28d13ade
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:10:28.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BG8S24AhZVXLci1NPFc2E5eeMVDdeI/UrH0yEhwnp/mS3PRTHP3F9LAEej2is+KNKrIf9qHIB70X9KXdCPHvlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195168

Release Notes for opkg-0.6.3
=3D=3D=3D=3D

- [Added](https://git.yoctoproject.org/opkg/commit/?id=3Def743b75745939df21=
0a9e6a70a44d69181ef05a) new configuration options to enable preserving ACLs=
 and XAttrs when extracting IPKs.

- [Fixed](https://git.yoctoproject.org/opkg/commit/?id=3D9e62a38a4a52974007=
e9ea174504c42069da1a02) a bug where some library locales might mismatch the=
 user environment. Opkg will now consistently honor the environment's local=
e.

---

Updated recipe HOMEPAGE and BUGTRACKER links to reflect deprecation
of the projects' google code page.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../0001-libopkg-Use-libgen.h-to-provide-basename-API.patch | 2 +-
 meta/recipes-devtools/opkg/{opkg_0.6.2.bb =3D> opkg_0.6.3.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.6.2.bb =3D> opkg_0.6.3.bb} (92%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-p=
rovide-basename-API.patch b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Us=
e-libgen.h-to-provide-basename-API.patch
index cff091fabf..61581e752b 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-=
basename-API.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-libopkg-Use-libgen.h-to-provide-=
basename-API.patch
@@ -12,7 +12,7 @@ dropped from string.h [1]
=20
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd2248=
7bb64470881e86a92e7
=20
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/=
12]
+Upstream-Status: Backport [74fc3a991f974095644897d18d43846b5f359dae]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 v2: Do not override basename wholesale
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.3.bb
similarity index 92%
rename from meta/recipes-devtools/opkg/opkg_0.6.2.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.3.bb
index 71c0b44aed..1f15c44e3e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.3.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "Open Package Manager"
 SUMMARY:libopkg =3D "Open Package Manager library"
 SECTION =3D "base"
-HOMEPAGE =3D "http://code.google.com/p/opkg/"
+HOMEPAGE =3D "https://git.yoctoproject.org/opkg/"
 DESCRIPTION =3D "Opkg is a lightweight package management system based on =
Ipkg."
-BUGTRACKER =3D "http://code.google.com/p/opkg/issues/list"
+BUGTRACKER =3D "https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=
=3DProduct%3Aopkg"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
                     file://src/opkg.c;beginline=3D4;endline=3D18;md5=3Dd62=
00b0f2b41dee278aa5fad333eecae"
@@ -19,7 +19,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
            "
=20
-SRC_URI[sha256sum] =3D "ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a=
53fcca474adbd5"
+SRC_URI[sha256sum] =3D "f3938e359646b406c40d5d442a1467c7e72357f91ab822e442=
697529641e06de"
=20
 # This needs to be before ptest inherit, otherwise all ptest files end pac=
kaged
 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
--=20
2.43.0


