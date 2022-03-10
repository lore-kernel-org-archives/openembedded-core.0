Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA49CC43219
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:10:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9621.1646921424096544511
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PESQQ32P;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0068693661=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ADhGV8024967
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nG81kpPSybB3W5iC41MV4cSoh15Nn3e3yUScl829bsI=;
 b=PESQQ32P6RtoY0/WxkPIaH94TMsVrzbuabGkBszNqf5cyHKWh9KNtT0Ytb4ZcF9dEl4C
 Vh825/3IlUaJFz9/pg6meNmWtIStdrCg4j2mfuZ3iBgwe9ZHb/9DRWBkQZ0BIrJW9zI3
 gkAYHLvrFmhcWRmL9HYf1AuTo/NgKlyhkbBRnmfYQZHBT3hzxo7tkL06ozkjFRO1MH8c
 LHyeb0WT0gCglraXjPpuFWWHV0xaliXKLRGiyiUDCQb5pcAataEhEJQfWvyVZ/KRZO9z
 cnjJgKEqOhqPQMrjpvFzSxoXH/8qwxS0IbYNFrFJcTKpsy+KqkAzN0EkRdGPs7CET0Ge SA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ekxu84c42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 14:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWyiuqDgxCZlwPJxAb8exALqvmwlYd5BPZs6tQ+VR40SrHa+0wJ9xkjqBbsAmbuh9VIlsXNmEwGg3TwCI2XXGkVhnGLK3wndwHyP3cmrNTqVksNoymAXu1oh4xU78q67uzDz2eJx7eq52QY4u4U+yAMH8Qn8VY4L4l99RRWupd4JmNtJ/yk1kBEq8R6CgG/8CUR9N4qtddrKGTsruWqw8VoH51apBCdD8RUp9QUDWlEEuaWzwJetxAPzCJty6l02yh3xzyzCLwT1Z6XRy7/CYQlszP5NtpUpGS+70dE2sQWKyygPvLLmUnYH1wjMSsGYVaaO86cFwoFKza2bbz7SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG81kpPSybB3W5iC41MV4cSoh15Nn3e3yUScl829bsI=;
 b=WOLjyyJrjxKh6CKJ86AemirMQnRStsT2FGi8/gNFoB4ew6idRq1R+k75PRsqoJbAWfveoZn6ZigyG+sZPpsehkq5VoNnrpR99TMhbdVS+QEZLGm6e4UdaHlxctdzDRdQ/AOixci4PfGmWNTqH20aq2p/zdfMEr+1sqdVg48K9/xdn5BMWtTWTJY10AVgQpJNEJm49Vy3g0RU8MeSXXRpfZDAe9lDPm5OlCNwvV7VX+AgfB1GtldHCMeem7d6LS7PiTE707q1Za1anyf0R4vCVxelWd1rKAqViWuQfICSiLWeOSV5+ZR4axhIh/bTDNNKsS26Q70SaZuS1UEbXZLs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3095.namprd11.prod.outlook.com (2603:10b6:a03:91::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 14:10:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 14:10:19 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iptables: do not install /etc/ethertypes
Date: Thu, 10 Mar 2022 09:10:03 -0500
Message-Id: <20220310141003.22627-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8f2ee81-635f-4876-0252-08da029fb53a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3095:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3095A9E412891ADFE4C213299F0B9@BYAPR11MB3095.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	whSugLU973tND73NGLN21zfPh5gKFa7nJCpcuUb3K1TAt7gAgVotdD46hlGkOWUH2OmFpieur2M7jc2sfnJTEPLCa9Y5tVPu3yDAtm6e+oNTXDa4pntS6PiQ1Qe6AV3DeTHwwfSacg95L+ZuhD841bZoxDqnFkZW46ohpnluEjMIcuTpvaOKsDjMP5xEoYJTKZpgA1rhgJCbTlz0L7aqhkL5Rhi3p0zUFXJorwpKu2bsaPpNmarbAzgOcOfff1nMqSmh3I4td+is8SdSsuaIT5nm2StCb8ovrLYGOIzxT77LZ73H8nAH7l1EgKNcHRPzvEE/EialCBp3pheZHOjEy/qK05YjC8UkXvUOrpdFsK0x52SQ14koBZHNM31KIAudvGqcJya/r+d5QNEpdM11EwTdXDldqaWTn0iJtNiQgRxYdupHyPM1aWVeWprvaem72p7oNgHHwjf21sNJS839kIgip53U+0sov7VJ+8VRc7PoXWsQvkC2MwMVI7HBgdhy6WPw6bzO4mD6izuEZpEZRAuOi1bbu92CqS3/PraAB6EmV15r5L/nlzgWoKbCz8buHDcseU7l7qbZ+WnJ3eWdjVevRvyjZ8l7OF825emz9izuTdHtApHMM9flPbcT/HGOCRKsP8wAEh20BuESyUfRy6I4fILeBwG3ZOHdtIjyZaYKLjGrqcgLHxeKCnmOgLx1K0Cxxyf8X6R1V0U8Cs5f8pWEPAWiOJaM3wZzvAdbk1ebwNT+MnSmYmCUrohNCKbXkfM8S8hnkGezw1nDlte1+77JuY7/ZI98EkPRcwVoIilXdgT51laipPQVCKH/Kkcf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(36756003)(86362001)(6916009)(316002)(8676002)(2616005)(1076003)(5660300002)(52116002)(6666004)(83380400001)(66946007)(6506007)(38350700002)(6486002)(26005)(38100700002)(6512007)(508600001)(8936002)(66476007)(66556008)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zuUYaB8OxwlrWP3Y+PmH+MaMtEbKdsCXw5N2K+iR+zVViIQpbu4RfdOLc6pF?=
 =?us-ascii?Q?7nYfLA4YNj/njjdCnXq0eDkDFNdPPUjjBTKRNyv39vjuAA7f/OfYu3Iyyg2T?=
 =?us-ascii?Q?Piwya7ow2WchMasoAe0nkLceGIXimBTtnpJTruXZMZWEdaUrW+UAelVIEf/Y?=
 =?us-ascii?Q?BEVl1CCIUOQ9ixT5VBoskrEyHphjbv6v7s68ehZ5E8t5diQZnzbj99E61Zpl?=
 =?us-ascii?Q?KVCCp265vvq5uRvW9SaE4FHuhk5z7bGw3g+SHSegbHyaCLzAFMkH0abzbX2C?=
 =?us-ascii?Q?fwCMu5JzvVSxWnEPbAJreU/KowJLgAqfZvZmtoUVsZFEGeXHXLKDpxNJm+dj?=
 =?us-ascii?Q?In195GAAufmYzQeKyVFRgE6rwcswmwMNfVUXNJdWlgvdWHTDjj71KKDOw7wP?=
 =?us-ascii?Q?6cl6xazzVERluIbs/Tv2ag1BxXSO2iIHpoh5sNbl5jl2rxaaqHQSQbyHiobw?=
 =?us-ascii?Q?6UiUgT36CeOIvUeYyriKPWo5GpTK15VrDmDTzn11GzdZ2Uc3XyOsJJuchA+n?=
 =?us-ascii?Q?umWu9ciN+3mOCBX77Y5bXVyb4nLU95mGSbTdNqyXUM2zujxfWBWoGnVCWHDz?=
 =?us-ascii?Q?xvCxJ/GpUPARMe7TkI5gfQJfUwPgD3xe27tqnVVfu6vpPssA1g0ayDuSi9Po?=
 =?us-ascii?Q?cdZZZVRVaAjdYiQZH/aAYHwHK7FTocc4ZuvyN5f/jnMRSQWdslu38h/s7v/g?=
 =?us-ascii?Q?vixH7McD0k1nB3qWp5i/v8rY4C3NflpI2ydupuq/ylLzN/1RXAmfynD4zSKN?=
 =?us-ascii?Q?W+NGMOq6hpnM3S/ZxEWpLOGySm68FrRmtoNrxubI9nYuH1rw2b31ItQfs1oM?=
 =?us-ascii?Q?cM0VpQ7utT6n7NvbwQgiSA5976kBrHO96PZ0frkZcYfU3aQiTpUo1GzFEHl3?=
 =?us-ascii?Q?jB5BXnlGMNrTGsmUCBeKfzbzXIOj4GvVgUfAINbAh0WaS54TMPFT1qJzccey?=
 =?us-ascii?Q?IAmyi1BHZi2pMjVFDbgpappcVwIOmYJv4LtSO/s6R9+9IH65OdXb/jXPPGOi?=
 =?us-ascii?Q?HW+c1sQ02FSG1K8dsrtnz00FbU5pbkNBflf1/yVQrVJFhl0Rzv/STs2+gV1e?=
 =?us-ascii?Q?wpt7cFBUOKwHf47rHdZ+uabz/+gno/suA50U+jy6dpM9MWlmDQNP4OiGJA+R?=
 =?us-ascii?Q?hsZJUdtl81uB6EZiAX0Y2aUDLbJUaT4V/njIQ1VmWufIrdmf33e65makvkl+?=
 =?us-ascii?Q?xRA4/E0uZ17hYq3+cQ9tghw3ubB0CrOePHQr1wxFwG3LYD5h3vf9AyJuwOLk?=
 =?us-ascii?Q?Wg2EhDNgvzZKL9SHwxI0N++JaFKdFaQzTIAh8TprsSGIhtAfVB2hUrw6Wb+D?=
 =?us-ascii?Q?IWnx5wFs0NX1/Bft595G+8laQmFNahscWScxmMhiD4sw2A3zyeNtCY80n4gj?=
 =?us-ascii?Q?GDu80X7rqwLCGV2LGlptxQuxcLX+lFiMoEPOn8UekRWLgqN50bbEvxY43GyH?=
 =?us-ascii?Q?yZfcOZQOGivlK37UWAgPr2qO+NiOo3tG53RKbEHWSZ39iFrCxV+hYtdWyOLT?=
 =?us-ascii?Q?fHnqUOt/yEQIqsg/tCJWyxTm/iNg4El93x91yiilXXziE1hTpXEXNIvozmHz?=
 =?us-ascii?Q?3a1Mg308MLmuJar6r8BsREtz5DZ313+mob3LM6eDwSNJvouxx2qY5QBf0l1r?=
 =?us-ascii?Q?55sGwiJWslXuBG0nkFRnbUDhfUX6/3OV/mKhzZBrIrjXQClHySx+hYZHwOzY?=
 =?us-ascii?Q?95563g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8f2ee81-635f-4876-0252-08da029fb53a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 14:10:19.3160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RiLFqKF7f093XI5ZLcDyQ/aqqbNu8prUyPzoxkNvQ1O/saPnjK4gBGjeU044EDuFJ/HvkpyKSAnji/lqQHO7KNGMou1DleI7g5St1T2OLL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3095
X-Proofpoint-ORIG-GUID: BxUIkL7L2Kwm7oJf26JgIN3J9oGrJxHv
X-Proofpoint-GUID: BxUIkL7L2Kwm7oJf26JgIN3J9oGrJxHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163028

Take inspiration from the ebtables recipe in meta-networking and omit
installation of etc/ethertypes, since it is provided by netbase. If we
don't do this, the following error occurs during build:

Error: Transaction test error:
  file /etc/ethertypes conflicts between attempted installs of
iptables-1.8.7-r0.core2_64 and netbase-1:6.3-r0.noarch

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...ile.am-do-not-install-etc-ethertypes.patch | 40 +++++++++++++++++++
 .../iptables/iptables_1.8.7.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch

diff --git a/meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch b/meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch
new file mode 100644
index 0000000000..aa51265822
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0001-Makefile.am-do-not-install-etc-ethertypes.patch
@@ -0,0 +1,40 @@
+From a4ed9fc8da720585f853d2ca6ffd30e2fa4d1247 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Wed, 9 Mar 2022 12:50:39 -0500
+Subject: [PATCH] Makefile.am: do not install /etc/ethertypes
+
+The /etc/ethertypes is provided by netbase since 6.0[1].
+Do not instal the file in ebtables, otherwise there would be a conflict:
+Error: Transaction test error:
+  file /etc/ethertypes conflicts between attempted installs of
+netbase-1:6.2-r0.corei7_64 and iptables-1.8.7-r0.corei7_64
+
+[1]
+https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
+
+This patch is based off of the same change made for the ebtables recipe:
+
+http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-Makefile.am-do-not-install-etc-ethertypes.patch?h=master
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 799bf8b8..2eb1843f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,7 +18,6 @@ SUBDIRS         += iptables
+ 
+ if ENABLE_NFTABLES
+ confdir		= $(sysconfdir)
+-dist_conf_DATA	= etc/ethertypes
+ endif
+ 
+ .PHONY: tarball
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/iptables/iptables_1.8.7.bb b/meta/recipes-extended/iptables/iptables_1.8.7.bb
index 69b4a48039..839733aaa8 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.7.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.7.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+           file://0001-Makefile.am-do-not-install-etc-ethertypes.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
            file://iptables.service \
            file://iptables.rules \
-- 
2.33.0


