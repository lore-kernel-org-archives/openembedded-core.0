Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB87E7718D
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 02:38:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.18612.1734835094324511432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 18:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=yGwXlLhX;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.76, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqQgax6bUX3XIeZyLkkeeICPHYdpZ0Fmv33oEnd3NFw69YNrUU1jD3ElvNcmffQI7NZbqofrucEmuhFH0nBuBHsW9PRM+LM6cgC8bUhDecQmP+fsjlHsFqqTyMf4lGOXXqsVGTTFurmVXnEYNOxfytYB6jXitYb3NY1R/Lr+ow2nXcDX+B2krRKw+fkZ+vLFQ2GjkRjp7s+b4O6aN1Mft2G8SIGzlNp4s5FchzwfjQG91+jrjBGbdspH1UBMrAv1FkBtJe4s6E+IpAqzLkXVgO6f8aOw2DG/bw7MN0xTiJVcgL6dgFFkNd0ZYPpKukiDkkfuzIKcZxsYCbvEaIRPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=pG28jAg5ICySVqIpXPzEgzK4RfXreL1DtYNOOtOt2SvjEKgCv4miKM1m3PxjIWzxARKY1c2OEme0Y9jL8wtb/NaTwjgg9ipU3IaEpViKFXjHkYq7sgPXjqSGUDmIKLOY/49/uVdtR3LKHXQcus+ycgDhc3WKjTOZmijbagXKmQAc+tWAq/6skTSMu9hM1bPHCetoL7irTNDU7LM/ztb9f+H7d2qvjlrL4L23XHYcNigL6oYJ3Sk+jGlpoFjZWXLd6DK5Hp20/njJfxGb+PAoQIx7J1u0OBjZJRp6zLTpUJ6gxeYDHnOdFdsiwYJWF7eimu/H4srHwWwTBeeW2bse9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=yGwXlLhXVg1UimaFlV18NQEhNcACiwct7nZGAaIRIiJXMiHSD/fWQ4PvwVucQZJt8voPAhrgmFLV4WDRxu6SIHH7gnVMwTylaFeTxhrbCJ8OFH80vTx1O+ypozqQ3c4bKRKtP9khV+FhU3IebWnDZDRjjW4bHCc5fLvmxXv97i39QV+OqUrTQqibTMS2T7M5e1xPdtcWhTOVrosZhUYA9aFBpmd42A1qCqrjwcSJufoV6Cf29m07eP0iX3WncehqbmJJnMMPWs2f/4SROEaRYu7aZ5N14HUrRJ8TdmK0O+fpnrqe9y0IJNNNA8UqIkdvPatLkuxYmqIeS6OKAyO8AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sun, 22 Dec
 2024 02:38:08 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 02:38:08 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 4/4] weston: Disable unused tests build
Date: Sat, 21 Dec 2024 20:37:09 -0600
Message-ID: <20241222023709.2233470-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
References: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: fc823780-3ebf-4c66-4921-08dd2231abb5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PIZhvS7tftW+5MGylKjJdunr2hINELWV1b8JbMv7Oi7OKi7CO5l01tkWIIn/?=
 =?us-ascii?Q?o9aSbVm3OzwQe2qmtCeOlUCKKT0B7frVGlQV4yJs/c9SeNV62LwiSXN5J7a/?=
 =?us-ascii?Q?Mk798Ba8uJAH/TnYLgkTmHfGm43OA9LQymoMQRWMvpRn1urVKe7PL6EEo5Kw?=
 =?us-ascii?Q?P1oe3ogApfYoNNupuFXuQW/JRILhCnTqiJDE6bCptBkayvdEL6i5HoxgTKky?=
 =?us-ascii?Q?3o1mZoByS17I32TfnCSdIwTKACIRyCbdfIvWXahb338MyxDDC/Vp5h+WyT1g?=
 =?us-ascii?Q?IUCuOb+ZBDRVN6g/e7Cr+CPnQqTFho02ZyZyiNJ6oAS4pFpKmZ2KOEFvFOE1?=
 =?us-ascii?Q?coz3RfFnYnb7fNN0cTu9xoxpt1ZQRcxjn2wgnnS9pUwOPekefdVIiFoit//9?=
 =?us-ascii?Q?Y4jfqh8Yyab4P34PvsNNWesgiQG8b8GpMCy3Eiz636heABGtopuAmjtpFmNZ?=
 =?us-ascii?Q?fSuqbFdDdF16NJRfA2Jpxf9UOBTskwlgA0BOwFDPhMgRDyInT/OygZrUD7Do?=
 =?us-ascii?Q?zxlOyZPD7lnfFRjzLBzlgsZ+FCnqg+dAMzOuHNPVa9yQ8e7jS2bJoBqwU/cl?=
 =?us-ascii?Q?wxuv+Li4vrye7woJwT+yEDRqe1UhAg/k8DLZELQ2K1sB9zBIoZOEjBFyFwZd?=
 =?us-ascii?Q?QkULvIGpYP5xEWc3szjgEZfzIGeMOod+OUU/O6nx7+PaRwudOHwncOc8WFzC?=
 =?us-ascii?Q?CIVsJ3oiyHia6OzwlWPvle0DYC2oyhWIP/UWE4R0TMdLheXBhsdvEXXs0SCQ?=
 =?us-ascii?Q?BUfqyjSSY0QH1Ku/gNz6l81z2ODpvg5guCY4pKTdDPH0emTugpSZNqb1BtUN?=
 =?us-ascii?Q?PYn1R9o0t5L1AYjnzS67GC9svLZgfa9tpk9D7OvIg3gxFv1/G1c1ItAMZO2B?=
 =?us-ascii?Q?5AnPAwmPvfUJERqX4ywDxIncXEipFm317JMW39hDDa9ZpppUCIJ2FGwIhFdz?=
 =?us-ascii?Q?/rPCF/n46Mn024F//eV9r5GyQPhTrROdnZj4d0j0fOMHspAKA9SaQ6tAlggm?=
 =?us-ascii?Q?YqyEQsdthOJHMZftdKJuiVHLQvf1Hz5iSCFEIsZ7yofvhDUbteMAjSGd/vPk?=
 =?us-ascii?Q?lNRJa5VDkqaaeixVuAkATqe3H9MwygeyUEsb/kavBY2ujaUVz9+kheilAHOg?=
 =?us-ascii?Q?WxP+e+jzHiccv/MzqOZgLd9NWucvGrb5XmQrVENaLFB2RynCnif/Ciekhdrn?=
 =?us-ascii?Q?E7naDhLxUOgijCRqILTpQrnTW4fkMftNVarAg/sPeyc/C4HDXAQFz2w8cBmS?=
 =?us-ascii?Q?RwyJ1hnBAgIDBKntlW5Viax1XjxVVoPnq89NJ8dS1pXi5nDjcA3XXecyU6HQ?=
 =?us-ascii?Q?gLAgl40QB4okrEAeSak4HXYQmigqq0DSDUj68cjwsw643J5chF2ybLmKK4uR?=
 =?us-ascii?Q?DtB5E4R77seB6rFh+H+7Cz463243CfEVfiAu4t2Lz47USPOyyb3NMDOezI/m?=
 =?us-ascii?Q?A5K/xq45DfyAPlMKVhxjQw+qemJ8lLee?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gsN1z10GZ485bKa8WTUe0dp5HzSYR270hcpakEdeHFYNWM7WI1ihFGzuSBmc?=
 =?us-ascii?Q?lh5YuzOnyl9+18lsoNC5dpbNN5CUysToDy1i5b5gSL+I/vwJgscbL5um09VK?=
 =?us-ascii?Q?r2pWCjIf3V5VT4wIq5S5QGdx+NDXd5haHUJQaH934BqEbNgZ+KvXoB6xebbY?=
 =?us-ascii?Q?IuZsikLwpm5BBb5vqm9O/4AgGg7E6DPVKosteIJxtwSCF6QbRUcIYuzAZSZR?=
 =?us-ascii?Q?fBd9OrT+oN83AcZHLmm1OtpwUTcb+J7ApYt8qrAEv6VA7H4G8kcuSibkygR7?=
 =?us-ascii?Q?7cJNeCM+yMYFx7CuUnzUunAmvgyetnRmsxlGtXe2oxcCiBauGr7DIBkLe8EH?=
 =?us-ascii?Q?3hYjMikIwWdWKVtj5nfJomcwkOs2Q3TDz+pDVGi6P0M3SsEVjBb7blBm598u?=
 =?us-ascii?Q?s6NUZ1s3hKJuivxPT8s801EKT1lVUZwYVhgR112NXecoNOxWx0EBe++WXXy4?=
 =?us-ascii?Q?ajMWgDLva3hmZ7FZ5kcqdNH2OSKqQtRwsuSKQ9XcvJJoBdcDMYClvk3ZNTz8?=
 =?us-ascii?Q?HEO3MDrG8VUZ6uduQ/E6gxFJnZcWYoOUf6CyBP1tyjW4hArAPjypus1dfeQh?=
 =?us-ascii?Q?xDeWBQ3lVk6XLGrTinS/Cv53NoCKziPQNqAAfvbqX8tJMT8vI+Zkw6GjgI4S?=
 =?us-ascii?Q?lhUD0MsqxrIajRqC3TaG+za8Qk20KJQhfAv263X0luYj49KNr1AVpacJeEl9?=
 =?us-ascii?Q?2H49FvVf3Dx8WOD1bBTlKJZOt1j1GHsUTEEY1RnHcBtD9RTnEcy+KUL/Wrn6?=
 =?us-ascii?Q?nb1MNxNEY5jvvMzmewdjLpLWlgnc5QIKD1sxd3ri+MLm4o6zIQhRl95f2khr?=
 =?us-ascii?Q?4PB0nUReSxvk4y3s4Vdx+dBxoshXRNxHTL3+FW7piFiE/KFM2DtuBiJtdu7t?=
 =?us-ascii?Q?iaX5Svo/zeSBwIjEbbHUj7PwzRQ3jU+ytQNkNomXbmCtFwgCWSafpqgjdatM?=
 =?us-ascii?Q?E3Tn2De+trVTbVmQ1i63dCKMen8NuTUjtqNIDia9j15NMxZUWaAq2DzE7Ptw?=
 =?us-ascii?Q?+xHrYnV0xzZ7BBbzXMfdkGlzKEuMKCoFS9XULpdXcdDTJNniW4TAL+GC7xFr?=
 =?us-ascii?Q?DMpqQL0RtyM0y89JiDQP7i9sINQozMNDQFwLaCRa7fvEOpaqW6kka2QO8Vo5?=
 =?us-ascii?Q?UamL8MoTXytwxla14R8cK5WI1SjALvW4e5JzFWdkKjSPc3431LN5UoX1JjX0?=
 =?us-ascii?Q?90K4N6+0mKrHuiH+SAm6T5B1cw0F8lowYDWhG+BX/1t5R89fDKGl7ZJoFDZi?=
 =?us-ascii?Q?NUCjNXamG3SAGgrn46srUcWrUjxsYeQUFdNVs5SQJLXyPU9XHiWfLNmvfbyr?=
 =?us-ascii?Q?4ptOIfN8uVrL2GpQrGvRWX5T+IrKnY9TzUdfFNqucrYBhLr+zzAOCxOKgDyS?=
 =?us-ascii?Q?hCMyIffx17IVQO9QQWfCMopGkKo3IWScDwcgMQ10B2YBdsaCKJnO0YVY+yrR?=
 =?us-ascii?Q?jCW0b0+0wLv+81xmQymB95yMAMj/dn/WxQnTzPvnfQUNiqE6zT8GMLCxrkyv?=
 =?us-ascii?Q?kuocHZ04eV/QkVV33U0+AOFt7gmNI+bH0N9j4F/xz/4eADMW/eVpuEgtvJ3W?=
 =?us-ascii?Q?TJ23LovRSAloC5ixIggrqncClfOCk+cRZcEI5GXnkaAeceGxN9d4ZitjNlCi?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc823780-3ebf-4c66-4921-08dd2231abb5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 02:38:08.6901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLYykV0UL2BVVjTqRLP+++BvuJxyjoDKD+Ijm0q+rWguDYQq4TV+sf6t50i9IYJYIpYzzs8yM6Q8s5mdrlL3lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208998

Building weston with core-image-weston SDK fails for xwayland tests:
```
Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor req=
uired for running xwayland tests
```

The problem is the tests folder is built but not installed. This
behavior seems to have been introduced with the 12.0.1 upgrade.

https://github.com/openembedded/openembedded-core/commit/be7da75827b4ffee3a=
243f977faad429dd9fa21c

Disable the build of the unused tests. Also drop the xwayland
dependency on xcb-util-cursor since it is a specific requirement
for the xwayland test build.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 4cb0ca4d5f..2a0a403d99 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -31,7 +31,7 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'lt=
o', '-Wl,-z,undefs', '',
=20
 WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
=20
-EXTRA_OEMESON +=3D "-Dpipewire=3Dfalse"
+EXTRA_OEMESON +=3D "-Dpipewire=3Dfalse -Dtests=3Dfalse"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'k=
ms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', =
'xwayland', '', d)} \
@@ -72,7 +72,7 @@ PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=
=3Dfalse,libwebp"
 # Weston with systemd support
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd dbu=
s"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xcb-util-cursor xwayland"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xwayland"
 # Clients support
 PACKAGECONFIG[clients] =3D "-Dsimple-clients=3D${SIMPLECLIENTS} -Ddemo-cli=
ents=3Dtrue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
 # Virtual remote output with GStreamer on DRM backend
--=20
2.34.1


