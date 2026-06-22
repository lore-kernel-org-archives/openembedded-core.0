Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFACCD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:28:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44224.1782138524303146923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 07:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=P6/B//0Y;
 spf=pass (domain: ericsson.com, ip: 52.101.84.18, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHIr/uuWk7CB1DF/x1HMYh+26//3TNUu2G569glCwzSqqbt3OHdZPObKT6BWYlWqVPRLjTC3dlvHEjZNaXW7upFdBnFDVTpjFkcK9k2fXSZiq65nEqRyGzkY+y8N1BlPryXvCGoghNnpbLP5BL9exdQQUTyu7ZAgtteRCWWW0GQm40YocLCaUN24QztS4uX+z7WKLOOVMuEMe0fWACjMZnlt0FAlOXgq2gyMwTumddr84Mwzr4+LTdx0/yAxx62iBMPx5C/lyiUnJsAUG/GpgCBKjL8jpUzcnSXRFW0Gmw51jQ0PIvjQJTGtPdtKwCXKeESWPK5BWhV3ht0qCZA/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lskSvyc99XydmcoJs6npb4PB7TMnk2w1GYcxVxFMCnQ=;
 b=mZTBLX/JquTZRRcBC9Vz0ssvjg0jL1YJPU846WFyWn+7MhPMT3jU/pmIob4lbwHDj/pLEhvKiRgRHdepCC9uhhJ/iHwD5kDFa8K+EXXbu4Z8+dpCGTPFHlyobEgA96J/xXEQCHdKYoNZMvby5veqs5th59t485IcPye5jKwbW1uRtST8xqJVtJFA0tGiKkEYuHpMt1/onabCD+n9pG1UTJsDEuAT1ou9+fZgnIqSF2VIwV1IvoJ36weZCjm4sicvJZIAa1daxb3hRG8kSTxrCzSgnHetkIdNPRP7iuhfg+7h+2Og5TSCH9m8C2BPVDBWBjSROr8C248I35XyZN4AzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lskSvyc99XydmcoJs6npb4PB7TMnk2w1GYcxVxFMCnQ=;
 b=P6/B//0YctO5S94NGpmu+AHhY2VpfPk0XwNxTDYTEwKQMlU9NspnV8kXizisLNKTkiBe/In5CCzFcXmhY7xV/+/qAt69fcVcRfqQeaXVXsMzsdQ0uDfQQifb/sDqD3gQJQoCoGyZJZvhH+cvbC+FJF9WPxBQIENFb163yd6N3l0osH9kHvFOlaHAUTiU+/tlqNy/2q3gjLOhzys6Dpb8GVwKEUw5nDdlK6QrfhYXtAB+XZ1+AamfcsUIIdga1dq8bhqTwfSoMG8IkkheUZ1PIvUCnisz/SqwMlGdAljcOnXWMtBfRt0lj/Xjo/2vHO9/eJ1w9C4S9sMZjeZprvghSg==
Received: from CWLP123CA0197.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::20)
 by AS8PR07MB7719.eurprd07.prod.outlook.com (2603:10a6:20b:39f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Mon, 22 Jun
 2026 14:28:33 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::46) by CWLP123CA0197.outlook.office365.com
 (2603:10a6:400:19c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 14:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 14:28:33 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 16:28:32 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 8DC8F4020B78;
	Mon, 22 Jun 2026 16:28:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 78E5F700DBB0; Mon, 22 Jun 2026 16:28:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] libssh2: fix CVE-2026-55199
Date: Mon, 22 Jun 2026 16:28:18 +0200
Message-ID: <20260622142818.2854496-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|AS8PR07MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: e889f409-d8fe-46bc-bb11-08ded06a89f6
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|12006099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	L3XeeT3PgVDcnNhYp7a+JygtqfrgxJBXeG7ZDbHIZTStNs+/eYhZ8c58sFnJ/oPUt+6clP+a5MrHTrRPbOtrIfI/XdXH9pvqikjwOmjZAydfNs17ENgRUvavis04If0FiCPHeBgo07GdF2PyAS6mmYKSilJZULycLjb8K2iR7pQvlKldnWCo4PjpUkMSJNSERyP7yDDMq1jHo4AeV2p4i0UjN+t7GWZ8ah5K7LEHhVTECFirmFLpKj9/wttI+debh74sUF8KvuJ6v09lfiMCj+oZ7B1mllwch0F7GSexdE/g3lWgHtdxZJ6to2InvHzvBuRkTzrQBQbodtUoOKp61yDnz+eUvd9ZBi3+p/RyjLnzCBLLoCNaY7i9FyvK/6liCe3esACfrGJLyGgHTJIIYtTJ9tvUL8lUV5WiU5nMI8o95Q0j+E38sJvm/nO0ackwAgBmx1/LiWS9HKsuyJTqT4x2Oq/JhB2sePOGRHu7L9D8gm2McszU2ZlbY2t8i8SGO0R9M/g/4NlIlPWO/9WMNQRdBaKFbEcvjiU3JDw/uIOWFjprqnNI+5ry4YLlXNwISMQb8TNlOn87bSpf6CNipnJzqysbDJ4uvwbPXQobyjoqDxnDRUDJ94WeeT/laU84JiMleZVJMnLQODUxJo0nMp+ooOZfMLOIiFdp8n8Ku9fr1ujHYMx9InHuTTCCTMTGUSEs9dHP1RvBfYQfyNxAVQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(12006099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JYJjk8UH1h7LzgMSq//etxJIaq0O5LyeneQhw+2Y6h4suvE6RZTIBlaqDXB1pLeNDjVi2qx+Pz7wyVawAkPfozFPw90tWhTd2bWHJdNFC6Wxn74UZrXbxu9c4f/XgdkFtv+QIqoq1vTCsZd86YpSI2UtYtXRmV2nRorVDJi2flXX1XcmhRxEdhguDl+H5FGJZj2SbnvibR1Bs+a/8NRkYz0Otcuud3blbqbzCgJmOVuppLMSncgxhFm7RmO9iV4owz9FrJzw7j3qHuuMW9x5oz/oxn9cSRha6Os0EeqDz61xEc/cLenDe6epE3R4EB1ndaNJjcDo/F8Iq/d5lBGnm80LpVxRZ0vdg7GbOVgRzoDZMM9+fNQqtWInPwUtBkFRe7OKmtBI3nN9xEPzzDB1YvAx9EGa0amoy7cPPvwKXwDoTo073VOEH8MyYkM8HBJp
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:28:33.2337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e889f409-d8fe-46bc-bb11-08ded06a89f6
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239302

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-55199.
https://nvd.nist.gov/vuln/detail/CVE-2026-55199

Upstream fix:
  https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadc=
ee1cd84a4

Tested with ptest:
Before: PASSED: 3, FAILED: 0, SKIPPED: 0
After: PASSED: 3, FAILED: 0, SKIPPED: 0

Reviewed-by: Anders Heimer <anders.heimer@est.tech
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
This patch should be applied to scarthgap and wrynose as well.
It is the same libss2 version.

Also it should be applied after the "libssh2: fix CVE-2026-55200"=20

Or do you want me to resend them as a series to the 3 releases?

---
 .../libssh2/libssh2/CVE-2026-55199.patch      | 44 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
new file mode 100644
index 0000000000..81815486ad
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
@@ -0,0 +1,44 @@
+From b5cb1c1781ba5f275485f65855d61faaba6542b2 Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Wed, 15 Apr 2026 14:51:08 -0400
+Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO=
`
+ handler
+
+The `SSH_MSG_EXT_INFO` handler discards the return values from
+`_libssh2_get_string()` when parsing extension name/value pairs. When
+the buffer is exhausted before all claimed extensions are parsed,
+the loop continues with no-op iterations until `nr_extensions` reaches
+zero.
+
+The `nr_extensions >=3D 1024` cap limits the worst case, but the loop
+should still break on parse failure for correctness and consistency
+with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
+`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
+
+Closes #1864
+
+CVE: CVE-2026-55199
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/17626=
857d20b3c9a1addfa45979dadcee1cd84a4]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ src/packet.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/packet.c b/src/packet.c
+index 6da14e9f..ebaddae5 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsign=
ed char *data,
+=20
+                     nr_extensions -=3D 1;
+=20
+-                    _libssh2_get_string(&buf, &name, &name_len);
+-                    _libssh2_get_string(&buf, &value, &value_len);
++                    if(_libssh2_get_string(&buf, &name, &name_len))
++                        break;
++                    if(_libssh2_get_string(&buf, &value, &value_len))
++                        break;
+=20
+                     if(name && value) {
+                         _libssh2_debug((session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 5ffc40b8fc..2407ed34d9 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://0001-Return-error-if-user-KEX-methods-are-invalid.patch =
\
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
+           file://CVE-2026-55199.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--=20
2.51.0


