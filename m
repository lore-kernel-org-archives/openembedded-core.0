Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5994C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:03:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6403.1789718606590046579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=CxwtFkJl;
 spf=pass (domain: est.tech, ip: 52.101.65.10, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8SP0k+978AThVnlC6qUOJvbfz/7OQLAyt+tLiRT4ZdQ8D9xL5Zb1tbPH00ImnqCD/vAZbKjYp5v/c5CfPz8FpxxW4jCdS6pG5/ToHpjSFydZpEckrnf4MLJO7gLDSRzFvDoRnLPWclgSvNEoQzeOvdfCpsykATKwpVuo+dGFHjcu1WWR9MvxGgQHfOkSwBV0BJdGX5maRvXRFm/Urmz8KJEwJXoxJDkz5a2XWwLiHzXOM0rWd3p5i8UKtNeBfzE2dI98wWE/2UXYrMO05EkyChV/t4HaQO1xKG6mzPV1t6UXKJJEMs4f2HnwtAtj6tkbNxEEiZtH+Jehwd5FvSzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEdOpCrhvbtOftaxcghb1TxqJhC91hvLU2AM1zPbC0Y=;
 b=gQ8g+DlXm5App8lIpSznSIOXaekqWiLHYpO/lOV/5phI/ucV8Af4WZVM44xXGLZ3lsDWYdnQ31xZxa6sgsIsbh6VyWPzRmMnCsxeKeKHLQIeT90E2raay/+rUMnL0+50tY2oDvNvQIICTUE5r8eSDg68jp1Pzk7dlyJYu9VrJ52An4dRGhpNGHB6QBUZSCeBVEoGe/MwqO18zv/fCYMhSk7KiI+CXorZoWf0FMeX1SbJs239uEpg7EYr8IkEb59ckfxUJK2uq7PnBpohsjVz6HrpLBI0hWZ6+y55JCbbL+16n4Kly62fsDI98O+vB/q/Gxuo+liqQp2UERzrhGmbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEdOpCrhvbtOftaxcghb1TxqJhC91hvLU2AM1zPbC0Y=;
 b=CxwtFkJlQBBTyXGA45A9HsPp/NjgAHuJU4142ciFodNOgFjMq6DVI6Tkonw+PlLt7/8H3Dj9mchBGXBIsnD/+UfMyrShYzwWMf3dpyF838TUdsSbHb3r5A97xVqJTzuKxGMhVo93ZtpMzJz6wZfwZzIVFBYNniG5rZs6mkToYCqhP1NPtOZBCmLAG+d5yxnquAtLKjNVrnVwvey7oNIf7tTJL93gF4Cxp83vLYARS6DvN4XjjXmIAv3J1kKkb+G7OkWY/LZ2pI64v2x0PVfHVrqrPGw97uSXUsq4CGkjOrQXwFYeaXhB5rJroizzMNM7qTHJ/IIj/SZ3f14Usv6PRw==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU2PPF595CB3F60.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a8d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 08:03:19 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 08:03:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Trevor Gamblin <tgamblin@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on
 slow targets
Thread-Topic: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on
 slow targets
Thread-Index: AQHdRrKJKGRVRBw7eUerTizhiG5HorbS6GYAgAERwAM=
Date: Fri, 18 Sep 2026 08:03:18 +0000
Message-ID: 
 <PA3P189MB3239E978F96431BDDC2053CFFE872@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260917144042.10045-1-pratik.farkase@est.tech>
 <DLHPE9Y2I92C.377RLG9OUQJQS@baylibre.com>
In-Reply-To: <DLHPE9Y2I92C.377RLG9OUQJQS@baylibre.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|DU2PPF595CB3F60:EE_
x-ms-office365-filtering-correlation-id: 27ded850-2cd2-43a7-6327-08df155b4cf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 1Sd19SFZ+3+CS78aJzWJ1SGLch3EOb41CtMuJT3ACqpyIPAclfDBiJ4nFsYxfE437xZWbTfjQl+l8EdzMGg4KmxGgcK36Y0ZEq1fefoQiT52LJnjPZUjgpmn+x6meXKawCm1vbi26yOXMf6AHtPuaLQp+1wSHHLU6yGEOTvHAESTvqtLlLW1DsGOhYilzeRHcUshWy+HGNBYzEZsX5OwOmIH5gsvr+7acYae6VT/EB4iQwRpoLicHumxOWpxf/h1ZlmnwRqZCHwwxKRszLCukdaW3zEWYJjEvWd3gViIh2hZt4hbzzkBPnydUxGkWWCcxySpIGD+Eurpj/R0cpHJO28WfdNsBK5IYuhBQcKwZ7Lfsu/fcNME0spEU4BcwMn083LAwfj9wSK4p6y5R1KdhOsYQqRyontMW1slvqFtdlIW/u4Nly9Dr+mlCRq3XAcvaiTTrwqPO4yg36ifE86rVrmsk7btdXTJMoVDUz3TeiKKDVoGsSbzVRsBfhXnxPBa/WjBt93tplAVI2puzfkkSoM7wU89iv9QAeJMK0V07D1Wu7D655Hshe66WUNUOggLASEFJ6QawM4FmoQ8A0AzGo/hgyK9Jl64bvKn4QP343TQ5Q6+MfzFmGKX4eedgRFLLoLtX+Wd/KBdRO6XpjQkb2Tw++JFu2ar58mBLQjPr1AZN21mhcHA5bG3ChE59guvK2j6MTli0sObl/EpxKL17fUB5lKjI8Y+IWVLGYpI+IU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wgqats260Gn0LXkfI9GElMOYgefUDkacbC8gawfFwJbKBnXU1GbiGh2pMDwP?=
 =?us-ascii?Q?9nG1acgoJLKlkwhPiZfODCm2CRl10psPBefl3TGfURTqSUfcWHGXPm5+WhQ9?=
 =?us-ascii?Q?RKo2F8tPeNqbsSToc+cuPxHTqziHqWC0G53iFrwacozdMK24XYLCFouxZk/x?=
 =?us-ascii?Q?GGRcLYkLuuopDcP4qbebcI8uyOqYWZIxhQeMCyFF0zfHQR4CKIKR0SmO/NK5?=
 =?us-ascii?Q?X7gg6XBpezI77V4iP0522PPjwqA3KWKXevzFuGXDKqqXBRlhpAV2YwFuj2Y2?=
 =?us-ascii?Q?sGNDpdcunDWO6DuE73xaOFcK00CDSxEPwDhRt35Ash2v/qHjcf7RA7Ns9j67?=
 =?us-ascii?Q?aNiDRc/z8pIxVaqDV/JcHklFw64jGUaGzfuaFDw+YpOskAQ0qSCvelt1Y/EI?=
 =?us-ascii?Q?vg3ZFh2Pe1p+DITzm+6Msks9cU1/0ifb42CK6oBg0nablQnZGt0tQlh9RnMU?=
 =?us-ascii?Q?X7x7xrfEKbT3sRWwgKH2rZF9i3zNCCvC4Jr4qhOOY8st2zVJjtyl3772FADx?=
 =?us-ascii?Q?DBkM7vCs3SKBFitCtyDjsCmbWtZ9wAF4PsywA2V8J9SvldHIoSKWdn1xBy3a?=
 =?us-ascii?Q?6Ss4bl0MpIvIoYvQ23IvmfehNtlcEPM2KAxFhhgomPod1ztCWihUF92T2LKr?=
 =?us-ascii?Q?+SXuvT1K4bsiHklqgeqQ5n+2zFwCl8kYEZBBM2STl7lR2eZOcpplBoPIMZZ1?=
 =?us-ascii?Q?2LFsdQa/RM45BYxYwd93XwID/6yUr5iuiY4Gh9Q1MtXTDTZIwcsqVzAAkml8?=
 =?us-ascii?Q?Q34WO2epUP37mJLcZDm1D0TxwWlMR6ursUQ2gdpYsaFxFD/WMj+wHCwGXkK0?=
 =?us-ascii?Q?NuNjAEOKWVXfCHPOM782EosNx3yMbkJnVE0r/xp9fXTi+zGzO3E7XYKc6jUT?=
 =?us-ascii?Q?F4erwnxukbF3iMeBHvscyJIWbt8q0pTU27gr0LPz06uuW7owZkwE0idcO50K?=
 =?us-ascii?Q?iCi+MfHmOibAonHrTuzuRKUjFTgbdo/OiU0q/nRFrhGK3yfhRKDXbRDs5xO8?=
 =?us-ascii?Q?4ScJv/slLTuMEh0i+ArwEYsH5SqcQSP7DpzaSP2iRVpAdwX9soaCFbUPqtcc?=
 =?us-ascii?Q?/nJkDmOyEFkTJ7N/Ft58OvX7ORTk3Hr/opwrZCEBo08FvcgOccurPy/T4CLu?=
 =?us-ascii?Q?Crzr/gm8b8MtB08AB1u5AEnG4ie1OyI4+ZXipl7Z2seWGTxw95Z4NHCypZY4?=
 =?us-ascii?Q?Kv/ofwQJm3rKsG9EhwuQGvL7pIViRh8V0XM2qCeVogHS6t/K4iEXPaDM6iwB?=
 =?us-ascii?Q?vgucgzz1m9RKbs+NcisNP/gEd/qfGYK0+2P2kZmqygRwfOvye+icvYayH5LX?=
 =?us-ascii?Q?wnGpzDYQpmHxqa2+8KTAdaIiG9SdSKPFkqwsR5ys7It7fSxVLyMnp/UO0gN4?=
 =?us-ascii?Q?OOqHGgIJSVeceN5NYm75doc//QL6L+rOsPhJa3xSRRK72AhtlBqyzqO0BkL2?=
 =?us-ascii?Q?CDCSxbD6phgrldtdXAzPjq2IVI+mxmPsDcTv2QP3fXLIRWCaNg1lGgAmEgso?=
 =?us-ascii?Q?u6ooBMwa9DAPVbhM0dLcjMEq9kdw3QH3oEeqNgcGQyFNOePtO0kI7rO2wq8y?=
 =?us-ascii?Q?pFyRxNulewojAjldCtFKPdk6IzcmYyb6/5j3HyDPej9bVPD/GA5QmxwjurUy?=
 =?us-ascii?Q?Mf8cr0pBQbqR2S2Nn/Fhj0rbAu0ugjZVpO4OtA+uFaFXAWIuu2Nkb75Wb0Vg?=
 =?us-ascii?Q?1Qg0eNE7v8fpJaof+L14IFHWkwv1wc0WiED89XdQrg7tA7RVx7BxGV2BMSaJ?=
 =?us-ascii?Q?mLVKIsK7Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ded850-2cd2-43a7-6327-08df155b4cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 08:03:18.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TOime8S5zyZs2eCZXZph0O6xHhybihi4Uzzmnved0ZcvKl6WQEUzGcbKZdZLGKsYYi4TCNNBhivQB0r4rrckg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF595CB3F60
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246194

Hi TRevor,

30s was just a conservative margin, not a tuned value. I didn't benchmark 1=
0s. The timeout only bounds a `pgrep` poll loop that exits as soon as flock=
's child appears, so it's near-instant on a healthy host; the ceiling only =
needs to clear worst-case startup under loaded TCG emulation, where 1s was =
too tight. Since it's filed upstream as PR #4639, I'd rather let the exact =
value settle there and keep the OE backport in sync.

Best Regards,
Pratik

________________________________________
From: Trevor Gamblin <tgamblin@baylibre.com>
Sent: Thursday, September 17, 2026 5:40 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout =
on slow targets

On Thu Sep 17, 2026 at 10:40 AM EDT, Pratik Farkase wrote:
> The flock ptest starts flock in the background and waits only 1 second
> (hardcoded "timeout 1s") for flock to spawn its child, polling with
> "pgrep -P". That budget only covers process startup, so it depends on
> host speed. Under emulation (qemuriscv64 under TCG) spawning bash and
> flock can exceed 1s, so the child is not seen in time and the test
> aborts with "timeout waiting for flock child", failing intermittently on
> the autobuilder.
>
> Backport a test fix that raises the timeout to 30s. The poll loop exits
> as soon as the child appears, so fast hosts are unaffected; it only adds
> headroom on slow/emulated targets.
>
> [YOCTO #16425]

Thanks for this. Hopefully, upstream takes the patch. Out of curiosity, why=
 did
you choose 30s? Did you test with shorter timeouts (e.g. 10s)?

Trevor
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...ncrease-wait-for-flock-child-timeout.patch | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-fl=
ock-increase-wait-for-flock-child-timeout.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index b30fb04e05..249ae09545 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -23,6 +23,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idm=
ap-h.patch \
>             file://0005-tools-add-non-newmount.conf-config-gen-profile.pa=
tch \
>             file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-sock=
et-.patch \
> +           file://0001-tests-flock-increase-wait-for-flock-child-timeout=
.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7=
a285c695f940bd57"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-inc=
rease-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/uti=
l-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
> new file mode 100644
> index 0000000000..60b6c86eeb
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-w=
ait-for-flock-child-timeout.patch
> @@ -0,0 +1,38 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Pratik Farkase <pratik.farkase@est.tech>
> +Date: Wed, 17 Sep 2026 12:00:00 +0000
> +Subject: [PATCH] tests: flock: increase "wait for flock child" timeout
> +
> +The flock test launches "flock ... bash -c '... sleep 3 ...'" in the
> +background and then waits for flock to spawn its child using a hardcoded
> +"timeout 1s" around a pgrep poll loop. That 1 second only covers process
> +startup, so it is purely a function of host speed. Under emulation (e.g.
> +qemuriscv64 under TCG) spawning the shell and flock can exceed 1s, so
> +pgrep does not see the child in time and the test aborts with "timeout
> +waiting for flock child", failing intermittently.
> +
> +Increase the timeout to 30s. The loop exits as soon as the child
> +appears, so this does not slow down fast hosts; it only adds headroom on
> +slow/emulated targets.
> +
> +Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/4639]
> +
> +Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> +---
> + tests/ts/flock/flock | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/ts/flock/flock b/tests/ts/flock/flock
> +--- a/tests/ts/flock/flock
> ++++ b/tests/ts/flock/flock
> +@@ -65,7 +65,7 @@
> +             ts_die "unable to run flock"
> +     fi
> +     # the lock should be established when flock has a child
> +-    timeout 1s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1 =
;done" \
> ++    timeout 30s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1=
 ;done" \
> +             || ts_die "timeout waiting for flock child"
> +
> +     ts_init_subtest "${subtest_prefix}non-block"
> +--
> +2.43.0



