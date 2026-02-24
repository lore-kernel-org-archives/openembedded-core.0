Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28793E9B247
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:47:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16547.1771924557828404318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=VmtXAJWi;
 spf=pass (domain: est.tech, ip: 52.101.70.34, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv9apyKxm+eyPBmfRo/PdFfb4EbYVXhLU009loKbHWsaSk2LRwVO6hAW5aogZL0wAW0DGoHf6TSoK+EIhhlrrB3jKRkoQ3XCaCX4y2Q69iWXERFO+h0NVEQuRNnzNwEI1MTOY5sy0B66K33oteFLAQw6bFxbs3QHHm0Q9GynBBj+NuZPBEa6B0DudexvNrq20kCuwUKIZw2lLa8xUqw0kUMZCWyrvmBfi7JlHjXmTyj2FiMZcClx4R67McsFEBAM5IQcZJ4eNpQBWm2S/iTaYMqAbQ8F+2RktjepqlCE//xckFO8EEgn4lu+qiWNaEDcZ3v6lzgaSxYg2mwF9dTqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv4m/9gobATsyNKVex5egxL4MfeZLC6TZzKjMpnfE3I=;
 b=P1VnfCwMQuf3hKhM6GzT9I449CFNWsCnPEOza3mq6EGNQlHZ4RqLqYzVl9XhgiAxmcUTC/klDVg5x8PHykibqF40yvmg91+4f4IfVKA3wuD5e8b17OtwQEc01ah3aig470k3eaqe1S0TlD8qGiPeb07Yc7sJqB/8gZ3EVLsTNwy2C+qUwHBIGjQPcAxLlS06bK0GVnvyjraOvsMju7k0uGh9sWQ4e456RPSVkZHLyXtQacHSy4FHwfQLJ2RtkakqCjwJG8DZRJJzvfZJuc3WSOIxDfOksy+vx/CVlL7sbLzQYWnor3JIlh5GCZ+8Vy/YVLbxH1Mks4W4pqmtcVXAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv4m/9gobATsyNKVex5egxL4MfeZLC6TZzKjMpnfE3I=;
 b=VmtXAJWiqeKi9Ra7KvRZvUHtiDWtzDVX/BKlF/tuah4lhjlD6dyozxlPwPAa+RU+dKtvxzBjUnBXQf/sc0WALx1m/JYMQWTSzazT6nBq5/RUvd4266NbQX4kx9F1l04Hz+ztkqKCgtSLk7nqSlOOjoHOhyrmPpr489l2VZoWpBi/JP4a/Sf7oMAtLQ+S/DaoIUqG3572QiHLwFltMZ8WVW3/T1zFG1yYuX/cSWPFnjg8BtygkJisAYeadVI7Uu3msmnz3KAEPbSMpTxRRmezXIQiFhV9Qh3CP3Od2wL5eJXAKCZC7Uh/60YuW7EskUEjiLp5G0cW+5BPxYLbfd36lA==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:15:52 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:15:52 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcoxPZKW6wCEPPCESmdNKTFVRVsrWRizwAgAAKsLQ=
Date: Tue, 24 Feb 2026 09:15:52 +0000
Message-ID: 
 <AS8P189MB1672712CB3B77941204EAC62B374A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260221092411.802178-1-adarsh.jagadish.kamini@est.tech>
 <DGN1ZXB3Z7EY.JKGGP9H2SP8G@smile.fr>
In-Reply-To: <DGN1ZXB3Z7EY.JKGGP9H2SP8G@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|VI1P18901MB0733:EE_
x-ms-office365-filtering-correlation-id: 5366cfb8-a5b2-47bf-23bd-08de73854f04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?PEh8ki/9/jv+Skhqqmx8bF4pRKnLqRcX6YfFX0slt/aJh4agcucktBz+vKM9?=
 =?us-ascii?Q?mDOfG6GmycArNHE1nInO6zXNVvaNRx3GKOBVOdKAxPEotp+JAlcGeXM8NxOE?=
 =?us-ascii?Q?SvdsiacP61BKuaZZ5WR43mW3dHz604wmJfdzs8c3g6wsQsGrib79uEJT4xpq?=
 =?us-ascii?Q?0LcrGdBZ+WtnxFVAMNWyNhgi75x0EpMopzSibJCz4pbmp2ZpEDCjOwJGmq8b?=
 =?us-ascii?Q?LwXlL8dfv2YgsIqSOzLRgANgvpd/Zu1vrY5l8HkcNIckZW8hR+f6logQ0ypr?=
 =?us-ascii?Q?fAalCtwQhRnDUtIxtVXjb0CHyY+5ByjFki43Gv94ojaxLyo6D7iDJs9zcirR?=
 =?us-ascii?Q?PpcRiJdRNvlR8PAXioS3iO7EsuY4PI3MpCMH8sqZYVMipccvVa//08X8Gufn?=
 =?us-ascii?Q?G1qIDKtB2Wb7yxk2lo5+U8ibpniaB15MgaEgRDB0I/+ZPHBpOGj5aL5X9qqo?=
 =?us-ascii?Q?oZe779nWW2mCrm61uw3w/0ob+jUT4PC8nxVwVEVhAJd+E7U3BDlWKyeO3p/u?=
 =?us-ascii?Q?MTynFrCbyjPpTp5qShxCoG6iE6JDy+83pRPhiLmrgEds82/MNG9ubkXNl3zJ?=
 =?us-ascii?Q?pkF4M9zpqbIe21+X4t6c0KO3eJNgvR2d8oN4qLFupafMsx+tS9sTuP84JMq+?=
 =?us-ascii?Q?Rge7uZEPJ7u9bItuMJgoCzxVH4kJuQAnfSexzgSJjhF8Rnz2oxMz8gKvSFAL?=
 =?us-ascii?Q?PMvGDhV9mjHgySElEEaTZMU2TIIHiR9T7vmhvOIqaZ305JDS7Qqp2DFbAPwL?=
 =?us-ascii?Q?heTVcN7iWlpe3jZeCWlcojh5AAK8atKGOTActqO/JlXS5izsUVyPxBtzhqxj?=
 =?us-ascii?Q?Y5gycHTtE8MuggourlpwIXzsKqejFQ3IRcqDXd6+1Ld/Oo9wCueGCnwfYiEG?=
 =?us-ascii?Q?eJ/fXNATmxGIjj0hAtsk32f1e5hWwdqdMQfInkgv/Bv82P4iBG2QzW3NzAH3?=
 =?us-ascii?Q?UfgD2bQ5JwNtnhJAXEGQiMMZ2Awi7CBA80CFdSWjy3nkH1S0jigVyzNaQRze?=
 =?us-ascii?Q?nsRlG1V5Sh6LYatqZaWUtVSIMH+QcbDu0acS1C76b08NYH4yYIaqv+Bp1hF5?=
 =?us-ascii?Q?xXPDY6jcxAB3ac6cjNj8MC8UjxSWl8hfhQJtxUd/eufhLrY99R9ow7F/ss0n?=
 =?us-ascii?Q?mJJrI2Q0QBzhkf6BynfiH+96J7atQowWz9fJHzUX/vRPVs/wRECblML7Vc/Z?=
 =?us-ascii?Q?pbIu7c4bEJyaiTiVwalkqR2r544Kt7T6jn06ZAsiFD16dOAnPNgcGg5if4nI?=
 =?us-ascii?Q?7doh4Hllf+B36Hcc7WnDvf28cig3ozHWCxWn1hKAIqmMp6C9pM0SN3tyfLVL?=
 =?us-ascii?Q?gM7KMfWq3pByj5Dh9I1KmHt3Lrmp1BWA9Gcn8IQpHmvmoqqSs9V2tT7gZZ+F?=
 =?us-ascii?Q?SNtFi10SUDCqrh1zn7sSL6XCOTHRovy6F7PFMQjRG9T4PJhixGTIYI39HN3x?=
 =?us-ascii?Q?JXc5/F3w2daaRZpOmbW0NJjJfu2Qa7MZekq1t0eJOD+chW3Yb1V9O5HX4sUK?=
 =?us-ascii?Q?Zrb7g9og3v7ZEYOvY7ZI6EjSjJASVBSj8dA45sS0lmAkElHU5fwpPmWc+clb?=
 =?us-ascii?Q?pzSDQlfxRxIRG9XrmQO0oqUXUBD4JhpGq5S/wcLy?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/p0EGHDvHpRA+INKEq8iR/TYIombufrkDTgJ+Zcqq3ait/uWCF09YDbg/JWt?=
 =?us-ascii?Q?mBfe3BOTeurVe0QGftAFI4B7IUSFgQnzMzXUtQR4KyfYLhdatFVisLu6q+cJ?=
 =?us-ascii?Q?3Flau2m+a4vnjU/PYYoUhT3w9uwu27LU6wRlHHOOlrgxg3yOXKs8VcuRU1eF?=
 =?us-ascii?Q?QZJHXvvdo/qz2rvVMrm9fS2k5HoJw5AUw9LxPh1zmsJWgwjGhZuXtaRefkDA?=
 =?us-ascii?Q?s5D8EI3hcdogb1LH8+SBNxvmWDaJhQKNkwlIGDcc1tQFg7n4xWwA0lteLOrm?=
 =?us-ascii?Q?E488gzXKmc2I/y7lAgIjgDY4MSgR3OnnVetTHn5emJ3wI/Pu0YncRHW5DpSp?=
 =?us-ascii?Q?fJRqga+kFLAFXzVVVdXW476taINmOUCyTW3toZ8HspDJRuUBk490AsO21GbD?=
 =?us-ascii?Q?9Q/etKsYcuV7aORFE0aHGO5JOdkDKvc0ScbcTRWoHdyk9HlIiFuHRzVv2qla?=
 =?us-ascii?Q?yjC/A1q3NYiaY8ACoOlQ/fWwZzSwIuoN6aGI6FTIgZFDHo4yeKoFYKSuc2u0?=
 =?us-ascii?Q?Ww05wIYdK4slYQ4mAwCFcJHm1IFDoYoEs1iAmq4ivcvR7E1J2wL2dZBnyowS?=
 =?us-ascii?Q?GUh2zKqCsgnqVnOgmNs8ZssW4zqg7/iaIabphj2YPmR6SboXeAkr+jjvFzdO?=
 =?us-ascii?Q?hnj/ewiXObtUG6TdV1CK3Iyu4SyebQ9OlvS2cIV6PE+QUApYWyI7aooyohAY?=
 =?us-ascii?Q?/YBXLqU0wqNywi6H0Uplk6I2zkm5s5nn7+MsOIlUK3PCHp2rLso//eVoZGVg?=
 =?us-ascii?Q?KIR1OjqNY1CmGkijnNCt6CtzWSQea3ueG0MjyEpxqaltpq4BHHTGIELebssu?=
 =?us-ascii?Q?bPBiL0H4INX5FYzeYww1uInHElkLNHYoVD3bm7pSNqmpPOSWKDj2d8EtfgJ4?=
 =?us-ascii?Q?4DaF3oR/7L4rUzkZ+x1y29Kgv66DUM1GOmJBOwP//p1+EsDzY9MKqFr3yc5w?=
 =?us-ascii?Q?RGc8hAvTHoXHIvSMjmQV816hh3aNAUHoGL9aGnJQAmK1c++Q0wZkssiqtnGL?=
 =?us-ascii?Q?8KeK0JewZonV67wT+IOraVe73IzCWSpLIKvHQfSko1rslGM9Sgcr8T7QTh6J?=
 =?us-ascii?Q?XPQaj8+a/nnmVWxFsdse7/N8ZpuHP1CKEXiM2gi8gHrXikKtPA3v22ahrfXH?=
 =?us-ascii?Q?LqEx/eKTWTAPTJhs1H6izBKpIAcxzYpehVQI8iJkMR05s4AxSBZ5RKkTZBUK?=
 =?us-ascii?Q?BOvdv+q0i8NquJL3m963Mxh17kE5WJ2BctukkVYRSPC94sXu8QzeLDR66wxV?=
 =?us-ascii?Q?1va+RuiAK3RtnUF9YBWvPCjhvKL3YaJPcKGWVKsFQcnD91BsWJQWeGxglBw+?=
 =?us-ascii?Q?9XVUWqu8pQtxyWEWsU92pxvJY9iByxkdVJbb2DgBKPcQVaAOa96Affb1Zosn?=
 =?us-ascii?Q?UYfhEFIiPIiHfj1JSw5YULNCUMo3kWDjd4g/puteLimS60q3DgB0oGc9v/xg?=
 =?us-ascii?Q?l0WdRiQGixRBzQtKbyM4eGFv9ecZjzAaSJt8UDN/pzlKZcyQx6ZsVWwBZIXG?=
 =?us-ascii?Q?lIZJZM3+bSbi3+EyIz5mS3gFU2o6t1RFzsepbcYk3VkdTkiVt779Icj0rlHB?=
 =?us-ascii?Q?xz1xVUk5IlTMUHXuzTdq4Oat7pTmnFsW3O4tX+TrIpRpkM9g/UMF+t5DKCzb?=
 =?us-ascii?Q?mCIulO49DImcwNhZsP4q+4X2ketXu8SDZ6p0LrrIHlE2CAbuhxYgMlQMupS6?=
 =?us-ascii?Q?3guIDUQuV0t7kg1rZKripjYWAGgkFVz3BUz+7iZldmat+LzmjUElYzNGwaqb?=
 =?us-ascii?Q?uytD5egmk3xQds9CL1gNLP1MVTnY240=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5366cfb8-a5b2-47bf-23bd-08de73854f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 09:15:52.6334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nnxH/5kxK0HuRN1v4pORVmWhV2EC16d2+NEKM7N+TTA2F5OjZ2LP5G96vrG+mc5IU3+lBNlaZ6lvsg73ZrT6/lZFxBg2h4cwVEjLpxUlhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672712CB3B77941204EAC62B374AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231755

--_000_AS8P189MB1672712CB3B77941204EAC62B374AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Sorry, it was the wrong -p option.

I will fix it in v4.

Thanks!
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, February 24, 2026 09:36
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix CVE-=
2026-1703

On Sat Feb 21, 2026 at 10:23 AM CET, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_25.2.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..68220f8294
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From 34bdfa654f2d3f9d036fb2abb28c175182a3da5c Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpat=
h
> +
> +Use os.path.commonpath() instead of commonprefix()
> +
> +CVE: CVE-2026-1703
> +
> +Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4=
faa9594e05d02ca05a413a2a4e7735]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + news/+1ee322a1.bugfix.rst            | 1 +
> + src/pip/_internal/utils/unpacking.py | 2 +-
> + tests/unit/test_utils_unpacking.py   | 2 ++

Looks like this patch does not apply:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/68/builds/3312/st=
eps/13/logs/stdio
  ERROR: nativesdk-python3-pip-25.2-r0 do_patch: Applying patch 'CVE-2026-1=
703.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-64/buil=
d/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/25.2/=
sources/pip-25.2'
  CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-64/build/bu=
ild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/25.2/reci=
pe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch CVE-2026-17=
03.patch
  patching file news/+1ee322a1.bugfix.rst
  patching file src/pip/_internal/utils/unpacking.py
  can't find file to patch at input line 44
  Perhaps you used the wrong -p or --strip option?
  The text leading up to this was:
  --------------------------
  |diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
  |index 6f373b1ac..a3abcfeb0 100644
  |--- a/tests/unit/test_utils_unpacking.py
  |+++ b/tests/unit/test_utils_unpacking.py
  --------------------------
  No file to patch.  Skipping patch.
  1 out of 1 hunk ignored
  Patch CVE-2026-1703.patch does not apply (enforce with -f)
  stderr: ")

Can you check please?

Thanks!

> + 3 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 news/+1ee322a1.bugfix.rst
> +
> +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
> +new file mode 100644
> +index 000000000..edb1b320c
> +--- /dev/null
> ++++ b/news/+1ee322a1.bugfix.rst
> +@@ -0,0 +1 @@
> ++Use a path-segment prefix comparison, not char-by-char.
> +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/ut=
ils/unpacking.py
> +index 0ad3129ac..7cb3de3c4 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -=
> bool:
> +     abs_directory =3D os.path.abspath(directory)
> +     abs_target =3D os.path.abspath(target)
> +
> +-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
> ++    prefix =3D os.path.commonpath([abs_directory, abs_target])
> +     return prefix =3D=3D abs_directory
> +
> +
> +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
> +index 6f373b1ac..a3abcfeb0 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -269,6 +269,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: tuple[str, str], expected: bool) -> =
None:
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/reci=
pes-devtools/python/python3-pip_25.2.bb
> index 350092d9ad..496eff1f15 100644
> --- a/meta/recipes-devtools/python/python3-pip_25.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
> @@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \
> +            "
>
>  SRC_URI[sha256sum] =3D "578283f006390f85bb6282dffb876454593d637f5d1be494=
b5202ce4877e71f2"
>


--
Yoann Congal
Smile ECS


--_000_AS8P189MB1672712CB3B77941204EAC62B374AAS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sorry, it was the wrong -p option.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will fix it in v4.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, February 24, 2026 09:36<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport f=
ix CVE-2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat Feb 21, 2026 at 10:23 AM CET, Adarsh Jagadi=
sh Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3-pip/CVE-2026-1703.patch&nbsp;&nbsp;&nbsp; | 5=
5 +++++++++++++++++++<br>
&gt;&nbsp; .../python/python3-pip_25.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; 2 files changed, 58 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-=
2026-1703.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.pa=
tch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..68220f8294<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From 34bdfa654f2d3f9d036fb2abb28c175182a3da5c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Damian Shaw &lt;damian.peter.shaw@gmail.com&gt;<br>
&gt; +Date: Fri, 30 Jan 2026 16:27:57 -0500<br>
&gt; +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/common=
path<br>
&gt; +<br>
&gt; +Use os.path.commonpath() instead of commonprefix()<br>
&gt; +<br>
&gt; +CVE: CVE-2026-1703<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + news/+1ee322a1.bugfix.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&gt; + src/pip/_internal/utils/unpacking.py | 2 +-<br>
&gt; + tests/unit/test_utils_unpacking.py&nbsp;&nbsp; | 2 ++<br>
<br>
Looks like this patch does not apply:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/68/bui=
lds/3312/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie=
/?#/builders/68/builds/3312/steps/13/logs/stdio</a><br>
&nbsp; ERROR: nativesdk-python3-pip-25.2-r0 do_patch: Applying patch 'CVE-2=
026-1703.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-64=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/=
25.2/sources/pip-25.2'<br>
&nbsp; CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-64/bui=
ld/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/25.2=
/recipe-sysroot-native/etc/quiltrc push', 0, &quot;stdout: Applying patch C=
VE-2026-1703.patch<br>
&nbsp; patching file news/+1ee322a1.bugfix.rst<br>
&nbsp; patching file src/pip/_internal/utils/unpacking.py<br>
&nbsp; can't find file to patch at input line 44<br>
&nbsp; Perhaps you used the wrong -p or --strip option?<br>
&nbsp; The text leading up to this was:<br>
&nbsp; --------------------------<br>
&nbsp; |diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_u=
tils_unpacking.py<br>
&nbsp; |index 6f373b1ac..a3abcfeb0 100644<br>
&nbsp; |--- a/tests/unit/test_utils_unpacking.py<br>
&nbsp; |+++ b/tests/unit/test_utils_unpacking.py<br>
&nbsp; --------------------------<br>
&nbsp; No file to patch.&nbsp; Skipping patch.<br>
&nbsp; 1 out of 1 hunk ignored<br>
&nbsp; Patch CVE-2026-1703.patch does not apply (enforce with -f)<br>
&nbsp; stderr: &quot;)<br>
<br>
Can you check please?<br>
<br>
Thanks!<br>
<br>
&gt; + 3 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 news/+1ee322a1.bugfix.rst<br>
&gt; +<br>
&gt; +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst<br=
>
&gt; +new file mode 100644<br>
&gt; +index 000000000..edb1b320c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/news/+1ee322a1.bugfix.rst<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++Use a path-segment prefix comparison, not char-by-char.<br>
&gt; +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal=
/utils/unpacking.py<br>
&gt; +index 0ad3129ac..7cb3de3c4 100644<br>
&gt; +--- a/src/pip/_internal/utils/unpacking.py<br>
&gt; ++++ b/src/pip/_internal/utils/unpacking.py<br>
&gt; +@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str=
) -&gt; bool:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_directory =3D os.path.abspath(directory)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; abs_target =3D os.path.abspath(target)<br>
&gt; + <br>
&gt; +-&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonprefix([abs_directory, a=
bs_target])<br>
&gt; ++&nbsp;&nbsp;&nbsp; prefix =3D os.path.commonpath([abs_directory, abs=
_target])<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return prefix =3D=3D abs_directory<br>
&gt; + <br>
&gt; + <br>
&gt; +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_uti=
ls_unpacking.py<br>
&gt; +index 6f373b1ac..a3abcfeb0 100644<br>
&gt; +--- a/tests/unit/test_utils_unpacking.py<br>
&gt; ++++ b/tests/unit/test_utils_unpacking.py<br>
&gt; +@@ -269,6 +269,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -&gt; N=
one:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/sub&quot;), True),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target outsid=
e parent<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/&quot=
;, &quot;parent/../sub&quot;), False),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Test target sub-string =
of parent<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((&quot;parent/child&quot=
;, &quot;parent/childfoo&quot;), False),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&gt; + )<br>
&gt; + def test_is_within_directory(args: tuple[str, str], expected: bool) =
-&gt; None:<br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/r=
ecipes-devtools/python/python3-pip_25.2.bb<br>
&gt; index 350092d9ad..496eff1f15 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-pip_25.2.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip_25.2.bb<br>
&gt; @@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://L=
ICENSE.txt;md5=3D63ec52baf95163b597008bb46db68030 \<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;&nbsp; <br>
&gt; -SRC_URI +=3D &quot;<a href=3D"file://no_shebang_mangling.patch">file:=
//no_shebang_mangling.patch</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D""></a>file://no_shebang_mangling.patch =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2026-1703.patch">file://CVE-2026-1703.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;578283f006390f85bb6282dffb876454593=
d637f5d1be494b5202ce4877e71f2&quot;<br>
&gt;&nbsp; <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672712CB3B77941204EAC62B374AAS8P189MB1672EURP_--

