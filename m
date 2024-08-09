Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B05C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 14:59:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.95])
 by mx.groups.io with SMTP id smtpd.web11.85930.1723215537609279737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 07:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Z1SjJfRf;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.95, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9DH5VR+k5/W/UdryNSQRweNzdfrXAkqFiFkxEEqvReo52l01HMG6AJubeimOBs91zUxgKhAlAimaDXQf1naxMsycgD0wgqesuvPO8VMWymgI9stIvxSMHhUwJgSsQzYWZMvf6eXkRuJEpxXDUsSmn5L/7Bp2m/z2o8DvhQHkDF/rLFyMsVl/xkLj2UeBh9nMrrSTAW6Bx0bzymDqjGxNy89VKzbJUtUOx4rPfrlH8ADEZHOxE4mC2uukAIJVd8hODI+O81hf+IZ0KZ5jBRZxR5RdlVmh5wLXMGRzFot8RIfZCn+ulo8BnGiF2yJH2XhqGp9K05ti6XpNXcbEE7o1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bytq01pIK/S0rouT/hrA/2bsIUcouOrLOZHuXikb2xY=;
 b=vVipyldGKptjekrFFZYbgU0IjBFLQqgx+jscA2jOXrUhsUA61ptJIf1fM2MszWh3HgVrSQLZSFxGzNWWjXkO8iagng6/Ax/hmT2s553S7p1eH6krfIbZs1NnLdl9w5nx6Sq2+HlV1YX/E7G9Iz9FIQUUmGkVpXU5j4s4CnQ3PSU+z/xeUBrtvtVZFg/5y3FxEw0GKzxThKT7p+xYCEsS4pcR42KnEkFw8t/b+cCF42COzLeYWXhIhNj96U918IsTjxJpr2fPyI6n3Dm2tBfkgkHSWkb4MsZfz2L1c+n6ODV/rS5y3RyOYVagDkY5arHmqQWAslx3NqhGsidFJ6I73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bytq01pIK/S0rouT/hrA/2bsIUcouOrLOZHuXikb2xY=;
 b=Z1SjJfRfnl46srI2k3vYzl8i9KgsWa+tzG2LiJLbLY+8voZDz8bj7vR9buz2VD4kKW3y4GKG29KuNqIVd9pn4mQv4NB8RLdmftjP2QYkD9M1YqCVkCZr59SsqpFrn5flpuP1qEtp0ypGZYEcjxjnyoIS+R8tZdO0uDvA6+OMHz3O0dRMBJWQ4d1QbT8b6BKAV7X/RdDzP7JJ5YSd9ThLc2+frdju9HpzoxC+Lza9pE5qUPbTdYpnkNYeW329ZRXB77fI96HmUh0u3B0NKinj+Jh6OHbmGIpE3Wzmir8Fl4bwGJwr/pejHZ/aG7ERhWgTT4y+gSD7Rs1xuI44/H3ghw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB8826.eurprd06.prod.outlook.com (2603:10a6:150:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 14:58:51 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 14:58:51 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/2] systemd: Mitigate /var/log type mismatch issue
Date: Fri,  9 Aug 2024 14:57:30 +0000
Message-ID: <20240809145731.53074-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003831.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:18) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ec0652-2eb5-4728-f408-08dcb883c7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OkqKnhjy8phXPEKPlDaoh9iCvTFOrGxbhsIEuuERpLsma0wgNcEtGOPbXKyU?=
 =?us-ascii?Q?Q5fF8aQWKpKUR6Wc0XBPjgKPLP50oHReC6Iu84Sp+a6x6JF2q5juD8IQMUZC?=
 =?us-ascii?Q?orpQ2k6T99EmJ1AYorR5/YlG52T2Cht5NyrCF0FjErD0RCGga0yDvKmcL4oz?=
 =?us-ascii?Q?kwxcvE/xuAkMDv+vQTmzgZ+5EOO9m/2A3GnpPCUtyiwiqtlL2n6Q0xn5PZij?=
 =?us-ascii?Q?2RDIKVRC0FgVZJ/6TgKDOwFxofrot7EOS6dju6yHvqA6PyDTpuN9TWhBI40c?=
 =?us-ascii?Q?zHt5ILFBz0WyIABTRQMIz3xltbPOYgG7xFMmKJB8q3qcGyyoid7eGmn/UCO3?=
 =?us-ascii?Q?3iw0JRli7ymC+oZxEwrChesOtujGwOzMwBUjf0/mHo0F2+bF0uKp+ZbXz7z+?=
 =?us-ascii?Q?dHgIDkOf3X2U2UD1XTk3ftzYYm3B4kOZdzgqAUhhl+WIN0ea4DO4aZvfs9iu?=
 =?us-ascii?Q?7bmlrb6K8v7wkjJpfOl2oIwlAqLkoWAJtNJr++m77Soxox+DrtH/oEc8CnqK?=
 =?us-ascii?Q?r6BAPs8ojkmhnwADIEHIszVAMhPkHLg8Fs5EqHCmVU+TGOtBC9MXWsKRZziY?=
 =?us-ascii?Q?9vThJ2tlmq4e/m6Qir5UcGe/Qg5TkAfYfzYF2rL5e/wAiWeh7H9YfGQZ8muE?=
 =?us-ascii?Q?KXDgMCIB1/EBGo/lyT+JtlZZSAU1+ICu9TE0aft/fSzFRCp9kcjqdcUAO0y/?=
 =?us-ascii?Q?DZx4e1fNUWgs8tvVg/eQiaXKna8SG87Eo3vituW+ev62GbRLikunYG189HGK?=
 =?us-ascii?Q?ccBMPw6feaPgrmaoQI61qD6IL5j5QfJDDhsvGjcIFlpa+B6xvElO8cdbOEnx?=
 =?us-ascii?Q?d8l2lhUW6GL7pysZC3J0F3C2c0000DPa5YtujAme3nXO/ACmojFpTkjN6+IJ?=
 =?us-ascii?Q?hNGI9EX8X+R1mRjeaBcsEnHZ9/gtVxNp3O3jLg8nUmmiwWB3ro9DP9Zc2fG4?=
 =?us-ascii?Q?pPjQkNeMAHYF3AhfS2fCU/nws1Fi1c+7WFfG/tZTVNlcze5Kqd8HfOweQ8HM?=
 =?us-ascii?Q?uhwmA4NIT9NzMssjFYGi9YYJw3v6ohg8gcY8UO4TpmmVgE54fljRsej0A/qn?=
 =?us-ascii?Q?xtNSe+u/F8kPIG2KCQLcd119rEr58vZBJ5FBBgcb3bOeCLdgaMdrIg8qy9KM?=
 =?us-ascii?Q?9QpACHBsDwN26T+liMXIE2GRwDEh6W2PsAXaTv0SFi/iNHBDIUFk/t4jIcKX?=
 =?us-ascii?Q?GJ/BZLQwC6c882l8yagYJBwZpTnDu6LeQ/vSmUIeWdo1v4mboIJ70+cc8oc6?=
 =?us-ascii?Q?N6jov0qRPf5wCLsY3CigTy01r7iyickO9+tSGM1Wb1Aq5vEMho4WIZHTLGJz?=
 =?us-ascii?Q?9ASZs8tnQSuf+wQOaR1czgiSu/iZv66y3K+0/NcdGcw4Ho1lGI383kdbjcUJ?=
 =?us-ascii?Q?tnV1MZDp9NK1pgmCU9E9APKAH3upf2gUWb6OwA9aiTktMRCmdQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mygqSHe6xq6wWRFT/fiOx5YKJ/yGZcqSpkRtqHPbdYofxOdm6XepNnwuqfaz?=
 =?us-ascii?Q?hLzCdW9wNcQKb/BrL7ucir1XoC8bIFlFCH7TeGQ2faKJvPiqao+eIoN6CEDZ?=
 =?us-ascii?Q?9yuXm/nYVYFNUC8dEX/qDsHckTN9xUGyFn7DScY2OXmHQdWbQHJiBZpXpYi9?=
 =?us-ascii?Q?hKMzTAPNZuLtMBnZ3U5y9+9wDg/zavxxqOS922vSvkEUDIFC4MHxU87Ld5JH?=
 =?us-ascii?Q?apNt0fOzpB7L4OKgvOemdP9UOeIln4nvLB9mbUF84uPorP7nLjiO9ClSlQLm?=
 =?us-ascii?Q?TehNUhiM2a0/LuTXpwvzISgxcNot47LytWBW/1fRxHR/nFRHtwCtAJQ8NzWj?=
 =?us-ascii?Q?woatuhHmCzPZiKsV5tURGEd99qxOb2qTToRWiTb7K5N0rLgsJeGLrXPmFeJR?=
 =?us-ascii?Q?zBCMsUnQClo+wnW7c8OkuVop3jQZDJwwMWWPybQg1f8N3q+Rtaz9srHmMA9O?=
 =?us-ascii?Q?/7vGegScNoNF0Yl8c8gR0z1FcZVmxMSYDBGyjwt5KnkgMIxkZQITN2oaOTs+?=
 =?us-ascii?Q?1dpstkmKe8hqK4twWSdJnnbCfKrmJFMpPCMghP7K5LURK/uGaUpp9FtAy3RT?=
 =?us-ascii?Q?w/Vgucziy7cYkVdV/hyJ6vFplHQ5VPDsdqrNChiOdtnamJblketebX9LqWl8?=
 =?us-ascii?Q?CEOPeq8ESt8RJuGop3KzUovLYrHA3KvpbfTTF8LfK/7DOaNK6sGylpJ4RED9?=
 =?us-ascii?Q?zXqcpx7WP+u1rZYVH5Fe0YfCT9cYHgazLLuYXujpPpj3QGuVrLEBLcsFjH5V?=
 =?us-ascii?Q?nNaDIXJVaxctrZJnvZ8MBtOw9BLSiOtyWR15H7V0GObK/Nhwj1716p5zv/Rn?=
 =?us-ascii?Q?khx5ow1KLHWWG8xXj+R1tmbXQ86Bab2MXY2hVkGXpAkC0u/pp0K05CVtiOt4?=
 =?us-ascii?Q?GwIHRzWyYf98S7HUefmBXXyp1G+08qrDV3WjJiqqySrKPNg34XTRWKhH2xSU?=
 =?us-ascii?Q?bYoKR82Rk6EkK3ZGYTSiGv7IaozdLm/MnYSG5FP7fweDuugV98VrwEmMkMmU?=
 =?us-ascii?Q?hixQTwDcfO9NsgYUXcvB3F53YC01qCgBkpzjuTh+9KtprZbZX7DBMsVOEMBc?=
 =?us-ascii?Q?umSY/aTKHB233BYYEZ/0Aa5HOWex6RKZlAOP1pTS8Wf6Havsxhf2R4B50bpV?=
 =?us-ascii?Q?STD/s6CdMNajtWm7EBp2ZQ7FedGr3e75A9dfWm+gPa0PNRAM4xi2F74hXsa4?=
 =?us-ascii?Q?k32Ft0Qpd2XnO5K0ey8BsrsIIcEfkErCUk/wCrzMCqzh0VvOf7oQEFIA4m3+?=
 =?us-ascii?Q?1Bx0fqT6thVQkAMhWEdgU4uHyEtaybLTja+YFPvPVWV2A18jFOTq2U7H5mjz?=
 =?us-ascii?Q?cPfr4um5gRU4InAumgEXwXySNgmTT3otUpiq8SlC4UUH5t+4KEPVpUCCq9fq?=
 =?us-ascii?Q?Bq/a/6K60J5sESG3sstGksbhCuGuxjvG37WOZyvGQWXyOHpdmAfM9RRECWwB?=
 =?us-ascii?Q?ViC1oCu7O9mvl+ULyWdhRc/n16JEQ6WvOVhbMlhCOXtyTob/CGxehFnB2tuz?=
 =?us-ascii?Q?GT6eNHuN3jPPQoDeiQQDtNMlDFHylll4kud6LC6jwlWlMbiYdDIzToCGK006?=
 =?us-ascii?Q?Lrzhc6Dt1gPv65k/l+C0J73d1Fxg120tMusD0jRUWXL+L5zb11yFwsubBjLN?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ec0652-2eb5-4728-f408-08dcb883c7d6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 14:58:51.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2IDrKKEKr8QEgAsb16bsT/ST5CzNyUuDdMP0/Vpb+e86bbEW05hOGYjNJxIWOmMyWLm6tIQwbxVnaJmqtRIEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 14:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203176

When VOLATILE_LOG_DIR evaluates as True, the base-files recipe provides
/var/log -> /var/volatile/log symlink which is in conflict with systemd
upstream tmpfiles.d/var.conf.in which defines it as a directory.

This generates following error in journal:

  Jul 03 14:28:00 qemux86-64 systemd-tmpfiles[165]: "/var/log" already exis=
ts and is not a directory.

Mitigate the issue by defining /var/log as symlink corresponding to
the one created by base-files, when appropriate.

(From OE-Core rev: 711ee36e88c8968e3c45ea787b3adcf64352adf9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core=
/systemd/systemd_255.4.bb
index f58a1bc2b6..0ccca8a567 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -307,9 +307,10 @@ do_install() {
 	fi
=20
 	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'fal=
se'}"; then
-		# /var/log is typically a symbolic link to inside /var/volatile,
-		# which is expected to be empty.
+		# base-files recipe provides /var/log which is a symlink to /var/volatil=
e/log
 		rm -rf ${D}${localstatedir}/log
+		printf 'L\t\t%s/log\t\t-\t-\t-\t-\t%s/volatile/log\n' "${localstatedir}"=
 \
+			"${localstatedir}" >>${D}${nonarch_libdir}/tmpfiles.d/00-create-volatil=
e.conf
 	elif [ -e ${D}${localstatedir}/log/journal ]; then
 		chown root:systemd-journal ${D}${localstatedir}/log/journal
=20
--=20
2.39.2


