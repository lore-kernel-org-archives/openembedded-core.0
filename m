Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63841C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 11:28:59 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.67])
 by mx.groups.io with SMTP id smtpd.web11.3472.1663068525772265004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=BEuqGi6z;
 spf=pass (domain: vaisala.com, ip: 40.107.2.67,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGAlzxq/bjf+U4DJlwx8wvxOihcMA2NrQ+khhREOnpuWIiU8BOuk3oFwB8Nun292N8ys7eJgPq+XrA5DQci1xta+Zp4tY7agNhKrLPNPmt55Svv3+03W6i8YwMorBL6jCJCPETmNKatyDvX1Ma8JNSM0bQC+K5A4X5mx6BLG7siLobNa3ezAmlvC5BsX4tM1kfmDoQvbU4zo5OQS+nwsvicRiXQqjyBXLFHp9cZS7Bl9lRntXdSnLHZIYIjNRCTYLWJHajHOJbALuay6zHJ56Xzn43OlhnH5f4jIGbM2PVG8dO4d0t+h9rrOn3EYONtQeCGykwsZYljERT4u0BbkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gzp21Cmmk49HvNy9l/tN20JJ0WjtD4mkef2weYFEasg=;
 b=LPklAvMO+JRw2VrBVn150LZuhMpXIYliv7l0zDbJeCC1Hh/oL7/26i82BaxSFJMNGLL31YTOFBCZlLJFwOKyF2xiQXfMNX2ReOMPj53h4RI+KMmjxaOh5ie+hl/IKWZPAI2QIzAc2elOhlbtPmI0TvilCaUVSb6+lI/eNuyOUTt4LrWV8CE/C8/5i5Nts9VeEGTbl7WmpHeBt7jf5CKhRZ6gsNCL+7PByjRSzFdHgOgGh+YSbTLda1PuVQ5fp1E+r8raF0w56e9XtcCGwBPYKnc4Yuee89rO6CMAB/+THnk8KQhpyJ7xsMUv3LaJNKV8bp9OZ09YjFtcqZ6blyKl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gzp21Cmmk49HvNy9l/tN20JJ0WjtD4mkef2weYFEasg=;
 b=BEuqGi6zZQn6rnewIbr/F1ZvEcTblr8zmaLHeX7mQZ+WXHQtFdaED7CzfwOyZ/PnNWy9x28DVZDFhq2FfDKxJc6eKzDtb1yXM8Wj3HOXda9Les2xxLN9BaxrNaNOZJ5TG3Hfhlr33VEETr8eu/tDfNr9uR11X8c+Ar/SZXNWLdpR6sItETw9kc8Vv7b4lxgRqQcUi8+5dn7ufOPSct8kpGC7wL9Uy7qEfv3xsA66dMUUMVUchReqyowTXvZPw6G/X47OBXEVFnFzcRz9R116GwDoE9YmmX8fIzE+RdGFRjPwB2VlzjtIZNU+4suqix/jiVjjFoq5f7+BBnk8CgqLGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by HE1PR0601MB2172.eurprd06.prod.outlook.com (2603:10a6:3:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 11:28:41 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:28:41 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] systemd: Add 'no-dns-fallback' PACKAGECONFIG
 option
Date: Tue, 13 Sep 2022 11:28:28 +0000
Message-ID: <20220913112828.1458038-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913112828.1458038-1-niko.mauno@vaisala.com>
References: <20220913112828.1458038-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::18) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|HE1PR0601MB2172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1905e6-8836-4bb5-97d4-08da957b1c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VF4rICHvyPUGRH4/kg96DBk2ZmGI9l1imoUaMZEA8ykwb/WCVpO6u88hjt0hfH6BtKlMiR4UgihrjXvJvQ5P7qTko/b+8QvcdfTYBJ/S9fSsKEloomUDNWmznOoWljYCMo9L12SwL1KIkwHkBQent+96qBPGVJOiRP7dmfgCUXUTa5TurLauaKm/iZRZHqq9G0raVnXSiE9jVvPNnHg6rujlXI6VooR0fnigUyAZUXOvJC6iP9pa+F9RvWlX3fbeZjsQSoLKnZLCcBLZ1uJE86Ttf//F6nDzXaHd7d54a1FX0a4hLDPixgYcxvTGWSiQCC2zuh3dbwzO126kzXKiaTUCwsZYQSmroqDZF6H+N1lP91uAmGNehPxO7zaD5adM+UwNw4EXrRMs0ip4zPJAFLXKcULqK17IY1+wlqCjEoOQ5FvGxjMktu0nTtP2XbhjqED4SQaPHbOjuy0q3dqFIXpf5X2GlinWivf38Ql80gf37lSQoXOfo13gWuew1/zgXoUrbWITj8j9F+p7r+8FWex+zW/Re5QPW+x0A9THuJjJzt1jcUuTsrDCr+l/VIdVhJLTq9aN8ng8o3oy7OZ3miaXI2GSz8likZIXAU0Gan/hz87F+HN0LHEJczLU3iMv3e7i6hGF5uCt34TDQDymebew4e5F3Jaevg/w+QXKVOqYb/cMIH38PMMqMP+1EYGleboFHelCx8YjNWfewbfiDMpfqGYoJHWpQ5tZAAnRD5mGYthXdyBptdbHUb4LxfFMoRweEriDDtgaRsdk+aMSgofaVq4r0oGJPUACLs/qvbQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(451199015)(54906003)(6916009)(1076003)(186003)(2616005)(41300700001)(66556008)(6666004)(66476007)(26005)(4326008)(5660300002)(38100700002)(316002)(52116002)(6512007)(44832011)(6506007)(36756003)(6486002)(966005)(86362001)(478600001)(8936002)(66946007)(2906002)(8676002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FH3ay33k9fui10g0W23qgLe5/ecwd0/+iiSsy8o/PjOlDq5tglnoStd2v8zy?=
 =?us-ascii?Q?S17mo4RT3X6zVf16NT5mgcf8QFSemor1gnGLKibOn0A4KBrrz5IzYzDPgDGt?=
 =?us-ascii?Q?2v2Oq8foY1StBrg2cP7gtadZf9TtuyEpJZavVpogOAwPwLeJwWzBCMMvQTeE?=
 =?us-ascii?Q?KcCtCRNjBhpyrKIrXJ6sSsqm6/qv/rh2QBcpqWhEBIP8TovYruBTRHTWjlDm?=
 =?us-ascii?Q?8VSwiFEA1EJbEz68tyMQs8BlX/95TayYGaqHFWZu62l7SZC3sjXeExxdw9yF?=
 =?us-ascii?Q?ZXvKnWDTUAWYd677/r3TJvT1BHuT6DHjwGknJXWdoXZtE8RTvcgToVDpOg/9?=
 =?us-ascii?Q?yFVzBiibNdfd+m0HGFSNQdI/Et0dRQdAipf9lGpx2a4VN8frSSaTdpUILWG3?=
 =?us-ascii?Q?xF/KEvDkXysLotoxPhtJgLxWE4bWZuAnHAmqAUkONlI8DyPsswNfSTQcvPUr?=
 =?us-ascii?Q?XgaWaxAF2+r/Ci0Wl/I26i3ICsIjmekz/5pcBTd8Md2AI0DCxOE4/HnLz2I9?=
 =?us-ascii?Q?2B7uRiALZIJ3OfP7QeSq9DPQY5BPHy0WTuPPwh3YhWLpp+7WZ5XjGnbJ3IB4?=
 =?us-ascii?Q?mcO69KQA21waRN2TSxt6pkOVf9v+TC5aY5Jb2t6e8g/fLoiJiApVojI/Ab4m?=
 =?us-ascii?Q?hTGK85BlFtiI5kJoOpeSiM0bSGySHKbsrag6kIcxvxHWKIWpf0mXfSVxs8g8?=
 =?us-ascii?Q?KmFpYstWuBGSKBtGH8p8ZuvCimgo4AgCa5AS8ejtQGMDhitxViJDrI02ciIs?=
 =?us-ascii?Q?TlonFCeY9JkF+pr2omb5v2TYxMlUBqECN5cePXR7ue9qTZ0ssvextH0M+4BJ?=
 =?us-ascii?Q?JnlSOjUt5fbEruU8OAbaNcGEi919gb4cPSRJeE7h8Xlv8v4psjDk3Rg5+oGf?=
 =?us-ascii?Q?DKTQJUHcrspJAjQAngVQt/KBr3/fa/3aQNIe4PgB/BPI8ukwL7Rsao9sqsB9?=
 =?us-ascii?Q?5wNiGX8uc/5Jjl5R+wuo8ZJ8wa/LECAda0Rk4BWO31gPhzQoSgqKMXwpLCt1?=
 =?us-ascii?Q?hCOVnOVjlwyBI8Z4EihZ8fMG/NJoXi14eUWPA2pi3GCrhDfTS+R/XkZMIZia?=
 =?us-ascii?Q?N3C+YNMFoLXoGGv6n0oOA/YhOURCTP3QRg4OQXIgH9vmq8Blce9ejNEh6DlP?=
 =?us-ascii?Q?c/Us8qd3AUvMD5/ToH9nYe/ADqK4QHKFHBvcy4oe0xNliWAZdXChCz+qzi4Q?=
 =?us-ascii?Q?LVU1FWacyAEckZ8mXWuJ9ViaxHF3YK4zEGW77ZRcdqr6WxhgAOg4k406ynv2?=
 =?us-ascii?Q?ANf2BSFirkMYQp1T8wnA4vrbgfk+E12x7nmsjPHtLvekK8XaD44YHXf9PQ/8?=
 =?us-ascii?Q?bhXQUzL+rhUwCy4TkuTyo1vDA+tI/fTu+6HROos4oK91sY6GfXBr/r5h+PdC?=
 =?us-ascii?Q?R+CGRfQLNHo62aX66ZxJOIQWpfxrMcpqhWJXv8Qx1iQK9c3oB8kFNDMhdPRc?=
 =?us-ascii?Q?q4WqvyGVH0onrqeeN3AczCm8FxotTAnjGGbwEnxK3Z8gLYQaA0Id/qmIEcR8?=
 =?us-ascii?Q?CWfmV8x/57QZH5V6gH8gs9x5lTUSTmGJ7cUlYHUNKYSILWyiBEz2Wg21X1Of?=
 =?us-ascii?Q?WVf0zS26oNp7732fw36WqD93ap7+3j2NChNVQ6okcZJnYmKKJK4uiBJEzyOJ?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c1905e6-8836-4bb5-97d4-08da957b1c37
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:28:41.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2vOzXDvQw3L4d/0mdeZKdh8nSNVJRNXD3ico3+GkOwn7qwB59RghbQkt66ropA2loV1Fyneacfh+3LdJ7Go/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 11:28:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170573

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then adding that value to systemd's PACKAGECONFIG, the output from
runtime 'resolvectl status' command no longer contains the following
line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0=
.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dn=
s.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.c=
om 2001:4860:4860::8844#dns.google

(From OE-Core rev: 2b300d6b9ec6288a99d9dacb24a86949caf99e55)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_250.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core=
/systemd/systemd_250.5.bb
index 9923312830..5d568f639e 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -165,6 +165,7 @@ PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse=
,libxslt-native xmlto-native do
 PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Dtrue,-Dmicrohttpd=3Dfalse,li=
bmicrohttpd"
 PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-myhostname=3D=
false,,libnss-myhostname"
 PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dnetworkd=3Dfalse"
+PACKAGECONFIG[no-dns-fallback] =3D "-Ddns-servers=3D"
 PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse"
 PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Dtrue,-Dnss-mymachine=
s=3Dfalse"
 PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfalse=
"
--=20
2.35.1


