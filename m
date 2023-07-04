Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DC8EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 07:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53669.1688456380620896136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 00:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XjNArK4+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65495b23ec=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36473i95023971
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jul 2023 00:39:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=KEauNNlEE4KNsbzZz+
	7SVSBvC28Ty5woLA0NbwAZ/RM=; b=XjNArK4+jK2y/++AiM+iUy1DQxTnIJG29f
	PX0B7mSes3w1DDdmPMnLTzEpOtPMuy+PSzec5NPbNtB9M11mvl2a4loz/BE3PEBl
	Ka0/g4D8SE5hMOYxyVMKawCsOS96EYUuv/7QkIwgR+1Qt4Gp0jOH74D88w1R/W1b
	Z3hz94yo1a3KRkg8RBZVWmD+qroZvmhGK7VM+Vl9jDNSUI8iksL9JiAOpTKbe8JF
	SuC1doVmNlJZDovPR43DaONM+h8XkARWc8xJDMktCWeFMZFZNuS8NF7CwgUABGrH
	uvUIEhgWKr1u2jQIzrswaORD92Xe9pp1pkVF3ZTLldhfvFldAonw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rjkneswpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 00:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhAJaDEjaLK7zkEXwOXrGAE8guuRs1CNPtvYWP5Um9cBtvJQqChiPpuAdaI+9IVtMqT1DNUxbcWZmiGNK0xBfNyEg5Jc7+RsGjll9Hx0CW6yrS9Nvcwqk6HrFSkk780/Bgo2j50n4kzhGO+ely4dHaTV+6W9ljrgvakGcseKn6txNEiFapRlQLFrG0QMAuBGyG06pxJU2VJrmU5P3CAkk/9SHZOSBlKfe7qQPK0yG0+N/spXStzUmKhU6a8NN0M/JKctEOm14KdHZNKlN73UZxbqT9CWJ0eC4DYpZAcF36mY37rd+u2FdLbESQSPgTEYgZ4S6ueIQU1EmwaqDGkciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEauNNlEE4KNsbzZz+7SVSBvC28Ty5woLA0NbwAZ/RM=;
 b=cxOO4CuNNOYD25N87oSn6EAmr2ygQGu2Oy51Jq5gpMJkkKVOZJ38M91Hlh65mdm2JFGbS46f4u0QQd9KdUyjKWiyIbtKCpojHff45MAeGq+AlBysMkiPKBZfGX3jmHuLRYr6EU2KpOCGpoCXoSDrq64aJ33/x4LleCeNk5LyCe9I+29+8Z9bgEwcCnUlCjnaPlrDc64gvXP5DCViEZXn4+wGv6Vsyst0koYqBysTsCFeCk8yd5m4WroOStr6tdiD38XLAEKBbNcUsDDyXkK5f0hjVUyRJ63lY8ymjPZh0oMjTuMw15CEeBX8b1tdGrpITKdLVnm/SRlOcPVbmlJMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:39:38 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:39:38 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/5] mdadm: fix util-linux ptest dependency
Date: Tue,  4 Jul 2023 10:39:15 +0300
Message-Id: <20230704073919.1593400-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::17) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 1590a178-6dc2-41ee-f8cf-08db7c61d1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BVThQeNFn1HgCvWuUrHprEYRF4akxfePchFLHttP+9aXCeP8ZRD/qRTmcJEaQOXOdy6ToonZzmZOGbOu3PtQY03m0UX0KdkLVa47EhzZplxr8YUisVjCC7SsAtSXBZU1BL3azxlL5HFM+bGunCIfjJ5h1TnUZlZBoDRfEthCdmdaVi8uDgMirKdVgeArkLpGiBs622LQ1Sh96T0gZvNiDtd3IJO70yM50ppyIMXrbkodmKgC++lQEuimHAQT2IHlY+SInNz5QXbqiJsXq64jO/GvbBmVFOzYEMnSHe4W8QOjJI9X4Yre/Zmuk9chuL3T26gvl16JicZhDQZBEwynaVEh2dyu+LpH4pfd9e+0beQlpw7PaTmOFLtG8nW08m8od9VqEOPz9mRISMjxVb0a+e97+6c//VssYlKpF1UfZERz3a1cuoHj2fkCYfX7Y4H7hF/7ASEM+uMQdX3uCNO6WeMWvX9iOKw3f8yWXtw9+Zk7yLy95XOdoVGufJFY6TZSqYKE8orhJqY+fGFMqS2i1X+lnxQSGupVEtEUpEt1o7ObMnejpZmiLDtA0e4Npkb53GMDPZLyBOoOYn+3ZjV66lj+LxNUblb/cuUXCnWMYIHGLxxioCFV+Ats4uDIdPgJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(451199021)(41300700001)(38100700002)(6666004)(38350700002)(52116002)(2616005)(83380400001)(6506007)(26005)(186003)(1076003)(6512007)(86362001)(9686003)(6486002)(478600001)(316002)(2906002)(66556008)(66946007)(36756003)(66476007)(8936002)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?np6FeDH7RB3dJPbDrpROuLz4+z92ujmXYeVY7Fd7Gq2Q1zKbmXeqZs2fZeaL?=
 =?us-ascii?Q?wl8hLRhmWVK0xhrvM2zq5j91V6WHtU8jRfQDBYLpwfxDsbje6i3Uz6RemcQO?=
 =?us-ascii?Q?4fjSoLOkJp0JKhLmNXOWpLUGg1UgQh6ik2j5bS0YDYMpz5yOFVfE4jmXl1Gt?=
 =?us-ascii?Q?xVObF5+m+LofKAuqhJNlYPuwKVgbQVg+2i/dZikA+631/42fMX7ZnF6tY8IU?=
 =?us-ascii?Q?zZUsn9nsuAuqhrYzu1AjmguL/VpDuvbXGpVMPy106BJ8mFwcJghvuXptol85?=
 =?us-ascii?Q?U4hYCAjgtHq8lPPZFefSzbbEXbYS6PEX8qD7HlN5ACVayKSri+L+2FJjRHoB?=
 =?us-ascii?Q?Z9yPFv2EunfwsrNhcLEO3n0YNWtHmExVdtFpJJ6t/lPrwobWfNbWNLivpMFh?=
 =?us-ascii?Q?IqZlyiqO2raJ6OQM17pYgLWTfIdfLXPWcMWT2+L2Kj4godigEMHoxddITtEf?=
 =?us-ascii?Q?uOkOFXjF5UslXuO3BkSBtHAfKmlZvZ7aeLd1q4AiB5sqxV0MNYAt2iKqtme2?=
 =?us-ascii?Q?YjOKHa/mz+3YEEXVuF5a9+TFdaZshCgNOFCbzTGBM1ba647Cl48CSD7GYxbO?=
 =?us-ascii?Q?vOke3nXnhVBqWB/M+Jlllxm9x9h5OZ67FRW9nX3eXfNUHFk53/6hI/e1ZN/1?=
 =?us-ascii?Q?po58OydRZjKJIgRjl60lR93hkSanzfjMKjwgQao7AvkHw1ZZ29ybRWSt/5CN?=
 =?us-ascii?Q?PViqoSFagqutxjMYgpDAClNiQHWlNejp7GDN0CYvGd2LaSpKr4XtpZQl/YLT?=
 =?us-ascii?Q?IA47ay1XWMz1/eI+gg+AXOypzv4MsSMSTeaKsxyAdDAzgmPz8mK6ce6dmnD5?=
 =?us-ascii?Q?hPGUhkBXENfKy+ux7yTl+R4g90H3IZav8ib1xS3g4DHTkQ+CiztD/hgox1CW?=
 =?us-ascii?Q?+Vtgc/ox1YWsxYaVy/zJou6brm8BRIeq9SN94qJGH0hgrf7yhOkq6YSEgEbq?=
 =?us-ascii?Q?j5f6RshLmLcdmvLqsIyd3JMcMiSiFPuoKijF37Hfou6wjWgrPccLVe8dSKN1?=
 =?us-ascii?Q?te2lam2v99OOdZ6mqLSeHKalfA1wJ9vvqgRxxFsdtPMjzryx0n9jLxoBbArA?=
 =?us-ascii?Q?DQwH6whUfu5QKYhZwvXwykdTrzZUPFqf3zuvYvm3JdmvBSqZdc5NB4W1uPyE?=
 =?us-ascii?Q?/EdpHXrU8/gnbx13QxDTbTagURBCQObnP/ExQoLvce1szYnoclHexpNBpk9r?=
 =?us-ascii?Q?vEJuqsDvCwvL7FfitNZaTGPl/mwX0ZY4szCDo+s8I7N5Ifzj3UySiycRSybb?=
 =?us-ascii?Q?H8iKJN/ORg2KuCIQCwc7Y5vgIsO6XXBxdcxGlVub4yuUgW8wi9UNmjsPvGGh?=
 =?us-ascii?Q?4m2kF6GdHrQcf9NQB6CCAVwZRP+rVSwQhAoDHGhGdg2esgV9f7K9KBq4fDN0?=
 =?us-ascii?Q?LiM6v7WjeTCWtoJQxGhC1M4qMCt69D6uKlUEsEKROCuDXcRcQvs2cftyr+hT?=
 =?us-ascii?Q?1384TxpfcBLR2oXnOOg2KQGScZAcvbq6HZrZiqbHKxD18Pv2f7PYG+jElN89?=
 =?us-ascii?Q?84UkoTIt/sVzGWhxk0Y2PE4WwcAtzqKBfVTwhj3r4U6zYSR0oaIrAl+J792v?=
 =?us-ascii?Q?ipLR77zOvsdG+BXByMPziCI9NZyENKpn7yy6OLllZX8PETXIOPM1SUBachLM?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1590a178-6dc2-41ee-f8cf-08db7c61d1c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:39:37.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUUwb9fPlVQYmfrs7Njf8FFV3uk7UHQbUFKx43ubgcIJZEx1/g2CHPjZ1GSxj01HSCOfoFKB+DOyAqvMaY5zaPkMSLgMTafhjbzLSwo0i2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-Proofpoint-ORIG-GUID: Phc0KkIyAyExrLrpmgnf8QNYGEWjzi4L
X-Proofpoint-GUID: Phc0KkIyAyExrLrpmgnf8QNYGEWjzi4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_04,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=633 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2305260000 definitions=main-2307040061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183813

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Trying to run mdadm-ptest in a core-image-minimal build will result in:
root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
BEGIN: /usr/lib/mdadm/ptest
which: no lsblk in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
lsblk command not found!
DURATION: 0
END: /usr/lib/mdadm/ptest
2023-06-28T10:14
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Remove util-linux from RRECOMMENDS and only add util-linux-lsblk and
util-linux-losetup to RDEPENDS.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
v2 updates:
- add util-linux-losetup to RDEPENDS

 meta/recipes-extended/mdadm/mdadm_4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 14de9d88c2..bcc0175f67 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,10 +101,9 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    util-linux \
     kernel-module-loop \
     kernel-module-linear \
     kernel-module-raid0 \
-- 
2.39.1


