Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A86C61D85
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:15:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10656.1700619317188274117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nmLueTkF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9690fdf6c3=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AM1lA3O001290
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:15:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=LCByh5UyWl37zKsDy/
	RXqKOGHLJULDkIwd3gGQbhFbM=; b=nmLueTkFaG3CBuuawyIDaD1RU0F+qSDuvE
	Q2SrGb5z/FEplIsmC3/ll0Nxoa64cz3aIVO3LHg6clBCodpG8Ye79otG6p+ptOm2
	6fuF/Siczxe8fM9zvIaoVDihX4LDoKpt1y0oC0nGqsR+LZ35t6tVYbG76ly/vteR
	tMK49E5kt68aGUjNKHwsCOinQEkadJ8pKsqMu8qcP7rRQubFjWB+qV0dGKAwZI2Z
	YQIbMfdPYr+knTAFV8QhTnTzKbdsb1hons4ZdkMvlWIzEi+bJ/epFHWU1yGYYQMa
	Wcd8LElay/K/K29YZugC2Jsdgu5l9WNwhqBewjP0wtCjPqWG8zoA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnktsxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5i+DxozNBIJpdxeWJiTblizJWkzdPXKLdSrleV3JgXoX/9gseZR5NbrgxRR1RIhjY3dOULRNlY8+UunpHMkRwovLil/VmOWXa1ntLlrhnXla+Y8O97F/869Xh7lotSZO7UU29+GlxFooNVGBLF/oY/z6Z7dTFNEalHJ2A/DBXWhEcKU4AtgyF/0FXy+ekguc/M9Sq8ZvaJxMDLrsnDzgzHBbOIbEEQy5yfIDrpYTLQsTNaHHoUww8SQe60Xjeq96pBZH1EwfqsQqy3yupF/K/5ZXdcSbv3vb+6zb3+gSqzBmDadlk3s4OGDlsxOuLOGjhC4xsXoQMphFK9CqOIk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCByh5UyWl37zKsDy/RXqKOGHLJULDkIwd3gGQbhFbM=;
 b=AAK+XbtwJFlzWK0KmMAwI6ccUzqeItZFALO3xHRWAmb+iLlxNV1BX2+JrwWGPCLho2e+L6lvK2Q39R+CInetBpTOvWxAERJ3YyFvE6BjDmKMmN2soANMWyO9R+Jl/FLPXIGaOZI2k6BXDBvrh64m3oCr4Klm+bAf2Od3rpmhbMthFCpSquaPQ2bJcq1qw00XngQIs4ZV42QWnF63KhDHEUjdv6EPSg9YX95BWg89JFPwJWEu0dPmlHffqNINtaq6aZ8C+wq3yoNVSUafnOvvTPSrFLvTcLVJQwRJEEmZZ+4NR3TTRSKsMvXVpyG7SKwXsq/Gh9qBCkad2d+Pv9+HGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 02:15:14 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 02:15:13 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Subject: [PATCH] rust: rust package split
Date: Tue, 21 Nov 2023 18:14:46 -0800
Message-ID: <20231122021446.3020368-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d4dab9-0d57-4cc9-aa97-08dbeb00dc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qLUQjSxzYkS6Bn0lhLwsBlftEB5GGssr/k3+L+obxbIqe4VoyWxfz6c/oq8iaNUssFt9EoymM2ky6FqeAnvnxuuineYDimnccTIlfUHYn4iPrw8bkzBGf2gTvZtFUm0//yBJF7PI1zeaQQ9V8tFeardCTylpIGTzQmTPNm3Zgv/Amh8qy8Q8nNiyP5v58ZgHJyzhDj0WQfZehQrLjHuAv3OcLDMFh+R2vocEPR9wnLLI5wjzL9VYgedavN/FCAMGwKlaeLWfCuBnrx5FBHm1/QzJgIt2kJks9PQE2/CLj5r6MgxYyU2UFq1naBNrXqj6GqBVEcyYx/2su5n4VgcTVR5hUR3M/cTFXtr5i0yNkeSmDowh5FBPpAEjuK+AdFq+HfeM3VAP/nWo6iyXyEZNbTJqKUk6jxsKhCVYlLW01VchkC6DMPn+1/OL2DxFo4jB+LhSiWxWNShBe/R+45lOIbGii1gF9Ehe2kt8Emie4Nx54T4I4j7+zty8RttZpzKkmFERUDCt8wVFHTW2pgLkE91pqrudidcIaFHHUitIHqh2wwRMYgb4vE6JJr69e9vo7d8Z37g/iXLX0/qo8gQhPa14n/+YRlry5hzguSlcYqAvxcKE8v3YJ8OXm01/OLAZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39850400004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(2906002)(86362001)(36756003)(5660300002)(38350700005)(6512007)(2616005)(26005)(1076003)(478600001)(83380400001)(6486002)(107886003)(6506007)(52116002)(6666004)(38100700002)(4326008)(8936002)(66476007)(6916009)(66556008)(66946007)(8676002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8HsA4s1ACTV/2idF+INYCgv0X2HW3/jCNynpbGIbJ04EEy1yKNrzcrQ3kVdX?=
 =?us-ascii?Q?x4tLw0jb66mQcE/J84HI5UhEJYQcBMEVy4fpiibocSS2LmlSayHgflBvAtT8?=
 =?us-ascii?Q?g4Jh6rQfE5z7S1RNNB1+7Ec1+qRv0ut7Eju3EDNcUwb4G7EpAINjs8PKej6m?=
 =?us-ascii?Q?qUdts+Xi2R4oNDLeov7UsATi8JWoY5AFixv6ndqJcmu6YQFPq3GWUZy2A7mS?=
 =?us-ascii?Q?x5jxIufEbSI9q8xorZsstRph+5Hs1U9UMY1pDsZJ2h7KtWYxV3C/jRSnxKSy?=
 =?us-ascii?Q?beFg7wa7K5BEaLsMumySAiRZHKudH33JJe1fqW0bRCm/Evfbnge6H7Z+AfRq?=
 =?us-ascii?Q?BBZ6K7MKiOsuMzKzR2IC1NOeZcyV5iWqiPJLc3MMYxPZbwMUkqz36QBzuCuX?=
 =?us-ascii?Q?NF2eEIh7xPnPSu37zcFMN46B2M2jmHr+UO31u/GO1CeJoJ6FAhpcwUnpluY+?=
 =?us-ascii?Q?E0qNuJLO6X4lp68xMUgaJA9iFBMd9AU8w5Uxt67OXgnzqzBQ676FW5176JhB?=
 =?us-ascii?Q?Ecp8zays8NOYuYJBpVKAy/8RNP2Z2MF1jfKINFOt+eJNB+e4dJKMS4iDTqFg?=
 =?us-ascii?Q?qaVxWs+GGVDCt6MClL69zWv8dtU19BC1X7G1QdZwisla08xYald91jMaAAyh?=
 =?us-ascii?Q?qZl2GAEu+DYWmy3dJbPbLyh1kYSw8lY1ov7z/Gq3a9bsSqepvPm09M47dtSV?=
 =?us-ascii?Q?tv1/Hg3kkm9xj9DPuK6uenxMj75SLFwvO9yAsh9Rhar4h+BMSvC+R53IAwUy?=
 =?us-ascii?Q?+ENI29WWpu+4cDDLmGb/I/vNS/bqrl41gaYR2yCvTQh4A+LGtR3R6ZlX6A1Q?=
 =?us-ascii?Q?AtU/XscRt+I6jKMTg/t5VGdH7QyrUuiRaYXrlyM9TKuG57CDUZWwNzwue4yk?=
 =?us-ascii?Q?oVyMqQveEfRS3OMA7PnVNUry+gkHYEGjD7YlaMUejdqB2vZQ8atrzPsOVnuA?=
 =?us-ascii?Q?xoJNUnaZ7reTIZAQB9JScfE2zgyu8yaMuYYnJX0Wrake9jAaowyujBFPwrzD?=
 =?us-ascii?Q?JkwLe+npEigz5YZ37oS6ZARm3W7MpImCIL3ws0HQQ1YvnRm/mrwSASwyuJlI?=
 =?us-ascii?Q?HJKLNyYlvnKReGekeUleoziY4jW0A5nZ7KP/Ao/QAtfdJD/Fyq3QwHoAL9eh?=
 =?us-ascii?Q?WwjvE51mNS91wzbQe3NJgXw5zvBGSFqBqbLpP++HTgPJh4blbv2ToH2yarc8?=
 =?us-ascii?Q?QVAXRbkKdE9OpwhcMngI1NKDxV0MUIZwWeW/996T21MXUfBRLgzHuloSdSlB?=
 =?us-ascii?Q?KQ4+3z4BXismR7BGPHrB8etKpc0pxBvQzsNeVWCbs9fs3myZbjsBVWmau1/M?=
 =?us-ascii?Q?K1PmEdReF6Mr83WijDx7yhps5OrOKOZDRAY+Z3mejvaHitXbIsdfFlW8bPDw?=
 =?us-ascii?Q?K95D5b5Whc+MQ6vftx7Q14Mh2f9aimP7sf3KE/YLqlOHjD/diHLaOudOj9ZV?=
 =?us-ascii?Q?pdb2+rARtiJOxs1mdhqqF9S4zINoV7HvxcqTQ9uNi323uMWApxFELspHZnvp?=
 =?us-ascii?Q?SIhPsHc0fWOqiw2U4PCv+QtqMmh6U8AXAlpFLivoYVBBl2E7XONvY/E3CT2j?=
 =?us-ascii?Q?NYczgS5IwrClk62aer/C121/kEdeZBaE2QoCilV06prwablh5ztZZSi5qFrx?=
 =?us-ascii?Q?C8QMOdI7CZx/L0X109DLvuU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d4dab9-0d57-4cc9-aa97-08dbeb00dc2f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 02:15:13.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etz694RkwVmYNjI2y8zl5/a9WH+zCCfEw1Q04nHx30Htb/3DwO7lhUqh8D8f2Jdlv5Nai48FXdU+uvzI40CPpAeLU1XvRv1pZSMsgFbxVaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-ORIG-GUID: DQZMEZvfGhHO8xdI6xC-WSGivZdYXPal
X-Proofpoint-GUID: DQZMEZvfGhHO8xdI6xC-WSGivZdYXPal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=406 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311220013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190998

The 'rustdoc' is moved to a separate 'rust-rustdoc' package. This is a workaround to make rust build is reproducible.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 meta/recipes-devtools/rust/rust_1.70.0.bb    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 029b6af331..14ccb0b24d 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -16,7 +16,7 @@ import os
 import datetime
 
 exclude_packages = [
-	'rust',
+	'rust-rustdoc',
 	'rust-dbg'
 	]
 
diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 16d433910f..a7efd2f7f0 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -232,9 +232,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
 RDEPENDS:${PN}-tools-rustfmt = "${PN}"
 
-- 
2.42.0


