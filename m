Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0514C61DC7
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 11:22:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33827.1787829761274528641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 04:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=rqWMDB4H;
 spf=pass (domain: est.tech, ip: 40.107.159.35, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2nsKe3NfRBDlt8JEgoR0kMGQFHa95mTNxZW8R3URfBT2bz6HInVjG+8JxAgRV0nnH9Ve9S62lc/gO2fOHrY6Ir2ZQ4u5Q9hb8E738kKTJvn/t381TIj9UAX/C2/O0luNPZF2Uyg5m5SI6qJuIkJUDpSNRwQNdBjMntvvLaShjEnxy9da3VoP5BZTzNIgOZQQh37c2Ko5545jt20FqFe0U6texNXbpY6ZDPx7fuO208gs5mJO73gJtlHZuNgI+SrDLZTP+ddqdWmH/+FbmXgCYhwjLHAontKqDQNXwFmtcLDhc2sFWl+Y27zj5AvNMfzVHtNsCQPqgmi1QWVpGsq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr6EmAz5JhgYL4prepC0R4g53dVqDITAx4bDjy8cL/8=;
 b=C8+rsEIN3pvylGX80W0oeQZyTCJttICohCAdR8RNMSh/js3Lrl6ZWQVs4XAhGLoI40slO+wni0lYkFW8HY2CnqtfJTSP0coqod6GMFcmy24F+KudTKkmHMqQrIo8Kgd4EXnioiv5+1SfufAWg9hyv+jIK3ue323gelplthsQQipwyDp2scu8e9hnkab6BOZPDH08SR3xX+OXPhtH9kAWDsoRCfXptkGnVozuM1AQhiOdsuugZL3tdT2cBD4N4bQei2YJRV9y0+UzQnExLt+GuIGDEdjwAv/0MLVRAe/6gBw8M/oa9CUWhn/4ihl6SvlU92nwvfDJqaxY4FazLIa7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr6EmAz5JhgYL4prepC0R4g53dVqDITAx4bDjy8cL/8=;
 b=rqWMDB4HAHIskrQeUKFsTenZqNA8G5NrMR+wnnnn+uN1eykyrro/JMVRAMvKZXRK/AFXglL8y2S5KPKz7j6SLcekTTsnK1uS+q9l2+VWelkfvO+dDyf4WLylbYh4NbuhNmkd9uC0A0+KC/K8+aMmYHYO7QRowgcBY91MKSj+yc9TAUkOlqxiQ+qS/UkBwKpTIVzrJK+OjhPqKhsDca/doRxxdC6hLQrSxdh/6+flL/WNIQ9+wUwkaz/84kHLar37xJqTBW7fuUAxIKEC9PkvA6VxqKXgZNM9PjVm0l2FMB+6n16Lz441hQyc2wKecfMr1r4XQc/KrT5J6JcP1PyywA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU7PPFFB02F9236.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aef) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 11:22:36 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.003; Thu, 27 Aug 2026
 11:22:36 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>, Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core][PATCH v3] zstd: add ptest support
Thread-Topic: [OE-core][PATCH v3] zstd: add ptest support
Thread-Index: AQHdNTS41OuhdvicI0SLxFj3/QLr0raxre4AgAATHoI=
Date: Thu, 27 Aug 2026 11:22:36 +0000
Message-ID: 
 <PA3P189MB3239CD19DE451BCAF6B8F036FEAD2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260519090816.17783-1-pratik.farkase@est.tech>
 <20260826082716.15560-1-pratik.farkase@est.tech>
 <CANNYZj9eY2mj9XoMdCmY80o+95btOvxp1g94RYn9VSAFD2tHAQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9eY2mj9XoMdCmY80o+95btOvxp1g94RYn9VSAFD2tHAQ@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|DU7PPFFB02F9236:EE_
x-ms-office365-filtering-correlation-id: 19615c75-9f61-4f55-8412-08df042d7f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 qUZsIe36EEN557IqHR8d/vcELsPOipj+eIaxmeGlABZTaEdF2JcxQsgzcfXMEaJK/sGRBBLmyxu/Cg4BpHPnuSzpbuFbgqm+GWLjfmkvB6gJOvPFHyMmxggXbj3UVwGs5clfpcDuMpBh29w3fzHTRoouPhiscrKOcROk1uRSnolsmaTEeklIJpzWEQ3oNIScPIlbaIU96hbUMBYmG48Ennv50vz4uUxrj+SoF9XjZzwHWs+szsTQEb4lEYVAk2ZvpZkX4Z3bwVgoBJ/eQaan+G6GG6KLzbdHjSzui+vYqx1ot4EUBte5PV5jZOr4oky5D4HYSoGIwlQ9kr+/WHve3sWtgqKNw+VzGfz8SXG49pfAlOJa0r/zK64xXZn50cZyLmZTYXzesOOZlPmlIjFw/PxJPrZh180d4rS+xqZnmV0Hl+vI5lVz4S+jb7L6247rzztHM5z9o7yEWXd5pPt6Fzym6T+kTE3HQv/mGQxA92FK4AWy61b2iKf9YZJbRbz2mbMoxc/pVu1dgMEjX0IGHki2x54w3c2ix4ghOYC/IhPZ1hAaRV7uc8AwH8kj3NkxtJAIyK4fARkpMEWIp1oY/8lPUcgveRdS07g2Fn5omo5sxr+tA/FH1cRm2xIxmUrGz5ggUGyWy4cHPCneeT6vnwZ72nKZeCdg8UiAjkEGt0Qd4XhIqy5dM2uUXDqbF26u53RQj+S/A7cwXNm5SECZ/g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SltGRZ3gs2vQMEyDUnK5T2E+JdfuhJhAGY/gDdqUK+OjKN49PjoE1uQibnDN?=
 =?us-ascii?Q?QfF1gIHTVlNo5HzJOIOySi8TORfhEp3WfoDvSImQe7+/DuTbrIYBe6GvX6uQ?=
 =?us-ascii?Q?cSI0iR3LF6dj3VFFq7xfA+GM2zXMB+Z4m92gsWD1/WN0sspWJeOvoUAGBsU4?=
 =?us-ascii?Q?yo9TWyMEnra14Z88AjscTLFu6rdWZsogAjPA2BB3etEYX8FK//9lfVXsFMgP?=
 =?us-ascii?Q?+OTjGEQ66QhMl4kkyJ3sEZbVK+/lAZ940iixCpA+eCZ9AmrtXytEA4Yp5hDN?=
 =?us-ascii?Q?NuKjLKcSPyE5kwpwJS6WkuFSlptUEJYElYQc7VcfLaALhKpVqSHFWOJb3+tm?=
 =?us-ascii?Q?2hdEfbDoRshL2nsJV6jTvT5nskyKr9Zj84F8rj4lf1dDx5JT/E4Glt6onAAU?=
 =?us-ascii?Q?qrhsKinxMBsdOASXzoebfVSsj9aZv5/9lRkFj5Rmh9oEo9vQKITXqEj3kag5?=
 =?us-ascii?Q?7ktkOiCRPZDHNO3c3ChNB4VVuZ5C/lI6E9DW0/4q3H3n+kA0kGmxJQUV4ug7?=
 =?us-ascii?Q?xi91p5tsDbeWOv53KfadkblmZWzUSYnFAdLj7uMD7MWoQvyEwAMNVyULa8Gx?=
 =?us-ascii?Q?KjcmL3XwjnYHdpoXCxDvWmWIt1OvDZL4sGM9W853E1GIRj9mJOn6kf67itgn?=
 =?us-ascii?Q?q3hebwzec+nobw/mk/lfq1aBBbCeQn/3JUmeVsN/f/Wv2Cnr0DQCKT/17pro?=
 =?us-ascii?Q?LIqrc0EmBN2v9vjttz2fkIvjZjhM7mCoMIN8e4H+1mrOVGxeZjc7s82NRdIp?=
 =?us-ascii?Q?TJe7bDzcnJxulp4A8h4Uo58hPtp8ouoYVWGtkNfSfXVA9v9CnT93D5rpF6sM?=
 =?us-ascii?Q?0fCp12Bf9qj4k+1OOEyPjh53y/l/RdypqT8+UlxaK9QUfVqd5660rRMc4jXS?=
 =?us-ascii?Q?tayw4LMHgZxxtAOckfjlMXGlsnTGOsK9hMHouKullZu7FBZxCh3jjNCB2uqU?=
 =?us-ascii?Q?he3910jepZFN6UVgj1z6gtPshruMqHNXY8iGpYlcc4RRmIRCqnmzrsfrZaMK?=
 =?us-ascii?Q?IJOEgt0Zxw+C3yCLFbQpv/ycduK5sxWsyvqbdZ++Tg9AGbY9XS1jFuDhyoj2?=
 =?us-ascii?Q?nNsRkFRnBX2c0QpF4kwiHGBnZ1j2gNhBywRnzQaNKO6GZifCGi0XUcmQDjip?=
 =?us-ascii?Q?RxB0HKsQE48D9aZ3MldNo4dz/wFj+kB6HhLB8uUqw7RrEqvjIpUcCaqxYcf9?=
 =?us-ascii?Q?HImWR+yJqlvmOP7jADgk86GvLyBQn8Q5G38fbdzujLOfGoQKh/QnFQUlktqU?=
 =?us-ascii?Q?lOfsBmi5aXoQIzF5sxdrb4bKwtTdE5zG10DGrYGix0yFhgJNViyHw1wgdv+C?=
 =?us-ascii?Q?aqDzCY8qrYy8bz3l2gYxvqa+AY873E6IuBUV+MXnLQo8bhBiAErrIWYXQf70?=
 =?us-ascii?Q?44ra2TMOdJ35IZgLa9bt94Cf9k353v0wzHyz6mNq6PB2teFVOpZCRYYOKzuD?=
 =?us-ascii?Q?PgxGLxtOnEdjo4hsfBlG409Ac21lHJ27Z4qLYPYjGSg4gaPamE4qPoFWtDg/?=
 =?us-ascii?Q?nVczWBGseD5cEChEKGXFVgC0mMRCcvU4NxaTx0W7x1/njsw4V05oiDQYJ+Yg?=
 =?us-ascii?Q?STx8tcwvcdt1N3TyuNTQ55sSIrdc3LWUCnwW3aMwfEQ4JOMGnjl9ReTiXiWg?=
 =?us-ascii?Q?HqmDVPIM/bQyMKRT6Bz7YMMr8L4mUBV+Jo8RI992tlcOfirlf4CeGRs9OqL4?=
 =?us-ascii?Q?t5TrQ3r6Nqxs5r30MjAUVbqtSIErEYOL7/cf153YWmgoqF5gbz2hjlg7BiPU?=
 =?us-ascii?Q?AR4abPDwpw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19615c75-9f61-4f55-8412-08df042d7f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 11:22:36.4860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XOvbKOijdehVFKVGw/vQ9UcjdOApjsHLdwh8agVKZxMPMrheOFi8/hvFtGuL/Cgkw7OK9aEolDATxLTvNMcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFFB02F9236
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 11:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244477

Hi Alex,

Thanks for the review. cli-tests now run as the ptest user, GNU grep and le=
ss are added to RDEPENDS, and the QEMU image is given 4GB RAM and with thes=
e changes, 40 out of 41 cli-tests pass. The only remaining failure is compr=
ession/levels.sh, where zstd --max attempts to allocate ~8.5GB (kernel logs=
: __vm_enough_memory: bytes: 8597475328) on 64-bit systems. This exceeds wh=
at we can reasonably provide in a QEMU ptest environment. Would it be accep=
table to exclude this single test, or do you have another suggestion?

Best Regards,
Pratik

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, August 27, 2026 12:09 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] zstd: add ptest support

On Wed, 26 Aug 2026 at 10:27, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
> +    # Remove tests incompatible with ptest environment:
> +    # levels.sh: --ultra/--max levels require >8GB RAM
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh
> +    # window-resize.sh: 1GB window size requires >4GB RAM
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/window-resize.sh

Earlier versions of the patch adjusted RAM allocation for the image,
and this one removes the tests instead. Why was this changed?
Adjusting RAM is better, and it's standard procedure for ptests.

> +    # compress-file-to-dir-without-write-perm.sh: ptest runs as root,
> +    # which bypasses filesystem permission checks
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/file-stat/compress-file-to-d=
ir-without-write-perm.sh

This as well should not be done: rather run ptests as a regular user,
for example look at meta/recipes-extended/cpio/files/run-ptest.

> +    # cltools/: zstdgrep requires GNU grep --label option not available
> +    # in BusyBox grep
> +    rm -rf ${D}${PTEST_PATH}/tests/cli-tests/cltools

This can addressed by adding GNU grep to ptest's package RDEPENDS.

Alex

