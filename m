Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C37CC5DF81
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 04:38:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14934.1787632687110047968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 21:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CYYiy2zr;
 spf=pass (domain: est.tech, ip: 52.101.84.59, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m24XCF1oEOEkUZ0UsvLkxhDYZ7rhNPXXKzoyvJlym/c+HrZfR0KSRKJTFSpXbvJBdA9jyOlya7PIPMVqNk7ideI2DjO0osioEOBZtmb8zOHdCLmMyIr+I56+y9eI3uLvbrf+DvcDapXrNdeUSpk4Trfj8Ns5Bep3BQzKbAMHX2czf0na06AtzttMZu4J6RZ2rxXMkvdSYbLJRk1Vm3KgGoEN33lsctLtu1MIRsw2G+iCC6rUOQBwcuEyiFKAvYkBG67E2dbyG31SQxsgVW9Kp47hz8pZB+gArKSMduVEnI/KwHqfr5ElM/tB9bjkveBsz8ckWSiytUpk34wAu94Eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/frP2pzA2kZOh/Jm5u5wHtz+7u4DU7tU1J8rnBBoBf8=;
 b=JK+WxgZHBR3P7lK6JvTF7zQYCu+Ochr7btxmAAsrGwFi7saXe6DkoPzWi8kTDtpgvsOyQnee1HWp0thyghOeW1SwpLwK6Rbf3rwN6IjvrDbp9YjQ0JNeuKudSYccBuDKahv8o5soX3H4ECmuPbv6hwpBgBscbKKg6pX1aeA4E5dAkxZTrlTqpc7d3iXsyluHV18+MWQr0qlaC00t+JxEGMbIiIwK7WllG8e5+hBj9jbwpjaOcHP4rb+3dgjb8LnfjcDENwuJfpRiv8zuonQU8rybHq8J+a3JejfLcqKYLXxi4ZwYa4a60oqDGxTe1q3XINnOwIvlr6pN1uAW86KNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/frP2pzA2kZOh/Jm5u5wHtz+7u4DU7tU1J8rnBBoBf8=;
 b=CYYiy2zrWYbatZSFpEg4nmiOwYF7wJkyHw8rnt4XjfyKJ3p9qMBwknP8dzijFSLthyR6U9EeeC0seYQQY3KWNpzCSl6T8rp1M7TQYqv3myGlHqKr++Sq2MS2tG+Y004K7a733JYZwoI5GrIQi5z87qZ7DohCOZBKoyY9B/v5APu5j86tr6GWkLmzjmowryI2qKF6hbic6hA7Gf1k219o1i28G7bAm04RCY4ol17csLRVpzX4vNBRPaCr6+jm4t3k/qQtcvWlfdb7pupD4aZS8egC4anIpAicUvnFPieKg9PBrTl5vADdjJyEDGlnX8Cz733rWw64a9jXPTMpoHQJJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB1823.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4c2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 04:38:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 04:38:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] util-linux: Fix CVE-2026-3184
Date: Tue, 25 Aug 2026 06:38:03 +0200
Message-ID: <20260825043803.2689-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB1823:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c7f57a-2f1c-4314-9ef3-08df0262a745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|13003099007|5023799004|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	E34q2p+oLv78si8NH7JaaHJTPABgTEnvgGbiHTfbWBTdOg1Ug/ZxJBg7arfAtK8QSALb2XiDTSx5BjRVPi2otJesQDiMOavcEzCpOmtXvhHztmzDGTiHT1RttDAyYF5eEK0N+W+Om2ouwOZJMovJjSpierakjW+y1CvRsItqPagT9H1VmbgbU9VDAl0nxyNUdoNePJ1U5gYe5+VrBx0fW8Q55Jor+wz82hTpL6cwIILtbcnV0DJRx1e2MBFRcMz5qpej4kSihVaPW1xe++ZX/xImvVBQMaIk0Km4HKGn+/GIaqzxixwmrI+EY+z2FMZS+VvSwbDo2XzcNjXMh1aDlsBwGBVhcpPfBPuRLIUFHNHcpMnPDE2ynlzHjYDEMeQ7o1bd3H+ZKw/1JzMsbQ/fRM8hhT8DIAr1HbjkPHTqekFCBoiwT3evbjNrICgoNjCKNqKoQBtgFseIW8jd6KiZdolQkedeKOLfNvjd16KltHUcKJSHwUJLGx78DVCU53lnHfx7P4BfHtYn7QAccHgj+xcj0fQnIHCc6PCto6jdMDUh8+uZWjG0JM4yTLvj3Fs2kKL2wmpF6bLpkr1vm2HKPaJpvsLE+0ugJE2Qq4IQ/mlEyewrq1MRQX5mgs8NgNaBnFy1MD4OqeH0ptwbuB7a/GAeO2GbvmRGQd8fXg3oklg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(13003099007)(5023799004)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DPWE/TFKI2d0Ho3vGTrpnt8cLdkoBr7N6FEozQ4cIhc+BXOPYJv0XV+UGy9t?=
 =?us-ascii?Q?SNqgObK6WplNYCusrWYchW0Jrj4yhr6vHwrx0B32IdjvlPocCQJ4gPgmnfi9?=
 =?us-ascii?Q?+6TNfrqL0w/yNILkv/2bDMQpSoR+zx6gHIi+HBWY5UZuObN5LrfREPbUcpmL?=
 =?us-ascii?Q?DAc5IFZDdaljIAKmBRvNAdVjVIb8kl9LNjF4vuYhPA9DKJLD9Aa8XawC0uYO?=
 =?us-ascii?Q?FMvl+lbgU0y/4TfBm0M3gDlnn7lJ3BJvMcU/3bpyOHrSIn7SnbZOtBnz8H6t?=
 =?us-ascii?Q?3A06DbI4HcEJ2Ytv2sA3KD+4bSPiwXpjKeZvVlyBKuwtvbMF4t6VMPRZs8iP?=
 =?us-ascii?Q?zoJmfXnkaIPOWD4e8dR144s/ELH+WJbNZmDUDG8dPGVcrgPBa0T4TFHWHIIR?=
 =?us-ascii?Q?uzHD8Wx5mGLdSU/FiWzedvg4aqXJfPrzzcVjx4iBDYQQva7EEzwTGNXE708q?=
 =?us-ascii?Q?nx9hTf36Z/68f92Ufr+oM/V76kE07AfYCHG/uPEJSriXgYqJqUC7By5XBoCP?=
 =?us-ascii?Q?VSO18n5gsohtg4476kGFQggQNNxQMAkxua5+A++6kA7Xl6xA3Ka7gvnFl5br?=
 =?us-ascii?Q?IatwdbX02b7XdwLiZEopekI4TDw7At/nFcXh/MY7vZxVonMK5qAF3NOSMjlA?=
 =?us-ascii?Q?tYpmSFBURfSkElj0lEOmZ9MjVtLeD7xZ7AelH5Sgl7r3elFMmnc6yGv/KyRb?=
 =?us-ascii?Q?E+YKCQ3ZI0v+n2tlmihlapN0epjHGL1R8yjMhZBi7MSu5bHKxqbJ6Inw5D26?=
 =?us-ascii?Q?gr2L8O73zGvyVBmB+M9fWjIysXBrIulrWuznJ1PR9fFG3Km238MIwu7k5AK1?=
 =?us-ascii?Q?twCnGuZlhK0QSfahgXXBS8/GfS7XaPn30B8i/lPHVl0sNXb5Vk5iJ6fCH3Cn?=
 =?us-ascii?Q?CUkxjNXlzz25BN08WTwPI9XBdRoBGwzeKJrNzo7SsoSru+4a6dXx3zjyuvN5?=
 =?us-ascii?Q?6aIFh8+o7PIhEI9JQ6v4NWuzZhyPCr40o20JaEdGNCbIflUY1qlc3+x8JHzF?=
 =?us-ascii?Q?uICFVOQ08A8vJFGO9287FbZnKyTDmxQySsDCa+egZ321iEjITG3R6ML7/+IJ?=
 =?us-ascii?Q?b3VmJLAPplqWUrtmeeJ66dP4rOvnXf/qCmHMDYVxS4Y16vdj4vv8ruLtwnqp?=
 =?us-ascii?Q?kIETLvpYfpgL5zdmCI+kBIk13ttRI0vLo/1nZLY4Hro/e2WRuOYSrxKh4Xvg?=
 =?us-ascii?Q?QVL3wOEAaXXgSMTcFSWHeii0FGxxgJeIEe/H2a4u5v7BakmgsO8P+qeQJdh9?=
 =?us-ascii?Q?vpqQSWhseNgL0pDDJlAw4Qg7vu2p5ajNuUWNCb3sw7CMHRnqu9hl0pG9ivrV?=
 =?us-ascii?Q?38lkEg6jXpvksT0fkiEX1b7N58XDgG7ElQTH2jBasreEY5oY84fvwNs5GpGD?=
 =?us-ascii?Q?pDS7wBs2pBEHfjqiaVIl0ONHxRTPDURQhKcYPoyLcwxxwd7JuujPW7wg17E1?=
 =?us-ascii?Q?YXuSfKrnRQM85gUn2j5/fBLTOunoWXF4rAEOHYI98Ew3BgArX3j1N1XVtc1H?=
 =?us-ascii?Q?NLMi9emhGO+EQ8enfCxIwxGjabr2wIALRrWDU5gucZp34wLsGM9cMckU7i2I?=
 =?us-ascii?Q?E7F4gimAjj75ohA3Q2TWvdYwzDtC+b7RC6nTpCsCXqzlAc+HJ6z7Ox4zjzvk?=
 =?us-ascii?Q?AeTjS3Ik4Wjqs3KB4K0/jfsqIohdn/JibQVO9z98spn+VEWz7Alp+PgDz5q2?=
 =?us-ascii?Q?KKSYD73m1u/VKcRs46wT4viAhojwi7Pk9Dz+yoO/3aFMmqzkf+FKGHYJH/sY?=
 =?us-ascii?Q?zD9QSF5GQ5z2aoU1c0jnp8eGqNdTbZl9I0kpfMwjucbtSpy+ekh2szrlNJM3?=
X-MS-Exchange-AntiSpam-MessageData-1: hp4jq5Riv29bXcr4pmnvVKzdoiRZi1Fdx1U=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c7f57a-2f1c-4314-9ef3-08df0262a745
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:38:04.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTG3wEF3DAa0E9RyCH8Rj7vu0dZwQsUmqVP5Elu6I25fKhiWHvgoxJrLnTD8+0d4CM0lEeh6yZ3RGRVzrSmd7tL2NpPvCQX1ynLskaMtoVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 04:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244189

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-3184
[2] https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1ac=
53d88ae07e1331984

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/util-linux/CVE-2026-3184.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.p=
atch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 753d032976..f651dc2dab 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -48,6 +48,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://CVE-2025-14104-02.patch \
            file://CVE-2026-27456.patch \
            file://CVE-2026-13595.patch \
+           file://CVE-2026-3184.patch \
            "
=20
 SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810b=
d572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch b/=
meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
new file mode 100644
index 0000000000..6dbfebe4b9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
@@ -0,0 +1,61 @@
+From 3fb64ddbffbc9442dca56eb6d4f263d525708b64 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 12:20:28 +0100
+Subject: [PATCH] login: use original FQDN for PAM_RHOST
+
+When login -h <remotehost> is invoked, init_remote_info() strips the
+local domain suffix from the hostname (FQDN to short name) before
+storing it in cxt->hostname. This truncated value is then used for
+PAM_RHOST, which can bypass pam_access host deny rules that match on
+the FQDN.
+
+Preserve the original -h hostname in a new cmd_hostname field and use
+it for PAM_RHOST, while keeping the truncated hostname for utmp/wtmp
+and logging unchanged.
+
+Note, the real-world impact is low -- login -h is only used by legacy
+telnet/rlogin daemons, and exploitation requires FQDN-specific
+pam_access rules on a system still using these obsolete services.
+
+Reported-by: Asim Viladi Oglu Manizada <manizada@pm.me>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 8b29aeb081e297e48c4c1ac53d88ae07e1331984)
+
+CVE: CVE-2026-3184
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/8b29aeb081e297e48c4c1ac53d88ae07e1331984]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ login-utils/login.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/login.c b/login-utils/login.c
+index 321f9d6ce..0c5c805aa 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -128,6 +128,7 @@ struct login_context {
+ 	char		*thishost;		/* this machine */
+ 	char		*thisdomain;		/* this machine's domain */
+ 	char		*hostname;		/* remote machine */
++	char		*cmd_hostname;		/* remote machine as specified on command line */
+ 	char		hostaddress[16];	/* remote address */
+=20
+ 	pid_t		pid;
+@@ -906,7 +907,7 @@ static pam_handle_t *init_loginpam(struct login_contex=
t *cxt)
+=20
+ 	/* hostname & tty are either set to NULL or their correct values,
+ 	 * depending on how much we know. */
+-	rc =3D pam_set_item(pamh, PAM_RHOST, cxt->hostname);
++	rc =3D pam_set_item(pamh, PAM_RHOST, cxt->cmd_hostname);
+ 	if (is_pam_failure(rc))
+ 		loginpam_err(pamh, rc);
+=20
+@@ -1249,6 +1250,8 @@ static void init_remote_info(struct login_context *c=
xt, char *remotehost)
+=20
+ 	get_thishost(cxt, &domain);
+=20
++	cxt->cmd_hostname =3D xstrdup(remotehost);
++
+ 	if (domain && (p =3D strchr(remotehost, '.')) &&
+ 	    strcasecmp(p + 1, domain) =3D=3D 0)
+ 		*p =3D '\0';

