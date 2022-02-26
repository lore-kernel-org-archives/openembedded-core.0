Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA2FC433FE
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 01:32:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2210.1645839139133590326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 17:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Kz79B+hU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9056547f3a=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21Q1PvoY002284
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Rm97DrHc+2ofBqaAdL2uYMZbAHPa6y9HRf8oPFWGHak=;
 b=Kz79B+hUXZFHNxoCL/65b1oJ5xxewnY+YyMKD5ZWiUbXzJLDcionyB2wwL9dAU+d1mhx
 iHyAnQId8EG5z2Ag+HzLNM17c7VZUwYv/ICO37TVOazc1QAR7Ev5M8migxvn6vXHBwj5
 O5QdE6BubLhro5YO4DOULEhDwPfZ1iXD9XM637Wh+NkaVMQnDXHuqTegS7L8Ap0YIiqE
 FnlEQLEB1OoKNgz5V+XjiUNB+1MS77Z+R/PDw+2ZRKJeNdMwMCdPKFzv69jYvS3Zh4v0
 f+PFtC4bUL7WncwIB7YD417L/Z5L+SH3CXft7KWwQhg09l2os7n35uu4XNOTpx3g5oZL gQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ef9e1g1af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 01:32:18 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21Q1WHlK013657
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ef9e1g1ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Feb 2022 01:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2zdAzxKFeUXJvWRth9+LD2oLXXwPkxrbrT0y2EPkwKRvOydYHGHL+zYQKoR2KjaT2H50U/10RsTPIUJwj9tVS8wdWw2Rvi1YY+Ag4hXUQuCPQbi44c1OKx5ptsYNjOHVAI/D1sXFXvxhzrp9zyxJ6nlPBtNsLRMJMDWcwEelLY4QOrEAA07bcc5zNAfe5xFRAV5AguVxuSnSvhPn1PpBN0rkj+E2Fopz0mmR8r+QiMF8CWTElnzQPECMNkSbDhb8qbzzkEc67K+0uDPDvGuldS6H2+UbwiAQyaS5uqy7Gf0SIGuqC6SpYKAuj6BAH8ozchNJigY2O8jDnnR1/52QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm97DrHc+2ofBqaAdL2uYMZbAHPa6y9HRf8oPFWGHak=;
 b=bRxPgh/MB6Q8mqM4KktyKDT/VKRQnd2EsJTEtmli/WSvHTPSO5pCCtkZoqn3cSaXxsoiINera+v4+hBIiVF0JCFn8/SnV6SNEFsn8yACGRcfsN5W+bPwJGMZ32bTiGbx64rSpnswjMz5Hm8Ssj0mWGmir9r1Ib3zj5Kl1meEzvDMppoKteLigBq9S82Nhs1VY3ujarWo3lvQz+UpMVYs1r/IZOdtmQidlZDEOYwqpKPcsspKYnJJ5JqDh9G6E2kHeTU00w04tqu9XXgkpEQMQZZ0oDwNgx1QxkAWNyKCe6JE5/vmiNhcg6mkyGS5DnR8fKWkeNeEBrAE/hXPfJtivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sat, 26 Feb
 2022 01:32:14 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 01:32:14 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <Saul.Wold@windriver.com>, Saul Wold <saul.wold@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 1/2] INCOMPATIBLE_LICENSE re-work
Date: Fri, 25 Feb 2022 17:31:45 -0800
Message-Id: <20220226013147.120437-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935beb43-5041-471c-e413-08d9f8c7d11e
X-MS-TrafficTypeDiagnostic: PH0PR11MB5928:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5928A21A07BC171A7AFDFB92EE3F9@PH0PR11MB5928.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u8RM6AlQ41Qm9e8cSYP53csDyffKyb/5JJcKTsyG9Bkxo0AgrcDChWVfp768Ca/OzswzW0wB4HXDYo0i8M+BUSbVILR+RdcLZa/y0QM5WXjikWR66JhqAd+9OMAS9IpgHK3m+2fqy0HnEaWIdwWaO+GUsjjxo7KSraLp3DnF34vgnZScDfOJGkRES01NABC8knlNDViMYYT3e1/NBhF0gfMgr4SCQ/7urWiFg/S0amsf1l2uQd4/dIxvryNttKoNzvNN1J9kowSzPhDDNTRIp0C4+HYFrUoJkopuN4I3V5msvC3jFT6/JXZEAdNieWKSAsp4tmxhySghosb6sqp7ev3kwV0ikfvvDfepdh4JYoFF4Zjhl1dg1N0dszY+t0nv575q4oTV4X3GhAq8MP0uLCwHj2q0Zmeuw9d7tc4Guu8sohypiO0NB6T1BdhYCYG3rp7dzSYGh1w3R/qBaqWnT0rKBDKldIpAD/3EWovHBZCfuKlPXAkiP4Ju0AVvZg+CG1UmfceuO+o5jm8jg2hWZAX+TuzXJUANZGe2InDCaAu3FHCw965il31fo2RZ9Iiu0jjX9Pg/jcYtTVYPVIcK/p6q5xPd7+dObezVWGk5MU0zUy76Jt8MGO0QGTDjvcFo3npAEhkBH7uvy71WWjQb35426NT4EHxjn0qhyYvAUpmfQm1ScT+NqGf3HtejWZDhTOSSqJXecHFAS37BiaiTWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(86362001)(6916009)(1076003)(54906003)(316002)(52116002)(8936002)(2616005)(6486002)(44832011)(6506007)(6512007)(508600001)(5660300002)(4326008)(6666004)(8676002)(36756003)(83380400001)(66556008)(66476007)(66946007)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dmDXiYvYr/dY3eTbgRXsG1OKIoZ3MK6plbY0hC5ms/RvK1WaGX6/pA5IWXKH?=
 =?us-ascii?Q?AGgmmU76PIYUfVYXgL90z9OIy8+PKJKoknCuXUhbX9UZu1W3/hCFFJe7FZ4o?=
 =?us-ascii?Q?2gKLjJtsrJa6yaDbnEZFvkjO2xOr2xcVsMF1skG9fzy2jWZAHcAvIWg17DRD?=
 =?us-ascii?Q?+wFjJw9DhR6qxd2pNMvJQCZQdaCGdBWXqvGNMyMkQ+z5OOAo7/padUmCDNJO?=
 =?us-ascii?Q?cfRXu2TngX2X78oLJN3boPs7RQ8v23QxYUbsRrVotLuw88V4kPL3wmaLv/Te?=
 =?us-ascii?Q?MmGl/qA7SPn3U3gkiI7rss+C7kEBB1U8wSSioEcgifkJ56wpw/hBG5PvpLTQ?=
 =?us-ascii?Q?uddimoQEdXnuJD9qfTNRqiLB4IZci8o2u9d1WedjXFyzAqLMQltsWc2yz/cg?=
 =?us-ascii?Q?RoAGWs+HfSez9CfwiHFDn7hw8j3ODvzXEP70u+A7TE+cAhw12TGTs3FygeeX?=
 =?us-ascii?Q?AKJMyty5Ip6o25E0ENUvTF8nxtLMefZ4d3/1oyAHyh3TdvQlobSxJtXg8ihi?=
 =?us-ascii?Q?kbstUcrg3ot9WZokHjNzGegH+RIiQJFRb7iABznRSo59z6ZOmzzs6uPVpp8r?=
 =?us-ascii?Q?7+H+TvqCZECm8bCU0K+s7P8icXhlGlNp6OlXg9+qVeEXXeDynyTqJCZ9oUgH?=
 =?us-ascii?Q?vTfccXWFRjKNMI1qRDFXCglb/QQER20qufyNQkVGHW3uL9M2pVvl0CucLyNq?=
 =?us-ascii?Q?p4ALZEqeqDLewJnh5qgAhK/y92+b2nhwPEFzkUabE/o+mjyfW2ip4tXrtcSC?=
 =?us-ascii?Q?76FqGN4/B5pdPhUohvqNo3i9Xow+M40tjrz2Nj4YaD8lFqfFg2jx2Pk4EeHS?=
 =?us-ascii?Q?p+UQ2i+gbZDmWLB7+ghUkGuPK5khySVyQFnnlioqVx/1ZzaK28D/pnWVZQdM?=
 =?us-ascii?Q?J0u1XwKg9gotgLgtrP434pqbfYXleszIxDwBG9nJPZ8xhvKzz7ty1Fj0sy6X?=
 =?us-ascii?Q?t8AUfi+4DlgNzJSjeD7ar+ux9rmhsGhiYXcmZHyzdYG0JgV4pz+N/UhBQETe?=
 =?us-ascii?Q?VTHkDHiEErfmliVrN8QJ5nLF7k1Ga7yUcjpKyVgckq7lyy0oPPqr7fPxzZf1?=
 =?us-ascii?Q?Y3az8m/IB3OOpeMtA1qEvq3PnNyyIFU7AYAgWKAsW53to1PdW/A9YDUD1h3W?=
 =?us-ascii?Q?eWIK6up6Ccu7NJmWQ7cyOfRqzv7VBIe8t/oHFKa6C2kAQ0NX2qP2YK2QyCH+?=
 =?us-ascii?Q?gFzSLb1dP/WXtreeUtl6Cy/a0vbDqaGNRr221Wlw5xS+PjF/yiZw3r31EhCC?=
 =?us-ascii?Q?lVPTbOpt2SZWHA6l2DYVn+u6C4QY3EhyV+3fRrlPNXFMpsw311pXJNu40HPW?=
 =?us-ascii?Q?ZVFE9sxDzz2p1CvmFY5RR/xBPtxbBTCpQ3vArV3Tp0Z3faoxcYsP8C4fe+o6?=
 =?us-ascii?Q?NUpOo5yUea0GbRLQfdrNSLWe3fsuoT16AUZqROF8NS2GaLNaZ86avyAM9Q5T?=
 =?us-ascii?Q?n5ZCAiFAHBZSZW2s7pURC1AMrlCkdBpFSzhmEMSlquzOukgM2PbhKUo2dZXx?=
 =?us-ascii?Q?wXVsuDIqP4/vtu5Bej56EzQmgogWWgFSvWnr+uU2EIplqXdiMx3WfcW/EBts?=
 =?us-ascii?Q?Ld7DvMeM20soyYkHGb37iD1JXZJS5SQIpyAX2hwXo+GnPt8N4Gfgnsdt2V2w?=
 =?us-ascii?Q?tmXoHAsVOSNgLfcGp7Ukgp4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 935beb43-5041-471c-e413-08d9f8c7d11e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 01:32:14.4173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c/Rd6HNDVBWW8jHPaI9KqfMXyW88A4hF4kLWaVuVYbjPX1ma6WQPj4bvYKBOuHQ8O5+GU4Auk1JOSWMjsfzniQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-Proofpoint-ORIG-GUID: uslo-KawwTvtEKUzPPoYUwkq4cmb_TqZ
X-Proofpoint-GUID: EYvj0tRzTBQ72JbDt0BUf797r533GitU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_11,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162418

From: Saul Wold <Saul.Wold@windriver.com>

This re-writes the INCOMPATIBLE_LICENSE checking code to replace
the WHITELIST_<lic> with
INCOMPATIBLE_LICENSE_EXCEPTIONS = '<pkg>:<lic> <pkg>:<lic> ...'

This initial set of changes leaves most of the code structure in
place, but the code in base.bbclass needs to be re-written to make
the check more consistent around packages (PKGS) and not recipe
names (PN). This also is taking into account the changes for SPDX
licenses.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                     | 26 +++++++++---------
 meta/classes/license_image.bbclass            | 27 +++++++------------
 meta/classes/multilib.bbclass                 |  6 ++---
 meta/conf/bitbake.conf                        | 10 +++++++
 .../distro/include/default-distrovars.inc     |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   | 10 +++----
 6 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 55f654d37d0..ddca87d4a8c 100644
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


