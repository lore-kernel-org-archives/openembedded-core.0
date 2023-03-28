Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08092C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:42:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61358.1679992918732990272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dhnX1+4y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24515f2299=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S5R850023563
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:41:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ym60mTsjeU8uURci2V6e/6ZwiHt0ZrTQ65mTpgKFxmI=;
 b=dhnX1+4yOeDiurl1TBQOPtEvoGahZUS+pQ4FXdjzkt7bP2rhfsEcsYvGJVeSbTlgoc6i
 OunK3I2mhh4yNS5AkqjMpVswtdYCKetbMcHCY4hR5pZU9TVRIuyV8KTndG0DS8mVLHDG
 InCZackM+QQotEwXLrwHdlQolL5NU4CjXdN7zEZ7N571Pl0RRfGYy9DdPMyN9SoqYClU
 9AfyKtuV8Vi0qrmTH58qEGxiORiqubbrGOuGsO7M61PPn9Z/dioLNu3qTn4sJCXzzXcG
 9D5GRIDzfkMeYyuE1WGXg//kiU2IbeB4A7K2nHgveOjvLwjhtgzNlfPvX1jYas1uldsN Qw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85ttp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHXd+9mEdnhTodKnKuiferL/YMJ59h3bYLGjGglBV2BqxucwIZf/nbXEBlbX7zsUtWB+PU3Y94HHqb2QTk8KF+npu40I3tzKHogmA4h8OTBR3vpFTLZWe/s/NvMIAnuOvjj66KCrW2TKvJ0EC9P9/NieQDv4d0FdiQhKt8ODDAAH255VSy9YjlYuYhHvkTeNUjVSnnt19VqTnPRBnq5sR7gNatWZ84LF8KVyLsZJt7DLF5eqrZmq5+UPaC0Nky1tKhIj/+rxD06GIFg4+Sk+QCszAlSiYPqA29zgevoys9n+hevyWf5rpEshqImtyonx5yap1KF4RtO6UX40vvMENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym60mTsjeU8uURci2V6e/6ZwiHt0ZrTQ65mTpgKFxmI=;
 b=gfqge5NIIp487s0NcA/07n3cqOLEM7uMOeIs1pyPadzNdQe/FNCMECkBdX7EXsl1XOiVtQ4rJIVJkSM1kU6E6I+qp5VaiEoMSEEDAzMANn+LC5Kfo2VcpLyZFeQaPSoAwrrvZfgVe/177WsaKOudIAQ4Y7PWDw+qsXsAm/TInkcbfykeJGRh0CFiRwAGc5bOZaxRXSI0WKIrs4REenifiHDrLdq6i3hvvUDuD+7fSmXMWzzsjlPSvdDFSjeQXxggj25rjNiCiedb7Ypi8/i/80k5lYpXTLbCbyhJ36sLd4zI5O7WPR8GE6SQ2kQvdXsXrhcK79T1uqBbXj8zQ4f9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.30; Tue, 28 Mar 2023 08:41:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 08:41:53 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] openssh: fix CVE-2023-28531
Date: Tue, 28 Mar 2023 01:41:41 -0700
Message-Id: <20230328084141.49802-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: afd98772-d084-4ce7-eaee-08db2f684772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jC4D4hK/8oG607jfL0mE7qBqccN1kYju8F+0ex1H8LhLrl888rkmaT8E68hAt9morIPo2r7Rk1zA+Qvvoq0KjB7gX9ALYmypo5SNC7xkknpyUn7HS15IhoIRF/QdzMMKGfdi6LGWVNpD7wHrV07pXa/iBs3fDysymdZKXzylAxQwaLehzVrw/PddW6mOWE781vOCfHrk1jiRQ0AqHIqpjBU2bc5DzmN88mquuJxV154+n9hG/ZgZNKR3mhxcIV/nvbxwSkUb8uQgN1lFICHUQQ7mFldhlvTUGnMLGzvvBkF3p/+ja8xS9A/4JIdSrB13sE82u8POnoc9PS528eO1qaQb7tlM7WFiEJ4GQ0N3Cyy1rIzVfyM+Kj7PbKWkxLa6TAcS5YQxwNx1bRrZk9kVZM/bvsRZ/zrykwXJ28OvC++uuP8cmH9HLgzQ5ky03TBcL1wDwn8LvyfYpLU3kz4XsAbv9teIvcZOgsUUa6sq9qiNq4ep8xexnhZyOClqM+gaVFakLVrsOI7+NHFgiJa4ggN2StX2/vcCMasjELp5nYvIUTkr7kOvHbrNKIdnbYjLNjxDeFRQeE1kuA8qQOYbVXtXszZtmTi79DkJZUl1b1k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(451199021)(316002)(478600001)(8936002)(86362001)(36756003)(5660300002)(38350700002)(2906002)(38100700002)(66476007)(6916009)(8676002)(66946007)(66556008)(41300700001)(1076003)(6666004)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Z6xORbccKjxv97iyihH9EGFzFnEyy7G4GsqCnxBDf5ThJXCesswg96x05Gr?=
 =?us-ascii?Q?vp5wHCkUBHY1RVix9tJliZlkdFoIGS2bPGpFW7Ls92jjpqtjuIL9wJ5D3OZ+?=
 =?us-ascii?Q?j2v82e+oNwiA5XYIWWzQpmha8Wz3XTKp0REbslhDNnGhMe61vvZo4cIgXVYL?=
 =?us-ascii?Q?V16NSIPAWMOR5pqtn5IQVFzGN4VzJWfJq+GeyElVJMhnv0xGp6LbfI+SMUyw?=
 =?us-ascii?Q?/rU7RaCbkvlNX7vYeuhOcVG38YQfooiWFMfsQau9nly7mI3+hxh4oLPTYric?=
 =?us-ascii?Q?0qZBSVfqrAe0C1fOwxgy9Dmvz/LVPOyo6hZxXX4ZeUanBSNw57BAq3aEGsNK?=
 =?us-ascii?Q?qVE8MGxSMFvPkUhskJfHWv6U4UBipbC6UTcGP97cklqxCZxRLYKL9frUxelz?=
 =?us-ascii?Q?/6rL2B+Uoz+4k7pTl21FtU5LkN0btuTAZBTlZ0nM6lgqhJysgUhacNLow5yQ?=
 =?us-ascii?Q?g88WQ+o5N/IFdmM5xahnz3kgMl+6RZ7lFUJzXXObMEsWr41fYEIoZ4gbO9zN?=
 =?us-ascii?Q?xYg7QygrE2pKYTXsQGBO0QPm9bXxpLj6UAGo9M+zmybX9k6zZTXIk1mi9k1Q?=
 =?us-ascii?Q?gWsStVKR2kKPGXtHLRC5zfn/ZFi31aYzkhYejhGYSVPbIRwwDDEv3kNSMkDT?=
 =?us-ascii?Q?ZChwbn8UFv9ffmgBEmCvbUdvaZTy1G5I5N5LzFVXYssMICD5N7T4KP8LrBET?=
 =?us-ascii?Q?ZqxlqnePKir06aDgK2egCyD/K2nIxV/poNnh7WEMi6hVKZSWzj+HDmQuiV6f?=
 =?us-ascii?Q?/+HwM2BwZTXbJuHtHyezslKjEucPaB3HdwjggbjHgzLzB1xokl3oTRGKrFOq?=
 =?us-ascii?Q?NwCZpvj3f6AbWSCeKvamfNIQp6abwSls/KeGzLFEpo6r4GaKR5nNCCFyoRby?=
 =?us-ascii?Q?9E/OBPVuTTDWWDoIDLiYAnF2ea4cvpYvb+uRDR+WGveKNUVRQaW5tZmfhmGZ?=
 =?us-ascii?Q?8wvr0oTj3/W39j8SFNcTech6j9mVK5oYyP1egCjaGMAdgGHn8+/SXbcdnAj8?=
 =?us-ascii?Q?w7ddYeDkmT/MjSDhETLJSfyCCajv1oj5oZ71IE0MTqMa76vd+KN6l8s6k0QD?=
 =?us-ascii?Q?6ae9V7rDfFTqYfRAyFe2kRJkNszrw+Jo2I8vxW7x0hGHUoMTaleD76GaCo4W?=
 =?us-ascii?Q?D+oJGwM5S0rqPPsDkFKSK+sFj0HCua3XosAfmvDb2zofXyayzLx8/eZMFIMn?=
 =?us-ascii?Q?7rf4U+tRgpLK/pLOE+2jbR1G3g9fzU8aRqf/dlF+MPhV3GTyCLOARz4AWILH?=
 =?us-ascii?Q?Pab/0qErgI73rRF34H1is/O/tQZgMK406tkQteimr4MhO/BSTaYaJBqi9USi?=
 =?us-ascii?Q?7t9b34+kz49QF3whHbD1dV1an3hu/8ICne8XQESquKDaoB3qPOjVIPTt63in?=
 =?us-ascii?Q?6TRpBgvOlDlHE/rhvHscU1EMuwD0ybTg1HCErxO/oDn50il9g9Xlh3ry/0el?=
 =?us-ascii?Q?63C4h7ZeuLkKXhOQaWsgyGk/yrpNAipdcs4wESDrv/XaPLpmPb2CpIF9WXHm?=
 =?us-ascii?Q?ciPFQQoH6SPbTnurrcfigw5kAnUN/oLvzZhalBXPgwoTTJoTvXp+MpQLG+kf?=
 =?us-ascii?Q?2Xe51ECWtK/KLC0o2twMsPQdW9Gy6JmLwwwCSE6umuYimuHgCKwjjoh38EFy?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd98772-d084-4ce7-eaee-08db2f684772
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 08:41:52.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NszlDNWeZ2aMyM5gMSu3TG7YEPkPtXeLK3Y1yHiqGhQjhsOPL3smAAF3tThzBEqVLFM1wPU2DgTR2THCi3rFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
X-Proofpoint-GUID: pW0KAjGSA-x1zSSryrpnnISNiWuthM7m
X-Proofpoint-ORIG-GUID: pW0KAjGSA-x1zSSryrpnnISNiWuthM7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179213

Backport patch to fix CVE-2023-28531.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-destination-constraints-for-smartca.patch | 35 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch
new file mode 100644
index 0000000000..b4e7ce7ef6
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch
@@ -0,0 +1,35 @@
+From 91889b5a3e7554af474a21ce8e1ffd3eb1542f06 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 9 Mar 2023 06:58:26 +0000
+Subject: [PATCH] upstream: include destination constraints for smartcard keys
+ too.
+
+Spotted by Luci Stanescu; ok deraadt@ markus@
+
+OpenBSD-Commit-ID: add879fac6903a1cb1d1e42c4309e5359c3d870f
+
+CVE: CVE-2023-28531
+
+Upstream-Status: Backport [54ac4ab2b53ce9fcb66b8250dee91c070e4167ed]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ authfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/authfd.c b/authfd.c
+index 76e48aab..dca8e55b 100644
+--- a/authfd.c
++++ b/authfd.c
+@@ -665,7 +665,7 @@ ssh_update_card(int sock, int add, const char *reader_id, const char *pin,
+     struct dest_constraint **dest_constraints, size_t ndest_constraints)
+ {
+ 	struct sshbuf *msg;
+-	int r, constrained = (life || confirm);
++	int r, constrained = (life || confirm || dest_constraints);
+ 	u_char type;
+ 
+ 	if (add) {
+-- 
+2.37.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 6057d055f4..d81072537c 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
            file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
+           file://0001-upstream-include-destination-constraints-for-smartca.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.37.1


