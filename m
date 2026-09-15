Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01082C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:45:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5345.1789501531153569957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IeVA40qh;
 spf=pass (domain: est.tech, ip: 52.101.66.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csrMes+KIKlqO1P3CvCFhWyyNZ5UX1j1Ol3ktYAYengaUoI0plUylJJWmvK0S/jHWRF8mO2KSVNDTEMYadWxC1FQ6NDHIuTZSMoN58HR0Lya8mR2TG84M8f8sN3llc06ZMAdHvayKcIXt9+bxSzlRujFHsVQ5/FRQm+5rJpeTYcf6/PHmKBsi718D829uoBJjn1FyLdiv5mCBBUdOd+bZ/7zMqrNS2xA/ADELo4/23K5o1FawqnrKL21VUKGeriGT7zFAEEalqPGGZ1mn5TeAtthJXrM5i3v2LQDnVmBCOAK6SfblNgwhqyKz8L1XnvbTAHztz9NKW9yFmm/ZyARww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/legvpdzM9Hqd9BWw08kt4eEdcnwliFOCvbt+wxk0AY=;
 b=JvoQ5+S8FYvE8t7cQF+Lx+Zv2CTt7Q9NJOAhhbreNQlsFnxeRvYG0d5gzUZ3ElgcRlcSJgg5nGeiNnV57zIQbJyLga6cqzJUxRrKKczrQ365PovmrHYrKDqrVfey0/SRlYFMQS6/dfJmOO3BPq7NK65CozEUYyraKdeHwCv80sZ3CFLWmHPQjfKp/h2NVcrPRQzfolYFODWP+jCvMpjatwMYQCc4hQrxOGgBAei428vsX2KMXbqZCvRaPXKtqfMWzL840hdVLWOVD8Etx31kz07u+S3Av/rK4YanIU0CDwe5ieHDRi6kJJsL+sMDrAYURXH88dqaRgwxdSKW9Sshfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/legvpdzM9Hqd9BWw08kt4eEdcnwliFOCvbt+wxk0AY=;
 b=IeVA40qhMKrR2tZE1lq4VaK7X8yAiFsFpo34tzV4M3SfImYsRtWxz9hRkrVgZyhcF7AiH5oOc/I0qkDtzoVQyfHkVijX/Kqoz3Wh3E5ZJqakLcshaLgl3FA2jU5cIF7Tjeoy091WU4soZBbZp7U46zNBXGgw6R8ito5MMjb8IUW+4QmOt4PXcyg2GMaPjB3qo0Ferjx4Vs3T/+psDj900RTbq9A9Baxl9MZCr3HYQDh8Txw5PrTjYYhLoB55XKfSQuTjzEzizack/JyDTcxXuizLmFpL7zDQR9vKuR2LI0GEsJLgkgv76UyAwvvofzl0vJeCIdBVNfslIZoaLBPeBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3172.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:45:30 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:45:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 6/7] libpcap: Fix CVE-2026-18313
Date: Tue, 15 Sep 2026 21:45:19 +0200
Message-ID: <20260915194520.45847-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3172:EE_
X-MS-Office365-Filtering-Correlation-Id: 736bd527-dc87-4002-8830-08df1361e60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|12006099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	BoR+2kqVPU7OhikyGOt0LSqD51Oc6uLQ8a23ULINLqvdywT7hL83vuza2UB1zSE/gFHQlLsBrgqKXfIidtGeAfSF7H0c7mdQXwbP9zF2dsFbtoV3M1rxUjqPooLRlY6k6YHq2ONh2YsZMTd+VW6vlEW3dcZS5DK5Qo3t3M7+UJ7spJlwm+n5pq/g4zdbh31cEZBDusHCtnzLH0Je/PzMhv4Qy493rTFeLhuxOBu7PTtohA41jkZSIbdGv5A72ASnRSfL+jO2hRFtEa8zKzL6lKjnI/Cqaz8LTHjSNk3JElVXjYNaHFn4IoqCidty7UP6nqZMMEkwHxelXrh4KE/ae5/0S0diHMZ/eX8QVDnKMXAAVuMX+5IOWzZgjKi9S22ITTp8d33lo+MnXPbNo6nvgYZyvQFYkjE7K5svGlJJ21acQH+qGRQ7nHICHl7e36J8Uuu1KNUFLoglhC2jAvdVgu484Nw0hDNjGLU7q4YexFQ0FXKvxmsQf3Is8VDcsqLNXfaHX1C8D++4edsjODEH1/2nFsDo+YGObJ2tgcn8BM5PgUkznjGXoz+y3Rg65kXPR7+RrJEUFIClnEKHbu+KK8CxthM0HgipSDTgW/ZG2GF16j3v6oxXaaZeyWls08Eq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aOwqDnq0USndgujCvHD/+L7tBKpK3iVj0yIDtODwWz06nJgQlsuLJIbKXYbF?=
 =?us-ascii?Q?ChtjmS1MWh82SSULXVp3fyXd6hvzuw2ZlxKOTGiEMWqIe3L/7JrvZKaZ3vVB?=
 =?us-ascii?Q?4TnYqhFFADDsuB0q6gljoc55qUH80ke3tsCL2F7XX57k/QPQZ9DFN9BKoOr6?=
 =?us-ascii?Q?bzFWOZwZsIFKbKBvq/cLkUfBCObnxXpIP9nsO5uMySm0Dn0SHPzQwf3yJgYo?=
 =?us-ascii?Q?Hm4Bdc904+LAO8pqKvHISDvV/KXN2Tq12DWCybO9nXZM1umjKA0ivPDTwg1B?=
 =?us-ascii?Q?u2kw6/+wDqhjRFtOvL8vSjiilZMvRDcZsl7dNDUtYPS8XIis0ZWJ5TrtwXSH?=
 =?us-ascii?Q?QBcIJ8zO9heajGQR5GCV5b3uiocwBsipPRx6/n0E9raUFT6Gane+2bl3qY2n?=
 =?us-ascii?Q?SK1fT1kv8Pvc20a71HC2eNkAPD/Qv9AnYzCf0bOnEqqp4AYKF8sXYpESV97J?=
 =?us-ascii?Q?HcgsC8iCHOVLZAtrOeNcpQvWn0xZa4C8n6QEIaD6tMXiFv3bC9DnqqhB5pSg?=
 =?us-ascii?Q?hUNBUbz++O7rQ8U0ZqlPaOY1nCuuDKXznaHpTQzF3N2cp/4uzNQM8xMKbF/u?=
 =?us-ascii?Q?HuTnd9crPdzzLwnJTQfNkjgn1GWnvqsOQDjP9MLpuZdkyXVwYt4FxfGDla4f?=
 =?us-ascii?Q?CJeulykgD6mUFaedhHeYFnZAMwiy+mul4+49coEcIGBOHcjDJj975cKuQCla?=
 =?us-ascii?Q?nDvJOW+RmFRMkLe+ywrX9PsscT0ssXIZG7Ck6qqEnHU30aZyP5EiGyofLntw?=
 =?us-ascii?Q?7pK0W6s7q6jHL488EyPP6GBK+Ft5H8C2JsejX14Hdqp9+vbt9P3WSbBNDdpX?=
 =?us-ascii?Q?Q5B64rsAEdfIIQcI3oizvSLH58EWA8XlapfZCKM/+jLdylmfnmLC3SewUy/3?=
 =?us-ascii?Q?porw0vuHCYEM4ByuHfqyqHnaSQgSDH9Nk1U+kNVlTXf2P9by/O5NWgOOJ1HH?=
 =?us-ascii?Q?dFAdk4aEK79Li71O774z46ouPy1SJwhvIJeueGRsI2ItuYIu/q8tn/TzhWGy?=
 =?us-ascii?Q?S4AQhUEZGH5tpvUQypL6hGsM3DmGzGKCn8cGMY8xKBQ+a9iFtBAzspuNvutS?=
 =?us-ascii?Q?l5NYQLGC7sAHQiMNrNYZTIPuRPIH1Yjm+eY4R418lecb9Ynpdgt8Iyt1HIdp?=
 =?us-ascii?Q?LRuCskpaSzj9R+4Oudokgo2vOjo+1L9RNrz2gfYi1w8dNt/+BzRRVFgOjWC7?=
 =?us-ascii?Q?uaoMnQ5S8TtfrUCPqint+yYB1NZYKv5MzWuSZltqpN+QwKD3P2O3bsbq5qkY?=
 =?us-ascii?Q?l0E/OTHDkEFLGFXPF4PvQNQ6ub4+z2rAy/OCHDZcEHb7VWQzgVoe+pt3IrV7?=
 =?us-ascii?Q?hcTnojsfOqw5oIRnBZWJ9KEgfBVevIfxTT/33lXtc23sAezE56rH0KMTUA/f?=
 =?us-ascii?Q?9ME+5EB3zVNZzEaaX0uc8ydYSsbmsbtIJ6pjh9wsByWbkCf9kbZHf/FYgZXm?=
 =?us-ascii?Q?rpGbHNKETRezU+p8LAx0xI8O3VrkTG6qJCNLrK1Mk9bepuoAaiFnsHsL042L?=
 =?us-ascii?Q?Nn4N7hHSPE43azA2cB+5E8fWtP+seKxJ+wc7kMsOjPWKIR9XKlwJUaAIew5N?=
 =?us-ascii?Q?PZyxBxSlCVeVximFYStGgaJHCP5I86Htd3A0kNoSxXQ4tSUnmXTwWyxWy+9b?=
 =?us-ascii?Q?eQc8MoOmdEEsirJBIhJVBsSy1SyFC2Zt5IFZ0f8fTazI249XaacmfsMMtBrH?=
 =?us-ascii?Q?LkckZspecdoubcvsbZ+bAZGCgE2FHZt0t2IRnucLJLGvJjGdcR7nXQyw2dar?=
 =?us-ascii?Q?6I7nO+Y9mA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 736bd527-dc87-4002-8830-08df1361e60d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:45:30.3104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWYZP8TIeecz2iLCvWKBAEWgRR7V8AdhqgO0338BN2ilbnHXSyexLhu4ceC54DVPyn2977CCQYbWrEumaTt6waS6tQBE2RgPnVc8+dmG9Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245897

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775a=
f1a0ec76db60c7213241e6b48f1be10ac7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 81 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.pa=
tch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 0000000000..a2f2a5fd4e
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,81 @@
+From f9775af1a0ec76db60c7213241e6b48f1be10ac7 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Sat, 1 Aug 2026 18:24:48 +0100
+Subject: [PATCH] CVE-2026-18313: Fix a memory leak in rpcapd.
+
+This vulnerability was originally reported publicly, hence no credit is
+given.
+
+daemon_unpackapplyfilter() can allocate a temporary buffer for up to
+RPCAP_BPF_MAXINSNS (8192) BPF instructions (65536 bytes) per each
+received RPCAP_MSG_UPDATEFILTER_REQ or RPCAP_MSG_STARTCAP_REQ message.
+It never frees the memory, so repeated messages from a client will
+eventually leak enough memory on the server to cause problems.  This
+holds for all connections that pass the validation and some connections
+that do not.
+
+48 bytes in 1 blocks are definitely lost in loss record 2 of 2
+   at 0x4844818: malloc (vg_replace_malloc.c:446)
+   by 0x111AAB: daemon_unpackapplyfilter (daemon.c:2372)
+   by 0x113279: daemon_msg_startcap_req.constprop.0 (daemon.c:2139)
+   by 0x114808: daemon_serviceloop (daemon.c:901)
+   by 0x115BC7: accept_connection (rpcapd.c:1321)
+   by 0x115BC7: accept_connections (rpcapd.c:1118)
+   by 0x115BC7: main_startup (rpcapd.c:709)
+   by 0x1112BD: main (rpcapd.c:567)
+
+To fix this, after a successful malloc() return exactly once, after the
+free() call.
+
+(backported from commit 26a1c75702b105ac8788014f35f1b5c57fa6043b)
+
+(cherry picked from commit f9775af1a0ec76db60c7213241e6b48f1be10ac7)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/co=
mmit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
+CVE: CVE-2026-18313
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 9b0f8285..b0268688 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2378,14 +2378,8 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctrl=
_ssl, struct session *session
+ 	{
+ 		status =3D rpcapd_recv(sockctrl, ctrl_ssl, (char *) &insn,
+ 		    sizeof(struct rpcap_filterbpf_insn), plenp, errmsgbuf);
+-		if (status =3D=3D -1)
+-		{
+-			return -1;
+-		}
+-		if (status =3D=3D -2)
+-		{
+-			return -2;
+-		}
++		if (status =3D=3D -1 || status =3D=3D -2)
++			goto free_and_return_status;
+=20
+ 		bf_insn->code =3D ntohs(insn.code);
+ 		bf_insn->jf =3D insn.jf;
+@@ -2401,16 +2395,19 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctr=
l_ssl, struct session *session
+ 	if (bpf_validate(bf_prog.bf_insns, bf_prog.bf_len) =3D=3D 0)
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "The filter contains bogus instru=
ctions");
+-		return -2;
++		status =3D -2;
++		goto free_and_return_status;
+ 	}
+=20
+ 	if (pcap_setfilter(session->fp, &bf_prog))
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "RPCAP error: %s", pcap_geterr(se=
ssion->fp));
+-		return -2;
++		status =3D -2;
+ 	}
+=20
+-	return 0;
++free_and_return_status:
++	free(bf_prog.bf_insns);
++	return status;
+ }
+=20
+ static int
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.10.4.bb
index f7ba1bf3ea..5f1506f8fc 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.gz=
 \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
            file://05-CVE-2026-6554.patch \
+           file://06-CVE-2026-18313.patch \
           "
=20
 SRC_URI[sha256sum] =3D "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159=
d20e47160ebe5f"

