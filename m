Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0145C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:47:39 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.7013.1720507756881572587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 23:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=S9sxvStx;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: tobias.gassner.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4693ixsU004534
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jul 2024 06:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	S-DKIM-20210427; bh=pWUMBx73rU1D8xAnEKnmU1kltzpAWoxDilU51rmphiE=; b=
	S9sxvStxlIVnVxXNDj4ECMrYTRlA4BpJClW+4mIVG5plE0hBQCgt8BJ+RE4aZQJo
	B8vf7XfhvwRClDbc5UZpOFeOkJ+stXwXVDVp0ch/5tLNsN6Q7QIWpSn2au4+oR2M
	7qNiAU4ZJKpfa1LhonVYdaGDsmvyCSgX5PqqTFhxRLA8OQwgd8t3Mt1UIxWRrsQV
	E2pmdxIVL1sP0GKS4jL6Yp5dhViViyCj3aeufoqajl48MHNGRDF07P+0B+bD/7Th
	+W7uYqwFLLlvLC5rVZ43R0tMob4KijHSLW9oeyUSex/L99io93qi+r3RIOvgueL7
	Cj1PMq4H9RJGjVXjXl/f9A==
Received: from eur03-dba-obe.outbound.protection.outlook.com (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 406wf0chmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 06:49:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMiYxiO9nIxbhTfchkOOEHNIaBoYRyC9rVVcWuee3SCKlJAh+Wu9jwhA+JnrLe9t+gLzMUb5nRMuITTOeUa90slcNBJmc1783RUY3+qIsDOmt+vgG420Ax1X4lO8qgAVSEyUfB996pHWxC0wbdQtn85YWSE53wz53h01dcZ6/X61rJZrTf7U3h3tKS0QXUw5tA2+eSPzLyJpmGyNoKqnYJ+CEz6laur9hC1wVmC331X2kxITgo1RnaOhKtBlqWID/Zj/FgxnaSACf1BPe2/KS5zDN4hEvkXifpRIb3BS8F2rysrmq2Dfc8pHpQOATHACEPjOmo6rocmyWhxWLvaARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWUMBx73rU1D8xAnEKnmU1kltzpAWoxDilU51rmphiE=;
 b=axfe/IL184InSRWSb2D4dEk3c7S30LtJTLoVT676qybxYipIZZYG4oTNsyBNOIUKClXPZT1eey6z9USkQCsC9Nkf97G1VTCgK351R4ZzHqHox3HX/Ln9dvBtcxcDARcf1cOBHk+zcOg4baFQguosgKfi+teAiTOy3XN8cevukabdlyhVnnwHNvLZg2QGRZGyN0PZh9NbvS58zPUXBK+NSi2XxJd2CpcFMEasw421r/NBDYZy/QVmBV+BePa4uSWGH3lpCJ3EnS8JshHur31obkMK/Hcpx1nzhLmF6Z5NAmGTms3m9XH54m/sLfabgDMHbw9jSJC/aWinpEqankLINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:27e::19) by DB8PR01MB6277.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 06:49:11 +0000
Received: from PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 ([fe80::25dd:b483:8f47:4413]) by PA4PR01MB9356.eurprd01.prod.exchangelabs.com
 ([fe80::25dd:b483:8f47:4413%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:49:11 +0000
From: "Gassner, Tobias.ext" <Tobias.Gassner.ext@karlstorz.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs when read-only-rootfs-delayed-postinsts is set
Thread-Topic: [PATCH] execute pkg_postinst_ontarget task for read only rootfs
 when  read-only-rootfs-delayed-postinsts is set
Thread-Index: AQHa0cpowAP1smDZ3UCWfTzmGlY/uw==
Date: Tue, 9 Jul 2024 06:49:11 +0000
Message-ID: 
 <PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2@PA4PR01MB9356.eurprd01.prod.exchangelabs.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR01MB9356:EE_|DB8PR01MB6277:EE_
x-ms-office365-filtering-correlation-id: ca9bd594-dfd8-4e27-b5d2-08dc9fe33d47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?eDEWlCp4597Edymqn2iR4NInFKH0UzYAi7J66hpeZCz+7f02TAXMW90nua?=
 =?iso-8859-1?Q?cJ/0ObIoIxxoOcwychpvaWB9yE6VHz3uJTjglQ6nD3oV/4G8nDk3qTDbuM?=
 =?iso-8859-1?Q?f/9ej7u2CQUWmnaoQmCJxVpK81KOagmMDC4T77rpmrK4Eq3LUA0tuVNgkl?=
 =?iso-8859-1?Q?TtPosAMoZy/fKSiDXcdSvERHmPsBLFbHQuTDwqBH3/7IRewnKJTGcxDwQU?=
 =?iso-8859-1?Q?5Mn7W+dapxc/yQ3NyYOA5RFzL+mEqzz/xCcgIIw/xu80Nx96MF9l6Dw8KC?=
 =?iso-8859-1?Q?JroB/61MW46ZoeSAJrPR79RaQlMkJR3GpmU50mf0Fl4W67hnTZaowxkM4v?=
 =?iso-8859-1?Q?W6LBi7IQuBVgaA5oTE/wm3FhyrpnLET3mWyI2m4O77rU9vVoLFkYzyK+a5?=
 =?iso-8859-1?Q?h/rqGfYFQopJUP5qULOioQ1/uirAtaHKl4R+4VEH9WJsb5hDvN64j8HMm6?=
 =?iso-8859-1?Q?0gkbQfFGscW/0ipvOTbbgDmq04iVOXHsDssnpyzEdINLWeodW0ymnpXqw1?=
 =?iso-8859-1?Q?U5KhslasWDMgkQ5SgyUPwRkGA84v672MsHUUctZESc9cOBwky7PDyY1rID?=
 =?iso-8859-1?Q?ZwlNG+1whOru3WZitrJkX/cIcsSGhPv8JBGpI9ugz+TxdbcPvf5jy2nOkR?=
 =?iso-8859-1?Q?NtL7j7Vh+2FtfBZn1n5XuTI0a1duGjKKe/h4wc0SQ9HNCxi+JoO9cStZ4o?=
 =?iso-8859-1?Q?bEwWV2kZNt/xO9OSyz2lHBvxLBtH9ractyGEQ/chp0U23xY/l9SX5ssfMY?=
 =?iso-8859-1?Q?nk4CUUtpfBlVmDTyymsA36Bpo851dF1TmDl+k3ii55D4us88KWeZ7622Wi?=
 =?iso-8859-1?Q?YtHUlX3YVR1Enu69l/qXSo32GNDwSd4Kh6V1CLI1t4OoaHFLkywGr96YzT?=
 =?iso-8859-1?Q?eTxWxHqI5J4erdfXxQkZlTF2B+EJbYahdZUtcc+k69pO+q71fn8NAWdq7s?=
 =?iso-8859-1?Q?DSO+zqSU7AyVM67eqtWfFdYAWFEmqrtWZatJDknxgyqsLn16ww3/ps/HKi?=
 =?iso-8859-1?Q?HXwlXkXR88gGQP8QY6f5700hrDRfyH5zsDO9pc1pqv+eF8dRPba7jHpke7?=
 =?iso-8859-1?Q?OgrFDD5NUFAiExZ7DGnOTGkxMpIkmOWMjOIS9Ad0SHAY1Fj+iERF1qXCRx?=
 =?iso-8859-1?Q?Cd7m0pBsffi6Qlz3GZe/ViGXXSSGqamvwET3HTmKlzY+N7OtDa8yg9oCY1?=
 =?iso-8859-1?Q?9aqASqcdzLQQZ0jIedv2KQFsnN6YXMcOaSdcNmZtDP/Zc7hn1Ohy579Khe?=
 =?iso-8859-1?Q?C2lU5BM5JkF4noY/OLsUNW577kNP3+941Y7yLfOWyAn0+db/WtR5K42lpN?=
 =?iso-8859-1?Q?OZCpqeVjfpiVipvUeiLKqHCiTiIdfKmClmGS7uoKIIHsDHC1lb7X0f/a9l?=
 =?iso-8859-1?Q?36B5kIcmjcC77O7AhNugvbLSntEMXz+LvchQZs/4OFacHOyx378KM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB9356.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bME7pIwzplghEfDkowh94BR44yMsgLpmgKSKNdKGm2xwEx5KhP1xlfol4B?=
 =?iso-8859-1?Q?UTV24JbZ53o3RSzxmm0r1QRwbIKA2BRPavyUQhmkLzRB+9LQFNlUU/Ljbh?=
 =?iso-8859-1?Q?V7xyZV0i1hEPBfcgK6+x9tK5TJU060VmlEYTNNh+sIofhu7UA4inmpT7bX?=
 =?iso-8859-1?Q?i+1JVDqQkMNxxIPeJgFDdk2gwvA5415u42q6Y53SnxMDA/Fu+CWARGW9Sm?=
 =?iso-8859-1?Q?SU54KGd/R0B1lmxUCsaS8vtFeS1bUvGTXSVJNikMZhC1dm/Tjsu3896xL+?=
 =?iso-8859-1?Q?Hph7Bmf5MzbyPgX+2aF5EZHOWJnpUW+rKdH8coMcBFuO0LuipI4m3k6b11?=
 =?iso-8859-1?Q?g0Wu1akHWleBdKlBC+xn0vBQZ4dLnNY/JZ33imGqKisKptobGDmziwgjKU?=
 =?iso-8859-1?Q?2rhj8NkBooKHgASA6NOYkD1rNHzTeYSPNq2ei04BRqRhZbJ7gu4y61vrQs?=
 =?iso-8859-1?Q?Kz59mTa8b2qSnsZO/+gQ2H957X3438PAc+fhq+TXm/aw6YvjZJwik7RBK1?=
 =?iso-8859-1?Q?9/un066zLtEFrP2V/TjANvqLrqCvmq/OzgcLX1nEyVO1af9WrM1xsTOgLr?=
 =?iso-8859-1?Q?EoyYlUQXif8BX2H8amIUDRI3DhkFsqLfRTSMgpLp40t4V2uKLgbqLPQ+pH?=
 =?iso-8859-1?Q?aha/dfa/vJpuOFQDlF3DFLFd3f2njlX5f66BfmpaRjSwByUY0Q+dfOdWAQ?=
 =?iso-8859-1?Q?UbqS2CxT8gM7kUkAvtetyHN7Klzynv50EY/jUv5mQbpNJ0In4FjDEw+oCG?=
 =?iso-8859-1?Q?JA1i78J/g2vSE/4ueYmm9MjOf4/DwIAlqi1z/ZMQ+z6IGKIGWR5Gbx+9zn?=
 =?iso-8859-1?Q?ha948YycLAqGjCtIQQLektJ/tRuMVqW+CfG3rEcfiZsSi7A8d9fY/boQnM?=
 =?iso-8859-1?Q?kAYFGNoYTsQ6Li1DDLA7aPEkZ/O5CnA9HZct82tBRDZ+iSvwR9MV9qwZrN?=
 =?iso-8859-1?Q?/Tk3i1fWQwn2y3J4G2z85HeA3WYE0ART/K17W6sI/u5wk6Fizp7hXn2NDu?=
 =?iso-8859-1?Q?xiNFYQPhOBvhfBLcWKE5iBQn77V0TDs+OFeV9gl9FStyxdgUihDDmlOK4w?=
 =?iso-8859-1?Q?1xlnNuduKo2REkPrljH9XXi0yKnLs5GvfzeAxiEKvIPyh8MG+v/xiWUq9F?=
 =?iso-8859-1?Q?xOaRC1b5Z+I3d32E+4Nlc5amUAUXKOv6tXHDXySZmYGKxb/kim4qIZe++I?=
 =?iso-8859-1?Q?qjZZhhUSnqoYvn5+o1I7UiQ2FF07OUCAC1Wy7v05vsZ2Ic88z/1WLyM6AL?=
 =?iso-8859-1?Q?AQGg5YapySCjqhd1aIB04xtKNtafzaH1qJ8YoQ+ChD7d9EFuKDt2Fp7KYh?=
 =?iso-8859-1?Q?6c3eekZOHh8cQENXhoGeyMm1Hb7T1KFWGXM7zarUErbn3J5tjd6XYNDb1z?=
 =?iso-8859-1?Q?v3qSN4QqFl/Zxb6UJvMx2HiZOXqaK4RE2VpTCYjWdQ4qstBckurzZevDKL?=
 =?iso-8859-1?Q?kJq2ZRXzxJZyCLGXoek1Sw+A05BFZZgRZMywuS0kUi4NhyLt2ZDXg9fxTK?=
 =?iso-8859-1?Q?bzoNOfPie+BW+RZXu0KdXKDQdX6gRenNMKDf7uBe/g/Cioq5Zji8W3SG35?=
 =?iso-8859-1?Q?iMESvisdXJOkY/3dXjWbVqewdYJ3/xAJjr+jMT8spLESIgwcfbjKxFXwDE?=
 =?iso-8859-1?Q?R1764gFObXQXqSzLA8kmyapWJ9zaTQ2Jos6RSRJynH+DWMq94S0xpMNrYU?=
 =?iso-8859-1?Q?SsL71SrIWH3WgvBL+CsOJZDTtK4IsvRHsQ1YcX6s83/o7ZtPsGo1ZaVmDp?=
 =?iso-8859-1?Q?ps4w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB9356.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9bd594-dfd8-4e27-b5d2-08dc9fe33d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 06:49:11.4096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KM25BCRqAk8sxsaUMOUGG0jnwX0cCT/4bFEhxFmZfc8/g5lVrwO2gyt4ZJYpYbADtfoJBZf3lZmSrff5tm8FP196QDmhzp4AQ+80/BURyifkEkGJxnY7tXk4sjm6GX2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6277
X-Proofpoint-ORIG-GUID: KqP82HnlzM-Ol3GJ_ouLhuJ_AB3t05hL
X-Proofpoint-GUID: KqP82HnlzM-Ol3GJ_ouLhuJ_AB3t05hL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2PA4PR01MB9356eurp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 19:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201739

--_000_PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2PA4PR01MB9356eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

this patch will ensure that pkg_postinst_ontarget task is executed for read=
 only rootfs when read-only-rootfs-delayed-postinsts is set as IMAGE_FEATUR=
ES. In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overlayf=
s.py testing the fix has been implemented.

See https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391 for the =
discussion of this patch; this patch consits of patches 608050984c5be67f506=
a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in that =
discussion.

Greetings
-Tobias


From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001
From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>
Date: Tue, 9 Jul 2024 08:34:30 +0200
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs wh=
en
 read-only-rootfs-delayed-postinsts is set

Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
---
 meta/lib/oe/rootfs.py                     |  4 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..5abce4ad7d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -269,7 +269,11 @@ class Rootfs(object, metaclass=3DABCMeta):
                 self.pm.remove(["run-postinsts"])

         image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-roo=
tfs",
+                                        True, False, self.d) and \
+                      not bb.utils.contains("IMAGE_FEATURES",
+                                        "read-only-rootfs-delayed-postinst=
s",
                                         True, False, self.d)
+
         image_rorfs_force =3D self.d.getVar('FORCE_RO_REMOVE')

         if image_rorfs or image_rorfs_force =3D=3D "1":
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py
index e31063567b..580fbdcb9c 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #

 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine

@@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D " overlayfs-user"
             line =3D getline_qemu(output, "Read-only file system")
             self.assertTrue(line, msg=3Doutput)

+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific current=
ly")
+    def test_postinst_on_target_for_read_only_rootfs(self):
+        """
+        Summary:  The purpose of this test case is to verify that post-ins=
tallation
+                  on target scripts are executed even if using read-only r=
ootfs when
+                  read-only-rootfs-delayed-postinsts is set
+        Expected: The test files are created on first boot
+        """
+
+        import oe.path
+
+        vars =3D get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-m=
inimal")
+        sysconfdir =3D vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        targettestdir =3D os.path.join(sysconfdir, "postinst-test")
+
+        config =3D self.get_working_config()
+
+        args =3D {
+            'OVERLAYFS_INIT_OPTION': "",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
+            'OVERLAYFS_ROOTFS_TYPE': "ext4",
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
+        }
+
+        # read-only-rootfs is already set in get_working_config()
+        config +=3D 'EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs-delayed-p=
ostinsts"\n'
+        config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D "postinst-delayed-b"\n'
+
+        self.write_config(config.format(**args))
+
+        res =3D bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype=3D'wic') as qemu:
+            for filename in ("rootfs", "delayed-a", "delayed-b"):
+                status, output =3D qemu.run_serial("test -f %s && echo fou=
nd" % os.path.join(targettestdir, filename))
+                self.assertIn("found", output, "%s was not present on boot=
" % filename)
+
     def get_working_config(self):
         return """
 # Use systemd as init manager
--
2.45.2



--_000_PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2PA4PR01MB9356eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
this patch will ensure that pkg_postinst_ontarget task is executed for read=
 only rootfs when
<span style=3D"font-family: Consolas, Courier, monospace;">read-only-rootfs=
-delayed-postinsts</span>&nbsp;is set as IMAGE_FEATURES. In addition to the=
 fix, a test in meta/lib/oeqa/selftest/cases/overlayfs.py testing the fix h=
as been implemented.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
See <a href=3D"https://lists.yoctoproject.org/g/poky/topic/106869018#msg133=
91" id=3D"LPlnk" class=3D"OWAAutoLink">
https://lists.yoctoproject.org/g/poky/topic/106869018#msg13391</a>&nbsp;for=
 the discussion of this patch; this patch consits of patches 608050984c5be6=
7f506a0877fadbbe0b61575e54 and da51462765e24b186c55431b53856eebd5f6e8da in =
that discussion.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Greetings</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
-Tobias</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
From ecf1d8c47ecb72c2f27464f01e932091374f4e6c Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
From: &quot;Gassner, Tobias.ext&quot; &lt;tobias.gassner.ext@karlstorz.com&=
gt;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Date: Tue, 9 Jul 2024 08:34:30 +0200</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Subject: [PATCH] execute pkg_postinst_ontarget task for read only rootfs wh=
en</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;read-only-rootfs-delayed-postinsts is set</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Signed-off-by: Gassner, Tobias.ext &lt;tobias.gassner.ext@karlstorz.com&gt;=
</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
---</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;meta/lib/oe/rootfs.py &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; | &nbsp;4 +++</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++=
-</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;2 files changed, 44 insertions(+), 1 deletion(-)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
index 8cd48f9450..5abce4ad7d 100644</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
--- a/meta/lib/oe/rootfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+++ b/meta/lib/oe/rootfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
@@ -269,7 +269,11 @@&nbsp;class Rootfs(object, metaclass=3DABCMeta):</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.pm.remov=
e([&quot;run-postinsts&quot;])</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image_rorfs =3D bb.utils.contains(&quot;I=
MAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;True, Fal=
se, self.d) and \</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;not bb.utils.contains(&quot;IMAGE_FEATURES&quot;,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;rea=
d-only-rootfs-delayed-postinsts&quot;,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;True=
, False, self.d)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image_rorfs_force =3D self.d.getVar('FORC=
E_RO_REMOVE')</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if image_rorfs or image_rorfs_force =3D=
=3D &quot;1&quot;:</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
index e31063567b..580fbdcb9c 100644</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
@@ -5,7 +5,7 @@</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;#</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;from oeqa.selftest.case import OESelftestTestCase</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
-from oeqa.utils.commands import bitbake, runqemu</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;from oeqa.core.decorator import OETestTag</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;from oeqa.core.decorator.data import skipIfNotMachine</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
@@ -466,6 +466,45 @@ IMAGE_INSTALL:append =3D &quot; overlayfs-user&quot;</=
div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;line =3D getline_qemu(outpu=
t, &quot;Read-only file system&quot;)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(line, msg=
=3Doutput)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp;@skipIfNotMachine(&quot;qemux86-64&quot;, &quot;tests are qe=
mux86-64 specific currently&quot;)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp;def test_postinst_on_target_for_read_only_rootfs(self):</div=
>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;Summary: &nbsp;The purpose of this test case i=
s to verify that post-installation</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;on target s=
cripts are executed even if using read-only rootfs when</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read-only-r=
ootfs-delayed-postinsts is set</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;Expected: The test files are created on first =
boot</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;import oe.path</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;vars =3D get_bb_vars((&quot;IMAGE_ROOTFS&quot;=
, &quot;sysconfdir&quot;), &quot;core-image-minimal&quot;)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;sysconfdir =3D vars[&quot;sysconfdir&quot;]</d=
iv>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;self.assertIsNotNone(sysconfdir)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;# Need to use oe.path here as sysconfdir start=
s with /</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;targettestdir =3D os.path.join(sysconfdir, &qu=
ot;postinst-test&quot;)</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config =3D self.get_working_config()</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;args =3D {</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_INIT_OPTION': &quot;&=
quot;,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ETC_USE_ORIG_INIT_NAM=
E': 1,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ROOTFS_TYPE': &quot;e=
xt4&quot;,</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'OVERLAYFS_ETC_CREATE_MOUNT_DIRS=
': 1</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;# read-only-rootfs is already set in get_worki=
ng_config()</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config +=3D 'EXTRA_IMAGE_FEATURES +=3D &quot;r=
ead-only-rootfs-delayed-postinsts&quot;\n'</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;config +=3D 'CORE_IMAGE_EXTRA_INSTALL =3D &quo=
t;postinst-delayed-b&quot;\n'</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;self.write_config(config.format(**args))</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;res =3D bitbake('core-image-minimal')</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp;with runqemu('core-image-minimal', image_fstyp=
e=3D'wic') as qemu:</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for filename in (&quot;rootfs&qu=
ot;, &quot;delayed-a&quot;, &quot;delayed-b&quot;):</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;status, output =3D=
 qemu.run_serial(&quot;test -f %s &amp;&amp; echo found&quot; % os.path.joi=
n(targettestdir, filename))</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertIn(&quo=
t;found&quot;, output, &quot;%s was not present on boot&quot; % filename)</=
div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
+</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;def get_working_config(self):</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return &quot;&quot;&quot;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;# Use systemd as init manager</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
--&nbsp;</div>
<div style=3D"font-family: Consolas, Courier, monospace; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
2.45.2</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PA4PR01MB93565CBE2F447A255D0E0D7FD5DB2PA4PR01MB9356eurp_--

