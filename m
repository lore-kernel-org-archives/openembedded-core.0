Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A516C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 14:59:55 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.95])
 by mx.groups.io with SMTP id smtpd.web11.19023.1717945193789262416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Iv3pcods;
 spf=pass (domain: navimatix.de, ip: 40.107.241.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIn3K24tzUIZ1IMmRZvodVkHa7E/feQGEARuaPeOPmiVwU+xGfLkAbCXc6PjbF7RqMwxYxEVa+5DVCdCpmstfMvZOvTZBPHReOW9QAOmKFvgCSAKU9CAk3rsciYU7MY3srrQdinSTRu5p6fzfr3nI99IxDxqg8RdCTDzmJ0UbRXHHXa428oUl/Qv+phh5GARvSGYXX5iR8lNXfMnDGjW6k/58zsVWLfWebxiF4fV+egElZE4wdheYP6SdBK9uBh64FbODM0SaFAxNi2MZiy7JmiivqCQ+iBWg3OmECUUeBrEiRXeHRik2R/medskXW8U8JxMQ0OeqlD6hXwk3HwVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4F39odXysYeFN/0ofg0IJ4VhBEPF5CW4yDD27vjKfw=;
 b=V+WGxL7eeTeWwzPOvQwZFK3L7fVJZupVtHpuEEGpS8EnV2u8UMKWGxSBaQ2CB9dMe0klrcswduB/jvcOXSNTB3Sam0BW7IwQwYcZ0q88hUlNslC/owrfzmktD8UZlTStAS0M85a+joN6V10Prbck33FzHkQxPDb7mxOhnuRUfp/kz93vcr2QDYcVDqcfcxGa398dRg6wyMGsnKNFxM0bd3je48ryR4jNHo6EJSwloPMmLdyXiFsieYbC7OdB9rJV1BmWRuNudzxa+glLpPEDOFPZzzautv/5gS+yTSNlmURFmnCpRxBDiEVEElIvQk5MwrNHQ9RU62wuQUDczUmLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4F39odXysYeFN/0ofg0IJ4VhBEPF5CW4yDD27vjKfw=;
 b=Iv3pcodsn47KGRRCWVNIASdBuA6hvP8DilNMjMBmJ6vOE56QrWsdg6NfgfNwBwsuxbJCpM8V8lJ8RFT83LI72AeHrc/lWB8buFCmeYNveewU4hN4UD4m3gdcQ8OM+ZpMtSO8aqWVfe/FrSW7qC8+/9c9mhxsmVPlvX9+pOEJyJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB8780.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:40f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 14:59:49 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7633.036; Sun, 9 Jun 2024
 14:59:48 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yanfei Xu <yanfei.xu@windriver.com>
Subject: [PATCH] classes/kernel: No symlink in postinst without KERNEL_IMAGETYPE_SYMLINK
Date: Sun,  9 Jun 2024 16:59:07 +0200
Message-ID: <253b79c0a1256b3d6d7a5164bb9b605db0da2402.1717945107.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::13) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0721a7-f78e-44a3-f034-08dc8894cedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rV0f6kRPnDvBihr/PGoaQDzgM3nzyuhRyd4ltHtpgw1gJ2O5uqVa8zuWyWMv?=
 =?us-ascii?Q?9cw4/p5KqgnSyMfVP0+64o8sNqt+gJ70RKRefuiTGUb/P/iR7Vtgek7hGKLV?=
 =?us-ascii?Q?AV+Xwmbr9+MXWP3YJDt2gdJQ3SkB0t2n56XzsuVbOHPINd+/PXwMo0Gwi6ID?=
 =?us-ascii?Q?66XGlxxDg64aG4JCa420nngfRA1V3Zl5U2G7IFbUn6NpRGbv2+ZTdx5FeSfi?=
 =?us-ascii?Q?mYdKzJbjtv8qWYRM4vC0bdPXB9lQ95DS7xKbpSZkWspVh4akhiiLtIUIr30z?=
 =?us-ascii?Q?v61KWjLzbtzVHHkvWDtMHq73VM/TKlE6New/UlEVrV9Wqph2eh5HNKKLCWZs?=
 =?us-ascii?Q?N1w/EVijWFfuUXehrYvSUh6DoryiEtRLo+GRGu930P/nby9f1i+MhR/O/pVR?=
 =?us-ascii?Q?gNusB4dWW7I3QI4e6EUiao/zQfh+1tKFpi8VC7Z8gWuGbymawUsGh37noAWY?=
 =?us-ascii?Q?eiOX2hX00j7+jZMrt2FjYUKH30Et6pphVNGUynaHDr84CtYYSptPQkzvDf/R?=
 =?us-ascii?Q?0syxrIKx/E4uVStBdf2eglxSWJ2YrF3WYquOvfMX501+n3ajuDpT0uWWLnNm?=
 =?us-ascii?Q?uRnY8z+3hSbZDZckhq+bT1WDH+jof3Zy/QTm8qQOx3cnCzB7dewqknpSr5/w?=
 =?us-ascii?Q?oIWYNxoOr5ku6vXQ7ncsyDwmcMEwV2bkw918XbuvdH4GPOj18SKhiyPVzP1K?=
 =?us-ascii?Q?HYB3nrh0SmUOJgUINlT4HrGbsVitosK0GQQAsEeR5koJHzXwqMFWXpG0/M3Y?=
 =?us-ascii?Q?x1p3oeCRLEtOZZU8cL/Bcc/NzOz/RwiTuWJG5x9vtOaOi8p5unTNTIx7RI3j?=
 =?us-ascii?Q?TCUohrDaR5FK5Y0rjfGoTqX0mAViP9fjDMoN6ZkLCXec5nKKPeC7xWKYc1tl?=
 =?us-ascii?Q?9sM2treN3THV9JHw/fdYnR+xVwcfl2Youx/nOpFg9+GjWi+JvsXNDLDLeKyg?=
 =?us-ascii?Q?t/N1KzXQ2tv+WO4rhZ+UeR4wChybffeoVoGQbW54HOE44AB0/XD/Zqa690Ei?=
 =?us-ascii?Q?sLQKKLKDZxT+pDAWbCpK0U+ATne32GY8ja/lxTkyYjdZyAXbdk3AIBz3Kb0L?=
 =?us-ascii?Q?dl5t42fgqv0Fhsb175JkEg9Ihkw9C87VVFM1A3kWdhbyDwPZZiwyZe5neshj?=
 =?us-ascii?Q?3aVmrim0zLRPbjJn4A97O5PdQdIwrbhZJhzyNgfMYsEG4ET2upxBiDj5VGee?=
 =?us-ascii?Q?agPQg3leAthQ1+uo1U6k+634P1tWuRo7961sTpI+zCZ3oH3IeiR8/3x1jLhO?=
 =?us-ascii?Q?dQ3JL/LqTnh0UuxIEAiTjDJ3F319b+siqmFSALsaacxQwUkSpilZNTmY4z9B?=
 =?us-ascii?Q?mTdJG8674l214Lk8N0cAniqkeWYGCVfWVFi/gk0wCGPG8LawC40yU53ZBhGK?=
 =?us-ascii?Q?y+NmqUc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C+LJdNfWEVHnEyCdradx+GbU9v1PPomtdjMtys5WQq393gPH7rTSKtrFOMki?=
 =?us-ascii?Q?9dwMIVrhkgItxUYWqVIfAY/qt/90PpDbFGHbeyNIQYc5jsx3gVsF1pUEbig+?=
 =?us-ascii?Q?92bKmpL6OIbl1ji3Zuwj5DHdqcI5BacLxomq8+nfQnHktPgANc2EeSTzVKiv?=
 =?us-ascii?Q?b8UZQRWHZWZr2jVimJmeU3k9GL5chu6VFWHWqhGj3D4G2GuG7z0IDqMTMMrr?=
 =?us-ascii?Q?rs+cCSqwYDM1e+tHN4hjl+wiYCLTN3M8kkfgsNNyDB6kq/+1Wjq2ZWHFGtla?=
 =?us-ascii?Q?w+ZWBgp7CrOD+7EQzJcKgbEGHB+Hjq4XNRrQHciHl+KfhGosGBg8XfvMQ7ub?=
 =?us-ascii?Q?78aO1w3xfZQjurQQUbs50t2b6Yp9Rc4iyTiJuujJYn3ScRWlRYoq43iHZ3qT?=
 =?us-ascii?Q?wks85Bf4Y0Qg9B27Jjd6ELm6dEM7jjRbVBZPuhLKDKfyScmslUe6zpy1qGRo?=
 =?us-ascii?Q?gNFXolTA9mzOLIs6WIbLBSr5yRREP2YXnq1RZHh7VTjUEC+tWdH4A9BoZTdS?=
 =?us-ascii?Q?+ko19NK3SJ+3cRtRbf02Tu4b/6IjR4YZ7b5yAhHnjrMLkWWwB+9ccmyfcMYj?=
 =?us-ascii?Q?xNXx7DOuJ+huIZ6e9WkKvgV2a0tqztqTBt06dHxPIz+mrvWXJ4Svf8sTI7qC?=
 =?us-ascii?Q?SId+1z66C+bhtsL5I77UV2VUV2Z5Ylqr3L8hjwUtY65t0ik5XuBkRxYYpT1S?=
 =?us-ascii?Q?YAtifcbkM6aJs0p3pCKUfWWvaLe2NpPA/70X3Fbb6z2poNM24E5J+pgPapwi?=
 =?us-ascii?Q?0t5vT3WfKJ8uJF4NR9Md2J6A40eGKdaFSib6OKEeiZnktWo6kY6mGJF6D37Z?=
 =?us-ascii?Q?SbfLyWzwXpGl42S2VfPM8lnbghuiMmf6QkQWtyBQkxw0HcFDcCxiJS1b+16b?=
 =?us-ascii?Q?IHzvjZW6hqWQpzazxQha3nUR5m97N9312MAmAzGa4EPRl9+Nl8az7kYEAZ1O?=
 =?us-ascii?Q?bU8+nB2U4VsQvVSUTK+8IRTlfYJCnHZbgDST1Mvp03o66Tsty+kPHV30TFQd?=
 =?us-ascii?Q?34vm07emLm8Dy4iBuJGyGuP6aS+6jcjY+YI5retFL5c8vK3AhTpDH7Qwhsbd?=
 =?us-ascii?Q?Y9ZpAQ7Pdgimtx0LoTnMdtid10MC7bm2Gk2pm2QXgMYspZ4p1rYSMKcFK0Ls?=
 =?us-ascii?Q?R3X6DkvJd5tSjv8bJIJO8vnXw5Lh5e63oAMeyYDo6T6jw64TrIC3Q5H5nsqN?=
 =?us-ascii?Q?W91oG/DYIADMmuvJnYX+QSAkVrav+vd6lllCPrTpp4SVsCsuZNcROc1kNVIZ?=
 =?us-ascii?Q?SVMAz6uglb+S07mYwztBvuVON/VKWxxlkayihiVhUNogyHEQsMO2aex6KgrF?=
 =?us-ascii?Q?uwWivPlKUGFQ32VcOwX6SFtBINykTEhpD/11GDNHuCE4KbhaYkAHBQHDVRko?=
 =?us-ascii?Q?hAzEb7ybTKf8u/ZmAcrurY3L6GAmFiZaPSL/HHgV7hav1NeKYiEoDogcXzPR?=
 =?us-ascii?Q?xtrFaa2CIvnjd0xTlAxWR0K9fhiD3XSZ3j0PzexcWpNxAaqloPmMVd1ZXg8B?=
 =?us-ascii?Q?XuK2PPEElUnEPr0BTOdMbQZ8LfWWYxVBEc4iMvxz32ryQX/p5UsfuwPhGwT7?=
 =?us-ascii?Q?53ya3JvX3RaeX0NSLAsLpquEB+i0i8ieD1si8pgegg3SxhusPmw+qgTWKXd/?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0721a7-f78e-44a3-f034-08dc8894cedb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 14:59:48.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHLxpfEVepvXGNO0WVZhnU4bU9XmQ5Z8blI/giihebibrkU8BSSKcvEIySdIWtE5tucMXeeJO0ehI5gc4a71zVGud9hxvmozqZ55tpI7DSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 14:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200460

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The commit =E2=80=9CUse a copy of image for kernel*.rpm if fs doesn't suppo=
rt
symlinks=E2=80=9D [1] added postinst and postrm scripts to the kernel packa=
ge which
create a symlink after package installation. This should not happen if
`KERNEL_IMAGETYPE_SYMLINK` is not `1`.

Background: The u-boot implementation of jffs2 does not support symlinks.
Using a hardlink or removing `${KERNEL_VERSION}` from the file name fails,
because the current postinst script replaces the file with the symlink.

[1] 8b6b95106a5d4f1f6d34209ec5c475c900270ecd

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes-recipe/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index d6eedf942c..89badd90f1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -115,7 +115,9 @@ python __anonymous () {
=20
         d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${KER=
NEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
-        d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """se=
t +e
+
+        if d.getVar('KERNEL_IMAGETYPE_SYMLINK') =3D=3D '1':
+            d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), "=
""set +e
 if [ -n "$D" ]; then
     ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
 else
@@ -127,7 +129,7 @@ else
 fi
 set -e
 """ % (type, type, type, type, type, type, type))
-        d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
+            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set =
+e
 if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
     rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
 fi
--=20
2.34.1


