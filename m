Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8003.1793353891492089004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 02:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fELd/eZD;
 spf=pass (domain: est.tech, ip: 52.101.66.46, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVSe0kZt+wmWUziqRYn0RU3YCGIOudMqxJ2wHrtzMkg6aF/hjqB+8PyIlEkmodwf2y4L4BpSwOtokqy8iM3GYq4SF4VDzV8VFmGbFuA+yzT4WPQMGeB96MTc7XPOIFBtTQaf8foaaZqt8uLTIZvz9mUXbVSzYhp51gXs/lTmkPEkG1r/tkm1awsoJIxhyBQfOxZ2DKQ9Nky6ogAiCgqbSubd5y/dMN1oJcLzn5FPzkRE/LWVdmAb529CIiyLnNsz30igGojUHTZg+9+jCwREPh4l8uMkGh4WVd5OQ+R/zXgacMXbpDF28Wnk5unoRJG/apsn5dvlxDqnSsl1w2QxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5QmPm/K6JG9FvzJJHb02rQYkSYcfxIHPrkzD4IID10=;
 b=IG1A4LezV9fjtYgb6LfH+c5Ab2+yd5XuvU/064o4joRsE8NxuHp872IK3CIKl+nQiffDU2E7CeIin2QPFuWzHkvInvzNpCzz20T25l4mx8nu2ROkDq6/kAlm8SZZVP33uJGCeSI1Ua4qy7XmAW0rXKA9nehVkVxw8F4Faovssa+aHoG/J8HBzdcVy9FuEg/wB+xdeW6xEF+F86UreW3AQJlQ37SUFQ8rNnl6qytQvHgYd8kPN/ku+M1LhDKY4smBkH5cqW7v7IiARHV4otnM3Z/ZDjWArCOCX3u5PLKNSaMMI0yR951LGTu3NW2hGif3fRiQoR7lKOeY5sLdcbyscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5QmPm/K6JG9FvzJJHb02rQYkSYcfxIHPrkzD4IID10=;
 b=fELd/eZDxR8etZv+GRrZ8agofhnE0gDBzUx6lQF2lX44jyn0W81EApjQbSzsYVnPrX+RnN4FswC0qbPeoQTed8RrwgrVdLAJFbDeg5ZcBg4Vxjsky5o2v12gLr+gnckzom3FX8cdCZGeBPX/fbLqKEnY0oowJ7SOQ5aKXE1tnnddR9hdK/Q9GlW8c2B7DyMFDG0qIl9PpVHSK8EdMbj5TLimigm0+4wTpjO14kvKDsaeGe/Eewjb/RZdb99dJ7/45xFnpEv/GORE/LF9kj9AX1vSb8kojkrtoHEp98BgZ7J8YPGO8H0dDyDGmIKXWKDLE7v0MixDHVKQoH7orgaxqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by VI2P189MB3659.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:51:26 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 09:51:26 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] curl: fix CVE-2026-92389
Date: Fri, 30 Oct 2026 10:51:24 +0100
Message-ID: <20261030095124.32916-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|VI2P189MB3659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3e0f32-20d2-42b3-1282-08df366b5d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261009223027099003|261028144727099003|261022113327099003|261026130827099003|261026135527099003|10067099003|261026140227099003|261026121527099003|261022115727099003|261021121427099003|261021135927099003|261021123027099003|261021130227099003|261021133027099003|261022075727099003|261022105027099003|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: ZZjZwHtbj/RlzuN2LQ8aQhaJL1WVCBS/2tNF6FfuQ/3a48vVoYmSJMHzfATFSbMAycVC/D9fYIIvR4eEJ7orFOEJRmqlHpFZipRhuB8VUTVSTYqAHv6TTRzH06ED2RnLtlveXOImnMhuQLuCdeR9CTcNLB8qFyDxtvuiMkRnBcFc+qqYCkr8Pz2KbFXM3m5LyJ2xGGMMSuxYSfkdqFCSr5I8tPMnAFRYGrOPoVt7MNqQKasWq2gFm9ARw+lRqcc0F3ugmKjCOu85EOADtNXCZvQ3nnLCEgK4mxSnCs+tImDSbEC4gj+yHy7QOEdX2cJnzKzG/8t2v+dqG0AZDlz4XCgzQX9iweOuQlm7Ppp3u9MvQ1JR/t1Bbtl6ml15PG5Uh+Eq3O7Jwub+4rZXDjt2+eyQHJEKKwFHt77k4sXX2TCdKJFRbNvz9ZNZRBr0tCNvgE7txGAhEKTgIaoaUTawNst/fkyoMWPduHgCFFuMXG3DrmEKjYEt6z75CDmRXm1QRkUROB/qwVktPnZxqdizq9l6SGSMdKPVIXoebeVS+TRQ/kPAYh+PNS/es7on1+CvAPdZY6vJjmIBp6kZwFhfqiJVwO6AlhqQU4xWEjp9iHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022113327099003)(261026130827099003)(261026135527099003)(10067099003)(261026140227099003)(261026121527099003)(261022115727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261021130227099003)(261021133027099003)(261022075727099003)(261022105027099003)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G8dT083eu9A3Frk8XUBKNW+nQ2fQqUi1gDFfV8vR/F/Vbhd4XEwiwhhvqiru?=
 =?us-ascii?Q?xJbx9QMqGNw94jTb3DFvwZ6/6F9R7AaPm6TduPiNvnAmhIh6CZQ6bD6zl26v?=
 =?us-ascii?Q?phKGdRBsNuzu2K0aPYeoNxg7xljH3KS/wmaMFTDiBSU1uGbXZBkWTF/GJm9D?=
 =?us-ascii?Q?wP8i/yTZVNTT4Q6QkH7LL+c0HEBzdzptk8SZ8apL+S58dRHfw6f573v7tIfw?=
 =?us-ascii?Q?Y8q+fZbfUNl/hzifX+i6YPQUnJVOkNKfHovqn9Qt5lIRyTHnuMoYYa2PT8Kk?=
 =?us-ascii?Q?R2ufet6ECABfIEfc94EFEreDEEk7dPtFIP8cIQVUIv5x2EqnQdUmo6oJZgZG?=
 =?us-ascii?Q?ArEixgyNzJQX4yhekuK3xezOTOzAeQWmK2z0OLOnbC9vMt2Hbk9fKOLDOrER?=
 =?us-ascii?Q?UsDgPtp5LQK6ao7bO2R61zsMD4P9wD2I/Aca3kMlpiWolaUWXeONEQyHz72s?=
 =?us-ascii?Q?W0xPBJ7VWRLe03RFTTfmVfLeDAz2DBxEVeQ8+YvXpfAhpej7fJIO8WfP+SsV?=
 =?us-ascii?Q?L3hcdDA3erd3Oyw55Kj3DrpzABPf/edekfZhv7yh+GcFqewcqY6AAP+tx7WJ?=
 =?us-ascii?Q?gLwl/qHSGSB04exntOMsicR9Sa0uAMd6oihgGKhY31XW/O5FsMKFU0wGSiPt?=
 =?us-ascii?Q?orUnncw88vpvieV2OMnDYOz7abAOEJ2qMIpMxaasHXwQp/5liyYI0iFHqmWf?=
 =?us-ascii?Q?df/3P2wXTU2RVXXveDepURQuAQFilrHzRiNqY+ujcFUkLto9dc6q4oiwutiN?=
 =?us-ascii?Q?s6U50qfoS7zS6IV7ti0jejQ+H+MAVyOCGD6Ybg0BG3BQB145EgdEg2BxU/07?=
 =?us-ascii?Q?zEV0ADQKxk/YJE/+Zx4Ayd1ZBVNJThULEej5vk6gwtdqnyfteYeYyliC0fet?=
 =?us-ascii?Q?eeZSzr3dBykJ9f4ogPwZlJ9mQuMlZxD0l22MsC0QOXdQrCe9eLHFjytHYFn4?=
 =?us-ascii?Q?vi1/hwBp5HM7ExLqi+0DnqolBqCFKjC+jMV/5WC0/VHGeBN5Jh45GubkE5UJ?=
 =?us-ascii?Q?jG6DM0vzFfRIq0whqNcR5nBc3gnSMmiOdFsh46bZ1MXwv+63x99aDYuMBMuL?=
 =?us-ascii?Q?ANVDJ8cXsRrPl19upfo1UVuYgGa4GFXBmSodutzF9YSnsL39vjrXIXrymu0F?=
 =?us-ascii?Q?sZARqEAnttGfLYqNnSZtV2xdEIkea/rnA1EfX0zEx9HZPxq95JBincuWNK4b?=
 =?us-ascii?Q?8obHvaPMQIHOR+KcAfhgM6iw6ohcmM23Tx5130NcDko/EUjZK6cV0e51SS09?=
 =?us-ascii?Q?1i6yy68GD3Cx0tAMn50sK3lJY9F67/zQwg1sT2YFJ9yZXKbUzkSSHwfmO/VB?=
 =?us-ascii?Q?/G6H6FPWqlBWJtE0Yp5ikiIomiHZGFAa1Q1Q4Fg1dSR/crnX2JVzxjx+x2U4?=
 =?us-ascii?Q?iR7Fjamn5zethbL01IVKeDWZvIqObKb/O3KO7gTlLuDAFx5MR+A4mKGtfWNF?=
 =?us-ascii?Q?oEjH6/KaxopttMWOJZGztRHrm1YB3iDkgi869lwqLSGzy+sxgKEEns0TKB4r?=
 =?us-ascii?Q?WrxvJgvjwVJ7DRkBzIqZbCz+LANqrF+w/+ssij7V1l00h63ALdcbHf17hpD+?=
 =?us-ascii?Q?2rqllYbxjVxvTAEPqZkJRDbV04hNllyyrxywk6ZVUAFVsRG+QJ2/TfVGJS4d?=
 =?us-ascii?Q?np5umZTbPvGInpBXRWXPsz9nHotjxNyuDJ3cOSn7GisA2l+xmmNm2wHGCm+F?=
 =?us-ascii?Q?WgAKOFzGC9Oj4uFQyl0rGA8/slcYiLGEc3LMZdRW/0TRefTfkKyIzDNiZphH?=
 =?us-ascii?Q?mPB9XhrjK4VQJLCMeTffeYCCxREHRk0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3e0f32-20d2-42b3-1282-08df366b5d01
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:51:26.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVOYzb5oqbg7fx7BBDaUKQOUEh0SJ41FWnFzydjwzIXKXZ8Qrb3diWsmh/O30e97CMpSFtya05kvwaMfSTXlqWyr7t4LblZP68Uv7VbGuLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 09:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249011
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92389.patch            | 53 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 0000000000..012b746e0c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,53 @@
+From f39da43ecdf06680a851ab00f3cace9ce8b90afb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab9=
05a239a97e270]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index cc0769bbb3..fca77b71cc 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -361,6 +361,9 @@ static CURLcode tftp_tx(struct tftp_conn *state, tftp_=
event_t event)
+   char *bufptr;
+   bool eos;
+=20
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+=20
+   case TFTP_EVENT_ACK:
+@@ -768,10 +771,14 @@ static CURLcode tftp_send_first(struct tftp_conn *st=
ate,
+     break;
+=20
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_tx(state, event);
+     break;
+=20
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_rx(state, event);
+     break;
+=20
+@@ -1074,6 +1081,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy=
 *data,
+=20
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Do not pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) =3D=3D getrpacketblock(&state->rpac=
ket))) {
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index 850ca7dc3f..722f8a578b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -42,6 +42,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87864.patch \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
+           file://CVE-2026-92389.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
