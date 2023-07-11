Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99780EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:29:18 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web10.1378.1689118147839251392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=VDIgYdg1;
 spf=pass (domain: welotec.com, ip: 40.107.6.85, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq+nOcGoqZdAi4nS2p1l0zKprTLB7N46HO+8DiSEdScNyCYOzNlo/bOhpU2yDy9BDM5KxIkm9N9PYdGleLhBWQet0KQhQDVMq2Gpyyuk7PmIGI1xZiN1MtCuk6VMnk0ZEbGaeng9C/hzEbNXGF19VtS7Gn5owzNOeGSbTYdIUMnpLOu6Q2RnrjsBjmeLM3bOotaruLHRf61aNwdNA0GkFroclJsMHTtugLnwoNdxCqrumCp8oGlyLCihIf3GGXIL8254WXnvujuC1tN7DXu7l80qPaYufACIcXWhqusUHV3/2aqrWyc0lWFkTXgQRdMbL4V8F/PBb1nNeJHidJiDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcY5wmDUfzefPNyTYZ7/vLTA+gLfzm8/GZ4q7gXC2eg=;
 b=dpCia2SKVoCJA2CB5vSuIT4mWFdTPguJA4TBCjl5G7j1RN+azbTJrpH/aIle0dCDqmzO93cwn25tB0WDL7L8o0ba4tMN6AGAnu6OMpBy4d77s6zxANDKhrF416rhTP28CL9SLNUBEyORI/TdoxqV2PVvX5uCyLJu6dbtd+1kIQR9xUndAGbYNL4ndcayMnqlsCK9hC9vZl13tw9leig3ltNzgHwTQ46ulRhlufpN4GtYrvqf4o53+86QiQ7pxfIy7/tvVr/kXeuvxXpSo+EIAi+KimUOlllc0b6qRRw//tKtY7s4SNOEjASt0ttRnhQzgcfoFzdWpfV9FPFUSO1z/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcY5wmDUfzefPNyTYZ7/vLTA+gLfzm8/GZ4q7gXC2eg=;
 b=VDIgYdg116aajizvTZDE6SqS/62com4ZaUQBDxkv8mz35rdAo1poiNnYamQ8iO6Cg2efOAqsn5t8xKJQk/7DZ6ncawu6BlAlWs/UsLAItlW8IKkJmDRgT3eedNAg3aKX9FwLQFLee8BN6wdBvQ1hWHMsV9jBoZV2uVYZDh16NmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 23:29:05 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:29:05 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 01:28:19 +0200
Message-ID: <20230711232819.2212134-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711232819.2212134-1-p.lobacz@welotec.com>
References: <20230711232819.2212134-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bf02e6-0048-4a85-d338-08db82669dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xq0ESbYCGE4l1sDkdiJa3az75slTEbntonZnUrvdI7asLgboWdluLIpr99Z1NJ7oeopKtDU74ejOW2dmdYsLB9qolggJgQoLjCt1K1WjmvJ/Oe837VZi0kHR+1n5m2IwqZRjCVVqe4sVqbD3X5/xml1qa35FTgd2J1+E1/Tcht/+xANML7nkrkgIJ9+uB9x22iUwwLkCiRYYhuo7lTwZC14Y6b9sgxFra8pOI9lfS3aKKDwL3mAtWFdqkVg7LkHruUNqmMMJ7ez/XbqLTx56GfShZUwAUccurvxKSlPc4a+OC6/fBmhO9zcJcYLxk2Yn4d0nfjp2xKpZ/wMGCcQut11xQZIG1B/JeipMHUPgcc55pnTEDW4fQKXhIgLl7ouMd0hbZhZHWRd4NIVy7SV0JtZkARFKoLy6K27UP+MpsvmSJ+w0TfbJTfHtgYz8AO4B4MkWbNbsmIBzUq3LOhhA/NPWM2snOvrleeFtVZ0+X5PB+KAeRxBinolXlO4uERDeNwelnm9fZUyM6Wui9IVsiYohEuTUi/uEgd3COSShcyhtWIpO9jlYumfwJp52ArZT82tKzbV+Yut5EWR0rk7FRVQ58z3PIc/byVM2Nz0s1mhoCpQnMzBD5Bg3SLZ5jplu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(346002)(376002)(136003)(366004)(451199021)(38100700002)(38350700002)(86362001)(36756003)(52116002)(6486002)(66946007)(6666004)(107886003)(2616005)(6506007)(26005)(186003)(6512007)(1076003)(5660300002)(66476007)(2906002)(66556008)(6916009)(478600001)(4326008)(8676002)(8936002)(83380400001)(66574015)(316002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+coqiln9+omeOhGYYJ90rkiKu7eColyLB6XzOjfRstR0k9yjPrv0UximnEv4?=
 =?us-ascii?Q?pXbgxTmlmQaFwbWfiR34+pxvFF/LWsXZW/ed5YtRKixwipAEHn4847dB5/pF?=
 =?us-ascii?Q?tEEzdEePASBW6J0Cz9OAuRMjismUYtYQReAw8XICcsOX7kwt6Sk2W+KuUVQ7?=
 =?us-ascii?Q?Qz7dFtQ18SZtQC9ruTtfTVmp7bxDbatNDPj5jO+OpaKUFnJOVhwrQpnpILBB?=
 =?us-ascii?Q?DE9lM8mpZVt2Ckswa0D2rMjTbkMKVv3xbwzhdzhcHLt5Xclzfsa4hOQNRpsH?=
 =?us-ascii?Q?Go3gjRSixVMynST52IYEzzzrMFHbSB/CuAYMV0q4/+mPPWJutb7cOW4pM5zO?=
 =?us-ascii?Q?6CEVHkaW73gQNmBcY6wRDzi5Se3lzSeEZ/a9ZqsugXPMZGEkWWq1L79h4mJ0?=
 =?us-ascii?Q?oc0fdEGNUrKlMSBM3rp+nhpoSabPfK4rX5l7pB0LSLRjXbtH+laB0CpPPQqg?=
 =?us-ascii?Q?Kb8/cuDeRvzJqY7xHLi+tPkl7QlGHbY8jhxPxUjnaZobLPFcQx8HPJAJMBtC?=
 =?us-ascii?Q?IDGCee8VJU1AveCcegO/aN3Lngs+nzsl/Z3CvN7c9nDwH8GQv9zah9E00Aic?=
 =?us-ascii?Q?m5f7Wzg5pERnudl+TOZQWEK7asjQ3EV8wtHkWhvmfJZo4GwnTg9TZiJGaukg?=
 =?us-ascii?Q?nQDDLvccoTD8A9Fi5PmrF0T5HnRdtrH3Ry1ZYt2Lfg9mNZoJAm02WxVSBKZb?=
 =?us-ascii?Q?kGM1jUJ+YnJlZ8L0mlHdEDVmla8W2mVFkz4hf7qwpSnok+Ad9VWAU8oyZakB?=
 =?us-ascii?Q?LB0ukHCBH0g3LT9aD0wyg27UrFTxrcDPsxskXZI4HpD2b1hLlY/TSMY5ggLZ?=
 =?us-ascii?Q?vosY4fOSvGJ5u8X1+Ml5HxBm3403gRFFzyPr6fivVAZHcDHvd35Np3Viz02l?=
 =?us-ascii?Q?KTzW3esEygif4G7H45tMnlDMKyqE7GqKPnjhcT5HPsfjrc0WMSMRvClu1Nny?=
 =?us-ascii?Q?ziMyefdPamY9ehILTpMvBuoHxgKYw5znX7gSMraceOP00Y1Ppk3E5oiPXyUB?=
 =?us-ascii?Q?6W1AGmJHa3L9Bb8EGgeHBzt69k7elB76YWfYLGlnNYWjByJJiwjByVEsHqH7?=
 =?us-ascii?Q?rYBkcUrw8z4X3AGGZCK8yNalkLFCxonDr00w/W7sd2HwV1lP8zh8EMxDHp36?=
 =?us-ascii?Q?TbnEqlmcTPBeYhiA1O1Dk9s+cS4hAAKxOg3S25ag2XaEI0xJ4jAybhTNGuY/?=
 =?us-ascii?Q?tvbCYxDHlm8rMDyRp9czoVMd2Fn8ntH1zm2XLkim4rNgNFippRy109IDr5dV?=
 =?us-ascii?Q?LJE213cpGehnNCNO6li0s+k8sWglOUQSRwCDZSHVT6owXtqrcRGBPWlarcd3?=
 =?us-ascii?Q?lKrJxXHK2f/E1EPBVnF6z2TknoOhilk1xf/FNjib249qrigNQJ1+brBv3c0m?=
 =?us-ascii?Q?Te+QgHbqjP7n5l4uGGcgzKSt+NjRxhjn/jJDrvP9wNCIy25Xx/VDpuzbXtx9?=
 =?us-ascii?Q?2sugGOGLRJB1xs5Qp6cLWCfPtsRtbhDEK1Fv8/VUAdaexokh0dUocskHKjcl?=
 =?us-ascii?Q?m9v7As8zE8oVQFKpODU2eIxXiCgUjTtj47mbM3fBZCQzJGf5FM/OKClic63z?=
 =?us-ascii?Q?uH2sdA78nC6btJkJlNuR7RFFXPmtgL8Z0ERVOSTS?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bf02e6-0048-4a85-d338-08db82669dbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 23:29:04.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh4E92CHUZS3RJB9XHDaNfHMEAFYBaeSjNEukrFnePc3ukCdt33+zGn+UDagjZg1C13TpLNUbKxf7Pl/q2dl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184160

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..7229e4f2b5 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,14 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    acl =3D ''
+    xattr =3D ''
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    if bb.utils.contains('PACKAGE_CLASSES', 'package_ipk', True, False, d)=
:
+        acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', =
d)
+        xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)
+    cmd =3D f'tar {acl} {xattr} --numeric-owner --exclude=3D./sysroot-only=
 -cf - -C {dest} -p -S . | tar {acl} {xattr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


