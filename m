Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D515FC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11803.1643994124798921108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JlvsWwPI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1p023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=yhnTl5ZpiZXhy1RMZ6b1crl550896u98Zw4T5ULHau4=;
 b=JlvsWwPIUBx90gpQ00OeXmscQqEzaV2ZAO+ykGSCjbR+3FG+nTuCCY5vvavo49GLjQIT
 4Ut0CfhtcWQ8VVCrYsXe+QCZxb/5kDhLTCBwJIFPlbn6Bv3+uyK6HKxt5KsES+ENlAYY
 MkMn4YrF0tgUQtp3d9MPYZ2KcAnGqLKdkn4WPnuzWo4VPNebPfVjWoxu0zh+qGSHnoY1
 EcaTBnH5fwyqI78RRp0iYqNhfC+AdrZv8Yb9PG3QU7FV6Eq2J3foI6UzFDpKKWLDx64D
 mjTm8Pm0ZzbsM96u/tBLIuVgzKBZATOaNykjBeFTjSckotMpb8rS8Er77gVWC8F3zxKb aQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrzhwwbzriyo6bTY1Q9YiVg+sqZLv25NTrCS30kxbMlpVSRwdkDfuCZMUugVl5+lfcdm3rDvdo8gagot67+iPjiitfHCrnploo1BOYqddnTagiBQbrOT/mcf3viYQpNVsskb0BZD16z3TlKNJfsowwE7+wr/6z9zm9sBAw5xAvNNOjnZLxMYoivJVP6YEBx6uM3yu8vHq9LThWZgN1W/6hIYOsgTD9xbs7I3InULvMXvACLUqVhC2T5a7tOixH2fRc6pxZFoxAs5+hApHhuqJPgyIKrItgj/91xg/BJDwW6SSAyYMzwq6VO8GkN8pxkcTixSrZyewhQu2MBolZQFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhnTl5ZpiZXhy1RMZ6b1crl550896u98Zw4T5ULHau4=;
 b=iM2dtFDpH0AOYY7vc8MtzLUqwz3VzpQrKJN+uHulof4rEitFXmOyctvk5oLdCUtuWnQHOH7ZYt+BpF7aLKLXAXCQM+XjzvpArOwO8e+id4ixE6TiOrzMColZVsC2V7EXa+hnt7i9WgmV1eiIcVM2MAu+iW2AWxkPDMNjtqv3D7z0P9OPVSQHK6WZtNH15gJT+CZUNTyCo0E5WGGTRmYgtIr30wIw16rmcVxslcXn9agkJE8/GqvEk37o7FI1yIIZdnvyiivUGU4wbzSq9B9PdOMBTHla6RRV/YpCngHdoI80NpH5iyyvbl9GIkPuEfblVgunCacBDd/wGdnkEFF3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:02:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:02:03 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 5/5] documentation: Update for skip_recipe rename
Date: Fri,  4 Feb 2022 09:01:44 -0800
Message-Id: <20220204170144.105536-6-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204170144.105536-1-saul.wold@windriver.com>
References: <20220204170144.105536-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daec820f-88ff-4beb-ecaf-08d9e8001112
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5042C8A2D6A5C5218E2BB0E9EE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/gAkfgE9qurLePiIo4AzNdogHVuXLaAlJL8wbxNMsxVzVSmYuHwyau76OMBWt0QWuPwK8krpNIB1PV5A6wdZq++6tcndZDFB1WH0OrZ9GvPDtAER0EmyBaxSZMMLj+FhH8lTOIoWEaw9AkZG2FZM6daIqSD1IbKcSjS8M3lPA096edcyMXO/HvOOLOCkgk3dNUzIC57qyc8vjSVlW0ew5+AtiO5JB5EGC2+FoRgUJvz0mxQPKNHKwQDnJ+wZLzwBtA6TEDBJLMd71o3nYMAOf0LmeZdNMdM7DXKyepEKzxIx1Nukl99Pu0sDlUODk/u1p7gZfqi2ULix5iklFyiwtQZ1SntHDbhRSAzlMwy3t6tZdOOB8XPEIXphhVOY5OZ1Ub9Msnf+KJ3z/odQ4OJvk/Mn6IBUIhagGONem2kZOz7C903TogBDKcJ9hvD+5N93nKB3Ua5psd34KcI6mAxl616iqBxJEOKDy2vDyQVeC52IKy67Gbn1uMFRn+bXf8hPEeXPi8NMkFZYfFajPgAhLw4Xj+ahnyQytfEEm+f4OsOXU+Bnk/+6ocrEMj8iQY7h2++z143OiUg2He0oNy5rUaf608FsLIZ5Mq775dLd+2FauV9QKHAKtnYB9fAWa/fSw4HLHqDtmeelfJYU8ln4siqi76rhBhQjHtoOREZJwmT+UcWHpe9UYwBIHPTjiTjyDeA6sUiK1uD0fRyLScnfXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Biq7g+6qXrwJDry1m/z0PWGDQNWJxnam06CAhjr7VzxXAChmF0hcDtv2fbMJ?=
 =?us-ascii?Q?5TURHnPbj1G6YHt6q31vkX/O7uVSk9UGPBszxhjvb562axaT8QJQqbWwdhdX?=
 =?us-ascii?Q?YMgcuQdTe4zlW771wasTbTqrz/KfrVMgEhMXucZ+82p36aVNKeAn0vfqExu5?=
 =?us-ascii?Q?KP6IzJhpPSKiR+PmbHevGKlvvmk4d3har/gRsV+Eo/TK5Ii8e2Pyp0yZGAez?=
 =?us-ascii?Q?KddebbmNWxM6aWkd1wxPJRvcklobl2fC7Iri1y4c5YmHhsRq+VyyQrkU8Hb+?=
 =?us-ascii?Q?7oSfe+x7rL8kZ7CJkQth7MCGxgnqcXJDfT6no1FVSJEJcQhzNv2FZW727bTQ?=
 =?us-ascii?Q?YiE/8/V1lp/A39sZXNdswiE9C+NO2BoI5FYUhAyqzUq00oOK52CQwax8qjg8?=
 =?us-ascii?Q?18ELvWptZ8N2NH756yCVqm3mG1taP20kCHYlPMhbtdC7/U0mx3rtBOk6YQYZ?=
 =?us-ascii?Q?P62+hZm9nQV4SYyc6jO52GNwMmK4TXUqmdLOfrifru0+2OIz/RaIqvwItia+?=
 =?us-ascii?Q?cKfYlVF0kT8UHpIjjWb0iDJuN4Be1PUwFwBfxX/8FghCxAQ3/syAaA/ocHxb?=
 =?us-ascii?Q?bZrV78hgaEq9tUpS7qmBe9Mfc4pysTLkGqm2FHEp41UPn8pdKID5wQ7Q7w5s?=
 =?us-ascii?Q?hX6N4f+xLU8qCk1dSsEEROrC/HfpYbcb2gyT+5P6KuufT1xfBZRyRzu1wVq1?=
 =?us-ascii?Q?YgEQ3RbjbL1CFlUrH6h4c+7JSzf/VIKXWXmGfnfWTsduVjtxm1TpvyC24jtl?=
 =?us-ascii?Q?26B00TRpy+490rEKSBZO76EhQkH69hTEnhZaHoo03Ns45P0dowTTMoYxshWW?=
 =?us-ascii?Q?XFCfUKKciDdWCRjYqGACIKzM+S4o/4OsXJoEY6eo78ap2ivEYcs6z0/Fkuk1?=
 =?us-ascii?Q?wEu2h4whbFuBYvIBqjNxc4WKFkNnUM2fO4IhC9bOAciWXZoIybYZh5utj/7J?=
 =?us-ascii?Q?9CrhJuZmJoEfdDnSP4MbQlwDHb6IUiw/aXuPAJ+Kv2MSxCcCm65ZCPex8hb2?=
 =?us-ascii?Q?Brg6A6xrhnKjl32KkUrS8rp3mdzzBeZThGBtN0fV+Wpi9abwKq0qGRRKoIvT?=
 =?us-ascii?Q?MOJh3qMvAmAdEAD8QRlVN/1ppAMG2RzkV1saDufDBr3yf/CHIOAA9fwVuenw?=
 =?us-ascii?Q?f7G03aXTlRpKlMYavDoRqdnu2QEi24H8pO40RI2XIvk1ebvN/grE4Ay5nbl3?=
 =?us-ascii?Q?KD5ATdsxv1hL9TQvsDGuehMK7NEd4zk2PrXHyMvnMJEzGV1QTHX9OF5Qratp?=
 =?us-ascii?Q?iBBkA43AJB2Ibygarncm9MwPlbeFFFqnr73YctZCrCOao5ykdrqyRGDLhd4I?=
 =?us-ascii?Q?pyO/KdhTYCBJZrLiKTGndX6L5Hf77gf+88dWXrX0RRHhSYrssuRs9m9/ePpm?=
 =?us-ascii?Q?2c20qmwEwNl2ZH5WCdKstn2l/JJgOnP1RZ+Rn4gp4jFWCggYPzFVLDcpE8nZ?=
 =?us-ascii?Q?ul28OzY90K6VxPjCwF1fXhHYSSiqnPpiWNBzLRrC1xreIp1PlKoJi5VgB62G?=
 =?us-ascii?Q?obSkxZXh1IXvCHTfqwJ1G19U5GA/mWFQ1fk2L6l+SV7XzoFk7PSB6jp/qHNs?=
 =?us-ascii?Q?sph3HA2DUcgFOBbOXC5yirkLFWEqXqIATYqjNo40IbA4d9O26BtwbfljZxH7?=
 =?us-ascii?Q?U0R+P0bCCQLZnO/q9Schw4w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 daec820f-88ff-4beb-ecaf-08d9e8001112
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:03.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U+nunoX8aB1Ye8U7zKHQfmc6Ydemk5yayC307R11ZM+aMA8j24gCxNt+Dc/VsO+HA4RgrDo4vNHJhL+YXTaRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: PwG7ncUCTXGeHMGRRfle3GyFDYOi0rHR
X-Proofpoint-ORIG-GUID: PwG7ncUCTXGeHMGRRfle3GyFDYOi0rHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=901 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161370

This change better aligns the name of the variable with it's
purpose. Since we removed the odler class, the associated
documentation is also removed.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 6b50ad08a8b..9614448a1fe 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -331,7 +331,6 @@ PKGDATA_DIR[doc] = "Points to a shared, global-state directory that holds data g
 PKGDEST[doc] = "Points to the parent directory for files to be packaged after they have been split into individual packages."
 PKGDESTWORK[doc] = "Points to a temporary work area used by the do_package task to write output from the do_packagedata task."
 PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenEmbedded build system as input to create a package. It refers to a package name in the context of a file created or produced by the OpenEmbedded build system."
-PNBLACKLIST[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."
 PR[doc] = "The revision of the recipe. The default value for this variable is 'r0'."
 PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
 PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
@@ -385,6 +384,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that shoul
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
 SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."
 SITEINFO_ENDIANNESS[doc] = "Specifies the endian byte order of the target system. The value should be either 'le' for 'little-endian' or 'be' for 'big-endian'."
+SKIP_RECIPE[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."
 SOC_FAMILY[doc] = "Groups together machines based upon the same family of SOC (System On Chip). You typically set this variable in a common .inc file that you include in the configuration files of all the machines."
 SOLIBS[doc] = "Defines the suffix for shared libraries used on the target platform."
 SOLIBSDEV[doc] = "Defines the suffix for the development symbolic link (symlink) for shared libraries on the target platform."
-- 
2.31.1


