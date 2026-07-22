Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053F4C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:35:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47150.1784723743229226844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=HNuC5csa;
 spf=pass (domain: est.tech, ip: 52.101.69.41, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU51RYbKsVYKvCk5x8afKh7ObmsdyIbDk3qalqxJ/aXIEbpZkR7J8RXx3MIpv0A+4ZqFD5NXHEkVgmA6p13Fm1K1RyFZEqcOUckrWj7PZpU3ulxtUa3bq7UkpU0WRIpQ/p4G78gNUhF7zJA0MSuLFA7xoNo32VKk95RJe01NB0gKxzKF2gKaUYqzThFTZ1bktAwwxrKbsTTRQPesPjouAd5q7MsVx4XdAPe8RFc27+zheIHuoqm1s+YlqniipHgYNEWwctDYNRcOH+LLU05En89sutSWRBo4PXXv9dtWxsHcUrCTNZdPFpO+GJ2AXkNfYaQ996DRJ1xX7Dm/wNKnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oUFU5M3shh2fFW8cYdv0DPPU9roU1/jKpJVgNdQhDQ=;
 b=Fzdwvk7OwdQFhzkD/tIlnhH2wiI90+MduJaAImISwWCbkRYstm1BO69GkGcTqz0djyeKKQYo5d938SS12e+yWV1okQxOgj1icyH6exeffrxRwQdLmPsOfOWUcYLjiqCirp6x1eM2rckHZyZoaytf5FYQ1TA1UgursopBwRm9wlf5r0d7VLlLKaoBuikxzVEJcOWiEZyLt16Lrc5SX3dfRNjhQDC90pySjv6iBkDAXw7FuerCEw8c6qVDBpPWUIWT4OLwEJ7BnzLcGTgTk0ObA3hvDteg2uKhAAFveeFRcBQ5c4wmvdoKEGVg5beMORmoIB3rCk5kKQOfQxbePtXpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oUFU5M3shh2fFW8cYdv0DPPU9roU1/jKpJVgNdQhDQ=;
 b=HNuC5csa+zImxHrS6Mnp/W5kpIGaKhzCKCifmNd0zGWjJ0O4F2efO5JpgykjlSNIwUDmsGKSuAEMWWfVZ/E1oCoBKTon+7n2m95Jmm5las0gyfYfg3/lN5oFwFpnCdWG6YamPo9CGhOHpj/dz/fVtL3rM28Lmp6Pz8PhmIyDXeFmO8sfGuoxTzii15A6Pc6twBhLk+uwRqAZoytR2tLDU6idGI6RzcOhHJuIMixVzsbyPCQAGgQk1YxrJuw9pwMdDMzZ+7Iy9u8zXMikNvbWZhuNqjEm2o8o88oalG5vhhmHNAXocMhj+2E1sGOTOv0HQwH0MMtSlnwnIW2tQxnVmQ==
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:35:36 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0270.004; Wed, 22 Jul 2026
 12:35:36 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dkelaiya@cisco.com"
	<dkelaiya@cisco.com>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 2/4] gawk: Fix CVE-2026-40468
Thread-Topic: [OE-core][scarthgap][PATCH 2/4] gawk: Fix CVE-2026-40468
Thread-Index: AQHdGcBt7UB5NTMRnEaybrDV4lG99LZ5ePm9
Date: Wed, 22 Jul 2026 12:35:36 +0000
Message-ID: 
 <AM9P189MB17312B601362EA1B4DF10F37F1C12@AM9P189MB1731.EURP189.PROD.OUTLOOK.COM>
References: <20260722095627.1424705-1-dkelaiya@cisco.com>
 <20260722095627.1424705-2-dkelaiya@cisco.com>
In-Reply-To: <20260722095627.1424705-2-dkelaiya@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1731:EE_|GV4P189MB3535:EE_
x-ms-office365-filtering-correlation-id: 23fd8fee-f71c-4fe6-4722-08dee7edbae3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|376014|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|8096899003|18002099003|22082099003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 PZJN+HMcA4IR0rpQcNnRHQUtGFkh8JY80DInwvfEBw4SY0emOvKF4B5OVrZV1IbiJK5iYjkYlfjG/p3fXL6fzQ62yfmcYYND1iAqqBSMdUxWbQEor62OQeiXooZCBCrYQuCGVHQw8lL8IERGqFl+WdjgHjBIacr57m9SohiTidFKBZS+exbo+ZVpHpBV7S4OxGC3VvRgbukS8dt9ytC9dqdOGIKdFIOIBH9DOtYadrXeA8DakX7rsG25gEOnva8ukpfChyehnmz04o+A7KAO0K8jVKT+vOzMUlGuaTVd8q0hjAHEdInWAJVO3ZfTrL0XB1tfgcCrbNBOZ1vTAqwFge7oo/sfzvIdIZPSpv1ugfQGkbyR7sFQeRmbEVYpf04Wm9InyR8jFhSTZ/TP89etmGpwlUGlrHJORDAgYcXd8au6FWsF23PDgbMt8orJPwSVDZcfisvGIHtTmhVjmNmyQM3vd6iKkKSjiaiWkF6MMBD8MyZr4iAb1EeiFrXFzZ9O+S17NuoFkjwuUss5pGjMiuh5tSpYZDlLJNT+j6fcrY+cru3la3Jysdumi6uDV0jWWrnZag/8dmKdAP5qG8tHQgcNhjg1K+S8QYsOEiVVG2LOjcN1NFLn/i8qPhXiTYuEoHh/066Sz9htHp4IDGrncFz1fQ8xLD4WDqaEVwHnt+8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(8096899003)(18002099003)(22082099003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?m9OFHUQ4nD2HRhl+7ReyhYYGLrIxvqvTKTO6uvM75FH+FgJen4WIXkgxE3?=
 =?iso-8859-2?Q?dnLeC3t5qQXEQVUoIS+TZY5DfTK25bN6y5D1gKMOJDl+XX/T1rL2Dw09Fi?=
 =?iso-8859-2?Q?Lfkc8J5c/gN9Qu4xnm0DAcgkfCAHUeoioCKqtCiNyhdUti5NwspnjqMLjs?=
 =?iso-8859-2?Q?gGX45J+fecZYHmXKz23NPOcPVW24a5gL+bPJ4Q0jZsxNKArwjPJ64Ngsz3?=
 =?iso-8859-2?Q?RqeYae0N/TrmYsgGS8UPDTBf5JdMwnkouUEfAj1+q8sAbU552CqfD76vlN?=
 =?iso-8859-2?Q?hfP/OEoldoEeroMwQqp3unJSMiapRBhYR4hYgzamAy6JJSULtxe42t8Dgm?=
 =?iso-8859-2?Q?1DH8NIiCOcys0QcFUqdDV9h7Nvf84CpJ83XSLG5HwKI05RnEje1dT/1oMm?=
 =?iso-8859-2?Q?dpmH/m4LE8YgXcyVeEKrspuZFJ3frJDkaqoEE1/w1UAnSvMzeRaZqX0iGi?=
 =?iso-8859-2?Q?cm2ZZBWsmnmm3Ol6umOzkVLO3ER5zOUFxgPCHl5DAoV1M0Fyi4Xw949p8I?=
 =?iso-8859-2?Q?u43o7TqG0mwOyp8/VMxxGBf0rAX1p+3pHMOxZVpf5xNSeEOyzv9tuFMdwV?=
 =?iso-8859-2?Q?unX+7Cg/0ja0HStDzbypmiPUZWaKO33OjQ484+Wi8psJQyVv+sAiV+6X8d?=
 =?iso-8859-2?Q?++bzDF1RqMNexu4yZ+tQLhPxG14G8DFKM0dnPnjl8AiFuLlmjoLt2IJV0y?=
 =?iso-8859-2?Q?SoplzE3HpSOvlJ5dc7iLlAUbK8/Ha9QQTfEO0vqE3ebnyjrARVs0dNEgT0?=
 =?iso-8859-2?Q?qcJbpwbUFe2XZkQ+c5gEDsdoyblBfwsXr9c+a982B7/tGq10AmYSg+gKN1?=
 =?iso-8859-2?Q?wr5vY047eDEnrjRloswyWzYFz/P7MBiOwqAy/FxoNcZFfuR8ddteOqnOQg?=
 =?iso-8859-2?Q?iMSEzs4om5YEziuJtPaPck+zMwFcDalO2Rxw4gF6ImpeeFzpdMZ5LNbBUL?=
 =?iso-8859-2?Q?bYLHSIbJLHwclyMqCLUVQUUaF/4hiVAG+zs3yIV6tuZ9eMAo560ON6mcMi?=
 =?iso-8859-2?Q?lT5aiRjpddb5SQcW+0OXS60fAC0nBEnDMEq64U/rz3nn22qO8vFBaGcwZH?=
 =?iso-8859-2?Q?oEWEGUvuKl41N87wxYq8xEKfnCxtc6LSgT+M4GZgmxI6Rly+4NyERn3Mub?=
 =?iso-8859-2?Q?F1J49/p5I0WP92RqVqHPG1e5lMjpuGCkF7B6GFQjMjQcp+Q7fQ8YRtV9Q0?=
 =?iso-8859-2?Q?FSNHmtPRRmWc/7AVvKEgH2zjx18g/uQP0QqevdmofXxj9opz+GyDwjKBtE?=
 =?iso-8859-2?Q?xCvpnFTB9lsbX0vA2yCqvtDJSlIRnjI4Xr8J3W4uhe6DV/N3MXKQsHDHv6?=
 =?iso-8859-2?Q?GKi0bLkpZ1b8MaQSfsaOu1cJhVkdy++HuvvEB5LEjLIXa1m2LsHYW/Pqnh?=
 =?iso-8859-2?Q?6h012tqlv4/GRs45/1nGd3qMnf5zzyqwdHg9ufTcKV7kuxpDrpeCJMVo8d?=
 =?iso-8859-2?Q?prrtgeYYAj3CGeOOEv/S26PF/e7UPEUOqtQWTr1q3BcUWs+AVkcNPcI+uK?=
 =?iso-8859-2?Q?coqS9hLRMv0sQEDQ7bCqVAF+X79URfVxQrQUTAO04q1HuUMiR2gxAJagq9?=
 =?iso-8859-2?Q?aGbTeztymGXxt63a7Ykg5T/SE58G4p+J//nQapNb0UutFTonL/XP+c1qik?=
 =?iso-8859-2?Q?IDrlS6ZrV3We00rpa0/CGhPmY5/MEWanwRq/sYKqd8e0LHYu2q/atD+nDQ?=
 =?iso-8859-2?Q?MpxdIP5x2MXfRDGO6Hjzu3yikbIasGfSb7Oe0k/7D8jFE+l1Rsc+HfPice?=
 =?iso-8859-2?Q?12wZa62FJgszCz1wVlBdgfukVBYwU4xzrf73BcAPyA+E7jdyJQNXJtBWVW?=
 =?iso-8859-2?Q?BsIy1zpFQMfpkzQaCoEcP9RezlYyrrBE07p/f6qveA65TFqaocG2Ed80Tz?=
 =?iso-8859-2?Q?IE?=
x-ms-exchange-antispam-messagedata-1: EU0TGNuLDds1hg==
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB17312B601362EA1B4DF10F37F1C12AM9P189MB1731EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fd8fee-f71c-4fe6-4722-08dee7edbae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 12:35:36.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHabxfn6WOQekNUVp8m9l40a8mRBidzwmfDxnZRZ3LmJZvR3iYprVG456U4Rt/KIborV+fiv4hgHGfFWBjEkebqXMc8jfk26hnc44r2dxP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241679

--_000_AM9P189MB17312B601362EA1B4DF10F37F1C12AM9P189MB1731EURP_
Content-Type: text/plain; charset="iso-8859-2"
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
Subject: [OE-core][scarthgap][PATCH 2/4] gawk: Fix CVE-2026-40468

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581=
b991362c046f7f2e238ffa34e6f8c7
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-40468

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../gawk/gawk/CVE-2026-40468.patch            | 65 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40468.patch
new file mode 100644
index 0000000000..607f641615
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
@@ -0,0 +1,65 @@
+From e281dfa04afc4660419ad69c9f24bc6b4067f8d8 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Sat, 4 Apr 2026 21:45:58 +0300
+Subject: [PATCH] Minor integer overflow fixes.
+
+CVE: CVE-2026-40468
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git=
/commit/?id=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7]
+
+Backport Changes:
+- Adapt the parse_escape() type change for gawk 5.3.0, where i is
+  declared int instead of long.
+
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ ChangeLog | 8 ++++++++
+ builtin.c | 2 +-
+ node.c    | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 6bc88ebb..e691b241 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2026-04-04         Arnold D. Robbins     <arnold@skeeve.com>
++
++      * builtin.c (do_sub): Make `sofar' be size_t to avoid
++      integer overflows.  Thanks to Micha=B3 Majchrowicz
++      <mmajchrowicz@afine.com> for the report.
++      * node.c (parse_escape): Change `i' to int64_t to avoid
++      overflows. Thanks to ASan with gcc -m32.
++
+ 2026-04-03         Arnold D. Robbins     <arnold@skeeve.com>
+
+        * io.c (do_getline_redir): Don't DEREF redir_exp too early.
+diff --git a/builtin.c b/builtin.c
+index ba3459db..80ab6069 100644
+--- a/builtin.c
++++ b/builtin.c
+@@ -2985,7 +2985,7 @@ do_sub(int nargs, unsigned int flags)
+        char *repl;
+        char *replend;
+        size_t repllen;
+-      int sofar;
++      size_t sofar;
+        int ampersands;
+        int matches =3D 0;
+        Regexp *rp;
+diff --git a/node.c b/node.c
+index f08a57d7..12a8fab4 100644
+--- a/node.c
++++ b/node.c
+@@ -571,7 +571,7 @@ parse_escape(const char **string_ptr, const char **res=
ult, size_t *nbytes)
+        static char buf[MB_LEN_MAX];
+        enum escape_results retval =3D ESCAPE_OK;
+        int c =3D *(*string_ptr)++;
+-      int i;
++      int64_t i;
+        int count;
+        int j;
+        const char *start;
+--
+2.44.4
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb
index 56d7d7f76a..d79b0222a6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://0001-Fix-some-C23-compilatio-issues.patch \
            file://CVE-2026-40467.patch \
+           file://CVE-2026-40468.patch \
            "

 SRC_URI[sha256sum] =3D "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb5=
5e440d30273336"
--
2.35.6


--_000_AM9P189MB17312B601362EA1B4DF10F37F1C12AM9P189MB1731EURP_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
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
<b>Subject:</b> [OE-core][scarthgap][PATCH 2/4] gawk: Fix CVE-2026-40468</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
<br>
This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].<br>
<br>
[1] <a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7">
https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581b991=
362c046f7f2e238ffa34e6f8c7</a><br>
[2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-40468">https://nvd=
.nist.gov/vuln/detail/CVE-2026-40468</a><br>
<br>
Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
---<br>
&nbsp;.../gawk/gawk/CVE-2026-40468.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 65 +++++++++++++++++++<br>
&nbsp;meta/recipes-extended/gawk/gawk_5.3.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&nbsp;2 files changed, 66 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.pat=
ch<br>
<br>
diff --git a/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch b/meta/re=
cipes-extended/gawk/gawk/CVE-2026-40468.patch<br>
new file mode 100644<br>
index 0000000000..607f641615<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch<br>
@@ -0,0 +1,65 @@<br>
+From e281dfa04afc4660419ad69c9f24bc6b4067f8d8 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Arnold D. Robbins&quot; &lt;arnold@skeeve.com&gt;<br>
+Date: Sat, 4 Apr 2026 21:45:58 +0300<br>
+Subject: [PATCH] Minor integer overflow fixes.<br>
+<br>
+CVE: CVE-2026-40468<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.git.savannah.gnu.org/cg=
it/gawk.git/commit/?id=3D062f2f2581b991362c046f7f2e238ffa34e6f8c7">https://=
cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3D062f2f2581b991362c046f=
7f2e238ffa34e6f8c7</a>]<br>
+<br>
+Backport Changes:<br>
+- Adapt the parse_escape() type change for gawk 5.3.0, where i is<br>
+&nbsp; declared int instead of long.<br>
+<br>
+(cherry picked from commit 062f2f2581b991362c046f7f2e238ffa34e6f8c7)<br>
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br>
+---<br>
+ ChangeLog | 8 ++++++++<br>
+ builtin.c | 2 +-<br>
+ node.c&nbsp;&nbsp;&nbsp; | 2 +-<br>
+ 3 files changed, 10 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 6bc88ebb..e691b241 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,11 @@<br>
++2026-04-04&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * builtin.c (do_sub): Make `sofar' be size=
_t to avoid<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; integer overflows.&nbsp; Thanks to Micha=
=B3 Majchrowicz<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;mmajchrowicz@afine.com&gt; for the rep=
ort.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * node.c (parse_escape): Change `i' to int=
64_t to avoid<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; overflows. Thanks to ASan with gcc -m32.<b=
r>
++<br>
+ 2026-04-03&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arnold D. Robb=
ins&nbsp;&nbsp;&nbsp;&nbsp; &lt;arnold@skeeve.com&gt;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * io.c (do_getline_redir): Don'=
t DEREF redir_exp too early.<br>
+diff --git a/builtin.c b/builtin.c<br>
+index ba3459db..80ab6069 100644<br>
+--- a/builtin.c<br>
++++ b/builtin.c<br>
+@@ -2985,7 +2985,7 @@ do_sub(int nargs, unsigned int flags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *repl;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *replend;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t repllen;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int sofar;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t sofar;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ampersands;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int matches =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regexp *rp;<br>
+diff --git a/node.c b/node.c<br>
+index f08a57d7..12a8fab4 100644<br>
+--- a/node.c<br>
++++ b/node.c<br>
+@@ -571,7 +571,7 @@ parse_escape(const char **string_ptr, const char **res=
ult, size_t *nbytes)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static char buf[MB_LEN_MAX];<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum escape_results retval =3D =
ESCAPE_OK;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int c =3D *(*string_ptr)++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int64_t i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int j;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *start;<br>
+-- <br>
+2.44.4<br>
+<br>
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extend=
ed/gawk/gawk_5.3.0.bb<br>
index 56d7d7f76a..d79b0222a6 100644<br>
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb<br>
@@ -23,6 +23,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-some-C23-compilatio-issues.patch">file://0001-Fix-some-=
C23-compilatio-issues.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-40467.patch">file://CVE-2026-40467.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-40468.patch">file://CVE-2026-40468.patch</a> \<br>
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

--_000_AM9P189MB17312B601362EA1B4DF10F37F1C12AM9P189MB1731EURP_--

