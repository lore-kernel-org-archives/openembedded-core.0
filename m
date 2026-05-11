Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C8BCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:00:45 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46222.1778490041263642939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=kLGeOiQt;
 spf=pass (domain: est.tech, ip: 52.101.84.25, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6nkzcY2iluy2OzajXWLVXkUL6ozfKHtruEwdwzdWrO0ofVsUFtZcqVpX1X4Cth4nn4ul2eFb9DFinZX3DIamG0URH2U45TgH5i/cwG0ieJoX8TkRyzjWezG6RNE74mj2M8XJToZrJpDYZ60gJve2l7hfzpB/byxb8RKJTIR4W9Clm6BudzAOY9TsZxMnesUMaTQh+AG1TvAJv3VAUnstrfICRqNhQ5bdvghAcGlY46TlA/H27cAacjKYsjn94LcGS3gr1Uf4yb3nZLLzuzP3tiqAkw4bX45zBxNq8/cI7JGjPz51l2K3OSCEiM5su/COTDqaJipfJEWKXqs3TPE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIXfDno0WosrePO0JErGWnmLslS9uJxELt7w/ipIo4M=;
 b=wNmVukhA5pVmnIu4N9IsHPNw5phtWq5hwL6NWv10G0Cjt1Kgld6qsS/N6px2DAKQFZuDc+uUXHFwwA2QEL3eUIKn450h2XoOApSuVgNrT+ZrUB0emo1nwqasL94WaBiGbdPkD9uMYb25egxnCXBbAhW3v45JSumW9SQlj7iPgrS1F2P9b5uFIbvGwTZ756dP4Tg55AgxsmL1gkLBua3czz9gfaivGwY4hrcTeTESmAenoZI3SYAogeZmNzouC6seLzG6w8BMTFO6VQQqmkYJ5m5jlWaDfDCKxXS11hXU/kgtyAHmCLdsh3yx4nwh5qHmQnWjqb9T+dMUaADU06UrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIXfDno0WosrePO0JErGWnmLslS9uJxELt7w/ipIo4M=;
 b=kLGeOiQt834G+jR/6ycmudlGwglAvmVP2UkdE9xt8jCNUC7A0rYeZSY+Tks8tN2skAVf4z4N7TA5eeg6rAn4v2JHHu/ehldEpBUYH+fsNby0NE3NHu95+r30g0x3BwG2/GbhdPdW/qCO6RGJWgyZPMvrrJ3nd3nnkFh/wzvnfsdgqyK0cmIBdT3QJaCoCxwC/vPMK3h/XhN11xPrMWmT30q/kzByjb5uPTHOXO/34QZsjq9yORlRadAIm4jZeKgr1aN5ryTi3Yd8b1cUvKgLVaP3/ajNoWBs+xPGYh+hMjaWhirVsLdvKOThF73b5DXB60caKl3WHwpb5O95+XHm+g==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA1P189MB3392.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:00:37 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:00:36 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Thread-Topic: [OE-core][PATCH v3] libffi: add ptest support
Thread-Index: AQHc3t79HFJRIyPmnEaLI9NoW4xm/7YIW9SAgAAvgyA=
Date: Mon, 11 May 2026 09:00:36 +0000
Message-ID: 
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
In-Reply-To: <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PA1P189MB3392:EE_
x-ms-office365-filtering-correlation-id: 86536e4d-60da-4461-5248-08deaf3bc475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 M+ZGkNfR8VphdSJz7Ei0FhHbEo9rFIqNWfow3lUyzUh7TWzdmcoK5uAV2C7yGi5fwpD6oqAzrNq70agRW8SIw4owdWNwYufQzrb4vVqZqdP3aWqoSO/h+d0iSoZGcKhAJsH4EvQ+cPFRJsUekjBJPU1X2YUtjrGtlMIyiNpvL6rBFLd5c6+qkynl6Ks8UzVrT3plxh54aukfLfyu+ErooEG+J0+waeBLu6UO3c91JTAaJPPMpF/jz8XZaQ1hyVi8qAVTsJTwOV0/05J+HLJXmF3rqx0Pk8CElOZfX+0oAAISfO6I96124rdY6ixaucpoisgahFTGK+wUIOfCfq6nFNEsg7eBRWHmXEOfWkDyNYeow2OJrmQ5W5CZzmabV4MO1MgzsPQ2mbPSKI3R+e2aO39AzyiCNqgZL7h+mFU8ZCZguzQqv7UtFwXpF66VQBFe9hmxIE+6Ag4qMcy0FKGBIP4X1OhtLDc59BZHjAYbTvkMgTqlBzwlHBOhY/WdR3oDfzMW1YTnZeJqRFZSWZPen92iVrFW9MVNuP9a40GBiM5Mg02k6Xdjunghr86c13xfV0aNe+SRMg+Vu4ss2fq89qg8hSqqBZKsCNmyvlqf1bUft81JFV0DeLIWETxhxDDsFuGd0F6tl1UAQq7h2VP99qOYBnFPEctkxiawpMS5MkmJanjYoG5D1NtL4Xv4lTNE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?oo1oHLUXOHrRlUU6vLsTnfZNXAWC3FYI6fF/4Jk7mGXvTBQC2Yfqfrgb?=
 =?Windows-1252?Q?OtNMZRSRzikZQZJs7cD+lZwUZ2mDsW+oVJdCeDt1csjOtBpQwq24W1cl?=
 =?Windows-1252?Q?fN/O36T0o/J5yD8aESUd9Q/AkCkMi6zCCZSqftRin3CKrUuBukDLGEXG?=
 =?Windows-1252?Q?+1uc7DIohzKvEIUjCLhGX4WNZF0QIYQ+JrN8IxzwBrUfiqBpeDcJcu2w?=
 =?Windows-1252?Q?UvAdxWygES4lqBCEim7hppUjcvt46QEdfgy0I8kM8MAxuhBU5y/Lea7Q?=
 =?Windows-1252?Q?yHd09n2VIJ3Sehh7bI+GTmwY/wc4v9ZC9TLQ7QumsOpRLj1+SetWSlzl?=
 =?Windows-1252?Q?Lc+nkKuOhk02kHaIXK8frgCO/+qiVLbrQZOpC9WOW8QGUPLyLX9oxWtk?=
 =?Windows-1252?Q?jG5ZIK+XTl7Dug55QZJuAY7nuLuLhyWb9cY4ZVtNnGYjPrtzrHharANy?=
 =?Windows-1252?Q?SFJw4UewhCW2sY4AgsKJysCym1jxOCU3tuGh097csJkv4Qpp3BLy9Yc9?=
 =?Windows-1252?Q?xLZq1+pM0LMYrneAhh56dttdbN5s8KsE71b2CnF7BUMB8xMSqIJVtspU?=
 =?Windows-1252?Q?JHpCqcTEApolPVoPc/yx5QA52CVqiYMnvNcnfUOpWHYGaxSN1h45wQAS?=
 =?Windows-1252?Q?BE49pBHWI9nEhnvkPIJZWkFQ5mZxAph7Y1f3GtJvKWk69izwohVzb/xQ?=
 =?Windows-1252?Q?MQ35VT1BYcMOQPVXN1/4W2MJQBZ58G4Ud+vzDL2v6bMvZ+g5h909229X?=
 =?Windows-1252?Q?+SGugv5dweGpQVTUcrw0MG1sJtHxPOhlHc+JirVoysAjp9RybmWRtr42?=
 =?Windows-1252?Q?Amv9lzXmzOqjY0eAKsTEzXwdz4aY8XaXI8ToV+3wPS4Nw2gup1WJgQRm?=
 =?Windows-1252?Q?IWGzx8ag80x7OCq9v3SgBvIMY/ZsyzL+LXg7OC5tk+/5a4x4nQO9d8fS?=
 =?Windows-1252?Q?LGgbM85EF+nCCN5dPUNG8P/+MNf4YXoTSldQGvwCqsOGI4qIeMnaD71b?=
 =?Windows-1252?Q?UXBnF+551yla3uCsSvL+byua6/APkj9YBBPFL5zLgt9vhMeuWjIDbQMG?=
 =?Windows-1252?Q?LsCfRkO87K21ByprrcdYsNM8z4+LNTr1HvNg//nKIbcXW0w8TIvySWUP?=
 =?Windows-1252?Q?h1ffAYClsJWHfnz5PUA9zt94tefnwAllccl+IaZhTMmpO27H9qp9P1Q0?=
 =?Windows-1252?Q?mfB5rX8q/eJq7f80Tp9wZgoDxvRISRBNTi3P28NilhPFxk8DM5MmVBom?=
 =?Windows-1252?Q?3bUsAF0/wH9Wet4c7GJ7lsOvfcQXYTVDlNO4nMwUuEWZctzpjRIO1+CV?=
 =?Windows-1252?Q?qR875wKP/ukvBhJh6sdY+l/cAcYePVhYwkAsD4KZV2KL4ix/b+kuWDNo?=
 =?Windows-1252?Q?NOWtF+/MkG4Ha7hBorn2Qz9rRQ5UFmmI6zO5DbLu4wdHpH3L4xlETcg2?=
 =?Windows-1252?Q?OzxAyvlrg1S40xO65NnIfJuSraphO8YEb9WcSCCGyds+LzQxvtPX6iQG?=
 =?Windows-1252?Q?J9n9Tq0Lj/kLiaV+7P8WFs9MbTP/FPflntj1JjOSP4K0KIrVg0nUjsyq?=
 =?Windows-1252?Q?jHruLgxIfs+88xoPvPaolxBAHpsfcOe+h7NyjMPXTfICCNaAW3EYTk2i?=
 =?Windows-1252?Q?CEkAK+HTIt/bv2JOzZlFFdTUAepnX6n8caPrdYAMgoOGYNEQkqHmvU7G?=
 =?Windows-1252?Q?OYA0nYoD+V35fG5nMAM/72wj8Vp4LMmKNntGkMjdO+lEyxABoaBFvg79?=
 =?Windows-1252?Q?fA21DynSImfqHxuCGUyeRRrmhQS+vT5jZtTEUL/phtlQTGvmRGJQRLy8?=
 =?Windows-1252?Q?kyZS+dPFECwrYqa6m4xaEXhD3RlCRL23rS984Un3gGrvDB3fwUEeqgvV?=
 =?Windows-1252?Q?DhjBz5IrSnhjHw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86536e4d-60da-4461-5248-08deaf3bc475
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 09:00:36.6538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EkCuGxVN+R+vYuQFZtBMLM+h3wMDaATbDaEKj/0YWXFUk8ThErZMph1DaJF3pdqKB+GWDWBEfiLBI/NnIbJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236787

Hi Mathieu,

  Thanks for looking into this.

  The glib-2.0 locale issue looks pre-existing =97 my patch only modifies
  ptest-packagelists.inc which likely invalidated sstate and exposed it.

  The multilib symlinks conflict I can address in v4 if confirmed.

  The complex_int failure on riscv64 could be arch-specific =97 happy to
  exclude it if it reproduces consistently.

  Let me know what you find after further testing.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Monday, May 11, 2026 8:09 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support

On Fri May 8, 2026 at 1:36 PM CEST, Pratik Farkase wrote:
> Add ptest support for libffi using all upstream test suites: bhaible,
> call, closures, complex, go, and threads.
>
> Tests are compiled on-target against the installed libffi. Headers
> (including the generated fficonfig.h) and a linker symlink are installed
> in the ptest directory to avoid depending on libffi-dev.
>
> Tested on qemux86-64 with ptest-runner: 199 PASS, 0 FAIL, 2 SKIP (349s).
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the patch.

Do you have any clue about why this is triggering some selftest
failures? I'm a bit surprised by that, but I confirm it comes from this
patch:

2026-05-10 16:16:13,784 - oe-selftest - INFO - locales.LocalesTest.test_loc=
ales_off (subunit.RemotedTestCase)
2026-05-10 16:16:13,787 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps=
]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-=
deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
...
2026-05-10 16:19:03,004 - oe-selftest - INFO - locales.LocalesTest.test_loc=
ales_on (subunit.RemotedTestCase)
2026-05-10 16:19:03,005 - oe-selftest - INFO -  ... FAIL
...
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-c, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-el-gr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-en-gb, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-es-es, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps=
]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl, but it isn't a build dependency? [build-deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-pl-pl.iso-8859-2, but it isn't a build dependency? [build-=
deps]
ERROR: glib-2.0-1_2.88.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepend=
s on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
NOTE: Setscene tasks completed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3929
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3827
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3696


I also note some is install error:

ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. Co=
mmand '...' returned 1:
...
Error: Transaction test error:
  file /usr/bin/g++ conflicts between attempted installs of lib64-g++-symli=
nks-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
  file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks-15=
.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
  file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-symli=
nks-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32


Finally, I note a ptest failures (on riscv64). This one look like
intermittent, if it happens too often, we might want to exclude the
failing test:

Failed ptests:
{'libffi': ['libffi.complex/complex_int']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1576


I will try to run more tests, as again, I'm a bit surprised by some of
these failures.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


