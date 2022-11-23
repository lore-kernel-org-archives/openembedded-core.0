Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A8FC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 03:44:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12006.1669175067107777608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 19:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8326424e46=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN3fwPr020162
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 19:44:26 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqauxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 19:44:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejGCe4q03bA1YCMMw0cmnBmPCmDOOpYoy7yAJ6lqODdNrWm5cegvxOOh3l+k2+8j/vFavvN4FkYwvTLs9Zpcy0pqsC6BjhcpOxPSIMr5g3eVPfstqhqxER2EINo+bAnns774LwMsm4G6ZyvJIJSGEixtFhpEhkLVJ72bGReqD8J8dkEF3GOCsfbo+hxwU/WZ6Ut82FfF0oel6O9hUzRbykijzEaCXMh8ckDewVdXI53HAxSt+y13dyMvftJR2oTIu27s3oAfp8eRimVS9taTxfSee29fAz7GjhmXZNvGQ3xoR6TFeHhDLI6xXkrKGR6JXAeiOIvMNOySIaCNdsUV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkAnCmCBICXfLNJcVR45aBdiQR1qHqKeuxerJNA9Bq0=;
 b=MXYihxSm2vFR8HfZZPDeljGESkDUC5O3Y2nuzj6lEOGWYaS7+6FzeEBccWRB/vqw4VZtkKgNMvSZOAO24ljU/9AvWh4MWJ0O/7bRFAZaKA+OJBYb9NjiFS0602O2/AKwEcdAM/I2di4EZyvpmK7chJco1/G5xctThae68917QLPd7KM+QEAN+/w955LwpsBEPHUZh10FoEpW3wc4PK7MtZftDMwAqDTEySHRhSUd29vNmXDbkkswHxzESi4E5jsJYdeUhpGKcf6CLu3N/8F1dkVwlfbU+ljGLttGoV8k2huj8d6KXk16veKzmrGudnhflXPLcYB7+wA/73IHuEfT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 03:44:22 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 03:44:22 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] bash: backport patch to fix CVE-2022-3715
Date: Wed, 23 Nov 2022 11:44:04 +0800
Message-Id: <20221123034404.3790675-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:100:2d::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5c5028-d334-4ff8-0eaf-08dacd05022c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Ay3VOqusnjGDjdJ3fHyHCDEeC+HNq87xjcuM2SBAc/qH68hd3HY6KNXw3tbclIPn2GEQHT5vvv7D3DJWKqUOU7YG74TKwishvzqycZdRFvS+ZjFGwhI3ffbZn0NdrVSFE4Hi343SzksVRBPjC4s6Vmz+68G2Rw/mVQ/UBRa8jiqTTyunk4n02pTUn1jU4OmfHkNz7teExGm46tPWArNK8R/14nzRK2Suf0S3hpXbSTnQ6cK9qrkOBq1OCud73VywdR/3M2zvEqqlRkUeQ/TznhaSECEVUeNS8cZ121W7h9waPZ8jtJcCd76nr3H5diFTEAgb2b44t9JGiA1Wn5EnbQhPcK4OkdTM7s2iZmOaqkwC2YyxNr/iie3RZih8ycVMq9tps4dX6fJoMFw+clOi3aOPOLvvzeb1KS3C1hZikZU75RlKAvrpxNfPjZf3aPw3OOIXU2ubmUirca4+LoKNxtUDor2IQRGBFoQMjnc4MrSNw8xre+SkVLVgjLnnqn82xleuDmLDfXsFKx4HavoB1AFFCH3witpt2a9Lvs55pULKABjRETfEo2vVhXfC/d1T/lS5jI0Myj6NpQeAXHGRMIYWEAq/RcM70PC7ngFqtO+On/xeMyPtNoiXjij3LiIzJhQ0JBQlmgdEfux/VIcS6koejPXSG9FSPv2oI0B9rD7JvfiH1i6ZXYb1OKHna9bZ8Z5DIWFdcuc5esTmrygqd2rnH0JDkrFI71gRaLNR3I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(451199015)(2906002)(83380400001)(1076003)(2616005)(66946007)(41300700001)(66556008)(6506007)(83170400001)(6916009)(38100700002)(38350700002)(6486002)(8936002)(52116002)(8676002)(5660300002)(66476007)(186003)(6666004)(6512007)(44832011)(316002)(966005)(26005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q7onvjrN4YnStaHyZFVwhK3fe7WDibuCWC9CR10Fsan+Qld49gZuVfU/6LVe?=
 =?us-ascii?Q?5y/UscX5DYBdjRCa8hSNFt4h/p8zASAfEFJT1pcLUFiV4Xr5HqktCbSyP8Us?=
 =?us-ascii?Q?lDCkdBR2RzsEUq2f1Rxei2ls3pvafww7VjbU4wC02UJiU/BtesEFKwMruwEW?=
 =?us-ascii?Q?IQKrNUq+sXMDxQVXqUaZG91aDdwyj+1SuVVsZjbbOzMKeVfWClL4edBuzKde?=
 =?us-ascii?Q?owU5bi90zI0zkyL7OCmyJ0/UabiRFVCg8Oba9zyvdO5pnH7x0r5w1Dy+4cNG?=
 =?us-ascii?Q?jF8QWUxFwO1Z2vLbXqoRdAsiuE5YWWapOMkzTM89UAR+uegebrCfo+Ddbn41?=
 =?us-ascii?Q?ZEfeT0YQV7247tEFnsDkt05dw7NOIMO1gScxFazAVpx+QItVxu0SUv+Dw4Dv?=
 =?us-ascii?Q?Naghw8xxXy6UsKLuqhTzYUOmoWsT0PzJttEtPn3mKmgR0Yirgev9jyL6BoAt?=
 =?us-ascii?Q?Zz/yuEDJZD1OcwGGva064YDVEML1Qd4WKTBk8p9+nA71t+V0R56waaFW3liu?=
 =?us-ascii?Q?Y8TPhJxqhdBo1td9xZNYTlmyclff7MaoI2q/cDv0AyrYXoaOuh6GQUe3Hg4r?=
 =?us-ascii?Q?MtsKpegn+2olXXajQVBs5d0KURhHHe6lteidoGPmZaKcscR0fHqcKWAPoQAL?=
 =?us-ascii?Q?mC11G8Xbcvpovv0Mm7wrFmB21sInepnuh0fg2jbT0rYr1HKOeOV8w7ApOtP4?=
 =?us-ascii?Q?O+SlhCgEZQT7+inxaRBYZ8PBeowAXhj67Z9J/B+mLPI/6VZSDtOAlS2WiFQW?=
 =?us-ascii?Q?17V1B4IvmOyn80/0mwl3L/KhuyIRrEYlWnJZMbZivtElroqYyJVRnO880REZ?=
 =?us-ascii?Q?1a6Ok2Jj86gcertHdztn7wm/QImG4C1iE4HETZRM2YGrsXVMvakylXpTI74/?=
 =?us-ascii?Q?AP2WWbY9sQuCF1KAvgdwRah0k3IisELZ126g+Geb8M9uhCGu1QjX6NEfJvwh?=
 =?us-ascii?Q?G7d5GfMuRXK8VVLNQBwnBocddvlhNd7yGqNzSLLNSVFtN1xluKacl0VSQnE8?=
 =?us-ascii?Q?v+yWe9UOoxN83Dq1iDSDndrTSaC5OMmWtwAeiG137g/UvfUCmb5NDxPFHyAg?=
 =?us-ascii?Q?8fw5+BNmuYPLqJDNeVcX7wOAMDj01NYVAeLHzK6iYcyEG6jmsDOnQGu3/w2A?=
 =?us-ascii?Q?2pz4u4bdkSD0VEjwNfepzhLWREKNBLZ5TMTLL1qzfzIY9Cnu91eGuNrpH9dN?=
 =?us-ascii?Q?/sAJPXuAW5iiNdRlOqMA/YcoOpMbE8X+Z1Q/z4/HmDSUF5YClUsg2kAPYR/x?=
 =?us-ascii?Q?T3q9fpggH0UJEnUmijFu2IkrGlEiq2+XuPrNF3Cl5915eYEOHVyt9NYx2F3Z?=
 =?us-ascii?Q?iFFO+tfpMLMLpztqkszfeykb3XkjzbLj8nQEC/Mc5Ny+yEYDfzd3az9t+BOf?=
 =?us-ascii?Q?rrcHS8QCIx8dtc98SrRn4E/mltLPu1l5h5AMyU9NDeqh1hnx8RjD2uOcBPJ3?=
 =?us-ascii?Q?1j8rfziAtgTQhQCUTCKAu7soOIDAH+X9xDMaDZNRpM6+2LJk+fXzyLjic+Ax?=
 =?us-ascii?Q?jXYONZHrH6cuIGIfzCrJNFQTZH3eiFN2ym9RqncZU01FQwdTZ5XtYQPJ5S2G?=
 =?us-ascii?Q?D5zgVWCiiVPqM0j14oe9ij0MJsgeEhskhXUsmkHb5d1p165pSHD2zHA+17th?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5c5028-d334-4ff8-0eaf-08dacd05022c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 03:44:22.2723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +P6HL1z7jeOPMrfrNqDZZFYxBjM287voeGxAFWryJNA/sbmtTgQuiUExBSKRHYm8ctHfEZIrxG/twBssm9x7lKMOLoWCLjtBd69o5P1cqiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-Proofpoint-ORIG-GUID: keTQ5_hcaXwp1Y02YGjgni-nJEr0QO-f
X-Proofpoint-GUID: keTQ5_hcaXwp1Y02YGjgni-nJEr0QO-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 03:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173706

CVE Reference: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2022-3715

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../bash/bash/CVE-2022-3715.patch             | 33 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2022-3715.patch

diff --git a/meta/recipes-extended/bash/bash/CVE-2022-3715.patch b/meta/recipes-extended/bash/bash/CVE-2022-3715.patch
new file mode 100644
index 0000000000..44f4d91949
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/CVE-2022-3715.patch
@@ -0,0 +1,33 @@
+From 15d2428d5d3df8dd826008baf51579ab7750d8b2 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 23 Nov 2022 11:17:01 +0800
+Subject: [OE-Core][kirkstone][PATCH] bash: heap-buffer-overflow in
+ valid_parameter_transform CVE-2022-3715
+
+Reference:https://bugzilla.redhat.com/show_bug.cgi?id=2126720
+
+CVE: CVE-2022-3715
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/bash.git/diff/subst.c?h=bash-5.2-testing&id=9cef6d01181525de119832d2b6a925899cdec08e]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ subst.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subst.c b/subst.c
+index 2b76256..38ee9ac 100644
+--- a/subst.c
++++ b/subst.c
+@@ -7962,7 +7962,7 @@ parameter_brace_transform (varname, value, ind, xform, rtype, quoted, pflags, fl
+       return ((char *)NULL);
+     }
+ 
+-  if (valid_parameter_transform (xform) == 0)
++  if (xform[0] == 0 || valid_parameter_transform (xform) == 0)
+     {
+       this_command_name = oname;
+ #if 0 /* TAG: bash-5.2 Martin Schulte <gnu@schrader-schulte.de> 10/2020 */
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index d046faa4e5..11c2314fbf 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            file://makerace.patch \
            file://makerace2.patch \
+           file://CVE-2022-3715.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558"
-- 
2.34.1


