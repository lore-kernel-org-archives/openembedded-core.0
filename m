Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021F7CC6B19
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:52:48 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7094.1791957167552091418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 22:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xK0vDmBd;
 spf=pass (domain: est.tech, ip: 52.101.83.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL8G7c+kDazOCtZlTqdePWkMEDLec6xE2/owRuXC4icLtBYaA3ostT6t4azyUgq53AUlcBvWElvd+0HeIqN//btidB4K7h+a7u2YagZnNbImVoRNMc5wtCOzFB2eAq9s97WjRhSbABg9mgZ1A31IR2EpGyeiF8+ZbSlaN+nFxBDhZYdyivI5cN0hIb/dzX8ow9t/VVdhjWXsbcHPEMbUNNe9epdsxvVj0x1Ao4VOd1GIHOd5pQNtcFjTLHPyOMzefTtjd8tS/79My6DqUY9jFdrphmefNYKqccn5KgQ94Y/bYfCAjays/sJHO6EE85wWVwnb1gG9ki1/TtyDyXY6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMgyrUY0y2V9/KBySGGwhDdkZyVM7K+UlVX4ElN1Ijk=;
 b=t91HfjUJue4wulKRg7y6v7UGcYgpjd0AgZ3hYgkAN+DGqigazJQjeGHbYexu2NZ+TxnpGN9uOhFmZXc496BWZ0orBmPiw3oWT9nUsi6Wwx+BHFjslxqNPEKAGvdKNWjmO6YSyeLgHNct38KWTdbivHXKS6dwzFiYMuVkL8tpQHK2cg8wkmnC6Sj0fbmxBmA60Abw+5q7yJqFozupfEq6exDY/vvl9Ay1z58vhhxNJoN6sVNAkjxCX5Lvg3vHr0DY6/Y/zqwExfu34Lpym6iHEByUYBiY7Dr2DaZq/9DMCeE/2QnnPFE/FRTBg0way32L39NRUBEbfxS6if7lAtQL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMgyrUY0y2V9/KBySGGwhDdkZyVM7K+UlVX4ElN1Ijk=;
 b=xK0vDmBdLX6sTUQMOhf7O+/DvCMxDLgc8uaN2+3A8jWsXNmplDlIg00ak0JReM9kZb3aFzk4FVhImHIRcYalhYKEfwqezcAQQ+xxLmnNI7uZX8w8slmJtt5BRU078uThwMJt3Xdm3AhiSMedARhHZLAtkJcaSIaqN7nBTeDJs4Y9lYBMGWIsKfCwkEjitlxXUGewYg9/XgkHzeIMu/Bm8HbAz3/oErnP6Pp6hCx4E9hW//bs9Y4VJasjjPPCXfp01tzRarUHLpp9X6uu4h4kUQTOZliU5F7MFn+f7C27s2hXQUNNc0VG4k7/OVozucOEyVvuukJq53yyg/TInKzDOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1893.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 14 Oct
 2026 05:52:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 05:52:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-cryptography-vectors: allow uv-build 0.13.0
Date: Wed, 14 Oct 2026 07:52:36 +0200
Message-ID: <20261014055237.9974-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-3-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-3-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1893:EE_
X-MS-Office365-Filtering-Correlation-Id: c17dd93c-e6ad-4e4f-6717-08df29b75b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261009223027099003|22082099003|261009221227099003|18002099003|260925022911599003|6133799003|260925021311599003|10067099003|260925021911599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kPJsHtxtcBxVNl8qayhNklT8ohXLJp1uhU6I9zAPdTrOqHWEsdfgHXGdiw+nF9GMG3hQfih5poINdH1UzA2cK55iVrZSwaEOxt6Ie7sLcWIFN4NtB8PAa+IhH17PHfnzxhkpB0zDLWXwO1KcpZyEuuZB5YckBpOvQeKtCmm8tPHDQ+bpncxvdXN4Cr0GFWJK7vUuFRHMpsNiXdEQVxwtqZTfzH4ZYls2pvQ4ZQZ338rAH8UgBXh6kkwFLTlfURP5RRjI6G9/I7Nj9UJQ/7D83myDoz2cWwNzjhN+3E3O0ENQOQ2Fzis/5VpiWIMH+owbbSUYM+xI5tvEdiHu2D8w3RhRrfmpKvcDegptdj8QtFDaKvOHrRxsHjZCyYTYzfXy6jLUQD4Qn9eANNG/pLd9mQc0jF4iU3iDrsQ6x4X9b8hjUmIsVXhCpqIqS8fnQu7ufbkXAmPcENYsJ1Mz0KJZS0HuxLKzX4ia8CVi5CJsM6TNlBecs/s0UqE7OQbkDq65qBRknqhzNkbIX2exSSBNIHTzTVs0WjoNHZcqaFbgmgmxPzPiuLj0ZIYLujD5RLnU29yKgj4oQ3faBOLFekX+1S1bcolnF5whcmSUadmGXf9dM8sWgSwt3oe5cdwdiwtbQ2UKBL8bu6Eis9uRPKcwGTX6Qdxrqt84tIRu1/WGAz8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(22082099003)(261009221227099003)(18002099003)(260925022911599003)(6133799003)(260925021311599003)(10067099003)(260925021911599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z7pSZCMImtRR1s10Wa5eqUpBayJK9xfksgiIx+/jVf3JeHLTBgsR8QoY4VBd?=
 =?us-ascii?Q?9JZIcxO1k/Q279PvJhEaUbP2Vsuy5UQlI+3ZHaWKGXdqW8pYrHI2dNBJ2X+b?=
 =?us-ascii?Q?siCrjF+M+jJi/NOUnXQqWVm/QMd6IiXO7IAlDZKEheRoZ/EPLkL7rQG65bHG?=
 =?us-ascii?Q?n9VTP58xmkGx7RNPhjSRDl9dOYpiiUH/iezGCpxjggU0NdC25qkUnmEVR2Y1?=
 =?us-ascii?Q?QEnnmTmY3gcbD9Bn7IFQeTckm5S95iwuCSNcgujTsb58u0VLRmDRjyrUavV+?=
 =?us-ascii?Q?TsWtsG9EMPLKdonZOp3QSgmiJZloDLfTtVEHb3uEHby5rvvi3ukSU/EiqIML?=
 =?us-ascii?Q?oBBK3p3Yank9Shox27YSLDC/kUWkFTY85PDxn2tYW+YKB51pbizWGGpVAluL?=
 =?us-ascii?Q?Qe9tfdhe0Y3vNQu0VlL8chHfwYVqtNamG0oUAVKet8gyK+2UtoyZ+WAmEhB7?=
 =?us-ascii?Q?hfcXY5VhuvsfFGu5epHtztoxjEhpVMutuCR51jFeMvUYc68eWHk01m/hAvpZ?=
 =?us-ascii?Q?EiMUr45KD+OwTBR19RRT9sgoV0VMyarmI01CyHEe0EU1dleydh70nLT9XB+f?=
 =?us-ascii?Q?T1r1xqbXXSkCDm/pDS8Ml1iR6/45fZxBToJeYLTP8B3x64bShuAjEhC59hm7?=
 =?us-ascii?Q?3aFQqQkx9HBad7c9ollKyCyNtp8DXC+SKTL3ekeD+yY0ywz0YuCvJf/4B04a?=
 =?us-ascii?Q?faOKrcV36myqkMAgwAsy4bBsQB14hO0rJFmLH9L6h26V2A8YWSqje4TVQN0H?=
 =?us-ascii?Q?x7DDC8C/ScWfH/RnqYrqSn+Jx9hd7NBcFUqBNkNZpzwe2kSxdZJFaH3aMipc?=
 =?us-ascii?Q?ZsKVPO7DH6W0yOCzz2deByB9aEXaGQB6s8jQUCt5Oe55gjU37BhymU8I0pTA?=
 =?us-ascii?Q?7vxviNyL5wCmYgm2Q+Prn8oiNCIzk7yyZRK3wlf7twJWE2qCr4TZ3DQOmk96?=
 =?us-ascii?Q?bTWDvnhTg6fxZQClGgHXiKII0XJhiWWMe8POf/qGFnhVIo4OtP/h1Hkp+k8p?=
 =?us-ascii?Q?/jYhtUaP462GXP8naBDA3gnM4+KQfny+l6aHj1pK0zGsWHneBb/+Sp7fqW/r?=
 =?us-ascii?Q?KoE7XwNEU6Q9ZL2t4/ZJK+nC7g9NDJVXFa7b9JR/rAte2cmIuFTjZ/OkB5dU?=
 =?us-ascii?Q?M0L0IqKj2LEZphGhQDceibm2l1M8fet2zWJdD7vWmlllCyirksacqnomju8y?=
 =?us-ascii?Q?nX2fRHQLnJ+63Fpia03Bx0fRzhlv5ML0R6AKYtqJYX3EIZF2J/FDAS0hgbwz?=
 =?us-ascii?Q?PfD9y8gOT0zA11uUqL5keYt/eqT2Zu5XapSnwbVElPjl+WL6eemgToLHSz7V?=
 =?us-ascii?Q?fkPXSSODudVYI29hhVmHzH/m4fR1o33/f/J9erFBVKO80JoBdiy1vGzZFFgF?=
 =?us-ascii?Q?f48RTB8zYOPht5PcYy33nKnJABpNk4HIRfPIjh/U7100DdWJvkBCYqEClZgG?=
 =?us-ascii?Q?3DUQA2dJALXRp9EvvT+AqCS2U+y4dm9D0bcoy0o88BriO7ipgp66tEeY396h?=
 =?us-ascii?Q?JXZIRVLZGYyhl9ecTUh49/9W4j64KWC+qXPuweSFY/T/ux4PVouujgAN73p1?=
 =?us-ascii?Q?u9/QAtZzt2b9UkGifzW1jK48GeRYcacjWYPCr/OW8CFSdhCOlqcp76+IbUDu?=
 =?us-ascii?Q?XT57u388kzRorgKu3bgJgRyVkl5wlwGdp1IEiV6pSZ+7iTPOzH7Egqq2wTKv?=
 =?us-ascii?Q?GLNr6pM7rgcYmNQL7rtwlBex6HzPKAKxrwi17h7jp7h2GXk4wUwlIBdEPJ4l?=
 =?us-ascii?Q?MT/9v5pNzg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c17dd93c-e6ad-4e4f-6717-08df29b75b30
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 05:52:39.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1WRzZOlYXsGA0zvCTotgKgae5FvZpTpb7PPy5d42i4R/o0YL+vHDXG+REHB9T4Q32wvPVByVzZF1eWer+etj8osCHQwGk+1T3PfLGnpUAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247746

Relax the build backend pin to <0.14.0 so it builds against uv-build
0.13.0. Backport of pyca/cryptography PR [1].

[1] https://github.com/pyca/cryptography/pull/15818

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-cryptography-vectors.bb    |  1 +
 ...ject.toml-relax-uv_build-upper-bound.patch | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography-vecto=
rs/0001-pyproject.toml-relax-uv_build-upper-bound.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b=
/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 86e437ea5a..e19b9611cc 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fae0=
1f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-crypt=
ography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
+SRC_URI +=3D "file://0001-pyproject.toml-relax-uv_build-upper-bound.patch"
 SRC_URI[sha256sum] =3D "d99111fe5dd5a8d40650e300aad34b6e6910ca198c674b8008=
450ca69f8f05c4"
=20
 inherit pypi python_uv_build
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors/0001=
-pyproject.toml-relax-uv_build-upper-bound.patch b/meta/recipes-devtools/py=
thon/python3-cryptography-vectors/0001-pyproject.toml-relax-uv_build-upper-=
bound.patch
new file mode 100644
index 0000000000..008be12e30
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors/0001-pyproj=
ect.toml-relax-uv_build-upper-bound.patch
@@ -0,0 +1,29 @@
+From 9315d44ea059d68629c5adb33df7a84fa8ea03c2 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 13 Oct 2026 17:53:26 +0000
+Subject: [PATCH] Allow uv-build 0.13.0
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/1e0=
ced8ad61d3c84215fd749abb183e87b58caea]
+
+Note: The upstream change also updates .github/requirements/build-requirem=
ents.{in,txt},
+which only exist in the git repository. The PyPI sdist that this recipe bu=
ilds
+from contains just pyproject.toml, so only that file is patched here.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 0b10dcc..ee03759 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires =3D ["uv_build>=3D0.7.19,<0.13.0"]
++requires =3D ["uv_build>=3D0.7.19,<0.14.0"]
+ build-backend =3D "uv_build"
+=20
+ [project]
+--=20
+2.40.0

