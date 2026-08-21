Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B17FC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:23:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2951.1787300572009066037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uyISukcc;
 spf=pass (domain: est.tech, ip: 52.101.70.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpIi/C7qtKPctY2r3Z+qCWPryNNkwC3CqYlt2cdXlwZbCvl/40wO3EvQoaHvNeQvEFp0x6DaSNrTVRbbY65TbkbvH6gWVK9tG1ILUCS2oyk99CpBnDERUk3Kgh3w3r1kxQ4O6OU4+g4ShBkGy1lLGrniU2K06KOPsmdA74P31OcuBQZu+G6okKROEgcE133dUFMTBAX9vDgIzKidAay5cmD5DKO6bzD5yC2MTePPU6lLyrDWbjwZvO/IAaXXsSOC1aSz9IUOC1PB7JG8gihIASrJ/VCNciR5a7BoRTFwaplVHMmQf5BeDYYF5U/SCIg4fJtsS9kM4RbyNDZTX7kTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuIjaOSH62HW4PYPQNR/mw5hSp575jRLK02UCaumW/E=;
 b=n+6fYPPJLlGxyKj9aG4IczHne6TJzXWlJ71RtgeDbP/Z2ZzGTJq7qqfF28Zc6FZXg+MMe678BRYRdFdUe78tKKokDDIeEnZQrBDpBhWVaNOvx2J8zIs0Krz7TNRzjIEfaSasjjWbaaq9CtN08cBiLJpoEG6ysRtxLLrL/ZjQkTpzwQUBxLsBQGskBjNjTiHm5lUMaD+oswLZpl+Zmd7rZZKaJeeVgV/XFsOzBUim8lvupmY+cFVpd5dZIRKvJDX2tN2QJbkcLKcc4iD6ok5VqpVXbiE+9UAliCvXdAau8+Ae+GmLS54rrnJFzpVP6bTTidDd24uB7qsZ5fXyZIaYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuIjaOSH62HW4PYPQNR/mw5hSp575jRLK02UCaumW/E=;
 b=uyISukccwA9Lm1NbmqOzoLOg+53TYSJ0916stARrw3xEr0JL38oLc0P0pmd98/VHhrvlY16/kjzdzeqdoyzV9cw5wqyrw4Tb03CriADttfadEcWkihgBgek1xPhASwdqzC0BvYxJgLlPuzkUgr/rnFdJ+BDoLeRQl0H/A9Nghn7a6J9hC3AsiDffXzd4OE0fOr2XRuzsZLPOdPzL7tYOnbDPkzw3bctJnuQQXAiwAohDAjvlShc1SpRudPLoP+yz86l8bJrgNGtwGwXG+mkb3S2fA5LQVnmdpjh7yOZ0N8VKIEW65jQcb35peag8PI7369jMsf/5c9SeW2JtRMuXEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB1303.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 08:22:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 08:22:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] busybox: patch CVE-2024-58251
Date: Fri, 21 Aug 2026 10:22:46 +0200
Message-ID: <20260821082246.73535-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB1303:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a58d086-b339-42a6-fdb5-08deff5d6248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|12006099003|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eeiLcL2/EgwLscVXiPjaSfJlWot9DjN8iyc83sOSPDnktHa/jWcdQJ8sS9AVaQYQSjplyZTsC11/sfCp8sKSv1ZgYdHen9wCv2PJCSa8CyEnwNuoUapDh0ECLolSNKs1W9negVW9gWvt9SRrkwNPJgdJRnQpjur47Mhcmxqtm57dK3LyBwZC/2DEG1/rR7WWWzW/rGKzLznFjrS+ft6NISnarkveDgdx2M91v/zBvZsMirLdRn127nTF5eW4HxOqzw97wjrNZITMtOdsz9eMcImevwC04nDrVMZQcRfdronflh35u81aTx9A1V/DCK3+Tv7p8wJVIkQ5RmkTmK7cSk1N6Mksl48vJcIKVLquc3TNdoUHAPztlD+8F4DeZ1ePLedBypqSqdJYJqpyANNkZVIAQpegkRfFiK3SomrFoMwFgf4tQia5hiMiC4YVon3tU1O0iBftCPRKvXeM27vRC9SdMuPy8Bo0yGQBa3/NpxGlj1dKoRNC0TBp79DBtv6jLQ0VMJuiZ8k/7UX6Eg0j3snQusuBFO/ACp/KdsIxpwLRnILUzjABM61ZgQoHm5cfSxDWgZ2S/6iw8ZQ+W6Uuvag2HGeDlfAwPukUIi3RwFFUTutDe7yqYYJPEbcPAvDN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(12006099003)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LbNacikPW/eXteeDDVdsahCv0h8Kir5unHho0EowOz7S5Sn+WJYQjJrFAGYq?=
 =?us-ascii?Q?ilWOLxzRJ08sHIPTDTlzLh/UiXfIc7hyRjulRprgI+OkiqCEVwF5Z3tttdAF?=
 =?us-ascii?Q?gUmi/hh0XqYqLOEMVsDXX6+bd1/ahq9vnLNNjPyPXLLpJytO5YSBuF+Rd/6H?=
 =?us-ascii?Q?Xgf2XFqpnhi8LLO8LQrXXgVw6XoVxttOCgDs21sV/5wSzM4b41MQEaIiY/2s?=
 =?us-ascii?Q?+8bbCbKFhPjOF2wjZC4qT26Fy8EmQ8VChAhBg9/hGXAf3mRugRBZ7mbX35WU?=
 =?us-ascii?Q?5nPBZBWWaAIF5RlqXf1OpKvV9Q4GF63CgYy6UF9U0f9lik9FXWT/Mqc1LlO5?=
 =?us-ascii?Q?Af0cWzKwIHeHrcF2xYPeY67xp/oMpWkMqmUk1YfBd99bMWu8dof6m3xcScMQ?=
 =?us-ascii?Q?YzW++2QwGd5cncWufbmSFqP3LCuYMa3GthLo76rroBuNHmjjlEp6pLr5OVy8?=
 =?us-ascii?Q?ogZnveKNW3nJIwpH521WHUdC4mpyG+C524IUQfzIsoow9/7MkbF5bv6em5g0?=
 =?us-ascii?Q?1Pi9HJlC2YYkZkQ7fNxRgORa2qL+LDkzEH9DnU/DTIfeiSTOKn4hhzTlbzqR?=
 =?us-ascii?Q?nP2X4jYgauUJwLM232FWwvtmXkl6SZi1AuoG1oNd6Yw9womFX5idklSCepQ6?=
 =?us-ascii?Q?D045cO6P/TUAeX1f9wSfOLjwXygB7YxDO17qgadBbJBML5v4Bv5CA8eS4X6v?=
 =?us-ascii?Q?6ZCA003lHiBv/2i04MkcYfe/ebtEM8B513YrGfG9NSFnbjQufq0jI86hGXLj?=
 =?us-ascii?Q?YfKnS60P0lE2+7OEzEYCpSdl2U+ltDpn2lmpRvi+O84/gR7UrUZgaQoISzoF?=
 =?us-ascii?Q?2k6IpxliXQllpKZrp6DyIiElT9oTqdHxYCt4o5S8W/bYAuye3ErO7bfe350a?=
 =?us-ascii?Q?UH4ly5FOYueO37Tn/leRr9DhZesdPhLzj7d7vbg+wb3Hv5BcA0UGTvtzYFjK?=
 =?us-ascii?Q?8dbiS2X1QmULkUtF6JtSHEXbqdr9bAH3H9MySK/RvwafrMmbiTCWhIgA3L0g?=
 =?us-ascii?Q?WNi1jXHYKOHY0h0pvvKw/utS1blsxPP0dFguzLHX89gB5THZFqlxCW5WdTyQ?=
 =?us-ascii?Q?UsvfJVzUG+pUq5VWaV+a5evPu+x4VER9udGMgYdE02tNTimNQgj5IYfPh2Vl?=
 =?us-ascii?Q?bEABQNxvzX5RAeI1siz2cAqt3zsFByWqxURlnTEpaUT6jgCL7dPL2UtgHMbh?=
 =?us-ascii?Q?BNzY5ZNWD+uGQPo4Q5c6/oFDRJKwsodix10jKVc4vM1FaHNCDJFwsAh6Rjgl?=
 =?us-ascii?Q?f0Tds3rKAfy/Wu0eiEshvcwh+zotICz4ITEWA9XRe/FIf/LJnmaemptqmD+s?=
 =?us-ascii?Q?PV1oilwqTpHdFi1+JRwRBdAfVl6Xy3CQtiRyI/j49GLPQ0SHAM4uwjfdosZU?=
 =?us-ascii?Q?6+f7018bYL9LHpON94iXmQGGve12O7X8/zLBEsquf9kcL8X8k4MsAtklXyNn?=
 =?us-ascii?Q?4dtx38D9CwC3+g5TPtuoA4JzVjpdnTwTxg910U7cfEjB4afUcLkrAtX2qd0K?=
 =?us-ascii?Q?iCkkd/GtURkO6StLkj/9rjcq47B31BcUS2KAAEQpBgnOumScziS9YaTbwuQH?=
 =?us-ascii?Q?+zh4eaxJOE7tYtfdrsqGGpo21clLwmbKZZDBB+Zfa4u2fukMitrWT7EYnkXM?=
 =?us-ascii?Q?W0mCTRL24qOXYCsKe7bGv3E9ZMJcbQp+qZ3ERUlqt5+DCVuhfeOjr+7HRrWy?=
 =?us-ascii?Q?tahlEV6tZWYUDWn/3VLi/gDtg6rXOCXiY+SHYISToP6ZfrZRFL1pnsE0vJyn?=
 =?us-ascii?Q?pX9Jd1xiAAKBtrGe9eiGz1BdIh7NhWo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a58d086-b339-42a6-fdb5-08deff5d6248
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:22:48.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBpEg9EbF1/B3YmqJ9YvsakjnhBisdIfjmDV9CBxmzOuFweceEimvyrr1EjFgUagkfW5Rttfykg1i07THmdoFVdG0jKUh0P34NZpwUyXmtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243898

From: Peter Marko <peter.marko@siemens.com>

Pick patch applied by Debian [1].

I did not find any reference on busybox mailing list that this patch was
submitted. Submitting patch for someone else would be inappropriate,
and busybox is currently known to be very inactive, hence the unwanted
Pending Upstream-Status status.
Also note that the related busybox bugreport [2] is currently not
public, so it is possible that it was submitted there.

[1] https://sources.debian.org/patches/busybox/1:1.37.0-10.1/netstat-saniti=
ze-argv0-for-p-CVE-2024-58251.patch/
[2] https://bugs.busybox.net/show_bug.cgi?id=3D15922

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
(cherry picked from commit 7261144785aa508377c995e52d7e2410a814f00b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
(cherry picked from commit 8f344d46b96fb16632501749dc39b97aa3e11836)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../busybox/busybox/CVE-2024-58251.patch      | 51 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch b/meta/=
recipes-core/busybox/busybox/CVE-2024-58251.patch
new file mode 100644
index 0000000000..713d345ca8
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
@@ -0,0 +1,51 @@
+From: Valery Ushakov <valery.ushakov@bell-sw.com>
+Date: Thu, 21 Aug 2025 12:31:53 +0000
+Subject: netstat: CVE-2024-58251 - sanitize argv0 for -p
+Bug-Debian: https://bugs.debian.org/1104009
+
+Signed-off-by: Valery Ushakov <valery.ushakov@bell-sw.com>
+
+CVE: CVE-2024-58251
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/netstat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/networking/netstat.c b/networking/netstat.c
+index 807800a62..d979f6079 100644
+--- a/networking/netstat.c
++++ b/networking/netstat.c
+@@ -41,6 +41,7 @@
+=20
+ #include "libbb.h"
+ #include "inet_common.h"
++#include "unicode.h"
+=20
+ //usage:#define netstat_trivial_usage
+ //usage:       "[-"IF_ROUTE("r")"al] [-tuwx] [-en"IF_FEATURE_NETSTAT_WIDE=
("W")IF_FEATURE_NETSTAT_PRG("p")"]"
+@@ -314,9 +315,12 @@ static int FAST_FUNC dir_act(struct recursive_state *=
state,
+ 		return FALSE;
+ 	cmdline_buf[n] =3D '\0';
+=20
++	/* don't write process-controlled argv[0] to the user's terminal as-is *=
/
++	const char *argv0base =3D printable_string(bb_basename(cmdline_buf));
++
+ 	/* go through all files in /proc/PID/fd and check whether they are socke=
ts */
+ 	strcpy(proc_pid_fname + len - (sizeof("cmdline")-1), "fd");
+-	pid_slash_progname =3D concat_path_file(pid, bb_basename(cmdline_buf)); =
/* "PID/argv0" */
++	pid_slash_progname =3D concat_path_file(pid, argv0base); /* "PID/argv0" =
*/
+ 	n =3D recursive_action(proc_pid_fname,
+ 			ACTION_RECURSE | ACTION_QUIET,
+ 			add_to_prg_cache_if_socket,
+@@ -686,6 +690,7 @@ int netstat_main(int argc UNUSED_PARAM, char **argv)
+ 	unsigned opt;
+=20
+ 	INIT_G();
++	init_unicode();
+=20
+ 	/* Option string must match NETSTAT_xxx constants */
+ 	opt =3D getopt32(argv, NETSTAT_OPTS);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
index 7929d396c8..698d835888 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -66,6 +66,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://CVE-2026-26157-CVE-2026-26158-02.patch \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
+           file://CVE-2024-58251.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

