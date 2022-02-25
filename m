Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CC3C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 15:55:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web09.7958.1645804522373428088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 07:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=3gofFde6;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9Hcjceb5kilG1B1eqpXF7+pb/Gj0/hsXIGExQZu/hPVZEAVTCn2vmbE4gmQ/K3R5xc4p9HjogaPceL10x1hOlifBSBcWMeFdeSCgGlLt9j2tKveo0NXg23Yubf9WGkTLBsy74ZSQWGNlhzrPmJu6vxzHL0O5gkQo4POB9x5aqsJcz3G5EqYngZatr4bezPPnpmQqq9zlGvZ82G7HsRPViO+ZU1EQ0PSMuI09gFjekS7ta7ZREQ1YUpGH5HqJJfaNUGZwtCJeee1MMg7uTpn0aTFN0SQYTOydfKSg5Zh9XdYqMhyEpF184wDd/G+0w0nAzsUVUsiOX4ZeyQjxxbtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7birpn/irpVXV7jCUMnJe2xw/Jho614Zg8crH+vkPM=;
 b=JrAgza/UPG+tSrAelSi28BNlNjOkTs0/aCRfiu15vE5fgCodniNRWUjxecrnZZBGAm/1I9lFjBZVTVwzbNVdyBmg9chmKze1D5iQtsLk5UPKYixGw33I5QpPXk6lrEMRuBZA1dxav8sJE18186740TpY2ySK2uUN8tF+KCPnolqcNGV8zf3AwMhwGB5ijp9/b3T+wienI3gWva+S0H1hLMZ46//lnJnB1+AILMBfY0BaaszsqLlItdwYjibDpmhBV63PWvXiDmIHMrNqJf519W1cmyEUJodPLBgTwLH7uVvM9p/hCwl2OIIU9aBGnGmHnqPkvwvm5+7bNs6LF1NPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7birpn/irpVXV7jCUMnJe2xw/Jho614Zg8crH+vkPM=;
 b=3gofFde6vLUqB6vWqBRDbrOaWkBf3f9WNFKcP9/txngRBLVAF52DOAIqzt7R1VoPHtwFzsnMh7eT7Qdc4O17tqcD1mIIuKA2KbrPViUnMVA/3MzitKsBoZfx3PYsEGNHfhiMWEJmKV1e6PKxd9vvMp9yr3/P18shoFuTBGpH2K0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0801MB1767.eurprd08.prod.outlook.com (2603:10a6:4:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 25 Feb
 2022 15:55:18 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::4a1:bad9:11c2:7de0%4]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 15:55:18 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	mingli.yu@windriver.com
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3] systemd: move systemd shared library into its own package
Date: Fri, 25 Feb 2022 16:54:59 +0100
Message-ID: 
 <20220225155459.16592-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0419.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac5f0906-c4d1-4d0e-103e-08d9f8773873
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1767:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB176791094EBEDA65AE96373DD73E9@DB6PR0801MB1767.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d/C+sTj5f07omRGRYbXjgKohM9TaTEwfe6aJmyeYLqoSqo6es6XUtnreB3LXcg9nZVdWDN0prWly9BdnRoGbl8aJBEwRTFNQ2Q1dMr6zyQBMj/74E7Nll1/s+tUtf8t/SunPxIBWIA0NjqQ2BacvSVxvt4pLCN+zWCuQJ45qMgRrgKz8Cvm7gkTqobTjf0h8l/ot9d63pD5zTjyV4ohdqea765GaSGYpZr3zgB79teMB0E9pqtBpH5DOhfCfZ/pmNTDzzS4DkmfReCBDe7CPaTv9T6A5T8vqn1bdUYorLZpcItrm7xQkObMH6aHJ65M8b7mVxcZybJvVxez3JHJYzaNQn8Pk/TJ1dgwRNocjpxITg3fgztsbCX8LpiVBbKNnMscBRfTAHJnkFcHgw2mTibLBkJwf7tfoizjc9ix/L1P7U+5TgnN8h9lPM7wpTPUPpYiUwXNvrZLcGJr6vs4iVJmxFAja1D6EOCFN6902dCOyZKiyf2fGTaWKBA5fGWW08A+3wjmXMrUtUljjMLtodsfU2jlpj+7lwfcbXBd7tbZGvYR9nROSDJY8hxO+2cAl3UoYOnf1vx4DvwrY0hXmeogG7QMPtsRl37F901YAqJPh9dWItULEbmJ43VixzJw28wDpA6F5ZfKJjq6qQoE6Bf+TCffnq0tI/mR8WVPapF7AwbtAugjzWNGF3+hubTHZJm3VjGAWiYb6XmSA0LEodQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(6666004)(2616005)(86362001)(107886003)(52116002)(6506007)(6486002)(186003)(1076003)(26005)(66946007)(66556008)(316002)(508600001)(6512007)(83380400001)(38100700002)(2906002)(38350700002)(36756003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eKn7byEZ0LP2V7ZZG3YBmTCFd1o4l/Tonso8pWGQCeFiN/N7MrWIlNhvKQSh?=
 =?us-ascii?Q?S5JLo9AhcFuQqDo+5uSMIIxyGORD/TjdJOIpMe/ctFF6rF+Csaa0VdMNEsE4?=
 =?us-ascii?Q?KhNBZSauLoiYPyRJNVLlEMLneXMOOIX/DTSqT9yhxpJVIExHBHyXmtXNs/UJ?=
 =?us-ascii?Q?CTdOczuRNxSwzObegeUqucDjksacndyaIGFrUIt24KlA/JanRcl3WGaqyuQ7?=
 =?us-ascii?Q?buz+b335YXM8FwvGsi6aj03BkS007gYxbAMtLWwiiSI9s4UDQTKtVHuX0aIh?=
 =?us-ascii?Q?ASdKchURi4ktoALQb5VojtVX+gYIPKtJl42hf53Gg+U9LWg+kBxzM+VYuR09?=
 =?us-ascii?Q?BcXBvi5eunEuKZd0mX6aybKo3KEVaRGDzeSKKPXpAG3yhfSqGG1SB52xIZZu?=
 =?us-ascii?Q?kCgqz5smfPfuyc3izWIhdzaDWJj/6VhSsdl7y/QWgQ6Gwl6fgpVS1cOhIUdK?=
 =?us-ascii?Q?Xc/RfNXRy5VxqDhFFRIEBci1te0mjYj529DfYV229UPwKPV5O20bmTiyIZjU?=
 =?us-ascii?Q?ONJvCb24g86nObCT0UDT4h1TfxdHA46u45bGTt95LruvWnsK0uXxj73NPChm?=
 =?us-ascii?Q?nuxd4u+IWIn1a0oU1GZnJvr3RTWHrmoqzoWmn/XUmflsyFJz8GVG9o9m+jYH?=
 =?us-ascii?Q?UyYoDS6ydCUlm3G5IXG+2OdGI8xZDogD4ic2C5Um/4OtH6jAzT8D0GcBVwsW?=
 =?us-ascii?Q?9njE0xje1XHXYlgZmCU9WJGrLRfQK2aZpfR1aPsGeMKuz91CVV5BNflXwz0e?=
 =?us-ascii?Q?RS8O/mRM+/NKZ1+e5UbfUl46mXz8gsARG/Z2kVnduUzCIZ2RJbrMsynfv63W?=
 =?us-ascii?Q?oY1zXl9I90sgDJtSoYPskKFSl4VVwxlsm1z/970zJLA7EW92yLsZE8hKstAy?=
 =?us-ascii?Q?yWBbMBq3JEzegaOK86YVXqVZx50uTnPClx86N10JQB9TcuGubtB1bt2KpyzN?=
 =?us-ascii?Q?9tD4klaE6kxEs3fuGzypoqKN/EbULx3q+CJcPy+JMHtD71NfMRv6KUwJFw0R?=
 =?us-ascii?Q?z+HYG8dBWCKkv8Lj2l08uiqVGs2jAQWj8sBkcUY81aHQAT7CVUba5xL0QGSN?=
 =?us-ascii?Q?slAa/b3fAqKvhUGfbQ+RbQJxkk0iauaq/lTWR3i/oyv62kA/9r2X5HAgAG4G?=
 =?us-ascii?Q?UB3deTG4gy7TOMv3QzHPc++VW4CKtomr0b1z0eE5V7eePhiwR7nLwuYKJAPM?=
 =?us-ascii?Q?mMYl1LQjzVs9H+LP1pHEtW5eniN36KE7/Yiz+d56Tt2WQRfS0zWDs5oGGGDx?=
 =?us-ascii?Q?aEH7Ruq5/s8kLoTLpv886euGnj2ayWre2jgpzP9XHbPy7UtkPvgAgIoT/Sx5?=
 =?us-ascii?Q?EjQiUFABmv45B43UNhg8+egPJQV9/Y7kcjBIvAUh/30O156JQp1xvkQdLJ5H?=
 =?us-ascii?Q?72E06CnT4g2oZS+Aowb1M2yaFVdWbKUx9qWlfvYZjA0xK0dxv78XsDatKfWS?=
 =?us-ascii?Q?C78rAUNWoKrfOI53ESweQ6fBKKbKoW1qzBzWmfcQBsDUw1eZWBWbc396keiA?=
 =?us-ascii?Q?5bIsBI8s8bJ0rmAnKfyjqYrD51QnzoJxT90PAE8bB1SD4L4IKSN+ZDJ7EJUC?=
 =?us-ascii?Q?e+SKELla+zVK5RnYFmBgeBXHOOHqnHOT3uBdYTSQU1HLlO1tpZ1/vBzAooSm?=
 =?us-ascii?Q?85RTcQsYUHcfoZ6Vvu7Q49w=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac5f0906-c4d1-4d0e-103e-08d9f8773873
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:55:18.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y8r5LkptljUbLoVeD3LLRb8Fcm9TDfyaeCvn8CxyGZ8JkOfEA7RVYPbJDSVMqVTVDGxF6EpWnOCWvqYDoEy78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 15:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162406

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Move the systemd shared library (libsystemd-shared.so) into its own
package to prevent a runtime dependency from udev package to systemd
package and thereby to a second init manager.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v3:
- Add libdir to INSANE_SKIP for libsystemd-shared package

Changes in v2:
- Fix SUMMARY override

 meta/recipes-core/systemd/systemd_250.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core=
/systemd/systemd_250.3.bb
index 9121333f56..31c5c55c3f 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -371,6 +371,7 @@ PACKAGE_BEFORE_PN =3D "\
     ${PN}-journal-remote \
     ${PN}-extra-utils \
     ${PN}-udev-rules \
+    libsystemd-shared \
     udev \
     udev-hwdb \
 "
@@ -387,6 +388,8 @@ DESCRIPTION:${PN}-journal-upload =3D "systemd-journal-u=
pload uploads journal entri
 SUMMARY:${PN}-journal-remote =3D "Receive journal messages over the networ=
k"
 DESCRIPTION:${PN}-journal-remote =3D "systemd-journal-remote is a command =
to receive serialized journal events and store them to journal files."
=20
+SUMMARY:libsystemd-shared =3D "Systemd shared library"
+
 SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${P=
N}-binfmt', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '$=
{PN}-journal-remote', '', d)} \
@@ -653,6 +656,9 @@ RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
 INSANE_SKIP:${PN} +=3D "dev-so libdir"
 INSANE_SKIP:${PN}-dbg +=3D "libdir"
 INSANE_SKIP:${PN}-doc +=3D " libdir"
+INSANE_SKIP:libsystemd-shared +=3D "libdir"
+
+FILES:libsystemd-shared =3D "${rootlibexecdir}/systemd/libsystemd-shared*.=
so"
=20
 RPROVIDES:udev =3D "hotplug"
=20
--=20
2.30.2


