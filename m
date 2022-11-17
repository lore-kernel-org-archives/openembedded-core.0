Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EFDC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 09:55:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11865.1668678911610603085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 01:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83202e5e84=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH6fodN020864
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 01:55:11 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbxvr808-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 01:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bq/imIFjydM1CVt2v+hLoEsixI5WVJvtlr0XRIEFegneAo16S6r2xnzECg/9+nxaJ5KOujj0KcDkMZHw7gg9AjmvUwcwZTGqnt4aDgIEzXeLa8kk3HrVPOLxiXFo0B2jQ7iORNPg8u6Mer7YwKIXqunXQa8GJtk1kgqMNCVD2VTONWvFCA7JSSWWsUN52EcfympmujKGGdBxRwjKZmD6m6TQWpRZPUWAXX18CrfWaepK9BRVEC9KLbXBo2vfkGArQpgGwg1Wme4kA4DQakc7bTqoa75CLKE1HIXxlvctZRr1Db8fNWvfwaHSgVf1F0g1054+PU4sCXRulLtU27sEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izYVjRZHhx/pp0OnR7eJXLpc8UA7vCJswIlSY3YmcKo=;
 b=TL1gdwrJiIkTXlnVJsi84JBxrwibvNKvsZIVS/UnuJzAKfqOS7a6zNiIIhCuLpRVMrB0ioPVT7j3DCMqXOevPbahPDp+3JRqXLhKz2+gmpY5/gC4u8gu95p46Sm25ptVxAiubCShT+c2DaUGMvK9cUtxHYtEzbemtWQ1hbKZxYwGoqEhoUKmIqyABjtnkTd1kf3ycw2y8Jvq7g31pdIdYynzfVswGA+PxYeS21KR/S9AUKWvoWrc3IZIbI1Q5Phv/aZ8kV7cTrahxRDm8uf9Pqszgh7VxfP0Voskw1T8+wcw3GEW1D0+K3YBpo5jXwPgirZrPQc+S2UMC0TNnpXVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 09:55:08 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 09:55:08 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][langdale][PATCH] sudo: upgrade 1.9.11p3 -> 1.9.12p1
Date: Thu, 17 Nov 2022 17:54:50 +0800
Message-Id: <20221117095450.2424717-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0272.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 31401f4c-0896-4203-a636-08dac881cf51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KF3QLsJCCU84U2gMtDga1BA2X97XcYTnZaLto26dBCj1hMadYAoUsMXt/ZP8+ziehUMBDLgOOdrBpwNFO3PVGTmsiwsvVB5vNsYoAc600MNg5eQbxYVL//SQC0d+Q03VzYPGulc2r19Ku3GmNJ0ID/0WaDlVEQu6QmO68OhQD4zmm3H347LiEs15jsOBhSM8etMBtj4QioM1KDWr5WnCMpChtUbqvgL+sdo6zJYl0VVsWtWUicFjBIPbJLwEUG2EZzB5lW+gVuWU9L7xYOVNMEfp9tyPIejDrizQbU63EO11gW8jjiqoW1AAfZOwj/OoNt3kPhafNFhrv36L8Jmqv9be6WWJehowkVrczynkKFtBYHU6pyVBaTh5cadweQi8dj7iSHdSACLrtC3cRoLH5b/0fovAPS4jQfXuBwOxHAXZKlbQxIMk9zJ4Lz2I13bEjTQVig9yDlOYKgQ9MwdDZqwTUJF5JEg8T6QLlUqkYP+FbbsdFR4+bcaZO/w5LE8BPCoy6rgYKF7V5/HxSE0W2gNqBa8Wn58bc85DAl6dzcVUdufikCFzS7mQKYGAFwqG0egFZyhev6aD/GjIN4M02VDQiPYxNbrzWfamzGhrj/mL/wnjI0elJ3Wle/95dnUV5AnUvDcZJkCotfu4BiKqSssgJ3f3SWo16eJS3dFTqnSF2pUjZy/5JMuaScxhADs7nY7zjutxMHW7JOcFIqnE9hz8JQ+mfQ64tnUlUeihRAo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(451199015)(6666004)(6506007)(6512007)(26005)(316002)(6916009)(6486002)(478600001)(38350700002)(38100700002)(2616005)(1076003)(186003)(52116002)(83380400001)(83170400001)(8936002)(44832011)(2906002)(8676002)(41300700001)(66476007)(66556008)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+YgYWw7fDitqmkMaFkzQhIXCb/8Ul999MRjWP/yVYXuN6elnDKZP1YxUJybE?=
 =?us-ascii?Q?oB3uM0mX9YBjNPJxI0+i6DSJMekjrK9jNIJPvyqD84BUlC2iz6+CpI30iRxS?=
 =?us-ascii?Q?IyQWlwcEQh9BSCZptA+qVLOrgXuhGaKjgOBCog4tWtZmVPJ3c7Fnl0BTuYfq?=
 =?us-ascii?Q?3zfzO+DcMnpNp6Ar13iZLpI+nvcovPeas0rF5B53YdfyVpZWQjB6LUEIjQME?=
 =?us-ascii?Q?JvB3VAANwi3hcpJlDEzER0G+ShIIfpt5qFKFtqDAaN94M3hXlMvm/XmUomTi?=
 =?us-ascii?Q?l5v4rn+OuET1iM2C9vX2/Z1IGGyvQxjGtkL2elEAr8HHTAH4zXlcV88FXJgd?=
 =?us-ascii?Q?iP8S2Pk4wV/J31zsh/Hz4LtOQTkhVhZSw5bIneG7UpRFpumPJSuI93DMJGzr?=
 =?us-ascii?Q?TJpIuQ2ry3jEcD21i0KgJy5E1oj56XY9B1LxPBCT0suNOaf+ru0anqKbri71?=
 =?us-ascii?Q?3ZFibAAIe4zcWT1mK/lGRhEzc6ZBWoHITlFowxDrzu7fnyWgyV34+XCU7MeQ?=
 =?us-ascii?Q?/dyK+zbUFpRwuuXM2+atZ5fs+WgVpn+WS9GGXTtNGJFzuEDmonCD+ONyFDP4?=
 =?us-ascii?Q?OBmYOGZa9NFPc9ijGMYghwLO5F0pV1xeu9ts1Yse7MRaYMe2fhwhYQPMNBP4?=
 =?us-ascii?Q?fuutur5aZELD7o/uEDxmwxYiM3QVhgMo5aGrsvPrm4YKgS5WWZ35e6vaRvgi?=
 =?us-ascii?Q?8YltFjC1hoKUhVtRYFmdcnsG8HKxvJUDJ1eWk/Aem24ka1MdweG5//sW6e+x?=
 =?us-ascii?Q?UxmksmrlY0i2/vNdbiIvePSYHcZcM47UIAIyvQJ1Cmqpw8+Faz/qYECw3DMe?=
 =?us-ascii?Q?aIBnsaEa2mUKdaaT+IMeCU7wgBQIyEnhDkK8u2O8+Is1h/XIMTj2noyA9dTa?=
 =?us-ascii?Q?AFxsQL2674V6mh9na7diZ4f6eEg412BpgKszLUPIZL1X9UQEu9U7ekvDg+ki?=
 =?us-ascii?Q?In8jhjri7GroG/3/gR9d1RlQRXG9bNtkCO8ptdj0QCEbPkO6vBP7QcVhk2Gi?=
 =?us-ascii?Q?GHQuJjb2dMyCT37azz2apB5BPUMhTLIr1H3qKTgc5I8LmhhSHpPk7BKxHkzS?=
 =?us-ascii?Q?iQSuEeGXbm9hwyGjZTd14mxDMIzB2PvFIP/f/VCOlqMVC40VpUzSSjddaGnc?=
 =?us-ascii?Q?soeCBVem4g+2GzrFcci8cm+BOrLxa6JemchXThiDfFrFGboXmEykClcVH4S/?=
 =?us-ascii?Q?O0nr/XZEAJWykLLf0WBTU+IJIjbpDQ5pLRdfS5c/96N/2DLiArn6ozUd5oEd?=
 =?us-ascii?Q?hMMPVwaCGAtIlWwLpq8LQWoE8LAGbPm4RrjKGmaHmkxCbHlFOLne/0L5JIl4?=
 =?us-ascii?Q?Ip4bvdb95HPnudSNAVhlTfdRB94mU2OwgD8zCjWVZiYtVbi5WqRA/ALAPjh6?=
 =?us-ascii?Q?ap7HuqtY8fYcY5Sr4zgVItjT2/B80nc9PgJ4ggg3vQpK1itvSE47nWFxFRzH?=
 =?us-ascii?Q?X7OISf/laRUbvHhCTgqvOHkWPlOdvP1jExHnDf06kG+WqhkBGK3Sx+WJWi8y?=
 =?us-ascii?Q?ic52x9DBjXneSyPB1z+YX1C11KWE2YtaKJAuro/74FoJJpOQW3wLKpl4ql3o?=
 =?us-ascii?Q?2mfgP5Iw+Y9pR79eFHh3jlQuz7Xj8CXZ1tnhQ2b1wohpcLOcKvJmO8Ar4JQX?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31401f4c-0896-4203-a636-08dac881cf51
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:55:08.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fP07RU6MSFkP4rqrqLgvuX1dHnDFZ+53qyLrMlyPX6+kQAF0i7hCFwygiiG2hxiWmxl9CYDHFHPwK3SJFQxFTZrT1dL5HDZJwCfF3S5seU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-ORIG-GUID: rGAMXEJVoRm61NTMolQLV5vUQMsX1Yb2
X-Proofpoint-GUID: rGAMXEJVoRm61NTMolQLV5vUQMsX1Yb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=1
 lowpriorityscore=0 mlxlogscore=869 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 09:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173410

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                             | 2 +-
 .../sudo/{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8947c46129..fd5bbf103d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.11p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p1.bb
index ba610ee2e7..1495b67b8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70"
+SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


