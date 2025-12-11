Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D92D41D4F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:46:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10861.1765464405063300089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TJts94/6;
 spf=pass (domain: est.tech, ip: 40.107.130.31, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJSIwW8lIjANViNT9gLyLN7yGbcB6cutcFlFcAngSxY9CXI5rxrXudjfCBVqei1xQ5cwUbI5zq2W34G1ngBHKRthb883QWCYum7fQ6/dTK2n+VfLnXEAX22odKRYVt897wy8PGcH3Ff2yewD1BNnAFf13yOV2/ufS6ZPBxUnUT5Hv4Qoiemh2ZkcMwIzPtLR5bb7C2bJl0HVJlhXb8U6Mdc1kJsU73Zpfze+fIfykys7HHrkxNc7v2Y489uQ/IyhQFCGzVMMCCA1iNzOil38/ZrfD8TyFknmjL9vvX/PY/I3Rl7zUzIF05S6+eoknZbjRgN3s9kKUIBzNzlkCK54/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3MyWO1KVTEEnVU5rKZ0RkDLWTHoMLOZTibBdwD8aRs=;
 b=WFk1l0PWj0Al3KkXmMplXQK52QRZTfG06NtneKoDcpp4V/+cznLV7e6Oe8asfZmy0ysnOI5Q7oos/wIgiNHzGrFhecl1S+3KGKyNyGfcI9+8ZC4RRl6SUp9czjR2F1TYxclBw1rWFLZxK43qF+vRswsHahTDi2Z9fdc4ydlMpjKSN6/JZmXtVPdNuIBND1DEcs5JAEeoJqBie+lkiJYQ5TcOmaTn5Hdns0izp4RjXvWEpqrv7s17JpV2RePjQoBLppXdzQi+t+amEQw7j8MdsJyzwNldMaCimj3RDQBsHrYCs1BGmiuopS2VuCXtwPHowlUoGTCZ6Sw4GPP0o5HuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3MyWO1KVTEEnVU5rKZ0RkDLWTHoMLOZTibBdwD8aRs=;
 b=TJts94/6jWkheMTCBeRE3iZiC21Fjr4NNKhN/wbp9fTp8p6mnWccfnemXgH+rxMXi9UXw4xYsz6cwwavXJZIMwV3CGyH2dy3vnpVQWSF9xLfQ8ZwlgkY8wtGRnC/umOPox5p5kX/6oeaUphalji1v3oEuQXuYjdpOLsNPz1FhVQDXcV1t3TtI8AzuzB7TjT3Gj/zcQtmgLXjt+L4PRMv13UU66Cl5YjllqBit7QF25kHTkkEPiD/bpscN08ibIuDRoTuF1eYkWBKzsujKPtnG9JcBtaKr1zMRQZPDjV5utdo6R8oNYcT0PgfTB04qYyLmQTq6pv0YvPf/UGWl2NQFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AM7P189MB1090.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 14:46:40 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 14:46:40 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Amaury Couderc <amaury.couderc@est.tech>
Subject: [review][OE-core][scarthgap][PATCH] procps: fixed large pid issue with top
Date: Thu, 11 Dec 2025 15:44:22 +0100
Message-ID: <20251211144527.43224-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0147.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::8) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AM7P189MB1090:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdbc704-199c-425b-9767-08de38c41847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JUjzTXp4+1GDE7fid0ZRCPpx5QWJ4xgIFO4ZjFAmi+MHqXVPdBQGhZ0h5fBL?=
 =?us-ascii?Q?sUClf3AzgUCiX2vY0oQjUvXgLTSEbEv2pt5rY+rQml7TvW2kcEZkJDdsKi+X?=
 =?us-ascii?Q?X+8FQmUAj/3xFwPYMCYVtTbuMVdfqPS98XwzRKw8sMt1F1ReUP1AJEnJ9LWx?=
 =?us-ascii?Q?rtK/rhJgbvrn96qDUd+1JtEej/zS3nCmM5buHZUrjoKsHjlkraN4HZu16DNe?=
 =?us-ascii?Q?EXkMmis7+mH4VzVgkNddKiCX9mpiLOZxpy+b86kokRNyEVCAkj/J6VHd4dbB?=
 =?us-ascii?Q?LFgole5NeXtYCslfnj9LQiYL54jdXORRWxqOBo46sI/N/gMqyGIuT5WwcytY?=
 =?us-ascii?Q?uvK0UMAMmGnrTf6g2QGjS/RH1CnO1FwmI/psPBUacY6iKlIxpH45TFKlYFw6?=
 =?us-ascii?Q?8DRhG0rN9pYxz4I3AJce3GfASX9F5S25IrOSsiAmilZVIVglJF9bIgqxS0UT?=
 =?us-ascii?Q?wEJQEvn+pSDNE25MgCrK+/crfRO5kVQ6AGevM47zEyAcE617I9IN02aOWtSn?=
 =?us-ascii?Q?07FqYh04zBsdQmfNwrgZeIeHwBTSGNAo7RvjftYi+0Tg75Y0oiifACbb+edm?=
 =?us-ascii?Q?taXOUjmbjeXwcwDlYt4eH/0w3HNbhiB40yWTRDnmWmRXTHWsiVZ9HDUadZeX?=
 =?us-ascii?Q?AMSGHVs90Sf+umdaiTK9UEresVPe6fW33WfATVhbogrZPP+PGDN6Yk9JFiUT?=
 =?us-ascii?Q?nMQBE6WkFDlx+YKahhidCGP0cilAwCDQ/Gcu/rvR1Ro+/PylJS4JiYnLPvyk?=
 =?us-ascii?Q?aS0cprUhmg/LAI86jEYQe3lhzyzB3cYwN+QrlbrVCMYV/hL1F+gU6Sd3jcq/?=
 =?us-ascii?Q?OKl6x4E+qxd4HYhIWKifDk2bvaZ7cuf3UNS+IpqMLIifxvzMAHpRHifCRLH9?=
 =?us-ascii?Q?4ybP42Fx5etw8nEjYU4aCUNopGrrfy4TPJSS/4vRJ0OW58YmQbLsn+89phyl?=
 =?us-ascii?Q?Su7LpmNrrYiYaM2qpkoG1BbMUhWOlNKmSYUm5+3EMv+jPWpf8a3l9GGkYJU7?=
 =?us-ascii?Q?VgRzT3Q/Uq65RyXN9mqdU7xaOVUo9miRV2O5K57Vm5NvuixhsddxY7dI2uV7?=
 =?us-ascii?Q?hZKV5PfrveCCy0KP6TWwguMEfb8FCjDH3fxWISO1pFddKOdMF8H41hg86rF9?=
 =?us-ascii?Q?JkA5zU0ON3JbZ3ulte5boTBu34ZID6z2/zkTh2Cw9564Ma9ty/iXIFL0DcWX?=
 =?us-ascii?Q?0LxpIxTzTuq1eoBgArwXu7X+oZHK9NM2hdORAxdwyKDUaY6QZIyURauv7nFW?=
 =?us-ascii?Q?zUmiwKNppldTHT6zUYEeda8ueeAiT2dIN8xv4zRHx8AwMqmcaEbfHlJtQ9qW?=
 =?us-ascii?Q?MbFudKQ1RCzZ6cyuXrKHvx8v5BHGnM6RvYNy+J1Sl/ZGobz0N8Opq90Fghp1?=
 =?us-ascii?Q?zZi0zSAuO6dp5tGdTTKJz3qq0A4g6Zaj31JOfXAK9d81+LTCKkW5xr6GqxKf?=
 =?us-ascii?Q?H8G3lM+yWL2uQ0880kyPQ5V9MNKw1lJb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DLgmpVFekplA4p6dalLj+E7EJ36BlWDANm+cCz83g1/a+660TDC5fLN79Zi1?=
 =?us-ascii?Q?MwLFo8yzNJs1Opkp9KT2xHALB5n2t3DqGYR2Jf8mZlFYLlh4L+d7p7WQbSjL?=
 =?us-ascii?Q?8/J7tW/MEEb5FCKFy2DNsAgqvvjgARtORrwUKeqLx5SHRLBL3CXwQFdkSqLc?=
 =?us-ascii?Q?Q92/wc9t5XXL+ru/iJXC448k8EvYlBYpa/Jv0t+HWilw8ILX7Mo3zI9wJO3b?=
 =?us-ascii?Q?1LJoQFu1wtv8bYNrgwOSwllH6f+ziIh+wHfVaUdrx7V4zvuY7RHlI8Rmv2yu?=
 =?us-ascii?Q?QVN8KombaQBppTLiJMkAR2z4r+1dH/MM9noF/+kfIOah2efXf+ogiDVuhi6S?=
 =?us-ascii?Q?hC9yNdwQBKt8Z48lXvL1g6oKiN3iQxa9Ee9aMPDsotlAelLZkGFYMvhO6PJJ?=
 =?us-ascii?Q?tiugxReWlOjQ+zf56oLOy515a4uJ1EszAWkWB33WjgdS3RpM5s8yQfNLInu6?=
 =?us-ascii?Q?FATbh6VrQCateZ9USTB9Bwmchmccm2k09sMQM7rg41EHWo/7ZHaLQWY8fxFX?=
 =?us-ascii?Q?qZLj1t8x660szgFRaDzfMUjBIW+UeEznUZYnEnl9zc+XeL660CBiANnvEUrf?=
 =?us-ascii?Q?ApCxbdU2op08FOlLdsFHzBbLJimwECLpj+lMOQ6QdsYOERZLyXeJJMpQoW9f?=
 =?us-ascii?Q?ubnwZ3zZ+SPk7317OGB4OpO/6LeNl3L2B1x0ZteJGjNCZINJXd54J2S9JPs2?=
 =?us-ascii?Q?OUIrd4Ucr0NK8KwU/12VCB9UGDK/Td5sRemNfEnFggUIqXbr/QRT97qQpJfh?=
 =?us-ascii?Q?s+Z9PFMJ/fGqL9c5gDB/QPZlMAlvj4WF6P+efM7VfvzuEZaSF4PpOOrW+RoL?=
 =?us-ascii?Q?7FWGgb1Yd4io+XPt9gd6Z6PV4W5q/xhnNGSrFD6ik9eH48+uoQJDW09tRMHv?=
 =?us-ascii?Q?0rtIGjUJg5h8Iw2dwvnjLlMwKGZDjU1JzqMRxGowPbKre0QoC/KP8Jc+KQf8?=
 =?us-ascii?Q?anEYI+O2Bl5+7yEe8bX9osmOXc/Kyrc6xjDx1ZfIeCJirQGredfphvf9JNxg?=
 =?us-ascii?Q?kffrMWL7OiCHZ167oL29deixkj7MfWrIdfPSGRaGaI0/B2Tkr4o/kjJpNluZ?=
 =?us-ascii?Q?Ybg5a3mjxhqo4pJvLqbt9zk4xaZs8cHcx+8OUttKBQol5qsuUxO1okR82pJy?=
 =?us-ascii?Q?jdFdBb1WlnLAsB4ih7zMy1gznJnOSWZHyUduj6koppHx/VAB5AlYCEZ4ga01?=
 =?us-ascii?Q?nUDF8kp+x4swWjiYhsiSaQb8gyTRfrO+uEzT2RqqQWlZEIlQ2QlXuV+W8ciO?=
 =?us-ascii?Q?hN38spMOfjUKq/KdYRqRNYcbpOwp9J0qKywFOrsWe9eD9YZI6MwXdHRhpBqe?=
 =?us-ascii?Q?jqTaBGiYyF6f8yHt4CUs+KofHrtL+BAsURRA85H1VkEcUxuncM3h1Xb7s4NT?=
 =?us-ascii?Q?kcEfXuaR2wRwsKDSW5dA2YIjI2tZhUKHAV52mDW03lX2l6hxevoRfD6wSk4c?=
 =?us-ascii?Q?h3jnHSqFX5/zdnnE6pJi5u4XhJGVVPhtQ+f0HF9Hc9quqxAh+FXYAyGIMmgp?=
 =?us-ascii?Q?SMZGWBjFMbxONTpsvrbAlCnD1K2QBAw/Ilqf52QYt6EKLy7Z9hEfDxlimLRZ?=
 =?us-ascii?Q?PaawKVNOpIlYkSi/+iwVDAyOV0MXMeC8cvBPiqRC?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdbc704-199c-425b-9767-08de38c41847
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:46:40.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCI2G9AxWCEuVId4WS4gQVuOIZkV4nhiWk1zf39Jd4kgtHg9YGkOR8Z88Tze22bH//nAhlggTKvF9wMFGERGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227538

From: Amaury Couderc <amaury.couderc@est.tech>

procps: fixed large pid issue with top

top -b -n1 -H -p 92233720368547758071
=E2=80=83=E2=80=83signal 11 (SEGV) was caught by top, please

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../procps/procps/top_large_pid_fix.patch     | 52 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/top_large_pid_fix.p=
atch

diff --git a/meta/recipes-extended/procps/procps/top_large_pid_fix.patch b/=
meta/recipes-extended/procps/procps/top_large_pid_fix.patch
new file mode 100644
index 0000000000..d7e3141e06
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
@@ -0,0 +1,52 @@
+From f21fc624d960d12afa399af7333d4f9193fb2ffb Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Tue, 16 Sep 2025 12:00:00 -0500
+Subject: [PATCH] library: avoid possible segmentation fault, <pids> api
+Upstream-Status: Backport
+[https://gitlab.com/procps-ng/procps/-/commit/5461b50b1a85c5e556c4cd2739ca=
8ffdbc69399a]
+
+In the issue referenced below, that SEGV was caused by
+passing a '-1' pid to the procps_pids_select function.
+That value, in turn, is caused by providing a LONG_MAX
+or greater number for what was assigned to an integer.
+
+So, this commit will help ensure we avoid a match when
+we should fail plus skip some unproductive libc calls.
+
+[ the same problem occurs in that old 3.3.17 library ]
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/issues/394
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+
+---
+ library/readproc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/library/readproc.c b/library/readproc.c
+index 2dfe4c9e..d0e039bf 100644
+--- a/library/readproc.c
++++ b/library/readproc.c
+@@ -1434,7 +1434,7 @@ static int listed_nextpid (PROCTAB *PT, proc_t *p) {
+   pid_t pid =3D *(PT->pids)++;
+   char *path =3D PT->path;
+=20
+-  if (pid) {
++  if (pid > 0) {
+     snprintf(path, PROCPATHLEN, "/proc/%d", pid);
+     p->tid =3D p->tgid =3D pid;        // this tgid may be a huge fib |
+=20
+@@ -1546,7 +1546,7 @@ PROCTAB *openproc(unsigned flags, ...) {
+         did_stat =3D 1;
+     }
+     PT->taskdir =3D NULL;
+-    PT->taskdir_user =3D -1;
++    PT->taskdir_user =3D -2;
+     PT->taskfinder =3D simple_nexttid;
+     PT->taskreader =3D simple_readtask;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-ex=
tended/procps/procps_4.0.4.bb
index ec8c4b0261..3c15f28a5b 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.4.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=
=3Dmaster \
            file://sysctl.conf \
            file://pidfd.patch \
+           file://top_large_pid_fix.patch \
            "
 SRCREV =3D "4ddcef2fd843170c8e2d59a83042978f41037a2b"
=20
--=20
2.50.1


