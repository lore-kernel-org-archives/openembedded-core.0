Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C6CC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 13:24:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web09.7959.1667913887463910340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 05:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FUlB2Y2w;
 spf=pass (domain: vaisala.com, ip: 40.107.249.65, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaHjVuECfvs/JaP6CeGt3u8f5F1K3FrqS7dKMuqK0wa6hZ2/3c57iZSbSWNzKuFsAMfCgsDI7pYNfw711jDWlTio32/ACc2WIPydNNHxKxrsmt/CEHmEnJtCOnqEuP2Y2m5KKZsiQVMxpeBbpvJr+yvAoY6Cy1BhMdb6pLS02w+Mzoi9RRsvH0RSVJ+mwfWxKf1v4aYv1YqyxTV+pzok8K6YjJsXd3GIbqv7vGiKBePr+bK1Dq5QIhAbB0sm6XSkFCsjkVjc0fO4vMgnqtC+nNEIdM4sf9XqVz7Gk/Itzp8XNjiBOUBBamI8QBJ098EsmnK6myYYr6Jd2S5dF8Rd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2lNnoh3cqOmNTYFF716XAhcy7NA/IGD+KnGvWYqvek=;
 b=ZcZzJPiV0udg4NrbTPt3SiLVELFEkmB+mOurwC1otnTtPHj7AIvCRROSH5fzYvXzbkkggWP9mN5ue4JmC7N0B1YDz6ntfUpQdM8mdVtRkgTAqyd1pYiXYo9cCyspu5KE27TZxxGrOSp8vKjs4Bb1NDBc9K22WyjCLU0JjEO+5TofmTBGa1ywY2w0iPk/LYmxHtTAL04LYk5zvncn0wTeIzDy6jTJsnjT/mRShrXUi678fj3qftuKYPUX0rBXmIPBWdGQETE8pVyhnkqOy9my7p7J/5Cc4lLfpmBXUxlS1mM9DVLqr3eXvdIG/Xv2FyJ1lr4sEvlS6swOevdtQMm1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2lNnoh3cqOmNTYFF716XAhcy7NA/IGD+KnGvWYqvek=;
 b=FUlB2Y2wCHbDC76l8mN7MdP1hz0dL81OpySKFu1vyq8gfGRBjIRWdLC/LGxJb7peF/9u3GZ6Zj96fb2xZiHuFlHjxfpGnbaBlNs/Ab9wmKbOiARMkgi/UieAH+jTYJoCIuPY5esdPIjKWmADeoCF0xsVuQOMsNXsUNjsKcFXeXsi719WvIq2h5tbKDVFacJ8kybuJwlycR8d9PjTsv6unzxYPRIGia6A4qVyYMrRoPOp6i/kFqaLpaY2Lmz9nkEvgdrTPonjKegvBSySSWC43yqGMS0mAFzJKTdOtoVC95RcmK/PZvQ5txQMGyZZ0VkeeLGUFrvnnuUS+u8TTA6P3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PR1PR06MB4779.eurprd06.prod.outlook.com (2603:10a6:102:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 13:24:43 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa%5]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 13:24:43 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] systemd: Consider PACKAGECONFIG in RRECOMMENDS
Date: Tue,  8 Nov 2022 13:24:33 +0000
Message-ID: <20221108132433.3297656-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00000100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:c) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PR1PR06MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 10139d50-e455-462c-4e03-08dac18c9946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bw22ur92h/6Tf9OsJuwsWN+nS37fM1Hnhd+YUQqGMHRXrWhA8oG2/HbQEpiTZ37+S4EADmlaHsqeBp93awQKXtWYqbhC6Y0QoVWMpxDXBMCMXYE9coa//3k+lvBulojinfpSd46AtPRYmbXy7soEbhxWuUi2mwEg7Dx0s3oAZiqYkM1/IL/bSrvxe+wPHAxPT7cF83Pyfgxj/rRF6gvsyQ9F0lHjAT5GXOKEtJsbkcxwralPeXeEwcNJr+FrtKUafxiSIoZVk879APMfkACsRXq1krnuJrPqB9O6H5bUCqlszq826j6lRzmWyU5qnNE5rl/mIY+LAW2H3wzcatCwdDQV/fcpDlyeWeqmgVqyH4V0/x44PLw6TuO5yfu7vl7bMVxAKeD3c6vsS11B2VPlG7m86CGkssS1E3tb7sQnNs9sVIokNDlv8Y1nM8F/6UoIFb2ifIs01S50j8IK0oENfBvyZzxfxEvuJjEXeFv4uDJKm7uSJ1Z1Tf2CQehcEO+aXQpdeG8KM0iJ912q0nqAoFXZiQNae5MWku81VvVpu2rQhRkNewXKrwwouZ+9oV3NAQU0KE+ViCY8mF1nZI6UlQiVzIxXyeuXbE0Jr5/snIw5fzyJAzQ799urtOxMCL2NfzjiYu4gOc8PKojnEzCEE5A7KJnYdPUEMgJymE9Fc5bfVXHFpGtLEZnNq8urbNy5gAJTI8gd9TZ+X5qYjLDSyMYZ5Y+DHU+S+ty+RiMEY6Ey/nLUC/KqVxRf7alioPKmw5wfzaSLM+SYEvXTD6AN1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(451199015)(4326008)(8676002)(66946007)(66476007)(6666004)(478600001)(83380400001)(6486002)(2616005)(1076003)(186003)(52116002)(26005)(6512007)(38350700002)(36756003)(6506007)(38100700002)(86362001)(6916009)(316002)(54906003)(44832011)(5660300002)(66556008)(2906002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?btvTHtUnnar66542ZtaXBaXYYouuMDn/7qM1tTRTgHB0gabgrDGPgo+4S4mj?=
 =?us-ascii?Q?59GVG3hbAxAR5rc3ZCafhBJNRreEb0EBtLEml3uy5iVtU4LRabDfqdkAqlut?=
 =?us-ascii?Q?Qya5eQLSweFBQDc1XpbP5h5ypE8ymVNTDsA+O9e8vk6JYPFuoab/7O45XXoD?=
 =?us-ascii?Q?esyfZbNbcozSMH6qLRMTUf7Pas1xLZf3uFAIPLtihXUKqdQG9fIJvOhqP+Ju?=
 =?us-ascii?Q?Fvcw9d49B4xMD/G/MPJQmqxRAXHJ2S1kqCOXyO4xSXUjJKm4Z+uxvK78NHpu?=
 =?us-ascii?Q?Z23uJFAZMnxa1Cb48jY+l2fFqt6Z0w+RVks1+os2VL2hVNloLVP+ba9TtRHX?=
 =?us-ascii?Q?kSZ29BTNmsGVKZnIPVuR7QaeoMQXMOZFlveYiRrmA+EHWMJlXBppFJLm8rmR?=
 =?us-ascii?Q?Ed44MzjxhoRiTr1SQJqa7zUjdNwLu947OqNvLnR6bgBkl7wf3q97XOAurJYu?=
 =?us-ascii?Q?4VsqLRJj0u/hcN7R/Dzllno7ZA6N+oJhl/IdQAADftv0RrFjbQhy5sVCVn0p?=
 =?us-ascii?Q?183/0qyF4NHkv5OHl6RQLEbiki1By79V9Y2/cfxnBrhNiOxo3UhvCe5GR94H?=
 =?us-ascii?Q?4L7h81yk9+CO6fqyFvIi0fBSDN0CIEcayPSOhxofCXJk5CUqO2qJRKzvr0OF?=
 =?us-ascii?Q?Yj2ZPaVQVB+pthwBFNrsp42/cEtLkDMNV2cSorhSmwkWN3cDxFbNGywJH+xd?=
 =?us-ascii?Q?Bs+dAQajui4oWXgk0asj19XYvaUlwcJCGh2L9wrkSlCuC+rJqHQWOEKZOHJJ?=
 =?us-ascii?Q?25x9GHC7pSt40eESxXA8qx930/VnOEP3V8dbJs9a5KsvJl0uxA56bX6QQR6t?=
 =?us-ascii?Q?upxBsD5vr/Wv4qdmxq4GFOGk/bK8c2A0SZVnvcsHV/ynz4w7CPXHh8rpvwiF?=
 =?us-ascii?Q?tXWyAc8YAjImD7s+PaSTm0jws17+f+xiSSboLjvR0xeOlCZCfMFh3w1Ckl4R?=
 =?us-ascii?Q?wU/571mj4V2Hnot6DJoJ/QouxMxEVIen8zmFi1ULnOXnY0BEdv4vmrU/P1+g?=
 =?us-ascii?Q?qArf4Xhh1Cze76BSj5qZrx0qNEM8pMBxb97KCKsW7VnlPa+uQIysWVvqpHr4?=
 =?us-ascii?Q?dGtTfpNwWcuPjFsbOAPYMyStn2/0F6um3mnTcAFfGLXORnb1pSZpAFgv8TTT?=
 =?us-ascii?Q?Y7Y8FLtUDqPPlDs0qrGyREW/2NR3OmnxJliyG6c3C6d5KsedYgb73x3rKqhv?=
 =?us-ascii?Q?uZrbhVWsKR4I9e11KyWwDmCk7MdvvBdhu8B5OvIYqtEWNEEsJVO1bT4TPN5L?=
 =?us-ascii?Q?bOUiAgkJ3lHjTxCSt8X2fIj5zN2RoZdytqHZvQg0kXAHEtL+JcETGDlwHwLs?=
 =?us-ascii?Q?mEBKrDZdo8dHSjohiGqd8v1j/n9A6y/l9uM8swwl6Cgju8a2gui6hvrSy9uM?=
 =?us-ascii?Q?+jM6oKfWMmVpkxUUgF8JuEfhIDJ67Mw0CXcBslfRjepYWJYQI22WRHitldkP?=
 =?us-ascii?Q?UKWHe+3/4lzQE6Nf2fiKCJoQh+1Gif8Uq0IZHwRmyFNXNQl50xMRR2+AjZwC?=
 =?us-ascii?Q?/wRtNnzsFjH07A8/NsDOEDY0B1GDCjboANqtD2vVv0LxEJhwpNnBDWsB4Ebn?=
 =?us-ascii?Q?5/8YZsESy2a6Xdgox3iiRm1gKgFcSEye955LoQHr4FSmOkPjInRvCxQ+ru5S?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10139d50-e455-462c-4e03-08dac18c9946
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 13:24:43.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n550bKMUxA1lzTSfAaloHc4c3MsNsEiNHSpol/yckh6zUdY3JnH237rkdFs5JHaYK6I7Eftlmh91njoba21tBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR06MB4779
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 13:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172967

Since RRECOMMENDS declaration implictly induces building the recipes
that provide the runtime recommended packages, conditionalize adding
such values according to associated PACKAGECONFIG settings in order
to avoid redundant building.

(From OE-Core rev: a1989add927f7805378fe4d5afbde780b747ba77)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_250.5.bb
index 5d568f639e..a11f0e886f 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -430,9 +430,9 @@ FILES:${PN}-binfmt =3D "${sysconfdir}/binfmt.d/ \
                       ${rootlibexecdir}/systemd/systemd-binfmt \
                       ${systemd_system_unitdir}/proc-sys-fs-binfmt_misc.* =
\
                       ${systemd_system_unitdir}/systemd-binfmt.service"
-RRECOMMENDS:${PN}-binfmt =3D "kernel-module-binfmt-misc"
+RRECOMMENDS:${PN}-binfmt =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfm=
t', 'kernel-module-binfmt-misc', '', d)}"
=20
-RRECOMMENDS:${PN}-vconsole-setup =3D "kbd kbd-consolefonts kbd-keymaps"
+RRECOMMENDS:${PN}-vconsole-setup =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'vconsole', 'kbd kbd-consolefonts kbd-keymaps', '', d)}"
=20
=20
 FILES:${PN}-journal-gatewayd =3D "${rootlibexecdir}/systemd/systemd-journa=
l-gatewayd \
--=20
2.35.1


