Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279DDCDE001
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:55:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1945.1782287718808243866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 00:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Szl6oIHt;
 spf=pass (domain: est.tech, ip: 40.107.159.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD8JjxGuFVSbiRIO3w2+PT+0G6qmJ7iidyXOvq+NcaA1e62qJTxjitfneJXAoLTpekZuTUXBs8RHxsJJxIAICRYsh/0QHQ+3hEq/cQYVNMqaOaLfqhJ/vf4vMXisP64fxt32ytLzffuqejtGPI5eCm/uOr+i4gIWh4sc5NOXa9VYSCUZGYomNsJh0gMGgd7sBO50XJ81ui+sCTPLU+CNcEbxZ6aiib/QC/NVBhmQvk91U/5CWl3mpVdMqAbzwcJol3GZtsJnq9vnKvqRf09s4JEUdOee0zrFJ3Jo/7fcoNMIvFuCrCGwGA2BeSWACURd3XSxBzyYcKKOc7RZIWt3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWPKNH8OpwNxYtj5X/5YxkkETcne8QgANuJLGPs5tEM=;
 b=W8F6wSmA58hIqDiZQN68EjwKRS4vHI2tElcuc14oUsyH5CgWrXUieej4pQmDSD1SF2jq29u86pVZNmk0o9DTa23/ybfgq65kv7xL2ZwtjDWfyeNmL4mQ+64/pGsKkwXUuzIbWB3ZAez+lek+P5VfimCoQkcC/7Wp0KrE2Xcu7pOyb/5Twvhk5/UAAFT9LjGsp3P+kB8u0Qi1NRMU3Y35mdvVe7w1BPodhddrwIrUDoZW9v4OJ4LCB9+UHTK7dTYNPk6/+d6z75hGOfloFTmXR2q/FLGVEM4oxWoDlYcnFqMsFV8Bj847zuYWiKVd1K5lxhyI0BVBJLpzBeDoYGAtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWPKNH8OpwNxYtj5X/5YxkkETcne8QgANuJLGPs5tEM=;
 b=Szl6oIHtZUoZ2W3WSCQ+eGj9VdTw7oeJUmaFkdWEoqmIXfoFrffBeQs76ArUcqVsR+hFeZBx9eBQy7Q8IusN4hcVGf3NIYe+/1A3Xg+GiHiCsO0K30ZsO0Vvl5ptdko8eMJbWMOCtfq2nF0ros2N5vtzJJBENi2uaQSBvfQDya7bwfZtaJjf5tsk0omr1C9rUhgHSAJRdYjcmoMsZfEqRyBUzP5fUvPRJLw2GoHSzP6SqARqfFCx/nHS+DXRYRiSedO3qjQOHqj/gQ8GyTUziJP4eLJz3MaFSNBWSdddVP3Ct0LHNowoqZBY9wDNGePF82Vga/OibkskSY6VEe49oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3254.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 07:55:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 07:55:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v3] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Wed, 24 Jun 2026 09:55:04 +0200
Message-ID: <20260624075504.63472-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB7PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:10:36::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3254:EE_
X-MS-Office365-Filtering-Correlation-Id: 025c3f43-b93e-467c-2d61-08ded1c5ebdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|3023799007|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	n8YHwNADYp1nz74oejgGtQLN6pOOz0b9cuv7BuhltfQU+uR7IGNnHOYgJI7hj2Mnro6pOcwdWs5H9VUL4g2vfjr24nbq8S5W7jZkjgtvKyrtut90r1VTXxQt6IX92IpVg/muEEWQ4hXDq2kVSqGvGm4zCfY93Xh8kpQeY39PmtVRStJTBrn3ZDrHal57M9YuOc0fqR/zMXDkDPo4buF1xsqGJqI3o487i7xM8qmrhxksxEPGz3znOC445IeSMPiDMO/TjnZsRKzqBg7YyvlAxV8Q9MYopFflIXDKclZG5sFr0rKLh8HytJLyWdNNy5NVV2warr+SEegMhOpNZ3Cl/f1h1x1DWoN0hFmaC0lct7AovMmVJUk9tvDgGWEpmerqIIi6nhGksuVhpDbUU0NdbQQ1kZ786VPE9eL8DTqkQqpjqB/HWDgQP9sQDxJeewdrTDuWYEYOvpbYKygcV1PRg88gaRyv0Wz+zRpehL0zBBuH59/8amriBkRbdVWZCXx82YLktP5+iIlGv9d5AKrmnSmiFMT+oQGra7Nguy6bXpGBhWFlnw/YxLYhVKbKpJ1LUeA+9cOGJR1ko3ZqJR4GoIpvbD4TREnSbiortub9iLeWl1Bq0o1MGyTu86dSCcfx1RejdZIvn846I2PQYyWNhGXo8vLiQ51QPEiqH2mu2Ts=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(3023799007)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t8wY6KQTkKj9zmPTHdeC+JG/nIcXA1sdAY2svHTaIVpSrA7jvvZrP4Vl74mh?=
 =?us-ascii?Q?FaBBkguW6cJSE6xsp1QEJMjcziKQT3Of9SqoyS+oO+kYe0Zw92QTBi2re3/t?=
 =?us-ascii?Q?Lv7FiWIS9YbrS4oUwZnuP6j65Fs3Vud004a91FbLd54nn9pnqESDuF/lu3ru?=
 =?us-ascii?Q?KMNDl+/HQUWINJ++4kRC2R6+ABysF9GPCeod/pfahKfbiErJLVxIUdgKcguD?=
 =?us-ascii?Q?xcnGTDEXPA7C/QuFzqmKDKfQ/DO8/oJxaFoEK9lxSQFNEJcqJSw9jKpHV4qb?=
 =?us-ascii?Q?NFYmnaLBNlNS/1gfg6eW9WxLL+WKDywaraLqOFA503HHVOlAcwCFsTvXyd3C?=
 =?us-ascii?Q?HVdigv7IwaQuXDwtSd5EG88LOqBpEkVVQAVhzsmrHt+bZgUN+WmQENX7nRwN?=
 =?us-ascii?Q?SvGk2hrCKap9dOL853HbgKW9GwYuYsGwAJVcPvJutGcksJQAW9kiBOLDVnWF?=
 =?us-ascii?Q?J0pbt0fGwHHyT1yxBoJBrKdQNdywdJ/OhuJ25Lvk9hi0LQlpjS1A2a5P2tm9?=
 =?us-ascii?Q?k82NAAJhTN8Hf9HAl2Oqpk1/iCqQMDTL3A0beWubxoFAkd7h4u8k+ImsUAp0?=
 =?us-ascii?Q?cleS/xM54UYNu6QxUdeoepEwkpCLMI1qP0WAxlHb3kY+x86KGkM86LJgmOLS?=
 =?us-ascii?Q?GupaU6kLS1lGLYXbuCOsxTOkjsMB3urZf180oKgg/ES4yjXQx6NrqQj7r9RX?=
 =?us-ascii?Q?1sD5FHa1Fr1FtHprsOBwKyDQu3tv8513yGIPjfL7U7f2i9PBQUuLRaPBHkZ4?=
 =?us-ascii?Q?ICdZVQzj8R9dLqb0kOcT96fNMklvemJyiDqMEKH8OwilwpdqD3X+haIX+lvA?=
 =?us-ascii?Q?IcwpGMSfyiXgmlfLRPgS38DdCYUdRtlvqYU/fV/c5EYy+DmJscnMcot4pDuB?=
 =?us-ascii?Q?vUQ1iwbO2UfC02WTAZk91Z58UuB17oJpSPZVk1sRq3VxOspzkvxWfpJ7ONdT?=
 =?us-ascii?Q?Yw+ImAsVcUfLzTMTpqnrJ+owr1IDpiD3O3kIvaN8Jwi55SUQQpxs7FV++RT2?=
 =?us-ascii?Q?OXT22qfERrjkRHbf0L/bpU3CUTbgNbrqPNsJtCbWL2P3wRg7JtLFlQEF5JEE?=
 =?us-ascii?Q?hhcwogfTsK2WBO582nGGKaG70B1ZeelW/EUYKqFydbpy5bE21lIFnpy+DKGs?=
 =?us-ascii?Q?3+kBpxbzZg4Y+Pnj/lxw7u/o4yvjTMWCs10o94J0RWpwcTEWYf7Fi1GEK7DX?=
 =?us-ascii?Q?oXvc2ZCZEM05xDdstdj97mvsVSEzrj89QydRlEnz3VmdnkPGgTe58bAgmM83?=
 =?us-ascii?Q?Iv8EDnFhbirapeE8S6BxT5Xc42SfMkqk80O61E84HtU2KMxNh3kS0hD8gf8L?=
 =?us-ascii?Q?XMCPljNWwIuSMHLmSnf7bw6oitVqpyIUXs2D1R8Bt49HZ/lBSRck2uzVvweT?=
 =?us-ascii?Q?D+90i9LTguspg4Tb3zLKqodUz6y3kzeyn0UdA7F1+ESYJ+4qWw5dKmYkDHiy?=
 =?us-ascii?Q?ykIRvA63xWbYJRL0Y9BGrVHBqOfNOdI+okc8tsVWrROq6TiPUS/zHquNFS+N?=
 =?us-ascii?Q?CF6m/j/TOS7R+3cvKFZ1JBVjvDXPazpho1UT5t11q5YN99QNgqMoyTrYAlAt?=
 =?us-ascii?Q?++ysiFul6+oqul3Oz415Pnpgs+pDBI3IYLJy2clXr6RtLd97cgL1F0lD95jT?=
 =?us-ascii?Q?mSwSgNZNOFO6HRtiV3vrL7C/uD8zGeGGI7CwYMDqgCc1DQLeFlaASrbFetA2?=
 =?us-ascii?Q?12b5KpCucbZY/okJySLmKIwyADUAzVzkbgCODVoGp/m/wZ5GawnW18c2pLno?=
 =?us-ascii?Q?u0upqYzjfw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 025c3f43-b93e-467c-2d61-08ded1c5ebdc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:55:13.0669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdS5QpaejCfiEuDkFrwS3fVYbylVjPhs5WwSqen5RkoyEWxAgkZr1sCYeWrc8TR01hrR3+lE2bFIQuRGS0jl47L3m8tGEo3x44ltnZq1Ggk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3254
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239478

Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
connection pooling. Without this, a second SMB request to the same
host reuses a connection authenticated for a different share.

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../curl/curl/CVE-2026-5773.patch             | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..970e04b33f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,48 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
+so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
+identical: SMB connections are no longer pooled for reuse.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index ccd4f3f69d..2a9f08388f 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+=20
+@@ -1259,7 +1259,7 @@
+ #endif
+   CURLPROTO_SMBS,                       /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
++  PROTOPT_SSL,                          /* flags */
+   PORT_SMBS,                            /* defport */
+ };
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index d58b774011..3326f478b5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI =3D " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5773.patch \
     file://mbedtls.patch \
 "
=20
--=20
2.34.1


