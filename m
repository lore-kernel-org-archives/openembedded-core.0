Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEA8CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13139.1791811212025663397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KiJX/JIe;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFkinYr+cSKfJRStpm9RvVuhhUymHgCTcll5kMYWyJxzovUJAlUfWQaA1jmol3f0pyujsmM3R4In5eWxDa2JVUNUJyH1sxxK7J27zswa2EFMbw4/MW5IHBBeE14zgm/cXKqkvwNvP64fkwtoD3TxtcAGoNQDgREFREzVEV4iMbZOC60aUQjb8RmtvHkNI74Ys4EbuwGeQao16tICPN4b/5RR4IHlMTnSYCr2kRKv1seX9UshSI50FUSYKjRGo0xE8xw1tuk7ThOGoMhhbetSM98wT9VM6CgrG6TnXs2Vlp2XV5Lpjm5L8hooq/GwQfP9ZjtLBDIUUdmvpuj6lLhmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i74ADzCRtth2nP4OB41b9zPWPMZKdDwSDFTYnVD02Ks=;
 b=tnFUCCI9q2msh0KoOj7VNZjnFnwoCxuWb3lzKuBNQt0JEJ1sOWH0LtxIUUZ5nXzGWaFI8fMfc/zBWkqKfZYqGgPc0Zw3nqx+4h3q4XLCFyMgL4L/aJBWczUFBSpCi1W/0csJUWVXT2JtB1wBBe5Qvy/rfWv8D1wdNIAcXrOHA5soezOIVkFCMISto8tvJ3DC9WmxsMni8X8qUNowCYeO6MiqIHDfbBBRvd5FKZn2lQAsnLbO1xkccJL7cm9mbKQr4KaEq+x3ZrSoAvEZryMvZYP+Ojqd1yMZkb8FU/kRl9TY2HRE/YynefnrWdItI3uUe3LrPbqdyZCcrTNYBi6cgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i74ADzCRtth2nP4OB41b9zPWPMZKdDwSDFTYnVD02Ks=;
 b=KiJX/JIe0u2qlwmNtejFcKtEMt5/U9dAPmk3U8lN9WwU/oxdd/IIKbVB9pTU7vt2Q3qtz/0dLy0k1l7nuipKvH0j8ODW0v1MLIHVqzr4wdEb6kTIHTf/ImsbkhrLIaAMIr2RdfjCAgrVQO5z+M0PNkwoFaqCCEL7oeOmzaiy85M4Uok3R0D0fn4mJDXyyZw17X5vLRVnGoUDgAV4nCaAN/6up9i1SXF0CQSwbzGbgE9R0iPiv4hqhQVkZev1AsjBehxkenyT8q5qzNnF7iSLPvLUQ8GQxcU+Mzn1R645MvPit9F2oFOTJoSAH2oiN5wBewXq5U5NIGda2mGio4tgkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:07 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/18] Upgrades on 12th October
Date: Mon, 12 Oct 2026 15:19:47 +0200
Message-ID: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8656a0-cc39-49e7-a2a7-08df28638891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261009221727099003|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Ip2tCJBJPbEkVOwI0Ed3x7VlC1uZxBD4veY8/0H5/5PUfemUU2zOG2DqNre1O6Wd/eIoGnQRiaLtt3GEmA7tsQ3zFR3Dw85yzt8kA4OUtDHog4KlzSlxVeM86HO9dGsqUikAMbnhkwNm2lzGHIeNIxmXI0iESoX9OPgljn+T8hEU+RA2Ajy8VJdbBPvNgTMtS/CC7rza+bPueQhC7CUBfgftaZ8nqNsm3FZmnMXjtR0I6u94AkGwCHejGm4ojg7zRmWp0x7t1DRfl5B8+zNK/eyJIdBW7VGtf3KtZ8JO3++JhMrGKGSTteLbd7VZmy5pSUbfiAdL6QXQdJaIKuU8W/CUoMCanjJNqWBJfSPR+Ek5qHVDfqSmtdqsw1tX6trQv9NJjj1oNNU3f1cPeRs/Po6F3+cEzgxpk35WrebN6QdIT1zQ+36geKGF+iAlB4Hpdo5ATTtSVqUy234ToF5F3AHj3XmB0VYZ9BuojICybqgrff0GDLX9tsE6Fb/PugfplfttMj7WluhTjsUqou2FuDpfHuvFhJ4N2eyaJw6LfI3fSB9ZckEFfYnQHsV089H9hhfuzjLRXjG8fyfX1VzlaWrOu6P7FytslvxgJeiK+0Ybj/lHx+XTgsnp1zcdDBpYa5uLeqQUjEJeHPbITCTDeihjRa15/QwLOof6T80BqaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261009221727099003)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gdSZoO7BnfCLlu+sejWbJQig5sD4d6ezRCJ2RUQUZFFW65h6w0Po0HBRhO4v?=
 =?us-ascii?Q?YOEtEaWk7MApt9tgRP9jG0Dl/izTtnvO2RLQCh5QnIFfF/PFdDSTj/LtI2ad?=
 =?us-ascii?Q?BD+sN+/nKsobOkDzXh2v5AgnD4k5Jjbkq1iET9VDzlzYbs7g042SknvLvpWN?=
 =?us-ascii?Q?yNy+whronXK4ZPG9iBXy2igZcMM7Bw634Qqktu9fVwy22gXdhoI4pm8IV6ux?=
 =?us-ascii?Q?zMeavS3CgloNlezFTg4CiWr/yy/fpPiyZbrrjBJV0iav/H3Qi/jU+zCz0wuF?=
 =?us-ascii?Q?3pj94lrhcoY/mQJFduNZmWQv9q8AZyoHZMBnUgPAq3LRI1UDNwFzLCqos1rt?=
 =?us-ascii?Q?1P2T09Fv1QMzpAQM5+psz9H4HuA0xj1eC5BY7r9ftAtaa4Kf6iRH1ohFlETN?=
 =?us-ascii?Q?ITelp9xkslub8GxeeLGymqDSQFOvnPM1qTSWuDGLW+ob3+7sxpzq0cXcITiw?=
 =?us-ascii?Q?04WGzUAZRZiE8L+wdzQNLm4X2Bw59fAAaahqH5t8VWpHXORXs9pR1PaWF4ji?=
 =?us-ascii?Q?vbL9bYdYO59W0rmNYtqBHLVcrF0/cxnfC00fp08KchIK9seMQWD1OgEdRCjb?=
 =?us-ascii?Q?WaJ60DjhXlPyQgDcvI110Abrq60j5kxNtQkykhkKM2JsH/CltQ0ZeTbjlKle?=
 =?us-ascii?Q?1tEPky4FGP9Rj3RSU3UJK90H4blpAlUxjunT2LtBSbthIu7PPoeAaiLuoi0B?=
 =?us-ascii?Q?kZ0cCkepJqmr0ea84Idse5UujcX3eE/CI4zc/4FIN4flVhkYr8WtLOcuK+tX?=
 =?us-ascii?Q?rsx9pRR3BUc8HZz/XaAkkQE3G54x+dKHVoD7dYvRR2IJAkJrjIQThGRfiI44?=
 =?us-ascii?Q?jsWCPiaKOPYSQxgyu5/a/fIu4JJYI1AChTEmrmCVoR/k6goXm79KyQTp7ryo?=
 =?us-ascii?Q?QG4soHE1EgCzgFj8Ve/h1mNk+WrobB9zR2b3RCn8zuqfByiOSD8+2GUkZbOI?=
 =?us-ascii?Q?P3wR9//9Rhj/bKgeofupDR05Gpp9VMfmL2/eQU6rENFIQqs0GAbmKLTr2V6k?=
 =?us-ascii?Q?keLu4fHWePr5rXjyHHojBfPB90QWLACGUQGUBDIkmQYt18blro/RwJWO8j5Y?=
 =?us-ascii?Q?3t7E/X31NY5GUCGBdtZ7TkPsDvFPLYwSnRgu6QyRvd0ZTkS2W9E+dz/8fuYs?=
 =?us-ascii?Q?noGCTS5IKlHaRZ1ase0CTfGsTvWXz7HYfSh4jucq8/6Z0ykyk2C4LVHpuC54?=
 =?us-ascii?Q?3dzff2yo35n/mdUoDklvP8K3uMWV7t/sWe9lgTs+OexOfAi8gh6JLEL0LhBf?=
 =?us-ascii?Q?Dy6Xe9ETa34IDOq2HvGQ6Cf31lSvGksct8B/4KPsdrOesJCwK4UZ+6jL3zIq?=
 =?us-ascii?Q?t/NCrTzijb61Np3o9Pv4ldvEr7b4X1PbsZgUtS5qOP1L6IILSKLWat+RbMj+?=
 =?us-ascii?Q?QqaPtPeDk8Pi/PAmL9FnhefdzxCbNzJwXV4lbQ0Gj3omwXzK/9sqpjSZHYhK?=
 =?us-ascii?Q?sLHcvhHALrXP7RuMXVPNMyaRt8IdVmStH/pqQWq7EFFbmydDKzQzUHTktRhN?=
 =?us-ascii?Q?gqIKJGXr1VkvpiAPaUGv6tCjPb+2Pc2k1bvQL/Th3WAYmuuiO9jYtQu+jHPu?=
 =?us-ascii?Q?XWS6kSdIRUkyQh6CMsPjUaeITT1OXvShg2DZwmAj5mQKEYXFLFCqpCtQxIfm?=
 =?us-ascii?Q?WMyQDkJBfjO2lHh5rqonet2pac+K7PTs9XFXDKrac6q2O50RVIiVhnYSHr2K?=
 =?us-ascii?Q?eKVAhFnEYPpn88MwckJCGrSvEbcdM9GfsvAqS0wJfJb2fCZn7xUsWqPORh7b?=
 =?us-ascii?Q?OwhbpNOIig=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8656a0-cc39-49e7-a2a7-08df28638891
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:07.0211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+/ZjyPek0GpOemEHrfWpX5QOaoJJyWWEN+q2TnYZmkgQuTYcEMfrW/Nhk9HundhcvdRIi0bgFJaaGZvr8SOspTUzkXtwLAfD/jUpcbb+YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247644

Jaipaul Cheernam (18):
  pkgconf: upgrade 3.0.7 -> 3.0.8
  python3-uv-build: Upgrade 0.12.21 -> 0.13.0
  python3-pycparser: Upgrade 3.0 -> 3.11
  gstreamer1.0: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-python: upgrade 1.28.7 -> 1.28.8
  gst-examples: upgrade 1.28.7 -> 1.28.8
  gst-devtools: upgrade 1.28.7 -> 1.28.8
  gstreamer1.0-libav: upgrade 1.28.7 -> 1.28.8
  fastfloat: upgrade 8.3.0 -> 8.3.2
  python3-pygobject: upgrade 3.58.0 -> 3.58.1
  sqlite3: upgrade 3.53.4 -> 3.54.0
  python3-jsonpointer: upgrade 3.1.1 -> 3.2.1
  python3-beartype: upgrade 0.22.9 -> 0.23.0
  at-spi2-core: upgrade 2.62.0.1 -> 2.62.1
  python3-numpy: upgrade 2.5.3 -> 2.5.4
  python3-pycryptodome,python3-pycryptodomex: upgrade 3.23.0 -> 3.24.1
  python3-hypothesis: upgrade 6.168.5 -> 6.169.0
  python3-beartype: Upgrade 0.23.0 -> 0.23.1

 ...{fastfloat_8.3.0.bb =3D> fastfloat_8.3.2.bb} |  2 +-
 .../{pkgconf_3.0.7.bb =3D> pkgconf_3.0.8.bb}    |  2 +-
 ...e_0.22.9.bb =3D> python3-beartype_0.23.1.bb} |  4 +--
 ...168.5.bb =3D> python3-hypothesis_6.169.0.bb} |  2 +-
 ..._3.1.1.bb =3D> python3-jsonpointer_3.2.1.bb} |  2 +-
 ...-numpy_2.5.3.bb =3D> python3-numpy_2.5.4.bb} |  2 +-
 ...arser_3.0.bb =3D> python3-pycparser_3.11.bb} |  4 +--
 ...23.0.bb =3D> python3-pycryptodome_3.24.1.bb} |  2 +-
 ...3.0.bb =3D> python3-pycryptodomex_3.24.1.bb} |  2 +-
 ..._3.58.0.bb =3D> python3-pygobject_3.58.1.bb} |  2 +-
 .../python/python3-uv-build-crates.inc        | 36 +++++++------------
 ..._0.12.21.bb =3D> python3-uv-build_0.13.0.bb} |  2 +-
 ...ct-has-a-different-signature-on-musl.patch |  2 +-
 ...tools_1.28.7.bb =3D> gst-devtools_1.28.8.bb} |  2 +-
 ...001-Make-player-examples-installable.patch |  6 ++--
 ...show-player-warnings-in-a-dialog-box.patch |  4 +--
 ...mples_1.28.7.bb =3D> gst-examples_1.28.8.bb} |  2 +-
 ...1.28.7.bb =3D> gstreamer1.0-libav_1.28.8.bb} |  2 +-
 ....28.7.bb =3D> gstreamer1.0-python_1.28.8.bb} |  2 +-
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +--
 ...s-use-a-dictionaries-for-environment.patch |  2 +-
 ...er-script-to-run-the-installed_tests.patch |  2 +-
 ...er1.0_1.28.7.bb =3D> gstreamer1.0_1.28.8.bb} |  2 +-
 ...ore_2.62.0.1.bb =3D> at-spi2-core_2.62.1.bb} |  2 +-
 .../0001-Add-option-to-disable-zlib.patch     |  8 ++---
 .../{sqlite3_3.53.4.bb =3D> sqlite3_3.54.0.bb}  |  2 +-
 27 files changed, 47 insertions(+), 59 deletions(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.0.bb =3D> fastfloat_=
8.3.2.bb} (90%)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.7.bb =3D> pkgconf_3.0.8.=
bb} (97%)
 rename meta/recipes-devtools/python/{python3-beartype_0.22.9.bb =3D> pytho=
n3-beartype_0.23.1.bb} (60%)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.5.bb =3D> py=
thon3-hypothesis_6.169.0.bb} (91%)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.1.1.bb =3D> pyt=
hon3-jsonpointer_3.2.1.bb} (85%)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.3.bb =3D> python3-n=
umpy_2.5.4.bb} (97%)
 rename meta/recipes-devtools/python/{python3-pycparser_3.0.bb =3D> python3=
-pycparser_3.11.bb} (70%)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.23.0.bb =3D> p=
ython3-pycryptodome_3.24.1.bb} (56%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.23.0.bb =3D> =
python3-pycryptodomex_3.24.1.bb} (76%)
 rename meta/recipes-devtools/python/{python3-pygobject_3.58.0.bb =3D> pyth=
on3-pygobject_3.58.1.bb} (93%)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.21.bb =3D> pyth=
on3-uv-build_0.13.0.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.7.bb =3D> gst-=
devtools_1.28.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.7.bb =3D> gst-=
examples_1.28.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.7.bb =3D=
> gstreamer1.0-libav_1.28.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.7.bb =
=3D> gstreamer1.0-python_1.28.8.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.7.bb =3D> gstr=
eamer1.0_1.28.8.bb} (97%)
 rename meta/recipes-support/atk/{at-spi2-core_2.62.0.1.bb =3D> at-spi2-cor=
e_2.62.1.bb} (94%)
 rename meta/recipes-support/sqlite/{sqlite3_3.53.4.bb =3D> sqlite3_3.54.0.=
bb} (97%)


