Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5331ACCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15418.1762154841652267112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ZXOfAKPb;
 spf=pass (domain: navimatix.de, ip: 52.101.84.83, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShKhakbntm1XL+VhZnDVuq/6ynChswpy0LvPQPbL5cyozzavrvIUdqcINgouGvaDwywx8GcLFAP2RDgTzDmLYnNQ8imvLA8XxR3FCEyzzGtQDFS5BwgZ2d6kpA7QygZFDYEQ7tDihQEoRhwC8yL9iFrmLIJrDlC3XJuYCPrz7Ok7iq2uKoEf2qCPaVTPxMFCLdwzSdTddnsT5RLKyvBZYHkLB3TStwJ6aCCcQ4/d55uGnaUlRFVfKxnYK31+cRWRcnERj1z7heNvydBHHhnmDvbqz2mJttvJChAggW4tn/jtgF6+cCbVR7lMvWpbcBrtPnTgj5NLBoRO93XfYXfuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwcpqQL2mCm/buUv9OWPRZ0EMGvGdXb+cuhLfgfA74A=;
 b=xeRiebOlID8AZQ2agNNCRdhoEtK36Ps5YhCgLD6iwLfN5g8RIHVKmXp1y4ee5V2axkAQPSkP2oSkLyCxRn/CATrHyRmpAQZMXQhw42fj0T6JOc04AXzBt2CqRs4CY+XjbFBGKkbh5zKE61MV+WGI1onK9m33zyKF2JihcnrpCYPgmluerWQek0Ca/rxpioWy3IuRNy2LiBDysrm4fypVOL1y6FcB4Buhr91sOT8QPgbfHoCeN6oSuLRxXVDCfC1M3VyhzWKUY1SY46gEyhmFkJkxJyy9Wy/X8wdyI7zgwAjkmuMrXIEFhI5LhhTTe7W1LxZ1xWvvgeEB2YsvYwGylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwcpqQL2mCm/buUv9OWPRZ0EMGvGdXb+cuhLfgfA74A=;
 b=ZXOfAKPbpkNdSeYcsyf51fcs56Pwwa0BggOJL0ak2aGuxw+6bTUZNJvqDuBWEvbqcPBYRld9yOfvkOnUcs8mQ364fGmtyb4hGA9+4ztrCsoUcI2bqlqzmfduPnV70TRRv1IYjTC1HoQshTgcI2kDu7ZpLGUlTuFsNzG3WEAfSPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:19 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:19 +0000
Date: Mon, 3 Nov 2025 08:27:18 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 15/18] gtk+3: Convert to gnomebase
Message-ID: <e66c78a6d564749e87aa10bd0f0b04761271a985.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 600906b1-0145-428c-2514-08de1aaa6c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/7QgSPqiEfl8JTESBEnm+itbE1qjS0sdvXP7azCyG8l2MmEGgEQ05ggFYHYR?=
 =?us-ascii?Q?dQvb3NWMO+UFgzEjW8v0KVB2pQDEjXGiO4HvHHJsHkzX3CnHGrtXzuZC7yRW?=
 =?us-ascii?Q?5/JIZx1sAWDZpbK4AERq7Hg98N3wTrD5gMno64IGhHUlMmgA7V8u7FJnAevT?=
 =?us-ascii?Q?un6FZAZmRwRDTjBLYqP0dCbqwKWTsT214GVYE7kEQAfrO5UMwDfxdIW0tQcw?=
 =?us-ascii?Q?1d7HifqKVw3MQ/OcG/QE2LEQ4iNR+eV/GpGmJjFGh1oy9jRffNtmHGJkdkBP?=
 =?us-ascii?Q?hCU2MCznIjSE97w9sRgsm1x3zqhBNP2jNue2UhbGzTa6Brca0M1XsVGP3WhL?=
 =?us-ascii?Q?aH6GrzQuhABA/3Ezto1SLeuO2cvzKP5C/vyrwuJpDIT++bX3wgILHRG/nzgj?=
 =?us-ascii?Q?xnc5eqSFc8z2gh+Xw3Y5GbvGBCXEmlxMkdvh5k2cfGTnQ/XG35VnyPKytmUY?=
 =?us-ascii?Q?j8OOSiKz7zM97xnb1T88ep6cKnUwXjrcUeqfcyGHntkuF91pZMat5ETYvKxf?=
 =?us-ascii?Q?S28ALlcErzyVkCCSmyW/Pf13nT74mCQjLYFdvNZJhPljN54vowz28l49yvoZ?=
 =?us-ascii?Q?FE7OizW0P1WUFgA54vCkPyurlm6kzJFKhJcpqi+uEhB9SL3vGasQI4FpcNgM?=
 =?us-ascii?Q?7RruV50DzAE4ipA/Q3s1FHtuz1gomhImVepcJidfRp0eStXhcXSiGgSlW9/l?=
 =?us-ascii?Q?QcfyP4qOVnE9G+p9TCl+sIGqr7SAHp6xOenwB+99z4Luu1RU/E3TSaeYFKxw?=
 =?us-ascii?Q?6M6h4+DuJlEwJ3iZIEHO/6p3T3AU1/Chsgm4BvcoymCtn59XMILlVMTZ/5zA?=
 =?us-ascii?Q?Ph+eoaWdC1H7cMQ54/47vaKOBTx/csQjOuiUqTZ8jOGaQ+wdJVnAwA5buCZN?=
 =?us-ascii?Q?p1PnOlTMSnp+SXsrAmzVt61wEobMTsP46bPxkwgm0QGQiurICF6KsEL1NnoR?=
 =?us-ascii?Q?cJ3NYMUEgVsmfnsMJppj/raBBZc9LdSD0pNWBYU3GNzvNNIoBTsWPoLdDENJ?=
 =?us-ascii?Q?0XnSCEo8dXRUqwkjBHLKMDt2efyHm6zMLwE8Ok8tUZQgEqvHZDDZgcM2o8wI?=
 =?us-ascii?Q?V1u9MH/ud0tm01ZVex6lhW6eVHmRazZDfBuUdCJ3k/6d/M7YKG+7OcUCMDDk?=
 =?us-ascii?Q?xLzM7aoQPM83oUTDTsUg2pBEe39tg91V66syNtuYLhiDDAPYGIVbAxWJfyK3?=
 =?us-ascii?Q?DzUrYU4nCkkoR07ja4JeQGCkkx1l2nRdv3Zacp/4mYGThTpKvTDiYtWtzt28?=
 =?us-ascii?Q?Mc3CLbvOa6teafdla9E4jqmzJVPFd3SUaZEHyO4wCW1t1cSd+i7U+a/eYdBZ?=
 =?us-ascii?Q?sQKwZtW9wijcV9wRxTBmf74v2xvwtrr2KyGGDAJ1KDcRRHTDGK8iOQdINgAv?=
 =?us-ascii?Q?tYIGsJgfyG3fqIImgFXW15PwM3Z9swwTwk1q6ySQ0Yz8HtNxLYuEwhoUFSZN?=
 =?us-ascii?Q?1Rm9bGCA15nBWgeEKMCpy5m+p2OMnWrb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tcY9KK0goJGnuya1Y/umdc3GgXAT91emxDZL+7xHHgY1xuPARTHn0EtOj46D?=
 =?us-ascii?Q?Y0yC8wMJsRCkI7nSSStKeWkZsc82ngXAgE4Zh4AchgB7rn9s2Cgx6Vhxe1+Y?=
 =?us-ascii?Q?FIobOWR0WqPKvEtuIRNz+Jw7tOmZBW1IAlmpqONzKNCoYA9sFmFU+K5P/3rr?=
 =?us-ascii?Q?MuQPx+1f9anUS1K/BK3PfOy1lCjEE1BIZwyWOGGnSr8lONi6oc8WoxDCsWWL?=
 =?us-ascii?Q?zuFMgx1JkEDiKdG5vPXd6ueFT6J8c7iqizvObiUHvKrowNFw4gYazlJoy0wz?=
 =?us-ascii?Q?iTbFQn8qACzgwlJTyoblHbE9tlwihK/dtYF1+ZWJUDyyETBiq+9x6KV5qBLO?=
 =?us-ascii?Q?n9VttMtL3gsbu1qm149f9wnwxAYpVg1ciqZzRrY7mPFzJugXL63uK1m0YcvP?=
 =?us-ascii?Q?AxNjQVrs21IRQTIrx9TVswhQzT8Ox5j4ouGcN+rc2GJqpn3GoEsYPdL3RIka?=
 =?us-ascii?Q?9RCFPdBCR+qecfol9V9e9Hl9s36U8xuQZIvueS+nqZeVEX11GOkz141LMy/G?=
 =?us-ascii?Q?a/hLH8ksJKd18f29XJDrlm73gazCNNd3UMbqZbF68x25hstxqH0S7sC2YBbG?=
 =?us-ascii?Q?w+e0MR5AAxOfKnnxnE09BRfnPjw5HaDwujDB/OcPMSuOUlWSQEKVKEN1vUix?=
 =?us-ascii?Q?6eHon5ZDgEeoJo+2PTYdhkjmdF7Buar0S+T2TThlQxJS29DiP7HRGPj9QXs6?=
 =?us-ascii?Q?xscXxyRN9NO5KehCsKo1SggQ7avyqLEuSXbYpeVmmfLfJvyz9hSzo4qr1ai/?=
 =?us-ascii?Q?PKbp7b0KOF3njvYdFEZneSYsCiwVTP46UHEHNWusSbvvqky50/E4f2n5LKAS?=
 =?us-ascii?Q?Q8D86rMoQBRK76Ku9DK5DxZ+yifK/G5yuOGj+yOi9yvYJVEYVAKg3jSnZVds?=
 =?us-ascii?Q?qO2DCZiDlXzTE1jMhtpXqtatU1ZiXYiBE8Z9e3pkkSvH3/1Lk1TLtN5G+MxU?=
 =?us-ascii?Q?wG6reekokwxFyUA1I9Jbo0rc+OIUCpShRXt09hJ9Gvqug2pW0i/7q+yNktlN?=
 =?us-ascii?Q?2XG+YerAuGZBHzWcK0tMlWGZDBlh0dXSEUHaNhNs1ilEKm8eMd2FVNKZT2z2?=
 =?us-ascii?Q?rMx4XHtPMkl9VhyI9YRh5chpAxfhwnPhLc167J45TE92FuO0muV9Nmxrmexp?=
 =?us-ascii?Q?gXB6bVe51ZvakQ6Y8wHpelWSkxKSlQYptsNgOygWvMwxI4S/zFjDgioowPiy?=
 =?us-ascii?Q?dB33kRoNxI36mtId+C1Kd45g6woKa3xDJwUzrO4hjMloXwCXzdk0zhNRcAPg?=
 =?us-ascii?Q?8q7Hk71CsAMaF9AXmKZa/sjzE8nVtw5dSmS39SIM1PFVJVl7Z+a8JrQiB+7F?=
 =?us-ascii?Q?9AOIitopGwZeMGya8g7HhWbFnecp+PkCw6e285a6MQN9RHBB80YL0r4NsMYa?=
 =?us-ascii?Q?8B1mEFb6Pz1fU8gVi/0e32A+uxLOsjVsHK5oKd36w0oUfn73z52YojNQMwRb?=
 =?us-ascii?Q?Y3V34+lBQ0FZm6Bfb7DRodAHPEcxX7OWVDNUYbFCGQc6bhAgKDDUT6jDvAEF?=
 =?us-ascii?Q?FqOUIHHY/fuVpgRx6GORSVVQTJUZi/9oqipziwPqgi+5nfdi4nlRw/YkINbX?=
 =?us-ascii?Q?BXKO4rfBQeQ/v4W2tQA+OawmeTN9JpnaMmQm5A9xG4BzRO+zf1NDkDx7CzvY?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 600906b1-0145-428c-2514-08de1aaa6c33
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:19.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nr+wzuYkw3sRVQbSuOSXO+wsYh3SoVORJxgC/PBhzO6XopKK8YAkvn8KpWjBKvn9ReVwf/7or8FUB5IsJlG2J+06Dsf2ZDANtUT0ygPyasU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225606

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.51.bb
index d4fe121733..690d5a2dcd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
@@ -15,15 +15,16 @@ DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-p=
ixbuf gdk-pixbuf-native"
=20
 LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
=20
-inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-=
cache gsettings features_check gobject-introspection
+GNOMEBN =3D "gtk"
=20
-MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI =3D "${GNOME_MIRROR}/gtk/${MAJ_VER}/gtk-${PV}.tar.xz \
+inherit gettext gnomebase gtk-doc update-alternatives gtk-immodules-cache =
gsettings features_check gobject-introspection
+
+SRC_URI +=3D "\
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e378=
67c49c5f905a4f"
+SRC_URI[archive.sha256sum] =3D "0013877c6bd23c2dbe42ad7c70a053d0e449be6673=
6574e37867c49c5f905a4f"
=20
-S =3D "${UNPACKDIR}/gtk-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -104,7 +105,6 @@ FILES:${PN}:append =3D " ${bindir}/gtk-update-icon-cach=
e-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
                ${datadir}/themes ${datadir}/gtk-3.0/emoji \
-               ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
                ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
                ${libdir}/gtk-3.0/modules/*.so"
=20
--=20
2.51.0


