Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6AFE7718D
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:23:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.27158.1734884579574530729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=YIAetN2p;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.46, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzBfuvzfg59TH3bGK7k2vsjOv+Xzqu0h2cddfFU7rqMzme+G9TUqLTKcelwNNtCl2QS0K598DZ2eISchYEod2/AHlhL4YGG2i6GP1JC3reY1yh0QJKTz/nYB52F8UdesJP1BbADNkAO9JnGe9z5anrGq1hG0ZTNEZd6yxlK+UH0EZalDXtZ9q5CnnJEyY7W/MigyNYK+zunUWY/blnPaahXD7BxUBlKhS4HBBzIyza5+Ffz0N04M1AoHqXqZ5HyobWII925eWd70srb2KulSo5xs2W0VZqy2dSKPRnNpTVpbEON8NNCmRhuCwAm1bj9Lshoz26D5kP6yd1IYDAzdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=mKK0en+pM+YfL4WZxVlGoz0xYz2UOyvQueQHNlMNAg/yxsjd9sYLhtXJ27g9UaQdbToO8lDxDlKKuG5t6QJPo9lVDaJXaDC1BQb5KBMGnweOicV3zJF9aHp2GcZRubhjST4QbEgWkq7GP91/BiRGdvIFIqwRm4GrrzxSWbtu/HhOoBirgMJgpwDrztm1XOGoL+KWPuYOt/Ez0baoLvsU0lZUNoxWKGkdHJn9npCPW8mKej4ETfgiXEeoz0PzJiTE2E/1t+hrR+HpFENWzlFdWkXIN/LmHZMtklt4EcNakWSn3xcIbNINMwmTQWWKmme1qKo25vxDTTy6+XRho/6VQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHV92y8DSYfToHl6jXQa4dt4yHKHiEzMvXmZcYJB6OM=;
 b=YIAetN2phk3g/XPvw2RaU64cF3V1YOtbnbvLajmMcJycxvnuLrqE49oJoeCcRZSWw8a82Yprc2PByNAMbLutK3PBENPPBH4A9p/l2GjsloGafPK5N/XE5YZSJU29yz06pgLbX9m3CJkFGKZEZogW+KNoZyEx3INaWgIPJoj/XE20X9oOGGjuaId0WDVgmoNgT5aihTakIznWLxUq5Ve+WP1tNLMWyw3hQuURc+mwx/V9Qtdcwt0+yXn6qhw4uwW/OEvrNJ/1z6GxFeYcRiPpTld3Xqsi0na5x/8+pMumT3P56BWvVT5VTbQxfth8Z7zLJmL4QZ7C7kY/CatQK2SrGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sun, 22 Dec
 2024 16:22:55 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 16:22:50 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 1/5] pkgconfig: Add pkg-config-native to SDK
Date: Sun, 22 Dec 2024 10:22:30 -0600
Message-ID: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 92743eef-e678-4319-7517-08dd22a4e0e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?72i3dfMVQPROoywnntpqfgtO8D9YUNn4NP/COouSOAtQwOAU/yXf1N8MjvdC?=
 =?us-ascii?Q?xwKysCar8fidS2yjFX8NERhpDWxNo0nFeJr9tYdLjS7C940Yu6szPVMFZIyz?=
 =?us-ascii?Q?ZSRLoKzLFBztDoB4fd/C94dVHiOJ289tt56ZYdPCdsi4deSAK0b3ZvD4Qph+?=
 =?us-ascii?Q?cRLHefY52vVpndovXvbvKBwHVWqh/4KZWWMYTXjCq27oMG+LsjRn5fdAnPZN?=
 =?us-ascii?Q?Zl8SnHbrjbruiOiEqRLo055jo78krTs0xGlIZtFwZvPVoK09Jcor1R7qzMHm?=
 =?us-ascii?Q?k7tAoN1OqYieXWDP428PTTCB4B1EL2+fVLjGLI0h79EM+BiiiN2IxNkDP2sv?=
 =?us-ascii?Q?vF3zkBzx++Xuy2maL6UIH195oiy5FBx9LVTv4tXObI6G/VmYdqAa2iUgI06b?=
 =?us-ascii?Q?pMaQpe5KmTGq6QaSOwJijxkbw+qoAu3CykKrujavRRFhAAzPdZ/ZJJQdl5df?=
 =?us-ascii?Q?KptEzTXr3d+Lds3G9zyyMnG1FDBGxOtBSJWleWlcy8+QMN+O4zTqUWxhtkUc?=
 =?us-ascii?Q?kW7kJ4lD00tRHkz74+YFID+FLY2VUMnFG3nl/ITY6Rle1nNnQe/goXKIcb/S?=
 =?us-ascii?Q?n3rohvkFoCo/vqgOR6JzZ3YNgSS+BcJUe/dQgjwYkm+IrqretYATI7t/RMoJ?=
 =?us-ascii?Q?BEg2gctJxFj9grFK5RwjpEigGO30tlUshkiEIRmjL1lNnNAou7PT1DklkruE?=
 =?us-ascii?Q?0sI/pc7gnPvX7g4tStHoXekh6HlSYzX32o61iGOCaW6lsL/nn7Bd19HG0pZz?=
 =?us-ascii?Q?LHQl3Zh51uCmdyLWVUYJfsIzjmrbenNPF8UvNxW7tEzbXAXX55i0OsZmwtNA?=
 =?us-ascii?Q?45IYveUnNDEb7ESUd6gNsmZ0wInWIWEW8k2qtivcedljYYItaIqIkmcK4hIu?=
 =?us-ascii?Q?zx53AQn2YmPJGjTzrja5eoGdrFQRQAOqQnyQGdJWPbU2ZlfLKZUq5UiqawhA?=
 =?us-ascii?Q?nwJ+akZHkA0/Xz2Y5Y67ogfiTEjtpSJn6Pqm4wBvORjYfpbZW2WFvFnfEY6G?=
 =?us-ascii?Q?yTR64LXcnzSLlkRmpWer4CYsLq3g5kfZK1o64O2zZsz6UYKxVNAyi82Zbo3M?=
 =?us-ascii?Q?WG1o+Q4AZSj+7N4Nsaq273/m+UlIUNJ2vOi6PgiR4qL0fgGCKkAbSXcV/ug1?=
 =?us-ascii?Q?argk+gWtS62NhYwKOHWmVEwlqKPPZ3vKU0Rmyb+A4kaCzFg6yuNGQdOiWpaB?=
 =?us-ascii?Q?O8ixaMGHpqAUOydGymBjcwlHqRTt1rYvh7lrYsGSJQellYPay+b+sKB1rVXM?=
 =?us-ascii?Q?O66yEbQYpWZ+C5ktS1H5VT8mq0P3GyBBATcPW2/f1wB148d0uzle7bRUdjRV?=
 =?us-ascii?Q?s01l/02bMrAdr+qMqJG5zBLaN7k9xWgJDFHTqWcAnXYBU+cMfpoVjLQ/5YUG?=
 =?us-ascii?Q?9X1FRoxIKPKakx/J8j2NxnxuO+x1gUm+Fhd8/gQFxdjD676Ca1LPEXFeg6/D?=
 =?us-ascii?Q?RP15ud+7DoyBPcFSfUnsq1T/k2ODFm96?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mljgu1UcHuzG8/pHlaDIYhdhaEVeI3sv3TJ1kdCbOu+1Ij1vMk5sTCFADErv?=
 =?us-ascii?Q?r+oxuvGrLeck9QQB+Bs9hfliEeSn2ptfBXRPo+gQQg0pVDiCPERm2N619//e?=
 =?us-ascii?Q?aTgVm7jhS5Ok2RXE5tVGAqIp6E/uFtFxZhKRVlTDW+qZLyB5wgMh8GyDsxg6?=
 =?us-ascii?Q?R0d/VreMSEV+jwlSUkHEQP9DbUMpjbU++LDDiCXF8NGnu2UFEBENeCztFMre?=
 =?us-ascii?Q?2vncx+ifRXw1V6A5SQ8pBYBlNTRvPnKmcD9haTNe3JBmCxOGEZu7+p+42K4M?=
 =?us-ascii?Q?sgQ780LSkCOp8ExI+gUd553toeaZYIxZ+fsIHfFquN+i5vOSIhEvjC5nnMGa?=
 =?us-ascii?Q?kqeRWWmOTGYzVCjQrmtfUjrCRMqxHlKVSN8u9r425dZWsRaLOGn96nZCb4Uv?=
 =?us-ascii?Q?dllkZVXOqFmR2OMYVGGkN4efqka/8dA4iw4anGwarY14R33HBzl+zlrOkAQ+?=
 =?us-ascii?Q?ryy6ISgeLCzqIoE0xJgqYNyoq0oB1/CjdFQbuzOw1XZdYlpaLuRYzfgEVY6U?=
 =?us-ascii?Q?J1Vj/iBvl6An2I6qyzLiSsBEUJ46/s7v16ZbdF+uIH8NTx7LG27AVuRwxshn?=
 =?us-ascii?Q?z4sGfkb/PvpGtb2fieuIPxvbs9y/g/QpxD7VZm1pyswlL3izf7eySEZPtfTB?=
 =?us-ascii?Q?vY1GvOFXbyM2LE4TFP3cl9iXuXJuJdd356zp/d9w7T9LD7E5fyOnVnwa4lsy?=
 =?us-ascii?Q?8oY3FYwTIOOs0GYE+wUZ9gPfYj+3JggGLjgixgkm9oQdrURUFGaUuj8uTxkx?=
 =?us-ascii?Q?TTTPDeugaQC/4EoD/v/8vhNu6Bcg3K8qiByg0j4lm3XrhIuHkiATt+FZgiLT?=
 =?us-ascii?Q?CuvQe6x/MKvE6uT9daw/1qfxTE+6kdgWR4LPxoEU+EoJmhVgs1ZGQlOnPhpf?=
 =?us-ascii?Q?v4EI5oOeM7saGES8FxOxvdijQSmVc1Ee++R89H4TQLpw8AmiF6BGAwAddku9?=
 =?us-ascii?Q?jnYOwPtZyMfhmKQDdDGdKiQQaROAqdRYb1/g9B1/JmuniNcaQMPmMKvDKe99?=
 =?us-ascii?Q?BiifglanqhrC07ltOk3RsBKBJcJSK7msqwNzyldSKBY6u4Kc515fMzeEa/qR?=
 =?us-ascii?Q?UqpUE4nhMFqX/LbTsOO68rCdXiTTsZUe0UbW91ffz2CL8zMoQx2d2Xo2haf/?=
 =?us-ascii?Q?ySzMgApj0euu7MZlZb9k7bFc3NufWNWPKt0qLGAnXloUahHrOTC/amNEeqEZ?=
 =?us-ascii?Q?A94/FOxyAgJUzYKI9IBrWXWKYNAT/DVquuVemJ7H6gDYAVZjB0aIOOureglM?=
 =?us-ascii?Q?Ffaxg8OucbdboW5E14TVyiyQNhY8kxEyknRsVWYohyGo9TxzJ8vChXH8PMpA?=
 =?us-ascii?Q?g+uofi7whtZJhi23KBSikxW2zgAEESsxwUfirn98YAkguJJHyBdV/5j/Rxmm?=
 =?us-ascii?Q?/fu+4DpaTpbKOS7nj/H0oKKpLqfxutuwPmdnXKuwDhm+Vz+Lh756DME7eNvd?=
 =?us-ascii?Q?Ckp7JI0r4JgcxHmXEGIvNwUNYM2tVXBQc0AkDToQ4OEx6Ro0VS8sFQGJ8YBo?=
 =?us-ascii?Q?xwGM2SAcwm3JiAfgnBT3QKNlenaLbLFBeWtVJhxIHLlJx0+q+my5vHqmBCkz?=
 =?us-ascii?Q?Dxe8f85FuBo6C9OfenfIE0OMRZM7uSbqeYRmCu0D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92743eef-e678-4319-7517-08dd22a4e0e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:22:50.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6XKu48jp+alEpU6xgcZ+7ykWcKeKwHpvO8RMcdzwSaCxEevk7hUhgasAWfbqCurRIfgbf36eEc72goHSKVciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209007

Building weston with an SDK fails to find pkg-config-native:
```
Did not find pkg-config by name 'pkg-config-native'
Found pkg-config: NO
Found CMake: /opt/poky/5.1/sysroots/x86_64-pokysdk-linux/usr/bin/cmake (3.3=
1.0)
Build-time dependency wayland-scanner found: NO (tried cmake)

protocol/meson.build:1:14: ERROR: Dependency lookup for wayland-scanner wit=
h method 'pkgconfig' failed: Pkg-config for machine build machine not found=
. Giving up.
```

Fix the problem by extending the pkg-config-native wrapper install to
class-nativesdk.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipe=
s-devtools/pkgconfig/pkgconfig_git.bb
index 6f13d0177e..2b298eb5e8 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -46,9 +46,9 @@ FILES:${PN} +=3D "${datadir}/aclocal/pkg.m4"
 # specifying an appropriate provide.
 RPROVIDES:${PN} +=3D "pkgconfig(pkg-config)"
=20
-# Install a pkg-config-native wrapper that will use the native sysroot ins=
tead
-# of the MACHINE sysroot, for using pkg-config when building native tools.
 do_install:append:class-native () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
         < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
@@ -59,6 +59,15 @@ do_install:append:class-native () {
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
=20
+do_install:append:class-nativesdk () {
+    # Install a pkg-config-native wrapper that will use the native sysroot=
 instead
+    # of the MACHINE sysroot, for using pkg-config when building native to=
ols.
+    sed -e "s|@PATH_NATIVE@|\$OECORE_NATIVE_SYSROOT|" \
+        -e "s|@LIBDIR_NATIVE@|\$OECORE_NATIVE_SYSROOT/usr/lib/pkgconfig|" =
\
+        < ${UNPACKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
+
 pkgconfig_sstate_fixup_esdk () {
 	if [ "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" -a "${WITHIN_EXT=
_SDK}" =3D "1" ] ; then
 		pkgconfdir=3D"${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
--=20
2.34.1


