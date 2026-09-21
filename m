Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B65CC982FA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:07:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7001.1790024810388684263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=O2yAXE1n;
 spf=pass (domain: est.tech, ip: 52.101.72.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axpiob+EB5rGmsXALRTpY40Ef6eVtwFlT/9ymIBW9JoQR2ZKCKkW0Gd5tTzk0aMfCy+DcZXmNlbq3jBAbzx4f9A2V0vENM3QJkZzWclrdANSgqZv7BxDUsP4y7aCIUONcDytoe3siwgKwn/0wM0NVaKElj817DxbwMMZlSHHqqMECDI9rS3wBf69KKo50oY/96YamGofmEMJcGHQy5zdsJkumUD6AW8espMID3u4/2O36XVTEdqISOw2eJcIHne8NSigA7qkyDeKZEXb+Gmssw2eYI9V/0TjZSC82DufTcN4H2woEXlMBevEAVYFklBJ2aH+/dv8izF1WcNTEjDVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfpNsgT0Jfr4HQnLVigE7Gqz70MrXZXkK5VJtzpQa6M=;
 b=tGF6xjIpVKsw1DG88Ieu8uLHW9968y1Kmv9jd+AHahBpYdARL5CExRNc6BfgxDRUj7asX9yzWKtZQ/KoEMYUC4qvDuwPpyUbdNOz8GmL70QNiDxhk5BSX2XV0ZXgH1y3r+tgHak36wHyODEfzBFVxN7E08ZRFzGjhxtMhPUlzAzRV2NaKuq1SIVqywSycJB7QC4PaFpuz2qLp2LMqMavZGeR9cliq6hdp19y7mwqNn1VC82OFOujAfFEuCIZTVgEDz5Ksvf/k3aYDE9iwwHJ8nYUnAqBRNvDf+uRI1tF5cGPTGrPcKFN2mZEDUXWV7t6FZJbArjCYR8Zh3UdSATFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfpNsgT0Jfr4HQnLVigE7Gqz70MrXZXkK5VJtzpQa6M=;
 b=O2yAXE1ngBs1r/5sD0nsu6Sxfk3i5oKTRvnN4u92wwQy4feKoDBSc7C6tnzI4YxY8KZdo3BHFjHiEF26zdxX/fhQG5cC6235Z/PR6DeaAD9ULrogxj8gL9qsbPAUHIFpbLEadmdZrT98j1Bbc1tlUtRKxkz8zw3/egj/LQd1Nnewzkwwx11RaCZImgGEXZ0Vdyr72+lzJHaFLyARhTEmlLZb2szSfORswwKQ5/Lo6sk1pismSjZSLzyFBaNx8ZKP2OYL0uhiEK+s1bgaYU3gRRgG0ybjuqgegnsz7C15fAtIuoyp6pG9EuDIohMt1kB3J2K4fqnReLmjnJsPVtccvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3546.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 21:06:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 21:06:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] systemd musl build fixes and nfs-utils upgrade
Date: Mon, 21 Sep 2026 23:06:41 +0200
Message-ID: <20260921210644.85026-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
References: <20260921104520.47933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3546:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b86322-dbc3-4542-84a7-08df18243e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	/5QCJ9biF9kvUQjMBLmQ1/liXKcwXG3GzFfeqJvjTKFbkex0mjHIoRT4wyFIWqGMBVGWpAUEkyaS4zzHUGyuvNx1mrD4nhKek3ASmjY9Z4cP08C/r0WoPKYrQjrZQZmegSZHJ2R+4tu1tkbOOWDryqyp7bpZZLyVA3H7u0zZgXJQpa8Ptaek1xdZK+U37z01BNQtXqJ6hR8+4se1rfghQJgH8hnRXcRYnUXNqCdSdHbEmybq8dbdBpSbcdRdc0l4kwKV6C6EIGT4z760p8nfmg4ol9z4Y7/lEypqTXmzzu6pJ74mztUHR/zQM20zK6v7+EW7ZvZwqBotdJRh6PU0/RqRAP27r59nfkfI6LsKziGexS9MANgH7nvJPg0gfH5f4OFelHyaPCo1lLAYEboORT3ukVF2Pp37sCiyQ+lrMFqM3Ms+8Ty1nY6CKDtmYo7nVqTePrEL7srnkOhQFUkuhorkHbhUvxfql1gBddftaCTFl63oRiiW0QY31+iWiF031Y7RyW9bCg4k72u7JmrM9BB+idcyZf/TRX06VA/9RsogiV6vwE24BibRn+A1qjXp/jQujbgK6UnyzbTDMAitA6uVxDojIB7q6u6ZP7kVQJgjGA2YiLu+TnEihVeOlaHgQWULNZFThGDAXoH82//qOxr0Y8KtBgPXXlAlesYkvqs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VvHU9rudM44KQF+nPsXAVVkDuw8VIsGzwy8In19fOs1l1epUXforvplJC5e4?=
 =?us-ascii?Q?O0BrinWLNPt4qgCZzW0LLZHoxBuaipFWG0r/FxoWs0FlHux7ROoxOJ3Yvz41?=
 =?us-ascii?Q?PyP9rWsIDhOHFGumLtPWSpiFhdD6aQffxkNIIkiaM+652wsa4R5wkawd7POh?=
 =?us-ascii?Q?ZLYwcvoe7K0dWFf9Z7ZH3S5xK3f9DZlZ6GiqPWzeYWeoaJmo7EZMDD/HgswL?=
 =?us-ascii?Q?terxMyejyIWVN1I48zp68J1EzY/uiWgT9n5tPKRyQ4fdXEbgbObaLmkBhen6?=
 =?us-ascii?Q?L+rri8HOP3XvElC5jxKiDohJO0jp1P1N1nAaKuqwzEct61FiU70UfEV+3BhV?=
 =?us-ascii?Q?88l+M/ohgtZF0ySqBKbbGEprhsg1SGpTFx1fUDPGOgjrTW1g6mKrIPlOjK3X?=
 =?us-ascii?Q?88gBLZRGXt8OPJvMizFVz7sKlmuylxMDV4HXm2bCXrlw7xJgeJeGR4QTVjo2?=
 =?us-ascii?Q?9KGIqx+RqCunYimfwyzyuHTfbyuHxL1pU8+lnBc2WKF38bNLlaFsol3l+Wp2?=
 =?us-ascii?Q?9zeOMeka+LVRXuNMWz9nn62FdZ8wwdil41zg7sA1inow85jLHhufrQdIkyub?=
 =?us-ascii?Q?DZaFgUSh0YC8uzVcBN/o652lYWf+I5ZiTTGxcTYD4ec3ICo78UH5MLAWFUWH?=
 =?us-ascii?Q?7cmSjye9QDpbL4dDKlP/tjt51TEajllyluWczSXoCWfkCe4d1gNbDu/+ls2q?=
 =?us-ascii?Q?Q+QZQMTrtZp/9cgPn1ITgmThZHF2TLBSfuAINPvKFUnSuWZi6UW3yjNI1vfg?=
 =?us-ascii?Q?UsmQh2cLDEE7Kx/gF2eHOZtCxESRv6OOK8OsBE5lYzQ5KfcZ5P3EQgpAByN7?=
 =?us-ascii?Q?g2rCZcT12Lp46cCKxPJH7wjYJj+4daf+qUnKjPPV4SA/6dIZ8lywAw85afUg?=
 =?us-ascii?Q?qfNzgtcvBgt2N2ihpCoCX2SPXMBs/R6xL5aHsj6xXIh1IkP/7KXUg40lKQUb?=
 =?us-ascii?Q?VrWXkUE+IGyHn1fOMk4yV3VyuDsOxLcfC3Ue0fYhLsZ8hZ6kQZmhryv2FZYu?=
 =?us-ascii?Q?ej+T+dyxztmU19DV+qoIF4gQD+feHxNEBEwviYtNCO8qdfEtu4TYVek+y89n?=
 =?us-ascii?Q?NwT9nDQgC54KEM5BXAbaWflg92JLW5ZdOs1LNz7QoXhmj3s6uNVWPbXopCRU?=
 =?us-ascii?Q?vRUYSXX1TMbhSA7VcSl1ZjoWbw2ZyN4/yrc/OWwDL17OOmH/gODCpxCWzF4H?=
 =?us-ascii?Q?9HCkjHyf48/mDxxbt0xxlMLoH+q2X6UwkhI9/zO4aRnnrSTA6ISTHZVXMEbV?=
 =?us-ascii?Q?TvQP3KK3JvhRXLHauKnDPyaqBs1wWq7Ym/LOjlYmPMBI0TL6HiMxfSdzZuq4?=
 =?us-ascii?Q?/4rHEPXwngZy2dJIs6gsF7GTeZa+D9X1ox0wPEfR38M7/auSqE4pOYJdXzB7?=
 =?us-ascii?Q?XH5o0w+898qznSNkv044wZVYIGSr7TJhhOdzRmrGPSHs/tO3D5VH89UCuXX1?=
 =?us-ascii?Q?fTeH+lHy/DWX4DN92Ju5nKi5V3MElsqa99raoBRv4ujUumwvSlPEKQx9wze6?=
 =?us-ascii?Q?mge/ph36tWHw15b6rRxFMP8vWuL0g5byxc78Q0rCJJJLTMxFhmaVFT6Op44w?=
 =?us-ascii?Q?rXlsdG4RzwY9ZukP0vT/DViSy4L2S5BZy43adT3AcyxlUatLe+xTwU2nnCC5?=
 =?us-ascii?Q?36JpenYJt+ajEjF9Q807V+zxBE1+b3mFW3FvwGAn+TWBTepQYEzkAPfnM+SU?=
 =?us-ascii?Q?jW2DYuqwck948L+ViedYRAW2+lW4ol675/Z4wTiAiKOM5nNSMldLjCjqICUf?=
 =?us-ascii?Q?XM1F3kwrArCOk5DJOALbtHQvaUPi4tA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b86322-dbc3-4542-84a7-08df18243e72
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:06:45.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN/QMDMoYhbViCTyU9PzPZER1YW1L9JbFjRAIcTL7CqiqpTSMwhRdXJ1KftkYimq4w4Fe73YDw2qXX9PWe2LUEHis8+ybFhHgE7gXn8W9Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246358

Two systemd fixes needed for musl builds, plus the nfs-utils 3.1.1 upgrade.

Changes in v2:
 - 0001: use the upstream fix from systemd PR #43831 (more accurate).
 - 0002: reword the commit message and shorten the inline comment.
 - 0003: no change since v1.

Jaipaul Cheernam (3):
  systemd: fix musl build by fixing limits.h override
  systemd: dlopen-deps: only warn for missing required providers
  nfs-utils: upgrade 2.9.2 -> 3.1.1

 ...tport-fix-missing-stddef.h-inclusion.patch | 27 -----------
 .../0004-Use-nogroup-for-nobody-group.patch   |  4 +-
 .../0005-find-OE-provided-Kerberos.patch      |  2 +-
 ...e-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch | 47 -------------------
 ...{nfs-utils_2.9.2.bb =3D> nfs-utils_3.1.1.bb} |  4 +-
 meta/recipes-core/systemd/dlopen-deps.inc     |  8 +++-
 .../0001-include-fix-limits.h-override.patch  | 47 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_261.3.bb    |  2 +
 8 files changed, 60 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-getp=
ort-fix-missing-stddef.h-inclusion.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-conf=
igure.ac-gate-HAVE_NFSD_NETLINK-on-enable-nfsdct.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.9.2.bb =3D> nfs-ut=
ils_3.1.1.bb} (96%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-include-fix-limi=
ts.h-override.patch


