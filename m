Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2D2D609C2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:20:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26690.1765901514325784128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j1mxGXqG;
 spf=pass (domain: est.tech, ip: 40.107.130.13, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujC1SE9B4c42x1mm10GC4FBl3GlS3UPfxs1Whf5E2mFhg9JCHDyMjM4SkFMtwXyM8XaQvAKkVfrqxaKhw4q2dGo854uvfiS6y5Jxml22jdDoWJ9asGX40mjF+tdtGdwkWCoioIsxrOHdUXoovsi2XDtjbx+yU3kpp6/5hhkr/vbGM6ALJ5kN82SbDL7XFfYODRptSbZffJj9QJmF1MLWjiyQ+oCzW5Grc+U+QLNQDi9DmIIyWLwEILEantXv+4ByjXaEsZnBkXbbhER3EQUtR4HHOeXCJEvpMgDoubkf9dsoOOLEp/TsNb1cK3dXwEmMkPI39gSe0rKiBhCkrcADww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7q+omekwlPMb8fqKFUo+7KGU7lbdZ9bgz2ZQQmt57XA=;
 b=y6uoXdi//naWe8mZAAC+t1GiAOG6l5RRDxfm7/g0vyFMAim6jlCsW2rF1+sMbq+mxgveMawLF2AuKXsCbEoHh3Pm2Ds7WBLcKozVldu4IJl4g7ZaaAL/CLEEauT47FXt876pbL1afCNpXbACePGd7WGy3wjggo/vIUQKqOeaEclcrqn7OfIDZKfxJZQLO8K+QX27H1lXhi88KfTXhI4NzlOhw2eDzPlN71YwP8ik6lHL/xZI4VJrfwqO0cWoMvBlhxovUm/DdAvvnm/+Xvg3frxJpmTP+0ONLC7nokUv/7jVOH3ETpjfH2xU52PVA+9XjhTUmfjLAuUqK0MThy9wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q+omekwlPMb8fqKFUo+7KGU7lbdZ9bgz2ZQQmt57XA=;
 b=j1mxGXqGJeggH3kj4OvziwztcZ0xakybXLt0E19jSABtpILT6r20SxHSDUaTYlyHYlubjRrGagCkvFX059gcQmhgkhhdryONaMLCnembwWRbxH73KBP4qKZH27oky9WFzdyddDK+vQN+C1eOm9MakF4arS7KgyR6RNTrdBPgQn5t1b0zJNJdM34swcl8LB0edmtOSk8ugfvxNjuGKVu0wE7xPVSkL9p1xcqWPW1Owfs/gOM8AHH9JQ7IaiS5my+qcsBRFw3L71npUWAmUob0LEEXv/Sdt+kTkYUzNDzCv57UfX8BDZOoeYsKxZEs/vU9H9FS17gVn018KozXa3eQQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB0715.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 16:11:49 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 16:11:49 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [review][OE-core][scarthgap][PATCH] rsync: fix CVE-2025-10158
Date: Tue, 16 Dec 2025 17:11:39 +0100
Message-ID: <20251216161146.10766-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: GV3PEPF00002E4D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::20) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB0715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a82e202-1a33-475f-d90f-08de3cbdd16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?de6IT9DGfHRSKPEtDOvQoHGZcKrWCs97v7JfJMVSgwn5g8kQNJdGjaEk5lqc?=
 =?us-ascii?Q?SciSbJ9vFIVzTSjN0aKllP0ll7Mji0jEWs76aUJP9In0lrOOnQg1u/dnk90z?=
 =?us-ascii?Q?YXK8pENCR26AViRfYRm1TwTrcLQsIDUF4lsUW/uhDF682SL53ByIj8ivue1P?=
 =?us-ascii?Q?iy5ZZvNEKYkL88ZPRrfJutF3t9N0RSQpTIL+3lTDhvuHis9ACYnBkkDqmjYY?=
 =?us-ascii?Q?bmiu5d2DSdffFIQVZjf4/ZYUrqFOWsiRXJsJUNNN94Qps7aldX5YqGWwPvVM?=
 =?us-ascii?Q?wn9WUVYujxBh4qQQi29tREVlNmcN9OF6oKP8+t0LgCoFKMRZc1GBiRxesdl5?=
 =?us-ascii?Q?jZP0YsyrAgLxTZRwV4Bw/M8xsVZANvfMvAbrAjLpH6qYyckDxFJN9FNWOA+A?=
 =?us-ascii?Q?kRhp/jWcAVjfxfJuhJwExKtASSu2uX+1ndidCVZA0BSprZIfi4tLz7/F3AMf?=
 =?us-ascii?Q?S4aAltgujJoD4zaF/F45I8mYzr+Oq8ZS3knBiMd+9kkK6JXwAI2zrg+4WXRa?=
 =?us-ascii?Q?n7qJvy48JcxXjlEDmqizGUHGwIRAS7/7DsDvb5ye5BfC9ujco+soAoIkzUEG?=
 =?us-ascii?Q?GPPx02SQvbXBgE9+x6xk1KmBlNkmc+5bXg3N4GrXetCocrKT2QpJ/9qiXRI+?=
 =?us-ascii?Q?FKfvpH6kwWWx6ZKXMaRyR792KsMKLzbq+G+GXJSuntFzulq6n8MMJS0NoxQW?=
 =?us-ascii?Q?qC6PxMPspU0Y3LCXR5Xy9ErV1lheSjgsdoNRWEH5SbERD4lewThsJISj6K1F?=
 =?us-ascii?Q?Vj9ebch05SSuvpVNlZuuod5shMTNhVNlRtO9ChllzWm1EOsbII3j3PqvnGDe?=
 =?us-ascii?Q?cI4M7Ve1Ln6S+ND5GBeTWSbc5mYLYku0V3tJfMqU9TY2gd2xnsuw0pfnLFD9?=
 =?us-ascii?Q?Rm1J3+CCrtKXHO8Z7lhMXsTXHtgjPAcwjKtiSY/uDMlunPaWCpbTjNE9tPTD?=
 =?us-ascii?Q?KwlRulmhWMZkKGnAH/UMv6EQBcRLO5p+u9igp4W53ClENNFelhkfB+WrT4dE?=
 =?us-ascii?Q?EuRiMbG2s55tQXNu8rx7WMG8n617PruH5Eq9LRBhNypa3KvEgk7OIYpeg5d+?=
 =?us-ascii?Q?anw0Fi8d3FpcWdJu39+CK3eYol3goSAce8BWu0py39vrrg6yzmx70/1kZ6pB?=
 =?us-ascii?Q?tATE9BY6Myqb0OyH10uyBSXb9dQUQuXu9uvKg002NWqeXJuTOwKukYPI9DJB?=
 =?us-ascii?Q?wM5STNfx5TtwrUYmeDiDHDTNJqB2xueCLtfOhq/n5g4JOgmFprZVLMB3KMqr?=
 =?us-ascii?Q?dFMGfI9PO3gQ14qaqq6cnpTGYkeZKG+N5T8A3le7/xv5upVr8s0GqXXChS4Z?=
 =?us-ascii?Q?lqnLvwmOCSUqwVClvA7gNd5yLo9iWsR2lb9S4nxjD/CD9K/U2YbkeKZN3I+r?=
 =?us-ascii?Q?eVuZjJALq/aMj7WVoVtBfa7GDCMkOEasLFxDAiTCaXa6RTiWHb8MhGLC0U1R?=
 =?us-ascii?Q?7wLW6GawT3ruwzhkktHPxLGBWfFW+/s1Rl+rClMZm3J2NuEacDv4Og=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GBQILyouU0oXG6JQ+ofxq3OgKZ3RYpEaQKEStMwx0oCWxRXBgWAeeJIuLtcc?=
 =?us-ascii?Q?iDbiMmdqphfCqflJkkGEdSBozGiDnnO6RIee2V7SEQk+Gj3nQCr1gIdSuRRb?=
 =?us-ascii?Q?PuEUrPMzKp+H8iLS7vGu5pY6Ahw+2YnAEDC17Y8KXeDbg2UifYG+f3ryfTVp?=
 =?us-ascii?Q?0O7OvyuosgCRsCq9JcuVA5dL9blA00wQrynaVOdCGmJbd1G0pi7yObTjFSwR?=
 =?us-ascii?Q?GtNzMCLMHMPneO8AjEnWoo0+n1CK4fJ09tZy+oaz/VtZXnliUvm3pqRvYySr?=
 =?us-ascii?Q?Z3tFRBFUFg7v+YCQ0oIjn2qWy3Q+zMK8RVtJeB+Ob0IOrGcgQj+0ziN4/YGo?=
 =?us-ascii?Q?TMaKuI4z59NONJmCRjLAEjdISFyBq3by6ZQMnvluja2tOkmmU5iti1ls3pYP?=
 =?us-ascii?Q?zch2peaSWSHqdL2YbQzHS/Nk57NJ8L6zYerJe8e1sWj4cQaXA/xz5Zszx8nY?=
 =?us-ascii?Q?EWFgNEqjCXvrR+dzrj+hhvg+th0sYrmuUKQBy/VU/n3oH4nRKq4dXvKmRBx9?=
 =?us-ascii?Q?GEhngjTw7GLIX73Jg2JfsvUcIc2nzS/aUnGywQYogs6IfzLxZwmgIz1b4jrJ?=
 =?us-ascii?Q?fxkHS+xEQSaJXqoIpx6F3RUdyPqqIfe/sgNJXSpYt/LG1UdZrK7pOST39R5W?=
 =?us-ascii?Q?W6Gj36XiJEE37j9pV80NNPsaQdF4G+4oJPysLFH3liH+ddjFZFIWkeU1ZIIb?=
 =?us-ascii?Q?V2HFgnJYVHH2nC20yLVXOuCbo/2IFPHve8reo4ymuE9aQsu+BAiKVCChJrbv?=
 =?us-ascii?Q?9hzn0MsLBDDh7/FIbkRAqcoA0of+ZnRqBc7l/JXqM1rnySE3nTVDxRgHXAnl?=
 =?us-ascii?Q?GGAFW/cb98cWQtxyA/5N795jwSfEgUpyNcCJh3k5BpP6Lt6vOBT5+X+WVs7r?=
 =?us-ascii?Q?wIB5fG6yPFZfxOKnmmG0JQGh3iCFJQoiLubz61J/QL7Rgdz3Rxk5hgyLuKdk?=
 =?us-ascii?Q?wCEfiSj1MiulX0YkbCjf17q+vK+md3F8uhz6TTRfyo66EiXK1DI1kK1kwI8r?=
 =?us-ascii?Q?I7HE2TXGR/VuT73cMxuf5Gub/5evdUI9MCGQ6HU4ulOA6wnGNszUC4n6+/pa?=
 =?us-ascii?Q?iEPjfSOpMrwKLPtK+DPOrGgNf3ei3Lh4QbIXWaEvPzeciZ53LTiN2huRVvVg?=
 =?us-ascii?Q?1QeSbsH4H7it4y9rvW3ZUnQuRTFY7DfXh6IF7V+GJ1naggnqhRD9S2a5bptE?=
 =?us-ascii?Q?1aJd8u3r8zHPgZ7tiAf/3I63H2X/LxM/HE1IsnOxqJQU+qoinT4IJb2MKF6V?=
 =?us-ascii?Q?AifhYiDCnRp0yoI5mFbNd0OT/11FBslbi4fd3iSdHUh0fJStbXwKsTKLlttx?=
 =?us-ascii?Q?JLRc8rzei2LP9GN18jCiP13pHh5Y/oWAcGrNfHqD4pCi1PSmlXRM2W3+jmEg?=
 =?us-ascii?Q?PaMcZnu6fEwlQ5rSmx9k9yqNCbi8Qquv+ziIOgylikDFQNAACHORuACaz1rj?=
 =?us-ascii?Q?Dc+lrBDeKGAL2FbRYZWZVDQfUYegPwgpHFjXMPGVE2yQj9rnPMp825nvQG94?=
 =?us-ascii?Q?kLhpHuJpe4gGc+pbMYkKTJS5m5i8xuj0Ejro7R/ACxp886CCdnEtuig7UYTd?=
 =?us-ascii?Q?Yo4IPJZ8A59vOzDCKXbi6tk0HYZKd7d83HD33ovpehpVyWhdubVk4RI/w19u?=
 =?us-ascii?Q?bFxzAxg/KcO8X8d7zu1hcpg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a82e202-1a33-475f-d90f-08de3cbdd16e
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 16:11:49.4367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inESJV+HEnnfzRCpNJZdN+jc6md4tPtOndGuhlPQV+opdanXtdkXC+scdYFKEGVe8y0MrVILHPgFdMIFXoKgf7Hx4C1AVyrQd2oXOxg068k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0715
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227981

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Fix an out-of-bounds read triggered by a malicious rsync client
acting as a receiver. The issue can be exploited with read access
to an rsync module.

CVE: CVE-2025-10158

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../rsync/files/CVE-2025-10158.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/=
recipes-devtools/rsync/files/CVE-2025-10158.patch
new file mode 100644
index 0000000000..a19cc15107
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
@@ -0,0 +1,36 @@
+From 797e17fc4a6f15e3b1756538a9f812b63942686f Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Aug 2025 17:26:53 +1000
+Subject: [PATCH] fixed an invalid access to files array
+
+
+this was found by Calum Hutton from Rapid7. It is a real bug, but
+analysis shows it can't be leverged into an exploit. Worth fixing
+though.
+
+Many thanks to Calum and Rapid7 for finding and reporting this
+
+CVE: CVE-2025-10158
+Upstream-Status: Backport
+[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f8=
12b63942686f]
+Signed-off-by: Adarsh Jagadish Kamini<adarsh.jagadish.kamini@est.tech>
+---
+ sender.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sender.c b/sender.c
+index 2bbff2fa..5528071e 100644
+--- a/sender.c
++++ b/sender.c
+@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
+=20
+ 		if (ndx - cur_flist->ndx_start >=3D 0)
+ 			file =3D cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file =3D dir_flist->files[cur_flist->parent_ndx];
+ 		if (F_PATHNAME(file)) {
+--=20
+2.44.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devt=
ools/rsync/rsync_3.2.7.bb
index d0796d3c12..14beafb681 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
+           file://CVE-2025-10158.patch \
            "
 SRC_URI[sha256sum] =3D "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488=
fb2dc41346f2bb"
=20
--=20
2.34.1


