Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B006CCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15256.1762154834368359678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=taTBFalP;
 spf=pass (domain: navimatix.de, ip: 40.107.162.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8GXjI0sgqwP8jaG0JrR7+rcTzn50nqu6jJtRyGzt7/Jl60xCt8sLiNvbBLa801p26MkJJAJRB6nIr7k7ZmiXqzhb8v+ZizGiSJcvr9QHm7plsteea9byKeKdEOZGMkBLuXEfjx0i7+hlrMDhnHTw3jzLe9fE9KydQz//FZB5O61INuy7MR5Uyt+1BJakfpFLBcnLhTMmixnzuaKWeDeXgt8fXUh/W3inf9ZoptsdgQzfxTcyhrIec8rPGg6zS4g0uXyg3mBMyOw+PHOxwwnuLqU4PzxYn+nSF7lou2AobqCcjgzQCuWeL98/SKJ9rR9v07R0ZF4KUYfi2TtFJ2wwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WqQhcASWxkmibNT+9DU1s+CMkDFJOcJ9rMnXTm/Xmg=;
 b=afElymrGeDoFYHLmgZZtbm/9BsDC2/LoabRBg42PJ/QjEcxqhiSPrqX3/IYiuinFes1y6BbwOo8Vd88xfbAZaetTi61+KKxrb0QDki5AtEFBysAH3lFfYhiXGveo8D2ySFfWPqAbGbg367qgtMk/1sp45FMQkhoL445Pe/WFPBrj7UIopGoe7jm6f4ZVikoZJDftlFXux7N66CoxeVoJExHv1FeqDWH43cdKTb9hYnUDX3xngFG/3OUws+n2zFpr39oAFaYSS3yFV2Hz+vLPqvu9FcLxsW6V/e84ekYgdGejcR37CiVWKZbhIvrGDgsyWtuzSF2PfEm1HprqAM/zAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WqQhcASWxkmibNT+9DU1s+CMkDFJOcJ9rMnXTm/Xmg=;
 b=taTBFalPoo/YqNzz08ou7P0GKhC3FpA/13D1LrWtlEsdVikmxKYiWyGLqKZfacaIpYYOgegO6RzNpyDVXppVEjLbwyjPJ8CYQay9xRAl1It2MLcEvniApOUTs40d/TWgOIIwUkTRa/GZA1lfAexQPZzwe507aeW4QJejhvmGcds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:09 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:09 +0000
Date: Mon, 3 Nov 2025 08:27:08 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 10/18] at-spi2-core: Upgrade 2.56.4 -> 2.58.1
Message-ID: <d99e920567d7842cd941f68bb5a4e26910a735f0.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::23) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de773e0-d619-43f5-87eb-08de1aaa660b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9Iukkx8qBzl+D72ja4ELft6nQq680B0USM1EuUt2OrUTdw+wUJV/r5ttfygu?=
 =?us-ascii?Q?b689FpMRZbs0tFEDenRkHvoXrFHIT1Utx5QpbXYRxJ5hBezuUbexX6GStRt2?=
 =?us-ascii?Q?2SOieiVcXft4Fx+tw70iUkBkgAC+PLnJXwNEVkhLzg9GF3pOJaEOOCDqWqlb?=
 =?us-ascii?Q?e8zum/U8LMp1rG1Qf/YWgx5ZKlGVE3aszJiRFMQZkzxjEgI1WOhq4oPgmFCp?=
 =?us-ascii?Q?zYDmys5Qm1YAX2He33wK3X7BoX0Z/cAnIbKIqNxh0l38OXQAhvOp2UWuY75T?=
 =?us-ascii?Q?BxFtIWuKnIth46XjYR5VF7LbNkJLWHmXmJAHLya4FijewGNEbYo71APu7Urq?=
 =?us-ascii?Q?TjmBwVkKhocApZuJ4s+drzrAq4MpJI/hplPdyynFYUvlf6piaz36uLEN++x4?=
 =?us-ascii?Q?ED3bAta1EDrWDskdBhR/5FNsWkb16PoqaLeV/mUfRB5EkxsONkuYlY2/EY7i?=
 =?us-ascii?Q?KMx1BUqWnhR+R/Q2aAe52quIPiS4yyxysXRys/zoalAV2MYs2nx6HRRH/Ygb?=
 =?us-ascii?Q?5l0UYhm1RM+Mt7lDF3xwQEKvul4GgbitukuFjKmtLVVVxx3WlAq+xephwcj0?=
 =?us-ascii?Q?RaeDhfpEu8xBPPkGt85bjWfZZYWlSBhPJBRKg2Ixs+cXwv+Tm6aX8aGo6Cg6?=
 =?us-ascii?Q?Xbw0RSS4wlm9siuu+AaisMM0UovaOuPZ602VT3TKvcCPnqWz4Wcu+G/93aco?=
 =?us-ascii?Q?C9Z9YrlLdCDfqGc6wZPqG30Nl+2gJf1EjyUnG65A64wk8Oqyr7CbC9ihVNnz?=
 =?us-ascii?Q?xflv/1nErxCksyqsKz1jD4PqOXtmXooC2Yz91LFB8rNZmY2ndN2PLCjmLbI+?=
 =?us-ascii?Q?Lhw3uYToNhpyiQ+PSt3nfTwUUbw1UyW9cmo3JStgJ1RfdEtWV9fXP24jscvn?=
 =?us-ascii?Q?lVmXZaYElRdf8VixwDBoCA1NlPtVl5+P+FcnTIvAH2ZSbJcfRdIwY0fje+yq?=
 =?us-ascii?Q?JcvlpLv9mvLAupSsyGbXf0rNaC4LVRO3C4sisfOCtAC+i+HSKh2UazCKR9oT?=
 =?us-ascii?Q?6F9cInaK0ooDs6UxDwjC7jJ0HiqePakiliIIG/k2UaLyjdL2AlSDg7+c9ciT?=
 =?us-ascii?Q?rjyeMWGFCuCL3Y25C7H/3H2Cp7TedDaE8v+Rk3fO0JTInBFCLgvwuZ67S7Ns?=
 =?us-ascii?Q?19/H8AUk37+dQRPvVSZGgCnTNQ8Qo9v6hlT5kmfwpLEx5a79yAFzL14KzkXm?=
 =?us-ascii?Q?TV1UM0RKgpWjLMvSMCpyMW/h6G4UytTa/N34GRz5EtvB0PSnJ0TwWUK6feIc?=
 =?us-ascii?Q?MzdfmxbBTGQnBn3rOAaEPUP6OGa0y5dRTabKVnC/Tq2HTkuOZLwqRelDImEy?=
 =?us-ascii?Q?s4gNTtKIAv63CMBjprkqnhsV37hPXeIEsJyTO0wNCfTlSswypFMZk+I9lBFs?=
 =?us-ascii?Q?t4l7qjhD+W7hPWPA4RrRURBvwyNExB4SzWPOPNqkrlJhrEEwJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GabZdFJbYBA6eNHwT1E4DkxRkhkNuazfuTjlr8O61eumEv/c2JLiA94aTnD4?=
 =?us-ascii?Q?o1ta2EoykakC2laq/dt6ZQlYIM9giY40VRcVanUaiza8B+zI1ENpQgSVmISW?=
 =?us-ascii?Q?zT8KRtkrVP3jOsYbWZWQiTX90qYCfCIf8GWztPgL/z+HQA1xuo8/mCd8O0ht?=
 =?us-ascii?Q?CSIkjCzqEZIjtCanaVTNrAd9E/TkNU5ok6f1/SymvPOW1h9hUVn6cxU9bkJz?=
 =?us-ascii?Q?eZlXSuUINYje5ty4w0mhQUj27ZARX2pSFmeGTheB9lvX02fomUrO8gRxsoDN?=
 =?us-ascii?Q?h0kstcFWNley4W972/B/qFcHPXQwA77TZ7ddyY8gdwCiz83nWowvRvjGZJfG?=
 =?us-ascii?Q?NhtZh7jcU5okowANAqyDOghoSEJ/j2yF4qqiPFipWXnyh9qV9hFzynEReOl6?=
 =?us-ascii?Q?iY8tij9NBmNGZTpm+dgWeweqrqAtA6sUilRxri09js3qjpc+lWI3lr2YUN1S?=
 =?us-ascii?Q?V/B1w56jKlvpWtESeSGWClfaqVcY9WS9OsxBvxUVymNO93jukgywsKIaEd6f?=
 =?us-ascii?Q?9O72GB+40cpdjkAMBwaIVE7ZU4jQfajn7e89abU25cXycasSJxbuVhC080WK?=
 =?us-ascii?Q?f/OwbTqc/4s8SXv9utg9rIT7tt7tMo+6wQ5DmMoj3MXW6MEt9ZEzNn24ZoKj?=
 =?us-ascii?Q?gzPHnsK1llCnQUIzI4aNC+UQqguyRQ1AY3gf23rAAHd9yX/RNSs9ZqBL1jla?=
 =?us-ascii?Q?8PLGiXXQdncWi2KuJpjiVOrGS+2CcObBuNIDrpQc9NPMrFSerI6gNNPObYw8?=
 =?us-ascii?Q?kx0wP7nC8LqgjlCjnov8OVulpMNSCtiVRnBAFGioe6YA56xdLr0kTfOMPciS?=
 =?us-ascii?Q?54UF9nPAL5VJmpKPVAjs9ArQ9YW1LWBf8MYDSf+t0Moc9OfYpUdhUxrCse8i?=
 =?us-ascii?Q?NXiz04zD+Bx+ZfaLw8ZWffhaSijcX/upMyqnistl6bheQTladCliJX9tRWMV?=
 =?us-ascii?Q?qqI+LBLQkxVijbY1JZomjeRwqqpWMVJfr2zdhJoLYp6TUhm/F6OJH7Y/vstP?=
 =?us-ascii?Q?gTHfzkNeXrDUzLUvTC/wZc/xD3uijAs1pu+BaqnmREBqic/r4wgkTkPnue6C?=
 =?us-ascii?Q?bqdm+K6TdHIVJHHBCsMHySMHM4qnWu92NL9Xb1WDE4KjP/BVASS++Uz1xIN7?=
 =?us-ascii?Q?GSDfy3TPRjEXFlWDz3f8zWP5k0SKHe8Fvu7hRYfC8es+RdsMsKT3scUmPncE?=
 =?us-ascii?Q?FQBGdFNLNpGHCL/oQv9zmN1JqgXI2DdJU2z86B43yv5ERUgbGneRS5cMQrmU?=
 =?us-ascii?Q?UvL/uapAoPxtQcynD8PmfH/SnTzb44CbMNL3EA25hkK101rhlmCYbgeSOKx1?=
 =?us-ascii?Q?Eik2UngBH+iNOieeijBmOixh9Ook/qTI3CBthvPjp4ROoVtYt9O6OVgOQOWu?=
 =?us-ascii?Q?Fuco5h0Q8xUexwZZ2hqd4Wr0Epf8BPGTVVHYrVedBu9t85NahjcrO4QfYNaC?=
 =?us-ascii?Q?0XPTpFk+cEEYUYxXVS6hKPy1yYZ/c8ZUr78kXSDumS7nk0UTlL3Dy8q5/z8Z?=
 =?us-ascii?Q?LMCInUFOUenRuoya0WN9rb3jB7HpNAumKjbov2SAImtYjLMe14E03DCe9Bnw?=
 =?us-ascii?Q?PRpxCSPXC/MAFCjmy2BO6Me35PfG7Xv6SQuLkhr0lNibRquB9aQ8ABxo7fHc?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de773e0-d619-43f5-87eb-08de1aaa660b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:09.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5pAHrtpLCpET/IMYaozqkop1dhSCzXKGAO01Nt/SujEZWlm6DVACDJRpXweC5bnY7zkiIEO7WKz5FjFUhmy9ly8DpZ6x46zDbYooSbUOTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225601

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Add python override files added with 2.57.0

/usr/lib/python3.13/site-packages/gi/overrides/Atspi.py
/usr/lib/python3.13/site-packages/gi/overrides/__pycache__/Atspi.cpython-31=
3.pyc

see https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/7c8a9365d5009b43af=
e6d16bebefc14a8df410a7

Changelog:

What's new in at-spi2-core 2.58.1:
* at-spi-bus-launcher: Fix a possible crash when registering.
* python: Avoid traceback when hashing a disposed object
* Fix build failure on MacOS.
* Fix transfer rule for atk_table_cell_get_table and atk_table_get_summary.

What's new in at-spi2-core 2.58.0:
* libatspi: Increase ATSPI_ROLE_COUNT after switch role was added
* Add ATSPI_CHECK_VERSION macro.
* Properly fix key notifications under X11 when multiple keyboard layouts
  are in use.

What's new in at-spi2-core 2.57.2:
* Don't install at-spi-dbus-bus.service if systemd is not enabled.
* Some collection fixes and documentation improvements.
* Fix reporting the wrong keysym on X11 setups where multiple keyboard
  layouts are in use.
* Fix possible memory leak in atspi_accessible_get_description.

What's new in at-spi2-core 2.57.1:
* Fix several crashes introduced by the code to handle the accessibility
  bus going away.
* Add atspi_device_clear_key_grabs.
* Fix key grabs when num lock or caps lock are on under Wayland.
    atk-bridge: Don't crash when requesting a plug if not activated
* Have python overrides check DBus object paths when testing for equality.
* Add sanity checks for child indices received via DBus.

What's new in at-spi2-core 2.57.0:
* device-a11y-manager: Fix crash on dispose
* device-a11y-manager: Check properly for the DBus backend presence
* Fix the build with glib < 2.76.
* a11y-manager-device: Fix unmap_keysym_modifier.
* DeviceEventController: update mouse coordinates before sending button eve=
nts
* atspi-device-legacy: Don't crash when XkbGetMap fails
* Return localized role name for ATSPI_ROLE_EDITBAR
    atk-adaptor: Reconnect when the bus launcher reappears.
* Don't keep references to uncached objects in the application's hash table=
.
* Add some Python overrides.
    AtspiDeviceX11: Suppress window events following key grabs when needed.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../atk/{at-spi2-core_2.56.4.bb =3D> at-spi2-core_2.58.1.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.4.bb =3D> at-spi2-core_=
2.58.1.bb} (87%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb b/meta/recipes=
-support/atk/at-spi2-core_2.58.1.bb
similarity index 87%
rename from meta/recipes-support/atk/at-spi2-core_2.56.4.bb
rename to meta/recipes-support/atk/at-spi2-core_2.58.1.bb
index a1cbf4b455..7376a1e950 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.4.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.58.1.bb
@@ -3,13 +3,13 @@ SUMMARY =3D "Assistive Technology Service Provider Interf=
ace (dbus core)"
 DESCRIPTION =3D "It provides a Service Provider Interface for the Assistiv=
e Technologies available on the GNOME platform and a library against which =
applications can be linked."
=20
 HOMEPAGE =3D "https://wiki.linuxfoundation.org/accessibility/d-bus"
-BUGTRACKER =3D "http://bugzilla.gnome.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/at-spi2-core/-/issues"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
 CVE_PRODUCT +=3D "at-spi2-atk"
=20
-SRC_URI[archive.sha256sum] =3D "dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6=
c2eba0b2c85b6c094a3a02"
+SRC_URI[archive.sha256sum] =3D "7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed=
4c9e69a7d49facdcb95e9c"
=20
 DEPENDS =3D " \
 	dbus \
@@ -38,6 +38,7 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 FILES:${PN} +=3D "${libdir}/gnome-settings-daemon-3.0/gtk-modules/at-spi2-=
atk.desktop \
                 ${libdir}/gtk-2.0/modules/libatk-bridge.so \
+                ${libdir}/python*/site-packages/gi/overrides/ \
                 ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service \
                 ${datadir}/defaults/at-spi2 \
--=20
2.51.0


