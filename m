Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9C4C44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:38 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=Bdv98e7x;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXJ9HH9S9TSlZi1BgHhfzC3j7qudcXCN6KvA+NCicxoL8TGPWMvNbnisE+XHMRsxouJjbso7ONm9m9m10NU3PgWVW3G3P9RHEVqtZtNiEFva0mPyWPhbMtdm1lh3wTvivDD0tzPYA0UVE/CAuuB7ljByEnP2cBoA4tMP3GmRnIH3/sVihUTnrB85ZyNaalNwlfthohVXMwI+ztWxksNn/nUzvtdSl4Qo+XpurZbNXNUng2NmzWtSXx6OtzlTzv8ViyqC5jMIBpxCkRP6y/65OjTfjGZ3NrIcACadZV/VtQnHRR/ecFno26fDPZp1WaOZlPB4wYlUiAQRVRuMiEJ3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7z0qXDCsUGyEP/IWYdMXb9lglf+2KPW7OLDoE0YIFo=;
 b=QJof7St6ty5jkMGYFFQhDImu15uZvpkQp9FEBYmJ9xS1fr7t0w1yuIiClTGiC/XnyHlkbStSNfWo++tWs34/rSsYirXVcQ/NlwLeqhvE8ONQtQWZvvbAUP3CutwW1dcyySr5kKRNeJYPP9HW4bE8SaS+p4LOdfmp+2w8A86Hvzx/N+DGY4FX+v7WirSjIr8R7gmGB5fcWHni517ZvvIkir22clgxbWKyf/gAB+ajw379IkrAUAqisPBtBKNVxtYinI8Kg2mG/obtBb6oURPjbrV3qyoKE2hsBdbZIbPXy3qBMovD9GMMx/Oc0Ld9qkhosD085fBf6E/z5dHtidUnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7z0qXDCsUGyEP/IWYdMXb9lglf+2KPW7OLDoE0YIFo=;
 b=Bdv98e7xdmgiPLWjVV/fC19IRAngupBp/5NcX575+ZIwhFP9rHFISKGU5tU+vqcbgo4Y3TVJO8e/o32z6bn1gh1CP/Ak2yjJH+SALbAKgpB+J9+SGl9vr5dyqEL1PZjFWXoe/dhKpjscQ0aRcMsen4VQta6LBkup4otW4fCj6aMmn+8V93kUuv1bhXiHRGJ4o2WhXQQovGQSYORZhYm+v5mtPByLWBIb1MtB8pIEtKxwOxwGELt7ITXqF7TR52LpCLDT0lRA+ThuEOYSBd8eaMhxMFI5rLreKPCUEta4NPajuKc5iz5tD6co3k5aw1fzUgXezjcH3SSinkSk4vDzbQ==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:26 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:24 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 4/5] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Topic: [PATCH v3 4/5] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Index: AQHdGnraE65wcJCXf0aJDaNEMhkfsg==
Date: Thu, 23 Jul 2026 08:11:24 +0000
Message-ID: <20260723081118.1558249-5-jamin_lin@aspeedtech.com>
References: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5022:EE_
x-ms-office365-filtering-correlation-id: 102257e4-6bfb-45dd-a9b8-08dee891fd06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|38070700021|10067099003|56012099006|3023799007;
x-microsoft-antispam-message-info: 
 EV7MP1rKVSowymY2mn0Y+FBDaeo+f3tjWnaonmToHJE+dyHVbCwIPlsIyNqeBiXG4WtB7Q5Ablm4AMRcVXM5fC7lYflKhzjfkIO6jFDJh42raPW7fr/Nhi6odee6NLvC6EVFcVNpkXTIiG7leuGkuvKvWv+VdwpIakMSNNQYZibMoMLI3gLqFuNiiwwZXJkGa9C4MTSQ0b6XKb119zV9eAR+Yxob/gdGnLvx4Mu6QeVy9rdrCIIRU+UAvM/wg52HK0aIj6cFbDW6zBsAVAKEHq0yw5lN4F+GUxS55U52oV98auiMcQCcTsWVOzsXGgs3YwtGSvHhAdGtdPCo5RM3LknthR5AhC6wffU1QRcy3nDr2qRvnCWeskuNichyPi3wE57R2Y++BWl5VMxuNPm8bDSo+uZJkZk4tA97hIFuGRlAmSTeX0LyKnkkkB7uwCWuMrovk4gnUrayryTIMw7qeH3Mtqkn1aNQcwkebc224v1+Zg9fBS7RabbhKCcBt1HiLnQSlJaOcUUtNVHIChMQ6567KEP6keBK107yIZXcPVVI2I+axF2HS+x4KMIlFcuKmR/WH89wi+phsorB0YIl2RbhVeHrHm26AVXLNQhLdrNdhlJOhRr24FuyjGDk7Y/pRRlAjyG/NUBNR6ULiGvZStK/KyQbD1Ms2+cZkVRqtfQF6eNH8sFG5i/WnL5z6JvDATtDzk59K74hlVI8wT0byg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rbFWCneljhsr8+Eki4Cz+/88SAm4+YC465/yxo3+49D1mnXSHh4LUaY0yjbh?=
 =?us-ascii?Q?rQTzdO+ve+355BgO+k3FCj9Y3ccAEsOTG7ONiDJwFSLmndNwn9kvHAAusD9w?=
 =?us-ascii?Q?dqoBr0DkrK4DKpJ6FLcCIcklx9qkC6715ok2qjS/vLRWZX5g7JqfZYM5MZAm?=
 =?us-ascii?Q?zGRhQpyt7NJGcQWrEWYs0GBWpVVvxhaqt4b3vQEcwtIw3Q4em0sBhJcg2J2A?=
 =?us-ascii?Q?myAbrqiCdb7hgjqHZg6gtENUmgvv1WiQLNTsI7NzbWv1UD23mrqFEnAOPtDm?=
 =?us-ascii?Q?QN4OvTNsIyUx0dNxaab/znXhYsJYPuIkwRKRhUDdLb9hWK/iPKOD+LuR184t?=
 =?us-ascii?Q?8ldmQG/xjmOxX9U0NhsFIY7wslczI7qhw8Omaz3LXwU61lATMbSvYnagqR5B?=
 =?us-ascii?Q?bYD+yhpqyAiKUv/tkrNBVeTzaauLoWwydIZrDBTaGGmnCZX0POaUjN2Gr6+T?=
 =?us-ascii?Q?pijpSF55hs5sKe48ueQKodNWCwHgp8Q++FQu2gTNrk0RsRgttz2RohJmbS/d?=
 =?us-ascii?Q?SIxHTU1TUw4S/5+n4uLePju6FzoHJu3ACoJ0cPR5vR5PCs+QSmTr7oPKviZ6?=
 =?us-ascii?Q?6iFWoXSukb2Vuu7sYC1EecTmetQVMRHgVYWOx/9gFQd2uRLBTc/k4vAM+EJo?=
 =?us-ascii?Q?dQQ3wnCpEzUeZ16Irl2RO+M1Rlku1K33eprwF0NC6YjIUV5xrUnvP/YhFA7m?=
 =?us-ascii?Q?pyPjJo0IOrboNyrxeTuYP50AKWi38oIPZNTOUXQJRQ0/5+b1ZiVqlKo4iLTw?=
 =?us-ascii?Q?EB58pYXJC6/M/b+9D+jL1Fhkbp6pvs/UA28jCAxaxPMvFcJZLjiLFv1ubSmn?=
 =?us-ascii?Q?U0lWlC6smd9aqpcKJAbPbIAwMXCE0JU8+cwxi/qgSw3TjxZoP4Gk8Fu0xHbI?=
 =?us-ascii?Q?2goDS3J7NnQe5MlHWj+jznEssFeVK8JZSIhidvsBFGMpRTFzjqAhwOELLRf0?=
 =?us-ascii?Q?9o4renAd61yuLMHT62/FcMGHVNxhfxWOVH1OM/LqGFyiUEUdIk77asHLlCuq?=
 =?us-ascii?Q?scyazNe4hAmF7Fm4WZhQ2BZRj8GdY+6RhuW43Z1wMhlJ3VIwovx7TW8NeiST?=
 =?us-ascii?Q?Oak2zJT6M0/SMvMtQUJAExgWalWnckpXvUUn8DDCX+jZrGW4GCfddZJSZuUS?=
 =?us-ascii?Q?uFeHMpUv3xSMaDQ074PSysKKiyZ/cMU+Xb+G7XIfenZUmWBDwmuU4cupk9Sd?=
 =?us-ascii?Q?IglnJI9k+pn/p2QNvGyk8j6ElsWUFywm2t2ptFShJN0RqyqAgx8iy5l7w7xa?=
 =?us-ascii?Q?rPP2HA6xoj+lKaEWeLZLAQ+ZArTISaRPcsFKh41d6uuQPQxer0Ta3eIiROq+?=
 =?us-ascii?Q?fJE6po2ev2E6WMO5v6RuFwwstvq49yAKUz6iAgu7fUmuSaQNlHGFRqovgA82?=
 =?us-ascii?Q?UZJJo5O4y+Bkfr3fn8ZVyovR+CvK8m7mSHaK2DqRL48yCjaQKaz9+wwGEin0?=
 =?us-ascii?Q?C7CHjya1fLSa9XdBn0PLS2qNDcv67A8OZvPM/STaXwOiUdhPboZnMNojl7OH?=
 =?us-ascii?Q?XEzxVWZrlYiA5TRH47zU+1/NyFBmpUVZzKZpLX7vhDJY6td6c3wpi543n9kR?=
 =?us-ascii?Q?0rmVlirMvE8ujrP7PmG61+mi4m8WlqcDGz10y6Z03XH0a/UHoE3sFK5962cc?=
 =?us-ascii?Q?oZO1kqO3BXeVctbTFQy2HAaxgJ9HJJjE37yaxQyrCrNbZf+0gasqNKkdehD2?=
 =?us-ascii?Q?TbYA1DFjoLRrboIAdMMKeGgWqNE1CA0rK+2m+WpRjO5+hkXkoAm/cwWaXslv?=
 =?us-ascii?Q?f5dp7DZzNg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	lNeFpg3ewh25USJNY0nkInwF3qeuxnkXY/9b1Q+jrBhPL9dYWy1DAVy5MzA1fJA8t8bLhj+L7bu1beUT7ZPz5Ekh3GJwSK4bq0u1eRaW2JIYxgI7XZwnh/5ua+2W2IB84u835Z/583AgVPhpg3lju/hN1wostt9FqoBENXuefU6OxT/vfMjRpWuMVex2UfSie4Ao4NwCFq4pcegFyQ8MtzSwmMnhXd16le76sJTlXYtaTp2YxyrOOf7c4f+ddDmtLRASYRo0mJoybv8ZbBKwTAn5jSuHCU9X+O0pJtUcVLDmS5ZEJLsRVAct+ewuSK2cZo0hrabizLijkDKaJFOujg==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102257e4-6bfb-45dd-a9b8-08dee891fd06
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:24.5648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5e66MtNQ5FOA1qPW/6j3Mo9HYPtvxUzkIW5d0eDVV1x6KJ5F7IhkHPcpAyF5lI1vHnxusOViU0/+PlScEiMHu3Wvy9qshKMwUi3IwgtRy2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241787

Add a test recipe with three git SRC_URI entries using nested destsuffix=0A=
values, where each repo's checkout lives inside the working tree of the=0A=
previous one (level1, then level1/level2, then level1/level2/level3).=0A=
This recipe is used by the devtool selftest to verify that devtool modify=
=0A=
correctly converts all nested git repos to standalone clones, including=0A=
the case where a repo is nested inside another repo's own working tree=0A=
rather than merely under a shared plain directory.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 27 +++++++++++++++++++=0A=
 1 file changed, 27 insertions(+)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuff=
ix_git.bb b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffi=
x_git.bb=0A=
new file mode 100644=0A=
index 0000000000..880f0f0bb4=0A=
--- /dev/null=0A=
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffix_git.=
bb=0A=
@@ -0,0 +1,27 @@=0A=
+SUMMARY =3D "Test recipe for multiple git SRC_URI entries with nested dest=
suffix values"=0A=
+LICENSE =3D "MIT"=0A=
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"=0A=
+=0A=
+# Three git entries genuinely nested inside each other's working tree (not=
 just=0A=
+# nested by path under a shared plain directory): level2's destsuffix plac=
es it=0A=
+# inside level1's checkout, and level3's destsuffix places it inside level=
2's.=0A=
+# This exercises the devtool code path that must convert every nested git =
repo=0A=
+# to a standalone clone even when one repo's checkout lives inside another=
=0A=
+# repo's working tree: the initial fetch uses a shared clone whose alterna=
tes=0A=
+# point into downloads/git2/; git repack copies those objects locally so t=
he=0A=
+# workspace survives 'bitbake -c cleanall'.=0A=
+SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3D=
https;name=3Dlevel1;destsuffix=3Dlevel1 \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel2;destsuffix=3Dlevel1/level2 \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel3;destsuffix=3Dlevel1/level2/level3 \=0A=
+"=0A=
+=0A=
+SRCREV_level1 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level2 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level3 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_FORMAT =3D "level1_level2_level3"=0A=
+=0A=
+S =3D "${UNPACKDIR}"=0A=
+=0A=
+do_configure[noexec] =3D "1"=0A=
+do_compile[noexec] =3D "1"=0A=
+do_install[noexec] =3D "1"=0A=
-- =0A=
2.43.0=0A=

