Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:47:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.14])
 by mx.groups.io with SMTP id smtpd.web11.1450.1645555641183381027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=SAOzIJY8;
 spf=pass (domain: outlook.com, ip: 40.92.89.14,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE7N1Cz27gDvuGuPBDX0yp46wEbb36Xz/agVUAYPPkw2LCFJ3jHsyg4TDKP0lc25BOuaE7M5iHAMaomj63aDSxtLDsRqq1TliM/rldLdYzpLKxhjCaBW+8ej8FKD0VkwmHxxLRmOY/DP+nr06SapFB5lnqr86HtOo8eki0FJjbp9F+BMpEZvm7ceULGEopr9hPpJG7FA1x2yFIZNGuQ8CrLQeoYugQBthQ+l/DTx4lqVhEV05pMpFBcj04BsjqyjYlGPJ9xqx7XRW99of6/54Dqj33u/QIveSiKaWi6xO0gQ7V3anqEpsnfulCJBNZhjzoHCSDlFHtTo2juSmqi09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NYTusBme2nLwXbyPLSy6owMcGA4/VTQwfdQmqS+4VQ=;
 b=gPOUX98e2W9TX+/NiPx1n0/7mBG/hqx2i+T96ieVsYpuSJhbU9X6y/T3ExIo/Y2A5I4ko9kEYbtQnVSwBWLDGgNQlPviyvye0OAw+2RQ+mf6YpgiXmHu0Ql0ErR1Uuqsb5BzIAIChypHZPiOKUl9qip5MNbbVNsCMv6lucQtI1zBRUA6EZimXQVL+dIi8njE7t+qGoQRXDWH/PgegM5kZKmD/8ksE6raFg/WxnV1GdmnJmwuPBBgnqsziv6KceJ6MkNmYZKqINMiN+d9pR0f4ElQR20GMznXjtIiWgZZPYR/3OjE2uGswkQ7q/UpBKZ0z9nzsstY/1apTEoFdEUUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NYTusBme2nLwXbyPLSy6owMcGA4/VTQwfdQmqS+4VQ=;
 b=SAOzIJY8bDk/8uSPNZth620xuA1WCVqoRGiYB0p3kajfQqzVUX8xepHK/1g5+HcaC/zUB0DMOqYAYtoDyORUErQ+XXfulibwO4/3uJQqFAvhWSs24iQJwHkaoh35TkUUQojecnsftNhXoZpWPWqmIPJFKz541U0HUPl9sU/J6jR03XFYh+cSn174TBRCQw0M38i6Sy+SenbT9+b4x8UqhBXUyIofkIaoSv+cXSRMTivUNHxoSWa+SSM6XEGR9LvoSlP1WHqXLoINgnM18PLWn/JY8kZ/7b/MoFpdejaBQlc6IkGCWU42NKKI+AwSHIjUEv0b0tFYgOkBpW7jn+j+7A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB3336.eurprd09.prod.outlook.com (2603:10a6:20b:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 18:47:18 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 18:47:18 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	ralph.siemsen@linaro.org,
	Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH][RFC] cve-check: use local copy instead of global db
Date: Tue, 22 Feb 2022 19:46:59 +0100
Message-ID: 
 <AM9PR09MB46421C5E3A51479C951310FDA83B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [QmtLR1Q5V4dlb0u6BVuNrC+W3ral1HWCStgl9KHGCJNVTdPw2/ZMvJr3XeEqs7Gq]
X-ClientProxiedBy: AM6PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220222184659.285541-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c3fddce-6e30-4fb7-e8b4-08d9f633c07b
X-MS-Exchange-SLBlob-MailProps: 
	aa/WAlXx4eSPnZ8MVtxgAfgPETi0E/Z4RoDRTDNFe9vxbXGekoOnI2vtAJ3G9FbjYWuXgpubdT/vBzDiIMiOy3W4xnBhX3fCpbg7ADiyCcH6cbA6sXIeEA6TuzBYChSbf+rEWR1NUc0Kw+zdHNn2o0oLbZAcoT4x0i1ilYi03LAoO+5Luj7HF1lj/McFMpDIol9kDNdRb2O4MofPTZ2ra+Xaux9C8t4Jou8nJt0VZNatro8YX/DvDy/NF1gwA4cqfWNLnRzo9U6s8vMSHU4/uyYCBh3cqKx9yyMvxfyXiDpSJ5mJUk6jiCC6jJ3CwZ0LtUXOfTER5M+lXM6bYDpg53JU3SQ+qlAaumdM0k8f5NkrygbLfovE58fu6ElYoWl166FtxAdaSBTdem5C2mmm5QSrbcjotGp/86rD2nG4LN6YzuvIbIseH3dsjby1+1GJDoDLW+y8yXSQ3uaFu9dkLIkAVZqSRnQBg3zVrP3vf9/3K8Dz5TYazANjKjRgKcqS4azUIrF6MSnHPomsPFYo5bBcRFmm/EIJeSFXxwm8HfkpNMbiZAZrKM9dDK7/OBCROYg0o+lXT/Xcqvmh3ixDSxCplfdzU1bG5a1wEFF8VEeEQk6OqbP4a7hop1mrHKXL8q0Adgt9clwDB8QaePapzto0+kkGyttCYqBbYtBoSX3HZYR/BQUCJ9a1+FCKQ5OczNcQhPh5/LTV07UDb60gEXvcamf9Yz8tbRicpWXCzG92zRK7uM+CSgsMizSvd3rUxosmCz1NuFYnWExP8/luny5xngaomzFB
X-MS-TrafficTypeDiagnostic: AM6PR09MB3336:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S3jExDFg0y61mQBXKD6zxMfnn/yJvFXkFNCqVQR0G0LpkDgFLpNApb9KkbpRLeNexe4JtRqsIGObyRwKntbQIBIeGHr2Ax8ILcbI4BVr0xjJdaxRgVacrzjw3tDNWI0LuSBAfYQGg2HO+ND1IBAlivvWFnzwfBJy3wGruMVDmaP4DiYd64PtlO4TYK7R2PQCps3+e4LiV5Ol8S+eK18EQBe0btcwFf/HclkTGMsX2uEcG9aj/JsUSF+Lgmi6PQQ7Yya+fUTfP7oJLhrQtAyy4f82zZ4VIlVFkxohrcYaDgxKTarzA9Y7+TXgWKXcqrjeDwrHhrNuB7aOLGBDznUmYX6tONH6Cu5Z8NoExaXBNqizBDqnuU5sSyvwt8BlVRAqG/fafWcrQh9xzhOYwzavQaFc4phxhnZBBpiIei1PBVQXpYZ1lvEU+B67x/nVT5MxPcCMgf8lyF7T63DWziYGAZORNH93mlIgbdwXvcLtH6LDVTlDhuwhDwnGZkxKVubN6C5GRsMGs2z8afKydCxGldsT/6YrQKHFvlD4FNyGj580xOvi3KSfmiub1kKIjW9tJRuDGybQtL/FqG8bHevrMg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9dpfTFiEkvcYy8Ss7qQ/jtJ2IV3A33rBmRM97GjoI9UANraZw55dRjBWmCWs?=
 =?us-ascii?Q?ZXJ1G+/rhyjxd4yQtdUgE14kALVDpYRVXNYra5F0g4n32TQNCNrJ9QLq3WJC?=
 =?us-ascii?Q?hXltHOR3bMKwcDUTycP2zImp9zn1eAxBBTF8oBeWWkWhIlPd5V35K/nq5pel?=
 =?us-ascii?Q?W6srIWx5i9v5n6q/Yg8sU0ZH33fG9/bOhCfTrj0iygY6NSxAtJuXBo3wTdQz?=
 =?us-ascii?Q?wi5+O/abJR+jl55O07UmtuigsfILnFf3agbW2JpEBZYq93rp+J8lvTEhIl1B?=
 =?us-ascii?Q?IdmHPjr2zaTA+tIikC/zHzfKoIKvd8ODd3SF4oyhjGxPC5zcsB7XjMU+0IRi?=
 =?us-ascii?Q?liMUlgtKOYqsXzzFMwkHOcXFXHcSxhu19yszJNRq/yAs0X/JQa9JGD4dfUC6?=
 =?us-ascii?Q?u50UvysK2qqt6+7dOu9AmrQIK/ZhEX6KZeoTodajgPrBI9Mu9pEck3qIREBT?=
 =?us-ascii?Q?TQ+dcTM8/6ou7w7i17BKHi/Hd+HTwV5arSjAwf0EsWbMMrkVkyijgl3mhw6T?=
 =?us-ascii?Q?DglT1jcxzS1LOcG/kmc5L4+8GftlAB6DLc9NdtZvb22uO0YsVP0YZOYC7M9u?=
 =?us-ascii?Q?WFORHTJGBIbE+zgxhagCw1lOhbGZnfduyQiejYmjeNZJtjjCnaP71PaHdp93?=
 =?us-ascii?Q?D2OAzuegowseS1QjQSOiAIQg1UgwtkfbgkPiKcdP6OGMwfb9Wpm8xntwwYAy?=
 =?us-ascii?Q?OjpOYyk2BMnkOTOAW+1KM3lZRnHzGu9XYFeOkhuE2dQEgS5K0ZsKtBLecnEz?=
 =?us-ascii?Q?bwrRw+v12uN1SaOlpek41M+nBPaCKsO80F0SgSXbWspMAevgEFHdaqf08Xt0?=
 =?us-ascii?Q?6UhznJUCEEz1y7hSmfDZaVyapBuk5FjaMc+dJ5nTdz+iR8xIw3QMmhBYq3D5?=
 =?us-ascii?Q?WkL+8Md1hQMQtIF8MYNUxBcvom0JhJ9wQ5RNU2CafuGOQkQxCzViiUnsEk36?=
 =?us-ascii?Q?Wvlf3lygg8vbTp//DsxBzUST0KGNHvbM7zKP9Ipa3J5QXePa91AC1vUnZ7lj?=
 =?us-ascii?Q?DRRTl70JInzhUuXp6mf0CTmouA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c3fddce-6e30-4fb7-e8b4-08d9f633c07b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:47:18.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB3336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:47:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162190

instead of using a global DB (default in DL_DIR) copy an existing
DB file into WORKDIR and use it from there.
This should avoid running into the reported "database is readonly" error
while at the same time there's no need to arbritrarily limit the
cve_check task to just one run at a time

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
This patch should be tested by users that run cve-check on a regular
on hosts with as much as possible cores, before merging.
In local testing I haven't found any issues on a world build,
but as mentioned in the previous patch the issue is kind of hard to
reproduce.
So this patch aims at lifting the arbitrary task lock, while preventing
access by more than one thread/process at a time by sqlite.
Feedback through heavy local testing is very much appreciated

 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 21d3da7974..e4389b7001 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -28,6 +28,7 @@ CVE_VERSION ??=3D "${PV}"
 CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
+CVE_CHECK_DB_FILE_LOCAL =3D "${WORKDIR}/${@os.path.basename(d.getVar('CVE_=
CHECK_DB_FILE'))}"
=20
 CVE_CHECK_LOG ?=3D "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?=3D "${TMPDIR}/cve_check"
@@ -94,9 +95,11 @@ python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
+    import bb.utils
     from oe.cve_check import get_patched_cves
=20
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+        bb.utils.copyfile(d.getVar("CVE_CHECK_DB_FILE"), d.getVar("CVE_CHE=
CK_DB_FILE_LOCAL"))
         try:
             patched_cves =3D get_patched_cves(d)
         except FileNotFoundError:
@@ -111,7 +114,6 @@ python do_cve_check () {
 }
=20
 addtask cve_check before do_build after do_fetch
-do_cve_check[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] =3D "1"
=20
@@ -185,7 +187,7 @@ def check_cves(d, patched_cves):
     cve_whitelist =3D d.getVar("CVE_CHECK_WHITELIST").split()
=20
     import sqlite3
-    db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
+    db_file =3D d.expand("file:${CVE_CHECK_DB_FILE_LOCAL}?mode=3Dro")
     conn =3D sqlite3.connect(db_file, uri=3DTrue)
=20
     # For each of the known product names (e.g. curl has CPEs using curl a=
nd libcurl)...
--=20
2.25.1


