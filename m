Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECD5C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:44:54 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47041.1784724284809049813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=eUWafcY2;
 spf=pass (domain: est.tech, ip: 40.107.130.42, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0w0hPP8mFL0xtXfdqpfYUXKrzaRSV9nqUTEa5MexYJBaEiEpwpXoWgB+us9tji1YkO6GdO4HtxTWApHvTGbUD2VDMn8IqPxtAILIJ8hMwvZ0KVvozS++3A0HYQ4SnqbQpZOPT/ywnVY8+B7/IadGFltCWwyZBAF0iyqTAW/YVEn2tpPSWA3XQ0ktDL+XshZqdeACU3DeO2SHfGJXYDsMtZN9MJVV0zGYCSocHNL83SqKNOOTfwmOnNmxBEi0Nk7if45lO27C7uVhQFanS9J/jqX7tNruDO2BFXZvZUsvGau49pIxxmVjq3a2ownmfuUsyWPMoLKr0/eQ6+AmaQ9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOOT43iOIhuIQ0WPhnn6nokTEU1lqzFmwZN54c5BmJQ=;
 b=TT1TYwiiTlDCDHAH5Ib3Dr59WbKM5I8q7DP1zU6NAPzW0lMDhdr9tzGlO5bchEt8O444qYJz4kMLy0jmhbE6kL1l4OH3eaRTX+Hg1Pt9vp+HxoOtENmVeoQGddoS0KZ4RBLZjvPgnySUr5hAW1gBqfLSHEc4nOth4dz47gC1SUMHzgM0xXTbbZ4mWl9JOr+1Mij1d8VvoT2nmRwlzamx20ItEUeoeCgxeT1X7pNXGbcR+/cSeZnpg0mjs8RaLb1KqQQ1zK4wiC9VrMF+XRO1TpUAkRdknRHSr0ZvYp6p6LcV7pZ/t3bAJtwA9HdkjE3z670rQFyi8MFgaLThDjQpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOOT43iOIhuIQ0WPhnn6nokTEU1lqzFmwZN54c5BmJQ=;
 b=eUWafcY2/xNxOJLY90lCAwVfnN83mvvF8efBP8bpURXSLUGkt+spEMVoSmAuoJvES1pZlDx0HVDZKxfJtHQJYgCsqQKcuTnyy6cMaM4BwTSRZvnrM7Ig6SsWwobgq8I4dEiILUiDiBraX8erXdmKAlkjPmBWGsEMpsCIfFv9zUSKFcxUDDXfaaaYemCOHGRwMFHSDrWL0wx/khQpewfYQCCUqGviixkpjeMrw99aaloujN0E4yoyqRKzJzTNPFTzl56taOOR5JYCb0nIlOrhYJWSwYU2axqWiHIqf5+yN+hnK8QZbvmUsYc7UDV4aOk+fx8XmximPJBhrBRs3AZPBg==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by DB9P189MB3525.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:44:41 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:44:41 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 4/4] gawk: Fix CVE-2026-40553
Thread-Topic: [OE-core][wrynose][PATCH 4/4] gawk: Fix CVE-2026-40553
Thread-Index: AQHdGcAyhra5Io+RT0CxxRQoFk/qVrZ5fCgF
Date: Wed, 22 Jul 2026 12:44:41 +0000
Message-ID: 
 <AM9P189MB1731DCECD84DCAF7D9E5A075F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095430.1416791-1-dkelaiya@cisco.com>
 <20260722095430.1416791-4-dkelaiya@cisco.com>
In-Reply-To: <20260722095430.1416791-4-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|DB9P189MB3525:EE_
x-ms-office365-filtering-correlation-id: 869e1d82-5280-43af-4c7a-08dee7eeffe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|23010399003|13003099007|6133799003|22082099003|18002099003|38070700021|8096899003|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 Fup6MODYjGfiK876co0P/sBpFIOZ/VBkUHarKj2nobIND2be07LJPX/XQLnEf2ejrWDoZP//c10lcBTGwekG6g+i4FsMxqdmJUD9S76cwRrKnwhqw7iPajLHQF5K+ZDB2Ndu6qa9wnWoN+m77g+uEkKBINHiu1tynIkKBqxf3l/3UAZc7sJvRBS+eBKJa/rddmZbA630Ff3wsUxSr/FJF9laTqbwDKvyQ4P0SyMG8dLx+dSsLlbmuwmOU9e1QOx3YgSdAD808WDcrNjCqK5VgtvWNfZs7r5l+VvoLOP0PxbZxmd+NOkoKhHYLYnV9g8/lQoiMkuXXmcFZ3wXwNzZQyTI7foK2C5OcE8clRu+zWQQ7HqS5hVue2uLi3+dXN+kfLphX2wpTrPVbLH3XYHvFijadTGnBBfAnZ+qxtuvUrQo/RWCw+TcCsQv/Abc54z0gtuLKvflG8Og+WFZZ5XVta9CxNxztTPiW+Jy1SGux54yocYZGlRScgN3M6CPpgxUoy9xJ/4kWf/7OwmMu0eBqi+vCSzA2D6ZQik9FIyHxXKXDqy2p7CJwb2DtQwK9m0vUq71PPk20hKMrXMmI6JlrfZ/jISVNJ3k9OnVvEimgmsESGq3nLSHsmRfClpNeWrMVfY7SPUX4UDae2CVK8IJ8r+Sf6ZcsmkXgnoOLn9ai10=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(13003099007)(6133799003)(22082099003)(18002099003)(38070700021)(8096899003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?R0TZ9i5oRCf0wYWSlUntxnkaS550hqYpUv7ty2KLpNFF6cZQquZ+6/zZ4pnY?=
 =?us-ascii?Q?U9ODHJLIEiHoaqnUGCYPAaHIgQ819C7Y7iCsUHvKhnnFDRY2MvHqnfKNab7H?=
 =?us-ascii?Q?NlRpPlaDe2vJNhEWpp8Vf8rkXLBZg7bUvEARCDj76bcgNVeGFLjL87SXxndD?=
 =?us-ascii?Q?AvcsiR1IuvHSKUgdiNIdRt5PnH8EcYss3IKc92mMr/TQEqD6R8PYJSGElZWZ?=
 =?us-ascii?Q?0hHeWo/F3bLqZfjxZ87RSICUgit+hneAu4jgF2pq3/lxZ/kRiMlMzdJI/Oqk?=
 =?us-ascii?Q?xPWZ1ZMC84LExvWDgCa1DbC1MBpod3WZU3cjlLpyf3cJ7uOlHt+wi8L9p+ER?=
 =?us-ascii?Q?1h++Cq7V878/f3GNXU976pMBkHLH9TC92bUix919Q11e61zcVXWXytMA+lWv?=
 =?us-ascii?Q?WK7eANVzWct/pUXGvxJ+SPtsofekBJfJO+cf/TP3srHV3h7S2uIxnl+0QeUb?=
 =?us-ascii?Q?PtYDEx+iNtGwZTBc000EPn28BZNf1TT1egko2yvxBtLpqbz7apAasMBzhbKu?=
 =?us-ascii?Q?2bVa6e2FvSSFSBvSur0skCOy/K1+QdbFpGSX2vm5AE6JMjKYYBaU8Qd5E1Jk?=
 =?us-ascii?Q?sRMXi4JhHzX7QlZvj5YG3bxRBN5dpRddxlgOWa3cebmvnUIx64F634DzAFq8?=
 =?us-ascii?Q?zHWE6x+USto37ShJDLrcyZp0cl6LFFawwxXo+NBiZJ7iYzsbVs1CpaRYXfkh?=
 =?us-ascii?Q?kPKhmyMFE67C3nLdvztfzBYn9EO+RNKVtQ73o2nQVvv8b18RXAtbqxIVlOcY?=
 =?us-ascii?Q?He05uLQT16L9daN+zuUrpbQ8e7fBwh6cpTcWQMqitJZN9QkyeQpZGh3XJ72i?=
 =?us-ascii?Q?ByYFgw4LG3oq12az/3COQsd1OdFWN8K0ms5jE/EWKP4sPetI5SRKPt7leA1f?=
 =?us-ascii?Q?xsPO1SQomkGGfO2PGMPGFRqR44rHGG0uCn/4Q8k/TP0uBVp8PbnqMe5MjrUo?=
 =?us-ascii?Q?gNlrkLLYjbXvk/v9+tK1VCqhwlp2DJN2AGqR6Ai85ZbR/WF3DSYsVaLvAM/N?=
 =?us-ascii?Q?8IG6JiY5tze1yTqZwzpCPVY4/UwyiPo+J17Tt7LyAHQMrNrmCMsjezijTllg?=
 =?us-ascii?Q?PwTMwUZPrDPd7o77oQ3Wr6dDF6wGavyCVY1PAWl7jnDzG54g/sMUkqCfY6/3?=
 =?us-ascii?Q?qRLlMn+iF+VCO560J0JzyqdNUAhXc9dfIfLbqpbfGkEtp5OTFcJV5PbOg7v4?=
 =?us-ascii?Q?FI31GRsuzekNgl8PxAbmSAOUldfNpCMSFgCxZJW4cCC/6vYOm980j8jEa/+M?=
 =?us-ascii?Q?ZehIfJYfUt8bfg+UUmiYL1c3TKREjn0306YgqvjzuS04jmO1D0TAz6VaSusO?=
 =?us-ascii?Q?eOvllbiEeiQd+mo4AXDJuUml9fyBBnCgU6WkCTFYddPqFlF6dSh0XcnT5HKM?=
 =?us-ascii?Q?cwytYb1R68wcXGWDasBjYG9kLUstIXmZ9/H8Mo3h/tuu2ExDoqunOCbKZYfW?=
 =?us-ascii?Q?KWDbLmM/8O1/bq6KQv0YXxBnCOhqW4AztEyNt0HZbXZyANxAcd4nH1//I/ni?=
 =?us-ascii?Q?cw+Kz6btXhEP1zcp23i8RcsSB6Y6yifw9sjE1WjeHNrZqGHMzKkNZuvnZOwl?=
 =?us-ascii?Q?uXUoqfFWSXnzfM+Paao3SBNA/zsNzvvtg7+nLI8YAXwv6PfhCpIGk7F/lu8I?=
 =?us-ascii?Q?VVmWsYBbUnqNRURvhQQk+vg93bLbKH7pV7xWwD/t/H9mYoL0tCIud+phRASZ?=
 =?us-ascii?Q?B/s61KkHXwDdd9VABN1FQcPpQG+DRfcQ6OUFMPHu6rZX1E8fqO7L3bL0LfvT?=
 =?us-ascii?Q?BDM261WN8HCELVnMDE+723apx5JBzAHyNWBbwBEVo3DHrJzX8/+UKBP09RF0?=
x-ms-exchange-antispam-messagedata-1: Um/dvztoXkijSg==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB1731DCECD84DCAF7D9E5A075F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 869e1d82-5280-43af-4c7a-08dee7eeffe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:44:41.4666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfamItQ3+EppejfX6n4iXIjkOOeEyQ2D+sUqOqMDy8Q5rhphtwgdfI9BIPhcHKksqG9zMwYYLeY7QZroMI5tzjva4ONDlgeB5kPC1qragnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241686

--_000_AM9P189MB1731DCECD84DCAF7D9E5A075F1C12AM9P189MB1731EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Reviewed-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVAT=
E LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3Dcisco.com@lists.=
openembedded.org>
Sent: Wednesday, July 22, 2026 11:54 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: xe-linux-external@cisco.com <xe-linux-external@cisco.com>; Darsh Kelaiy=
a <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/4] gawk: Fix CVE-2026-40553

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
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
new file mode 100644
index 0000000000..81e2efd6b9
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
@@ -0,0 +1,50 @@
+From 6e7695c994aa45c0f7e9f8b80aa6f99717bbaf60 Mon Sep 17 00:00:00 2001
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
+index b11e83ac..6f88eb19 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2026-04-15         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * readdir.c (ftype): Use snprintf() to check for buffer
++      overflow in the file name before calling stat(). Thanks to
++      Marcin Wyczechowski <mwyczechowski@afine.com> for the report.
++
+ 2026-02-22         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * 5.4.0: Release tar ball made.
+diff --git a/extension/readdir.c b/extension/readdir.c
+index f876e168..5bbee261 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -118,8 +118,12 @@ ftype(struct dirent *entry, const char *dirname)
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
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
new file mode 100644
index 0000000000..84bfdc5418
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
@@ -0,0 +1,44 @@
+From a98440e83cb19b042958a179293bd637c400a35b Mon Sep 17 00:00:00 2001
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
+index 6f88eb19..9fe216e6 100644
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
+index 5bbee261..3cb31834 100644
+--- a/extension/readdir.c
++++ b/extension/readdir.c
+@@ -121,7 +121,7 @@ ftype(struct dirent *entry, const char *dirname)
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
+2.53.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb
index a7c88224dd..f44d82b37c 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -31,6 +31,8 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://CVE-2026-40467.patch \
            file://CVE-2026-40468.patch \
            file://CVE-2026-40469.patch \
+           file://CVE-2026-40553_p1.patch \
+           file://CVE-2026-40553_p2.patch \
            "

 SRC_URI[sha256sum] =3D "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc26=
8ca428a90b4ac1"
--
2.35.6


--_000_AM9P189MB1731DCECD84DCAF7D9E5A075F1C12AM9P189MB1731EURP_
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
<b>Sent:</b> Wednesday, July 22, 2026 11:54 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external@cisco.com &lt;xe-linux-external@cisco.com&gt;;=
 Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<b>Subject:</b> [OE-core][wrynose][PATCH 4/4] gawk: Fix CVE-2026-40553</fon=
t>
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
&nbsp;meta/recipes-extended/gawk/gawk_5.4.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
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
index 0000000000..81e2efd6b9<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch<br>
@@ -0,0 +1,50 @@<br>
+From 6e7695c994aa45c0f7e9f8b80aa6f99717bbaf60 Mon Sep 17 00:00:00 2001<br>
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
+index b11e83ac..6f88eb19 100644<br>
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
+ 2026-02-22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 5.4.0: Release tar ball made.=
<br>
+diff --git a/extension/readdir.c b/extension/readdir.c<br>
+index f876e168..5bbee261 100644<br>
+--- a/extension/readdir.c<br>
++++ b/extension/readdir.c<br>
+@@ -118,8 +118,12 @@ ftype(struct dirent *entry, const char *dirname)<br>
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
+2.53.0<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch b/meta=
/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch<br>
new file mode 100644<br>
index 0000000000..84bfdc5418<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch<br>
@@ -0,0 +1,44 @@<br>
+From a98440e83cb19b042958a179293bd637c400a35b Mon Sep 17 00:00:00 2001<br>
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
+index 6f88eb19..9fe216e6 100644<br>
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
+index 5bbee261..3cb31834 100644<br>
+--- a/extension/readdir.c<br>
++++ b/extension/readdir.c<br>
+@@ -121,7 +121,7 @@ ftype(struct dirent *entry, const char *dirname)<br>
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
+2.53.0<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.4.0.bb<br>
index a7c88224dd..f44d82b37c 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb<br>
@@ -31,6 +31,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \<=
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
&nbsp;SRC_URI[sha256sum] =3D &quot;3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93=
f7a688dc268ca428a90b4ac1&quot;<br>
-- <br>
2.35.6<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P189MB1731DCECD84DCAF7D9E5A075F1C12AM9P189MB1731EURP_--

