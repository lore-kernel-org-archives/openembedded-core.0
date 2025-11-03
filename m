Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27354CCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15248.1762154821041164393
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=DVsNtDaf;
 spf=pass (domain: navimatix.de, ip: 52.101.69.138, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD8ODZTINadcyfipplKzQBdBc2mLmPwX5+Ak20FDTGYN/N0n6KG554XUQYzpjfo6zP88ibmFl411+/tBePb0J8bckYgW3xKWhHSnDXVhXHeZWjOeTysVvfNHJdR9MXJiBm4MMfqkOYvWXK9X8DoJR9Wied7cL0a9Tb8LY3YLNJLJtP3PL911UxkFDwtwaCDzW9E40CPDRLopFhhQzE802o+/penfgfTtIvJ/wCgazMPaXlRFzl4sxrOR//1FX3FGWU10+7MVoyhNQtRBbbyzMGrdbMo5pgVP3T5QEaK4IZDfmB8HSNkfDBrAOxuWwd45lSRPWoSSPKan7Rg3hdw96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV0cmyJjzYvFP9fCQVldpIv1GBZyegGuWz4R9Q4c0wk=;
 b=CVKj6PuDpMx4iOgYTl332x+Fimpg8UbutzD3BMAkqqZkTmrRR0edi2ueS6esZDtvR/GSJdJu1wtPrbs+xvtrY2ljlyd6ZFuHoD8JBZTwbv/uTv8dEhp+Sz3oytf+8WaiuwMTbI/1Q/GDMTJ8x6eBIMr12z1J6m1bUegAjZB6TydF6P0hOjG0qNG2e0T3mmUtYMPq5/6LZE3geMdsw1rPlpEopE987OgErBRahOF5uNPxGQjugh+FgCpvLzxC84LVFE2Smwdc8ABf9qrb6D45gRWNN/dKlC+bSg7WwBUigYRURvD3Rz8CzRnd4DD7xnxEXopFJKkl6fa9C1uq3InjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV0cmyJjzYvFP9fCQVldpIv1GBZyegGuWz4R9Q4c0wk=;
 b=DVsNtDafGG9A0Y18kiBbKtVNKKBc+DMRjmxkVIM+W6+zlv+IjjfSfIFMmmO+agzGJgNZPLJh04DUXRiNrUypY+6hx7kaJlUnr9Lq8yu8+3/aSiAnsWVjEgS6hI47va6A7civU+Uyh+hD9VWEQOL/jBgmWT9IOHoEUAejroKzSTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:26:58 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:26:58 +0000
Date: Mon, 3 Nov 2025 08:26:57 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 04/18] python3-pygobject: Upgrade 3.52.3 -> 3.54.5
Message-ID: <7f6fe9b5518436bef263e7cbc2b5666e25cc5a26.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0307.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aea5b6b-a648-475e-00d8-08de1aaa5f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?auECQRY+taVyh9CO15O4eOgrZAxx/IyIX212SqcwduFxBKANckqtyd2RgRTj?=
 =?us-ascii?Q?fA0Ymdv0+Cxlmy02du4mHK8mOgCoGyoCQQEQ9o21Ur1hI4NI9dqGtJUrlMFa?=
 =?us-ascii?Q?TXBYe984tbgoqrtTOfrIY3FQBFzsNvj9Gy9ZsqrvfFROzulbeFHgGCyFJN4f?=
 =?us-ascii?Q?fKruiRo2B41/+kjYKD+0ptrYoGF0Xmy6r0E3lyiMYC1ApAqr1wcFxvq+aZow?=
 =?us-ascii?Q?tgQ2Muk+QMIc9dhKxgnwg3sjaTzS8Gi5w6TYFSze4D1wzIOW8PXxEyEXzZsu?=
 =?us-ascii?Q?o5azvbBTak6iNQvtPPnbvdYvJHF4DpxU7dZ12EOI7WfrUKeDKkkQF6T0qHaS?=
 =?us-ascii?Q?orNbPPqh3ommShGHpbEi3k2AA4yvQ96Ra1OozAGT9afws6bKHmljO7AE+i9w?=
 =?us-ascii?Q?MqKX5qM4dpzqR5K+fOgC9Iy8qcIQnRX/Uma66OyFhkpYsyKDAkZy0qgBEqAx?=
 =?us-ascii?Q?0tmsGJA5ygzT9fdZHsTSU4L3jDQWL4or/ZctsvAEfscBVUp2G9YPKQdTO/YW?=
 =?us-ascii?Q?YmwcnuRMNjIgya47lqEKOpP3+xZq7F62yL1zsLI8EppGBmUnRgZqwdMh5IPM?=
 =?us-ascii?Q?T4mo5vkadcluWChrNP5IokkLWdvgoXtTd/DM4aeTWRU032RH3zeN7FVF2AIH?=
 =?us-ascii?Q?h8LbCdksjEi+Yst1tC3x1UmzQVLvbTuGikoizjJyAYQfGB/dIX8hWibY2n99?=
 =?us-ascii?Q?Llog5s146BtBvBi74/pgWACdpKP9Za2eqnVTQz/AOkFZTw4eVIQSg3jw2AZq?=
 =?us-ascii?Q?gmKayEj2Pfu7AEX+f5bJeNzhD1f5XolKB/TW3EUkokdO0L4jknlyJysAa4PP?=
 =?us-ascii?Q?nCMczOCWWt/VGLt3OQqNd6kCPBx17eWx11niAoxH9zPnfHYQxVusKfEbfKJ/?=
 =?us-ascii?Q?UZJLeMrYhIIKySyNsikpOL+T9IgB7AHDdygK+kH5TNpqqEX0eFp3pMawcXuU?=
 =?us-ascii?Q?4T4I+OIt6avWGijnEQr+sSxHuKwYBkpkXCDS7SO6gdlFEHPZ/4Ey2vWCzdjA?=
 =?us-ascii?Q?gda/a096sAKKyXPLEEgGXUWtGo1eIUHyfvR4zBazFqEF+VuNa/vVQdM5Byuf?=
 =?us-ascii?Q?/cblO09EC3HNJ7G2ABBYlp5iZNJmihyxSaPMbyy5Qppj08aAG5TzsQY2ik6z?=
 =?us-ascii?Q?4mp7EOETWYdtXZZa/0Y9Q26+vc91vt165DTxhOUGUOD7fZUxmefzBLBLmB65?=
 =?us-ascii?Q?Z3mp/PwoQr3gIcF5xpPSkPaZxffevx7jBujTaZMYaLbro77tHonabBbVsKHr?=
 =?us-ascii?Q?KrIQe8LoS7LZ4w31YzVf5JAJFhbZLMyHSlXzBGgxmz0J9/Yc8Z3+5y/dN/Ev?=
 =?us-ascii?Q?18znMzgFJJ5Dg1UCMRA2y5/t5ytmq7GeP7eelfk+AJQiGOkBWX5EKn3n3dlh?=
 =?us-ascii?Q?14ni5UJDaI1cny56Z1rM649nm3utvbA+01rZ4Ylu/s28UMtSctBxnkvY3tKo?=
 =?us-ascii?Q?k3n4Afl66mO4g9mrnThu2iNBUj+/uQDq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CDs0F8coVz47mziZymljqZ9kw/E9Gi3p4mRYIJxiTnMZoaQzvgwItGeEvci0?=
 =?us-ascii?Q?9LgPINVkp7wUHUgx5np6rMid3MKE/c0K6YF5AoOdthE1Y50m9gYXo2vdgAHb?=
 =?us-ascii?Q?KL2CPDeZ3MQtEWgVNBimxNm/5rQSUih1/xqvzNOCMvCQYmV/kAH9vL8VUSOO?=
 =?us-ascii?Q?utr62pO1O5aCZs0nPITkP6SdYxc4L9nZ2uJ2rghgg+svX2A+X5neWbGXMP68?=
 =?us-ascii?Q?JKd9FlODn+kfQYBHv3sG7DgHKVhjS4cwr+tHOLO5isuqQhUieqIXQBegZcaU?=
 =?us-ascii?Q?dkXjpUmA5JMz1l/1Ts6H84lP5s+q660bH4Fft0DLYrqUcRue7O2vdU6Ncyy7?=
 =?us-ascii?Q?2XmtztrUjIHoWEFNjhhk646QTg5NdJ17mhjmeTvDZLeAtcjWqbbyM3ZupkRt?=
 =?us-ascii?Q?j0oSVUGP5163cu7sBCiClKpDKAmOu39ZPqHql6qxKIvEyV04ENTyf1/1XBjU?=
 =?us-ascii?Q?S/Rg2z1eJYTNXZrZ2OO7czT8jnd/FARCp0Y+XCer7wiOfYVTv9GLcgwzfd+B?=
 =?us-ascii?Q?VlBgNpirhzZ260nQZ8wbR+zUnGmwBed3XqDrX/+xmQcOaM6zAa9LjiFaj4/y?=
 =?us-ascii?Q?IpqDlJNkq/WJ/NlP/4Uyv0IWprk7IDwVzVZI8NUNRzyhit5xYylO6wsgGlcU?=
 =?us-ascii?Q?fpcxbdYZwB7QGqnQK6dDpdQPqNtXvqnkEbl4/CoveWSofNs/6UVeDtVdEwK6?=
 =?us-ascii?Q?8ZMSDxmHn4P+88Nm4N90zp8+WdQ0K5NByW7FQ+a7XlBhuRA+kXGAk3K8F9Yf?=
 =?us-ascii?Q?qX+TrDvp4zEKPEQIoGKPebhuHf13RW6HeMS97hqCEWfnmRcuo2VoY5bcCxYl?=
 =?us-ascii?Q?rIEP+5i2Wk+5O/fBqX9oe1TiU9o7VIR7x4TQp7sYq2FTNqtb4OSL/QtM4nlS?=
 =?us-ascii?Q?sI5vLSW6LmgBgSfLjHndiyR2vv6Ch01JciRFgBSVSrWi9xAWKRXGDfQ9BDOh?=
 =?us-ascii?Q?qWlXOwYpVEmfoLALOFuVmx2TVw/She5v4NSpJoJFwzp1qifGbqGlrVN5yZtc?=
 =?us-ascii?Q?0E2O1oj6DOOzh6sq0m9iM6zdWk+cP1WM0VtAYfeTNxZO86uKCrCjq+PJB0ZE?=
 =?us-ascii?Q?DglZ8ymqGJondrLzjUkJUFlrlw1AZhTbhefSIgeMB79U7vhWV7GZrs2rubpZ?=
 =?us-ascii?Q?72ZGXzoyffNXa3fBNGd3wyv86EWcUClO4oZ+qx4MgaKfM3/eK9vjm0RFqVa7?=
 =?us-ascii?Q?GAyIjBxtYOj6qCbpBGzfqfWHkeows4AFftM5hIeV8jMOF9XLd4MBuNDGZKnx?=
 =?us-ascii?Q?REjsJG7QbBhEjF8otK9U/iMv/3ZrVg7E1HZSHoV5pRiVJf5uQBMzaYPXG1o9?=
 =?us-ascii?Q?qlTWWx4rDhG8TIH90YiPzAzbwgeMPxUIawGCzxwfFAEJ/L8rWFJJ9dsQN8bM?=
 =?us-ascii?Q?E0PZ1HRFVKclEIoq88sAQvsUy+gRd8chTr6GE7erZVLOnERMgwu3jOb0evDJ?=
 =?us-ascii?Q?LgucjlutvdtXp7vXBzdOlwL4IzV9PEHK2gqjItAZZsN/RBzG9IONUC7gvD1i?=
 =?us-ascii?Q?86j8Zvc7xJsl4NCttYKguH4Eig5gdPgsEoIpHHqiDfeem+X1IrB18lHHJL88?=
 =?us-ascii?Q?3gZDlNaVvRAz7deu5dCT+PVjTHKNlQPX8dmi5GNPLib3X3oVBUN0ff6s83VE?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aea5b6b-a648-475e-00d8-08de1aaa5f70
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:26:58.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYvCjqa3gTgvMvqGrUjrW9F0mkyaOWmqj/gW0iJskdz8keEGGRSovhuXeMvU08zGLJTqabj3baVnKbjwUEaosIlo0twL0m8qwG57HG4gEp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225595

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Changes in the upstream COPYING file were only replacements of \f by \n

3.54.5 - 2025-10-18
-------------------
* Backport: GLib 2.86/GioUnix compatibility :mr:`461`

3.54.3 - 2025-09-21
-------------------
* Do not skip symbols both in Gio and in platform specific :mr:`452`

3.54.2 - 2025-09-13
-------------------
* Prefix platform specific symbols with platform name :mr:`451`

3.54.1 - 2025-09-12
-------------------
* Excempt GioPlatform namespaces from required version check :mr:`450`

3.54.0 - 2025-09-06
-------------------
* Fix compatibility with Python 3.14 :mr:`433`
* Add platform specific symbols back to Gio module :mr:`445`
* Include docs from old GNOME wiki :mr:`441`
* Add override for `GLib.MainContext.query()` :mr:`446`
* Fix optional inout parameter marshalling :mr:`447`

3.53.0 - 2025-08-27
-------------------
* Drop Python upper limit :mr:`418`
* Add `__enum|flags_values__` back to GEnum and GFlags :mr:`420`
* Fix asyncio event loop selector with Python 3.13 :mr:`421`
* Support `Gtk.Template` on sub-classed Python classes :mr:`199`
* Use GI Repository singleton if GLib >=3D 2.85 :mr:`427`
* Expose finish_func on function info to determine if a function can be use=
d as awaitable :mr:`428`
* Documentation updates :mr:`424` :mr:`426` :mr:`429` :mr:`430`
* `ParamSpec` objects now return the expected enum type :mr:`432`
* Fix `Gio.ActionMap` override for `Gio.Application` :mr:`435`
* Fix regression for functions with multiple callbacks :mr:`436` :mr:`437`
* Cleanup: callable argument cache :mr:`438`
* Format Python and C code :mr:`386`
* Fix compatibility with GLib 2.84 :mr:`443`
* (chore) clean up array cache code :mr:`440`

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...ython3-pygobject_3.52.3.bb =3D> python3-pygobject_3.54.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.52.3.bb =3D> pyth=
on3-pygobject_3.54.5.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/met=
a/recipes-devtools/python/python3-pygobject_3.54.5.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
index ae81f1e31f..f6ed3ff5fb 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/pygobject"
 DESCRIPTION =3D "PyGObject is a Python package which provides bindings for=
 GObject based libraries such as GTK, GStreamer, WebKitGTK, GLib, GIO and m=
any more."
 SECTION =3D "devel/python"
 LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb7424769c=
7"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D91db794c3adc9d824d4eddabb341e81=
6"
=20
 GIR_MESON_OPTION =3D ""
=20
@@ -19,7 +19,7 @@ DEPENDS +=3D "python3 glib-2.0"
 GNOME_COMPRESS_TYPE =3D "gz"
 GNOMEBN =3D "pygobject"
=20
-SRC_URI[archive.sha256sum] =3D "00e427d291e957462a8fad659a9f9c8be776ff82a8=
b76bdf402f1eaeec086d82"
+SRC_URI[archive.sha256sum] =3D "b6656f6348f5245606cf15ea48c384c7f05156c75e=
ad206c1b246c80a22fb585"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.51.0


