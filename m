Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC684CD98D6
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 08:02:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124860.1781510565177218930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 01:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=YfOI61Hi;
 spf=pass (domain: est.tech, ip: 52.101.84.35, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qL9leDLRdeDHv2znFC5ei14W7J8tr+z5e9tRUF9hyfiWR0o1Q9hDc0HSXxfzlLnStgk9ZVC4ujjhKNmEiKgeJmboHc4HA2wl1u7crTZvu1z1fPhwfhHOVZxxcn2uM4FXwmasOTVwZd1RAEqhzIC7wOl5QjeHe8hczlhRNKAoazc8w/ol7m1CzqMBUJNkqZsWYAnOOLgjDVkTIJTzc+K7KYKKsDY1luOmBP5RmVDg1v5jp5lqXFABWfueUCYr+UlLN8TkiTBM0PLSpOJFKgclovkFJnU+KuOv/DfOOOiwcMBoI1vimbAoMssNSyRUrVplDGQxqProXUhthwr3uCqULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqRY0Kg76dK1sZ9AWj5jBRD19mptWlOhNg0mRAOQHM0=;
 b=k5VXvSodW1rGsfNIMOz7ICGKbRLuR0m1PdNIeYJEBYijKcx1UcdkpDANdhxY4YK9aHFtHuYdvt4rX8+z/XlN6hIGNgtSnRzd7Edv3H4kEuagAscP8NeOKIOBAH2/9WCc3/5AwoLrfEaM9Cdrq3CCd/UMKh+/ZFAW/W92lfGhqEXIXkjBRHJR0VbHUhSdhc4D8vRFaRdr8bhpvF4+8Fvb7UGS7Gc05fYo010mET6ecx7hjUhNqzneIO78VvEvMlEfNG4zQhOCt5EcxaG4Gs6d4ZVQ3e+pKDRdCaB+oOQtHLCyu4olkCMMKpxZmPTrZlg8O5m5AA3LtdKFtbWwu3aFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqRY0Kg76dK1sZ9AWj5jBRD19mptWlOhNg0mRAOQHM0=;
 b=YfOI61HiYxlRs3EXICSu97qyKCFPy//U66fmB+TiO6NuvKd2c3LVvmhtmMIoI58OIai0WBnm+t07ZejqhpSzCqkdoEV0mdyFsEWVNj+NSt31WqNY80vz5aJ0FQOfh4czcyEhOWw9RepHo/OHQTEGnQ+bJIVQc9+KzQwKE9WHpTxTrMhxlKxGcdWRy2/96pbN9wDTu+NMCZ+cz/WRN9qCOlkYFS7yNFxIdAMLIvZJaGqMo5Pqn2ctXarp/eh/2Xws3wcZZVSExCM/+Wv+G1Lgo/dDDY0DiMzKVzwjEQ1f9g3ayzL3PCK3QWrYOj4j5NMOgb/l1tUmz6CTNMBireYO/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 PR3P189MB1033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 08:02:41 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 08:02:41 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH] package_manager/ipk: fix dummy install arguments
Date: Mon, 15 Jun 2026 10:02:38 +0200
Message-ID: <20260615080238.1367485-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::23) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|PR3P189MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e598d5-83b9-4e83-d728-08decab4794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	qYvkAc4WrWq7ulUfeTec7iF9rPWM8q9pSA43QRhgnzHAG3PbrkeIdSn0myzfkB6EBPv+I7LNnbDFlhIggdnqaecqTZdhCdSXYl8u4PHTyQGQQdBLS4mvoaV7aW9Pn1TrWiDIG4g+WXIzh1E4ZDa4C9Nn65t43D4FJNdraHg+zME9UkgJAAXRsTqzBtSxBdErZGDzF83/HVTb7T8Tpi2iV176K5GvxLyl5zL9sLwOzmasL3wN16suGkPFvkR6mQSkl1GRccPkaFCAsI4tBSsDIVdRxTxZDKrRUgHc+A8cz0VKaReqQy+doMXtHk311r+ABYNdPqEYjO3qDH7FtOjfnwm7XFe2dGOrxg+YGmq4LYTNZnIe2f4Ptg8kjNyN+V86CLRlETXlIJYuXVC0ufhDzxaYSE23xcu+n5lWL1xtxzoyvPZJiMhBdYgN9JuycBGoWZ9VZ4WHokMrPnO+1yNrGeSnL4Dp21pXVQoZi8nrMwqyb+3V/xIlyaZ1djdf/UkypOf865sohHBqRv1sFph7d47Km1+o1DsamZwRUhM/X6dG+MjYFmTT+zfvarVfHyyIevI0c/bYu13V2FpLB/HLMEk5KNUjMpz6YOxcq+zlpkmnPcqIFBzBx/YIU8QVRYXdWrmDR1ovDwA/gHIcvpBM/OMFZwI1H2ICLFfAgSA5Oywkfk7qFe8NThErFgfiI9ix
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fh/+/D4H5LkIDziZJ7QLOTSPHxAFdr0OD+CN8CknSJkY/6EFCy59Fwh3J++4?=
 =?us-ascii?Q?m8+qAVLfN9GbjbuCaV9h2NLuM6Y9/Dtxgo6LLPHHJ/5HNIqDM9Hs1GQjXESc?=
 =?us-ascii?Q?MM2/XRSARBNy49PPHL1a2dwr1/ndRdTG+k/Daa5o+nZX4J2Bea40POyMDCVq?=
 =?us-ascii?Q?4cryxUoUh37bAzBhMYrVbBzT3JM8MkxOMEkzKS5MBTp4dpBiyn+UN8ztBYP3?=
 =?us-ascii?Q?Tx2R88vYEiMOxPKqDLkspFoOTjVRnRPYo4fG830oL6bQqin0q5J3gHhMyOYW?=
 =?us-ascii?Q?0SV1XKHbwBlFaFYRiGkBtbqtCARPIyqXSOSC9/NujEw0KYmkc5kkZ0lkDY/J?=
 =?us-ascii?Q?NNkSleTS1gnMdTCHam0gJVGO+d56I1+LVNi1xoQSeEwJHeGrklWJY+vSQ8Qr?=
 =?us-ascii?Q?yqY4b039C0paxeuiRI5koEjRS+8Yj05r1ygo7/xI5B46HBWrCwTQ6GLYe4Av?=
 =?us-ascii?Q?QMQGsZzFBZEcU5CQktMLWRx3l1U+J+5P6dHifAYvLXvKTr9y8I1s07jWzLJF?=
 =?us-ascii?Q?NpTWOi+glEPuBZtoI9mx4fXOoG5V8NngkZ9dzz6eJNgKPi1YiEw6qGXolTYp?=
 =?us-ascii?Q?ZOBxE5z/OqrBgGjARxf8vWF90gomSZkb0HkSIX4p3Rul660Rnbu6s8BTDPUe?=
 =?us-ascii?Q?Sekor23zopaRoxEiJQnZNh5bXK0lle8VliTVNAoKJF4t+pP+1SMBXB/Ne8ul?=
 =?us-ascii?Q?FdHuePzt9tCdOXD8CFi74SkobhwaGuRZjq9Yywit7pJGzY4/evFFz2AzdSth?=
 =?us-ascii?Q?bWXEPopwyStVv5pgp7Qg7IW49PpRfwnpCQFQ0Pss7PluK191yK+eybSMMgC8?=
 =?us-ascii?Q?3TGXhXwdktzw8H4SbYzEdjsjGqVHNtbWF0ZgjCFi1F+N1NHfOKadgYiVeOQL?=
 =?us-ascii?Q?WXvPjEb5bFfIU8qD9PSH6ITuGgMPRO/D8Bvdenyl8pdgDdVB3w79YlyvJFUK?=
 =?us-ascii?Q?xU5uMYq/CM4HfhpMe5ONGaNNKwAdnExkAZiOVAechk+ALcZoCAnGzuSjKzqX?=
 =?us-ascii?Q?R13MvlvXZCG2GkpdRrIiblQlSoGn9QuqcI8b20W1dQ8iqd/FlPG2g9HTIV+O?=
 =?us-ascii?Q?EA94VYMp0d2HUwTWZ4+3IRwCGostN1Fd3FgdPNSAvdUx7KuKTXkrzBrANrTu?=
 =?us-ascii?Q?E8POplk0gJuGpHlB/1fFUClyYnhNjr90x9QzsNsCncumpFbqxQ+TtPMdPywQ?=
 =?us-ascii?Q?Hv6RpVYhpKGOINW3b/DNrG29eQ8t210jp6ZGISzbIUTU8XeA4sKzBFAFmQGQ?=
 =?us-ascii?Q?OxwPDLR9Q8QbA901tuA42cWTSGGgWVmv/sc6ZIaOG7lDLwkiSCiYFJ4Q+z0d?=
 =?us-ascii?Q?Y9J9B5PL2G6hMahcwh9Pmy/gbtPjb01R8U/qvMYYstncbsmnQam1L5mSxGA4?=
 =?us-ascii?Q?zztLtwgTs/DVVeTN8/bXNlRwB8Ds8O5Ws8XHNDZHAXbQCiIjGHu7L5UorHn5?=
 =?us-ascii?Q?6T2b7g2pFoAOC+W9IU34ctUs8uCphty6JAKyCILT0zTxMGldz62+iZAHDVho?=
 =?us-ascii?Q?xCAieHJr03VNl8mYOfH6HriuVhCmtwu+765/8xTmNaeDvc2uCy/dmBid6FfU?=
 =?us-ascii?Q?sBAFbBTrxN2XhfOjGoIjihnWlo3GlKlKV2HrX9V5pf+Pdavw7HofU2Ut/F4S?=
 =?us-ascii?Q?EfURNX7ORysq6HXUV7MKNOsOoI4ugWfVSphv74LchOUTWP41becDQezOn001?=
 =?us-ascii?Q?0a9HBgbRhWDybz04SsxT1BEW1wPLb3FU6ainhqHhmiqdzMRNx5m29olAdqKk?=
 =?us-ascii?Q?GsROgb0WHw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e598d5-83b9-4e83-d728-08decab4794a
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:02:41.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcTinbiRiHr+FMWGRcJvPR5FKkZ4QC1yIRhcRAWrrYWmUVCP5cWDXrE0OMV5rtzRrqTIBvjE+VpaVTljc1c7rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238822

Use self.config_file and the temporary rootfs arguments for both opkg
update and the noaction install in dummy_install().

Also convert the touched opkg update call away from shell=3DTrue.

Fixes: 7390e72669 ("classes/lib: Start to covert strings to lists...")

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py
index 25d4e3ff2e..344e085217 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -380,18 +380,18 @@ class OpkgPM(OpkgDpkgPM):
         temp_opkg_dir =3D os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
         bb.utils.mkdirhier(temp_opkg_dir)
=20
-        opkg_args =3D ['-f', config_file, '-o', temp_rootfs]
+        opkg_args =3D ['-f', self.config_file, '-o', temp_rootfs]
         opkg_args.extend(shlex.split(self.d.getVar("OPKG_ARGS")))
=20
-        cmd =3D "%s %s update" % (self.opkg_cmd, opkg_args)
+        cmd =3D [self.opkg_cmd] + opkg_args + ['update']
         try:
-            subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=
=3DTrue)
+            subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to update. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.dec=
ode("utf-8")))
=20
         # Dummy installation
-        cmd =3D [self.opkg_cmd] + self.opkg_args + ['--noaction', 'install=
'] + pkgs
+        cmd =3D [self.opkg_cmd] + opkg_args + ['--noaction', 'install'] + =
pkgs
         proc =3D subprocess.run(cmd, capture_output=3DTrue, encoding=3D"ut=
f-8")
         if proc.returncode:
             bb.fatal("Unable to dummy install packages. Command '%s' "

