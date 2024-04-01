Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EA7CD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 10:02:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34167.1711965738326157956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 03:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hBQrgG5d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48215f78b9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4319f1Ma003768
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Apr 2024 03:02:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=P58V5fzbghNvbD6/es
	jczse3fBogA5VJuN31XH7/sBU=; b=hBQrgG5dC0ZWdkz8ANKJY/+djoYlFMSZnj
	odqIqtJt3F503i1riCR8bRPxd9saJp5JTJOayPVKcaQK7QoG4VE/wQVCkXRSjMAl
	VOH/D+cWYGh5lbCUGHumrMnpYF2DwcMmnkpUTSIEXMgLI2gRyD8Cyyj9M4QAnX37
	7Okp6xDt1zZ4QNyeKR6Mlz5DfDEDhevxFWnYlEaLQW5lBXHZjt4M+7lVufWp81eF
	+dpoaB4xsoYjzqFhxjmabbkKDb9vI/qGoCq3JUix0Hzvpm5VN6L+CdwzYInWniV8
	IqJdUYzljEZlTXkugZ7O6YarjOYs5IKI7sCixXPaTyeSbg1+pBiQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6j8fscrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 03:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuFxyFY/4jQ9QSLugh9JBR7oBsfneE+NcyEUwYjhhvDTbLdAZvRfETd7C7HtRnkc+dL1Q0Gc7rxTcXkA27DsdIM/fyVAtrXzjPO/EjEgdb4lpDL8laddWRv84nQH0nzmh+DTdYhYjLNXuqNBQG1Xbhdfv4A31xByoCgTbD1bc8c3wyP61Ta5sETHAhFPPy8WjAUNJvIod1cUd4voMfyF6LIYRUSeNJ7SGPtcpvUBdtLmd+eV7jt3ghFmd+p9bVYBPMKEboW2pHMcJufCxfoNaIIakMd46k8JZG87720icemy0iowezb3BGgOHKHFWiSVbFoKauk1paaFhmraAkChFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P58V5fzbghNvbD6/esjczse3fBogA5VJuN31XH7/sBU=;
 b=oC6K93i4UWmgWkYEVjNvkCxqzq7loRYEkzJ6ph/hIXeBLp48+yzYQMp98NS5/GFtcy5+OaZgO6b8AOq1muLfbXcq3n5asC7rxJlEbA/+S1sy4ARZv1BJv1FCMtpDT0h32vrXBljPzj6l0HO3YjEahmMktjGImQ02eqkf1j7BU5Ewio2lpvYx1qISd6LywmwSZsK5ho6tWIpnOktzTBGCBOf4rwX0hoEYyEkl6XdXxnM4FCarwa/lnoDXmRNDMZNR5ZaZkh5tVBt6pD9UsKtgdJNjOikmZKn9rfI+CZvDIMIKtAF3mLji+9vBIHuutm+8D3arsK4kHecvskx36TUE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 10:02:14 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 10:02:14 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2] glibc: Skip 2 qemu tests that can hang in oe-selftest
Date: Mon,  1 Apr 2024 03:00:12 -0700
Message-ID: <20240401100013.3834047-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CYYPR11MB8387:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EUupZls+O1xZr2NkZBWDJ2rvEPk4tFNP2/cd5aHB3ebL4bKzdYkjXKHuan9JIlOBCPhtmcj6Eyv/WCwbxHvCClhXvyBDqFWy7uHLPouv7/zYwUHm2B12AmmJsftd7BY8AjFklluHjjz1uvtT56uYCJk6LQ8I9cI5sag8iY2nbnSSjEL+ArnafxaRuhgteoJBPvswHuU2hhPxLgQv1P0/NH1DMMg+TgXqjmPp7yIN29VYQcu6U3LWSu/SolWU9cXY3h/OmkwL9M/CkV7Gy0wHG/cmomuZcbYOaL+qewkrV/V4ZQ4ndwXy6t2VFPu562cfl/hvfi7BhH/BajZCy9KVi6kEl13yVfhOU4YBi4ToMzTiwAuNIutv6xjHfJV0TjJFUYPufXY+a87NZ2LSy0Iqg4/uvcszZIuXPQosYubkLrLQSnT9La6qLDqNpSswYdEMWAqKnrszUGJn19Hlz/669A3W/dE0ttvM/gBerblENzoRSRIumPrhW/CdKmzXW8wpiEp15n7oCN5C4nRKGBwN1BO7ZzdpioGHhbw6IBCLgbceFVYNIIu+MRRfLtxjS9gLb43+pY42BhpZsfImJp5alUsAdFS71bm9DSEmKCJAVFlBHebl4qO/cgcOIHRPxwXSEzLRSMUS111//g9OXBXURqwTApevoFW6uFJ/pS+hnYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PB6f49Ue6rMK9Pc3XScH5zjDBB0QE3l+NVLh4an6V2v08L3sLrQuMWx/2WHl?=
 =?us-ascii?Q?DK1gp6Hr5OY+Be3HU+k0C3HS8g4KsevfhKVSybrJf65xghT9F9/Hh9RSjGOK?=
 =?us-ascii?Q?zXygS6e37yD5spn6y8jXDcxhhaI5S8F1y24SsuwifgeN+S3LSkUZj/JuVu4v?=
 =?us-ascii?Q?QwX7DD/qHMvl3cocnl54ilCSLfVf8Trg5UTHOaIR0udmyigJLVhxX+3vL68x?=
 =?us-ascii?Q?4fohM/0xdeHZhNzmIEmAPBreMFa1qBPyE82g7QbseKEooZzZqHC8HadioGfI?=
 =?us-ascii?Q?43rFn9Y98AQ2W3kBGxKIeSjn//GFbyCHRKobVzsKPX4LVINsBn9xIuJQ6igt?=
 =?us-ascii?Q?en1OCJVug3dQsjO954fzjAn4KIvzpWEboYkSukaCJNQcnmhZnlKbZd5nNW1m?=
 =?us-ascii?Q?C7DiPBAsqUin85q6QogC6vxClxN48xyYH6HaZBUHfN1xrKfEhXXvnoyMDNAe?=
 =?us-ascii?Q?if1i9/zVSVo0GhAycdJgJ0lJrkFBtrubl3aU7ooD5VBAlwhJSLOdL4hW2Ezt?=
 =?us-ascii?Q?sfHLFwmWH9O4x/kWGCIEOjLVz77qNSCtkcp6nrh863qLmBlHUKHyFf8cT02h?=
 =?us-ascii?Q?pX7559TSZzmgjDYFkcv0TMbaJL2k7DRQ8Kuf/AKIS37OJdtAxUM+wp98uZih?=
 =?us-ascii?Q?tiH+nElX5NygU4V3fqgeuXkDgHfdyIL7OL1evbwbwb0LIbjiWpXve9M4w6Nz?=
 =?us-ascii?Q?odBkXxzjTO2Fr8OflRNhmWpz43hcB0PwF6p/uk1QN8Xk5gLU919T8PmKCK5u?=
 =?us-ascii?Q?nKS4PRb82e7AseTqWafPHoAnvG50NrJRagbFYRpL9Fs2vpmWohtHUjmuIFem?=
 =?us-ascii?Q?dFr+T6UGdVQ1JqGLH1YP6WRTaQcXfYkTvwWo83P1h2NyoNUKUgDB7th4IbGl?=
 =?us-ascii?Q?8N6bJ51ASf+jD98EHTDCQoSaXjP1U9YvLBjNw4xI9pj1yJteqcC92/4Ajr1S?=
 =?us-ascii?Q?IGN0TdCDAW1nboIURbLVnCHu7dnaNGbgEmLaQTXn1cncx7ZHheEE2wT8XwzK?=
 =?us-ascii?Q?ae532hrJNPsKToxYo/I8Pcja7fsRLnYF9YnaIMH/Ykw+lRWniMABNifPSXiW?=
 =?us-ascii?Q?Wwpg9O6w4POR68LOsY42rR6GLgFTbEi1tXMrVkgIO+JwQIHghifYoawdVK0C?=
 =?us-ascii?Q?5bv0nl8C+tsLg92KeG8gi6+YU/w6AolPP+g1/ebPokMbc3NVzVwrXnQ8TIIQ?=
 =?us-ascii?Q?NtSJjs85w7O/WmwF0f+VNLLsAJLmp9ZDgPovfb37qhCcD8Eez7aCnHS8Aa8+?=
 =?us-ascii?Q?B2Cnm2C75yjW+v8vHGn+zS5B20c3ASFSl4Z2oJyRzATliX2Ht2sh5vSAk8S7?=
 =?us-ascii?Q?P2gMAZJWjsmJPndA4BdP0jBu+cu7jf6/lgGlZHXNwINaScraZ94kUkAEfMBK?=
 =?us-ascii?Q?8CDyz3ppzr3DTR3Zpn+1QpUTezHrCh2KfH04IG7CLdeERdjw24wuy6fVTDfI?=
 =?us-ascii?Q?izxPbqA9EPXEcNK5VQrHFxXhYhGJV/gx7WPRRsDV71NHXu5sJlDJPQc8+QkC?=
 =?us-ascii?Q?GASdOEkWGQ3nFxKTum/nAvLQgJ009i9uSVC87R2+JN4Gzfmhwu54ncfJYwgQ?=
 =?us-ascii?Q?YYuJx2dunhcrIb8/b8D1SX/dvFh7G6QPyBnG1dQ3X5/WEqvJM9FYthyNB3gT?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12074f3-ffeb-4f91-dd37-08dc5232ce1b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 10:02:14.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FQCoJrF4jo38hKVs8fBv3MnFFELr5ktb1J5eAPmIa6IME5sDOxs2VxMibGdW1hh/ruP/DZlt+4LujOLk9VHe9u1Sv51B+xlHsA1q/m8J2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
X-Proofpoint-ORIG-GUID: ljEWjoMZGm807wpOvGg4NLa7HkpoYLh9
X-Proofpoint-GUID: ljEWjoMZGm807wpOvGg4NLa7HkpoYLh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=560
 spamscore=0 suspectscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 10:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197683

From: Yash Shinde <Yash.Shinde@windriver.com>

qemumips and qemuppc were leaving stale processes behind after
running glibc oe-selftest. During analysis, it was found that
it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
Disable them so that there are no stale processes left behind.

[YOCTO #15423]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0024-qemu-stale-process.patch | 45 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
new file mode 100644
index 0000000000..c0a467fcec
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
@@ -0,0 +1,45 @@
+glibc: Skip 2 qemu tests that can hang in oe-selftest
+
+qemumips and qemuppc were leaving stale processes behind after
+running glibc oe-selftest. During analysis, it was found that
+it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
+Disable them so that there are no stale processes left behind.
+
+[YOCTO #15423]
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefile
+--- a/sysdeps/unix/sysv/linux/Makefile    2024-03-18 01:15:49.019202881 -0700
++++ b/sysdeps/unix/sysv/linux/Makefile  2024-03-14 06:26:18.581404107 -0700
+@@ -222,7 +222,6 @@
+   tst-process_mrelease \
+   tst-quota \
+   tst-rlimit-infinity \
+-  tst-scm_rights \
+   tst-sigtimedwait \
+   tst-sync_file_range \
+   tst-sysconf-iov_max \
+@@ -233,6 +232,8 @@
+   tst-timerfd \
+   tst-ttyname-direct \
+   tst-ttyname-namespace \
++  # Skip this test to avoid stale qemu process
++  # tst-scm_rights \
+   # tests
+
+ # process_madvise requires CAP_SYS_ADMIN.
+@@ -270,9 +271,10 @@
+   tst-ntp_gettimex-time64 \
+   tst-ppoll-time64 \
+   tst-prctl-time64 \
+-  tst-scm_rights-time64 \
+   tst-sigtimedwait-time64 \
+   tst-timerfd-time64 \
++  # Skip this test to avoid stale qemu process
++  # tst-scm_rights-time64 \
+   # tests-time64
+
+ tests-clone-internal = \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index b203060064..9122472689 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -49,6 +49,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
+           file://0024-qemu-stale-process.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


