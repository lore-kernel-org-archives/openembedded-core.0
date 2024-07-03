Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9728C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:34:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web10.57694.1720031663266753667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=HzsEDha8;
 spf=pass (domain: navimatix.de, ip: 40.107.22.110, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F68HXCq/bT0dIwZWfQTKK8TjdROCpm6ZJkYBholbMxOqNg8nxRm8MNaY0iUHveN7Ro0RWEn/D9qsmrOxBRz5aHUPe/yx8NZxHX7G3lvwJTUlYAoR8Nl1Ltr9KiFsSc7XgBpQ4byTzBeMqZx0hWG3x4EWHRfSthm7C7BKJ7/orx80pRoy1Tb7hKIfFQSha7f3XaHtShBiNRhKpeqCK4GtBlqQe0v/v992iGKzE5+64V/HJI9hkWL5vLuOlnpbe6KVnEq3iabOt/UKOBL391MQ4HbCPXQOiAvuMECbaUKIjNSi92FyO2AXYTTxJnA71Qb0eC5UVvG33MzKBvNN//ZIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul5797Nysruuji0ODooIMXp3n+mRocwov0Qr10nJeRk=;
 b=AMJswGK3pIU/rDKRh2E7J+pkCY8OXKCLJmm/dermkJuXYMB2LmFj3AapBZWKuJkXK0T/88qxDHTn2tdOudx4l6jY3DWaER1eAu79psHnCr9IWzDxoTTFZZcntuLgF4I0y9dhAIv/V12/N12K40n6XVY6EBF8sp7sA+yRsIIwbovPS7c83taRmdp3O7dV9KdpOGzaAGZcl2Wp3jIAvIo+1U9dUr/QXn2f5dkSkcp2B4DlcXP1/n1cFGk5cBZnvx+POYpVEH76/sHKfSV4wP0h6TKtj84DQ+9Jvjvce/9d+jm70oOjIdedF9UvS2Ys/Rtp2hNU4S10BKVpKiM7P7DKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul5797Nysruuji0ODooIMXp3n+mRocwov0Qr10nJeRk=;
 b=HzsEDha8a+nGAEK2nzyWI8bTS/oAFfPGBBKzxQVZR2YRwGscm9wNmZm7U3uCDwvspl8lfcgH74t2qfzwDAoldHBP12V/1Adkcawa+JhPMM2AuNZaaOe3OSMrwxrGrMa+owZSaDaSZkRUCoRSP/JsFnQ5WJd/stVQsLtSXZPDxYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB8917.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4e0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Wed, 3 Jul
 2024 18:34:18 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 18:34:18 +0000
Date: Wed, 3 Jul 2024 20:34:16 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
Message-ID: <iwh3wbdnsoxke2t6j7qud5qv4rfz2fljcob5y5nba5afrsxpth@ewx65frf4g7i>
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="prfojxlqk2dtyydm"
Content-Disposition: inline
In-Reply-To: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: BEXP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::28)
 To DU2PR01MB8293.eurprd01.prod.exchangelabs.com (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9d5d4e-d26b-4f60-32dd-08dc9b8ebfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?UjFA387Y1YJwB7MWqdr8TpushXfcp87FqtWC8sk3LPxtmtM5G+JqmUz6nR?=
 =?iso-8859-1?Q?SnUq1JTa7rVVgFuVIFq8Edjx7scuJmMtyvS0PgVsdg0WYRuS4E9j56M5qU?=
 =?iso-8859-1?Q?xk20vdX/4+vCY3KyBOdeR6hNLsxW1hcXgnrWLsf/4GUrn3EpdhwgvPUMth?=
 =?iso-8859-1?Q?MBu+TZunWZ2j2LfYvuKc1RMJE1d5s4m3GI3IcxJsV2ru2zAEHIOyOY90ap?=
 =?iso-8859-1?Q?PCb0RxxUwzYDfBT4VqDDFpWI8o72JBO/o102j0UtlrXJ00NUFJmhOF+1Jm?=
 =?iso-8859-1?Q?fgVYs9sMb9HW7TCE58f0IJG2P/nzB21Ml1AAjRvVfPoD0TTeCwD996psZW?=
 =?iso-8859-1?Q?GTuydXOv5r6fnNGLv++JE9DasPSdykGzR1u+5EfivSKNOU+8KNNoeUQuUn?=
 =?iso-8859-1?Q?dVh+IwhNDanF0l7LJahEZcaf/UoYCi732z3kRQywcfHSsYK5UCmbreVWRn?=
 =?iso-8859-1?Q?81lM4un/XgFWo5FlmMPGNqphBM/XxPZxk+GvsbCJUVraz5lrC23ZJgZqv0?=
 =?iso-8859-1?Q?+sVB/iQdSPHELAJ4zPWbZHzx1tSa9XkB4ucbR0ChYrk66gE3RsKPpwFRHj?=
 =?iso-8859-1?Q?Clap6/uzUpeOGWT7MwWn/Sepx8O2plBQ6AlwT26GzvAt8Ts5utZ8bZlMEy?=
 =?iso-8859-1?Q?4mlc1VUkUyhT/Hdnq97cp8BRgQZXjj5IHr8hjMBRtLsr8pMFhZfu2yIxH/?=
 =?iso-8859-1?Q?McRzVrewRaf5uiDAtUBSdK4BUVkZ2TfcE/UhMXOmTG2dl5Qdh5Mth9ABrA?=
 =?iso-8859-1?Q?k7zaH0PhSgC7WKaMuznHbdBiR/brkkkhObCMJWBIpY0fz7BI0aqKaarApQ?=
 =?iso-8859-1?Q?CuKOuBMZvu/6pT/vN54irRh86Z5Zqg6B8F85pdQ80GcqpmlJIKfnVoIW8z?=
 =?iso-8859-1?Q?iDmw3Ef6G3C2hyRmSHbWMbsQ0c+r5mbRdKb/shwdjNpXKwCpzfrb7IOr1k?=
 =?iso-8859-1?Q?qWEttmsupBibuaAuEB6Rip+WWyjpFZkSFeKCuMp1uNpfu7Aft7pUXu5Jjt?=
 =?iso-8859-1?Q?SdB6aEUgyCLVTRd0X34wheKYtiZQ4RRy+bFUrw36Nszy+iapYLpVNrl8no?=
 =?iso-8859-1?Q?nep6451ztyAPZWXRTn9Kruw7FsgtCYWXzVMzh+EBJqAXyEkoqzMwEjgbLm?=
 =?iso-8859-1?Q?aRLUjxIajt3Eu20FxxdRNnI5l8jN/g2+ITi10GkGZhbsm0GDoH0G7et/fK?=
 =?iso-8859-1?Q?265ZCH/PZ7ObOQkg3qHkVrONLWrBzxMBpXY4e/Tii8c4BuuMWjqSnJhKv/?=
 =?iso-8859-1?Q?7Bkxqaj9AxC9RzdMAfHDszFQcFqFq0NA6zUtA0MTty+2oBjRgyaCTMlCDS?=
 =?iso-8859-1?Q?S1ZEKixxE5kl665984NRF/nB1RlHBgGzhBbzsa0ax9UFmmI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?hpeapsQPPNxvmWpumC4yvwWwtee67+kHkplGPJlgw3poa9GDYGauwtXELZ?=
 =?iso-8859-1?Q?s3EuWBzeNPpAh6ia39245xGKWq7ELThWFFTdXR1gcW7CILixgmAzMrntfJ?=
 =?iso-8859-1?Q?Hi5XGZ2bkx7VdSJrud4O+D90RMGks1wWLfKuHWwsq3/qUhOdAMHO4Q7FYj?=
 =?iso-8859-1?Q?+gOmNd8kfcOmLn82TDA4mKilMyuo2eFWsNBdGmYCvZUgkZXelgGZKjZSvY?=
 =?iso-8859-1?Q?q30wAWyEfx4fF6RApbDflG1xPET4nKjhhMfI4n1Dp5v+RLttV9Y8pBNaKl?=
 =?iso-8859-1?Q?oawoR0Bl4gKQtLDkYIDcs4uhrYshVI1LetnsFBruiUnz7d8S7xnNbMlhEC?=
 =?iso-8859-1?Q?H9lfJMmuVlIKnxfsp0t4QCjRP9185zZO4uA67XFqQHRkR9TYMdinFDptEh?=
 =?iso-8859-1?Q?3aSRuz5yHBngxaFu8u9uz9p+LGDX8693K3/L41X5bKzoVkGYzUc5gbgQpf?=
 =?iso-8859-1?Q?kt0HyxgOYb4tZyH/w0Mjj125yWlhX+cN/rsh1/Sc/tVMSALShx2XZFrc6/?=
 =?iso-8859-1?Q?IG15oF/9rx234459MBs+uUYmHA0hhIkEuvBKqbwmXMtAa2zUoN1C5m47bZ?=
 =?iso-8859-1?Q?j/7LJSuMGumaWmxI6l+i+4HzFINcPGxhKawCxxmRkUmSAIqjn+LkkS9gff?=
 =?iso-8859-1?Q?RQI18S+Lg4Nf7zNNjjl6yNj1lV8vwpat9aE/oPNw7amByPGV7uAFEexIB4?=
 =?iso-8859-1?Q?psf6znePF5SfUqqCkbTPKC0v0HB5wg9FtcG6TpgsI2FYMS6qxv6IkvALgK?=
 =?iso-8859-1?Q?SQCguKyUeOKSimcHVewlhgDAJe0sFmqCeSIGKtqQLvw/2oBWIW9MOP1lui?=
 =?iso-8859-1?Q?lOutIhasntAD7WuF/EtL3721PbeOn9bCpI6EOFwazyATbhpRs1H2V7I65c?=
 =?iso-8859-1?Q?VYL3Sd80nYjrIGZWbZ2FRA19Y+7QtX+wLJlZqbP4jcsPyC5w5KK0f37C71?=
 =?iso-8859-1?Q?nfr2I2jaTnv6Bu9DVN9N2xjqB/6niNSV7ezFxUUNBW5MvylhfGT9/geX8S?=
 =?iso-8859-1?Q?9YskixnsMQfwQnNCT3Cg8SQU/QfG9YjHYsHwhKzyWcYb1SYtQeVIeIN3Zm?=
 =?iso-8859-1?Q?zyy/EH/xVOssE8siP1pT7sgQUeFbtaJ328q7Gq/rxEJaVmwPDbAlVlxqQL?=
 =?iso-8859-1?Q?PVWUU7zhFmK++YK9cnSIpXwhV5X/oKAfKVmz0mDQRpuCEa4rHFfUZ+4qDt?=
 =?iso-8859-1?Q?8RqFbBxnqgSDm+UtoVJCkV2+IiV7wu20zOkd/XL3zdQbM/Z7DOkzYm0FWD?=
 =?iso-8859-1?Q?RzfFIECD+sihteHIG1pJvpKapaIXg4kkMFcPVAcs6RcgFI2aTV7R/MAmgx?=
 =?iso-8859-1?Q?idBmgIsjnEcjS8EosjCM4ewjYQAjwNKjoCMJ6F8QxgQQZ8eINNMyM75hj/?=
 =?iso-8859-1?Q?+6vByiqYQV83xq+6auejMJwfI6XDysX0W+uDMhqSf0MM/BYlzFga1DzB2c?=
 =?iso-8859-1?Q?kpsDC4lag3V3m6wNRWMMqN95eusgY2PYyT6iYgcREzAFCIAfc+msumQ9J7?=
 =?iso-8859-1?Q?UpAqMlQiJNnCBhYfWB5qIYs/TkGxB3U4rCQtbMCqgbAOXpwV2m+eXgyTh7?=
 =?iso-8859-1?Q?qYW86hiFFlkJ4k1RQ3Xb/MgObVqBoc3vkqbJm8JoRLOEzH68TF+4wGdF2X?=
 =?iso-8859-1?Q?Lim7TmOn4iPlG9mL0QOVVXPioEqCa1utZQodBefBmsy2maQysnrfyGcw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9d5d4e-d26b-4f60-32dd-08dc9b8ebfd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 18:34:18.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo6kJqvwgwsQXLPHMnEnQJj0isoTvyiiF6oJGeKGxkqRlEGfa/HkloUvS115HesK5ZJSjRcXBXx35sYVaXrCq/SQmJ62N5DSePBLPh3fAJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB8917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 18:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201496

--prfojxlqk2dtyydm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
MIME-Version: 1.0

Sadineni, Harish via lists.openembedded.org schrieb am Mi 03. Jul, 05:52 (G=
MT):
> The following commit addressed the issue which checks whether the struct =
"task_struct" has __state or state
> https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626a7db=
e506ad38
> The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
> and requires pahole.

> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 0132fcffb3..d6b4794d32 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c" ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> +DEPENDS +=3D "pahole-native"
> =20
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-n=
ative available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG", "=
True", "pahole-native:do_populate_sysroot", "", d)}'
> =20
> -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAH=
OLE=3Dfalse", d)}'
> +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "", =
d)}'

Can't this whole line be removed?


Regards, J=F6rg

--=20

--prfojxlqk2dtyydm
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzAzMTgzNDE2WjAvBgkqhkiG9w0BCQQxIgQgxKgvOzMZ
eHx9w8yqTymnVYvT2mRhXw75IjcoVNo57XsweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAH5HfLit2KR37A7JJLh1c5/QHR5PCY8W6FZpn3dm0K3uzxMPcXmbx2RGxn+HBBma2
vkHcgfdbvbwS5dyL0JOnQtpZBCsehFrRsjdJA3VrwPUqe7Dx5nYwWIl1w2RGHj2ur8PhDpYY
s0HyF6GM1p1NW/eq95N2n+KpCcuH0/kWIhVOMvHxuMdaujvFTGcy4pVAqG8ZRx7j3cuZEePM
OVjfB4gKhz0uvYKXRtQp2Ly94HRn6tgFG8z/5lox1j3e2ikU3g7YAcTQgwNfySpTnudaVBDy
TraTEdNEplJ/OWRGQ2AnRxQXaZ2ETr+D45ICdVRg8uLKvUbdJLUkD98QYjaetQ==

--prfojxlqk2dtyydm--

