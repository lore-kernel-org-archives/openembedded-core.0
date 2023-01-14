Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F94C3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 23:50:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web11.129753.1673740197788281905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 15:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=Mq1vXxq6;
 spf=pass (domain: nxp.com, ip: 40.107.20.77, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Osg6RZB7O8Z6a7/nCdL2VauFrzrHzsYgAd5mHD9w6hNJ3roPxn1KUeZHYRmKkSHhmBo4Ts0h1N6RW33SaWZDeP240kid6R3mcOwC8K5VwVQ0tA8pITBu94M38uvPI54E+w0DVTiGX85uD3bn55r5D4eVWnJFzVtNw9RSA/6OntdZXvne2ee88CgwUN8aPftG4Q590b6IY3G8Jn2zha6+xwDC1VcfwlO5h+7hC9kM5gW1BsvOoeJi/c0VRBsZ18ifwLJyRgxXg+DT0loebZQ0l2yt1WXks8d4sQ2GeKiku70QsJ8p8Vg/qL1+CH0l+MVz9PuWhUFuYrjkISo/kppbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs4Zjq+7mN60KxCXclsJqVY+oHvF8FWOtlk81x0xjcQ=;
 b=PNbuHMS50BHnwf2OFnSofGztBqupi+DK9zmbSfn55pEdUGWNmQD6AmNY75XwMlpnO9c7ax6WF3VOjkIv8iA6CyTjiBZoygnmByK2VU83BtWn4/Uta966NQkxlaU9pnhHqAOvjPbCslUvwsNsCFzfDlWY7s98GGaqSfkqpKTLqsqVUsqdhTN4QrxrVGV8BoRo1ocYV5hC4uue6dFD0QNqcBPkPXDBrR6HLkRjLjuYOi8LIkHvHeYFAgLWKctsHYqMqzLBqsw5j+Nk4RwyIv64C2W527WDLa1ffPv1iNMpEe+9rHdj4n7Up176NPcNadOJz2B34IYEBQBKDUkYrI9hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs4Zjq+7mN60KxCXclsJqVY+oHvF8FWOtlk81x0xjcQ=;
 b=Mq1vXxq6zGLwrk0zTXs7Tp6zm0ELWANIWyBypoA8o+vAwjXwp3uq4x1aBu009sI5MIq3Z7j1Cf/WNrUBhQ61wMd5v/2+aGFm6SiTGvtz0I7vLYguvMe46DttFjWL5QqUw3L5Oqj9o8sRZe2FepnFUUtDxqAi6q5/KlwMk4W3V/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Sat, 14 Jan
 2023 23:49:55 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::19e2:4060:1e8e:719d%6]) with mapi id 15.20.5986.021; Sat, 14 Jan 2023
 23:49:55 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup runtime dependency
Date: Sat, 14 Jan 2023 17:49:36 -0600
Message-ID: <20230114234936.2242153-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c9ab19-b231-4b92-16d9-08daf68a0955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bdLEeC1i1uP74hNqpaAdZSoCHjAsHN605EAYooJPh6HC4uuUsBDOFFnkGkSYniKkyDWHiPFKgeR8CtBAjWmT8kll3DAEHgzvawWxC8YuJ82k7Y0Xte/OZL2KPCKvAg2+Rwgr9ZhCtTFS3CsZayiF3Zd5Y57WELbw29iPxTMz9MCy8G+qfjv3wGo/x4JzbmPFc0BLtKVf2lBV8ubqCKymU6Eedv3X0ANDNT9adwIU85TXdajZcCDj6Y2SMryBU0XgZc1bTQ2gyWk953pvkSKpMx6CJHauYqNUc0RN3Gm7D6pPQQhK0gful/NHZfwfTcURR9YXEBVfcKGCSmV+s+zmbSM6Z668Yjlrmjlc5NuYr19vYiBcdgZF9fEUnHhrqmx8JKhAbmI9bUs7qStTHii7E2JnjKf8ZT8tubiJdW1h/rFDNX/flzSp8dC5CaYannd6+KF9vgDzQ0i3XUzbMeLZ3MxCyslpCZNOqRyHcCoWPmohHsgr+Nd5PtQk95i/4L2U9UVFShyFOjyp6VgkDkrOrOcWZ11Tt11XP0I4T7d+3bHSZwzENZInORo6purGyyw3kdfkuar++jNJZzbrcDdRqiJprG62Xi8kDItd62VtYbs23xQIuWnuDIL3YThZCBRXARTe3fWmaB6hRXfA8Gzqq+VDijztOh6IGhUj5Qp4WJ0UiW9aBH93dQ533UMw0TCp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(6506007)(36756003)(6666004)(2906002)(5660300002)(44832011)(83380400001)(8676002)(4326008)(6916009)(8936002)(6512007)(38100700002)(478600001)(41300700001)(6486002)(38350700002)(186003)(66946007)(66476007)(52116002)(26005)(1076003)(66556008)(2616005)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vHXY2nqcls9aVJigPPSSgdJKnqROAPb50wVN9jAgy2snwDYCwywhVwNxLcRB?=
 =?us-ascii?Q?di1Yn30am7oG6+ndm9ZpGfi1UE0Epg010lUA/e/LRU+K6bs05ZHIIj5P5Evw?=
 =?us-ascii?Q?JWTX0XmNW0UhLAgdafUuFvAfzVk5hSllikBE3AuOzHG1izDOd0btsdg5rxQR?=
 =?us-ascii?Q?hDejAmXBQVvkNEP5ye0YGUxgAeupir69MKI9wJ79yhn/jfif5SOwXbotJXtN?=
 =?us-ascii?Q?QQNDxXxVMc8TAV+i7HOzemccV/0aBwCf8VR5HB5GCdhfr+9oBJ41o49DaKCs?=
 =?us-ascii?Q?+XYBvJD+8P4eGbbQai2Upet5oYMb3wk/EF9FiZBoBQITsNaA9/Hrb8iUyk1M?=
 =?us-ascii?Q?yl8REZJFopBJC4dRrvsSJ3OJq0AUqXjvA93lffpwuUdIED3t0uBPyF6EghTW?=
 =?us-ascii?Q?ZvSWDBE72E7hnqkqNd0LJso0rSE8eRje4FNpv48WtZpWjUymgAwA2QnZURlB?=
 =?us-ascii?Q?2/aPIpZTqpNz3vcxn/i8fQ3CW3QZ6Cb/mSEaguKGmqq4esne9tgqFIpGLjko?=
 =?us-ascii?Q?xAGKawMyH5FakTJoPd2Fa5j6C9wJ8o932PMPqULiRnIsKHVSdPaxxVTfdr1d?=
 =?us-ascii?Q?JwvMZXZgnuu2KEe+FB3odE/hKI32KcHeQ0KNzejkzn6lanXITlxOyYq8m5i7?=
 =?us-ascii?Q?viF+EGHrsXvo8hdyIvs5BhIEfE6F98Xw3O2ycnptcsM7mXjUP5qYMe2eH5rh?=
 =?us-ascii?Q?65lX3yf0bC16H67V3UkgeJrUpGDIaDUaa31n0unCLj44QlxjpEhlJNy0sDUS?=
 =?us-ascii?Q?Qtihymd/a9eBCJq+9a6P/b3TZZjr9s+pANMku1i0/XyWWTvV2VQKvLlKY76Q?=
 =?us-ascii?Q?XIttmC9cBOhc//QpgvSt/rP6PIONH14eFW0nWv0zYFN9DXnQq0E/IlAArsgQ?=
 =?us-ascii?Q?sU7RBwd3zCqrMERJKeao9C+CDwRo9f5B7Ul+1hXSq4p2PMqKWKBzTVyAMxQv?=
 =?us-ascii?Q?8kn9C2Z+wjU9wOET/7+DMun8WHMtNoRRGx2YFEvPOKe5bhoKXdK7+igY5wGt?=
 =?us-ascii?Q?BM1atMoOD0ZwQYn/AzKqOWEfhasLrCqP7kiL9kMd6j5sIHXC6zjSNcH1V8hg?=
 =?us-ascii?Q?y3s6XalJ013oN9fiR0gyFoSYNTyUPTbfnVZzWWgodFeKmDpiB4ju4WOfMZPC?=
 =?us-ascii?Q?HvfFg0oJKZLrV3k28siCiAmy4hEgKqvG0GSD0AlTGs++tq6I3KuX01/pa0W9?=
 =?us-ascii?Q?UVRIVHHDg1hLRnW5+7j+mya9AhuxRuSKbedpMpwVJpoXQVZLoNEAcqr/UpGn?=
 =?us-ascii?Q?jjcZUp2qpTEKGbM3ocLsn3OUkO3hvXjEhztBNVquMCmewUSTYOe/C1dJyPFU?=
 =?us-ascii?Q?wZQtrjoif01ADlA+yt3U6ZxxcnN7PDkWXH69VWmXjizZyJwbFNxoj0Js6D8Q?=
 =?us-ascii?Q?okBqmWvI2Sagkm5HbxNd/ZqQM3Fkdpb7HDl+F46TCJiBVfCt3HqmvEFlkhil?=
 =?us-ascii?Q?tAmHCK2+lHObI3eHANJSJcJXGY5PclV5kBnop/5h9bsicTlu0riO4i0EAAiF?=
 =?us-ascii?Q?UQynjctkPRmQARFbxJZTXwGwMrNPYDCrA3Su6rEsY6WkCsymANiKxXIa85qJ?=
 =?us-ascii?Q?g0hRpBK8SxIiGIsoHRhZ5ud+nsJjgF8CHdJu3gim?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c9ab19-b231-4b92-16d9-08daf68a0955
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 23:49:55.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0ZvPfkifL5k5AFxwe1dr5LMDvvXFeLYwnJAut06GI5DOKwekOcThHkTOKWLc55czjuR3Vk8f0dCu26WgIb4/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 23:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175860

The runtime dependency on libsoup set via PACKAGECONFIG does not work.
The problem is the dependency is placed on the main package, but the
soup package has no dependency on the main package.

I considered modifying the call to do_split_packages from
gstreamer1.0-plugins-packaging.inc, changing extra_depends from '' to
None:

```
    extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
                      all packages. The default value of None causes a
                      dependency on the main package (${PN}) - if you do
                      not want this, pass '' for this parameter.
```

However, the problem with this solution is that it does add the runtime
dependency to _all_ such split packages.

So, fix the problem with an explicit runtime dependency.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.5.bb      | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.=
5.bb
index f7ade89ef8..ce2a796928 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
 DEPENDS +=3D "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES:${PN}-pulseaudio +=3D "${PN}-pulse"
 RPROVIDES:${PN}-soup +=3D "${PN}-souphttpsrc"
+RDEPENDS:${PN}-soup +=3D "${@bb.utils.contains('PACKAGECONFIG', 'soup2', '=
libsoup-2.4', 'libsoup', d)}"
=20
 PACKAGECONFIG_SOUP ?=3D "soup3"
=20
@@ -52,13 +53,8 @@ PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,=
-Dv4l2-libv4l2=3Ddisabled,v4l-
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg1=
23"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulsea=
udio"
 PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase qtd=
eclarative qtbase-native ${QT5WAYLANDDEPENDS}"
-# Starting with version 1.20, the GStreamer soup plugin loads libsoup with=
 dlopen()
-# instead of linking to it. And instead of using the default libsoup C hea=
ders, it
-# uses its own stub header. Consequently, objdump will not show the libsou=
p .so as
-# a dependency, and libsoup won't be added to an image. Fix this by settin=
g libsoup
-# as RDEPEND.
-PACKAGECONFIG[soup2] =3D "-Dsoup=3Denabled,,libsoup-2.4,libsoup-2.4,,soup3=
"
-PACKAGECONFIG[soup3] =3D "-Dsoup=3Denabled,,libsoup,libsoup,,soup2"
+PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
 PACKAGECONFIG[rpi]        =3D "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisable=
d,userland"
 PACKAGECONFIG[taglib]     =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,tagl=
ib"
--=20
2.25.1


