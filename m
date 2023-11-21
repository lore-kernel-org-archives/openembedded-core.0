Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1C1C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:43:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37939.1700566999092792318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jq0BKv5y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9689cbffc5=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AL7GHsf011068
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Gf9fsJbMud7f+s176B
	bc/yWVZuYdhmZCRV19ccAfCRg=; b=Jq0BKv5y2Kcmtkg0x6qo7u64ojbO/+MXV4
	SiiE5PWmPar4ZWBTcu5q0y/zpR0kToJRdK9NZnoGXD4gSbCRnkiVRkAlKLsEFnV8
	Kzs54eaCPqhTofAnNGGslUEuuxlWqg6Ql9XWDSWEqh3AD/l4MpuyeUtjg8mYRo7t
	WqpHfPuKIHlu/KUpGmMRsmLKg2D+SMFDcDg2Ui7rG2YWYZdNE3/MT3hkRrJ2m+2w
	9VyekiKNBMPQav65Sic6C2D0fLyY1IgTCuKGJhZmJ8CiSj3hvehgznEvJvPwM8lO
	r4Vm6TSAGX7+hErSqL6w7Hc7HXMZFtD7r4HdHmPmEtAKCgLnKw9w==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uf41s9xxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:43:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgrh1bnfPVbRiy/2GJ87xR3MxCEFUECjZ6EqYjTi5/dJwLe+/RyWCQfq1lV0ohpMw/sPcPtdNHQXlWZ/7RYeUCBHRwDDVe96MrVNtci82Orszi8/tyi16fZ3JcIB3RQLCyBm9dWQhp37tfqDiAh2FKSDICXzMtw14QbWj4t9rXBdcRDhaY9zKPDwLE/0sMIFXwDu+7+iQSYGG4Ho1SimJqr0TN+G0G6pRfQzoduPkuxYP4eUzmObnJQx9RVmvG+mLaU2RUGR7O2v+BgaY72iFs+NU1qndLRDX1D1+mDBpIzCA/EaDHfrYVijLTr0VggoJOQEBVWTtk986nmHBltMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf9fsJbMud7f+s176Bbc/yWVZuYdhmZCRV19ccAfCRg=;
 b=N3frO6PLKFRSG0OfJoOCRZYn/86q3I5D8xcBwDmOGjrKR9jy6o3s+LiNz28pII9UFerLEckxE9TXN5yC+T9Hk/xc0chglV10URD/xxXdVjVHXtAoYdQ5e4ohGZBUIt/d7JNkwwwqQ6VhrcfnBaHhDl1xQ/tSk29WEnDKZD1YsuoNY2To5X7NL/+Y9b0MByLQAbgNdoXf0S5uN7NqFAMfAHn47QQWPVx+B3i9YBj+ABBVkte60LSc2D2m17kpP1LdwkTTVsLPWk123bzeU5G/ZQpAOk82c3SsELqCrN8cMbEDMD35IlaE59VN15yjRJ/kshzzO5gnCkcRnJAJ0hs9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 11:43:15 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 11:43:15 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH V2 1/2] binutils: Fix CVE-2022-47007
Date: Tue, 21 Nov 2023 03:42:54 -0800
Message-ID: <20231121114255.43746-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: fe56ed83-5c1b-41fd-35b9-08dbea870ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P59JNAe1vOK19nxDp5vwzd1nzus/JgW4j8JnH1hMv8CvMu/CIdgC3ObLFLufG0za12JFrWNVHA+uj5vCNBNpUcUeldKwaz1lA/QRXNgQK78R8n3uctm0fbxiUVNTWb5kh1+c9c83eRUm+iL9mXsQtIyf7S5gPBlWzTz6Xk2clka6ht8ddd/FgfaGj5n4bX0hjBfYL/gGkirW0K9CjWXQSBQ7aaE3HOnmaV4Zqy5QTpMV0Gg9adlnAcV8jlG0iaV1CsuFuaDpS0nY7NlvGvGFRdAAH8VDNeTUpAuRB11m0gPYfQLyPgqC8t6UgUq/iiOKf/DCPa960CfaWiWAsiMgdhkz+KWS6oVbLAukjB1Tlcc5zkSkWbeb65mKRkyXXECHad7ia30HqrQNH8t0X20zbKgeYaQvmAmgl54hsJ34dBbGTBZ8LfK+gcH1OnpF7uvoyiS/pJKvUyzvFYOM1EvwwDRxg7GXDgm7lrWdEdWfa+t7x+rD1MGoXscF55KAmrNa8ZGKfWlc5eKsCbo49NFnIp8T+5Iad8TiRMr/a7FBmPwJuWnPIOVZgAs6ohfi/SDduQnqmBnT4kTbsaMEgk3IlwshTC7p4198ln+ROz4GZMc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(966005)(5660300002)(4326008)(8676002)(41300700001)(8936002)(2906002)(316002)(6916009)(66946007)(66556008)(66476007)(86362001)(26005)(107886003)(478600001)(6486002)(1076003)(6512007)(9686003)(36756003)(6666004)(52116002)(2616005)(6506007)(83380400001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YkVE1zywhAxzZZH59TOwvVjjQ1+hybbxoDMynO13t+UmbIYraLnPZdPqWBI1?=
 =?us-ascii?Q?Ea0irJx+6R9FeVMc+QnHr+vsDIqEp9hUPMeFTAzguwHAGfuwZcyxdITXIdUm?=
 =?us-ascii?Q?Pz6Gi5r4q+Vn8IOlIPi44FHJB9JhMK6Wjk/+tPdh5z6udiKhtpH4PO9lRv53?=
 =?us-ascii?Q?vrjIE9c23IUL7gPJvsKm30ObEIXJhVItP8NEEi/xx2Me8romKe+L/pqbXGzm?=
 =?us-ascii?Q?JSR0Swnfedj90eg4iYCOL6mGsZVEzGd9QKGcjh544L6BVqTpbMMmteuSvGGV?=
 =?us-ascii?Q?h+HkvJGPsLpf3gcFBeWv9BFNHb0I0Qex7LQxExUQaqMQK9fiib+wjo/5HXh7?=
 =?us-ascii?Q?zw716PkaDZKnKgz6KKczLtV0vbW5zIaDlLzdG4YLb23+q+Hak5nUWA42nf0c?=
 =?us-ascii?Q?rR4awx+Il9flcX5ku3woIKl5VkBi632meWLmLkZmvtjfAGJG9hFbvltzYNoa?=
 =?us-ascii?Q?plZd0QauEZfTCcq6gzh+Zify2yxOhnJWTTzHy7MkvVMsbfYWqWk5F+8oBNn6?=
 =?us-ascii?Q?X+7BTdzNZa4v9PFAPfEkwe2wv8C8UW41GCN88nvkEJdJuufPUqil4GnWAt/m?=
 =?us-ascii?Q?YBidbfoL1rPLJA3qZgqQGRA53m+Htol4NTNLKGfkfis8TqgiIZl8+6kepAuq?=
 =?us-ascii?Q?8F85EQW14o8hUcs6Kn4jHF5se2Yvjr4/Z4bEBro+10huysTQrDYH7kHYMeLq?=
 =?us-ascii?Q?pZXXTY41kN0iTCVYqZ56BCMR3X5puWohUpl2Rm6YR2ltJVMjfuBoKnGwDNwc?=
 =?us-ascii?Q?wCqCsyvQfxp1vnmZh6Ipii7Q2/EuUdUM+hjJ2zCMEaBka+3dwgcGVAvN/I3N?=
 =?us-ascii?Q?duLsRgMgtUfh7lp+3l+B7Y9reYbtLbteOpD3QW1+lq7WDA1dGAD+egdxoWsi?=
 =?us-ascii?Q?XisWTItqaXwFfFiJKLfI4RKEMapnic4q6uwMirukflAFe+WVbkxz5/9X5j2j?=
 =?us-ascii?Q?d7+LtdNT9em7rvZNg2wKDuJ+OPNNcu+CFUqusZ2pbSavA6bhEkNgznUcM/2B?=
 =?us-ascii?Q?FMFgsL69t4Tiiapv+UcoPcbonU1vPkdIntEVTWCSJdv2a22xknnIudgzxVqJ?=
 =?us-ascii?Q?WOrFiAtpSo/Ag7BTtH5xXWfquDA/Ci0AvkkZBWLzr3naVUM3rYzdncPhL+Hb?=
 =?us-ascii?Q?xpTuHWk19Eue90R89oSuzuZH+htmN7ihn4VhCBi/K1YoPuy5R0Fggz6P18Tm?=
 =?us-ascii?Q?uOaliu3CRJOwr+Vakp+JR9316fbtrzTrERG/anZ2981fdKG4MSzdJJANjbYV?=
 =?us-ascii?Q?GA0tKbx+cbeuOfyzWyjpxoFo9ZDT4kQaSFFnZMNsdb89uwLu1hMSym4LYljY?=
 =?us-ascii?Q?AHGYOJ5+SLv8onHj3Zg2plOXQ7ZHcc5Fai7DU/6QuRH39iOg9T/uTCRZHuHt?=
 =?us-ascii?Q?3vJUSke753jJuCT16SiNFdfpafGCnFXmPOLU7lJW2N0mLjnMgSdmu3vhqFDO?=
 =?us-ascii?Q?FWnatNs+oIIAIEGhOykt91aTXp+EGsdGuCnDUeMPSVrf9jYUZnEroggPcZ43?=
 =?us-ascii?Q?hVuQ7OQiTGPegcWxQtmpL2/sirxe4YPNxendmIZYRahJDLG40G/IWDHO2hzK?=
 =?us-ascii?Q?y02AJ8TtPS7e8EmdoMyTV15ZTQPMea2KPVpeSLFhg/0EqEYgHH8gfMPKlrE4?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe56ed83-5c1b-41fd-35b9-08dbea870ca3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 11:43:15.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otsH2dTWpWuet+EeabvM7+RpLiwq+9s1XUGvt3+PtrSrLs2GwrIvK/hLTyBLjy3QviMcvI5NLaZWtQp68u0e6s6ida0EAeCKPoLAlfPBA6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-Proofpoint-ORIG-GUID: x2ZDhRZDXfm15SmPcFgW43GjkaGc9hFM
X-Proofpoint-GUID: x2ZDhRZDXfm15SmPcFgW43GjkaGc9hFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=663 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311210091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190969

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0033-CVE-2022-47007.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 43cc97f1ef..dc29141812 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -67,5 +67,6 @@ SRC_URI = "\
      file://0031-CVE-2022-47695.patch \
      file://CVE-2022-48063.patch \
      file://0032-CVE-2022-47010.patch \
+     file://0033-CVE-2022-47007.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
new file mode 100644
index 0000000000..cc6dfe684b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
@@ -0,0 +1,34 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
+Subject: PR29254, memory leak in stab_demangle_v3_arg
+X-Git-Tag: binutils-2_39~237
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb
+
+PR29254, memory leak in stab_demangle_v3_arg
+
+	PR 29254
+	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb]
+
+CVE: CVE-2022-47007
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 2b5241637c1..796ff85b86a 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -5467,7 +5467,10 @@ stab_demangle_v3_arg (void *dhandle, struct stab_handle *info,
+ 					  dc->u.s_binary.right,
+ 					  &varargs);
+ 	if (pargs == NULL)
+-	  return NULL;
++	  {
++	    free (dt);
++	    return NULL;
++	  }
+
+ 	return debug_make_function_type (dhandle, dt, pargs, varargs);
+       }
-- 
2.42.0


