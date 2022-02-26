Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB60C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 01:32:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2145.1645839139708884390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 17:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BEhqdKlA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9056547f3a=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21Q1WIT5013678
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/zYkWiBXNvzChZHiKnWKZWCVRnV66Ibk9KZSu6DwV0Q=;
 b=BEhqdKlAb6cpd0zM+Cb5MmqwAMvK29t8SlPe6mIBj79c+L/xBKW/RBCwSSHQY0qX/Coa
 MkCoXZk+p6qDzvRYMaIA0NsjtI5xZOZcGYK1zekRxQ0kbAO2n8tcn8ooihKX78nXUN9o
 PUo5MBmLY0lS4ufnURBh0i1CfN7lUimOFZpXnRtpQef0WrjJREETYPVQgg/AcFOervLA
 82WO5yel4wp3GUSm678KD45FMLxAQTpedQWsW/7hfqeBXyfPyp56k1oe3uo2+7ZJmDZo
 NiAN4GzqH6cZgfp6XvD6LvYKuVBjqpX+30r2kqO3Im1Jqeuv98BJHDiCZcABJp/r5jmw Zg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ef9e1g1ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 01:32:18 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 21Q1WHlM013657
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ef9e1g1ac-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Feb 2022 01:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvdAeotbQsVQrN21yeQJ6bdZZ8zgz8UyrL35mFbxLX7PjtIuxJMgymPgF545+vcm7Yp+pjbv/4dpGObdYXNYt9cGkC00V8SBz9XHEnfZUYwSxgch0FWM52vv+sAmP94HdUIfOatMmnfcJHCn49K/UaD52HI2PknLBXq2lbEmmdkJ8YYvRKjOiEJw+ip+SjueacRQQyw0n7Ci8BdqBb5UPFnfX8G1viC5iB03J+qEWCRs8YTqNUdeJCYAOldUll20ADpKABfJ+uM14lW800hXI9HGVSDiahbCmgVYSJ+yehZNKR6QA9J5tzeNRqrecsutxURiRTtGdzzM0Efr/ctpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zYkWiBXNvzChZHiKnWKZWCVRnV66Ibk9KZSu6DwV0Q=;
 b=hie+rDmBSeeky70pneruwglFQOphYPWCIHxEnZG9LRkGEPD0q6jC+ODCb6m/mfoQrkXpYxg3kKMhE30hqpR4y/lMePVWkSBYRXN7aqDsh+VlxQa9Xj5Iwy7bAV57F36vFimN9JKg4R+QEFZoJDZ5mVCDkZ8Bps5s+Porzk2hrUFyITcwggm+H/+avC7aSBG33B7UL96vFpwj8EVgGSq3Pb/mooUi47Wk+gaAx4+/i8OCOmv5aXPuCWIQOAvZSiFdQrnotYwIWqBp1TslP6Qiu3t61Gpix6bQwtcgcfdhmUBza665hkPzk0mUiGGhU3uw+sJXEcGE9WC/a9CIfQr3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Sat, 26 Feb
 2022 01:32:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 01:32:15 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 2/2] INCOMPATIBLE_LICENSE: add has_pkg_license_exception()
Date: Fri, 25 Feb 2022 17:31:46 -0800
Message-Id: <20220226013147.120437-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220226013147.120437-1-saul.wold@windriver.com>
References: <20220226013147.120437-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc6908b-91ad-4700-8662-08d9f8c7d208
X-MS-TrafficTypeDiagnostic: PH0PR11MB5928:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB592865250FC4DD59A6722B6FEE3F9@PH0PR11MB5928.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vy8DQf5Nlr6KKwQ4AAG3ti/Hg5MRaF4Ly9ix2ifH1tXLA4RZB91yEwjIWs6tV4mwI95ra1AGlruVxgFcTAYx4zLJRUcoBmISC0/eDLD+np0n7OhV8v95TiCLcTDBTWvfEg/ZwKtftWN1zgrMycyQfbMT6dlyjOR/agODIkdjQVpNTEivhf9mpbd+tWfP8r8hWyX/k3xdtQ438qkMJGFj55qtfEiG9AhD+wXlQjIs7RHhSRblzyeaTxYCgzsMbQ9TEYsmjirZxH0HF2kGEMhTtsddoWM7GM1Uj2Faa2cIpKUD5CVNVv1gXNvd3l9fHB2c9QLQAw7tM++0dZUOkmu4Ip43O/UqPeiL5isRbXWa6hBEOPyZy5/m8cVnysTTb/N1iXmkIv/9Qdwzd4vCtE4DzRYhrpwj8T2BMagq9ynwoX/Iw6WI/JVFjhBxVlUxoPX/voPi3p/d8mrtZUfzi6HeEq+YyZlAMTnPJ6CUWEkCkNq6POzVhx9LsrqrvOMe9epi/AkHu5AgSmTiFX7SPaucp8LMIsbx50GiO9F0c1bQFazSEdKlANw6jfh6ir06PGLVATxwLRbaZUvs3QZqOsG2VXoymievUjby4wg0nSGkt2v39KBFROPzggrgWVoL6PztBJfUZ8sCvelYKNZ0XZqqHlyFGbh3q8fPQvgpm4rWFpozchaYN6dDdZm6SAJRvcu07OqIRjJ2+BR9Jf+2qg6GyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(86362001)(6916009)(1076003)(54906003)(316002)(52116002)(8936002)(2616005)(6486002)(44832011)(6506007)(6512007)(508600001)(5660300002)(4326008)(6666004)(8676002)(36756003)(83380400001)(66556008)(66476007)(66946007)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aIWd7nzMcmKj7w9jo+g5kkd7FXo6C6XIoa3SBRXaFhZZ0fSFJwLedsnxmwwp?=
 =?us-ascii?Q?KzVbY+ZTNn8grTN9wWyF56XYeDB/QDDJxCl3zAz6VhhjJPCwLJ+uO8UJQR9S?=
 =?us-ascii?Q?yIEE/APe5YUboZQvnCkVqk82ksDDHKNfmixlpO0fCMU0g1482r3BpSHN28ej?=
 =?us-ascii?Q?91Z9COUNK7+Kg1qo9IQwpj1kPHDrSm9m0hasvtzY4Cqjuo+PV//5CRxbqTEs?=
 =?us-ascii?Q?98JLm/6z/npjT4rjU1K0gXZWjaIH3LvdYY1Ae4T30iJX7Qd561MfO65EKezs?=
 =?us-ascii?Q?Lfi8xj1R6ZxnIn+rE4VUeN0Q9LlvvG7DqQfkDV8U3qW2QMUzuCvso3TPcDL1?=
 =?us-ascii?Q?Fd1JxldK4xxO5CTj37IbrG4xw/rj2pTKd9ZbmIfTPgcMeAdCBNZuJFp7gRSh?=
 =?us-ascii?Q?0bEFFxzB2F66V0hIRgKw6OAJHcuWhAeBViPrG1BK8C1i3WqpvqwZjON0zyGW?=
 =?us-ascii?Q?hqFlf1seB0NmBVtf+1SdrhabLhPbfvKajI6Jfg9xoU8VKmJoepSdQDUu70Ww?=
 =?us-ascii?Q?z76+4qZgFv6B/gDPgboWTpVdUZKAMhn4qlUe5m4r+BO4C6IHuRudttVg1fZx?=
 =?us-ascii?Q?Hn8Q4ZscxQWvOTZQOdTmsD/DHCiE05JaM2twFXd7et+WzjQca+c9APuhMvb6?=
 =?us-ascii?Q?JiV3efKWK/ubL30J2Jp8XfvfuVZjMz0UFBkHoPRW5GZmcz3SF2EZ1AZD5MqK?=
 =?us-ascii?Q?CRIcsOZl1Nss+50IQrD+Ue9unAmQW97r87ao1MrM4yN1S13WLDNonI1qbtLK?=
 =?us-ascii?Q?jZP66QhpKmFYPQFjM3nxZtBYIXigdIXHABZjXFWfxVwuZJgZimuJV2iY0gMf?=
 =?us-ascii?Q?vkUpKtnnGZfOop891jYRiUPivprBsWujCB/cFFVDEEg3o3+DrHyDWrep2kmy?=
 =?us-ascii?Q?PMVTUUQP5L2TykGjI1W+hJiKZq3u9GjJCBhpt0/FK9TwDty+C8qgdMJdKNbw?=
 =?us-ascii?Q?vHv4+gQIL3sIOIkFhQ2AR5jGldciy4JOOAjS0wdgfKSVTKkjLKJagne7cyiG?=
 =?us-ascii?Q?mYuacZqI4qhh/XdBfjhNyO7INnOMAEYaSV3hM/MEU++2lRoSjcoWPE0MrvAf?=
 =?us-ascii?Q?Yi/4DGyfqck02XpgyngcZ+2UKWObH3X54d+18lqTUzSgssOXCi4QQLHEMvHv?=
 =?us-ascii?Q?+32na0ArcvfiLUT9x5oFRh93dXnzVocqOtwmqIPW6/plrUConMMWcDtyyFSf?=
 =?us-ascii?Q?Fxqn4QFXt1dsNXZ2FDRpXWQaUXzt/kHY7M7lAVKkPa8cEmYognxcrL11lamG?=
 =?us-ascii?Q?dgxKF0wCuDR/Wn+0SkrcV0vzuasKpEHYl9wsQJIZsEQN9XIxSB1vV5DuHkS6?=
 =?us-ascii?Q?5dwJ0hcxHzpy7UXTIQKpnumVxokOD1qV9CJ0MDgUt9o9Q4FJ8F+jYMmWk7lJ?=
 =?us-ascii?Q?L6UPwCdIME2fhn38Sj/6cCQcj9u8uSW9q/evTXXU7hqWPVAYeYvSlxkVzL0D?=
 =?us-ascii?Q?K4jw2r61223kENGNxcP30Ezzs++Wdrj4dBgiDtZaKImebP95UYpAdTKLXTFp?=
 =?us-ascii?Q?DXU3Vemmk5X+BA2qkemwIJdWqGmJJqEX6j69ukTN+fcrw1Rrm754DPAgogao?=
 =?us-ascii?Q?rlKe67mUW4H537gXVin1HzByI9r8UrTCg/EgoItTEWIXq1bpRwdqDODSyU4d?=
 =?us-ascii?Q?7K0L16oYMic2QtkWFqAtz8U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6fc6908b-91ad-4700-8662-08d9f8c7d208
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 01:32:15.8870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Dgocwu0wlVcKqd39I/iZl1oDt4kCjVxbithq/JgrHJENR8e05xtgE1pH0BQGJMvaohgWaxwMIaFwcIQ1y9SYcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-Proofpoint-ORIG-GUID: siwMPTi7kvsk7sYXqHb6ncssyjZmIuN9
X-Proofpoint-GUID: ZNcGBWFRsF2Q3VTw1HOh7JyVCKdEMBO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_11,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxlogscore=968 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 01:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162419

This adds in the new function to check for both package and
license are in the new INCOMPATIBLE_LICENSE_EXCEPTION list.

This has been tested by changing the skeleton/hello to MIT-X
and using that license to verify it will be skipped or not
installed.  oe-selftest was also used.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass          | 66 ++++++++++++------------------
 meta/classes/license_image.bbclass |  5 ++-
 meta/lib/oe/license.py             | 10 +++++
 3 files changed, 40 insertions(+), 41 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index ddca87d4a8c..fccf3df17ff 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -597,46 +597,34 @@ python () {
 
             exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
 
-            pkg_exceptions = {}
-            for exception in exceptions:
-                pkg_lic = exception.split(':')
-                pkg_exceptions[pkg_lic[0]] = pkg_lic[1]
-
-#            if any((pn in execption and incompatible_lic in exception) for execption in exceptions):
-            if any(execption.startswith(pn + ':') for execption in exceptions):
-                '''
-                We need to track which recipes are in the exception
-                list and why. If pn is incompatible we need to be
-                able to note that the image that is created may
-                infact contain incompatible licenses despite
-                INCOMPATIBLE_LICENSE being set.
-                '''
-                bb.note("Including %s as a buildable recipe despite it having an incompatible license because it was found in the exception list" % pn)
-            else:
-                pkgs = d.getVar('PACKAGES').split()
-                skipped_pkgs = {}
-                unskipped_pkgs = []
-                for pkg in pkgs:
-                    incompatible_lic = incompatible_license(d, bad_licenses, pkg)
-                    if incompatible_lic:
-                        skipped_pkgs[pkg] = incompatible_lic
-                    else:
-                        unskipped_pkgs.append(pkg)
-                if unskipped_pkgs:
-                    for pkg in skipped_pkgs:
-                        bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                        d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
-                    for pkg in unskipped_pkgs:
-                        bb.debug(1, "Including the package %s" % pkg)
+            pkgs = d.getVar('PACKAGES').split()
+            skipped_pkgs = {}
+            unskipped_pkgs = []
+            for pkg in pkgs:
+                pkg_exception = oe.license.has_pkg_license_exception(pkg, bad_licenses, exceptions)
+
+                incompatible_lic = incompatible_license(d, bad_licenses, pkg)
+                if incompatible_lic and not pkg_exception:
+                    skipped_pkgs[pkg] = incompatible_lic
                 else:
-                    incompatible_lic = incompatible_license(d, bad_licenses)
-                    for pkg in skipped_pkgs:
-                        incompatible_lic += skipped_pkgs[pkg]
-                    incompatible_lic = sorted(list(set(incompatible_lic)))
-
-                    if incompatible_lic:
-                        bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
-                        raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
+                    unskipped_pkgs.append(pkg)
+
+            if unskipped_pkgs:
+                for pkg in skipped_pkgs:
+                    bb.warn( "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
+                    bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
+                    d.setVar('_exclude_incompatible-' + pkg, ' '.join(skipped_pkgs[pkg]))
+                for pkg in unskipped_pkgs:
+                    bb.debug(1, "Including the package %s" % pkg)
+            else:
+                incompatible_lic = incompatible_license(d, bad_licenses)
+                for pkg in skipped_pkgs:
+                    incompatible_lic += skipped_pkgs[pkg]
+                incompatible_lic = sorted(list(set(incompatible_lic)))
+
+                if incompatible_lic:
+                    bb.warn( "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
+                    raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI')
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index c6f04d30733..cae094126db 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -57,11 +57,12 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
-            if bad_licenses and not any((pkg + ":") in execption for execption in exceptions):
+            pkg_exception = oe.license.has_pkg_license_exception(pkg, bad_licenses, exceptions)
+            if bad_licenses and not pkg_exception:
                     licenses = incompatible_pkg_license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
                     if licenses:
                         bb.fatal("Package %s cannot be installed into the image because it has incompatible license(s): %s" %(pkg, ' '.join(licenses)))
-            elif any((pkg + ":") in execption for execption in exceptions):
+            elif pkg_exception:
                 oe.qa.handle_error('license-incompatible', "Including %s with an incompatible license %s into the image, because it has been allowed by exception list." %(pkg, pkg_dic[pkg]["LICENSE"]), d)
             try:
                 (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 8955cbdeb24..2404bbecb18 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -242,3 +242,13 @@ def list_licenses(licensestr):
     except SyntaxError as exc:
         raise LicenseSyntaxError(licensestr, exc)
     return visitor.licenses
+
+def has_pkg_license_exception(pkg, dont_want_licenses, exceptions):
+    """Check the exception list for the package and return a boolean"""
+
+    pkg_exception = False
+    for bad_lic in dont_want_licenses:
+        if (pkg + ':' + bad_lic) in exceptions:
+            pkg_exception = True
+    return pkg_exception
+
-- 
2.31.1


