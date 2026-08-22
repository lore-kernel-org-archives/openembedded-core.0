Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6240C5DF98
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 17:52:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1192.1787421126431531265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 10:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ah/lme0n;
 spf=pass (domain: est.tech, ip: 52.101.84.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJge165T/f4HSg5mv/fxTrrWjIiq92LKY9X4sfllfwh/Ln5jc/Zak26di3hGVVaD6ac9xudHRrIavbutFhc1bzHmDtdG2QeXjgv7S7HzBqF/4zq2lIOEuyNzP0we1L+fN+9Pp4F2WUgK1PDXVfdW8cq9YPluz+gOwRVCGHYWi9SX0PgSIo/SA1pBln9qxMd8wig1Z1Sa9GkF64PGQp8dLbHvOuAEMYRSVH0xhhYan3VHxBTlsI5dOYB8xDTviGbp9ZJTExsEfqJaz6FvFNcmcGvvwcqnyVKW8R4OG5twy7R/rfkHRigAbHD56oDIm6xRA7CeGYlZX7l6QYRE/QOepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zplzsuv2OUODJV5kcEAHxIxK2x7+1plMsrQxxCndatg=;
 b=jZ23xCfA6NT6ZWEM0sKd3UC9pTqH0V0SZRt4qJh1CVupDG9aY23E6sPZ9lFBjrhWDqRjGA4ynaeWC81fXh9I/yyLryLb04xINuKoDEptaG+fFti8YFT/xu7XGWUGf+1coTX1u3qiGeRQq3TpXvNgnSs1Fvk1n9TTCxzoIQ+mV0gf8OS/kiRvCiGKJcto8rrvwcR6omQZYdRwAH2jJ6hVC/8190TXcN7HqWzCP+4BPrbpFUR89uLsn7Ucw1+eFoyNCgY9/UUKiuWtjzDTn1ef45gk6PmfTkmqpgDB8TDhW2SIuFwh/3NaIDeSHRqvR3mZ4ib1TSMsiYzF8K/eWILj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zplzsuv2OUODJV5kcEAHxIxK2x7+1plMsrQxxCndatg=;
 b=ah/lme0nlW4mXVtWEYfqEzRoQTJL0vP0TAenlLjLcOWIowRCTzl4TrvKEUAtXYN1iWiqlmtsLWRmdDm3xgiUv2b+92dCzcwikYgjrux9yMkCoUwF7g2tz6hANAMqo7Z9MdRCibBUtMfFkZcbNN0LAswPUs2rXUjaWpqPwLU/0QEhaaH2xQlpRtRzdtSeF0PJOOdJdx3J4QGlXxFBEgDrPVryBpNFKiJcW4JaOC8ynb1j/A8oTY/IhWmBIZGV1sD1+TEMu7nIsNN5ltPd+TwWUap1XQlDXBM2Ho/9L42P4LLrmwaGp8K7VTlZ8y8c0rvL5s8mitHcr6wL++j4qwLMUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM0P189MB0641.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.5; Sat, 22 Aug
 2026 17:52:08 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Sat, 22 Aug 2026
 17:52:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [RFC v4 6/6] kea: fix build with OpenSSL 4.0
Date: Sat, 22 Aug 2026 19:52:00 +0200
Message-ID: <20260822175200.57534-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822175200.57534-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260822175200.57534-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM0P189MB0641:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d9ede6-cf0a-4c2f-ee4c-08df0076160e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|366016|13003099007|6133799003|56012099006|10067099003|11063799006|4143699003|12006099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3Kqp+e3qhjj5WmPjCaKkGqp3mpCdqp8ZvWvl/zhMEJu+xyAmHW015KrP3uxYOdgMVUwiM74XonsJWd3iEQZ7ISlJGxIPFVN+2UYpJqvUE644PSeR7xpstKEycARYt0ak02blt6pjKZ29k5p6zoWVTEH2wt8425lAk20T9X6Do5ShK6vi4Z/VYcyGKmcwjiTFiWpm9YQp00xZHHIkasz02gDxMpnowbtplFNEGmTSCeIwLLCcB5mmEmV/Q3X4i3B9OXWIVIaXFcS0FEiGRh1KyL27O0dnnfdr1F7C9jskKnmjzPIxMIuKCU0lIpZcOu3BKmGTKIuoh6+MAZpELzT7A4HM8NGAEnr9KKa5JOTS0as6n0v9x4IKQ2xmyU2wJwDpct+YuPvTA/OC4ztO6p02MU/Eu9ynGyy9AFC7nVfvQsxN9bhe2zmtvFSXzzaN7vN357DUarCq3Z78loi+BeZMjyR8XC01UJZTKXFqhUi6ZhG9N2px+9oAqjeX0b3NMrbDy0IVIEp4G2XHIOrcWTXsCAsyw63ThFfRj4ssvHfb7V7vSa+gx4f0e6JfRGtxLb/NE9qFk6KLa0p2Sok/AW+mC31YmTnzIvV5Wu4mqRfUMKiwN1U8Fd4Mmsc3T/ioUaqs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(12006099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xnTJTqF7M7D9CNfoi1wScx4oLboJaGLjShYhsFrnGykuXTEvv0Ql73NqjP37?=
 =?us-ascii?Q?BIerSWVUoBIZrRn4yd3wzbXKd3pDZM8CGBc8IhwO1b7SnlzuRScH8JY8N2AQ?=
 =?us-ascii?Q?RsEDnukuOmqVnBVtjesNFJmwQPlp50o+Vr1SR4FLQu0nf/9EomaT64y8VlsS?=
 =?us-ascii?Q?8DK0lRnPHGInCPXlO46wX7neQIQ27UUv7uUfnvoeiMQYHSM2KG1GB3lXXM3d?=
 =?us-ascii?Q?WDz2JAG5VGIMPlwCx1sf7CE156GceP0Lf8gIy61FWMeubnZe4G77H7ct2Waz?=
 =?us-ascii?Q?Ol2Hq/wZDcjxeR/S6c7s7Ksd3r7f7rF72mi+uMDh9X/EDZKPLTzU9tfKQ6KJ?=
 =?us-ascii?Q?KKZ/wTqiAdznKIZ7sLV3kmawOxQxE16Xad6iZlFrOqrs8eAMOuvQ4dCDEsmh?=
 =?us-ascii?Q?WeMOWRq7AsrH36/3DXnBjrbYD80k3LFTwrE1zdINr/Ofl6f2osNGQXDVv3md?=
 =?us-ascii?Q?GZPCh6rF1HBamXoRZw10pywfltcjHIN0bme3EQwsFqNHi5LNRKsp3yO4TvoU?=
 =?us-ascii?Q?5YWykCyFnYzDqAE3N+Vr7lDRFFwzVyAhjVMNb4C8hSpzN3KD8eFtPf4OzD5i?=
 =?us-ascii?Q?fhH+mI8/mrw7Il4KHCxzO4ljqsMzXVPdwUiI5vjKFIGmuBlXmGL9yfvOjFnF?=
 =?us-ascii?Q?J9rYLUxpwh3pNcoEYtuDZrm+5aTEytgNoHuznl8eGo4sATlngnBEvubxjyBV?=
 =?us-ascii?Q?e2qvcxbBwa1wYT/OYEo2fBUc0O57bdqU8N9ZBCgRihJvYASqJEkevjKkGrdO?=
 =?us-ascii?Q?27QFfIqb0ITpqviVQnvT3WRP16Y0wiOsipVDUwy8jMUucOGMq8FM96H40SAu?=
 =?us-ascii?Q?yfZYkfKmK3XTpR6xHlXAqk2gjyLCIl/cKxvdQKy3amU5V2V3qSJvQ3M+kTRS?=
 =?us-ascii?Q?srNFmxlVTc3xCtBlHTFhm9oDFMliI0HPX1heI7Ql9NfbcYv1Ul7XVxiQPMmv?=
 =?us-ascii?Q?HGa/2iLCFzJfm9RhlT/3KbahVG5N8KxW2tUnf3S7xJmOSYeOzdeNAbzKi+fJ?=
 =?us-ascii?Q?fBf3yoxv3um45bH8l3IbXd6+PAXPDovdbpy8kB5lFNBRNzqiMIiCjPIDS4aL?=
 =?us-ascii?Q?2zdm5BFuRqmPLJkhNqfs2MMKsE4t4oqi7y+rWtaJDBBfEVhixYsIUMd8pV30?=
 =?us-ascii?Q?WS6S1iNTGixWzPkTXZBXtCjl3t9xibM0fx5FtJHzDyYdjrizz3pRayLTXtIu?=
 =?us-ascii?Q?oV4DvypO+GDP2bHbsU66IubBgArKT8jr/MGpPsInLTZLuvyKZQRRbXub92n2?=
 =?us-ascii?Q?rinL4sa00ioAgDI/94HhuOyqEMfEdn5pFC9fU/2N6SrwH9ALTyb7MBWFgKEk?=
 =?us-ascii?Q?Bd+3YlobH5ybNd0ZBTxVmomXjF7HkogR0rCf4N637X+dp65Z2xR6YwLYaoHW?=
 =?us-ascii?Q?3jOZN7pRSYm3k19ITGHYcMwcjtLHbycyQ3BYtd9pOSMb8RYiGYsV0YN0BBgo?=
 =?us-ascii?Q?HpeEsfBCL+YV7RLs/P3W5a3mmFt/q1xTZqUrjId9/60oubzfz5R+tRjaoi+w?=
 =?us-ascii?Q?e203GTa98xfSNSJjX2k/CC7W+4eUSg/9Xk9jTIIphVBtbky2HHKkWdfdgwJN?=
 =?us-ascii?Q?+X7VuIlml9yhZk1+ZqL7lY6F+A/a8svQEsAUf1AbHAK2lweBaxbhC6Ie0xYP?=
 =?us-ascii?Q?jUoxtCqlahpxVufKclO+KEI1GHMO0nYptJzFXCt0jgAM6V8S7IiB5Eayiwet?=
 =?us-ascii?Q?mhKa4Sju6rio+fri3QDLK9v6YHiGSwM1kqnHSZXO3dj5itBfDwuHpL4cBHr9?=
 =?us-ascii?Q?oBUhJGVHKQCeUSu/BxzMPlVBDBAgdhs79nlDhHyx1fzdq5HqmLRWclcAeKY/?=
X-MS-Exchange-AntiSpam-MessageData-1: izgfVbHXDJ2vAoLxbssa1fnTZL9CpWTn6GI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9ede6-cf0a-4c2f-ee4c-08df0076160e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 17:52:08.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PhGtT8XxkZgiEz5u7A/FBH1rylpHvw+oYD0ygvei88cGe24yqVfk2QpsHtQOBHQmY8QaZ/b+Ya4oJ6FlWMQKjlGdfFm5O2Tqn9xOkXXRaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 17:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243998

OpenSSL 4.0 adds const qualifiers to the return type of
X509_get_issuer_name() and X509_get_subject_name(). This causes
compilation failures in Kea's TLS code which assigns these to
non-const pointers.

Add patch to use const-qualified pointers matching the new OpenSSL 4.0
API.

Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issue=
s/4673]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-qualifiers-to-OpenSSL-X509-pointers.patch | 49 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.2.0.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-=
to-OpenSSL-X509-pointers.patch b/meta/recipes-connectivity/kea/files/0001-A=
dd-const-qualifiers-to-OpenSSL-X509-pointers.patch
new file mode 100644
index 0000000000..987890f4ff
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-Open=
SSL-X509-pointers.patch
@@ -0,0 +1,49 @@
+From 82d28b1be73bbc00e73e59d0c59c51a1e76519a5 Mon Sep 17 00:00:00 2001
+From: Simo Sorce <simo@redhat.com>
+Date: Mon, 27 Apr 2026 17:49:56 -0400
+Subject: [PATCH] Add const qualifiers to OpenSSL X509 pointers
+
+Added const qualifiers to the X509_NAME and X509_NAME_ENTRY pointers when
+retrieving subject and issuer names from TLS certificates. This ensures co=
nst-
+correctness and maintains compatibility with newer OpenSSL versions, which
+return const pointers from these getter functions.
+
+Signed-off-by: Simo Sorce <simo@redhat.com>
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issu=
es/4673]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/lib/asiolink/openssl_tls.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/lib/asiolink/openssl_tls.h b/src/lib/asiolink/openssl_tls=
.h
+index 57c3323..52a969b 100644
+--- a/src/lib/asiolink/openssl_tls.h
++++ b/src/lib/asiolink/openssl_tls.h
+@@ -175,9 +175,9 @@ public:
+         if (!cert) {
+             return ("");
+         }
+-        ::X509_NAME *name =3D ::X509_get_subject_name(cert);
++        const ::X509_NAME *name =3D ::X509_get_subject_name(cert);
+         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
+-        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
++        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
+         if (!ne) {
+             ::X509_free(cert);
+             return ("");
+@@ -209,9 +209,9 @@ public:
+         if (!cert) {
+             return ("");
+         }
+-        ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
++        const ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
+         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
+-        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
++        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
+         if (!ne) {
+             ::X509_free(cert);
+             return ("");
+--=20
+2.53.0
+
diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-conn=
ectivity/kea/kea_3.2.0.bb
index feeacc8883..38b24eed1f 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.x=
z \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write=
-.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
+           file://0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch=
 \
            "
 SRC_URI[sha256sum] =3D "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a17=
6a4b8e9aade3df"
=20

