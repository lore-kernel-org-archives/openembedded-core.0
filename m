Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9127CCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:36:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7943.1790688986604292521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=WAq0ay2q;
 spf=pass (domain: est.tech, ip: 40.107.130.67, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/r+lFS3OzxNJ4eWfF86deWnrvYK5PhbYe9avD0g4YRLg+Blu1oXNewllO4Mamnmqv8BqO1Mc8ovU8X6GIMjZSMtGLDb8hk2XvRDLb0QKeBaBTbQIelNdMx96JZrC1JTr+ZJ80EoXy1+xTb3A3ojg4UmHpf5rD4gZNrhg/CEyYzbJe7Syk1XxisArHJ5Vc5cBDw01bfd/FRkd43JXFcy6cRfYE3a7qrejwRi9fNc/MnYRvRNEdpUnA5EvQB662Cr2rgdXRKAjiiVMSmpHTylNGvUUNRJ6MoIoMz0gO1OH4YOXrUkhwpenojEWWr4yf3R3l93qri0rUpbjwEnp0Mc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=152yPwBdT1A6+XAKAxOnHc7hUNuxgXsUMl6NJbv784s=;
 b=uKo8tSnHI/le2Dw0N/Ta31GP1DSrPLcDF1kCJbtrxKS3EtKiUeQtyuZSFIX2FcwuInOTeHvB7gLkwDTjxMZ4+AhZPzb6BF82y3CrbcsG6n2WEgqVXfEYD/AJOm4K4TzkyobuzZ5PLgyzIt0aA8BsCp1XTfZvpIPmb4wQ1OLgN22w3HiBJAAq/5P+eTBaulG5bxAEZ/XcOQhvZnQdl1Fc1ChyC0ozyMMuiWhONUAjh51l/8z7YOdrN6iCaazSWEpEauFWTWYVTGq3xqEvGpEt6KtJ8Q7TLhvydGpWm3R3YatvGjp7jEUb/KkG512b2T1Lzh7SX/+PdO/BJzEHbBl1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=152yPwBdT1A6+XAKAxOnHc7hUNuxgXsUMl6NJbv784s=;
 b=WAq0ay2qLk1UUuRTvvVSua4DtLchJDisjeRSSTGh4FBeY+pCZPfRJBMTXTNjmQIjqAuYCOz0rFnXjU6sH99xvp4IWMk7ZvTOdqEqA9+vqRVWq47YaFAqXJGMCWIN0NEV6ELYVEqusUgvBsgmaTJgb+pRngkYa4/xNzMRhLhx2DKJtBpjawcS1L3vdtD+VaejviMysEn4THowQNvd4Hu3oe5pBZrmbtKUhODrETAYHgzrEp1Owf1Yg7vkFLA//sN16k467WwStwKxM4YSm7uiLBZpd5b8RVYs21sTqpikmbFwjAcqt20G4QUyRv8WREUzHUKteurVRNCog9RBO7uilw==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI6PPF1E5331C81.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::18d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:36:21 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:36:21 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on
 slow targets
Thread-Topic: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on
 slow targets
Thread-Index: AQHdRrKJKGRVRBw7eUerTizhiG5Horbd3scAgAfCoG4=
Date: Tue, 29 Sep 2026 13:36:21 +0000
Message-ID: 
 <PA3P189MB323918DC976A108BDF9D4429FE8C2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260917144042.10045-1-pratik.farkase@est.tech>
 <DLNN0UKBU6W9.DBNVVHMCG8DZ@smile.fr>
In-Reply-To: <DLNN0UKBU6W9.DBNVVHMCG8DZ@smile.fr>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|VI6PPF1E5331C81:EE_
x-ms-office365-filtering-correlation-id: 4ffa5e42-0dee-449c-eef5-08df1e2ea628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|38070700021|4143699003|6133799003|260925021311599003|10067099003|260925022911599003|260925021911599003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 9YJG3CH28kJConyvR1c/Txuv8gBWoT7MnxwfefE5p3ETRrxODxsOsaFCTcH9x0D2K3lcNVtdn2arVjLOp09S9nJ9Pt29FdUur6+QsitNMKfJPDQGJm+Jp1T5rqa6I2/kZrWhJV2jOFrm0zyS1u7FXZweS1fbSMOHXh7LNVG6+QNujn/I9Pru/FIdl+cQgIMLI3vcZGOB12s3+5VMsE9SfhMflS+C5GUzXm+aBvi+SLegButexwEr++imUJnYLebzQyY3y8E4uljvJXoXAxDZZO6BTpxs+iP7rQ6AcaCV/Wv0xtMBKcnoGbq3reJQATNjF3FqCrwiU8S3M3rH4Y00PhK6UQvAaHGmD/GR2IoH5smdB9lwiKZlsxeiLEngI2XODZqJykGNu4uSdvMBYVKfCT4XMj5uRmF6cG/YQduwJk7L/4nbm/2Gz3iNC6CInW0Dw5ZLb8gavQ13nVWqo6131AadWGhHmRD5Sis7h8Wzl1AAFBJ/5aXncdNLXiVsiDulURe18tS/QRm/gOr62nox/QUrHYYxAZxy2ZpDckbjWaRlhwir4+nNFNtOlLEfPoGSiQFuIywYLYxtlTgYt2Mec6BjOfSF+CLqVjd03ab2gThK16hCPQHOmbC/r4MKy5ZLIcSMRq+Ou5XMmRspRAHsKl8JYUeJGgOelsRZ5aDbglA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(6133799003)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hNzNZu9uTyetWxfQtqRuy2cJquyr8OAsO5Ljqiy8W0XDcknrAnd0VrYMxnoZ?=
 =?us-ascii?Q?3bvywllJaCD62F7FvLFPhXLvpv/Hd1YNa9+QlJzJG1pTwZgF2MywgttLddVM?=
 =?us-ascii?Q?cwwUi40YTMHRBCwMJWJWfsd4DLTppA57pjPVlyOPeYZtXnG8WcK7B7gqQb6/?=
 =?us-ascii?Q?uqANYPk7Nw7wEkf7OrHR8JNpKjho8mdpUgjNTAB+siuThsyNtBDZVTP1WBUx?=
 =?us-ascii?Q?BJEfc12y1M6HTtu8bnARdepIz0JpKtt0OlepgDFq57p6h8SRjxOM9SpP0alJ?=
 =?us-ascii?Q?fv2XOKbFcYKo2v6V8UesagOljXcoBm3adJ7nON0fK6UFKfF3mZWWNAQkxQy4?=
 =?us-ascii?Q?giXPFeEYOxsDdBoGJMKWNpmPvSs92sjMIq/XImAl9z+BKnHPEBGcYZP7wkfI?=
 =?us-ascii?Q?iDlC6BuSz/jugprR7djDlYnWupTKeKslv2JxhW9VWmw9JR5gwUaqW0BRrF0U?=
 =?us-ascii?Q?lK14lHlozUUc8h8otxF+ee9OI+KZBK5VJ4EKf0Yq22aKu5O6V/ZLtnRW1Hgy?=
 =?us-ascii?Q?btJVbr/NDVWtZ9MQ1v6K2YBVjKlQQdf3kXfUA+/KVLA2mbbsk8hMQAWqlzjN?=
 =?us-ascii?Q?F6N+9NHHyGzkComGstF4S16EdM3VxsKCf/WR+98/7K2UOjR2Y7LGCfKOQAGW?=
 =?us-ascii?Q?l2wK9Gqx7NszDXFvmuUuP7v/q0E5ijJp4gDmT5TqIJiIww1gGairRx92esyo?=
 =?us-ascii?Q?TBjQq7RoKmWJguYFo5RUKGHh/rT2IuOI7SbaFSg3fCmx4KEAPdetdT8gefiz?=
 =?us-ascii?Q?JhO4kQ+YY7HMaoWBb6KoYIc8P8tdI89u7B03ALGEdk3vOHd3oNJ+jfrc7AxG?=
 =?us-ascii?Q?d4t29TkgwvER+ntePt9PgpscCfgOcIibB4/7VlZr5zEiMl2u1LNyumhUePua?=
 =?us-ascii?Q?WXSf2KEblIbANZSj7DAqU7DFYKbh5GppCOkfi1ZYUTE1SVyEs9PtLNzGN3DX?=
 =?us-ascii?Q?OiFWTxLIzBfVj2NcCzJblt3Z29F7/sY+nfViHu4MzgPdwzQu7uwmWeTSlnYQ?=
 =?us-ascii?Q?AuqdOvVEkg1ORlSEXBG9glv68wFtBizPiBQYavQTZQn7QHrKtpx3suCX/2R5?=
 =?us-ascii?Q?Ci/3dMbGrtXQ7mjzH/N+2YPPA1LsIBsihO1c9O+hKvspBZAgCJCy8tk5q09V?=
 =?us-ascii?Q?R54SUSP5rL9oBjOFFJX1Cn3csXv7aOrSDWpTJvbAZHykuMc9gDK5gD/vFJ3N?=
 =?us-ascii?Q?wuUOMfCtR3PpADSewdTlO5FDa/6HBzIQ6LLXyDwF5pX0uxu4hi6YJrWdfYdX?=
 =?us-ascii?Q?sYrXaLObTUpLRDOUw//eYti6auPZ+HlDwUqk0oKOU+Ks/JNC1gVLl3hfiQ/G?=
 =?us-ascii?Q?2O8g4rDMJOzYGMhn/+tPUFZeUxp2qqkN2NMZ2p2DLfQwg3fQfWD6sbfGiAPO?=
 =?us-ascii?Q?hM4aByxtuicrxonOr9D2DlqrGembPafvQDlj7s1/yn4k8UPN8dL5csov0lbv?=
 =?us-ascii?Q?KxjBK4LJNY4fgtB+p2rRIBrG5jhlFLyQdT2V4MCll18w7AgInywBULACOA9a?=
 =?us-ascii?Q?UbnFglxNsPbNoAguTtbJ4/Ui0Oc5704lBbsi2ocCtopPDOA7IDaG7/wfi8rb?=
 =?us-ascii?Q?Sx97CgyL0NPXEXj0RoathABcZoR0ezlj7HmzmC/4dMwWhbOtcQK4aU8jNX0I?=
 =?us-ascii?Q?BM1936sOMupT5Ic/zjODJNz9PZ7a4W+RTm0GPw+o/qQqtBphZ9kLY2kOgONG?=
 =?us-ascii?Q?UUqZNXYhsa6jwq8hxmZ22pyt6ejhcGZBlHNQDFWhALUpbS32?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffa5e42-0dee-449c-eef5-08df1e2ea628
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:36:21.4495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJMFncdKiB8SYyupERrs86BOLM6Ha3VtwWXIDx8e5Drl+u9aF/whv3Kqfg1Ib6I6xpzkn6ZA3UoCv6b1Dj4kIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF1E5331C81
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246870

Hi Yoann,

It's on the list as a separate patch: https://lists.openembedded.org/g/open=
embedded-core/message/246869


Best Regards,
Pratik

________________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Thursday, September 24, 2026 5:05 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout =
on slow targets

On Thu Sep 17, 2026 at 4:40 PM CEST, Pratik Farkase via lists.openembedded.=
org wrote:
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

Hello,

This patch is now merged (Congrats :)) Can you send a follow-up patch to
update de Upstream-Status?

Thanks!
--
Yoann Congal
Smile ECS


