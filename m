Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6612C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:41:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6569.1708404059514895813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cW/M1uxF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27800a1259=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41K4VPUc008528
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 20:40:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/TY3fcfiHzFvmJ7YrO
	yMu3LjTZiWYAPtjnAgEJ+osRI=; b=cW/M1uxFqTkgHJnpZ7/O/fcp12+FRADAd2
	nPSwGL05/8/M4T82ZJ97qHJEb9TQ0n8PfwFX88u6527K+upWKIDSuI+U8rDA/pPt
	vMiTOKx7KzPy7OHOMviPR4rLsQtuRmiHKApc5RnZ7xgNphYBez4VyY8hGAY1vmkn
	53ID/YNX7SPWhGfas73kI7pvV5rJSpF9Qbtp/MdlkB56WZ0lu4yzxqsVmmmF4zVr
	Tc3GtAsXQ9jvLNf844hl5CJn+uxKmkoHNjFBEp+u7vDwAtpxV/QA7PfkCSb/zhaJ
	XRrA4fNGU6hvesu1RE1BFtLVk2eXtMH8ds92e6pJ05RwVfGbxnzg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary4a60w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 20:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEir+l3p+ZFwFIrvdUx+Oma6DA+h+tDuRMRiSwFjASRNpK/pH+I+RNeeYGxVkzXcWsZtYP6EJ3FoOlrRvGElqxOINTQJMaLPvp8xnC+zfQfGYwQbZ/KeXGjr3UO9A9AFzCi86EoXjx9mN/1BuOM3SXRUWqzwz0gX4iKOhWDSE9AjxKcIDPaPWvRtf+3BklN3DyQo6rGlUInQQtr+CkVEPgNSuBxGyp4x9NiblTXQjHWuiO4kHB0+GJomGFMT0eDkttfsWdXNFSA6yP676I9L0gMfEpodtJ1m1Vd/dc3q1KTxkiz+4u+xZ5e3NLyH/4q0wI1XsgqeIaQV5SSpxQlbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TY3fcfiHzFvmJ7YrOyMu3LjTZiWYAPtjnAgEJ+osRI=;
 b=Tjq3wIYmL+q66OEO5XNSUDdm8j9KrjYxNiBd3ROhoPffKt0C7WzrGNdP1fVrJ8lgsypMk5nAsN/8kcNwexhtKIJQazEH1+uccW0jP6/B1oBFhezMpkf9JFDVSjhXTVTj/fRxXAoPHvVBSrqWOV8Kg1v9yqqgA57Er/DMjP/911zEqZ5X83+F2Z19Q936gHvMCvNkYO58m3AC8CnlbbvjnWuIH5b2m7i8drzmmmInXALRLGOr8TF2eESDvjzqANSs9a6YBye7R93cu3Kytkg7rwC9JZImEY557c0q+0YFvwEKPBf2X1j3qeere1sKfll31/DCbeeooDQoPoQgiruoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Tue, 20 Feb
 2024 04:40:56 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::3639:15d2:da14:44b9]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::3639:15d2:da14:44b9%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 04:40:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: upgrade 2.28.5 -> 2.30.0
Date: Tue, 20 Feb 2024 12:40:45 +0800
Message-Id: <20240220044045.1822354-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0095.apcprd02.prod.outlook.com
 (2603:1096:4:90::35) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DS7PR11MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 3336daae-a0a6-40d1-9ef0-08dc31ce2100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	160UMQ9KlSfbNRQhWLpcsHFEJV8leClp5hjRRAWcC3sWtm4YlraS/4SET8bJsNjRg1DjAisG5g0Q0hUpQDoywmCNh+9RyxPuhEBiRbfN9cNabX0uN61HB1CEwr2Ac6GaGZJE7NUiWCtgXjSA2zJ9YIyzEF/+uyaXL4LR1nFTppNbMJ/ErN8VRTC7wbLaDy+D8yVRfS04/LOw7RrugK+q/FImGStvdiutg8mLP4Llj9+/EZv645ZyEtFOhVHBaHtLTU91+6M21Y/OPTagBRAhdXeNEFuhqLNSGLkMmFTJhtibjg0Fpz08v6+wdiNnzp8zvy5JgHeAvoZwt83MVztGUIm4nGsIuPVvPWkOnApQqD3ADKDOJcy2a53eniktdZDFGDeFXtoqati5nhn5iNGNhIfhWQy8iIywyz6PYZbMdLWIKSl2gr+kb+7hy1GjrdhMeayAYufFzaceaEpaVrvzMT6ZTaTjgrUe8X8z9OcEEw1w4bfybeJtoDjvR3QT2Mwd+g46Fj/WhONSwWFQN6j7XIiDAXXrcVCiwz1DzHlQBWwAQmOaYXNiBiZoC20Jp7lwkBMeXZOJvs546+Ig/mew4kaymC7GZJjXLIUjvJ032zc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lnlqb5LivHNDzHIP3vZGRSHThBAciaYwmUE/Xu4PMFA2Skm60GQgpKMGvuo6?=
 =?us-ascii?Q?hweXxB82V6DNXl1CEOdt8MT7YXXdyntbdbbksLrNuuE0Wg8jC4Gs5rUcanTw?=
 =?us-ascii?Q?LQ2fcmYPtKiGTxNSl5TUyAH3OljXeOj9pIZlFJFKl9DN3acRazo3Djo03ti5?=
 =?us-ascii?Q?kQ1i3AkJY6hji17p9mFD5uciKTTCYz5yYQsqigCRj6yVlIsgCbHdF547uvGZ?=
 =?us-ascii?Q?YG0cdEYI997DLA2FzeZr6KIXEY8f3szK+YBdDQIYhWpEz9Z+2KnWzN5VxINJ?=
 =?us-ascii?Q?nBjcIAeqSQbpn/L/iWNtNtOIG33BWejPWFYiHq7QzvRjv01rt24wmS1vQSH7?=
 =?us-ascii?Q?Kojs7o1pq6yKRMdutZA9xWwPx/K2OFJLhFo73W2X577VYrnLJfZ1dJUD3rbW?=
 =?us-ascii?Q?2KRBI167qcYavXarhrteoT8hPlEmJ/ADYlWYiFJICLKu0nUTIlsqnVUKNutE?=
 =?us-ascii?Q?wsX+rVTUN99/CEqbLRnJxjr79pAGrEsiuLROGQeqEB3sc7rkNcMNmzh+CLYF?=
 =?us-ascii?Q?y5YluJWZFoQZ6RVJeQwVjwnQpHI7u+LjYw0gQTQGTTpqGNza7Qqenx8yGrIr?=
 =?us-ascii?Q?+635sYrGrDfkzwAAlkvmjcfLMPRlz2AybvfO8guxXgOF7V1SshhOd5UGecQ6?=
 =?us-ascii?Q?r5xCzjkrsJ+uvu13yVIjd7w2RpXVTDYr4chcSHGf37ivLzwii3Z9l9DTcr+w?=
 =?us-ascii?Q?9AzsQxK93Gd8FwNQazURw1+KXvaIAIUGD6QwtiOT18dauhf8rBFvijyvDYr+?=
 =?us-ascii?Q?sYqrETTLCaDp/lpL99x1+wIRt8JlNbE4sntTlgRBZIaMy+w0J5Oo5txX7nNN?=
 =?us-ascii?Q?g60jV5A4ZwUoCaU0PHT+yJypxGWvaxz5wrEQZG9nmi9eT48yJw7jzgx1fDYg?=
 =?us-ascii?Q?nkat28mjhI2i7uph2JTOi14/syXROGDNofaxhUFOb6HFsKbAisv0unQaZM2l?=
 =?us-ascii?Q?C+1aW2Ztm6dNwsFUj+ef8UC2rfuw7d+kX3416vFXnQJILXmSAor966lHvmF3?=
 =?us-ascii?Q?KRBlPWX+qWBpe6+JHfGbuhm681jMGfrHAqIkuZ8fRzLQlYP+Y8aDrzJea3UN?=
 =?us-ascii?Q?IAArkCHK5FsjLFM5PMc+VaTnzCmVfsgtxlNrd5vndE+2UwQxXhpzpWzxfiBa?=
 =?us-ascii?Q?sr5YnkUmvMKvxe3t4eWikryJYHLV0RKb3lPIqVX+gyf0LAfZfspGgX3zEnd/?=
 =?us-ascii?Q?TkZGTnhpZHyj5qwlZ/pN3kPb/qmrHYTFVipGzzpv4ddNbeG0mMNlwwy/q1A6?=
 =?us-ascii?Q?qurXCdi/etOoLozbrD/h7wfmsxGlJsYgZV3RvBwQfytR2io+MxI/ITIT88mF?=
 =?us-ascii?Q?qx8WJ/aualrskxTwDMsTPWNhKv+uyMUwoL/EnvJfnOTH4cRzTjaoQTMVBc39?=
 =?us-ascii?Q?De4L1xCgRMF+WGwByFHUuf8EfdPh5mZ0nf8JpCyq2DYlgwZkY5k1EE/lINYD?=
 =?us-ascii?Q?VGxa+iDDdX+fiTUXiqeowV9cSH9u63QPI0U7w6EmGDtZH7hkrb5tDvi3JpKD?=
 =?us-ascii?Q?ore8v7J3hZGsjsr3SvrcDCaXUtnB5zs9JPVt+mo4S26I+HSMVgBUmwCRm5Eb?=
 =?us-ascii?Q?X1SZ2lHK/rYpIpOj+yqAit2zUGJ3OrAUb8fsoDGM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3336daae-a0a6-40d1-9ef0-08dc31ce2100
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 04:40:56.7993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHN4rbSy4dAOdZ9Ni8c+QUXPpIHo5IxTdsy3KHGv6xK9royfLkx7X7nWbKTCbVWFYlZ+VyVHtM7S0M2267ASRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
X-Proofpoint-ORIG-GUID: RxDSKmyuLQXXslLH6lmnSxVyLH64rxRF
X-Proofpoint-GUID: RxDSKmyuLQXXslLH6lmnSxVyLH64rxRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_03,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402200031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 04:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195901

License-Update: Copyright year updated to 2024.

ChangeLog (https://github.com/libsdl-org/SDL/releases/tag/release-2.30.0):
* Added support for 2 bits-per-pixel indexed surface formats
* Added the function SDL_GameControllerGetSteamHandle() to get the Steam
  API handle for a controller, if available
* Added the event SDL_CONTROLLERSTEAMHANDLEUPDATED which is sent when
  the Steam API handle for a controller changes. This could also change
  the name, VID, and PID of the controller.
* Added the environment variable SDL_LOGGING to control default log
  output

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.28.5.bb => libsdl2_2.30.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.5.bb => libsdl2_2.30.0.bb} (96%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
similarity index 96%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
index fd876df0ad..99dbf36477 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Zlib & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
-    file://LICENSE.txt;md5=31f575634fd56b27fc6b6cbe8dc9bd38 \
+    file://LICENSE.txt;md5=25231a5b96ccdd8f39eb53c07717be64 \
     file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
     file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
     file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4"
+SRC_URI[sha256sum] = "36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


