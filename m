Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEF3CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 11:29:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.118123.1697455779103497045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 04:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pgkG1SPA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8653d93643=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39GAL7XV008030
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=BfiUDivbRoIbwG7yM1
	/Wiv/bcZ7RPKYszYCYXsNNNg0=; b=pgkG1SPANd3IxsuncrpgBuOpR/SG8u65xZ
	U7pCDlkVzoFQRhChXcafe+z6e8UtoNt3x/akkrmLSFsbxOKVVbYU4mOL9LONbhKX
	Z692dsHr/2fYujCCLhCwqWkC35zhU1BaqdZG5NnO6wSPPFfj5+Xoq3SVRh2asRRm
	zBCRa2XV6O1GL3ABKU+vbotdIyHg5RNvoswAfrBTfyhrck9sWftI30i6SFoMyA/a
	o2mDe1TqOamJpCHwU5FxI6mSEU7HAFwVgZTz/u/5MRoW1YangCHLvai0UKKZIIXy
	NUiWy/uUIvNJdFj4pjbFthPrByOzpj2D3AwnwNz7MT2OlagnUmsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqhy61rpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:29:38 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39GBSch5002604
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:29:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqhy61rpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 11:29:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqhj5xyBEhPEldN/icW4YiG84cbx+TOXFQPG56rruz1PONTWLGGcYApA8x05RpDH2JidkOpV3UqRWLcM1HYA9QyBZwj92BCnxUWbx4/+HFy03P3owCSLAV1VjuOTD5P4f03IreBdymT9Ujl8gP9IdDKyPtCvq2wxgIa4uGGVONR+mjI4eKnGc86F62HeXriMrv3Y0jn1NodxfcpooaS5Aw5KtAxuYFR8U/lwI43tdjaZzbQcB7SRjnPfIUqCYOlI0INBg51vYQqaeLetAcZI6nlBimA4wHTv7rRwQ3zzVrbb3SLTb5IHuHYrVlreAf9n4EKNLML6y9l1M5+ajLFAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfiUDivbRoIbwG7yM1/Wiv/bcZ7RPKYszYCYXsNNNg0=;
 b=MnvJzGj4pYWJHE16huMCKG9oZ0x7whzuxgVgI4RdgJaXIB/BRLPyF0AlZulOgjYyH6wPzP+eCEpNWLFJkN8xyAjHe4fdidvkt3LaPYOdE1AI9451Yo80Iqe05BnUJ6abZZjCjbTu4/lR58RRnTdcgldJHZZJfxvQSym8WIqNF5jBFy554h0erB6eGs0lv16crFgLVeKbB6g8Cpoe3xwjVIzdoXgxyBtkEQY8B1jRTFkof0P2NVEJi593KtaOZptFjYhrGaJLZg+iH7S1RbtE45jVy3OCQb3aWA/+M5UCegtSSf/WKzYV+F2K7K2Zhux8XwApYfwXy25EGrs3Odyghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 11:29:34 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::1bc0:182d:fc84:69eb]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::1bc0:182d:fc84:69eb%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:29:34 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 1/2] binutils: Fix CVE-2022-47008
Date: Mon, 16 Oct 2023 04:27:51 -0700
Message-Id: <20231016112752.958551-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 5410b5d9-eab6-4fb3-a9db-08dbce3b2c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TQ+EC32EteV4uLjsdh7iEVIeC8cn9V5t3aui8qZK8Q9N2yedG6WtFJhntScilXmb4Y4fgl4+jATP6RPVLxbysZR6y+bRuh1U5FFcjSsEVLCvUrP1/t0OKCXXxCOvad0qeZ4hLgQRNH5XiUbI90RfXVlIgNra2NMUqLDDureYO8xCDznxhDbgkp2nApcwocrjF/lerFZ+WsYVJ5YDVYQqet0erYlpdJ1lVTSH//QbXi6yPe+piH26aYhBAxq+JGgFOIjgYehy8Xd7DWwxy2xtj06fQFOhGF5kgDF+7Y0tanDyu4bPvISaq8EAzDoK3+hy7dNt3YQsr5WnLoImlHukdf4c26I31U74QgTozMWfYU+y5aZZnDRu5PFFBG3qHDHkwLRsSoBG0iujHYAm0DEKpTQkVkUpM9aVB1A1NYjfo5EbcS6/e+MCmxQCiPKM3K0qNErSMphD26j6G1qTtMg9DsbmjaCjzM9OaaWMEx1lC99632QDQyr9Kry9rCrl/KtaeI0SyYPBvFIouYywZe/wHG3SV6A+6hKvpL8NUR8LZ8NUEYuqoXPbGpdYvZl3nFapH98SOoL0tsVaZ9lU0dxm7S+T6lDg8ALJhkYHW3vlM3k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(39850400004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(5660300002)(6666004)(2906002)(1076003)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(9686003)(6512007)(6486002)(966005)(478600001)(66946007)(66476007)(66556008)(6916009)(41300700001)(316002)(38350700005)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Iwjdsrm/J15lyeyDMZhc0gF1kWxXs/qKjqNfjPNRq28P1lqfd9BVIeYEj/k+?=
 =?us-ascii?Q?fkemmpVu9KxKNtKW3jHLS+wlmUsdEM7onVY1K2Yte461zp9IablGBVNx9Z3Y?=
 =?us-ascii?Q?7TrU8oTVMNxa5UXBalR1TbukoBCO2btJl69mF2GycmKchGW5SA7hcJiz+Sjn?=
 =?us-ascii?Q?Mh7sqpvO+2b3WckdbecNM6JS1bTlivMvFiY90PpBB9YM1Ps1MF7jZ8kgZ9SZ?=
 =?us-ascii?Q?oaIaGiTmajUkhRiZjc5zV5h0zRpfuECWNWNzYF63gM73Wlt5ICEk667yKA97?=
 =?us-ascii?Q?NsJJ4NibTeNMEhAPV+VtrMIyFWWGjo6MmksCHqEhN1YxKdh5CgAa8qJW1p5c?=
 =?us-ascii?Q?ZYai5fKaqMPpcwwSWkTIGgypwjpzyqHcUtMqXa6O2/I6IpSzsWGaVJZkxliy?=
 =?us-ascii?Q?CDOwiQawI3nBSGVTIymfi08+7TfJ8q4TNYcJg1GWJoeEzHOGKfPMz7wZ+r1o?=
 =?us-ascii?Q?qXeCYWuygN0Wf6aq7qclb8sXDTeTecdsael7t/A+sEgmbldpQWNfKokTCCfq?=
 =?us-ascii?Q?uN/blQ6xX43lLszVOXVgbTOjROLhJriHh28rDtvF9Vsh/EfabLAqbNyRaXpr?=
 =?us-ascii?Q?BynTiS1LudrAG8jijW6IvdwM0rKzeLcmkCNfud6e79TvX72/L0G9HE3I4OZ3?=
 =?us-ascii?Q?sbu0S+c7KssWo2n7TnaMssnEKeTmNbOggj9Nn9RD78Rt5uerXksNdD3hlP1/?=
 =?us-ascii?Q?Iq80GkaKYWFcqbFjQDovH8huRPTrxTRLCQxK3xs5Z9xR0TjchgS2IRJqwmDF?=
 =?us-ascii?Q?MmpV0BV4pbyIzhmh1d7JfgbTXlz2E/FdHzlh8t6gnxxOrFcoRz/MCB0EkIxP?=
 =?us-ascii?Q?iETAdIRQd9Qcb5IQtjp+nXVbJLqnfMNI4mwSDl+AFzytl37fmWUiSKBljrR2?=
 =?us-ascii?Q?VI1VlB1HSW2xsd6Lo75jx7GUM+bAIjzhYUklA7Nz3o5Jnhv/KTmbjB/iwTbq?=
 =?us-ascii?Q?WoLEGh6+LZgt3cgrEdU59UQGG4zpiXe8KmwkAiabr+wptbcm8bfwmRrROlf6?=
 =?us-ascii?Q?rJ2lT8RqoDB/QukjiK2BTsjm8Uo/V502u5YpfIKfsrwQA8zMxDcHh47UcERY?=
 =?us-ascii?Q?cDzAeSOzpRBLdOPSKUUk8orHegYAAAOi1527v2ygWzDKvB1weZDeGhubu4zG?=
 =?us-ascii?Q?nX7MCSDN5L7tPXQ7R0wq+0uQhHQj62oW/TihnhlANRL/jfskSL+sRV+iqhtn?=
 =?us-ascii?Q?KTf76RL9IT151rDxWlbycJdkfY2f3MC29ai1cOk/wLfmU2H/8QaaOXmcw5q0?=
 =?us-ascii?Q?R0mUUWit5pvQd8TStdNusVS7P93uee/1jKaOvr1gqRJE78KDH+FUFFfM/3pg?=
 =?us-ascii?Q?tfASNTiLlA7ohXluof6h3gupPzaKGZ6bCm1ZTFuYE/xELbXaT0FKPw2MLhbR?=
 =?us-ascii?Q?RE6HPCPDXCS0xuthoFM8A87OBbWYJf4jJoWT4KpOf8O5n9hhtGUoafOItwFH?=
 =?us-ascii?Q?ZXYNYRhBpUkaq7DCegTEssBzdTvtbxpxYyv6EhRKfPCXovSYwFTdFvB7Ytb7?=
 =?us-ascii?Q?UEubvVJaAg1sSy4kryAqIS3THJ4VryzMFe+YBM8ng8NWSxrJEkBcZ39NtINI?=
 =?us-ascii?Q?tu5JKlRkTTFC6v6kUvtkBpS9/rI9kYTs8HTZw+WMmlQR2pDqGL/lcIZVVRxX?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5410b5d9-eab6-4fb3-a9db-08dbce3b2c3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:29:34.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEOD262Y57BB9QmfZXGFLCDhMDdE/eK3tNTaW/LzKvv/tTuEwpgQW9uu9ESRCI0C4u4FiPPd4BbyamDdQ1v23xRxXAqrAqy7wG/GSxOCGyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-Proofpoint-ORIG-GUID: rTT2m2PPFwxLYSuVST8LgZGTmQRd3-MP
X-Proofpoint-GUID: 8d2YqvujW-JmVyfK8MwQF5xEB4WH9PNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_04,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=675 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310160101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189285

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0027-CVE-2022-47008.patch        | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 638b1ba93d..6c670ce4e3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,6 +56,7 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0027-CVE-2022-47008.patch \
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
new file mode 100644
index 0000000000..a3fff65409
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
@@ -0,0 +1,67 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:43:38 +0000 (+0930)
+Subject: PR29255, memory leak in make_tempdir
+X-Git-Tag: binutils-2_39~236
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682
+
+PR29255, memory leak in make_tempdir
+
+	PR 29255
+	* bucomm.c (make_tempdir, make_tempname): Free template on all
+	failure paths.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682]
+
+CVE: CVE-2022-47008
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index fdc2209df9c..4395cb9f7f5 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -537,8 +537,9 @@ make_tempname (const char *filename, int *ofd)
+ #else
+   tmpname = mktemp (tmpname);
+   if (tmpname == NULL)
+-    return NULL;
+-  fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
++    fd = -1;
++  else
++    fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
+ #endif
+   if (fd == -1)
+     {
+@@ -556,22 +557,23 @@ char *
+ make_tempdir (const char *filename)
+ {
+   char *tmpname = template_in_dir (filename);
++  char *ret;
+ 
+ #ifdef HAVE_MKDTEMP
+-  return mkdtemp (tmpname);
++  ret = mkdtemp (tmpname);
+ #else
+-  tmpname = mktemp (tmpname);
+-  if (tmpname == NULL)
+-    return NULL;
++  ret = mktemp (tmpname);
+ #if defined (_WIN32) && !defined (__CYGWIN32__)
+   if (mkdir (tmpname) != 0)
+-    return NULL;
++    ret = NULL;
+ #else
+   if (mkdir (tmpname, 0700) != 0)
+-    return NULL;
++    ret = NULL;
+ #endif
+-  return tmpname;
+ #endif
++  if (ret == NULL)
++    free (tmpname);
++  return ret;
+ }
+ 
+ /* Parse a string into a VMA, with a fatal error if it can't be
-- 
2.39.0


