Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAAEC021A6
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=v0OZGGTF;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFQGRFNaIoZgS7ncgmq8bqyTUrPhagU+HrHMlvTPlqAYrOSKtSmSFPsBVRA5Hx5miZwetQnQg1JvHGSUV/Hki9pIhVWhgGjoCfl9LLYXiGCXOPdHnCYj396nRnMl1xrAAuWeNPal22zraKfgGbaGQ5aOs8qjTDLcvhAmLWySyeZ05tFztSDxwQFIHEKLUyolkVTEr+D7CLiYbHajAJT88xYHohCTHS8PMQXalZ7seQ1VD8qE+k394gtg39rN+ZhWO0DCNgRMbp57Z7l95zsk6gC2f2S7y6jsBZurkW0+5iBPOW0tKw0oyTSH+vxuyFFkeN2art3kHoUaKhqMo4r5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMhCWqtwo3i1MtfCcxDNjUB8CeTAI+YjvBVqOwTEyzc=;
 b=py1uWXHEs3Ne244zSU7O38RlmDDkOuHINJiDm2/WRViRTaDom3I3SAGIqlWvsg8s2pjez3NzXEpSWxpcFLxU1KC2dNbavH9X0B4+rqm7eCJsClshgUuEb9SfR3lNzXjPVqJX9g2JM5HmZeqCG1o6EsOpKGIVgXbmlyefADYIUz6zOHABMZRUH1DM4MIlDenOa+VIsYyOHM3i7nlNyFCGY5b84fOqpPVoBz8rafgbut8TWXy2vX/pWHpb3EJ3H4kmOAmdJP5QeieVBSd4x83nAV0JA7BPMTvParvM8zYNbCkPEPq0K4A1kTr/A9mqOocuv22Czvck7QoAJZed/FfCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMhCWqtwo3i1MtfCcxDNjUB8CeTAI+YjvBVqOwTEyzc=;
 b=v0OZGGTFE/n0xerJYr0pSK062qkfSiLdsrXNTEH94ohji+er27axtkbKsOD6iuatd/nwZe/fyqrudV0Emktn4b2Ml2K//TfxUSeHc6yFFbZHnyBbP3PXUyR+G+IzTosOdPOGN1omtDusFAV3n/9j/Sq5BBCA4ur9TT29J1UM5pyQ/+Z+qC8Yg6a9Wd+yJCWNjTV8C/PeCTA3lyE2aS+CVevmkRqN47VY2Hx+GcxYmwkEexcIFvFZqeojUl26F8/PKEWULFeL6Wd4A4VJ5QQ+H+O3+ZCf7s9MYfIIv7ga8LNsmQt17OMoS3OtVkalVO+vIfyLb8EtcTeDyedpUwg70w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:54 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:54 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 12/30] classes: go-mod: make class customizable
Date: Tue, 11 Feb 2025 16:00:16 +0100
Message-ID: <20250211150034.18696-13-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: f8010ffd-d8a8-42a0-b485-08dd4aace07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d1xa3Rz5iScb02/pC+xMZLvAu7VlAESK5AcEmAN8/4wYFuJz5gE6oKWJwZRX?=
 =?us-ascii?Q?bNL+MEOrwIDDNKz5kVzX5xasLba6BBN9uRymoxZpYqzxLbGKYE5txhb3ys4k?=
 =?us-ascii?Q?G1kFbE1aRFop/iFii73xvpuiVx4oGA4dd4R7WFqcdxXMRAuKP/gCvOOOLvrz?=
 =?us-ascii?Q?Isei7A/uuHtL52yBjpvmlhDQ6lQg1wbHtWDMxi8TEEFae53cDNzwOBAWmr9C?=
 =?us-ascii?Q?uVHdOfSkuGLojfLClC7p9OhxFP2sJ58678H0gJF/Cn48kfVfWCe2OotGsqvG?=
 =?us-ascii?Q?UZyArtY4SPMPFEAGKmwhIJNRpFObtWTGnKm5OBbuDsbSMHcB26OJzHtZEWXa?=
 =?us-ascii?Q?XwZhu5rq6WAYRevBPlrhDKdGroT3eQkgoLn61Siw9m1OhwjE99WE4O2Hm1TZ?=
 =?us-ascii?Q?wYf0/WPnDnVv/cWxwu7w9Pw91RuLZ7Y11hSTZnemZZ2WpGBevo/ux5bhE/d0?=
 =?us-ascii?Q?R79qg/Tcs0w2lee/XgjxtUlMcnJ13YeOO2aN8QI1aRdbNFpfbg7W0oNlL8PH?=
 =?us-ascii?Q?Z9CweJPp05EwLyBXNQcJivh3z0LApS521gHttGUOS1voKeH+Ncpo1YDlSYBV?=
 =?us-ascii?Q?bpONoqnubL1/9gPFKOk0xXORlyUObXW6PxMgf6R0PhSb19WSHx5mrSphYhj0?=
 =?us-ascii?Q?BDcfkVo64GGQ8fdPdjJzWZdOrgR8MGLxDWGHBTZj15tT5f5qT2v+4bmhyPti?=
 =?us-ascii?Q?KK22mX/G9N7dz0bHH6Uz5Raypsx593f4NVFLIEoiXl53xGthfHWK60s4t2ia?=
 =?us-ascii?Q?YwFkOk0BqnQnvYr4xrYl7YTW6iflbRHt7bdkaQ+HUyNP3bQKHoK1wrYbO7QW?=
 =?us-ascii?Q?th6ntAYLIE5oHIsLbHOQTpbKnSVE1XcCrSoxUI9CyWZuVWQ1fF2sTXm3b0Xg?=
 =?us-ascii?Q?9gm5NtOmptGBgw0hhub1tCJ2VadUZ6/0S276n2quRz1KkwycydDgt0LeXr4c?=
 =?us-ascii?Q?zxv5jIprPrTcHxXi26bggptJRpG68kr+vuHnVJ5N3iKp4BIk3HwEzivaH4ve?=
 =?us-ascii?Q?FCB5IGM2hI1XjUgVtHYgB5x9QyU0SLXcOV5KDSzLZjIMFtzWoYw1pVE/hNEX?=
 =?us-ascii?Q?O2ckoLsRmu1uwb/LMviZ/rKFQnRyIicxS4XfK+kLhITrtmX4z3fw5RYZwMHB?=
 =?us-ascii?Q?pbnwMO+DoYssIeen+QH7vTMj77HFxgygkwJXZU5z76Ph9ha/KzCaadsw3/3K?=
 =?us-ascii?Q?9rlfwFxECNTPgww7rYDKssAIeFuR3pGkHpXJxNxg6t7DVl0kRrxDKI4uBVWW?=
 =?us-ascii?Q?BGdynyLBXHq63vKmkAt/Uecq2iYbQpa4b1U+9MkuTTvA8VkH46NVqyl03YS+?=
 =?us-ascii?Q?Wsu/gCEenvoQ1IclUvZSMwkCCRV9SQ347ijW+mRXCgZW/kPJQaxw3FpoD/ba?=
 =?us-ascii?Q?Dzndga+PkHHLiGwA7JLwYdGa0bMrGJaI7MOaKGdOuEmwCwPJ/6gMGRU1H3g4?=
 =?us-ascii?Q?JrYniln0kJgZFcTiVpMWJuknSsEmuaAB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0eloh7nC2bUg2KGG0keh1eFB/mxFMANuCgjzIKqQvcN3Lb8ENdK404k3DGm0?=
 =?us-ascii?Q?7mlkb11GB2mo2r1jkjNQLbWZVLRxY4LpPitUQhfYpphm/+IlGzZYYaXVD0b0?=
 =?us-ascii?Q?doQBUPdMptHLZWKSewQj0+2MWrqKuJEv6G3Tzv62Ya+sNOcbJ4cmwBWYrm6H?=
 =?us-ascii?Q?JFtMxgApESHun0LWK6vRlwL7nBgBODBqGpJd7gapdJ3qInwHaaKaPQssvu+J?=
 =?us-ascii?Q?OoGt4a79ZaDSerr8In4Eon21fcM9Y4OLiBRPayXIfV4yRmNqr36CAqx0H/Y6?=
 =?us-ascii?Q?gDmOJYXWcgCeVichLJoIUfTf9c4SgX/HlndF9z4M0x1uz2mks0flDcVLka8X?=
 =?us-ascii?Q?waEDy9Erbk726QuL/uib5DFqWzZ+z8HBtJSqSEKVZhXxt1d/zz47zt4DKQmu?=
 =?us-ascii?Q?A84k1m20sUihp053CT+ESGiYq33RzOQbXA0WbtiZTE2HM6PcR6iGhA9h+394?=
 =?us-ascii?Q?sjN9i4LwfiEO03/omQee8/XC83ZLDyJMMBlgX4p9aL4bTpliyx42mALITl2u?=
 =?us-ascii?Q?kz5Afj77OoDfv6ErtNZ4dFm1PBPlUrbfSlw+E94N5Mo+S4+n0fbrcslMQ2VF?=
 =?us-ascii?Q?opATmO3Bh8ozVSwixdSnK5RcHbP2xo7QY484nGpwXUBq60JE2acBJdquGdmq?=
 =?us-ascii?Q?dO12Uicda/xLT70duziu2PSqnzUhsvRjETc9Rqcaa0x0CmNQ3iKXDwwaKPt0?=
 =?us-ascii?Q?nBFGXU+JWe81ZAqiMkDjUpa9qYiRwAfTY8wotnMfzmbLo3PjAgdAUoEC7MKU?=
 =?us-ascii?Q?hrxof/KhUK4X2RlcGaK03jeAKUaToNf2RvLyLVvVdltwEPa2vD9iTP9thltH?=
 =?us-ascii?Q?Zkdf4Bs9CgRK8qqUjlVZsHT0udS+lc0DTtKTkp/PIHGgeWO40G0NkiK55/Yz?=
 =?us-ascii?Q?czXlBCQyyXpCRe6hi2I46uDzwY6ZnvW4HDNH0qNk7SUBq3aE4Nge8KiBPJOl?=
 =?us-ascii?Q?gZEE/lRL8+ne329E8jwwpD7/IlIQOWHM35XDAqNc7StqK3xjfw7KYpLdakkr?=
 =?us-ascii?Q?JL+07IvCJCFx+BykhXjQtXpizpbm/HbYYlSJKxjaL7EcqoQAkf0es8YvrO10?=
 =?us-ascii?Q?JeOA+o6xTruXANGP4itHKDk4EqL2p3RfqwpFfLyUtWdb6pVb/sxLtusdsLCS?=
 =?us-ascii?Q?TN5w2vHGm6Qk2GORsfWh4/B5hUtVEV1bGiPeZ69hpDcx75lp2cqpUXX1jwSH?=
 =?us-ascii?Q?NC8J+NUV3h+YJBnqK5r+jrs9R75cwdj6tm6HNv6mJSzsuaND0pgx66xVelEb?=
 =?us-ascii?Q?veyH5VIH7LFf+DD31HJWEOkjgqmasrBekn395XIXrhc2rS0lPMxJAgAynk3i?=
 =?us-ascii?Q?BDLqfOwYAIqhdR72eiBVvaODr6cjRMwztbdEi8YSIu903iKslpPO4dOEjPb0?=
 =?us-ascii?Q?lt5qif5f7RO3hYUxaZNC7/Zg4IY/+N7DbUQwfG78NGvSzILi6XUNd28iHoMV?=
 =?us-ascii?Q?dYNoJj5SgRRb7r+d0Eo+KraJifjiHvqISaSgx/+JaY2YTzYYDyUnTqjBCRc0?=
 =?us-ascii?Q?15uOBTfJ9SWdxOdXRriqRHKohrfDZjXZxKnKnXp8oHh7XSX7ytFKFIALljZD?=
 =?us-ascii?Q?sgB4EWJ7q19rTbQP9naEvwA5+j7ToVRdAHOBIx66esukfj4mXSaA57jdcGsJ?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8010ffd-d8a8-42a0-b485-08dd4aace07b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:51.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGD/7OzTOsV+sWo7Zb9mehrRU9OEZKDitFE1awF4bV2iHtnLex/7xCWFmrN2UHE+1pv3n4RLiU8TiBS0JsT3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211137

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/go-mod.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index 93ae72235f..04651ebd8a 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -22,13 +22,15 @@ GOBUILDFLAGS:append =3D " -modcacherw"
=20
 inherit go
=20
-export GOMODCACHE =3D "${S}/pkg/mod"
-GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVar(=
'WORKDIR'))}"
+export GOMODCACHE ?=3D "${S}/pkg/mod"
+GO_MOD_CACHE_DIR ?=3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVar=
('WORKDIR'))}"
 do_unpack[cleandirs] +=3D "${GOMODCACHE}"
=20
 GO_WORKDIR ?=3D "${GO_IMPORT}"
-do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
+GO_WORKPATH ?=3D "${B}/src/${GO_WORKDIR}"
+do_compile[dirs] +=3D "${GO_WORKPATH}"
=20
 # Make go install unpack the module zip files in the module cache director=
y
 # before the license directory is polulated with license files.
-addtask do_compile before do_populate_lic
+GO_MOD_RECRDEPTASK =3D "do_populate_lic"
+do_compile[recrdeptask] +=3D "${GO_MOD_RECRDEPTASK}"
--=20
2.39.5


