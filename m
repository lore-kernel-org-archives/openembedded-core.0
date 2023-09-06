Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8DBEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 09:33:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4564.1693992812276555762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 02:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FiNMdWaw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76138bfad3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38669dub006477
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=K97MxJgrGzQC9ZoAa0
	Vx3e81WZAj54V+TNgLpzA0m/U=; b=FiNMdWawyxMZztn7SfGVJ09It3MyG4JZId
	GQoXF1QFZTg88QyTsWM9NG3gAbDQrx69sipL8/Di95yCcqB5WgfZtPtzi3q+h+NI
	bnNjsOwXxiKVrhkc6ww0Nd1SJhOAd0yuqnNCeQsB2Ja7HfhtMvrBh6ix7RLgq9e0
	uES02+2RScc69Ec5IOYU66PiFrNZR5l7AOJqo4rjb0xOqy+nkWrshBgvhIBK2pur
	pJdXFldZ0XohwD+HO18C7YuF30e8uNefeXV5Mg+JEfyud35g8CGK/8nHBAkLg1Qh
	s/tOZyRjthHlPQOUVRDPF+3k2icYsUetMgnR0eGpa9+WoRT/W9jQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k27tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:33:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdtSFs6YvOye+OifzWtCQfdgjWnkS7VVoFc7NkwZi0noEPHTNSm3kOS00/MDxvZ92Dz9vuNzyRTW6If4d0UHSIzZL4P/neJSeNVZgCH5cqzvKv8vzI/ygpcAEXbNJ+Vppv+akBDF5nsSjPz8u1CE6yWub6JDeA1z0ytCaJLv+uLdz1weJBTtvAekQTJoxQil4c9Cp9RCDKysm7+Uk/XFFaRYmVDhAVuWxDR2ONwBzeVZvaZyS+FzUbaGNrl6bbut7hpQDnS0TWipVU5g8YvDMjKufJxtIW2W5U+8iQfHeLdhPnl81vjm1PNaGXZJb1wcqhPa8rxKHKl9BMxwi55rGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K97MxJgrGzQC9ZoAa0Vx3e81WZAj54V+TNgLpzA0m/U=;
 b=N1uY4ZZqlVtlPzKujkNx8gK87x5p+Nn3U99yjxuxMznPebHmHTb69yyqKs6UXnMLSOunhKVmWtv1DDgh9NeKPhExPPvhsA+CpYnobUTNeL5tdOnsbFjHaKLYx7I2Gk/yduFyYNpdpnc4L7GSnfgeFGUpxZir3IOBaJerGDQDRfbN3m6hamTKjoLmC6XVsOcI2fWiJBA3IC3/MarMpJenI8n0hL4Q33rMngbc1LKC2wOJTJjCB1tU56DOvtNgCc9fDP2L24KytyTf/1CU3bv51jT5+RH5+BuXekCRK+lwmybuY/Rj7+/8oT5V5h4PReAITHGGTFqJdzpD1+17ilDXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:33:28 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:33:27 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH V2] binutils: Fix CVE-2022-47011
Date: Wed,  6 Sep 2023 02:33:12 -0700
Message-Id: <20230906093312.676954-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5bd5ba-8aaa-4ea6-4ac4-08dbaebc530e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	InL3/CRQbwHNBkDnkpWrrxNfMkvxZEBoNqDnX8jVJU/1Eu44LpvgHRg6zH21UxkVbAiNtQ9wwktcke2z/nAvpxJMkvgFnH4Uh6iOL680h4tKofILdslRxPABgsQu/aVlwT2K90yJ13UGu09gHCBiBR98oTf7HIP9yMh0gMo8XmA1gT/EugVriuyOrS/gIwYFuXOunnAT/qP61S7P9vYBstpUKynVLfr04t9zom4k9f6prdqOv/KpiyQZRh1ov0PjQFCj1ip43ur+hHTiplD6Ct9w7ZJQsior8V4htRZZLOvlRbNlUlIMQGD7SD+ePIKpYwP10XtZta8zkWBy0vftArzawy1UqIn97GmcT57CoM6PD1i2/FHxkC3qivaXEIMFSq/lMs/4CeA1W4kBSsC93LdpInwg805CpvKHUstSKUwIxVtyULtSTJs1WYlcfRnjccmplvHkfnmID2vXeONRSEwFLGUpHnjUVJY0NlzdHweP1oQ+dAM1IITPjUWS3yL/LKCtgqWFjvZ3cZGIPtXLBNIHFcVj0VppMtPm6vQbK28eAH1lKR6uj4PulqgZCatekGt4sMp3aZp45gd0VyoOfnP7LuuLUlSE40IrlyboOaY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(39850400004)(376002)(451199024)(186009)(1800799009)(52116002)(6506007)(6486002)(6666004)(36756003)(86362001)(38100700002)(38350700002)(2616005)(107886003)(1076003)(2906002)(26005)(966005)(6512007)(83380400001)(478600001)(66946007)(316002)(8936002)(8676002)(4326008)(5660300002)(6916009)(41300700001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fnVAJxD207QysOwKAkCKj3p8qjWAFy9KzAKNtZKnBvvpFLFMEzFcZoTmDanc?=
 =?us-ascii?Q?RQTYLsWA/b6/1Vd2ARmWmvmwycVIYJvNPZiRld3yMsrD4L6TupyevKDGBAq3?=
 =?us-ascii?Q?lALEn6VT76KH/2abgBjGVEbBNZ1Ab1jEVuAQXtqrNEU7Lm7Ug53GNothPjhw?=
 =?us-ascii?Q?eeTPfw+0quIvSIf2Zn3QjlhMFJdX2hpYYKGnJLu9Frxx/pc11ZDqVrBqC2HE?=
 =?us-ascii?Q?7cLisOJRNybX2EX0cMJX+h7P8YH3NYEXoOJRlPaBxgQM/rABdJibwZGcfb3q?=
 =?us-ascii?Q?j02whc5D9t/7+R9O82OTYuodUArGbkx+yQKgFx5tqyC7UhusXD1utHn5mfWu?=
 =?us-ascii?Q?q45i21yKpHPs0sLIlbh2ISw63+Nekr2zl9IYTAs/PbI7AJX04FyylDPmdjrw?=
 =?us-ascii?Q?Ylrb+YN2yeOvVvZ21zoV10gS5a6LGU/N9FLOYpo2YbX37/K7bx0xfLZOff+k?=
 =?us-ascii?Q?CePrLGA/+/aROYPax6LK8lh+MHhj+UGJDS/tOaoFhD+IvewyUCXPZuMjvP7a?=
 =?us-ascii?Q?aJmEUEl22pIwwW4NiH8lk/H96Hg+mzNEESYcwk/qh3xMvb6W08Tp550G9CNj?=
 =?us-ascii?Q?FMnHtQLigl1FzmsgGrNmR9f5YX3pypQdzvjbe6aoOO5Srbuc/nF68K5Smv8s?=
 =?us-ascii?Q?Y+/HOPGnOoOYKatmwVDBZSTDN4+O3fBuwJjbK2PadxdrkOwU83yQKcLFZVzY?=
 =?us-ascii?Q?qfELYoMkkIDwRyStmeQrvkxGuCtA5IN7UTavQTcYHztbs/mh0dpB6PZiUZML?=
 =?us-ascii?Q?/nTuJPqKEcKH5QSd+xNttXa2kKbhZrVt65mU/1fQEavuUdsNAANtApX/JltM?=
 =?us-ascii?Q?+tMaeSb36tCaUiCXC2v/DyAkiTyykJwinIZ5SUfUlRbqgCKj70rHOBuSSt+O?=
 =?us-ascii?Q?IByssabxAdBDjVsUTH1mMvscp8cCogTwxFVL4iuw4r+rkDyZYheJap0CceWP?=
 =?us-ascii?Q?Y478TM2F2DPrDUCIndN8JKU14it1mSK5aW2VEWuJzIrHiMHBcXXiwdsuE3Ly?=
 =?us-ascii?Q?hEB+vVq9sKhOY+SLibEuCoAvUEd6JNDFPOAaiM8gu/9cvBwmEZlCI7XySdN2?=
 =?us-ascii?Q?WrWNwuGm6LZ6IpDYp0odCRhYVsOYiIBryxjXV+aCgadJoM/WVVf4Uqil7HkQ?=
 =?us-ascii?Q?Td4k8KQPtUNInYWgQgOIDvRy/7CeW4vYZf8eOVxCQ40MurDOpUTNneXcbNiz?=
 =?us-ascii?Q?y6QRCWoKW7ZDljWQL/In6gBIgS0gHwPGRxvzsbf7lUwZwzXv7a2eS7yQ/NM5?=
 =?us-ascii?Q?CGlbTIoGud0Nc3z/NUzatE3iUqXPc76IGdZnhkQYWD2WeQJsKRkPOrBSLPXV?=
 =?us-ascii?Q?xdbq/lWLJrCT6icwugBX2EMfL61tGDpD1grK7OLdujxaFl2GaOtB9WcxW6/l?=
 =?us-ascii?Q?qW3fqIFcoIvtIiNwg1qNypYJWTmk3ZI8xujrRMZxjuvihz5yb0vFZyGlY6Xa?=
 =?us-ascii?Q?ir/EngbzOwZuSkocwvGYrx46z1iXKvGWeiRHMWOBZL4XQst7xPzdaS+fXTOI?=
 =?us-ascii?Q?mpMGLiu5FcC8JU2vYbMruyMAR8jfw9QZ1DJHRt7ml+vL9/uX6e5TtXveyO3j?=
 =?us-ascii?Q?upLwdkFyLqEtOVHQyLR65R60XK8HoBCafPAth1V85LfSIhnVfaMW06/ozSg6?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5bd5ba-8aaa-4ea6-4ac4-08dbaebc530e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:33:27.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3T5sB0Bfm4kyan9Jbm31k5/xQI9W7TFjF7roIS1xzFMjF/vSoMB7mXcT1M/84bpX7p8u3fcj1D1xDBDqySY4NVqdDxzs3+BTeB3Da83EeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-Proofpoint-GUID: jDIFl3-R1xqnOgbIYObCS0AkEZFZCL_T
X-Proofpoint-ORIG-GUID: jDIFl3-R1xqnOgbIYObCS0AkEZFZCL_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=656
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187289

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0028-CVE-2022-47011.patch        | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..aa77263c66 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,5 +56,6 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0028-CVE-2022-47011.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
new file mode 100644
index 0000000000..73ae46e218
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
@@ -0,0 +1,35 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 01:09:13 +0000 (+0930)
+Subject: PR29261, memory leak in parse_stab_struct_fields
+X-Git-Tag: binutils-2_39~225
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35
+
+PR29261, memory leak in parse_stab_struct_fields
+
+	PR 29261
+	* stabs.c (parse_stab_struct_fields): Free "fields" on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35]
+
+CVE: CVE-2022-47011
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 796ff85b86a..bf3f578cbcc 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -2367,7 +2367,10 @@ parse_stab_struct_fields (void *dhandle,
+ 
+       if (! parse_stab_one_struct_field (dhandle, info, pp, p, fields + c,
+ 					 staticsp, p_end))
+-	return false;
++	{
++	  free (fields);
++	  return false;
++	}
+ 
+       ++c;
+     }
-- 
2.39.0


