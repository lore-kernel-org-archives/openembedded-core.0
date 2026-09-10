Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B694C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:19:22 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11482.1789039157442608017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RGlMkQGt;
 spf=pass (domain: est.tech, ip: 40.107.159.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYDkA6EV0Wmc19SJxpuqG1xykelG72NsjL+MHOi8qMSOTYoPc284kBkvMmdh+7HWteTfxTHqY3EkArD+7nmhS9Yq0NUH0K5w4btqzSisOmv6Usrt+u3X3BkvltHa7K69u7q9cs4lwf4Smi1jbX5Z9R4tmFbQ56+C1VVX8SXZOTxUN6r+2Y5nPGl+BJO3xCEIf/bPqyOtckTNKrlrdOwYMI/bAJ1PKWW/XQp17KhIN4oaG6sXhv+gVFH5zl7nMWOtRhv7E6mNI4ZOF+Apd9itBsQFFL8qoenqSf9/T3/AdgPveaNuOIB2gj8Qttx2QGDRPUULSHUg80hDGwis9fBJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF3PgJLrMAJ7oScivji5FKAXtClDQ0C2HUiFkbcQQL8=;
 b=Tprl2oZxwR21bkYvkMtoYuuNa0+HEjVK7vl+YqjoTHVwdculgvIUTdfxqsLMWMG67DYId0/PpPwj0SxgFPNKuOC3BUZsaW+aTFVLW95DIqhutStsEOaUZ25f5j/wapDK831m/tuo3BuyVQmhdLn007waUeParrc/D/DgOR4SuehCz5jn/fIjlGfFkFC6FGYyuGJm8fJwAX75BagKu9zRLK+MUife2Faq/m+wtGmLDRTYjHwz4VXztjdNCJQxUGuN1wYB9eewtTC6QfdC62bTZjGtd+U/jvhcegEiSau5ntZNZoothu6jINAF0sa9kNY3EAFuQIiheIDRc7uJpmNu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF3PgJLrMAJ7oScivji5FKAXtClDQ0C2HUiFkbcQQL8=;
 b=RGlMkQGtAmshG1oFeeFL85lOAZ6YIpKE2VCWHNX6dcEsZgNqa4xUPgi9fjGHg1EqX+bMU4cWGX+YLVfpLnXBcX1EQJvm6GEceG/SmVhTUqD3vofH48DwjAnYD8O0NiMgjLLkVCI/EjXtXrKliOwS/xkoJx5kNd6bD74wlyQeRsqaT6L80YV+BNcQj1BL/GcTYpJoAcd0LRFJYyn05dt35wUP1zPUfpHoqH8A0Ns7qvoNGaRVK24YzHPSXkE3x5O1UEEJ6a0l+NCnLtNb3YVKZln4R8VJqyJ735zAZ/NJsHLM3X5ftzrP7AK2PpRLqqvz1+yeKcOieGybS4XR+2FoxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB2097.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:395::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:19:12 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 11:19:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: fix lsfd mkfds-mapped-packet-socket ptest on riscv64
Date: Thu, 10 Sep 2026 13:19:11 +0200
Message-ID: <20260910111911.33981-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0290.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB2097:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5e0476-717d-4854-9bf9-08df0f2d575d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|13003099007|10067099003|6133799003|3023799007|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cngZGb4Fci3oOrmV5RYP8kJuzKHKHe0mX9tMrtgckirlwkS4i0tglOjVsZnv+pwD+XVho6RHha4FliqBRG4vmkCb80Pv3LOVJDPW0ojb7yrZKPxSsYWA6mtdTejuT+UfUTJsnRDhCpExsgjxENfQcz4Vzf1vjknhl2kWJkKplr59wMM9tK5DBQN7pCglL30x0u/MwgTgXbI99Vof1wwVM/PGrlnfa2+ZjGsZvlHn3oD88TnD2Gpdi3EyuNoMV6Iv61JF1NURJbIYKIn6izaVwzcJnmRHepBLXTTYRES7M6w+KIap5gWidtIMibjWNHe0Ofi9+eT0Sc1wP7vycNi/rDxXUccAZMiKL3GLoWUzERBSPLe4JnMJmNE3Rkc3pNReOEefL0PMByYbNvKZIItjOMWl78TNYo3bylzoCdxQ9PqybmS4hX/Nclj5PwWpE9yrpFjAL9Xi/QydyB1kvzySalrxesrAwInwAhBqZmyVTfOsmzVTHitAXo9qr3uIN7cLQh+hnxGoHIl8RJxnsUEwhMKDSrmP3QDEoPNagwxV2+b+ZnIf5pGTpdrowA09nzUZt5puByUqGh+LiZih1y1vcUoy/pdUUiwkmzkJ5QDnSIO8ArDTySmnjkNlYkOtjY1kjTgOT7m7RgO9mY13sjY/R8f0Gw2NfJ64+I+eBOf9BFY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(10067099003)(6133799003)(3023799007)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T80NJGUJ+UnBthyO2g8c12dyNY5eHj/E1gIbiYRABd9t34VaHxPoyKjQmbTZ?=
 =?us-ascii?Q?i5aguqjsaJSCHjHgti6UsGdm4cCkv3plT+4F5sXJZilTHqijiYUqQD9l2M22?=
 =?us-ascii?Q?HKk1nTrXHOMxKrPLgYAsL9GckK0vzIiMysldXtM6BWgipg+l5sHu0ZQGr4It?=
 =?us-ascii?Q?rlU4hZ0JsD+AwCa24zJ9qKKYips0HylyvosoahZb1T9QHdj117a6I/MZ3Tkt?=
 =?us-ascii?Q?jKJavfG+d8SOvoR4Z65WpWHhRemIZF7qFp0jVBErKrQ4o3KWvH6V4hN6jteH?=
 =?us-ascii?Q?P0y+U3Ew4GnrRW0s2BtpoHY3ZYgT0Hdj1wLTkYGuoCtQABIfk57nI7mwn0n6?=
 =?us-ascii?Q?HIEIeKLb4uxFlIGvVHq9uYrOxttrajpq0BCYavn0aUEntbvBPl/PJL43cavt?=
 =?us-ascii?Q?dSjOe6m+mQzEWY7dK32A3mg3XnFen2SLgJA2FYOdvqqfQMsf8EGu+JCgFkYZ?=
 =?us-ascii?Q?ZpfkMm5eaQxNP0l+/dDF3tun9yHkqvsW7W7+Jk/tFSRa6oHZfWzmrvDSBV4M?=
 =?us-ascii?Q?1iLBHD81xmDj+ew/TdyAimqkiZaxKKMyvQ8bzuaaDWxt9v1GUiEFbOcQrO0C?=
 =?us-ascii?Q?9eWnU4PSvGI9yLPO8vXi6Hh/R6qnCJmz942b83VsbkUCy5HXWoNTCesL4om4?=
 =?us-ascii?Q?KOCZnqt6bGqLIOmByQzfxbGmj7FC0O7uWE4u2gtNqJyzRwqK28FN9Qbk7wD2?=
 =?us-ascii?Q?5L/wGGyvoQpByDzKlGT1DORM/eTEFogpZEUC01uZvPgF+JF2zsLxs3jPdwRD?=
 =?us-ascii?Q?P8ful5nZ6/D9L3fvQKZoBlxa0fzwR6yGdx81X8ZXEEAIXxyHt2XHcM3f8Tec?=
 =?us-ascii?Q?NBHJrOcQ3SCnnU9635FgMAL9LwZguaem2fRnnY3+IQ2bNnD4quTbuPqk83Dt?=
 =?us-ascii?Q?3uCh3FP/3ooY2dxTVxbMccLQpS65S2AhV3ZHZDS1ztj/QriJoAHoZXPEuofw?=
 =?us-ascii?Q?xyDgY61n3HSJalstDmqpG/nBR4iJOoYZS/BUU15xoCK4trRMagZiqhV7Mc63?=
 =?us-ascii?Q?2mWu364pmDXIwTNZo8uB22RFRuksuz1XVre4QyEd8EHqKwXGRYuVYZmg0ii2?=
 =?us-ascii?Q?/n61/1MU7k+eUTqqW/VObycBhRLXsXp1ymR2RLyrqJCfLYEqXBGsiGFmD+q+?=
 =?us-ascii?Q?PtDWnvJ1Jax3keZxF9HT2MMyZM+MBU56sZQOc8NipVecnbj8TBpgScNppLEQ?=
 =?us-ascii?Q?HMwyYj2v7aeh4OtjANkjLhdSq2Ot+JgkIUCOpvu/LtujVJa0AzMAOl58Srwf?=
 =?us-ascii?Q?T1UO72HGGxwwqKuDtXWJRDOTdN6S6z3YdsmokP8Ri8r60bN+sZwWXqIiCujC?=
 =?us-ascii?Q?ef1WUWfgIPPNVoLQoaLd1ISQw/ceRQUN5X9CSgiezwH42wHz06muSLA4G+px?=
 =?us-ascii?Q?AQNro1/JQFck9QQYBC9ysBy3IKiK2UuhLaggqxlCiXcL+alqtZio7X+WeWGE?=
 =?us-ascii?Q?R7zx913iSXlT427skQicZHe/uvmL3ttbpcklqig7p4fC/FmVNJjBc/jU0lcX?=
 =?us-ascii?Q?QzLLaAnxCvoSm/IpjQBgc+GYlOWj9STNHvP21HwM6ebl9cWgV5bFd8WjY3tX?=
 =?us-ascii?Q?WyBptnXhRDMc6FPqDG1DV3bSgySHQcfLJlKazWplVn9MuAlwf3SNQ+fe9Bv1?=
 =?us-ascii?Q?sjwlokkS/g03AE2pcO8T/VFQ600mvd1Wk1k0FSEsWqUyOOu6uZ3VvCYn3TWb?=
 =?us-ascii?Q?qSvcYfof0jdBEX6y8NBdlvw/vGTrvOQWzHt6uIfqzLvXqyVzDng+Jld+8tlA?=
 =?us-ascii?Q?crcqyUCnIKFlpTCN3ThV3iARVcCP6LQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5e0476-717d-4854-9bf9-08df0f2d575d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:19:12.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEZhOs5yzOYBrl2gVBbZpxPb1X5ncgK4TDiwupjn1Qb2X5FMrSzc5xVa551RQSZQqAAQJmW0Xcl7M5lCtjzCYVSxtt+9etpSaojkzbxry2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245559

riscv64 reports the write-only packet-ring mmap as "rw-s" (RISC-V has no
write-only page encoding), so lsfd reports MODE "rw-" and the test's
(MODE =3D=3D "-w-") filter excluded the shm row, making the expected PACKET
lines disappear.

Reported upstream (issue #4618) and backport the fix.

Failure case logs:
root@qemuriscv64:/usr/lib/util-linux/ptest# ./tests/run.sh --use-system-com=
mands --show-diff lsfd/mkfds-mapped-packet-socket
----
         kernel: 7.2.4-yocto-standard

        options: --use-system-commands \
                 --show-diff \
                 --srcdir=3D/usr/lib/util-linux/ptest/tests/.. \
                 --builddir=3D/usr/lib/util-linux/ptest/tests/..

           lsfd: mmap'ed AF_PACKET socket       ...
  diff-{{{
  --- /usr/lib/util-linux/ptest/tests/expected/lsfd/mkfds-mapped-packet-soc=
ket  2011-04-05 23:00:00.000000000 +0000
  +++ /usr/lib/util-linux/ptest/tests/output/lsfd/mkfds-mapped-packet-socke=
t  2026-09-10 05:57:24.219872733 +0000
  @@ -1,16 +1,12 @@
  -PACKET
   SOCK.PROTONAME: 0
   type=3Draw protocol=3Dppptalk iface=3Dlo raw PACKET lo ppptalk 16
   NAME,SOCK.TYPE,SOCK.PROTONAME,PACKET.IFACE,PACKET.PROTOCOL,PACKET.PROTOC=
OL.RAW: 0
  -PACKET
   SOCK.PROTONAME: 0
   type=3Ddgram protocol=3Dppptalk iface=3Dlo dgram PACKET lo ppptalk 16
   NAME,SOCK.TYPE,SOCK.PROTONAME,PACKET.IFACE,PACKET.PROTOCOL,PACKET.PROTOC=
OL.RAW: 0
  -PACKET
   SOCK.PROTONAME: 0
   type=3Draw protocol=3Dunknown(10000) iface=3Dlo raw PACKET lo unknown(10=
000) 10000
   NAME,SOCK.TYPE,SOCK.PROTONAME,PACKET.IFACE,PACKET.PROTOCOL,PACKET.PROTOC=
OL.RAW: 0
  -PACKET
   SOCK.PROTONAME: 0
   type=3Ddgram protocol=3Dunknown(10000) iface=3Dlo dgram PACKET lo unknow=
n(10000) 10000
   NAME,SOCK.TYPE,SOCK.PROTONAME,PACKET.IFACE,PACKET.PROTOCOL,PACKET.PROTOC=
OL.RAW: 0
  }}}-diff

   FAILED (lsfd/mkfds-mapped-packet-socket)
----

Working case logs:
root@qemuriscv64:/usr/lib/util-linux/ptest# ./tests/run.sh --use-system-com=
mands --show-diff lsfd/mkfds-mapped-packet-socket
----
       kernel: 7.2.4-yocto-standard

      options: --use-system-commands \
               --show-diff \
               --srcdir=3D/usr/lib/util-linux/ptest/tests/.. \
               --builddir=3D/usr/lib/util-linux/ptest/tests/..

         lsfd: mmap'ed AF_PACKET socket       ... OK

----

Upstream issue: https://github.com/util-linux/util-linux/issues/4618
Upstream PR: https://github.com/util-linux/util-linux/pull/4619

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...t-rw-mode-for-mmap-ed-packet-socket-.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0006-tests-lsfd=
-accept-rw-mode-for-mmap-ed-packet-socket-.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 20b0c37e8c..b30fb04e05 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -22,6 +22,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://0003-mount-fix-grammar-and-typo-in-X-mount.idmap-documen=
t.patch \
            file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap=
-h.patch \
            file://0005-tools-add-non-newmount.conf-config-gen-profile.patc=
h \
+           file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-socket=
-.patch \
            "
=20
 SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7a2=
85c695f940bd57"
diff --git a/meta/recipes-core/util-linux/util-linux/0006-tests-lsfd-accept=
-rw-mode-for-mmap-ed-packet-socket-.patch b/meta/recipes-core/util-linux/ut=
il-linux/0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-socket-.patch
new file mode 100644
index 0000000000..e4cb92b3bb
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0006-tests-lsfd-accept-rw-mod=
e-for-mmap-ed-packet-socket-.patch
@@ -0,0 +1,45 @@
+From e3c633ee981969d4bf53d276bc72052121774aaf Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 10 Sep 2026 09:35:49 +0000
+Subject: [PATCH] tests: (lsfd) accept "rw-" mode for mmap'ed packet socket
+
+mkfds-mapped-packet-socket creates the packet ring with
+mmap(..., PROT_WRITE, MAP_SHARED, sd, 0), i.e. write-only, and filters
+the lsfd output with (MODE =3D=3D "-w-").
+
+On architectures such as riscv64 the kernel reports a PROT_WRITE-only
+mapping as readable too, because RISC-V has no write-only page
+permission encoding (a writable page is implicitly readable). As a
+result /proc/PID/maps shows the mapping as "rw-s" rather than "-w-s":
+
+  3fbec87000-3fbec88000 rw-s 00000000 00:09 4238   socket:[4238]
+
+lsfd derives MODE from these bits and reports "rw-", so the
+(MODE =3D=3D "-w-") filter matches nothing and the expected PACKET /
+SOCK.PROTONAME lines are missing, failing the test even though lsfd
+behaves correctly.
+
+Relax the filter to also accept "rw-" so the test passes on riscv64
+while remaining correct on architectures that report "-w-".
+
+Closes: https://github.com/util-linux/util-linux/issues/4618
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/=
4619]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/tests/ts/lsfd/mkfds-mapped-packet-socket b/tests/ts/lsfd/mkfd=
s-mapped-packet-socket
+index ab1f72c..03d5db5 100755
+--- a/tests/ts/lsfd/mkfds-mapped-packet-socket
++++ b/tests/ts/lsfd/mkfds-mapped-packet-socket
+@@ -42,7 +42,7 @@ for PROTOCOL in $(printf "%d" 0x10) 10000; do
+ 	coproc MKFDS { "$TS_HELPER_MKFDS" mapped-packet-socket $FD \
+ 					  interface=3D${INTERFACE} socktype=3D${SOCKTYPE} protocol=3D${PROTO=
COL}; }
+ 	if read -u ${MKFDS[0]} PID; then
+-	    EXPR=3D'(ASSOC =3D=3D "shm") and (STTYPE =3D=3D "SOCK") and (MODE =
=3D=3D "-w-")'
++	    EXPR=3D'(ASSOC =3D=3D "shm") and (STTYPE =3D=3D "SOCK") and ((MODE =
=3D=3D "-w-") or (MODE =3D=3D "rw-"))'
+ 	    ${TS_CMD_LSFD} --pid "$PID" --noheadings --output SOCK.PROTONAME --f=
ilter "${EXPR}"
+ 	    echo 'SOCK.PROTONAME': $?
+=20
+--=20
+2.43.0

