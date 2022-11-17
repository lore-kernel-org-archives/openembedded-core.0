Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D72C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 11:14:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13125.1668683672240207617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 03:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jSLZOxUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83209441af=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AHB15sA026376
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 03:14:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=kBHVCa7lmXT19WQXERuG6G7NlLCsEA88OW+bDcQvMLs=;
 b=jSLZOxUjX8U9LT/Yjv3tDtnm68hZoioR+fQ1pn2nZg6saUbRg0VKs6eyES5HI5DANbhZ
 6IDQKhYs8JsmXyteF1DQpU8nv5WfCfnEckuLGlxSLb1Jr3Ju21lWMGEsCNOof+YTHDgX
 LZSxz/lHIHej0gFdZG6e9VaB9VhQkBc6Al1MPJAUvNC+mryvPhZqXz8aZnZzVHdD4mjb
 iHSlikDyFfdYoRRLkvMYmQCIbdgYWz4h6xPWbdEu15DZWHTJqPRFltkjZU+SZ0q4ldYw
 GaUSgOFswtS5WDa48olY8VRpUsL70tTwzNX2EOKBTceOEIkPnxPlavLZhpGZHMMM6Gtc Ow== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbve09gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 03:14:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX358UKsD9ctJwzaDbHgkM4gV+UJgepJNZ9QM+4fbVv8CP+l512+cC9XtjJ+Zd64uLZO5VIcml1HI57y3MXARol66hRP1+dQDPB00yiTQUxdiMFp35RcoMEp0HuszR/zqgp2OpJvbvavmh9+19VJDxJifW0OuPnkfgUjau+h6t7LLcIAO4xKl2pdr8J1hx5DaCztvgYor1E8WWgd0cBzyB3LLvcczXTukjOuIvD17fmH+fY+fx8UAO4uy5V81n57peSN/GIOJai3l2UamXNDiqALJIJtV1IM2DPqqezAO147kxXC2bhd3zizNA7cPL8E3kDlYrb0BzGaGBm8esPBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBHVCa7lmXT19WQXERuG6G7NlLCsEA88OW+bDcQvMLs=;
 b=PZc3m3Uhf3PdOgR0ttY6cfz178s6Tk+NgqhcInfp4b7bk834ApaMA7oKD1AAuhvOhISSn/y3fRxcC09XrIr7t1gkhlisgEb8p3+6VST4GQ0+U5zGwSwszdrK+rnjuxtGf5UnFBdLqK3I9Q+JWyvb/ZgLy1KN3zAb6f7n8QkNPDPmLVCFyR5w/iF2gJEIg4wL+S96PABZxzEHp1rIjCvxhyQ+umlpeX+n444xdtocnM+CKpF9BHyWyXsP0UYG1iso73XA9yenwwnKmhhKGXB2P5riOMl9ONBbpQCM+ccgVs7wW61tNSnTZ7VZYZsjxvUBHyF8xyecuptetciX06l83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 11:14:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 11:14:27 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH V3] resolvconf: make it work
Date: Thu, 17 Nov 2022 19:14:10 +0800
Message-Id: <20221117111410.4582-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 671f0a5b-bc4c-4368-2951-08dac88ce332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jX+yssM9Z34aAJZIq0b7t5h6Ngzcq+dgR32IG0ls+eA4Qnax8KfhtWEPlGZ+xIEiyO7P9EtK05ts/k28nhH/bUw0O3YkUFufRGcMwQcKo8749crOiv1IKmB1KDlWK1f7qKuJsuZMSeUkgQNa7hZFwpk7dvB/pdxiwpU2GjPkrF8Y09wMdNQlDNygfDFC+fPLgwiQGQmM4zE5wopNC1Z+6IaFOPjRtqEmcZnAC0m1JRQBwuVXwH43rJP2znWopb7fO2kV2tAUXAHPFr/Fq+CL4rp36qDKxEorJaocl7LPbrC0ny/cyXJ3ndgLyNubdWWpqTjbxf2o6cgcSsnRoLk3f17Sk7YPZUpFBZrmhiejzVX9Gu2fMkXWvWKpWMGowiGNJ6vsO3xxq1QwOycWkiidwWuc/k2/CmU56kvbA7HgZZow3QS2aT0hUJPPoRT/Q1RlvtGSNiA3aJPzaRrF5oxYcZLICUAh704mwCpZoT0JVgsxrhJ2R0C6+d3L+dSyMVVMeSLS57D7LEmznZxAP2Di7n07mFOhouXg1piEjKs2So6N9jbR4PGmKeWXenGqTvuqRHavYe6jA5K4ytBt4O32XAat905qJNcpJtY81Z1IOa7hdLDERqa4GnW3lO14slI30/cwj5S/rRgl8bQj+L5iow/dSqIDpH8SC88oZJv6rIi/YwlQDxtZ3Qy9YYvlse1EjSmwGLSzWdGbxN8DUfQVxT1m8/24c//FePTms/0agyqyn7hj/L0+x3vBxI5Tyqx+UENMP2MhHCmZgvr49EVQ3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(451199015)(8676002)(83380400001)(86362001)(66476007)(66946007)(66556008)(5660300002)(41300700001)(8936002)(38350700002)(6512007)(38100700002)(26005)(6486002)(2616005)(1076003)(6506007)(186003)(478600001)(52116002)(316002)(6666004)(6916009)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dFytRPhBKLpjfgQh637p1DcxZ1n0Mhj5BnWL7htVJ+7Hkx0Cdtl/6YixlXG/?=
 =?us-ascii?Q?Ak7GrKja3GeReAu+TfGRxomCaWttOF2R/KNnolDF077lq389+MG80coySdTI?=
 =?us-ascii?Q?Qr3PIlM7VdxuBxnJbtkGpmNGejNFUbsfPol/qjdcaSLzb37AT8xpX4xUF7QX?=
 =?us-ascii?Q?OXWPJjOLQclmDHeIgTf5p+7i0IfWPklkWe7SnzGV04wWuFeOwAIPimqU4HRR?=
 =?us-ascii?Q?IDn/W1l9JL9utd20cIrNdNjx8GAuGjNECGW0+NdQvdgcF38Gepwnko5Rbp3V?=
 =?us-ascii?Q?xwsJkzHpqcwqBrMN2zhcY8t38aJOpH8bglhBZcjNIoJPUoq5u8MyMtusudRV?=
 =?us-ascii?Q?F0oGuVuJmQ9uJCP9lH6l/ko8d/9+RTHC8Wa0n/ouGB96UZJotvVsCEf89YfY?=
 =?us-ascii?Q?10tJMLg88U3709xkDP6RtVFo3cAAYcnBucqQY5H5RSLTltzl5GoYHKsdk28w?=
 =?us-ascii?Q?J+ThXdfQfYfROf0kCCuzK/Gv49Jf2Wsu1GvNXL2ev6XHi/nRId9LQr/hQbBj?=
 =?us-ascii?Q?jJwOO5nYzxfpiVTlh36HpzOKub2ArfFOJQnU2+tieaWClpdOqriBHu3/oyQZ?=
 =?us-ascii?Q?5I/RYz5skiKrT1uQtpUpDgV+a6U/sRkpysDdsmNLpGyFrhpmwN5LanRHCCg7?=
 =?us-ascii?Q?2Uu54L1+eDoDIo8hBn0dZll8vQm6KVifbS2IaUFvUsqWKqZiyRT6k/QAffFV?=
 =?us-ascii?Q?XcNo4LwY6bTERwphFr1g40TMZx7cNBVHI2i3cpw/SuObK09Fuj0SRpX6GfRJ?=
 =?us-ascii?Q?oNlovM1CiM1ZNscM5xvFklTACxuoNLT11s2suYN4RReZTe61WKE0sRPmcrSx?=
 =?us-ascii?Q?tbi4DPcbPREh/kyqw+p82giXlzGy1X2HIw4vOQSfKjx09nbV/hr0BKP01sam?=
 =?us-ascii?Q?mZs5X1bZi6WQKAFQuJngutANQgtjV4RUKw3pW7AntRBR/wBgiMv/QewJRXa+?=
 =?us-ascii?Q?to5XS4dC1b6xfi0+72q9Esz5BcYY9VH4sl/L6BiRllL8PcWsqoTxcQYj5JRr?=
 =?us-ascii?Q?yXKIr1NUi+VjWUOrJQ3HP501OnxyyXzQlwG+qXUH6My2YzOdXQUqqx4xf029?=
 =?us-ascii?Q?at4C28gdyHs63iGPyLCiK+A1nIJzNruwAEPjoPNWouC3PUSL1apN/cYOzQAu?=
 =?us-ascii?Q?jL8p6Z7zZibQ9hgh3RbqJ4zArAZkSqmYxpt7bF421Awirx9Yr6FR4nQtokj5?=
 =?us-ascii?Q?o7bbz4V3vomwLfMupuDcTreSgOfsJ7ctE+MIpXk0lWN9KOxodWsOAmRkF3tX?=
 =?us-ascii?Q?Ka5XWI8NVD3VLkpAfss9KowHVHZxGGKOXWusxu501CvnF4In1GLKtlNkYton?=
 =?us-ascii?Q?WeRA+Bf7176sZtFleNn3hewTEdEOXficZaac9kpL2U6bNmg+lZJJA0XIdwdC?=
 =?us-ascii?Q?CZ9A1D25vT8HccOUal4zZXtRZM7eN4k6MyUhbtH54VvjbHmZP8VEJNRXJ847?=
 =?us-ascii?Q?mE/nK/6hNJZyIENuHOgJRTOyCGtM/BMISjWYTj7ItxWvrYOF3jzQ/ZCZXCkK?=
 =?us-ascii?Q?q9ZiTlZ/w2HiC3xwTwYeX35sVlPI70tpcAw/tdBXP+ZhD/Hy+XMq3TkgC28H?=
 =?us-ascii?Q?yWaWH5YtNbVz2V/Y2HAqwqF2zZWI/2gtQ2Lgw2lb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671f0a5b-bc4c-4368-2951-08dac88ce332
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 11:14:27.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtvFw3kPKSbQPE22MSu0kqTF3iBqAr6zPjrZkAUOo7Haob0JBm6VoesrJTrrYNiA+xpYr+yUmtmzENp0kK2fIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
X-Proofpoint-GUID: UhM1Fjf9ZiCFaV_ZnC-_xKZkhkhUuyy3
X-Proofpoint-ORIG-GUID: UhM1Fjf9ZiCFaV_ZnC-_xKZkhkhUuyy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 11:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173417

The current resolvconf does not work. Make it work with the
following changes.
1. Install normalize-resolvconf, which is used by resolvconf.
2. Add dependencies: sed, util-linux-flock.
   util-linux-flock is needed by our busybox does not support '-w'
   by default. sed is needed because we want to avoid package
   QA issue complaining sed is needed by no one provides it.
3. Add a patch to replace 'readlink -m' with 'readlink -l'.
   This could avoid the runtime dependency on coreutils. The replacement
   is safe as /etc always exits in OE's system.
4. Remove allarch inheritage. This is because the above RDEPENDS
   change does not allow this any more. test_sstate_allarch_samesigs
   would fail if we don't do this.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...01-avoid-using-m-option-for-readlink.patch | 37 +++++++++++++++++++
 .../resolvconf/resolvconf_1.91.bb             |  9 +++--
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
new file mode 100644
index 0000000000..ab32f26754
--- /dev/null
+++ b/meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
@@ -0,0 +1,37 @@
+From 6bf2bb136a0b3961339369bc08e58b661fba0edb Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 17 Nov 2022 17:26:30 +0800
+Subject: [PATCH] avoid using -m option for readlink
+
+Use a more widely used option '-f' instead of '-m' here to
+avoid dependency on coreutils.
+
+Looking at the git history of the resolvconf repo, the '-m'
+is deliberately used. And it wants to depend on coreutils.
+But in case of OE, the existence of /etc is ensured, and busybox
+readlink provides '-f' option, so we can just use '-f'. In this
+way, the coreutils dependency is not necessary any more.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ etc/resolvconf/update.d/libc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/resolvconf/update.d/libc b/etc/resolvconf/update.d/libc
+index 1c4f6bc..f75d22c 100755
+--- a/etc/resolvconf/update.d/libc
++++ b/etc/resolvconf/update.d/libc
+@@ -57,7 +57,7 @@ fi
+ report_warning() { echo "$0: Warning: $*" >&2 ; }
+ 
+ resolv_conf_is_symlinked_to_dynamic_file() {
+-	[ -L ${ETC}/resolv.conf ] && [ "$(readlink -m ${ETC}/resolv.conf)" = "$DYNAMICRSLVCNFFILE" ]
++	[ -L ${ETC}/resolv.conf ] && [ "$(readlink -f ${ETC}/resolv.conf)" = "$DYNAMICRSLVCNFFILE" ]
+ }
+ 
+ if ! resolv_conf_is_symlinked_to_dynamic_file ; then
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..3f1b75d07d 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -9,10 +9,11 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash sed util-linux-flock"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://99_resolvconf \
+           file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
 SRCREV = "859209d573e7aec0e95d812c6b52444591a628d1"
@@ -23,8 +24,6 @@ S = "${WORKDIR}/git"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
-inherit allarch
-
 do_compile () {
 	:
 }
@@ -39,12 +38,14 @@ do_install () {
 	fi
 	install -d ${D}${base_libdir}/${BPN}
 	install -d ${D}${sysconfdir}/${BPN}
+	install -d ${D}${nonarch_base_libdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/resolvconf ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
@@ -64,4 +65,4 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-FILES:${PN} += "${base_libdir}/${BPN}"
+FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
-- 
2.17.1


