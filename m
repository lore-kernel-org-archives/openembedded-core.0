Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A88C5B572
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 04:38:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14759.1787632679877863504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 21:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CJRrZhWS;
 spf=pass (domain: est.tech, ip: 52.101.84.35, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLV/Cw8HLKUbwJbKetmTO3Dk4/KHHsIDk04Gn5lygqd+NCBMnwTT2ACkD2zuZoaWUgdoY7d/1LNHNW7MADH705y1EDMitC4yLm7UMNP3dFfHzBBhqKT5SzW7HGNVPedjIIYfWbKGCBClCFUCsOTDzpBn3EB9sKMS6OwZe11jX1WPUDF48vnQXqmWqcn9BXb4NXv7+91+DHvcQDicEhFEvMges2JTc2/NXCSh9PLXCB3aqahA/vrQX3SUrN01MAOPHsafG5uez4xfc4UpszKnrna21diZdCTDaEZbDLEbf22MSpX4B14Tmfb8TnUDEHmn2DSF23Ki9uwlZtZii5LGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKMuB6GbwAkAe5cPoBaM3AtWes5yVRLoPwNzQzVQlRE=;
 b=trz6izFcMLZnPdqDos+j7iBZsy449GrvNveWhKrxaMmAuhzM/7u/Xx1TLFKBScKiKukmwNPaIXyAKN5zNP64tra2n4myGiXiOa/5V/iPviJZgt3iRChKKPgTduOoKrswNWVegZLpdpHbx6Klmh2BQBvHBouJq6sc8VEq9h4acIpyjyEcKM83OBy5uKBjdyXdeAevEDML9vUmfnN4q3XPobJudpnsaTIZcn3dmiHIHtIHdcuRdMiBAGhGk5Z3xP/MDtDm3qbdYfr7wXg8Ld52lejwOEo0bBOMjYvv70YPF53ldRqaHmHcNhfGBqPnG8cEApINVLcbCt3nDGpQx1U8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKMuB6GbwAkAe5cPoBaM3AtWes5yVRLoPwNzQzVQlRE=;
 b=CJRrZhWSKjlVrYWyNPKS4R02NAEQYP8qApS0COYM4FmQXdrCkV3iUgkKOzyjdIdWZD9AC9AoFXVQqjyjFR6xfj6uV3jqMDW+Hs4MHSAiJkoUKQecA+LCwvTW4qAA/VGUAr4BZAUVsOEXJvVc/fmUhpM/gN+c04RIvx21Gq+Yu+wif3pVJBdAXyqP9e2dk+v22XRvdNHq/0+EdFxuxIc/eCHeRZZzvyVzPZCeVZAXQZ3yA5LdLCf3757M0Qbg9s+PHF1tIuACwpOvStG3GMdnyi7Ch/s457BQblOQptkfPr/zoXVbN74LQl8vq7dhHlp3R61zA9r4YMRcybqBxpFIRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB1823.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4c2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 04:37:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 04:37:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] util-linux: Fix CVE-2026-3184
Date: Tue, 25 Aug 2026 06:37:54 +0200
Message-ID: <20260825043754.2652-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB1823:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f404f1-3bac-4f3a-e181-08df0262a1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|13003099007|5023799004|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	XsxrkbWTGPipn8/uxJYpRJYA9oVyQ6j8+4uyh2JmRrWgU+iH5zbCU1gDAhbkZNr1ntKheFmJ32SvsmWFh+4d71VkNHv/x2cdknxTTS4t2rWyQRF9wYVSPVsumMNBuoGvMnvu54eyzc7v1mzHQBW8GFG6YfAzHgKybsYNp07DFGwiwVJcgVyAr5RS9ThSPVfT3KoyJ7q5/wxm/FHz1qvQhXEVjVLBD4mSfNPxyenpZ0c+Fap5IyDKv2CCaxUxBTF4JegY6HBCaCCxDaJck7jnvrUN4xA7GuM8aeQaq0pZ9R61ob91/mQtcWWDABCmZ+UQih4W2Z7Hl2+qU4wu5JfUUofm3pRVPIArQ/YKcr6GQSP5KYkhbTiN9adXPBbSzA8pmrga4RDooe6VHvmrKSjwfhdW/SiJsG3c3TdNUbsVJ+q4z/h0YdVLHxiklv04f/KyDytJFWIQsOPoM6r5HM+xCi775DP0DVWXlwR+wDLVaDFQeX5kdo7Q6JjQpx8/VjWj4djvm9qXOTAGfGfOhuHJA1s5bTWd2eUbOgCNIVSi628olwWjKJVGQcuhAMo2j5vsBOms4AIqKVmGNBT19rHyxJAS1gt/DSxJN4QzSHprW45VzGBEkSh/Zp5untKb1JN0UaAIzNR3Bvs1yOfXNTzx+I0OVsQdZ0lw8rRnPfeoFs8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(13003099007)(5023799004)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XY36uxqpLPv1LcceG4vPS/hKSH5TlXiTWlKbh1bago+pVl53i1+joR3xG4ZH?=
 =?us-ascii?Q?yHXbi2jWPeoFrqABYNQYY1DhewAzv8AyAXuQE/FwYnwll2Odh1JhRTc8o7/T?=
 =?us-ascii?Q?kQNQDNVbvBU+DAquNBpwU7inTjcW7OxNJocqWXxpioV1MpPJBVWggKR6SaRG?=
 =?us-ascii?Q?zdo3ZpW+cYNrbC8SJAbvdTkCrdKN0x6G2kSr47CQBPlygN83tCpXQH7eF+tE?=
 =?us-ascii?Q?CH+tYBkTU+OhIpdUOvQQUJ44xykDduZir9jnI6WLGWSpcBUwd0Yb5BpooXAS?=
 =?us-ascii?Q?X37mWMxQcyJCEhs47PUW8TFkIQ53K/lqSSkmN6j9SN9oun50OuD58ccd+gos?=
 =?us-ascii?Q?8sC52Nd/bKe3Y7gcJXEKGqTHBFjrFJ0AxmVCh5oJGcr+Y3bNv4gHJ5rs7esd?=
 =?us-ascii?Q?gYr3eOgLg6J4JXjqyiYk7BACwy0FVSdqB+2i2ynvJLT3JUBJ1ETEXyZEjLb8?=
 =?us-ascii?Q?WUi5UxQ/AmjtSqnw2UCc4gTqEfabhSS2eXa+VRmfxXHcYICNQfgergMvgdNu?=
 =?us-ascii?Q?LlRh5jsJw6Rp2+n2OgAwuWU4I4FPYOGtLvJyHIWyMGmOcYkxkVke9QrvWJRf?=
 =?us-ascii?Q?B1p+ZOEZTrrcpJPVtMuk1Ii7Y5HEkQ9DuJfmew2QZ56hBUN8l8LQxQgk24t7?=
 =?us-ascii?Q?cotsVXYS3op8bJ5KkQvmch1TpzmossMp1okNc2zf74JaNGAEl6AUsu5QJTMR?=
 =?us-ascii?Q?AVUuJRm1oGbSuLbE7B2MdwOIzw27wGx8PdX0I919scibZqfN6jHNdx/PVuoU?=
 =?us-ascii?Q?r43bY+lhdibTAeuvKuwLViMyObmdZOgoxmjom/Mdal6gycOvDt7dDUpnD1Vt?=
 =?us-ascii?Q?47lEGVpesO/IzO0trjPJmn5F5qVvYzQ1qr9lv4iR6Rbr0VIdtziF3tRqT0Dk?=
 =?us-ascii?Q?t9GJZlOEgINNDB+s7XLM2lHb4fiFu4H/OEwMLudgyaVUBqt8FnTCila5xyuT?=
 =?us-ascii?Q?YWWQzv6C6oMZ37F0m4urEXnaFvgiaWrxlST80mB3jkCLXfScxw2UAGwiHyN/?=
 =?us-ascii?Q?IMjse385yzbs7ekwnruiFaeWL1ZoaQOfnc0plLcKekM2vyL4osBWpT26meQC?=
 =?us-ascii?Q?BY26YdT61+NI8ObII1Mdd10bwLVqkGyseGcjrZRWI2lgQX0A/qAQTj5lu5t7?=
 =?us-ascii?Q?u/ujyttJwblPc4wZlp17IusutxS/QNAL7UOXu3FHtJSh/51tBt0XnjjzBdl9?=
 =?us-ascii?Q?GXfqPHrt+LHyNRcfyxIi0fQH1zLxDbHFdhtrPO6b8GVEOyvfzDfonQCjl2DS?=
 =?us-ascii?Q?cKFVg5hNjWGPH5QgRa+Rx0aoHeLbv+SZQzQ9VDq+crxQjPrmGcMsS99sK/6Y?=
 =?us-ascii?Q?6mVKixbYLKEHvrIyEKZH0ok1m2Eiee3j52lqryCGpxUPI0CRJpx2xfRHcnNC?=
 =?us-ascii?Q?huXR5riUO4uCRAhobROK05oWK6iRiwUJtYOFIkdv6q7aPekVp4FPcuFju1HZ?=
 =?us-ascii?Q?9cx4Iwwu4cZnUMiVFcoiQQHB6u1SOuaObrQoLuO4yNLrvMTlAGgcgOEN6HxA?=
 =?us-ascii?Q?yku6d0An7GRspnU9Rl7r1ny0OMkRiOoe4pnKnY3DnbuB7IYvGibLbAU1+vlu?=
 =?us-ascii?Q?HSJiJA4eRZI2XAPiqLUeVYBitSGCQpr91fEt26TRTeJf7YSRjEbNgYCCHuIs?=
 =?us-ascii?Q?T3PoJOcSJAGRoIDvjyRaXd5gSlSsLsDpjVbBwpncC3cA64OOv3hC1rXDsxt4?=
 =?us-ascii?Q?RCCqvCM0idFI9HvOKpS0FHhhAzy50IPQgnbnhRcLpmHieVOugoMpJdD+YBOv?=
 =?us-ascii?Q?1UGzZbKTM8D9ZRgPRJhtMUI+DAzTuiqvAs8pqzDH7pfok9AoO0xyfYgAaWxV?=
X-MS-Exchange-AntiSpam-MessageData-1: 7x0PRhxmoIsCsaOOj7A/ra44vyrcRZNymfQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f404f1-3bac-4f3a-e181-08df0262a1b3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:37:55.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Pjw0VIyK9dMCpbkVC9HO0oFuFJ7AEXsb9Ki7UVJueM8OEzltGgGr4Ju2DUzccWX3mNyXOiJdKJurQtiwJLqa/rjW3dzBuQ9v1mWAYhqhZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 04:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244188

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
index aec8721ca3..fdc62acc74 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_d=
i.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-har=
d.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
+           file://CVE-2026-3184.patch \
            "
=20
 SRC_URI[sha256sum] =3D "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db442=
9a414d8aa6a728"
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

