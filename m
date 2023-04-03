Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58BAC77B6E
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:24:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.68627.1680524683863505857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 05:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=pg6wjytw;
 spf=pass (domain: welotec.com, ip: 40.107.20.71, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReE2T5zr+bItmtIeAkDaMMAhQPKUusANG1/B7P5U/tHxmRNc0Ft3Kv9HA/zjYIuyvt+otSpUG8vxR5uxenWVKgKeqVP8ljODGik4cSrkfJ7+3w/51AUOtFaMIy1PrcbLETNXgVtNkpNDyNy7Xfbtiu8QriM4V/F09gXUPpM54Mf/IGnC18TQDHxmgvte7527t1kGR/Y/0ohrLQi0pfSayzzuN6l5qLgOJd2RKWjAu+ffU3d/nBoDERNfJeAlHxyjJSgfPcJFlI2TmRuzMIAqGxJdDrIcWeeeKjsqoAFIw+qrMQNaohR8dTkrIPouVk0u5hfzUtv2kV5Rd3w+BKEtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgEb4Md2ajTxys3da/TsxRCoX+PPWiUbdcEWaP6Dt6s=;
 b=XN+s+BfDPa2V4y79fXtz+128Cm2yXvswDXY2F/hv9z7KjtRnjZkzEgwyD3XDJ14d1Tb2bq8D4L0+VooeHccZYC2zYVH0RZZiKothgX9nBbR2i3DxtpvsTxJaawT/Ec1yNh7sTiWid3qglqJ9CR6CqHA29bS48LjIXtYi7gDEEQHxp4VC+12WOG0KtCJhwEN7qm0kF8Aw/YkajJ5DOqnKeYhXquvi5MZQx/j7SXcCdb67WlIVbGFtqNKu1OBCOzSa3Lk4ZweKTaZxakymByHgQvOFEn5kJMUqUlWlSaKKf70LCz1xmjYZNT3P6qe0J8aFZjWovbXqocJpaXDHhpIDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgEb4Md2ajTxys3da/TsxRCoX+PPWiUbdcEWaP6Dt6s=;
 b=pg6wjytwTBNW8LOsJPN3xtr7Gp/Cps4JhTuKmNd1UMMc9jKP0IQPhlS46ol+jzrgcdP8yK/1ht5safvCaAp5IhbHVxui7B12AfZQY00m/rFocSY3rdZ4k73m/jwzAjEz5gTHWs0FwR4UP+i3TqlHHzARWcf1I4aJfWrYpcAoNOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:24:40 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:24:40 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-core][kirkstone][PATCH v2 2/4] libarchive: remove acls, xattr for target only
Date: Mon,  3 Apr 2023 14:24:07 +0200
Message-ID: <20230403122409.3067997-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403122409.3067997-1-p.lobacz@welotec.com>
References: <20230403122409.3067997-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: f0568b8f-9513-4645-492c-08db343e6578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wT0ey9GO3p+IGFpEAFXCQln7lYbIEyCB3zyxiwSAMBZEjKfW1X5fnSkylr+2x0+hMmkI/E2NvIx/p+2RCDIdd3eKwjdFQ8jUu3W4wyQZyyzk74u2ri5/EAl9sOliCdRD0T1PBgT9MfBknUXF7qNSTZsmm/8TLuiUqnO1f75W62UTCYgatHAWnrLJtXfFO4GgDysvIb6cTyRSHygdZYb2spHuqpDa23M2FSO+HGX/a0lRuetIILSEklf6fjeRqn6mEgmLw1+pmFoHj7+ZRbHe2HVcxWgSeaptT06l5tJDjS60XPU13wq0OvrKQZmLUmOOwlNEgoVbSyKFYJTv/1rS5LUzws3ywHW/9JxbFZeJcxGCCPt0mK6f0ggIxXGJEbnkfiuzDv7X2pGIF4p8gHrMCKrqCrM7MEbEnr4GWRlcovYHAUJM7kaemE5nBUDwcsyUMtOZvFYNL1zJYFDrDf1czURyi0GVCu+ndYlZDivi4Kw00Ev38InaFUr+Kr+d9cMFrGH63r7sZ76KXdLmKQ0rHfF5duHz6VdxFIZnHaNx23BvhZxLGPa0093C3wRj83R8dcapKxebMcFBHSoiUtiPeWToZXbdi11X39WdtxRsojeSX4989QXY5LXwzbaJ0G6j
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(4326008)(6916009)(8676002)(66946007)(66556008)(86362001)(66574015)(66476007)(2906002)(41300700001)(316002)(478600001)(38100700002)(36756003)(52116002)(38350700002)(6486002)(8936002)(2616005)(5660300002)(6512007)(186003)(4744005)(6666004)(107886003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/eaOm73jq/RHDp0HINa7AuNKg+Hj2KTgCICeFqmnX+bzFWz4ygHIMPQD2Liz?=
 =?us-ascii?Q?YSBdwGipfrzVv+Rq95kHfMYsEXzHTomxcUmJgWa3caIRoMTgMqs/U0n+9Zmv?=
 =?us-ascii?Q?2uNAq8540HyR6z9135qv2CLg2d1OEMuHeoarUw2azN1+KM9Fv0HZlIqvTMZn?=
 =?us-ascii?Q?lxjxZDp0NuF3TKVKg6eyoEnSdsaqWDiKZ3xm/kA9+EOrYM7U591b3dS+Q9P1?=
 =?us-ascii?Q?01hZR1Sju5E00f6mUICZ7pGZcMvu7a5h2gGcEdP7iUPWXa9bIuV0oSFcdCZb?=
 =?us-ascii?Q?XieB2xlKrI8CkQTT+8JUlsHNDuaHlfUgr60J+IsCsSRdS2opEitJKGtFuKKc?=
 =?us-ascii?Q?1RUFai4NSKuOkPs0kEm6s4qNM7nUrRkp7N2FcwwE/8SfGgkMqyBsqzsaA8vZ?=
 =?us-ascii?Q?r6F0xFubiU8TYenUeado2zPu0aIum4YZVihgP+oy5/PfxJgCz0hvArcHhSpw?=
 =?us-ascii?Q?YX2l/416XLFF5GaVCvpbBoPtTGaLGMB/4RuQE3zE5LvMGr0FXqa2LEg1/MLT?=
 =?us-ascii?Q?VCezksTeviZxl53YmL3ze7+k3p49n8ePnKO2RLrkE6rHR63ojp0UNvgMwp8E?=
 =?us-ascii?Q?lDKqFXDbIGMxTZCzU/K7fCR7RWP9gvjmpnY4Lona+urYxV3lRjPBcmiquysO?=
 =?us-ascii?Q?An/nTUTTNsM2Rak6KkmGsxmW/c4ZigccsRI+L7cYZAxPc0X6mhW9uJk8y9FS?=
 =?us-ascii?Q?AKuLvUcMkAAoToaXdXigVbU1YBrh8EPlOg/K8bcAJf/wKZk5ShYOuJAXBnz/?=
 =?us-ascii?Q?j3k6Tj9EhWgoD74mjohEs26drEKhY/opMtWU38xuvIzl9tuec7C70q0K/nwu?=
 =?us-ascii?Q?yR1ylyFGvpgYXOl56bq6GalIr9yfwHuybH4omXdj7UtwOU4k95nl0aOhvtst?=
 =?us-ascii?Q?D3l+smX4+bhtyPL0149uJCvSsBPNpZD5waHs1BgYcZUjJnTWn1IIAQrb6SJz?=
 =?us-ascii?Q?qmiv+bRi0TAJTZCIqHk+u4hr5aw4n5swD1EoJZZjGthlmDtS03d9lV57LYVX?=
 =?us-ascii?Q?bJ5iCAAwr2kQKQgibLbohNwZJOAeEMzwrqTBdiQowUhsBcIAP38rT2XHjUSJ?=
 =?us-ascii?Q?UD08Np9CLLZ7r5ilbVOkVGqgughvTntiQzjQL0UrENJs+4aj/ozG3FDZ4NH/?=
 =?us-ascii?Q?lk6U+CS4RjSTxzcTDdWbe9/5Dbm5z9iNTd6lEXR7+mk4y8HrjIkyA321FrB7?=
 =?us-ascii?Q?gArukvDlg7B3wfmqc+7QFJLVNYGiiAe4xkhisXGI3Rya/sBfZjwoVQs6yNOe?=
 =?us-ascii?Q?rQZFou8mNyO96Bt7g+mBpgaC6KFjDUqGnUn0MxgHE30dk5zdOXfg2snYo93b?=
 =?us-ascii?Q?ag6K72asiTbpQwwaKuTlmwQ2GdUi8pkcSAxfl/oXohiYhxSY9ES4xBbVwde3?=
 =?us-ascii?Q?krCnSKyn2ImsGva6AlwULLlAbEkGM9kawOt1lhak/gx8r8XtSuIxAzBMAbaQ?=
 =?us-ascii?Q?FTIYBXC+U6yrkOkaI525Rvl85FK3aFqQBax8VryYOYc1Gvra7caYamiJBAev?=
 =?us-ascii?Q?JuWn/hnSNCZu3Q+XaxvBeq2N3noBrDxSbVF/I405KaE1WiOiiYnszVk7biLG?=
 =?us-ascii?Q?98UovS168iCT3RGKC6ZgreHlj/VCmAhnDpDgT0yw?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0568b8f-9513-4645-492c-08db343e6578
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:24:40.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVb/2PWjpnUas7ge4yi+HypZMA3aGZu+z3HUvMkQ2f6lkHSfazCcXhppFulEYiUf+QuJgsPvLwt/5OEg7cL4Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 12:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179627

Libarchive is being used by OPKG package manager as default
API for extracting tar files. This fix allows us to extract
ipks packages with preserved ACLs and xattrs.

Fixes: [YOCTO #15091]

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.6.2.bb
index acc84de9da..15b1a88ce9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "e2fsprogs-native"
=20
 PACKAGECONFIG ?=3D "zlib bz2 xz lzo zstd"
=20
-PACKAGECONFIG:append:class-target =3D "\
+PACKAGECONFIG:append =3D "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
 "
=20
--=20
2.34.1


