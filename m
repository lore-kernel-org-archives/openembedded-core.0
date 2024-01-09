Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1BAC47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 07:18:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11730.1704784685916491700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 23:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17384cfd26=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4095wor0013860
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jan 2024 07:18:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewekay6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 07:18:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/QlJ7pScdGqcP8QxF1HGOGixIHSZWVQ8Sdt8kPVGE/YGTWh/PEd70GsQVyEq+koXhicQOslKY+jBOAN/PZKIDZgMpNa+SfML8ez2tV//QWJicFRf3z98c7brfyymglQNzcA8/jqOxDr5pwxHzVDMCHMU2yl+fWoxoEuLkFSEBhpcCr6x1WXmV2jDjGYt18LCqVo2XS77AksRgxIaNXUnvB8UQDVhriTlvQeDZmp7UGoi+zq6GmNix7YAZ/AsJirMW7f4x/w1TTLlA8cE8ulwrFcbiMRPiSnnX8A9JlNkLa5ws2f9lvw2dFyGkkvrwGY2ROTfNJ4MEISl8PgZsXl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDkXnKrWS76ZzPdCQan/O8TtLd3q7ddBPZlNySkTzjA=;
 b=nyULH3uUVUkGJ/aNX4GH5F8S64Uf6FlibhrTHT2TcLnXquWt8jplFXpP6mvga4l20RRiG8bWTs7HHM8poL55wAEqaYEwPsjwjTML8KiynpaDprHQ/RmOGYxSKGO6WmWGXcUG7+F32p6TfYKqYjpskfaaxpToWYamf1oaiedZGlEX11wIkw5MDCPMzKU7R2F/NdGWj80GP5miAytUdB2MV7nruliyZ2XAmjHb00Wl0eypBEEANsO1G1upyIr6kJ+VxasR4DwC49zp7FrFRXHYkbc+CUC8j/4rCqlSJbfoUiSAVKM6oovuAsMAja459Xq5bP00yUNOFZVy8+7KYaP6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Tue, 9 Jan
 2024 07:18:00 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:18:00 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_rpm: proposal to use internal dependency generator
Date: Tue,  9 Jan 2024 15:56:41 +0800
Message-Id: <20240109075641.993044-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: bc15f82e-4430-4e84-d550-08dc10e31c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vVxYD/f/J2vSauFqgjMacmwdtrdWeAzLt4VnSVIbgArrJJXsnCeOREHWmmj9TMZby6UdR9Y6pl4VBuwD852G73aCXVs43SaWSqDVaiPOioOb3jZawvm+5DmHqrUP96lYJDdu0XA36mNwGpOE2FHGP4pmkYGGiaYcvklQ68uRDMT4SvmcWFtLaHGlfhj0DsCu+uPASF/RMEFkYaXv3B7sw/df0CznHv7nomJGnDLUdKgXA2bM8Y8r2W6u8Tyzdpalz2FmBE2ULzTITF86rJX+5Zbul9mIWIE46/WIjuu1mcyxTDxbJuf3NvYV16wFg7GE3gwuIyiL12tztgyyyh4jo2MOhz43Qs5pWLb9nx4l6ftctXLIyLXiG3oMjljUhNFYB4uluElD0mCp08mJwHJA+tlusqBX9G37XPMeytCGWT+QsDI6gKYDjWLSTv4WkYALUDedFqZeu7U8ixmoTM7R9LoiyyxFrY1Apq/mJs1JvpRnNt3qskcNau4RXgnAmsFq5t52wc5Md1x6o1jzmm14HeomTwUkV0AHHmkqXP+/Po+AXIO99pP3hlpObXtkDUTN/3J0xjau3scasyc1Lwj0dnWUzYaOFqaKFsNZpCWXRpnCTyCcIvoMR3/JO+iZbbYQflkYWTMF5rlBDeCTQetpQxVzWxrDvl2w8E2VznhauAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(376002)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(478600001)(6666004)(966005)(6486002)(2616005)(52116002)(6506007)(6512007)(8676002)(8936002)(41300700001)(316002)(66946007)(66556008)(66476007)(6916009)(38100700002)(83380400001)(1076003)(26005)(83170400001)(3613699003)(38350700005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rMwU+PDyXe4bLczO6D9xbq0f6f6XVqkK/u5HL9oVyjgOroNvzuIPvMKWr6V8?=
 =?us-ascii?Q?PEtv6kc2Hv52LHWrAzN7WokCi2AyJOXOJwG/vUTPyNRnERKBFLMH65OYIruL?=
 =?us-ascii?Q?kh0XtA+6wlQESehH/7ra8+wdNbsGgF9dyvLx9nVqvUKUx+Yz6fsK0ztIkUHL?=
 =?us-ascii?Q?snTU8TBvYoZxgdj/LRrbSlXEn+sx3nRvZZS3DYeJ0s8NENmvrvuMd1KjEX81?=
 =?us-ascii?Q?muTBHnLvjVmnXiAStTRxz56M4EQija08Jp6Avl+j/BIsUpkjgX2/i9ZgXttA?=
 =?us-ascii?Q?sLaBoWWI8q7CvhcKWbF+ZbUDOm2spPfuXaS87LdgMy32Ji04EOaOInGj3OLV?=
 =?us-ascii?Q?+YJnfhMANCP6FnUy7m2SZr10LHN9JJOzKSUoBF9DzVBW3lk7HWUxvvKHBEZn?=
 =?us-ascii?Q?YfGDnm1kOaX8oaa2mzdwZ4efx9a4WHqg7DbVzrWhzGvq07fqD8BFlLCeS5Ks?=
 =?us-ascii?Q?eWg7k8sk72iu0MxoMnhEXqgOHqX5PCH1JMcNku5LDMkWwfOTedx5bnJdQn06?=
 =?us-ascii?Q?bzHmTRlCfcN0MTbTJ7Z6apVzpdFGvUdLUGE0qLEjGiiPkN6CJ1cNif4UDu4+?=
 =?us-ascii?Q?2n+zwZhzg2PiZQMpHSTpaPmAGmZM+qAzOaBOVHVMO56bvFNspxmmp9kTsTQ5?=
 =?us-ascii?Q?wuS20adXngvf+D3UZyWoX7nC4m1jJmH+V4BlCpwLKHOpdk+xy07pw4bstVEU?=
 =?us-ascii?Q?mfiaTD1lEkwZ7V1VVcgze8HkVUMFXCfXDwaIJ3uDX+KDKJ2K4v6SVLHluGi8?=
 =?us-ascii?Q?gSKioUzHMlWN/8SqEey5gh0VdtTNzVjE40qgci9qFPWksOOM2YQduMRA9nOS?=
 =?us-ascii?Q?ha+paFaiECMYDpPh13Njl+Jxehq0vHW0a7/t+0DktoAjRuTqOMmOo22DaLpY?=
 =?us-ascii?Q?jYqL8FpXN53w04HmTReHr6f6sacbIW0/U5JVqd7P7Vqzoiuu6B12ibCffFXl?=
 =?us-ascii?Q?O/yU2YHwwOd1EbOYTqljxCe5GdwZh9IEaYPmCDNFLR+EVy+buXoZBuLF4hJ4?=
 =?us-ascii?Q?yEk9XUw70z60RyouguxzW4mx+u1+UGxP81cOpxecUYkrU7EfNbzbRcBzIIvW?=
 =?us-ascii?Q?sL9Dw8eC3COQtQWaIhMlpTGUcCfZ1cd2xG8d7dGly7xGNiJ6w8qXbJ416erf?=
 =?us-ascii?Q?y5C41/AP6NHLNm5TSsU6W7JKwDdJ9Sh3vytyZ74PpVSKhkYbjuGtZc0aOqLW?=
 =?us-ascii?Q?nDWRKWqOsGDNdn6S5zYZIq8BPyPmujEu9KjUA6DPQOQJCmoM0j+sNoJmHk8X?=
 =?us-ascii?Q?F7nTazl7BHCq7ITo6VQgux3EWCbtJVcmPKA8o9VfbldSTRY3MSHkr6rAUaKB?=
 =?us-ascii?Q?DjSYl10LeTcwmJyio/twxhKaWy7qfGHbmAzKg7HbA30ncQiKJNRk2Ey+rlg6?=
 =?us-ascii?Q?5DQTyh53twHh9GxVd1+ceURMzCC+pg31zs1JUDIrnkq2syDsZfH+gR58ZfwH?=
 =?us-ascii?Q?fVCnztbK4tIsMfNkzQxM1bUiSx81wx069L5Q2kwFXzp4FzzVz/1VAUrd01cP?=
 =?us-ascii?Q?LpJHbjwOpsq1mMKAquAxkViUdp/0QAdY7TOvgGe4JctS0VwfXg9mwTUCmn1w?=
 =?us-ascii?Q?PVx4vLAUPBTNMNZnHBaRP7ELChFYB0TQa4k+X7CQDKlHVMFjJAhj4Urw5ivz?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc15f82e-4430-4e84-d550-08dc10e31c63
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:18:00.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymNWz6/t/t4njADjQLhEDzbK851ogOtPRIalK0kpwYpbgRGAsw14g1Rab0/X+FAbUAdM+zYgcT/MhwA0+kp0WL3XH8atSTFv+JzdXbragxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
X-Proofpoint-GUID: IidJFxJrYY44vFqd3nyXoNw68TVhdKtR
X-Proofpoint-ORIG-GUID: IidJFxJrYY44vFqd3nyXoNw68TVhdKtR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 mlxlogscore=662 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 07:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193444

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Currently we are using external dependency generator, the rpm upstream already
marked it as "Old Style Dependency Generators"[1], they also added a warning message
in rpm source code to inform that the external dependency generator is deprecated[2].

Since it is only kept for backwards compatibility and may get removed in a future
release of rpm, so here is a proposal to use internal dependency generator by default.

[1] https://rpm-software-management.github.io/rpm/manual/dependency_generators.html
[2] https://github.com/rpm-software-management/rpm/commit/cfcdd942

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 2fc18fe98c..05cecee7d7 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -681,7 +681,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
+    cmd = cmd + " --define '_use_internal_dependency_generator 1'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
-- 
2.25.1


