Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB432C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 01:27:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4813.1645666040365115648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 17:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VyDbZDD9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9054b88637=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21NModmW021022
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 01:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XYV6fdyISPhg6eyCQccpS2tasfy+AlvVTavld+uoaK8=;
 b=VyDbZDD9W9LBlSrifB5JuKL4Wayj1OWtd8E+nfxDiZpJZJ36pzdooJ4yrJWj8HzgToXy
 QXRWaDcsoeLksKYHS97zoEAEQHQe3rLgjakgOMtRXGmSWMqDrT3towW6MOHEopmM39Ux
 tLWR7tor/JubjMNksibrBthqMgUCWuJpMnHjVjqbevu0RnNxdwCAZhQrv9kT/eFWDlVx
 CRkV3i0pcaxgl9m/w5JkPk9hCVxsL+PUYaECajXtDuaOLeO9Y7StRBye2i+ApHV7M/YW
 z9826cZpJXLVI2Do2Qmfg1imEvzj57s1IVrG36ik63870HPyScsNUYH3WmWIpQZxokxd Ag==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3edukjg6ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiWPVqleSCGDW+DgtXgN7JOdBFB4k9PQ93Ozg4IdzHSvkV45G2+TnJsnMhdpknvXf1yt0Y69F/KeD1l8NT9WyjXviMbuxYvKWieMTTYT5tnJ5chX3vPrMTjzjwr9xiS1i+tlzj2/MNdbAZfxCKhcL+OPHd9bPf7ggVQuCTN7KjzE1nSQd4aW3qe/QaIXfdw+EzjBIIoZSoio4d+iCpeIsJnk4pkPtD1LVvz6g7q3nAp/1jJyNEodte+GhpPo4XVaOzgsJYSkxGr7HlKrQxlrFFX8H4jk2S3+pYEOkhQNjFG7Tf5rajA2H1EPXclaPIO5de+IR68R1RR3WWcImkyOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYV6fdyISPhg6eyCQccpS2tasfy+AlvVTavld+uoaK8=;
 b=YtjpQifTSRPwmOewOu6BAhKF4MaclyI+AK+7DQ0lsVSk3AsDGDVkyKq3cQ/8ZfbxyrlvA+rOruqGKOGD1w3bvtUYjUYA+9eLocEKekAUjorSmATbfd7mb0wd4aiX2dgrA8iFdC82M+11Ox5IdXnRq//tMSvcF75DwgMuHMcPR4lcmb/a5KCUHclI7n6IZjEnNAhEeSfddnJCCWOsZI1y29wkH99I+5kcajOQV1t5IzUXniMqusyEGauB9ECLZRLUTyID6rx+PSUJOYx3wV+oO2bSYL9lEEyz8Mjm+FsVwdAO+gbqxJHrEATyOvVD81ovbHRKSfdDT6tgNjwNPwORZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM5PR11MB1596.namprd11.prod.outlook.com (2603:10b6:4:b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Thu, 24 Feb 2022 01:27:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 01:27:16 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC] INCOMPATIBLE_LICENSE re-work
Date: Wed, 23 Feb 2022 17:26:59 -0800
Message-Id: <20220224012659.176760-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a1394a-9549-4647-7ca5-08d9f734caa3
X-MS-TrafficTypeDiagnostic: DM5PR11MB1596:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB159628B6CC91F69FE4AA89ADEE3D9@DM5PR11MB1596.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MkqzktFf2/3a9aUvMBtQb2j1von7g5k8e8xAM3pmutBoFmLd7WfE4YvuKkTARWKsYCVKE231YTkUx/b3oTc2TcJm3TGPKn9xBvDOTYZ1oTbyxiHMNAnXOzWoeWO9g2q+wuz962hDejkFWEMPNG24XdinC7MWgd5e0aqbQNiSD/5R8k2sdoTqCxkiosi3l9k1ieUU467s3LL9txUAGSPX5+1YkXwdKMClp+0xOuARCCRg/QQl5iimKt0yfTCzOWkyoyvt8sqavotp305xcJVag2r+rZCFmEx/rG22B2qxfNzmjdIXEDMhWbZSlRj+1UZvkZOffLqglbLoBmKIzcr5PfDJ9ilp5yOMMfilRHvtuwBeoSuok/EbS8GI1giHmp25vT8omcOeENNP0LuG7tTuQSfxJZ7QaftTXN3ZrMlqJWPfikxnzEl7UOVmGLBYj6oopEDkk829y+Q+7P8+jWu+qHJfGk5dV9f+VcCUHPFsX6fLcwlluP9BhnUe0uYuTd9yKg9Yf14oNTZgWYYgLma76cO9IHAyDQrNDLVkjJRSS2l1c9yGHAWd+HyWDjwqoR5VtTs2S9c7yKSQkoF61m2F/atyAiOLpv8Mzl4xab7vPgsdGsPfF+MG2M+wUTak0AtLbM2dynXtskPfPc5nJQmktiaUB6mYeF/w6DuX6JNVab8Oe7IYQhNBKgNRwwMNiuJAq8ok/IdM2bF2YMwJsHvCOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(508600001)(52116002)(6666004)(66556008)(6512007)(26005)(66946007)(107886003)(66476007)(6486002)(6916009)(316002)(86362001)(2616005)(1076003)(8676002)(6506007)(36756003)(83380400001)(44832011)(4326008)(38100700002)(38350700002)(5660300002)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yzYwtjMLXN9YWiz7N3NHn/UbsSiMf9UwcvlD33Qs1QaooAMQaQfYPsiDjVo2?=
 =?us-ascii?Q?lDZDcr2hLHD1TVKAvlg3cSLBDEkPf1AnScxh142fXZS4p4Wndc7wwF10wV2K?=
 =?us-ascii?Q?BPUIbJEhtGyzQlK1iph7IsTjaJdpHPbBnrtpfXuaY3UNHuioLYTDnlWhWokh?=
 =?us-ascii?Q?z826vwdRgkh5FqtE8Np2IOiGiljTfe187+fBs2NyVhuDZ2gDs+5tLYyfeOn0?=
 =?us-ascii?Q?yhoLzVg82BIfbA4u/j2glAyRR+bY9hscQ4n7LtJa05J4Yzt8DMdiM8r72vh+?=
 =?us-ascii?Q?hQFEXSKFQH+VOc+ILoBuED4RuboDVDeMhGF/biy1hN+egcE84FT/rAR46ukb?=
 =?us-ascii?Q?dvVtdnyaDoqUyyAbqfL1VxKzJGO7waSR4vYi2CuNt706NjTEqNw++9zjlW2I?=
 =?us-ascii?Q?uKcF7GCHXZlpEfJFDY9kvf6ncUlXrexupqpUjK+XxYSqnZDI8ujnd7mw9+Zw?=
 =?us-ascii?Q?mh7gw0VQLq/Nk2dFcvKFrH2GK/ezCRfvPz+4JpYSELZPrrF9Tn/eTz1yaTy+?=
 =?us-ascii?Q?P5/w240HtoOLVuJgLUwJm8J33ZNBZsPjA0gkPoLffbVOAGHlnv13mZhX/zlX?=
 =?us-ascii?Q?i4zqmG6tAvZljpYgLcjmuCJ8KQKc/lW0CigR4kiRY3iBCjKZyF1sp688ggdN?=
 =?us-ascii?Q?nbuhszhmXFPDI0YENse/HL4b4O8xy1WTgOpiasSbyb8aZ5g81yjUlRtZNnyP?=
 =?us-ascii?Q?Ih/+PSQQK7krkgw/R3WHAadjazEYnFLFzgbLaM0ELwOX2PsuMcIghdxzE6Ts?=
 =?us-ascii?Q?W3xUkV/jyCxJa2Yf1pFgPazIuvp9y/3u5s7mJqiLUxDsg8mGrvoaxfmr+xG8?=
 =?us-ascii?Q?Feeh+41Xhn/28LaVQFOahAxKUFtNYjF+TAHr7IQVYWsAE0779XqlaZWNxHVM?=
 =?us-ascii?Q?L/8vLRn+6/PcW6Vx/kK8rjVeG2fPspfbYl3ebkKdlUST2CMUql2ubMdcqIm3?=
 =?us-ascii?Q?QCwx/TrJB+FW2mwDiAG1qhw6O2051EGNix6T0YQEHigvcj/ty7fmLFJXaW2Q?=
 =?us-ascii?Q?lf2Asnv/OjjrN35OX//h5hCrMlrtn5rcybS05m6WleGbj+RR8psLFhTiZdg6?=
 =?us-ascii?Q?8gKg7fWRVC4wneldH6M4tJ6ydV/4j/1zPhi78Knc8Bp19TlufMypwgTaX0dL?=
 =?us-ascii?Q?WI5Hg/L5hHecd2JxzJVUWzlCvSYUbx2i1RZZEH7mMGO6FAXbbtPSynahW/JL?=
 =?us-ascii?Q?K7qKhKgKH2YcUEWdhwir9tFXcMtpPB241Q5pJChm/fx7Ou3SDGmi4hw9iAsa?=
 =?us-ascii?Q?7KLeTNaoEX9eMXOwBx9W22M7vXsMSIfdcQJBlDgSgzOi7r2Pwi8idaAjRI5a?=
 =?us-ascii?Q?6F6GAbfT0sGRUWr0kidXMVhRiBLLi3kv70WXBxZgrg+gw3p20TMxHJ47ZTOZ?=
 =?us-ascii?Q?rQjUfWVQxeT92zfeqVkTYafD2m4H5caDcrrIaDywIJOtg5OoTXJ7m9BPD63g?=
 =?us-ascii?Q?nU7Bkl+wNvt8e+IPaMqh7mYJ6/6sbXK7Gp5aiog+S0AICUrlLaZEM+7oKx9u?=
 =?us-ascii?Q?o46KGYKLje/7kzV2NFmDYCkgFRxLaIvAN9yUsmir0UqFO60JhuVUpauCq5hT?=
 =?us-ascii?Q?av+waqhUD5w8BSuNn7tUi8cNqNK1pkO+QsJ7RPjago6UOb98zPTW62gBF9r4?=
 =?us-ascii?Q?TR5m6Ftt1ar6GlaZQM997y8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81a1394a-9549-4647-7ca5-08d9f734caa3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 01:27:16.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S8eYv5Q9vP+o0Lcv3YPJ06MeaZiq+/LbwvdJ/TQOasAJy8ZivSEXI5WAdTCCDvHcwsWPqQDKrXg0zXB5Xrvq1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1596
X-Proofpoint-GUID: L0bgc_AYxcuTiKEnd9KypMRYfhxcOljo
X-Proofpoint-ORIG-GUID: L0bgc_AYxcuTiKEnd9KypMRYfhxcOljo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 01:27:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162284

This re-writes the INCOMPATIBLE_LICENSE checking code to replace
the WHITELIST_<lic> with
INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:<lic> <pkg>:<lic> ...'

This initial set of changes leaves most of the code structure in
place, but the code in base.bbclass needs to be re-written to make
the check more consistent around packages (PKGS) and not recipe
names (PN). This also is taking into account the changes for SPDX
licenses.

This is a work in progress. This version does test successfully
with oe-selftest. This will be refactored as multiple patches as
appropriate.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass                     | 26 +++++++++---------
 meta/classes/license_image.bbclass            | 27 +++++++------------
 meta/classes/multilib.bbclass                 |  6 ++---
 meta/conf/bitbake.conf                        | 10 +++++++
 .../distro/include/default-distrovars.inc     |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   | 10 +++----
 6 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 227f1f5a756..f937728ef6a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -595,21 +595,23 @@ python () {
         if check_license and bad_licenses:
             bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
-            whitelist = []
-            for lic in bad_licenses:
-                spdx_license = return_spdx(d, lic)
-                whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
-                if spdx_license:
-                    whitelist.extend((d.getVar("WHITELIST_" + spdx_license) or "").split())
-
-            if pn in whitelist:
+            exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+
+            pkg_exceptions = {}
+            for exception in exceptions:
+                pkg_lic = exception.split(':')
+                pkg_exceptions[pkg_lic[0]] = pkg_lic[1]
+
+#            if any((pn in execption and incompatible_lic in exception) for execption in exceptions):
+            if any(execption.startswith(pn + ':') for execption in exceptions):
                 '''
-                We need to track what we are whitelisting and why. If pn is
-                incompatible we need to be able to note that the image that
-                is created may infact contain incompatible licenses despite
+                We need to track which recipes are in the exception
+                list and why. If pn is incompatible we need to be
+                able to note that the image that is created may
+                infact contain incompatible licenses despite
                 INCOMPATIBLE_LICENSE being set.
                 '''
-                bb.note("Including %s as buildable despite it having an incompatible license because it has been whitelisted" % pn)
+                bb.note("Including %s as a buildable recipe despite it having an incompatible license because it was found in the exception list" % pn)
             else:
                 pkgs = d.getVar('PACKAGES').split()
                 skipped_pkgs = {}
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index bf70bee99bb..c6f04d30733 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -54,28 +54,21 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
 
-    whitelist = []
-    for lic in bad_licenses:
-        whitelist.extend((d.getVar("WHITELIST_" + lic) or "").split())
-
+    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
-            if bad_licenses and pkg not in whitelist:
-                try:
+            if bad_licenses and not any((pkg + ":") in execption for execption in exceptions):
                     licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
                     if licenses:
                         bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(licenses)))
-                    (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-                        oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
-                        bad_licenses, canonical_license, d)
-                except oe.license.LicenseError as exc:
-                    bb.fatal('%s: %s' % (d.getVar('P'), exc))
-            else:
-                pkg_dic[pkg]["LICENSES"] = re.sub(r'[|&()*]', ' ', pkg_dic[pkg]["LICENSE"])
-                pkg_dic[pkg]["LICENSES"] = re.sub(r'  *', ' ', pkg_dic[pkg]["LICENSES"])
-                pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
-                if pkg in whitelist:
-                    oe.qa.handle_error('license-incompatible', "Including %s with an incompatible license %s into the image, because it has been whitelisted." %(pkg, pkg_dic[pkg]["LICENSE"]), d)
+            elif any((pkg + ":") in execption for execption in exceptions):
+                oe.qa.handle_error('license-incompatible', "Including %s with an incompatible license %s into the image, because it has been allowed by exception list." %(pkg, pkg_dic[pkg]["LICENSE"]), d)
+            try:
+                (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
+                    oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
+                    bad_licenses, canonical_license, d)
+            except oe.license.LicenseError as exc:
+                bb.fatal('%s: %s' % (d.getVar('P'), exc))
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ec2013198ce..7d3b71c0d0a 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -75,11 +75,11 @@ python multilib_virtclass_handler () {
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
-    # Expand WHITELIST_GPL-3.0 with multilib prefix
-    pkgs = e.data.getVar("WHITELIST_GPL-3.0")
+    # Expand INCOMPATIBLE_LICENSE_EXCEPTIONS with multilib prefix
+    pkgs = e.data.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS")
     for pkg in pkgs.split():
         pkgs += " " + variant + "-" + pkg
-    e.data.setVar("WHITELIST_GPL-3.0", pkgs)
+    e.data.setVar("INCOMPATIBLE_LICENSE_EXCEPTIONS", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6fb7bfeb23c..7f0de51fa7b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -110,6 +110,16 @@ BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] = "is a deprecated variable and no longe
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] = "is a deprecated variable and support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] = "LICENSE_FLAGS_ACCEPTED"
 
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
+
+# These are deprecated version and should be updated to approved names
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:GPL-3.0-only'"
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0+] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:GPL-3.0-or-later'"
+BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-only'"
+BB_RENAMED_VARIABLES[WHITELIST_LGPL-3.0+] = "is deprecated, convert to INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:LGPL-3.0-or-later'"
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3bba651a776..dcc4a932a17 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -20,7 +20,7 @@ DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 la
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-WHITELIST_GPL-3.0 ?= ""
+INCOMPATIBLE_LICENSE_EXCEPTIONS ?= ""
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index fd3b3f409e3..08de3023c0a 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -86,7 +86,7 @@ class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
         return """
 IMAGE_INSTALL:append = " bash"
-INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0-or-later LGPL-3.0"
 """
 
     def test_bash_default(self):
@@ -110,8 +110,8 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
         bitbake('core-image-minimal')
 
-    def test_bash_whitelist(self):
-        self.write_config(self.default_config() + '\nWHITELIST_GPL-3.0:pn-core-image-minimal = "bash"')
+    def test_bash_license_exceptions(self):
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"')
 
         bitbake('core-image-minimal')
 
@@ -125,8 +125,8 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
     def test_core_image_full_cmdline_weston(self):
         self.write_config("""
 INHERIT += "testimage"
-INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0 LGPL-3.0"
-INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0 LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0-or-later LGPL-3.0"
+INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0-or-later LGPL-3.0"
 # Settings for full-cmdline
 RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
 RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
-- 
2.31.1


