Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E68DC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:54:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10669.1784130870282044810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=cP8pqrpW;
 spf=pass (domain: siemens.com, ip: 52.101.70.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF+86QQCuMVk4NbVXEUFuVGego7ix5V01KPtndOBRMbs5eZRV8ZZYzHX1NftAhWHXZxBK0ifsibOlSybRTXszWZWgTlCIlAYWB7hbHKCcfC7rxDocWIQYmF/U3wq2/Ycnqi0Rh+lwTAPlaPIobV6Tdh81dcrbIVUh+BA0Cj5t7bZw/c1Bgd1sVzFz6bOJ7hWhVm5ZB5n5izKZbemXIjJw5ftkBIoLe6ma5zYN9Nv2OSFYaCr1HGLSK/g72ReMWacZl8nqNFY1q13tBCHlN8+NaDUJI3ETDiPRWnu865Cr0UiWWCppIu9a5noV3RH5Yx/xvRD0vZIj+X9u1cCkEci/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh5miRYAWNNX5dz0m3sAfMVguA4z8e32/Z++IVfq/ok=;
 b=QEGYdMikCxL3rizPQHHRvzXN3oAu0ZW3ndvgdcpZYO0ACxDmYuEnTndDL4a5pdkanX+U4s9nhRXLoZW7VHCrCFIWMZ3z5wrkH8GeJtD+bR0T3MTvTlpluOrGxaSuyjhKlVlZB40oXZLxlEvb57YGKSj2nyT+5n2A3y075POKJSTnXcWszgGvGJgIk6q+kewiDo3yRPEo9oM9zCo4yCfsq/b/6jtY5ke7wLWArFCZRPS1yrhFDHFx/3oODlRTzyVVO47sjwrF67Gt22kfDJkis0+z25a/iRUJNAwXNcY5wisFXUDOvsWD0G+skjD9EHxgnMKaoJXzxmwpVt4IGhbRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh5miRYAWNNX5dz0m3sAfMVguA4z8e32/Z++IVfq/ok=;
 b=cP8pqrpW/zCuW+y1JgnDA0hblmtByHFHCiJT7pB3UG+a+Ix7NDqh3Hy900AbOhoP4Rg3RFle7A2WEbKeiZlwsvOB0v6A6OAy2XYeUqEK4FvDr+VekhlILHyavpZlRIt0giqTWa2W641Jl2zX+TrmNTy2NVaXBrfBS69CyJKf7Esgl6oqdRAO2l+bj/7Av08qrLWvWZjt+RAbdznFwbmlliotwXFuqFG6y7M2s9fOepuERK2J7+fFpzoD/ceVhWWOWSc1Lcl3sSx6H3DQhZ+1MGVpehNy8mWW9DZfHrFeoCT3cewmutRXm3Qf1Lhr6N21/MM1zSdjcC/LIC4rarGMxw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by VI1PR10MB3661.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 14:10:58 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 14:10:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [PATCH] kernel-yocto-rust: add clang toolchain check
 and lld dependency for riscv64
Thread-Topic: [OE-core] [PATCH] kernel-yocto-rust: add clang toolchain check
 and lld dependency for riscv64
Thread-Index: AQHdFGK4RQcq+CEuGkyD37bcxx8UDLZunZkQ
Date: Wed, 15 Jul 2026 14:10:58 +0000
Message-ID: 
 <AS8PR10MB5073A2354106A5B1EA004D8EFDF82@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260715140251.209123-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260715140251.209123-1-Harish.Sadineni@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8198a6f2-d93a-4393-b517-1c5731fad7c9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-15T14:06:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|VI1PR10MB3661:EE_
x-ms-office365-filtering-correlation-id: 61a179d5-d3ea-44e5-0473-08dee27ae4b3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|3023799007|22082099003|55112099003|18002099003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 o1ML47nTRGDdWvrBNx+YLNg7u9D0NH8p4UKlPqoOXMscjjbedzr5dC4PwzGS2GTB+B7MZ7DEuCBBLKm4zKqZoO6selAp/f0V/No2Y3zNol7BRKYEkRtlwuaXVJD7TYn2L3tTqTy6VCKpbcmqRiY0dLcyxhFqmnN5l6xxLYmiK3WKPiGAo1GqiSr5Qz33Jx4onuBRVTVYFolBE001mOUujTteUXw5BQX1Th8iA1D+tKQvZlboNo/4fLvR3q9IsQ6gOw5Qrzmuc3sEaKKvZIrrSxDNBiIoMTvUmx6J4/IycAK3AHecIf7FLjVjEn4WF6hw1DCTWZFsVQSLndUk9ELhET4xnH5T0tuSiYraYyA+is6XItatEX/5RQvPUTDRiPUJwCY8acidEFHVZ7954ApM8xrFMWPJoNNanEFKv0WFf/5IKrn3fsThFketiWxj31n37oz0auMphZuSr/weO+97O0tavWChjCFViaB7HizfIlKiHT6P504wsdi3FAjRGZJQ0z2a0DPmytY1/OUH0owqYhPR3WmsS2z+HAIc7z+y2bL21TEavyMGr9K+oML8W3J/PsYuDKyptRky5EmwwZjGN+AkE5eD3QEeHse+i0YEW0CnSDg6+P7aZ9/z7n2apRqDadRUSbchuyHeQ054Ev9Zob8HqKP93sQAynzq/oXy1X8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(3023799007)(22082099003)(55112099003)(18002099003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DMnyI36wkHwcYWQFT1uky9mfb6UyUXMkuB/vuuoKrlPPBjY7WMEcb9itpUGE?=
 =?us-ascii?Q?nSlIYE2+KfQDq4FtpK1LtXf/7StJtjH7B7RLjWQkJlIWaqIhDKitWiO2Tm3a?=
 =?us-ascii?Q?5RWGORrungh/oqk6W5p5VR4uGTaOqwKd+oDaz7TqT4MF6RwLZYzZ1w58q9Kh?=
 =?us-ascii?Q?B4qlvsCj22DilyUYWLNb2QEyxh+xYveDAi9v33P3rhIGtknuGf4LnePtZNB2?=
 =?us-ascii?Q?+SdFHMwbaYBNhFAkPJblSh/cE1e6R04R9s+A8w1jq5YLpZFPqJYkzritoxgz?=
 =?us-ascii?Q?F+/oNvtyx4+oeWRy4YPwA/3g1JHNE/U7WGnEnZzV9E9KFwOLqNqrLs5xAIZm?=
 =?us-ascii?Q?0X9XSrv6uQe0+gJGNET/yl8Ltm2QLrUvgaHUT4jC5utNQf+Zv3dUKCH5CWqL?=
 =?us-ascii?Q?Lwqe5Pb97x9T8icV9bHXfnNOYt0ntwHjNaWd94q/+9EyL6690nNqrBf9yhko?=
 =?us-ascii?Q?7x/QkzKWZKHEWB5ui+Q3/qQJczCm+vM73+gd6niv+LvKYzzVlBJdLDRV8I0u?=
 =?us-ascii?Q?doSByWTt6eRWQ9UFLsgXzq2CH+8dAN2Ls95EO5i55FE1z8ob6c1m2PCYWNiz?=
 =?us-ascii?Q?OfwHhSA5GHG3YtO4ewsPLVZO/nOzThs/iqyj/5Zzptsm9h2YvEsdm0Cy8EL9?=
 =?us-ascii?Q?IK+4UXJCN5HR5AnbCb953LvseN/3QiFPzLk0HTD57D0lY0skPKoIzcACpk4Z?=
 =?us-ascii?Q?ESPsHjRHTOyyEsbBQVgMHTdWJ8vpwU2iqT4Ka36Va+5afqGD7saGu/hxyi0Z?=
 =?us-ascii?Q?29KlMzsgmjeKUp8PXOekryyQStnAge805tdrsmIHws7xt9uBPXP5MKjCvPnT?=
 =?us-ascii?Q?xbZsNJ/kEr4Mb2/gsbcEjbpGbEanL3UEmVV52zmhDUu98Cjb/jm/bR7T9Y3X?=
 =?us-ascii?Q?FVOTJhXhPF7LA/Hw2vwtXRk6jrkn3OR9AgjimDzfkaqp7A+lRWFJ+URi6/eG?=
 =?us-ascii?Q?i15aT+w6/ARbBkTv6J/W4sUEQXpkkA02++uQxjngVf0zjVuW1BoepXoR0lgr?=
 =?us-ascii?Q?yyZvjR05NOJ2clC6JhMM0MHQgTs6ic4fuf38cA/B0WmzOwMvCDSS4kq58r/f?=
 =?us-ascii?Q?Q+yhB+AVi+Agz3JGdckAkzp7yTF3wygGpdmggdwa22MwqsiFjmGPbwO8AImP?=
 =?us-ascii?Q?E5j8vz61ujHt5RlHloqaILD31kZD7Etcei7KiuGF3j61WaEDtsLyc+6POjEN?=
 =?us-ascii?Q?8ueXXQ6OpAmXFaVn79F2sDyQBquHttT2ltvWKJ+p25f+NpIyi51H5wi0nRSG?=
 =?us-ascii?Q?1qMMiGQ+x9GrABGEz1dixfLxJsab7EnlC0/qls9zz/QUtExR5P+EJVMNkpOJ?=
 =?us-ascii?Q?HKSCAcrgD9Wuh+y80+FmT9yZIptJHur40RTEg20/73E5QPBlsoGsYrVHgwJY?=
 =?us-ascii?Q?uxLf/Hb+7e8Az7pGy6oLG1AVWJtSaHI1EVGOh4QoKrbzjjsW0HJcFsOWU8PZ?=
 =?us-ascii?Q?tqhDaj8iReqOPaAMfWCh93Dz27or/8uRZ4La3bosw6ebNEliwwliZpGYyKib?=
 =?us-ascii?Q?46jr1vUK5S5XQb3jIxZ9S8nAzYhvjAWQAUe5UyAzOvuL4PCG1xboPq/PRriE?=
 =?us-ascii?Q?4uTdYxrt3jYl5ptzPLcOrVLgB65ykwr7FJ3gr0DzH95nlr+QVjYNxqZ4ULR1?=
 =?us-ascii?Q?q2nEqVKpEj4uZQ1Oayt4YEYsrC4fCwjljX7TmtsMn2Jr+n8GBSl1JuW1HiGi?=
 =?us-ascii?Q?SEhSgIoMo11K2FEoln2Pl/CCl4g6th287kArMq4pq8+ioarpOnU0idH2KcIW?=
 =?us-ascii?Q?h+SjiLntsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a179d5-d3ea-44e5-0473-08dee27ae4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 14:10:58.3528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdeofZfg/NtFY/JfH0fR5edBGKZe4LzFvmkVc6sEw1WX8X0dMjyq7Ug0SPjzWOeipt1f5SJ4AYDnZ2WF2Qv2JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3661
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240985



-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sadineni, Harish via lists.openembedded.org
Sent: Wednesday, July 15, 2026 4:03 PM
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [OE-core] [PATCH] kernel-yocto-rust: add clang toolchain check and=
 lld dependency for riscv64

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Rust support in the upstream kernel on riscv64 currently only works
with the LLVM/Clang toolchain, not gcc [1]. Add a sanity check that
fails the build with a clear error message if TOOLCHAIN is not set
to "clang" when building a riscv64 kernel with rust support enabled,
pointing the user to the required local.conf/recipe override.

Also add lld-native as a dependency for riscv64, since
lld is required when linking the kernel with clang.

[1] https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-r=
ecipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..3f9b2ef6ee 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,19 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/mess=
age/229336
 # Disable ccache for kernel build if kernel rust support is enabled to wor=
karound this.
 CCACHE_DISABLE ?=3D "1"
+
+# Rust support in the kernel on riscv64 only works with the LLVM/Clang
+# toolchain, not gcc:
+# https://docs.kernel.org/rust/arch-support.html
+#
+python () {
+    if d.getVar('TARGET_ARCH') =3D=3D 'riscv64' and d.getVar('TOOLCHAIN') =
!=3D 'clang':
+        bb.fatal("Rust support in the kernel on riscv64 requires the clang=
 toolchain, " \
+                 "but TOOLCHAIN is set to '%s'. Set TOOLCHAIN:riscv64 =3D =
\"clang\" in kernel recipe (or)" \
+                 "set TOOLCHAIN:pn-linux-yocto =3D \"clang\" in local.conf=
 to build a riscv64 kernel with rust enabled. "\
+                 "see https://docs.kernel.org/rust/arch-support.html for d=
etails." % d.getVar('TOOLCHAIN'))
+}

This is not a good idea.
It will prevent the layer from being parsed when riscv64 machine is selecte=
d and it contains kernel recipe for different machine where rust is enabled=
.

Maybe switch bb.fatal to bbskipRecipe?
Or put this to a real qa task, not to anonymous python evaluated at parsing=
 time.

Peter

+
+# lld is required when building the kernel with clang.
+DEPENDS:append:riscv64 =3D " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 =3D " lld-native:do_populate_sysro=
ot"
--=20
2.51.0


