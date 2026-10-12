Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA87CC6B01
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13144.1791811225705403211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q5iGnHuN;
 spf=pass (domain: est.tech, ip: 40.107.162.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/jJu+OmjNS0zCM02k58Z8sX2LfJvlIF9CNI3195cnsA8EUOebfgv+JJOtbd0NSCJbdCqueovBC1Xk6K9nf7LG8HXWdxSMo1bpWgrFK/qQMQHqn6LTNaoQ47aaCWCKjUSTQ6s7+VdOkkD1TKBP95P0JM2KF8BdEw+9qiK+fl4tm6zRnwqV2ndq19JnBi04TzQUCB4/785DPQEcNLKbVmHmIoocG0rqKy4zI5D/Tx1vL6UTwGtHTt+z1XKa+zNruF4xN97YzaqOkMQk6gGUAyjBIC0+JTvIp3ahMYr6x8Hosa1fUX2WOzTtgdq5FaXxf5fQx8atzkX0z0Ng8v6kvPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVoFizPA3W72VYIa8rgsyFGI8BCNkwUEZva8bjCfybs=;
 b=bf0yx5t3JMsgwwGO0aROF8y+oBudgKTi9mNRSFozCOYEg55wpWUkY8zRwQV+POANLKCh2SW5qmMqJ351HMa99Aa6UuqgbUiTgLT2416m+X0/swzC9WjMYdkvWjTywv8k1Px4kSlhJ0PomvfQBkW4W/G4UNYJx+tInqbN2hQRWi7GRj7Rk0O1tVGQwA+Nm4NdIc0NCZ/Rw3KHIWY48qEhQhOZe2jPnPQtmaI4uhRrvpUygGglZeojpbQVKo13ZS5u2rXG61k2b9JsvxWxITpf9eUe7ldNUXJQH2Uen/Vqw7tzqpMJA6oIvPhIMmyra0WNIYN2fwfJOte+OiUOojuyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVoFizPA3W72VYIa8rgsyFGI8BCNkwUEZva8bjCfybs=;
 b=Q5iGnHuNlWc9kOE62Ny+k3qjSJKDsxjK0lXfTBT9U4hPleSJm1rTwPhEFRz+GWbqMOhhGMteAZC5UOKx274W/abhHkIDDP+nHFXV7xs4+rIGq39pUM30B9w0AYET+atr9zysKe6OoX5xLvg/iH2RuQQibZhGIkmXQDebv7uIVLfXijs/IJK9E0FNqlidtskZTQyOdLnjMRGvpxJ6W40yHW1XLCDB0K3kNC/ZoZ3MP/dOPjj2+cyhW1IpZZTY0r6kh+wX6bGKniqd/1GFCTYCL2yJihwNOy9dK4cMvWIvQwzrN5Z7Xve/GDXRfaIy4pjCQmZJIArcSvFhS/b6ZAmI2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/18] fastfloat: upgrade 8.3.0 -> 8.3.2
Date: Mon, 12 Oct 2026 15:19:56 +0200
Message-ID: <20261012132005.23909-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: c72e67b7-de94-49cd-a045-08df2863910b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|3023799007|261009223027099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	X2n7DY73ihHen9Hx6TyiKixMY92vQ+SYdf8n0lBtqJS4UF0i4fJak06x+Vlh4Wi1+EKEwxFs3TY4AwZevmClPDp8bswnpr4JeXk0Q5ypAukLCUNGnrrtJm41dbAd8WyjecznMBOupAelFIivZ/eiWnzJws55NrYV77Z2fY86EF3p/Dyv7MtKqsDYS3h7c4X3kWH7XSBh8Fcqeriw+FDQ6q9uG0EXRyt5Bc9XbaQlaqFzZ+LzWDm3739i6UHGeGuk5VnQNwZHGrAFSPHPh79RGzsiftqgU9DzPftNLKNRLhTLMy5b8LuXEtOzSY8dOzvChA7jKvmTBPEtcxlaJoPDaVevvxDmnqLUHMbnKWnHUuDJfJvxrZ2VbJwgmqnipuXRCbHl8Mkoor17vr9/meIrwaj3XSy6zh+h8UyOxLQOXstetKTdahlrEVBb/rnU0LieFp5miJS41feQPg7r+P6kMkEGAkaF88FRs3lG7oRHGunaQ06FXpR8POUtmQ4ORDAJJ8ptULXA9URmCfiK4pPUchQMcC7FlaRtmx/E9Qyuon6Ldn9ufvMrxLjghj/ctP6u2qhvsPZsNbf9bTfckv8LWLt3QOcpIE3QuBqqHnicEA0luSsMDUpwGzhKVjc13Uwyz1i4CTqwX9QOFil0udH7uGdreySAlUDAeazxVy1EVTY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(3023799007)(261009223027099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0gcoaHHeWUDCwkVnvYOaYWgUsqge0zivM6JRWTcuGIk1Sj3azS88s3MK1N0?=
 =?us-ascii?Q?lt8LoDyMxk7UgLIqyAuYJEkl0+bJTc+ysHJfV2ykKGjpRHN6Q1Lx75a/Op0j?=
 =?us-ascii?Q?l/aJm8sDqj+NTLf1K5FKcrc7CKtW8C/IMcy9puZh5O10aCixrfY/X0iqc4o0?=
 =?us-ascii?Q?DiCZp5Mrhg60HyZyf5/y+COn+/pa57xg4dGsFu/qN1xjcDBiinOKoHjDS5+5?=
 =?us-ascii?Q?r5e6kDi51XYTPSKxCaCDM1E66CGJS5qWZNq/I7Q8aVdNaf1adjjCYuqusZ0Z?=
 =?us-ascii?Q?gH3xi1jV1tC/oK8wXiLx/nQAiADGWzzuhHW8e6rQhkzq4lsNK3F4HXpWl4Vj?=
 =?us-ascii?Q?kClESJN1SJS1Q/CliP4YxRIUPNSizJPi1xxuhWR2GwmQ6lXs5VnKlIn3SKCZ?=
 =?us-ascii?Q?0X+ZkiQA8sGqjy/70kz0SxRyeR6BZRg8WhWSYYcAHXolv/oFIiy49sLvy/HJ?=
 =?us-ascii?Q?Y0+AxkLPeNdMDbKGurPJTNtezfuG0TtsN0Ufg/u7X/xiMht6n0TEyZh+bU7a?=
 =?us-ascii?Q?lb96teEJVI/m1zP33f9/I7XsWbPp+eytb7XTRZceTPA1NWZQn1xcqvE3GcXX?=
 =?us-ascii?Q?5oe299f/bzHWxh3EavFDTG1bNVHL5rJ1sOY+ud7KhmQVb8xaKVHpJ1J6RRlE?=
 =?us-ascii?Q?RjKb+i7xEdrFxDnEy6kyi+IeW2LoWO1yRvRZk4MYvOlLT4TnxMm5NZOyD+gX?=
 =?us-ascii?Q?DIFe/6DBe+5ebLp52lxkb7grlCCQTMfnoc21h56WOHs9Nqp3Q3R8lIrzJUAw?=
 =?us-ascii?Q?So6jGT4cDvVTt9cVKhJJKXDF1WdmztUGdLqeiM8Um/ukMbcQP9LBVtrELOmn?=
 =?us-ascii?Q?5l+sJpCakUMdAnDdN+6iyOvL9g8srxEjXSr/JI52t/XTys3H/z7xIn3jr3dg?=
 =?us-ascii?Q?m0yVq8YYHTc5VBu6IaAN/rGiZZXI9JiCxdN+NWq7LFKzakkICMjL7iv7SMDU?=
 =?us-ascii?Q?FR5eg1U7f4wan4UoHnx7mQa3gxzHElSG4IIAWrMqhmBOg0FdALBLvSxCpFuW?=
 =?us-ascii?Q?XrZHQDXpYvGLUjsv+rBdo/d6Fltbv08d/2a1isx5FQnJBEJ5OD5/iUjEhWx+?=
 =?us-ascii?Q?NDNt72/U2T1UUlVZDP8uEs+PQ8HLr7Ckjhv8eaIfpU23XSqBpPDKJRennnHV?=
 =?us-ascii?Q?pz/M4BV8hIMrkRE3KV+UUxxZTaVzuTBot2CwkeYO9iDgI4EHhiB9GZ0c/okf?=
 =?us-ascii?Q?Pf591PGrwenUONmN2+ctGVuFS4MYCOLQ+aM30lhXNkHJ5SVz9OOEJy8nBoqC?=
 =?us-ascii?Q?z25xTHaXOmKNCYjaSN6yhPH7fr9j1+u0vbBXjbptxWNbhYMKk/bJXEXeOALf?=
 =?us-ascii?Q?TyNguMg324h+4hkNcIZRsNiTBcP9DTXB4RSFwtTcEpkkCuexSq4zveSiR9tY?=
 =?us-ascii?Q?GqoynaQZHCsAXH6573cfaukF8C2FZ9D6/AHgdXp6RFD4+Yp+P25QDJJ/alcU?=
 =?us-ascii?Q?/lMc2ec4gqdCyyV6AykZydktdUR96Y1ot7g5V6YgPBPrRnMS/LNxD/IZ650f?=
 =?us-ascii?Q?MfUPh+q0fXfdEtVz8yT5DSVEahEYC/25h/DcAqQcNt9nxpI2kVHYhm/SUyP+?=
 =?us-ascii?Q?8mLSvmC7URP72EWK0DeKxXjeowcwOUTPHxm9ioCyblYay3rr+E2R6VhCx4RN?=
 =?us-ascii?Q?Gww6BOTPawDmUL9ctIzv+oLsIQGtcWLYFNb+VlvtLXGj3g+kDm6NknpRMJCJ?=
 =?us-ascii?Q?ZsuU+lbq73m4Z+GtkDi52X7+A5Rrf9W7HkPWE8rjh0Q3zhBBGKfxt9KAufxr?=
 =?us-ascii?Q?REj0NKgVJQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c72e67b7-de94-49cd-a045-08df2863910b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:21.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqhoqNbkCK6lw/O8//35OhnA9HCNC9mngFjelodfd8O5u2YsO8xFwEkiSAnxqR9/NglxxkAhTpCgC4TWDeLosyGlcxjG0tS1mbqiwFE3FO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247653

Version 8.3.2
Merge pull request #422 from sahvx655-wq/is-integer-signed-overflow
avoid signed overflow in is_integer for negative code units
Merge pull request #421 from sahvx655-wq/times-pow10-int64-min
avoid signed negation overflow in integer_times_pow10
Version 8.3.1
Merge pull request #420 from fastfloat/release-workflow
Add manually triggered release workflow; fix on-release asset upload
Merge pull request #419 from fastfloat/fix-418-struct-layout
Reorder parsed_number_string_t fields to avoid padding (fixes #418)
Merge pull request #417 from fastfloat/fix-alpine-ci
CI: pin Alpine to v3.22 (setup-alpine v1 fails with apk-tools v3)
Merge pull request #409 from caolanm/main
Merge pull request #415 from Algunenano/fix-benchmark-branch-misses
Average branch misses over the repetitions in the benchmark
Merge pull request #408 from jadidbourbaki/float16-exactness
Avoid right-shifting a negative value in subnormal_ties_possible()
Merge pull request #413 from fastfloat/clang-format-fold
Fold the format at compile time under clang, mark cold checks unlikely
Merge pull request #412 from fastfloat/strncasecmp-simple
Restore the simple loop in fastfloat_strncasecmp
Merge pull request #410 from Algunenano/javascript-fmt-hot-path
Keep chars_format::javascript out of the common hot path
Gate the subnormal tie test on a compile-time predicate
drop the unreachable tail of parse_mantissa
Fix std::float16_t rounding of subnormal ties and fast-path overflow

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../fastfloat/{fastfloat_8.3.0.bb =3D> fastfloat_8.3.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.0.bb =3D> fastfloat_=
8.3.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb b/meta/reci=
pes-devtools/fastfloat/fastfloat_8.3.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
index a041f32988..db4312bfd9 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3Dv${PV}"
=20
-SRCREV =3D "b0ab987b3dfdde13fa1915f65ef2a5c068d9208c"
+SRCREV =3D "42f254836ee416ffcf2f4e6576260003ac33d48c"
=20
 inherit cmake

