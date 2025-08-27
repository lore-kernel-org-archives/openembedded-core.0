Return-Path: <r.gruenert@pironex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311B7C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 06:50:20 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.105])
 by mx.groups.io with SMTP id smtpd.web10.9183.1756277414737811059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 23:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pironexGmbH.onmicrosoft.com header.s=selector2-pironexGmbH-onmicrosoft-com header.b=rnkZEzc/;
 spf=pass (domain: pironex.com, ip: 40.107.159.105, mailfrom: r.gruenert@pironex.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEtjjM2fChX2AonyYtKvg4ZTWu2OcTKcSc2BgB+EuARXRxJLqjA3utyH52hdX0m9yk+Uc2ovT+Ws6Rkia3L9xIyIsFZOBkJsqIOLVJPPatLP/S/5PWhHiSGnZdizo6IVPi5AT+Zhjza8suTAiyvnPzOyRDDQT8zG4m8vLEaxwr26znX6BeMZCdH+Ca4AcPWOE2F0M0D6X9Ay6hRfaRA3Bjx9d9wSQ9JNdf9pOlv8qxFw5TAe626PfGUmLridZ5OlxNqyk0QimTUT0Tg/MxD2RevjxL41N2t8BMjY/LjLQypKPBsR+8Ivk9WUzhvjSG2metJ4qznqUhWAgQSzo+QEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWeMXqCkvVYl1G1PZAjv8Ks0YdVCwv2uLLP6jQsYwAY=;
 b=kCGrxipWljrDstsBFyWwTpkCRXFa9AsnCfX7HF+HXbGgzrONVD8TdSQnDVP7xgZD39g/RGTJhK8mzTdyW8iHVOR/KM92lsdemYfcRnkcQDgFY8wRIB1eivwcrAjkxs0QNxLpupzfCV26gOQkcTW5HRZRposWAr36GNStnywaXkCpfUQANkmexkpbk/cRCoJVNS30vMWzyC0oJgcdZZp+9LbheDzh0w5+Oa0Wnw8q6PSbC3yOEscmeTaK8bhpyt7M1Jzq+t0GZ9RSfE5HcFnR27lHOMce1+vxUqcxMWoP5+4E4vLYFGfFDguTsV+nu/ZoTzVpiRik5y4ATZPGj+sMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pironex.com; dmarc=pass action=none header.from=pironex.com;
 dkim=pass header.d=pironex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pironexGmbH.onmicrosoft.com; s=selector2-pironexGmbH-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWeMXqCkvVYl1G1PZAjv8Ks0YdVCwv2uLLP6jQsYwAY=;
 b=rnkZEzc/3IOj42JKTSS1Mi3Rf20BTJGHBwV/ri175n6BVeiY0JqilX4Xu7iHfx+SFpjWa1MmWu+gamBmlVYTp2qXIKVhsWj4nqjnCgrd4RsZVpwOMDay8O+7SjRSrHMFgRWOtkDM4zkPULp3Z/BnfFUhSIjfArjHSeoEAyYlmms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pironex.com;
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:415::15)
 by AS8PR10MB7731.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:629::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 06:50:07 +0000
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b]) by DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 06:50:06 +0000
From: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v4] scripts/runqemu: raise an error when bitbake was not found
Date: Wed, 27 Aug 2025 08:49:40 +0200
Message-ID: <20250827064940.16074-1-r.gruenert@pironex.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:415::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6954:EE_|AS8PR10MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5326e6-0324-46f2-4637-08dde535f4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X+npTpi4P4e4b+fq6MoxS1qQlMR1YttfYCNFVbp7h2KaSEfG908LLZyLzRvO?=
 =?us-ascii?Q?lsE6LngDllzLiOE5Uf7ZttR4kbGG3hZYdhgf9JU5ngeXW93oxWZQGB0Rr+kT?=
 =?us-ascii?Q?qaDHxcE26sMXgbcrVuA6ScSUUj8tZtG4k+ZFctMuhzjESO8MtK/FjaByjDoo?=
 =?us-ascii?Q?6i0gLehIBYGdjI8nKSmusPI8IeukX81dSaum+bkyLAFyX9NyBDd3JiCnb9dN?=
 =?us-ascii?Q?IzvxbsG36FjPPxi20iQIK6K9IZjiG7CzGTdyyHss2bPpRVCYCSvY7kzDdnWI?=
 =?us-ascii?Q?Kn6MpGRQePaXVga4iWJxrVjMdTtKRYFyQ9SbOaaMfCz6Y0Ch4AZrkD9ZteGa?=
 =?us-ascii?Q?ymLjkLnrr69Zi3i0lAoWMkrolS2B2XeIJNQfU4RfUyhBMo2AzyEBUNX0IBWH?=
 =?us-ascii?Q?W1ipWQB+IzqcDc9a1MkBh7Vh2Jc1XERl/RfWwtdVjifWvTG/7uA3QGapEob0?=
 =?us-ascii?Q?exzs6nTtDPV/x3uUyI20UUNnVYHN8N81O9HTMbXC20UW4yr9Qedz9ZjhQ9vJ?=
 =?us-ascii?Q?LQ6LcxwEPf5hH3rEZEMWCWkRC/OqA54NPTBa+/iizyHARb9cdhz1GzZ54Kl2?=
 =?us-ascii?Q?YW+Ugyyq3m+ZNEP8X6Ag8o8wbwPa2c4pCi3hyc+TN4GDMmSh+k8l3ZnpAWUd?=
 =?us-ascii?Q?t/IxSpBGNPMgHjzA5XSnK7+XYQAPjndwDH9HWJ3lFp+kgNP4Y+nJaNKhjZpD?=
 =?us-ascii?Q?y444g0bzrrLB4uGMF/TfzMjZLuPCZBZd23MWrgWpIvauO9rdsPoks4NHU0BQ?=
 =?us-ascii?Q?BI7fNVeJISb/9JeOT/yAX8JE3TTJzf1Fh8UW/ZF6+y/10VUSY1VckUwG2doG?=
 =?us-ascii?Q?H2D8udhYveH00Exl9p/TytmdxH3Ceff9lN97e9ObCDdI8HxXs/DShZ4Brx7J?=
 =?us-ascii?Q?2fXt6EugEo3gCxMh/HJ/r7MsDJhIc2TB6XdnV/ywH+qP1YyQsjFfzOPM24lG?=
 =?us-ascii?Q?/kqMmpKiNT13TuOyHBfjTkDaV/oMNIp4S90Ewc0yJHRxulTAc50hpahhflek?=
 =?us-ascii?Q?fFZUFtREXqHM+3B0sXFYoAHzb1W83GIEoWs0GalxOrDavqDqayHQoEaQo2Zi?=
 =?us-ascii?Q?ksGmjv6YtlWXipnOytu1Hdl+6AI2zm9tZK95GW22tGv69xiZbDlM3Gphcoqk?=
 =?us-ascii?Q?v7Kt2wI26GLAQXE6g1DCHgG66+428vVN0pHFRY9UYCy1gBiSpoMcf94JU81o?=
 =?us-ascii?Q?E1QeEaOv1y3QHmWzBxvtSFj4uB+2xDGN1GCDtq71L1XU9lRJ0eNg8M9y5aBB?=
 =?us-ascii?Q?WtqFXT8hUSoB7hVWx9WQBygiRCs8+xjwfzk17TElgakAJFF9ojwtZPuP9G2u?=
 =?us-ascii?Q?vH9G46Iy2bbMmOqZNurrNutlyO4b0VaweITH86K39bylHrYxxdk8PhzB//ip?=
 =?us-ascii?Q?G+72wrpU/njYUVaywZxYWWC+8m2jkD3rlY7VdmBKp9IBynS4wGw9pfDb0Mnc?=
 =?us-ascii?Q?m+tkAEFBvfw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vYFLxhCb+/iNgtnM9tWVkKPtSoq4WwdmeK6OngK93pjjygAZd3OyhjvX7Nnh?=
 =?us-ascii?Q?xODeUwZf1kuNOk+V62GS29Q1lisSy5SXYDCbzUKaXlw3eaq3VtUz+933xSRJ?=
 =?us-ascii?Q?+bOXkRMi1D6w5PJK8/9SgXeLgHJAhzxmuB2X5CqgQpVwGnZL3+QQtPhH55rc?=
 =?us-ascii?Q?YnbnFmu1Ko2DcZyz6iPGpuXi6YFbkaB/hIit1E1qXxBGoPweNbmMuxj2MlVr?=
 =?us-ascii?Q?ph37emmGMTtUybqj4+8R2SUtZGpL6m8pKb1CEmz2+QoZp1hyVfurpnl8GBJ1?=
 =?us-ascii?Q?JnrbZy/sbIwmBunF+L8jUaWghv7xdmid0EI2trm9A+z4bcUqipubcAW9nkE0?=
 =?us-ascii?Q?rgHeYNIVqP0K6LZaHMtvBwlCGGLNFgEpNRhTrD9vLjMbDBuBdnQFHrC2zRmc?=
 =?us-ascii?Q?hNdE08FLK5KwGQ8IZ+otA4clV+f8w01kiNt9Uhy3F/W1bUIsCsW+tG6RxCkB?=
 =?us-ascii?Q?oI64p3BDDOf6/onaWiLgw7Wl58A0KuSXfpz7bXoKIFh8OtE7Z4E7jEg9k76L?=
 =?us-ascii?Q?6kbPlypRyAwpN+83lipEzvt9sMt9Rh4MW9zFFvXhbamPTkIDdF21ZYNQfxou?=
 =?us-ascii?Q?2ytfu9Dcouf9/RdqZhvKkgeJIB59pV91vND/MjSQ+z1p/EQAfyBmL4LKyfzs?=
 =?us-ascii?Q?kg/tlGXlm6J8iTObrxOaEfGhOjyH+T4/SyVWhCYsldkYpwNQDgp76wz5u5RK?=
 =?us-ascii?Q?kIMKzDIx3HipJ+WwEl7KNEux32gVQuxhFEBl2fG7MBU6eDpvlhSheAiO2Jkl?=
 =?us-ascii?Q?B5Ar/CTsg/S+NVURTtl+lcm9DQ2pDiiEHBshdlkjsNZdQ2UHydo/ATq28LMG?=
 =?us-ascii?Q?LGq+2rWLPFst7PCgMP3tqDixaiBTi7+4WJGYjtXs9Q1IuWuwpRQ7CrevAc3/?=
 =?us-ascii?Q?psTrWh9Qs5E4pDDPoe+WlEVV/PmH9iTgdVfj0jmctVYB6ucb3uVRACFIW0jT?=
 =?us-ascii?Q?oUC1wPPMKO9LMeH9Yya9yruyMeyemPQRmw2FqDw302jq/sL37TpNH0vBWOaE?=
 =?us-ascii?Q?MXR6B0sm0WM3QFNlWf6r9tXHVXcr8EBtAgSY5+LRuDABB7ZcLAQzDLj/ZU3E?=
 =?us-ascii?Q?CAL9qmTqLNWk6vQoxrDrYpe55dPHjbk5VtECToZdu3pkabklSqasbBqItE0q?=
 =?us-ascii?Q?t1MsFP8VQJaWUza9NKjrEdQY+5QI7BTFpe9fUujUwbabBcOI9KUpOZ50TAAs?=
 =?us-ascii?Q?IhprbwQOpUpbw9oGpu7fC0SQLJ+JsKdSM3/OzUNfNz8PQS/DGs2XADo8boP6?=
 =?us-ascii?Q?lYApW0zev7LixHW9veZp5h5DJT2TXsoxpxFJdWDkgcNBYgUb/2d1otFtZivB?=
 =?us-ascii?Q?g9H6iq9qxU4yQdbj2hRAjzLnYJ1tQ46gAUUEJiWy4sZa59SNpeqWD8J/DObO?=
 =?us-ascii?Q?187gN7DCT7Md/i/4O0fZOMj6rUxMcIgL/EATGZXbm6dSwNt8NAam7WI4Y8Vb?=
 =?us-ascii?Q?C6kOclL4sf94KvGGJjMAgYMoJSni2BXmXzOqPJ7uEpeXmJf+6huqcY76WIJn?=
 =?us-ascii?Q?FgAY7RW8+GdF+noG6CL/1OASP86qVcrnob1AVVe/WvezMtsQFCNXM5o3nwL7?=
 =?us-ascii?Q?SHczwzLgo1sH73K5iztAWSr7hd8CVkUEpQUFk3hqjeTixsoUrThQZI1Dxini?=
 =?us-ascii?Q?fPPo9VTD6atD/npt9NfF6boBnAUJJH05VoTTCzeirbkA?=
X-OriginatorOrg: pironex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5326e6-0324-46f2-4637-08dde535f4c3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 06:50:06.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00aa8e52-eebe-489a-8263-3195e0a468ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fWftHER2ivuatJj3yGCrb511yPdzwFNEsq0YxRaWfoTjw53FDZ2T81ITQn/nL1871RbQ/QLCS/O05Kwq5nyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 06:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222496

Running 'scrupts/runqemu' without bitbake in PATH causes the
following error:

```
Traceback (most recent call last):
  File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 1807, in main
    config.check_args()
    ~~~~~~~~~~~~~~~~~^^
  File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 624, in check_arg=
s
    s =3D re.search('^DEPLOY_DIR_IMAGE=3D"(.*)"', self.bitbake_e, re.M)
  File "/usr/lib/python3.13/re/__init__.py", line 177, in search
    return _compile(pattern, flags).search(string)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
TypeError: expected string or bytes-like object, got 'NoneType'
```

This patch adds a more helpful error message to inform the user that
bitbake was not found, e.g. because oe-init-build-env was not sourced.

This is an example of the new error message after the patch:

```
runqemu - ERROR - In order for this script to dynamically infer paths
 kernels or filesystem images, you either need bitbake in your PATH
 or to source oe-init-build-env before running this script.

 Dynamic path inference can be avoided by passing a *.qemuboot.conf to
 runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`

 Bitbake is needed to run 'bitbake -e', but it is not found in PATH. Please=
 source the bitbake build environment.
```

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
---
changes in v4:
Changed commit message and error message string according
to suggestions by Alexander Kanavin.

changes in v3:
Messed up the CC tag :)

changes in v2:
Changed the position according to suggestion by Alexander Kanavin.
I also changed the error to OEPathError as this seems to be made for
this exact situation.
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c24528eac8..69872f6de8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1713,9 +1713,6 @@ to your build configuration.
         self.cleaned =3D True
=20
     def run_bitbake_env(self, mach=3DNone, target=3D''):
-        bitbake =3D shutil.which('bitbake')
-        if not bitbake:
-            return
=20
         if not mach:
             mach =3D self.get('MACHINE')
@@ -1732,6 +1729,10 @@ to your build configuration.
         else:
             cmd =3D 'bitbake -e %s %s' % (multiconfig, target)
=20
+        bitbake =3D shutil.which('bitbake')
+        if not bitbake:
+            raise OEPathError("Bitbake is needed to run '%s', but it is no=
t found in PATH. Please source the bitbake build environment." % cmd.strip(=
))
+
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=3DTrue).decode('utf-=
8')

