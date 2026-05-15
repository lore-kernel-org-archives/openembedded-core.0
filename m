Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B56CD4F3D
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:36:31 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31466.1778837783378980676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=qwki/t0R;
 spf=pass (domain: aspeedtech.com, ip: 40.107.75.139, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISVPX0lRuXIewmKiF4uZmRhJdEyZ4QWYv7ZQCkJRVSzmr67hEGmt+QfihGb/mVCPOJYWmTqtqmA9Q7BKBPZUYJ22AJBMSXxgqv8I3FXaM/8O6UACYFrnJcZ3ClVUu5RUkuJE/iBGN1r8KBkkLVkZ2g0fJcn/LM/FoVTisc8cRUKE1n/rthOmt150lDqR2c3fpmJrzGizCfv2m60qKBz/ybW5RK+Adu7GrgTsB6fYX1CmW40pJ4Hwp5640gJX1QNw1EKf0HINteVBP7QFGIHlFs8L/u7S7/pqTm+mWgktuCDZ76eRJnyfMhU0FO38D2CRxgAb8spMZ6fu/xcI5Tym3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YFqrcftQ/LTglyanWhUBZh+2YctKn3vF2JW/T4C1/0=;
 b=mycUhcs64m/JOPVhEtwWpnVGpTYZCsaa4YlX/zjezM4fPR63IQ6cEa+gHzUr0eRReeHcU18Ll13muNhFmX4EuQ6ccQ/kDC4Lj718qFaW/vvG1BuI+A5zBFtPD4qjIN2QqvHvpItxBQ/6cSr/YeXq+Qww9ZWHhOwe6MThKUTUUa7iGySGiSoI9lLcEkRHSN1TOgtearzv2DbP79a+hhCA5lYoUfOfGMN2Z5LzGBhs9552Rl/cC+7q8H7KQpLafFiMG94mtOAsO4kB3cfXZP2Q8mCGxXWZUZ4H0svX+Ht6TSV5kafErUplct/EW2S5FEdKVG764YEKC6MJlWsUEl5ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YFqrcftQ/LTglyanWhUBZh+2YctKn3vF2JW/T4C1/0=;
 b=qwki/t0R8cGaon5HA+9vR7aUGHNOwO11lCj0Znoiglzoxr+Puk4RGStQvLiZl5uLbUp4UY/AUSnYGxZiagLDnM6smlfUoXQ/dVz2JatC1fTLc7OWIFIwQbkhKmXE6Pkp8ILEARJtsF4ZA9/8Ywckc0NHn2lRnlXBzc0wRjtWDVg9ZbhNmwN3iKFxgq5yqoaQxmF/wE2CAv+vsmwy3a04EseL78RP40AJhH8mXmPqEuywmD+MRC/wSGd+03w8k31vVT/stO/FuCFae6RjFlkkmzKxlqXoK+l6s05atCnnnETI5UEdE1v72o6yBD8N5MGzMHkaSTz0VM3t2FtJxCGcyQ==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB5176.apcprd06.prod.outlook.com (2603:1096:101:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 09:36:19 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:36:19 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v1 2/2] reproducible: Handle nested git repos in
 find_git_repositories
Thread-Topic: [PATCH v1 2/2] reproducible: Handle nested git repos in
 find_git_repositories
Thread-Index: AQHc5E5In7BDLOC0IUm885t9QnghXQ==
Date: Fri, 15 May 2026 09:36:19 +0000
Message-ID: <20260515093615.126849-3-jamin_lin@aspeedtech.com>
References: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB5176:EE_
x-ms-office365-filtering-correlation-id: c7ce0e05-f874-47cf-c9e7-08deb2656b37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021|3023799003;
x-microsoft-antispam-message-info: 
 LsGzpIJ2QZjp3luf8NlpH/18pa96OJVw/RUOYDqTFzg9MA1tYz+H5bIVL0ZLoQ+oRbsyRQnAdx4BgOVz7nkrDoksalNk+lIQuCwAvoQ8LUDTwI+HRFx29cN2QZDwemhJtNWPq/C2ByfmmDy9KgVMfHCZ2tzdtoozQ94ncsl9qZvmEw6RMtz7h2Yp2d2DAsChMxBAo1oZezN9nBmy1o+p5h9IQawaskOgjTIxIJHf10y7NpAzZ5xGsmpr3wcU3JAqrBitbnwSVIoRvtNh9NblN3Wsmy22zG4HuaNLHW6jsW7xo46BVfYIOwh/21OT8kMkjxh1vFkoCB6KZAvC9qiPO4lTGkjMx8H6kqSbnYYjALMLlIcJR8T0cLsa14ykk1w9GYbqPfqfLFqBUcKlBngli6nbary/dEP6BJDArjEmbCyDmBNylGfPT8ocuSqF/t0FIp7To3eeOMIt4l5Umfp7GCxqEREiEd9kFcC6wNQdEUMEjGpwwEDU3xKyS1vPoWYyX5thpfQF3STfaQ7HIx5kmwgGXKjUc0fbLj33GNSaxv2IMoolBr3QzwjOsM06PclsYsJCqZbRI75HyOUfCEXB+7g9jCmIOd8in6oqAhI9vlqvivga1ZS254AWLVqGg+dLdn1hEJBYn+W0iBrfBZvlaywC88rhlgvfaEA3Z/w8RbSYM/N4W9m/WwoBQez9vhPKNXuP4ljKe4HPXvMCwGBwYed9vL6ZMBj3Xy2rRotRlF+woEY6YBfFOkCVBdfHgEoY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(3023799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TM4Qv4WOZIARcFYkk2g+6riMGlcXxKW4VvtbAdIB5ojju48sF5QjVXB/WW0Q?=
 =?us-ascii?Q?58HAPk3yJITJx0TqHPC5IkPkBa80fNSlnzZHm+FhtOfsOCrs/Xr8u0e5OFB6?=
 =?us-ascii?Q?PS5h+RzlL+LYNLb/4efo7kUPEmIu65aL6NEb6rW/7d+9knA5KGVldnhxcP3o?=
 =?us-ascii?Q?l7J+5Wdpp9v27ueahkKSk7RGs3C55SkDBFPf3ZpEo5P7Sd0v/GVnK6XOgtSn?=
 =?us-ascii?Q?U2n9/Sh2kIDgQ+oJfkFodpvUBOj7hqNg7b/aKgLQPi6rfjofTIE9HtFkz7zS?=
 =?us-ascii?Q?US3xTzXUmLSx9mo6mNEawjgK15RsK6glU4wJe+MZbBqQRB1gcFnxCapENP12?=
 =?us-ascii?Q?Q/tBxz82RRtaUG12pdGfr1qMqPtl14TyFkeyMFCpJqzbmiLydTYGuVjVsl8V?=
 =?us-ascii?Q?v1rPWdGJz2LsI/BeqRlQ+/s9Pfq9d96ytBAO6c9faW63475sEfNexiMeGHVW?=
 =?us-ascii?Q?G3TveUff68s2+tAJKeHK4n0KdNiuTVDsXRCOsePR9dW6EO+/ydsTIQ6zdPrn?=
 =?us-ascii?Q?fajBAlMkv1N7y+jVY/Hpzw8BmNDbrfT+nTUoKUo6XzPrAtu1Pe2V6Zi61POj?=
 =?us-ascii?Q?SLi2FLPca3Bl7BHQpXaZISgEA+eL4XesAxRdWqP6jVkAVgcKjnbVoikpqYKi?=
 =?us-ascii?Q?mPdCxuwJWVTQg40Iq+Gzs7UBwvdHRg0SYH401iJIkvfKb/nEHMoNByJ0XuZv?=
 =?us-ascii?Q?KF3Qg3jOoGj4K9McWtOTM4OTG0Rv2JzVH3G94ypspQ0zko+LATeavpfNKK2M?=
 =?us-ascii?Q?KlU82YLp4LrcZF+JgYIw1dtbcJauojvJVJUj2/PBEpV/idmKGEkfuWiwD76w?=
 =?us-ascii?Q?vszTdaFCoXIUpkS1M3YvYwHNSpsCrzVXcjJ7UWdQt4afIdxI2xyB7z8NbiNt?=
 =?us-ascii?Q?i3WbN9hstSV175LKvzDu5jr707waF4n3t/z2LKHNMRAJ21qamW+jk7fno602?=
 =?us-ascii?Q?5LuT1MNDyYOk62i/JP6BvRYpfr//3uWGbDb4nqBtOAe1pUAgD10K332YzG4q?=
 =?us-ascii?Q?vLB+EvAG2XjQ9PtcXJLeDyNGGpYewCCDAlO/3JnaI8Hiqks3+Jl9tm3cITJF?=
 =?us-ascii?Q?9KFnihL60dDHd+O3vKqX3zB7TQStr7E7n/EA0RQrrZzluQQ0J7MUuz1rGDsp?=
 =?us-ascii?Q?nLEd1Rs7IOlO5YbmKUDILxtfGaSlm6x2RoCflqYR9/DJXIaA6xhjFnktEyo+?=
 =?us-ascii?Q?cyo5XC8f/Ejbi9yqMiLGyYiQXOhLd3BjPpEKFJ9oVEW56D3n8L+PbhCdfFRV?=
 =?us-ascii?Q?1SquO7ra3j1UptafcdLgGWt9aqFGeOYht1dM8HQEMDnx5+Pit19ss08qQvHL?=
 =?us-ascii?Q?O7fdqcV1MAITzTsuuvPhcWG8QexUfXhetJjaGpDPHzah7EgTMc9cz2auiG9Z?=
 =?us-ascii?Q?e936sunwOsjHPGnOpcWOjjeYQzP9tY23wL8KhlP0qwZmUGicsZcKQTNUYirm?=
 =?us-ascii?Q?SdTHjZ617wsHpWO3u8rSEhTjIBl+f3Gzfln9h6StZqpZ5+m4dPxq8jq5oKic?=
 =?us-ascii?Q?mSy4uVXtny7y7KebZnSDIJcBbk+gxRLSE3aVJtLqWcTAXnR9Io5ocqq1TX74?=
 =?us-ascii?Q?zg21yjQMSJPdNY0vy87cRF6EfUD2i6VKPz3/xJ8Dgnxcnym3MMsl5QJ7ZrES?=
 =?us-ascii?Q?jhivDOKuVjBMRt0ndxtqsgE4Ea40E5Z3gdl2clPMJddCy+qtXTEK3cVHQQEc?=
 =?us-ascii?Q?YCc1UOoR/h5Ps+c8edvWatUK1HjvhksR3GHN7fEZaZSkcfhkmhHcgjkJrWdK?=
 =?us-ascii?Q?ocdeBn9txA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ce0e05-f874-47cf-c9e7-08deb2656b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:36:19.2289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X38+vsB/7UhtYZymI0IcUGdPbWi++ce3z6a1DCypPhJADTeOlN39QULI2r6wZP8sgit8a2ANCUPbE6dLtlF9wM9fFDTpFyDrWGhS/hTjhNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237075

When EXTERNALSRC contains multiple nested git repositories (from=0A=
multiple SRC_URI git entries with different destsuffix values),=0A=
find_git_repositories() walks into sub-repos and=0A=
get_source_date_epoch_from_git() subsequently fails with exit code 128=0A=
when running 'git log -1' inside them.=0A=
=0A=
Two fixes:=0A=
- Stop os.walk recursion when a .git entry is found (dirs[:] =3D []) to=0A=
  avoid descending into nested repos.=0A=
- Change 'git log -1' from check=3DTrue to check=3DFalse with explicit=0A=
  error handling, so a failing nested repo is skipped gracefully=0A=
  instead of raising CalledProcessError and aborting do_unpack.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oe/reproducible.py | 6 +++++-=0A=
 1 file changed, 5 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py=0A=
index a80376010a..6bb25da55a 100644=0A=
--- a/meta/lib/oe/reproducible.py=0A=
+++ b/meta/lib/oe/reproducible.py=0A=
@@ -82,6 +82,7 @@ def find_git_repositories(d, sourcedir):=0A=
         for root, dirs, files in os.walk(mainpath, topdown=3DTrue):=0A=
             if '.git' in dirs or '.git' in files:=0A=
                 git_repositories.append(root)=0A=
+                dirs[:] =3D []  # don't recurse into nested git repos (mul=
tiple SRC_URI destsuffix)=0A=
 =0A=
     if not git_repositories:=0A=
         bb.warn('Failed to find any git repositories in UNPACKDIR or S')=
=0A=
@@ -105,7 +106,10 @@ def get_source_date_epoch_from_git(d, sourcedir):=0A=
 =0A=
         bb.debug(1, "git repository: %s" % repo_path)=0A=
         p =3D subprocess.run(['git', '-C', repo_path, 'log', '-1', '--pret=
ty=3D%ct'],=0A=
-                           check=3DTrue, stdout=3Dsubprocess.PIPE)=0A=
+                           check=3DFalse, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT)=0A=
+        if p.returncode !=3D 0:=0A=
+            bb.debug(1, "git log failed for %s (exit %d): %s" % (repo_path=
, p.returncode, p.stdout.decode('utf-8')))=0A=
+            continue=0A=
         source_dates.append(int(p.stdout.decode('utf-8')))=0A=
 =0A=
     if source_dates:=0A=
-- =0A=
2.43.0=0A=

