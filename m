Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE7FC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:52:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1183.1645055573029989990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Tom6pIps;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9046cebeea=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21GNqqeK013890
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=KvsVEMbnoqeJ140Sc7jgQPZWIa0Oi7fBw4Q+8/30cKk=;
 b=Tom6pIps+JhG4srcqk6qJfbrPZDkjYHUBU/1r4zsufYddIcYp+UwlLu0OMKV2fqeX1hY
 od9QDUJJ4WztNKuhdrUT/lP4o3B3glh6s//BWiL2PrIVmi7kEK+l6lWoYccghGkF9P0s
 htkjst2uuHfmc38Slr85deXmvvJ9vbtIQSgypbZus+O1SZvYMKvvbsviOstDjlo6gakH
 ojEQwq43j1kZ104DGiMlFqIkmSrlr7l8BI3FMjql7hMDRtvXodnCSr+BkXjbaTsD02Iy
 9siz+MFBlyFAzYZrup6qPVdCE+hRpqurTuCSIxyKD69TIaknU8jk4Pz5BK+QEoeCpC5o hA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8nc3rxrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 23:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnMY/Ugvp6LhFNAS3Ps8RT3K0R7HRukdJq6CsHJMCKW7RLoINUCjvvbbNkJvqb0D9CeJuI3aGgXg2nHB/F2SZN/RmF3zRq94ZFW96NEDONIxAJjWAdCgtHB27CBkk2d82HMz6wsB/D+oh7EgsObk1wfcTRGBFWyJUM6KNzsJz5WKpR20/K+ukwGgH8VDgpRLx8BOSanXXxDeiaukdJkfEa/dy5Y+psflO3dqP2b7wajSrqYxT00qgmMCs2KPRN4DJKNWmpDeVTIdH/PBy6U2WLm8KOZ/q2Z+zRtJNHxcR5Bk9/TSFRA6YitAi+WcGcfgepNkvfZIZCNoxU1/4QtoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvsVEMbnoqeJ140Sc7jgQPZWIa0Oi7fBw4Q+8/30cKk=;
 b=iR6VIi9xQhZv0Nea9lfki0ytzqiG6Z5xBfXH56grMEMWRVrZtn1Dnk8kI7Y9FoUo5bBIcnGm78S0LbW11j7D6bJitU8zTWKnUlomlTGTfpx0iuczg7IkWcjPd28y35aEf9uMWzHVgIbFWNltwPuoqUagZuGR/R1K+bkfn6ssP1DvUBDxeWd7s48DD+yvNI+Me6/f9pbAbuarCL3vsUkj02kYjEWZT6MvSj2WAETL1vYgqUAaUHzZ8dymMisU/N1qZmbC8yEhYmWS7N+DAkNjAyC6qgqV4serKMQCCU9y6O5Mifur4ZYMf4KrxFFGOKOPnqZr1wGB3tA8tF/v+CJjEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MN2PR11MB4077.namprd11.prod.outlook.com (2603:10b6:208:13f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 16 Feb
 2022 23:52:48 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 23:52:48 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] Rename INCOMPATIBLE related varibale
Date: Wed, 16 Feb 2022 15:52:33 -0800
Message-Id: <20220216235233.575379-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31e82388-eed2-4c93-28cb-08d9f1a76f5a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4077:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB40770AB9893756A9E6A387F3EE359@MN2PR11MB4077.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ed076hh3myNuO+/DaQHns3WbdJnDvHH7zZ19REbTRxNyAnwpmbgdaioF3tvlmX2jKDs/aB0wDM7MYfRHatQcrRPEPnsFTMH6WVr+W0VtRrLvgD7QBW+eUtS1wbudJ26lb2yG2x6M9oNMVGjCUFPpx2tXPLU2z0mrWHtYzrDMrtbioK+8Sp7Aeh56/juUuOJmo3OfUn/aXu6M773kpcqwhAFi4xZxP3jN375dXbgSpxW7VujoMV3J4QniVWIsbW/pPgsHn7R8Dm3/hFZF4wj2fwBINr3bDuaZ0LUL4mqEyo8W8Q4fWFrcwv9jU7B26W+v+BECyQlNs4eQEDv373yjHT04Z3KGI1JPoAO8YPrLeUCakqJ2lmk86ku/6/cIGn40bJiR8WZa6aGR+AJsSohFV8VBK/236RFbFgAGoQsQwTziLP8dmq66BWZK5Wh+laqE8itlz19g+er8h4xpf6O72j1E6Fmc+OMXu2Wl66Yt13AIWeQUr9pfqKXmCAccIdhxyYzzqnyMSCBNcNaDXAqywNnaW0o8UkrRkQ2xFsvQUYCgp/AJxQSfdPVVZfy0KDEVl1PoQoe27rS78yhbxvl68Avu4yO9+Dmziyt5Nlzy4FONYYoGBvYQW+rKjsjXxZVhzOAI3fqbllmwxBcEtfrEoDY68cWBIuPqFlTXY58Bfbav165uOXalMUELJggNXDF+NI54nGk5g2r5dYKiZtLccg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2906002)(38350700002)(44832011)(5660300002)(36756003)(2616005)(66946007)(52116002)(38100700002)(66556008)(8936002)(83380400001)(1076003)(26005)(6486002)(6506007)(66476007)(186003)(508600001)(6916009)(316002)(6512007)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YOpCt/cP4eU712QEnq7rfyXqfSour8tnThNjegFkvr5ndQtUipoqybp3yDEb?=
 =?us-ascii?Q?1mlxqjfb7LjJBe2md+ce4+ZW43H2XojfFfzo6+wvTB70BIxQkZYa0E6ngOE7?=
 =?us-ascii?Q?TMvNc2e0YEw5Gmu1Xjnc1nu91JMy74tVhLIJk2rfu0UPlETXjFBvg8KprFFA?=
 =?us-ascii?Q?OfTYESPX0sSyNEBli3Uy/s5BqbiQar4xLWbYDWBRUBANoFBN3M4h+TTwa70t?=
 =?us-ascii?Q?zgkg7moia2Uomd+MufpIg85/aV+emYG6+cFgLNVjBZ/jiagNamqXPbQfHk2j?=
 =?us-ascii?Q?8ECTlpe+IvdPrmsRuuEHXv8f7fCVSJt3UmTRDdHVzFiSKl1hbbz7J3i/kBHz?=
 =?us-ascii?Q?ndk+s0861W5aXcefByolZkGgmOqlLQK3/LONvoHze189UHqzZnHppPo6skzL?=
 =?us-ascii?Q?2hBO+kKeEFykNsAloH/YVjf3Nnft/borxxIl0rXE0aI1Ns2uDYncze3C32V5?=
 =?us-ascii?Q?ctju8bV0hqR1+HIXJPHGcUPNA1HqNb09wHUAwXQWyslaauvoC5EhJr750WxY?=
 =?us-ascii?Q?2VhXnmlsyFBMqFSvo/u/9medRrchQ4udp+hderzcrbrWxmVxLjkdLv5WbhDj?=
 =?us-ascii?Q?1kyCTj/tytWvluMht796tH98ZsIBFRbMs55xhIMUKF1fxL/7Yqm8/kpoH3pv?=
 =?us-ascii?Q?GN62Fn5GWpogImc7y6wDHsxWo4Ruol23yzCGBXvuLLKikGaP7l/ozzhm/gd5?=
 =?us-ascii?Q?erXksHOfVPJwLomOksTPZKsCNHnlLUT43Y5/FeJBT/k9JRzNrZXAVZftQlj4?=
 =?us-ascii?Q?kq6gK/I4mrf7favIxSOaP2qU2+r9L0gKh/EcgYm7KJYVy80XPTKNmOar7B6Y?=
 =?us-ascii?Q?IAazRYRTOenOP2cmAC9IwhBebOndrZdcvYiBqrfiLg7yZeynkttdH2sUayWN?=
 =?us-ascii?Q?hBXRLTdud0ZUrJyxOzjdr/ntvxg8CXyxnflPNF5808DV7KyvYE2z2SvCgSWJ?=
 =?us-ascii?Q?Ye1QzdS1R1Llq1jRdZaNPyKeyd9xPATr12jZzarPsb/MpmUzYK7gCOp2F5FU?=
 =?us-ascii?Q?uQppFAiNc7L6P7rvOcAdvzViybRxjvuxUbQdr33gyXngSYNL9VXJhfzNJSPq?=
 =?us-ascii?Q?5aOiwZNru9KTA5jmCLMwNrFH4QKPOx7ALlwUTCzaSz6UnYMSVpNhFI6RLQds?=
 =?us-ascii?Q?PCdf1KQz/MSvhLHuwgJSjcvJ1UxlvuBASgU97MDPPS7QDupNoefx4rRVp2tU?=
 =?us-ascii?Q?bk4ytrx+HB11Q4rnksh7viSoEOvS9dyCllbYMKvgErWQDDaQK5rdk4ygYMvV?=
 =?us-ascii?Q?W0lfeYgXZVs6TTmJjGCsudIspA4Etw1DPuwTRjkaB1YEcUm15ucLDyxKBrkB?=
 =?us-ascii?Q?cct3cqZLi1l+BgyKtmKP2985E+lUD0zLxqLlCeYTMBb/m8ppnbfGvMQ8EQjs?=
 =?us-ascii?Q?4ig5tfnwQvQn8E0AyR9XOh1Dh34vMhVZVTzP8MGlIQG/GGUu+GdTnUojzaYU?=
 =?us-ascii?Q?2dKBa7wMOTMiBVbaB6Oo86z7K2hNE7uAoq79wq811kHA5fs6N/LWsJh5E5pT?=
 =?us-ascii?Q?evJSr3Y/BMDdnC7k+dklFIcF/GvQ/BaRrj4PjjakyBUN2xPfkTxWVQ33AUY7?=
 =?us-ascii?Q?WCQVwcxoFLZU6Jjs+OkOfxngBc3AuQ4s9avLNiwXk0c/gn2J9uze2N/DoAyI?=
 =?us-ascii?Q?gFCYkOyL9yF2wFODXW3Wz7c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31e82388-eed2-4c93-28cb-08d9f1a76f5a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 23:52:48.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pGNckIUtLKN/ODgKEAOcl/KTk1hrha12kVf9vLCnJpPyZod4Vy13xLSAaV9/VgXrBpDqiXujacxq2L2lQIJgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4077
X-Proofpoint-ORIG-GUID: T_NXYxjQQHbeWZfc0CSgO3HXiVSdvrX8
X-Proofpoint-GUID: T_NXYxjQQHbeWZfc0CSgO3HXiVSdvrX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_11,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=784
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161790

This is one option to handle the rename, another alternative would
be to change the new INCOMPATIBLE_LICENSE_ALLOWED_RECIPES to VarFlag
style.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass                        | 4 ++--
 meta/classes/license_image.bbclass               | 2 +-
 meta/classes/multilib.bbclass                    | 6 +++---
 meta/conf/distro/include/default-distrovars.inc  | 2 +-
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 87a4cb5fc7..a376dfa134 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -598,9 +598,9 @@ python () {
             whitelist = []
             for lic in bad_licenses:
                 spdx_license = return_spdx(d, lic)
-                whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
+                whitelist.extend((d.getVar("INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_" + lic) or "").split())
                 if spdx_license:
-                    whitelist.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
+                    whitelist.extend((d.getVar("INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_" + spdx_license) or "").split())
 
             if pn in whitelist:
                 '''
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index bf70bee99b..701516d324 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -56,7 +56,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
 
     whitelist = []
     for lic in bad_licenses:
-        whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
+        whitelist.extend((d.getVar("INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_" + lic) or "").split())
 
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ec2013198c..278a88181a 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -75,11 +75,11 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
-    # Expand WHITELIST_GPL-3.0 with multilib prefix
-    pkgs = e.data.getVar("WHITELIST_GPL-3.0")
+    # Expand INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_GPL-3.0 with multilib prefix
+    pkgs = e.data.getVar("INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_GPL-3.0")
     for pkg in pkgs.split():
         pkgs += " " + variant + "-" + pkg
-    e.data.setVar("WHITELIST_GPL-3.0", pkgs)
+    e.data.setVar("INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_GPL-3.0", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3bba651a77..7bfb946e67 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -20,7 +20,7 @@ DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 la
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-WHITELIST_GPL-3.0 ?= ""
+INCOMPATIBLE_LICENSE_ALLOWED_RECIPE_GPL-3.0 ?= ""
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index fd3b3f409e..52c381dba6 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -111,7 +111,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
         bitbake('core-image-minimal')
 
     def test_bash_whitelist(self):
-        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0:pn-core-image-minimal = "bash"')
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_ALLOWED_RECIPE_GPL-3.0:pn-core-image-minimal = "bash"')
 
         bitbake('core-image-minimal')
 
-- 
2.25.1


