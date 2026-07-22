Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B589C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:38:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47209.1784723926486096981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=PP465OZB;
 spf=pass (domain: est.tech, ip: 52.101.66.12, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXjuCPEwuTrvHc3CCO+aDXfqU7ytvywEwsrmha+Qh9WoLJz8HrxGHrlltI27MaZWk7KCYYJTJy60y7EIagCOmN498kExWzedL1uvNqO+Z292OFoS56v9jl7YZ1tIhG2WxTHwm5Klh7WyWShGC7xxCqWkDnjzFS/q3SAP8eHgLSejgHwBwP/MIodWTjD8twc9ILMBgrLYxJRtAXXlqL4FSHN6KlnbU/GiEl1ddccK23CnbGPI5h/MRQDXI4wpn3HGaFW4Psuzi7ux38Tm4HrVx7+LiCcnWbAlAWSsdBgrPWb4VsFVaY7k8cle3qvLrQLfBIGWw2hd5U7LTE4YsO70yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XscCRuSPafgmCB+N4WGZrzM8f/gHWhV9MKM/gOxB0Xc=;
 b=iEPY5g3Txku6wkDYKc/oU6rjOBKiskI4qpHD3JmIFVQA5QRh1cc+JtQs6dSxQGMTQ4jxppd1GNnMVgB2BaoccWxQ24olowq4rbo3GlMBYcpwtjaOxMsQW5MoD/7tYTd1kWWU/BYqz70HDg1k4tcPrkujdqnzoUcs94sDoEfY3UZHGsaslDn/xbfl/hqr/3DvJq9sKHIloB03EIEtfxjyPhEK6Qud977KRfvzCjQVp/cWYLyuwO0sL17KOaiiOPk4hDM+yqhaTVnvx9xVXmUObdlBaCfAx0mHCYbpM9txGzPpJI1MeF7731HCaQautbXproVM9eMFv31lQ2oPb68nSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XscCRuSPafgmCB+N4WGZrzM8f/gHWhV9MKM/gOxB0Xc=;
 b=PP465OZB7LFoHTQBEBjDv0xvdcQy5Euoe8H7ZN3zoK3GnZvrT0HWLGVDgTCb63CfL4PNsqLUAQxNofB/0JYCn5bK2qL3OUEWbJ/SWz7JztLrZXsNj4kD0cAHRJHh4fn1lltbtroUfWvMcG2duvG/BAFGtDsVY1UBphKmh2PLdo1hP60OA8wv/Ou7wAEs46Pmpin1/kjaxo+Cle7O9tlORK/tcqP7aiCRc1Q/rQScsmS6JQ02SqwoT17V6aRpykwWHMLSdKmMVTOEqFcF9PfwGbyF1MAV+jC+Rha0vfT33sAO4DHdLv6bCIxrsKIbSbtq+lFbKz/UgUI7MigArm/awg==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB8P189MB0649.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.4; Wed, 22 Jul
 2026 12:38:42 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:38:42 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 4/4] gawk: Fix CVE-2026-40553
Thread-Topic: [OE-core][scarthgap][PATCH 4/4] gawk: Fix CVE-2026-40553
Thread-Index: AQHdGcB8pps0Sk98m0amftnZ06SW4LZ5en7k
Date: Wed, 22 Jul 2026 12:38:42 +0000
Message-ID: 
 <AM9P189MB1731ED5B9B80992358C63DF8F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
 <20260722095627.1424705-4-dkelaiya@cisco.com>
In-Reply-To: <20260722095627.1424705-4-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB8P189MB0649:EE_
x-ms-office365-filtering-correlation-id: 1c75b3d8-7b1c-4590-11d3-08dee7ee29fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|38070700021|13003099007|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 7dglTjbxMf33a80ZDHKzOAeyrWuS+9PdCDbvfDo7Xox8Auaa8GPSv8LKd/+lR5MegkFhdtX1HmLprL3oqzkO9M31zuGlL0g4FEDq7tHGr6UBQFFTSPyFkl1oHTp9UQGaKJh/PapWu4TEDSy95D3Op8jZbE/RQ8aJzlpQW3pPGVQA/bcGugK7jZYyMNmZYeIztxyZk+pEP37sCnVxbKy4GuE/hoquN0LED8Ae3aTVokl4RPqrhPLNaVGxADpXfbJpIYHxrLRkxhqgKnKxHuFR/Z9oX2wZvUPjRNOmhcLbyCWQiJJedJbd47sss5Id91p7rHK/79WO1ZPYg2VOE4zcQYHPhW6YNSEcGzlNXGwQez/nTropY2/vM67nCYcJ6SwxYsbjFzmZJBo4Qf8VUnL8LuoaYcwnLy3n7RCg+ZoK6x6S70npPvJ9ViFCYOAlKJ6myqaPvFu0Rwxb7EdZ2cWRCfi2KQ/TgtulhYEhnTSs6J31eWuDBS8Ibdf7mqDnEtjnDld/XzVvk3HaoO1rtGh404+th9xvMOVn7LV6VBKdLy0AsoH5PTQABReKjIt+WomjUKGiKWrJKfJZ1rdWD9sjgawFM3XdCtN9lyY6l0XR2NNuluOBop7K/Qf7DtHWexBXTUPRW5lSkJoE5H52mNDOwIf7DpwyxNfjLHrs6Y9b1Z8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(38070700021)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DFb48ZgAId81rb9rvVeL/KU1cpT+BaXT59qDx5ZaTGoK7nEhgaXX7akube6V?=
 =?us-ascii?Q?+1V9F595wX5HhOnXp493ntYahbY8znVpM9H+1F/h573wvq3a1uLNDMjj/dFv?=
 =?us-ascii?Q?R5sLOCih0pjiCH0GLkbdqcdMfMAtIkAy3Rga76VcrQ+utRuv5JNhmR81wYkO?=
 =?us-ascii?Q?2l8afshaDterxgIuR12MMpObjdwGZfWPqbbIMYQKA7iHpLd0ozW/crSDmheo?=
 =?us-ascii?Q?zyL0XqtbAu0iRYpbHJDN20gQpCEMCSNW9PO0JtlfgZ8lRY6PwNjssih5JVHX?=
 =?us-ascii?Q?VTVRfmUrbRQb/wr9902qIBM3jxqciNyeHl+vESv2YGwfYh9EiW/sTj6hPG9W?=
 =?us-ascii?Q?ESSC2F/urslgnfpy2csVuta+VsTdXVMAcIVs2zntVGb1H5vnRnwfiqrVtS0s?=
 =?us-ascii?Q?Dvgu1yZv9+duC4SxkEXRpZTwrzuLsO/m2gUvxpwvt/bD1txxfEq2VrnGhMts?=
 =?us-ascii?Q?dZ+n+UCzf5ZX5nJyDbW9pqXQJpuAkn9Kh8MFhlwUgMZUDlp1B2X449LCkK/4?=
 =?us-ascii?Q?ugG5zGYFlmmZBsTQCaOHS2QFhNNO3JVpc4u1xW7VFU36LsvI2QfU4+XLlEpK?=
 =?us-ascii?Q?/NK7D+TuNILvnyJ4IkydwvQBLYeBKvUA3KnX5/HHXg7HRXuRIunPRNWJFXEE?=
 =?us-ascii?Q?F0bxbJqAiUAjiuOamIp3bRh9AfVXGSfaAI02WF30HevOV0QarYMIXof+l3Ut?=
 =?us-ascii?Q?USFQYlxhPqi8gdN0As0wf0dT1BoNAomY9XwIF6LXohNgqZfODYKwk6hZnM3c?=
 =?us-ascii?Q?SlSgdfIjOnIuXH9Lw0UBEX4M7uO3UpSIPyJ/lEVlAt/rw9qywc7Jou6a3vqC?=
 =?us-ascii?Q?IheEo0xf4LlkoqORuEPK2rxMJwWfEphaoAuKtbQZko7BQIJAtPaaGCq2agJ6?=
 =?us-ascii?Q?hOUwpD6A7T4enzZrEAkvqoK/VGzhScob5w7vw9eGlASKi+bZ+4cU3BFvaxXg?=
 =?us-ascii?Q?F7iP2SYObYlo5QxRfzWDF95VdNet7XqA9vuUMikMfhfL0v+tnqraQFKYwNcK?=
 =?us-ascii?Q?LQqEQDQKU/FZWRdZRMY6AOEmEr/fT+ORWqeQopacCNPaCPpwo/uGfTdnR/v4?=
 =?us-ascii?Q?8o/+Koc8fxINoBNFV8NuOUCm+rTUyhpZVLqEFjC+/dPqVrCleMDk4GBVWM+G?=
 =?us-ascii?Q?q8QZ6FfMn6g7S4MggQwdaoiMfb1KP9RFjbPIS+SBbtSzWfjD2zWPreMRTVxy?=
 =?us-ascii?Q?/ex6eZFfVizSdHCjzi+dZFZt4Lt1pYYWAPHGvAsGKWu0e/BRueUDFKY5Ct8/?=
 =?us-ascii?Q?uyjJQfyNGAqhseer0DI5G8lWrVfILeszzxHtiIo2HP09l6haTH9YyLaGQBRV?=
 =?us-ascii?Q?fW9AgNHQiHhQXnHTeMZBT5iidN/ZtvUXmEgNVYO3KCB9nBslVAXPHO5ORr50?=
 =?us-ascii?Q?TPg0wk3mS2P8sMBM/gOsD+3x7VkIdnrbVDqW+IBdLO3C6ByZaXV2Huflp75i?=
 =?us-ascii?Q?jbtYQ1jObfZ1w+7O+1zBq4xH46bnPiYCjP7Y/fOmErGlv+a1lQ5jqwUA7jHT?=
 =?us-ascii?Q?N1BmhUTRk5Lfd9PBuSks1r2GJbrKVuRBaFsnP3GXc58rMiZD84maOc5QzHGB?=
 =?us-ascii?Q?98uD7bBBmH2Rjso5ocKDumran3ty/T44vkrVbTxGLE8khCsOnnh9FY7MkYgt?=
 =?us-ascii?Q?6oCpLoB71BWAAtLcK+kfgBHl2OU7ucKOJixRGfYLD3IbUcWt7xrINt1BXxtd?=
 =?us-ascii?Q?bVGEhsgZgUdTT9cMuFtIjVn0rhJigs3q99/QJxukKlOdDbHjulq2XOhVYCHs?=
 =?us-ascii?Q?c+uEMQEM9qY3x6abGFqXJ7tTkLQeN3frKMeuE30sAk8SYI4VJdlEtFwBoXgr?=
x-ms-exchange-antispam-messagedata-1: xyWn51+3psL8gQ==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB1731ED5B9B80992358C63DF8F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c75b3d8-7b1c-4590-11d3-08dee7ee29fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:38:42.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hsCbb8RyEZGJkkOC/etMzneQen8QAk9ckhFGTRxmMr5mc8NEgN8dPqHpGU1hhW4jOo/jH5R2SkgB5wddP0t3gVgGdvAWhwjSvHWPbITeSkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241682

--_000_AM9P189MB1731ED5B9B80992358C63DF8F1C12AM9P189MB1731EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVAT=
E LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3Dcisco.com@lists.=
openembedded.org>
Sent: Wednesday, July 22, 2026 11:56 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external@cisco.com <xe-linux-external@cisco.com>; Darsh Kelaiy=
a <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/4] gawk: Fix CVE-2026-40553

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commit shown in [1]. It also applies the corrective follow-up [2],
which fixes the snprintf() truncation boundary check. Both commits
are included in gawk 5.4.1, identified as the fixed release in [4].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dcca0366144=
336b49aaa7d5d949966ce8e2c70843
[2] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dbfa2e4b890=
a44100a99d26b54af385479528b12e
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-40553
[4] https://cert.pl/en/posts/2026/07/CVE-2026-40467/

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40553_p1.patch         | 50 +++++++++++++++++++
 .../gawk/gawk/CVE-2026-40553_p2.patch         | 44 ++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 0000000000..07b7df488a
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From aa39cac4bda6333be0f6253ecb7dfade26cb9641 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 15 Apr 2026 09:39:02 +0300
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3Dcca0366144336b49aaa7d5d949966ce8e2c70843]
+
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 6 ++++++
+ extension/readdir.c | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 40ed6dd0..52a4c6ab 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * readdir.c (ftype): Use snprintf() to check for buffer
++      overflow in the file name before calling stat(). Thanks to
++      Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2023-11-02         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * 5.3.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index 788e1d1e..b525fe21 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -117,8 +117,12 @@ ftype(struct dirent *entry, const char *dirname)
+ #endif
+        char fname[PATH_MAX];
+        struct stat sbuf;
++      int count;
++
++      count =3D snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->d=
_name);
++      if (count > sizeof(fname))
++              return "u";     // buffer overflow. skip stat() call.
+
+-      sprintf(fname, "%s/%s", dirname, entry->d_name);
+        if (stat(fname, &sbuf) =3D=3D 0) {
+                if (S_ISBLK(sbuf.st_mode))
+                        return "b";
+--
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 0000000000..2f63572af0
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From 8b08dcf6c784e7a98d08e9e63a8fda15040eee30 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 17 Apr 2026 11:48:19 +0300
+Subject: [PATCH] Small fix in extension/readdir.c.
+
+CVE: CVE-2026-40553
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3Dbfa2e4b890a44100a99d26b54af385479528b12e]
+
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ extension/ChangeLog | 5 +++++
+ extension/readdir.c | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index 52a4c6ab..c8839357 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,8 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * readdir.c (ftype): Use >=3D in check of snprintf() return
++      value. Thanks to Andrew Schorr <aschorr@telemetry-investments.com>.
++
+ 2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * readdir.c (ftype): Use snprintf() to check for buffer
+diff --git a/extension/readdir.c b/extension/readdir.c
+index b525fe21..6f9b6811 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -120,7 +120,7 @@ ftype(struct dirent *entry, const char *dirname)
+        int count;
+
+        count =3D snprintf(fname, sizeof(fname), "%s/%s", dirname, entry->=
d_name);
+-      if (count > sizeof(fname))
++      if (count >=3D sizeof(fname))
+                return "u";     // buffer overflow. skip stat() call.
+
+        if (stat(fname, &sbuf) =3D=3D 0) {
+--
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb
index 7bd34a3ff8..d71f655ba6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -25,6 +25,8 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "

 SRC_URI[sha256sum] =3D "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb5=
5e440d30273336"
--
2.35.6


--_000_AM9P189MB1731ED5B9B80992358C63DF8F1C12AM9P189MB1731EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Looks good to me.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Leonid Iziumtsev &lt;leonid.iziumtsev@est.tech&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS
 PRIVATE LIMITED at Cisco) via lists.openembedded.org &lt;dkelaiya=3Dcisco.=
com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, July 22, 2026 11:56 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external@cisco.com &lt;xe-linux-external@cisco.com&gt;;=
 Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [OE-core][scarthgap][PATCH 4/4] gawk: Fix CVE-2026-40553</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<br>
This patch applies the upstream fix as referenced in [3], using the<br>
commit shown in [1]. It also applies the corrective follow-up [2],<br>
which fixes the snprintf() truncation boundary check. Both commits<br>
are included in gawk 5.4.1, identified as the fixed release in [4].<br>
<br>
[1] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Dcca0366144336b49aaa7d5d949966ce8e2c70843">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dcca0366144336b=
49aaa7d5d949966ce8e2c70843</a><br>
[2] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Dbfa2e4b890a44100a99d26b54af385479528b12e">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dbfa2e4b890a441=
00a99d26b54af385479528b12e</a><br>
[3] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-40553">https://nvd=
.nist.gov/vuln/detail/CVE-2026-40553</a><br>
[4] <a href=3D"https://cert.pl/en/posts/2026/07/CVE-2026-40467/">https://ce=
rt.pl/en/posts/2026/07/CVE-2026-40467/</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
&nbsp;.../gawk/gawk/CVE-2026-40553_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 50 +++++++++++++++++++<br>
&nbsp;.../gawk/gawk/CVE-2026-40553_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 44 ++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.3.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 2 +<br>
&nbsp;3 files changed, 96 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.=
patch<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.=
patch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch<br>
new file mode 100644<br>
index 0000000000..07b7df488a<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch<br>
@@ -0,0 +1,50 @@<br>
+From aa39cac4bda6333be0f6253ecb7dfade26cb9641 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Wed, 15 Apr 2026 09:39:02 +0300<br>
+Subject: [PATCH] Avoid buffer overflow in extension/readdir.c.<br>
+<br>
+CVE: CVE-2026-40553<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3Dcca0366144336b49aaa7d5d949966ce8e2c70843">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dcca0366144336b49aaa7d5=
d949966ce8e2c70843</a>]<br>
+<br>
+(cherry picked from commit cca0366144336b49aaa7d5d949966ce8e2c70843)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ extension/ChangeLog | 6 ++++++<br>
+ extension/readdir.c | 6 +++++-<br>
+ 2 files changed, 11 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/extension/ChangeLog b/extension/ChangeLog<br>
+index 40ed6dd0..52a4c6ab 100644<br>
+--- a/extension/ChangeLog<br>
++++ b/extension/ChangeLog<br>
+@@ -1,3 +1,9 @@<br>
++2026-04-15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * readdir.c (ftype): Use snprintf() to che=
ck for buffer<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; overflow in the file name before calling s=
tat(). Thanks to<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Marcin Wyczechowski &lt;mwyczechowski@afin=
e.com&gt; for the report.<br>
++<br>
+ 2023-11-02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 5.3.0: Release tar ball made.=
<br>
+diff --git a/extension/readdir.c b/extension/readdir.c<br>
+index 788e1d1e..b525fe21 100644<br>
+--- a/extension/readdir.c<br>
++++ b/extension/readdir.c<br>
+@@ -117,8 +117,12 @@ ftype(struct dirent *entry, const char *dirname)<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char fname[PATH_MAX];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat sbuf;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count =3D snprintf(fname, sizeof(fname), &=
quot;%s/%s&quot;, dirname, entry-&gt;d_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt; sizeof(fname))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return &quot;u&quot;;&nbsp;&nbsp;&nbsp;&nbsp; // buffer overflow. ski=
p stat() call.<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sprintf(fname, &quot;%s/%s&quot;, dirname,=
 entry-&gt;d_name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (stat(fname, &amp;sbuf) =3D=
=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (S_ISBLK(sbuf.st_mode))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &qu=
ot;b&quot;;<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch<br>
new file mode 100644<br>
index 0000000000..2f63572af0<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch<br>
@@ -0,0 +1,44 @@<br>
+From 8b08dcf6c784e7a98d08e9e63a8fda15040eee30 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Fri, 17 Apr 2026 11:48:19 +0300<br>
+Subject: [PATCH] Small fix in extension/readdir.c.<br>
+<br>
+CVE: CVE-2026-40553<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3Dbfa2e4b890a44100a99d26b54af385479528b12e">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Dbfa2e4b890a44100a99d26=
b54af385479528b12e</a>]<br>
+<br>
+(cherry picked from commit bfa2e4b890a44100a99d26b54af385479528b12e)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ extension/ChangeLog | 5 +++++<br>
+ extension/readdir.c | 2 +-<br>
+ 2 files changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/extension/ChangeLog b/extension/ChangeLog<br>
+index 52a4c6ab..c8839357 100644<br>
+--- a/extension/ChangeLog<br>
++++ b/extension/ChangeLog<br>
+@@ -1,3 +1,8 @@<br>
++2026-04-15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * readdir.c (ftype): Use &gt;=3D in check =
of snprintf() return<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value. Thanks to Andrew Schorr &lt;aschorr=
@telemetry-investments.com&gt;.<br>
++<br>
+ 2026-04-15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * readdir.c (ftype): Use snprin=
tf() to check for buffer<br>
+diff --git a/extension/readdir.c b/extension/readdir.c<br>
+index b525fe21..6f9b6811 100644<br>
+--- a/extension/readdir.c<br>
++++ b/extension/readdir.c<br>
+@@ -120,7 +120,7 @@ ftype(struct dirent *entry, const char *dirname)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count =3D snprintf(fname, sizeo=
f(fname), &quot;%s/%s&quot;, dirname, entry-&gt;d_name);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt; sizeof(fname))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &gt;=3D sizeof(fname))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return &quot;u&quot;;&nbsp;&nbsp;&nbsp;&nbsp; // buffer ov=
erflow. skip stat() call.<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (stat(fname, &amp;sbuf) =3D=
=3D 0) {<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb<br>
index 7bd34a3ff8..d71f655ba6 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
@@ -25,6 +25,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40468.patch">file://CVE-2026-40468.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40469.patch">file://CVE-2026-40469.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40553_p1.patch">file://CVE-2026-40553_p1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40553_p2.patch">file://CVE-2026-40553_p2.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;378f8864ec21cfceaa048f7e1869ac9b4597b449=
087caf1eb55e440d30273336&quot;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P189MB1731ED5B9B80992358C63DF8F1C12AM9P189MB1731EURP_--

