Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B951BC41535
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:00:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web10.10162.1699959629235343840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=3Zsm1/Lv;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.76, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9fBbo5fNVeZ3rI3UuL21QLJpFFen4xLGWb/OhXeNR05YW0v2afBnUxnXh4b9x5NvGCtt6vwKfFuZhFiIsT/66Iz8zLMuKGUKQqM3tTfvaDWK0TazhqQVLXVX6KyUKmj+VSib3K6Dp2XnHwiVWMKCJX8Lw07kmohDkZsaoL2BXB48SXLMZPmIdjqjBjKpA7gGSHYyCOMmyxDS/P/1NEKZv+p3J3UZ2fS7PnNJLC80OAdMYrp+5qIdlTwnij9ezIXaZA8nz8PvvNYVScwISLPmWHBWDZuZOrqiuWbyhv+SvyyV/OX8A6nqc/FvO/XF4ypbgQTLYZBr4H+K4CajP9UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0G07IbTsDyIuxof+tKyAC0YX9WXFELENInqJ0sgIgM=;
 b=J1x4XFSZoFVhxBD77ckU8asPjQUKWd9qTYmXZqIIRFUS82kyDXVkPs25K6XNAvrNgzVr/abPgC8Fu8jHAl7H+fRYAUBk/oh4ubX2axSExeyETGlVikWgwO39K2hpRPz+9Re4oNMSScCqXuhZ/kqlNa51oYTM7loATidqKpLSkdiRr2P7NQBOT73ep1bJPBKQemAlbnXfHdceW1IcSEUCS+99Cr5zDQWnEENwMITgI/G5bauY3Bqrl2dAAKAe6VfmA6JUnAAGufLng+E/g4dh7DKA6DcWnbqKw5/XLE+BvyzM/jz5QaGioLdTSGuAdO0aPkLU3c1kW5yOLxu7njidKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0G07IbTsDyIuxof+tKyAC0YX9WXFELENInqJ0sgIgM=;
 b=3Zsm1/Lv8CMfWrCygNpsuGHPQOniRQatYHiuLr7ASH0Ha/V/RIQyBxewMmONpI4fdRlDM9pUrNQ2CouYRWeTUFnRUxxjDKslGEP2lQZlRzN6jh8RdZaypEEpXQTvYi2SeUOoQhuMhf7Y+So7rCrGT9XQApEgMPnRfn6nywi5Wx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:00:26 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 11:00:26 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Malte Schmidt <malte.schmidt@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 3/4] sysstat: use nonarch libdir for tmpfiles.d
Date: Tue, 14 Nov 2023 12:00:17 +0100
Message-ID: <5940c01cf8a5ff7ae8255d90de91dbf0955dc1d0.1699958492.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1699958492.git.lukas.funke@weidmueller.com>
References: <cover.1699958492.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: a9eb9f04-d038-4a09-0cd8-08dbe500e82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oInJvEUdLMluBovJApXxkfbj9AOp4xv/4JTjt9feaiyZNWK9y7eMVjbRczE4B2DOxaV3tnNotYGPW1SLA5yTwbqJ/losevSPxp1WGXNUSyneLrts6kf4nOf+/UckrB05GJaelNwipeiCY6Qbj485tfNKkIivliDfHR9IHtfwOHCoyMIccz+DIfxQ+slDnNFA1ejMAANJPQTv2JPCT/OeS3fnZA26HmWG/gV4sVmj9I+/LiuJCMWLo7WpGHmFfxdeBxWxmGE6383HQCy53JmehMrpcdyiqs12DSyQCweb+1DZKBEDuOtwZvoFfGy/Io2eJoGMcjX1VJK2XmMoIQe17zNhFh4BUfmQ44pXosxh+2SY7Bdgiq8cfwUqd5qUS/z1O1DPTmmh1rJYfnqWNLN/53DKG9QnX9RJzPePuWzEJPlir46Nes0m50fbutbL4V4zF2Br6cb0U+l1Js5coAPgbZuRQ8WbBVpek5ArvhnWgurIR3THV5u6bcXkSDpRkPaZcPHlL64Y2EBXWVwILHdD6ympx0JbtuxuYxUtRQ7q06qWw1HrmtswM7fkYGuOusgmbBGfaHoSimLXDOkNVLq4cr037S51onzQpehoDpP+v7w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(83380400001)(38350700005)(26005)(107886003)(2616005)(38100700002)(6666004)(5660300002)(86362001)(4326008)(8936002)(8676002)(966005)(6486002)(478600001)(41300700001)(66476007)(52116002)(66556008)(66946007)(6916009)(6512007)(9686003)(54906003)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yhCQv+XetL1vlzt1F8/VK5jmuXC+rVsWQBoHpujXKxjHsYl+OmS8pPupcOLa?=
 =?us-ascii?Q?gKIGJHhCTVUe5WxnoolazPUT7p0cIFRY5jdbotcIGJLHcE9mb2TAwn/Hv+MN?=
 =?us-ascii?Q?cVNUg8u4kDJh2t0BSJVgsYFOlqv+q13z004oArlwzjtJG9uvlpRGtxt0wR23?=
 =?us-ascii?Q?nuB+ys+uQKAs+wXynvglsAneV2G5TntwHzN9mf7ZenrcoRq+AwtA5K0dwK2F?=
 =?us-ascii?Q?kreCcFLj2r651czVmOhhTa2i1uzgqlAZ2BY0NAsFusFmNVoiKFZ45ewA9mo7?=
 =?us-ascii?Q?55GnijwfbX6iTtPTMG/I7MHGLINZvQo7RHbllh6Qvs9dmT08/MzKaYjntu/e?=
 =?us-ascii?Q?97rRjXMKmP3a/TU72cYi1vjZMCGA3UrFzE6VX9pbXEIgeDj3gwaA4FF0tS9b?=
 =?us-ascii?Q?sbvSJ0xuwDsmC4b2qhz6mEnw/jgg/1MrljNpKsthlcpptCfn9YsokjIvbruJ?=
 =?us-ascii?Q?jkQK/gzIqRwT1ENBl0umpcjBFLwpaO2Xo7hhLsxJvjBTWnen0zQRdXjBj3Qa?=
 =?us-ascii?Q?MOV0DpfqaUfo2oPxteZPNVhRvwsTPvZhsIcnbtWMvlo/GPQe1R5qEVy3A9JD?=
 =?us-ascii?Q?OciH36hyIehHSNfj1jWNmrCjlnzeFMuSEU1In8esasqkctccUWq7UpPbgbAH?=
 =?us-ascii?Q?+edxl05GkFbW8YmhBlsRRmnjyihWXfStUNooZzjjala2A9VssdTzLNVayz+/?=
 =?us-ascii?Q?6bloZ3dP05a0itc20qSidoeAHPAVsPZP6kcCwQcWYWoAkPrIfQ4tkHOquow+?=
 =?us-ascii?Q?/xlRDmLNiJ4ruu+aBXgUyGLsPs+1f7RNlfNKhAhosvEB9ssFndlVTPMsXLgU?=
 =?us-ascii?Q?vzqjOV3dLj+zlswGEwQ4ocWMe67d46iNLE15Kchnuing2wGEh36mvfflY+Rs?=
 =?us-ascii?Q?Z/qiL+zr98CaS1LauQ9lkNcFQ8G5Rbql9kUOS2qQQqAerD4v0JhZdwJhs7u2?=
 =?us-ascii?Q?1MjyUuNM0daG+7n98w43c8LDMn1BGqhcE7iUBpGWSiMgDsJS5Zs0hzhSYqOE?=
 =?us-ascii?Q?8CAKF/X+SMSNmJ0dl9nPlYUAdNFq6vbYQfeSuuGtOUVFovgbH34ZWxUaqA0E?=
 =?us-ascii?Q?NOiyLkNAA+kaIuGS6A4gm+WyVn8Ox0R41LP2V0+4+4O7riXQTMr2Nx83X/Hy?=
 =?us-ascii?Q?CBBdi3Fb8d5oU/DSzSOMWzLoYvdWumF0aOujBPn7hy2HI1N4q+1faw/so9Tx?=
 =?us-ascii?Q?EIB+LYXZ9NTXc8ndbev2tyQB6nGzuHb3kCMaS1hs0/xoo7AzjV/JzXmMg+2U?=
 =?us-ascii?Q?xu/zVwQXtG9JK96FJbY0YnBhrRdXJoNpGagkd952MnPfM1f7LT45ee+W79yU?=
 =?us-ascii?Q?7AF/UvDlwAGKShDtuYAcGo5kqlt6PJZIVU4S7MCkCAGPkbwlLxdpRcWXPU1K?=
 =?us-ascii?Q?VnQlc4Ur7jIcV74r3WvKb6ODYQ0JN8f3RvRG5u/UZXcS8xSXiuPb2+NK7o7K?=
 =?us-ascii?Q?i9DAmNn+VnGK5IxpacGgMPW3Che6u2M073huvDw72b39jSVjmNyuZe9w4OK+?=
 =?us-ascii?Q?jpVF0C+jUZKGtPnnVN1kwk0IZFYxi8R+9HnBuVTMCs9WjIbGx4EorsIr7PMr?=
 =?us-ascii?Q?WvB4q2u9b2B0N5puSa1WIk2lfh9PrPyynEBfISgABPEpdL3ul0xd/NDuhdsX?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eb9f04-d038-4a09-0cd8-08dbe500e82c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:00:26.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wr7iyLN7ct6AdgWIHr8eAxXFfk6971N628iOuOzo1miqjm0GYMQQp0dpqJ6n7Q922sWviABpsFyai2u8S9P0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190495

From: Malte Schmidt <malte.schmidt@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/recipes-extended/sysstat/sysstat_12.7.4.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb b/meta/recipes=
-extended/sysstat/sysstat_12.7.4.bb
index 134fd5cf96..660bc634a0 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.4.bb
@@ -48,9 +48,9 @@ do_install() {
 		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
 	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
-	        install -d ${D}${sysconfdir}/tmpfiles.d
+	        install -d ${D}${nonarch_libdir}/tmpfiles.d
 	        echo "d ${localstatedir}/log/sa - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
+		     > ${D}${nonarch_libdir}/tmpfiles.d/sysstat.conf
=20
 		# Unless both cron and systemd are enabled, install our own
 		# systemd unit file. Otherwise the package will install one.
@@ -70,7 +70,11 @@ pkg_postinst:${PN} () {
 	fi
 }
=20
-FILES:${PN} +=3D "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd=
"
+FILES:${PN} +=3D " \
+	${systemd_system_unitdir} \
+	${nonarch_base_libdir}/systemd  \
+	${nonarch_libdir}/tmpfiles.d \
+"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
--=20
2.30.2


