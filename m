Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0998C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 06:18:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1824.1719469077890054482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 23:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R1efYB003514
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:17:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5vnft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:17:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftuoJeviWp4r2ZIeBWgz0ecYxkieduNk+GJmaUshl8CUPrG+xUdYO0xI2MxYUAM5igpvQHCa1M9HTtt2GRAQO/AXSKayoO2VetoNQivfJhrhhLjGnVuP2fifZ24JnTHArkYY+38mXxsXaQvF8m2CB640w1JDm+HQk6VTuUG8mgZHzWCKOB3ox59IoBVOKrGDP+fPsKtzEamGZOd3CacByOebVul+N4dI16y2NUqEKd860SOqhpsZ0gauSlhr4DNQGd+cTu7Gi2ESpMdjoOBV+ZDiO695GEhGPgqUHorDz+7Jn9iDj2vz8ebW32kO2fkLHmdBqgSQYDsx3F8QILjGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/G2xrEH95jioTtHTt0daiYqFDOsXsMWULtnWksErS8=;
 b=Qj0vVMLrPw0rn5DRHMZx3BUV4gskn4f193iKLCUvcSNx2fg9eeRz0KLbqA6j4MPhaEpy+fFuM2y2G7o8U8Wki8QcpiAYb7hWyg0ib7z2mWgaJwe68b8SrvqxMdDxgGElSLgvZyPRRxLIzyenRJRkV2lnvDAJaMkM79PXtZ87lhxyAik/9e4+pM4vVPbZtJtCyaoYT9cu/NIP6wqAWlt90cByu5waMZgwTMEa1a5DfZgpFo2tQVg7fo1KqVy0QRksMnpaT4zVBNp6JDpht7cF1/SDV6ZFKordr+iim22yaKwnjmDhgNwr3+UTwLtTVbeTwhWLaO2auAbE/9Zkflqb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 06:17:55 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:17:55 +0000
From: mingli.yu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest
Date: Thu, 27 Jun 2024 14:17:35 +0800
Message-Id: <20240627061735.1942404-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626230938fc033ae6@mail.local>
References: <20240626230938fc033ae6@mail.local>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 67074595-1109-4a61-b3af-08dc9670e207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tNHmakzqW/N8aNThNtlkrKxp8CKaajOgxgRwTY1Mv8WFXna37Mg9Ex41CQRs?=
 =?us-ascii?Q?4qEJZ2spb6G1fyB11v6SO9lL3mkwK7jKUR+z//O5c4g49VYbEnf4v3d10eT8?=
 =?us-ascii?Q?lX2lr2Ya00BIrRYSaO0iRdtMZfGr+xGlFDSGFA8sNVHgn2W/EeBNILN/R71t?=
 =?us-ascii?Q?HxRNfHJH+7/cgnbuILFg7HjF9zY+e04WicshnHSIMDKpR+Yq4wN1eVqOOrR+?=
 =?us-ascii?Q?8zF1AjTjfbGw+1bRgN/bTVCbOa/bChA+V5GacLrzc0M+psQDZssk2uyVKc6m?=
 =?us-ascii?Q?eGQ280jLmChKBS4BfcRHFzyMo32BAjqyH6ptoYQtJYjaFcOaj9ur2rGPlteg?=
 =?us-ascii?Q?JfO/AgAFtAqfrt98CfyIOwEHvqDsmAxdkq1Z6LeP4bwRzh61K++sVF0zEhs7?=
 =?us-ascii?Q?RiGib0furJHrgctS8K3qbRmZVJ9OMsB2YjXypbrnkabm8aA/XD1DLbPPxfKI?=
 =?us-ascii?Q?FFEiKGiRnrTSpFWAP9B97IooMb07AV23OC7H2VsxlN/WM8EBPOyUE3PweFOk?=
 =?us-ascii?Q?LZfBpcIq1s1ndHtODfpuBbUAO/Tf02m9kU9YzHDtSqMoPLeYkPNM95SmdWoU?=
 =?us-ascii?Q?rwhfDtpyX3wRCYmJ/k6gwFzeIy+vtDLsVIxOUHxSFYiPuIcpA0c7QTR9QG00?=
 =?us-ascii?Q?IRlGngfLGowwP6WJfP82DNBSVPgZNxSmFy7Fr1c0+TNHfgWX6zZaekNJklhx?=
 =?us-ascii?Q?EXgn2OSKPS8v4Kd3NJS3ccopUYEsFX/EXhA+UQhyU4YiWta/MNrpoNF4wfnh?=
 =?us-ascii?Q?sA5YXDeppVtcH/E77Et77+OTiGtQv9z2tmQ1N+z6u/L2BYFpz9E+JOJ8t6Hs?=
 =?us-ascii?Q?1OQ8EEj5gBmd1bp8fOkxP3gjX6NTAcT/80zZcft3rniJlZT2+21SVPcWuPxv?=
 =?us-ascii?Q?YuLXL8NCUnP/HTcy8zOueP51O95AfE+Ct12bl5zUUBL2ILgZ/QJW9KJT/eOv?=
 =?us-ascii?Q?hryQE7PxCQaaWU/c8oMUVss29G+SCZTZwhyNNFUd79K88PM0/SycISIagfjd?=
 =?us-ascii?Q?ba+rt9iP17JhddieFuzXl2c1a2tT3W3t5v6DtGbVTRvWnXBi7/LXY3uC4fb/?=
 =?us-ascii?Q?v1RueMHw+v4845UZ/ePf6IaWZVYMLCxxeNWfIMb2rm02canCF+xb3XKfUkp/?=
 =?us-ascii?Q?AVug09KLbbZ3gBY3MmqIPwllGCQKMlGtb4gV0YVnDgCr2U8lkdXo4Zsnk267?=
 =?us-ascii?Q?o9A679QuX1LrsoQRRGeX+/mJlojJci0jfUx0qrz0KXzAvyzx4Zc1wDqrpbfC?=
 =?us-ascii?Q?Bv4R1EvliDDkz5HufX98e5xnYNfsX4Eflc9sVZF55J1GEKrL14o6u2hoYseS?=
 =?us-ascii?Q?HUlFxU6U7XLae6+fbHidI7b7h7jM6Xh43Gc4MGuOkX6twi8jthg7mNkqFBUe?=
 =?us-ascii?Q?JwZzDYbOwJ/+5wP3UJuFSriQs7/1cuqVyccPVdh9qcvMsV0CKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eXlCv4uF8OVAYWDf7pa6rG5G5AgKjVYKZCLVmgw0BQjckRQx030r6mtYANCt?=
 =?us-ascii?Q?1esUA3r7zybBaD9+9ge923VAXo2IgV7NmIaTaJsprjYHZktPnZHKxE9jlsZK?=
 =?us-ascii?Q?1ZpuSzurtad67Hg0Efv36Wpa7Mb+TJzDxYxsBZG4xIntmTLri6ZVGppP2xqJ?=
 =?us-ascii?Q?IXaFqtVhrWCG8o7l2ZNaUR+eM2Qcf/ezkuj1GwT9hWNiUbCw5Fv0HPWCvVOk?=
 =?us-ascii?Q?UC8FAu5u7aViLdYaiYfGs1bWmt2Gs+fEMMFSmFsZV1SQ9sX730P9IrDhGw6r?=
 =?us-ascii?Q?U3DrI1N5+mAsheV7QC5S5icP69JLsNpklaVwZPvpwtsO1puYG+H9s/Tg91mz?=
 =?us-ascii?Q?jLbryG/rPeZ0kTOoYkWmv5EucT3OR3THCHRCwK6Pk5cri0R6vI7XXHuaXAe/?=
 =?us-ascii?Q?WPS58rYXOwi2FDACsS4gBPq5rwm9548SsQ3p244UzOa9F0/Nw/tgqeY7tXi7?=
 =?us-ascii?Q?u7jFE57+hfP5mHTJuVzdTfIETvC+/ml9Yylx6djydlGWDQL8RaM+3fMccS+E?=
 =?us-ascii?Q?YlyN+MaofZMdS5O4i995PU3U0Q6nVXuQoAXYc7bSuRKHZUz/2dT7lC3/pRML?=
 =?us-ascii?Q?UGl9QH4NS8dPi76nDCQx0ajDtEePXWjPUpjP+J7Sm+JN8S7dNlCcKlHW5DAM?=
 =?us-ascii?Q?Jd9rJsSDGcYRdLY4invzDjWd0LzEXhPLQj92N7QD1m6mq5TqW6s0He67Onbu?=
 =?us-ascii?Q?Q7UqedHxas8CsNwkod4s9vUNia4V8151KsQJ/vq3vgeqYMHhelninToVjOhP?=
 =?us-ascii?Q?vEAFUwju9+cBRLhBEBypokvAkOI3HYXpUeoX2Yiz4Bjl1ePKZJfudWGqtLnR?=
 =?us-ascii?Q?F7o/wUqfKIIaFe8Td4tz79Wx1FryEjM6xskjBCUomeOt6mJIAwKp9nchjxNs?=
 =?us-ascii?Q?nc0bD+Y6yN+3uxI6UxiIKuTwbJHeUhQ+hTIMC/lRBjCfJWtVcOaWMzyVU0cy?=
 =?us-ascii?Q?q2CfammPl//GyTYVCicXgWazFyeFd9l3V8gxhyj2NAPsTZqY+xapA4+DRRXS?=
 =?us-ascii?Q?N5R3RxkRoN1Qb74L1zyN0l2tKbmkUlYyXCDpHXGa6Ba2701Zsv5BtLWyZnot?=
 =?us-ascii?Q?JG7nIOI+n6t1oc0yY7Y+yNt6SX3yo0XgD4wd5FsiL3NGce5qUhJlAn9BaHw2?=
 =?us-ascii?Q?zTyeTSK982bHUebpbnB3ryUy5PGViY4rMWBJh46/ldJvPkjgpFrhVsK3YYo5?=
 =?us-ascii?Q?DL7snm8OPWcHcYRMBVXmetGz2mplamBoYjRTZ3MojGzh6jbw4giJLfoGEOIx?=
 =?us-ascii?Q?4mI6p5ZbLMwWZ+y3WZFu6mK/QIJ1vRPV74v0tYkp8s6Nqavy/EByLuxJDEZN?=
 =?us-ascii?Q?pOmHzsI88ePQJqkgxqvpvGi9Oj+kNLzGAncKV/17+94m79rdEhRs4ZUFjj3c?=
 =?us-ascii?Q?8Mg6AACVn2uSnfeWVfNkiNXMNvOt+tY+zZ8u8B9hKU+/9P4B8bANoIfVll6e?=
 =?us-ascii?Q?qasn0IUeFOvLNZinB9KO0C4fRlo9wVXxjGKGGfquZUBaWj7RZDfCBqjKt136?=
 =?us-ascii?Q?KAPNzSOWqk+R3+p0AAnTIa8JyYTLphO40XeK6O2yXXFOs+IjTIl1gfCvWgc0?=
 =?us-ascii?Q?KdU33crQBVbSBvhSxAgv2A/gV8d+IDmwoFisG+rA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67074595-1109-4a61-b3af-08dc9670e207
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:17:55.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wucXtLN6snvdLHb08fCfi7spN3ZBU+eZYix9ipErGte3qq0X6WZa0TnmfKHhT3THQYTs6VZgMvxLMiWvUx2WVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-Proofpoint-ORIG-GUID: rA1BUl6eRHUzYc3bOD4i_6hJPHD43CmJ
X-Proofpoint-GUID: rA1BUl6eRHUzYc3bOD4i_6hJPHD43CmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=766
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406270046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201183

From: Mingli Yu <mingli.yu@windriver.com>

* Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below
test/nfs/nfsacl failure.
  [19] $ getfattr -m- test/sub -- failed\n'
        'Can\'t exec "getfattr": Nosuch file or directory at ./test/run line '
        369, <TEST_FILE> line 24. != # file: test/sub\n'
        'getfattr: No such file or directory   != system.posix_acl_access\n'
        '~                                 != system.posix_acl_default\n'
        '~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/attr/acl_2.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index ee86ce2cae..5ac085c322 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -68,6 +68,7 @@ do_install_ptest:append:libc-musl() {
 }
 
 RDEPENDS:${PN}-ptest = "acl \
+                        attr \
                         bash \
                         coreutils \
                         perl \
-- 
2.34.1


