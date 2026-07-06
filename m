Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96069C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 18:06:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.136])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156388.1783361175740779068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 11:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=kjtbSrTT;
 spf=pass (domain: navimatix.de, ip: 52.101.69.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHElzj9McPiBVimkzTNj41ZIBkci0ft2NFY/aOSDs6ZAhD2g8gKx7tP9HyBZXQA7BvWMD3xFyiG4U0EIqHwjLwAg6lhViKt9GyTOueJ4UzMS/LHFqou8cess1/uogwNM+L7kHIHgEhf1JsyovZNpSNf8OtOSbf+3HNne4yqwhaKTy9FbNHeS/Tw0kg46E653Jzu69z4sO1vaRTA/XVOduZuGmTodluXTPFiq6oM2LyP2QE/uN/8nWiWyPt8RyPi2HR6t9RzpUEEwKfwTpB+RrTw9bU6XRIkCzZOONKxYxWkk26o7pTDQzaexivGntiHGFMUVogWt9VJu87kS75fk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzQNpl6tibO7imiCn46/2vlm6R0gXI1dq1GqrSuoQxY=;
 b=gKpb2nXVCgxj+LXWWBoqeSy33VKS54FbrMVgHX0G49KYD7sJQWJhSwwCvfmw0IaoiPa0qe3guDYuPzBthVcdrBbNpA59xfEx5qAaSgPX7P5k9DN5pVsnQ1N94IuqAO6S+fYlPgb1munn2Kwdc8Tljf4V8DGAZDhGUrEsype3lL+0xsY2sjPJuLfMt7lU9+JxGxlGheGl7omFk4v2QW0ECZ9Zi4TcbZFQtWZlEk/kF/hjecE0PbEnt6QYYzFoeOWW8eGwEid+CrqqD2KQRYIWCjR9CLWzHInLoC7eqyHVVM81qdP08oHsErNeKPWFV8DUI9YQcm1wc862eY3KIix/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzQNpl6tibO7imiCn46/2vlm6R0gXI1dq1GqrSuoQxY=;
 b=kjtbSrTTzZ7vDd/15wuLArmHOvgtfd8WesJea/240DBW4D5ttFPqwHL38xNdqey7WV0cXIdSA8xxhrjt/VAwBYGtO8lhUkSa07gOfCiZf0kN0vSZcUpCpbtiiFL+ltq8m0Jaa7sRp0I8vvPytzrgvi2KknnUS8ATAhveXfxIKjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB9338.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2be::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 18:06:11 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Mon, 6 Jul 2026 18:06:10 +0000
Date: Mon, 6 Jul 2026 20:06:08 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [RFC PATCH] systemd: Remove handling of fallback resolv.conf without
 resolved
Message-ID: <a19a769788f8b2110238f8be3d7ddc181bf2ce58.1783361167.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c301614-b462-4ecc-3430-08dedb894259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|6133799003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 
	J+DawSF25mOm4jaoJ13SxZmWTsjmc2L6isZrZX7xtyknCmQdUL3JpqF38LxsSZxbg/njFNK8p5Y4DIEn9hmuHoatjqjOvLdtdwk7PFqPYmaOTFgTuGokjUa4DMVJyE3Um0E+gtywyxFVF0GaW+mA3p6mv9V6KG40Kf2fcULEITEorrbMiby4cFbSDk+9vkSMCMdWMZTyZn1bbZ9V/0/785xScdKDJOTNjjwAxctcdr4i42CIL8Tc0omBk5u8qv/ZJwX+K92L5WDuaY4vbjzb4rY37qI3UV/OSxOtdFvZ4UV404o2LAe94Ii09ooqT8EY30IvRAn3RQ+pASG5j77egpGgo/SIVJc1fvac+KvregRyO8YNZC6onBGxHQgj5fJ8XF3+lsKvadwnllZAXP8l5s467dgz9+s6GbgUeVpUfNpG/WTEQs1Rwv1hkm0rYhNiLT04dH/E8FBtMoHM1ppSnb+ZLVEGF7Jl3TuZnie7w98YmFotKnz9qBLD5iM9/mejdEr1+O8+4QyC7+4NwCpPNZ3Nqz8pSVJXpPXoT6XYZhIKZbMZkQu00f+cGVWrS67n+2KvfnR6kZ/1f7BYmP12EOlvq7MVyNC4Q5yWCEV6wWglKf7qgtbseywrnt786iB7bUtLwNQ8iWeDPDKHASLk0LnW5x0S0JwOJ0LjGcgvuv0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(6133799003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iouwYdzVGsk3AwcNATjv8O5sXnDnSts1Zmb1lWvBkvTQPzwb37qC7BZ/3wYr?=
 =?us-ascii?Q?VLNfkpDATjIlUsLMvdwapSZVF3C374ZJxgOLzKpkHg8uqudqb1uu52jw4siY?=
 =?us-ascii?Q?vVGkQQM7d4ipIBYm7IR1ZSMxgkL3WfFx6Q1YcBioBcmZgHVojHnRiPof+oIn?=
 =?us-ascii?Q?iFTAToVlW+nD/tDW36RYwj5bWyRazsy388+ocl2azqiwDlHSwazu5gprF58g?=
 =?us-ascii?Q?CxdfmPemRSU98aoP2Un7YXTrAtujOrEC3VMHTm3Lle0MxvjpFXK8UgFxiexl?=
 =?us-ascii?Q?J45YE7VZzl2L9SDs2+V2ijZJy0GxPj9qNq3l97RjmOlzaPwktwy8QjRbwOBF?=
 =?us-ascii?Q?eqsc1y/esisMcsFrq6TLHNCo5GUyOqt/CaYKNohsMgXCkJv34mz2x6RkMNEU?=
 =?us-ascii?Q?KWh11mhsdFGQGULyvKUqRRXE+cevCCAaz+xDG8zKMO2rtxB7hadEzbw4IILp?=
 =?us-ascii?Q?biX26gjYGvUCM2ZJuwOT/s08NQxkSyrtHquUpw6ryS7YZqJH97Kh/dxtn127?=
 =?us-ascii?Q?D3I4P0YVj3rb29QCM4IAMrpDT2imu5cUUEKLD71a/KTsSRP9POKuFoIeldXA?=
 =?us-ascii?Q?KcBcdDVuLxooa2p9IEqd6kiMfDYQQptkAvY/OYdDutzzKhpITipLicuFCpgy?=
 =?us-ascii?Q?XQ7LeIVL3DZjNUplWTIXvSFuoinO7WMEAn6c0AmOO16smYuATgceK3zWwCVN?=
 =?us-ascii?Q?5uCKrBFPjmrEzuVfu1wP79cpl6ze510Hy64e/f6tg0zYdm5omPefOR21yLgk?=
 =?us-ascii?Q?O2se+NdHbyPQpbJL9dpU6Qqau1SfrMpIlXgN2EmK8q6pCouNujQ9hcbHdZJS?=
 =?us-ascii?Q?ctzEJuUyRB5FZ3R6d1FbBaRa2rT26N5nVAOhqYXBMUKpn34WCmkz+iOcagxG?=
 =?us-ascii?Q?tCjp6QN/2lgwT9SLoldqU5hjMUNUarTjBH7WjI8rb4jG87DMYvCzq+riSVzl?=
 =?us-ascii?Q?OgSsrYFYowhk7K4Pt3C/h1USL1x4+DzLJ9Fjxuw9VQckwgkPHqzadfErQEoo?=
 =?us-ascii?Q?ABsxCpR7jh3aAwvoRZcO3sateFBnWNxhLTmPEjvhoEnKy0DNeKmZqsAkFGOt?=
 =?us-ascii?Q?ql9G4PfiJ5KZgSzbmFLT7TIdFg7FcPggrETJzpiHmDwGiDs2Zmyj0vDc9ULS?=
 =?us-ascii?Q?aYhH3L5QeGeelQCdT2LSiTvzZM4hu5zwkaIIOw5VoAR2DP1G20OyQPY50xxl?=
 =?us-ascii?Q?n8nejwxuMHRH0l12eyPF6vMWJg+RwbImch6e9m+MRB/EJ34NhVnon+jgbwdy?=
 =?us-ascii?Q?qiWvse6aqHYcZtT1O7DqOJrW/Pt/OhHrXz9yyIxtubAY7Np+reHQPwUFzVUp?=
 =?us-ascii?Q?1Ij1Mxlsyq0BuO3W7fiZf1M1KRr4krnIO7DaZxryWTf47cv3ipIYr/GlKT9y?=
 =?us-ascii?Q?bvNqyiENfpB9GlsMr0omhUlBHVZ9H8NyRgUpy4r/TP9xzj14fCYz5waQPD2N?=
 =?us-ascii?Q?CnOk8SbHZzbOma+3eZg3SO5Y+f3eM9GRpBj8kCHiQURhNtm4hPDHOfsc7cmS?=
 =?us-ascii?Q?TYq7UsYQ+DQiOLTUUzJYdPsjRdXuxpkoM1VuhxcEn+A/bgHJZ8MucnXyMujo?=
 =?us-ascii?Q?kBnACSYsW7YB3K12YhrqDci86W6l/1GFA/5v9Jwfgyo/1gb48ohkrhNQOeOG?=
 =?us-ascii?Q?8jxPhTW1Gjk1wjf/CzGElABW4v3uAsxQCdHaOgpMtoy8CPljN00YQbGluL2f?=
 =?us-ascii?Q?WEyQAqaGb/KZ788iROSQ/7PV4TuPIFkCYwTLcInUQnyMv+v/YVYmksO090wv?=
 =?us-ascii?Q?3TfvSVyspyiqW833gzKxMq2/5/mmd3Y=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c301614-b462-4ecc-3430-08dedb894259
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 18:06:10.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvGpvCijIpAiDc0teNjL+GjMudks7HD5CAiLKoEYDLWDB0hl/tpLNRUkITNvppTlrgj8ZJf6AF9AoO4Rj3xigPgXtMn43aQPUXYRAB/Bpdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 18:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240337

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The origin of this code is =E2=80=9Csystemd: arrange for volatile
/etc/resolv.conf=E2=80=9D=C2=A0[1] to provide a symlink to /run for resolv.=
conf to allow
updates on read-only rootfs, because sysvinit did so, too. But this
conflicted with packages like connman [YOCTO #11331], [YOCTO #6700] they
also provide a resolv.conf and resulted in an update-alternative handling
for resolv.conf; =E2=80=9Csystemd: enable resolved and networkd=E2=80=9D=C2=
=A0[2]. Later, the
installation of the alternatives was made depending on resolved; =E2=80=9Cs=
ystemd:
Expose resolv-conf alternative only when resolved is built=E2=80=9D=C2=A0[3=
].

So, now, when you install systemd without resolved on a read-only rootfs,
you get /etc/resolv-conf.systemd which is unused, because no
update-alternatives run, no resolv.conf, and a warning from tmpfiles that
resolv.conf cannot be created:

    systemd-tmpfiles[114]: symlink(../run/systemd/resolve/resolv.conf, /etc=
/resolv.conf) failed: Read-only file system

Hence, do nothing with resolv.conf if resolved is not installed. A sane
fallback for resolv.conf with ro rootfs support should be provided by
base-files.

[1] 7f087f161e8942bcd35f88999dfca418f01cd7fa
[2] d9b6d538e3d81ab0d5e7b7b6adecef555d782217
[3] 91efc50723229672b6e8187b69b183cba525f199

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 447974373f..1f988e8177 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -324,12 +324,7 @@ do_install() {
 	   ! ${@bb.utils.contains('PACKAGECONFIG', 'networkd', 'true', 'false', d=
)}; then
 		echo 'd /run/systemd/netif/links 0755 root root -' >>${D}${exec_prefix}/=
lib/tmpfiles.d/systemd.conf
 	fi
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d=
)}; then
-		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv=
.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/=
tmpfiles.d/systemd.conf
-		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_pr=
efix}/lib/tmpfiles.d/systemd.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.s=
ystemd
-	else
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}=
; then
 		rc=3D"../run/systemd/resolve/${@bb.utils.contains('RESOLV_CONF', 'stub-r=
esolv', 'stub-', '', d)}resolv.conf"
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - $rc%" $=
{D}${exec_prefix}/lib/tmpfiles.d/systemd-resolve.conf
 		ln -s $rc ${D}${sysconfdir}/resolv-conf.systemd
--=20
2.53.0


