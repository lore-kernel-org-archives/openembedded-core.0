Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0BDE77199
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 09:25:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26895.1735896309821693155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 01:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30983b852f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Xc0o018516
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 01:25:09 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4rf4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 01:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5QFCEC2SqEG5hC/HJKRvboOulYgcSM5iUMOZkY3WhrLqzV+UQlI3Bgv4rwib5MOmDu/AgrVLMvcSlSxDET+gEkr8/IGBl5TbiCHTVT2WUjRSkjZvecaBCOqOYFdYkXf7yyIzPcDjDjAvYb3gl1Y3RY4tzuS01HmC+qCUVqxij86cqXlF4htbmMxla0I3ZGru9z+2k0DkdXsGBijxLXTJDTOsOa4jTlqaFMhd0dIil+uOWuLwbXzfbdoASRQi3qPGQYxIrPzj/D76YOqQ0mQJAzl9Vifx9WEqahhm28QGUnInwdDfRuhyaUtrhu0yhPKVKWDdq0uMC5iQTSZmTTZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrvtQPbK/KBQ9anXjXxK8XZeIvASkMuGhb7yEHqXlGg=;
 b=wlO/kGJE+gqLQafJzzQ7w+hRiwwz0XQ5dlRzoI6XXl4Cwh+h0J0aC+CzBbDSf/1On2S25mbl/F5YbFftz7FZ1C+kumTV/ySCfBlZXWjw45bxMj9MtWQM4GSgPuSWisFHz7i0Auc2dU5y1Yy3JjHBs3bxjWvD10D5KHLAcyhF3XMsXqgLY32iFbZHaxJgd7DwGoBSKYqTg2moRCR6VFzWsDp102Zn/c7noJhUUSUEN5TUi8kLBuZJGojuCP44iQ1cV6rJckRpVvEkssquaw0OIbC5PBkkgaUNgPg34EAV7xNOKv4ZoaYjchYmNCE3z22ZSXNAlP9nqfxYM1DdXLDc+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 09:25:03 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Fri, 3 Jan 2025
 09:25:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] util-linux: add volatile file for lastlog2
Date: Fri,  3 Jan 2025 17:24:45 +0800
Message-Id: <20250103092445.566172-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250103092445.566172-1-yi.zhao@windriver.com>
References: <20250103092445.566172-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 06764975-eb4a-4866-de14-08dd2bd8810a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oHhp0hnm707FT46Rqy7ckBqcVZbSWsyshchd0eSjYP6Gt81depdDJ3+OXpIA?=
 =?us-ascii?Q?oOTyFRrRBNbvsJObRTaYzU+d90uai99u5Ny/cgrZKnpedqDv/WtP1nOLPbL3?=
 =?us-ascii?Q?rdRcmQFWBCullyKGR+ybT/ZyfYy1gUsEyAkCfIrtPIzORClLhqvg9yCNMTJb?=
 =?us-ascii?Q?Rdw1xEuvHkHzUonC4anVztiGtPmHYvUGRA3ynnJj8zPpIOmhWc0N7+z/VHLc?=
 =?us-ascii?Q?e9hIe5sPBU0SEitSBpF4IqLiKIjkIQZ2lFAMAIwSdLU6UUpRmWjb72ut1Za5?=
 =?us-ascii?Q?19lXG79EgyTj36AAse9K2FPVsmPCewRpHb8o1v8ADukRSLFefgWbZtpFZr4F?=
 =?us-ascii?Q?xanZjzQkDRuU5OHoCtfkyvM4/4hUjUeV6UobJ+OWflxMMFOShX8k4denJehx?=
 =?us-ascii?Q?Fh8NnddjPlsmLrurMQO4u26uotyLfD5AyH7JwLjF1Ak+GXEXIbncY16Nu8+Z?=
 =?us-ascii?Q?81Gd7Zn0wj4kRzg7dmmeiYCZ2DgQVJCd5plBMcIDqIdtZutTS31eB0EVTq8E?=
 =?us-ascii?Q?4mwjRGdq6kS+lcu1AkIVAi7ArB2w6lUNB+K8Df0hkKjEEIyrdECkn4wKr69j?=
 =?us-ascii?Q?AVUQuoH8cfkVN5jd+dwlLi7XQBxlLmkSnlmVXv/2VLkOoqbL9ykm2cGor2Ly?=
 =?us-ascii?Q?96ixTrlX1kSnfqYFmNdM8GznFlX1IAmZsjW9Y7PpQj4xCjMB9Or35tFubtOf?=
 =?us-ascii?Q?rrYedhQS03zFZUi4gkztZ9fR83dOULUIfgCcVtEPiNUehu0Y0/xfBjZ0lZhJ?=
 =?us-ascii?Q?3HssywCgya0vB19cHCw2mKMdCkwiCYDFeEENRYyvfo+U8V4LTrilXlKTCCQf?=
 =?us-ascii?Q?YnX6Kjeu8lhKUauw7pBDvcLbELhI+QPzqqQfiCUXHRhC2aryz4um42yOr4+r?=
 =?us-ascii?Q?LfG3nX54kOsLn2SXHJl0iKE2ATQTh/5ZlGoc0JOT9V9NiIDmQdT136lXY19H?=
 =?us-ascii?Q?zTFav/oj1SFU47l2Kw7fDsOi2UDml+UAGh9rltGm2bEkAV7BUtXC5pIjQ9Vi?=
 =?us-ascii?Q?x/ckik+wDJPubpbvt1kj6itsad+hrbOY7uXkdKyoMEMJefL147uHeIsu57Bq?=
 =?us-ascii?Q?CoGTrwCo4g1D4nUJntsofLMCY0YhaRf42ShBrulmre6QIAUlLAXkoJcAORif?=
 =?us-ascii?Q?AqUyDtuMFVN7AIYca0AYKtSlrm5OxrlgSOfsFE+KV9Gs57eOJdX3PiRSAw/9?=
 =?us-ascii?Q?1tVCaLbV6twsqYZe/h0BJwULS1hCzzn4ATiS8T/16W4QH1Hzu7+HmheEsyJ3?=
 =?us-ascii?Q?lrgAXNmgezfVxfEo5OGo/WqQWnrS5wJhInM2fu1JGJKt1v2ggxB8Q5tWatoO?=
 =?us-ascii?Q?wn6SsmPzUx6/uU3zrdSROQ34GBpQjyqMAiC6Fr2YniFuvtXgi/Br/CdbkOgz?=
 =?us-ascii?Q?M+wQMRHnq1tHxcuRg/yRnVrP2mx2DPxbJhU8xHziN5NMWs/VyGHn0MJc9g7i?=
 =?us-ascii?Q?V+VsxbNbA5wf5OADcHMGHyUBAt+k4aqf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ijhXLDcUUdA+gYdfLOsnM/s1pwCFHq0tH0ug9CwF7NRJxbxu6ld7lJOZdLpP?=
 =?us-ascii?Q?kzjTABZouh12c4FDmwUtnxmlIswq/SfGtI8io974um93UHMLv9bCnvNqpPaQ?=
 =?us-ascii?Q?jCgavlQdinE68xmhwHmyo51KFzCEWn+39y5owj2TrCJvdVz3hrmrl8YabseM?=
 =?us-ascii?Q?Ai64wEcJuS+NjdJ7XaVuQE3tC12axnhF69+iiFLtjqcg8mf4lNxP5C1Kz1mk?=
 =?us-ascii?Q?Wuz1lU3e3Xh4cJ3rwoXbgyyrRcqPecyenD/Oljpu8nmBT3m3ePYFQZmoxO7a?=
 =?us-ascii?Q?hSi/Eu/7vmm4xAkSdX5SwUCvbYGeVe6DxyOqhM/JJqvFTzH0jYZmpFeNsoFP?=
 =?us-ascii?Q?mswIBdS9vTU6ogN4qWC+XJsOvjnYNBBoT4rycpMXNaaw1yHx0N9KlI53pD+I?=
 =?us-ascii?Q?EGBJFzUFLzzAvUY0walzithweTQri8lKK2wIn5uzhILW0/aBnq5RklmsFEvH?=
 =?us-ascii?Q?nRR1m8LDKj33r0mv54lOp7ZZCDn22SaOFeqGGoTfdsao8gV0RuiVga4O2h8L?=
 =?us-ascii?Q?YxGEHoqbP3Ch7KSzxY79VfhytcaDu3P36cDwdPeNF/9nO0t8BeaP4zxL4mMW?=
 =?us-ascii?Q?cu++CBynoHdroX9uQaV6wcFI4l+FsvvKGdZ1mzcp/EkzQDur2Yf9d3lOLwg3?=
 =?us-ascii?Q?WgnuFDpUJaRpFV7d3rY9Qf5gYBp95ZJEOByO5mDTuAMA58xshdHPaci7eitF?=
 =?us-ascii?Q?QDPH2PvCP0DLcM8wCWAU6gno/cKstdoItsj7CyBdPAtrlPoHOpVYLaE1NfbD?=
 =?us-ascii?Q?URi4xXjgWQd8rjnnlpwWJv8dKr2MTlGnxyZ18eTrGC85NQiMSQCRPnIskXbu?=
 =?us-ascii?Q?vMhujEyakmCPPkgKQGAldppuJ9MnAg3gqoyTvFNSfox/PQ+PRg/OoLEmoKU9?=
 =?us-ascii?Q?OW56b6KQ4yQR+/m9tpO7wHG7wAzuyOuSpNAyPeYsvZ0kCC8xWbcJ8CBiee1m?=
 =?us-ascii?Q?OZdpTb6bUV5sekMlyIWAdODHJFwsLcR/9WWs5tGm7mDkWhBdJcczntV4GmPa?=
 =?us-ascii?Q?LXoMM3GGZIWwUrRwVcRbp72vfyJ9hUIl6+baxNI5I4tiOeDH/p0tvcx7NCUt?=
 =?us-ascii?Q?trnC58DPTeh5kgnksxuxmJB///VI/BxgwGpGD0NOFQ88m6cD2+ti7im+7GdP?=
 =?us-ascii?Q?uJbpmIIfji8/XPuWI1pCimZsFfzHRnWIGJVTWdN16KqjWKVVhtyTIVoMJerH?=
 =?us-ascii?Q?abW9EI5ADGk+y7wNZnJ8AbLEhLPVp7jBav0ezzgqCuuQK5glXqy3u4HAxB4k?=
 =?us-ascii?Q?IVpclmu+N/rI0fZtL7olaYw2s3n7WYVm9CeUo5jmnf26oZPeca6d3sYbyny/?=
 =?us-ascii?Q?7F+sGRjFDa7L5BIYz+F+yhz88vWP2uxRaChpx0F1UEylE2kF0EOdOSgg1fC8?=
 =?us-ascii?Q?4j0NoxwOBnhCd6RvLE+lM7u3kmj681hdKWTcCvuY3p7qz5G2BDe0Uzm9yw3M?=
 =?us-ascii?Q?35s9x5WmnyvCWYUS+joP//CKrPp7SGY5El6GIouicIabI691KQ3yxZ551uw+?=
 =?us-ascii?Q?6N4hHdPVsZokStUzrVubIhXLeFaaliZZevas0qku/gWC0E9Hm+2Lzd1pghbf?=
 =?us-ascii?Q?+V0WW2py0o08+atb1nbs2NAOICKwnCwYCcWbUM3b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06764975-eb4a-4866-de14-08dd2bd8810a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:25:03.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMsk3z/+SpH+73JQEnbam7FRZyNu8kqv7fTaokbXPPxfZqN8BTI0BsdW6EeIRODZfTi2CXGgXpEeP9yW0kziDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6777acf5 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=kDmmQspSaqKm4nw16goA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: X--VyYLuKhr6r1TlyhuCq4IbbLFgTjsB
X-Proofpoint-ORIG-GUID: X--VyYLuKhr6r1TlyhuCq4IbbLFgTjsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209329

Add volatile file for lastlog2 to fix runtime error with sysvinit:
$ lastlog2
lastlog2: Couldn't read entries for all users
lastlog2: Cannot open database (/var/lib/lastlog/lastlog2.db): unable to open database file

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
index 646bc05564..2c7dd154e1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
@@ -129,7 +129,8 @@ FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so \
-                         ${nonarch_libdir}/tmpfiles.d/lastlog2.conf"
+                         ${nonarch_libdir}/tmpfiles.d/lastlog2.conf \
+                         ${sysconfdir}/default/volatiles/99_lastlog2"
 FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
@@ -222,6 +223,12 @@ do_install:append:class-target () {
 			install -m 0644 ${S}/misc-utils/lastlog2-tmpfiles.conf.in \
 				${D}${nonarch_libdir}/tmpfiles.d/lastlog2.conf
 		fi
+
+		if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+			install -d ${D}${sysconfdir}/default/volatiles
+			echo "d root root 0755 /var/lib/lastlog none" \
+				> ${D}${sysconfdir}/default/volatiles/99_lastlog2
+		fi
 	fi
 }
 # nologin causes a conflict with shadow-native
-- 
2.25.1


