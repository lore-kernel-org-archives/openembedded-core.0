Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7ACCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 06:43:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.web10.3517.1761288182923958567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 23:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=cNQ0zUj4;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.42, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzHkm40L6Lpz29viROpOT/1TS7SZISzKEc7lWQMQMH0qOXeUr9ZbzoDaePF+rvrSgnSUvUIp/tCIfmlSLuFjbFzmTB0d2gNV0v0i91xJN8cgVaHh2kOcRutYpnNw6O6nBUJeZZpKsAu+KVUDHAtC/is/atBHiWp8+qAEw30E06h5x03tfkNohUQgmEk1JePfgqqGMmEgfPT5hjhIb2/VnJ/e37kCzogF6RjlyyYpAja6uVpsdq++J0GmqHgdxrQIXmez3k07dJOPF9/gIPUrMoPKD22UF4OjZwGAFgeUiN2WIHZzh0VIY6r9y+JEWWc5znNAmu4XmNzHxt2K6aOv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKmXhk0ZrsC6v6h3kPpJx6jqYJxesCSBchO8zV+r3P0=;
 b=Zla22Z+49SuwkOrQOy/H5xnqPruZQ0jheJnpJ5G2FDaJkXqp6LMW/c7LA6lZvTf4ARzdZs6s8yLvorSw1vrXNf1H3UiEXOHCN8UBlh4Ssx3IFhhZQCu93Awwhc46PTlSWwASdAypLYWp6EgfOwd9hbvdUungFbABupr2i4n+2/4cJIfrOa7THxAMOhUEnSlLLkhe8HmBMS0XAopWIIVpJqihxzOy13TGVxRiT9f4JC3D4FhFBNB641ORKlhcYhl0/dEPZqVmK75Xtis5cvpL1c70Qw332dWWqHFj0JWviaM25ZFCLF520LivIAt3zaw4TKthiTyffvqZy7RW1nd/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKmXhk0ZrsC6v6h3kPpJx6jqYJxesCSBchO8zV+r3P0=;
 b=cNQ0zUj4L+/hZJYqaq58WOMXDRrBk/Y/VuKs+0NCRLMEGO66EUFTShBFUCIs+VPTJ8Tk3WrSQAwqS2rla8Xll9vCZ2UV/IHDaFPjeMq503FrYtTmcVa0b1df/xH90geT3Ftgfln9OhVK0y8dmCofKnAuToeXXy4tS2zTk2zg8JY=
Received: from AM6PR0602MB3830.eurprd06.prod.outlook.com
 (2603:10a6:209:1a::24) by VI0PR06MB9258.eurprd06.prod.outlook.com
 (2603:10a6:800:240::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:42:59 +0000
Received: from AM6PR0602MB3830.eurprd06.prod.outlook.com
 ([fe80::91fd:dc41:567b:667f]) by AM6PR0602MB3830.eurprd06.prod.outlook.com
 ([fe80::91fd:dc41:567b:667f%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:42:59 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"saul.Wold@windriver.com" <saul.Wold@windriver.com>, Adrian Freihofer
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v1] devtool: un-/deploy-target: put deploylist
 into destdir
Thread-Topic: [OE-core] [PATCH v1] devtool: un-/deploy-target: put deploylist
 into destdir
Thread-Index: AQHcPwcqvaLtU4XmLk6e+jGonmN6y7TGW+SAgAqEA4k=
Date: Fri, 24 Oct 2025 06:42:59 +0000
Message-ID: 
 <AM8PR06MB75214C9D5355B3FFD882C194BCF1A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20251017014123.222073-1-johannes.schneider@leica-geosystems.com>
 <CAB3asfgzoso8pBB-0YBxr8q008h8qT1m9vvBsB-fJ-_Bwe3d2w@mail.gmail.com>
In-Reply-To: 
 <CAB3asfgzoso8pBB-0YBxr8q008h8qT1m9vvBsB-fJ-_Bwe3d2w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0602MB3830:EE_|VI0PR06MB9258:EE_
x-ms-office365-filtering-correlation-id: bbd2afd5-c0fa-41a5-5ee2-08de12c8926d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|10070799003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?W5/00ZGictth5fihgCkzI9JhdtQwSomtvYR20fG0At4lkz+wcawnb+d0jh?=
 =?iso-8859-1?Q?TxTAFlYxvA1tIA3NlJHXifnXvI4y7/TtX1BYO4zX99pdZf0lkHfHCbGg/j?=
 =?iso-8859-1?Q?oF4HBhDwjbiogViE0Cxqd51npEre94fXm5ymQNbRCEP1DBxxzfY1tNDVLP?=
 =?iso-8859-1?Q?l8Wn9N1Ipy2X/wibLOX7/gkC1/Q+KZGNyQfn79vDg4jxKYMi/elJSUP6ZN?=
 =?iso-8859-1?Q?p74z2k0QZkCElEIwsXxZ7ly3GF3FvjNP5ttjus42N+tDqjXsvPJi3+8JHJ?=
 =?iso-8859-1?Q?3TBRqqNSBZJyCLubvczQxP/zc+nPzWjDcmLAMinHl/j/Sq/i3NmWHMBBAS?=
 =?iso-8859-1?Q?MtzyrHwviTBiSLN35JmnsxRcZxB2PqvlkY5OXh5bmux2ew3mc6ZJIPq1tG?=
 =?iso-8859-1?Q?wHWHv6/U/ydLPgcp2L3Ai/xMMFNN99t3piz2Xa2MM2xgJh2wjb2ZxqEHSC?=
 =?iso-8859-1?Q?5XuQXcxID1zRZVF5O/YsWZEtJDxme10O75oeQt+/zmXgPq6/0bYfVsWcCM?=
 =?iso-8859-1?Q?98px6MEkjvhbkCzpxf5iZBfYlovX9IAXhs8KZ5fubil8xKfuykf5ltDe8l?=
 =?iso-8859-1?Q?KzRWBxZoIJrudlx1AeLT+hGYOOrNmDQKyTjKDlFXZGv1h6rn7TEXDkTlmj?=
 =?iso-8859-1?Q?zyrv4Rg1mCV+q/e1uMxrglFoa1qO98/AhNrpNE+cL9ezygrHXtTCoVFoQJ?=
 =?iso-8859-1?Q?ov238pYaeX56tSxnNr6TsXJPg0WLBrWSNZVcm+sp6CJ58OXj77SL2BdR/6?=
 =?iso-8859-1?Q?589jC4ZPFk3Ty7H4KRGfMTp6HUnStPpgRTBjMkWn1DhB8l5llPoA5dV3Ot?=
 =?iso-8859-1?Q?yNxqqdzRf2DSYb5ByaPx+ll7Xfqm5B4y6ddIr4z3DJUXTgGATcpZloYdWn?=
 =?iso-8859-1?Q?gE2iGkCFsPJSX6b+T7oIqrl12OIhq7f+yTlZJF4Jld3zKjdzWSxDoMv04j?=
 =?iso-8859-1?Q?Udd0cD/79KDc5U5YM5VgpNc0+rZoirSieWI7qgoj+sDbZZGkyoVWe59Zx6?=
 =?iso-8859-1?Q?YoaLYJfTY9gZP7Q/qiZy+y2JyLJa+QGke09inEDr7FU3Jsa0Zs//1srFa8?=
 =?iso-8859-1?Q?LUSeeM1gLMn3Ftxa2XEbSFAqxJBDZHyujUvd8Gsr0fzZi9fXwJNMfeNYcB?=
 =?iso-8859-1?Q?c6kNBAl3CDVsOsSxbMVVZlCzlWJz1PUcXHUMXCw4ksT2a+vMeoGRuohU5p?=
 =?iso-8859-1?Q?gvrxgy2Ss9P1tbXoJPe9ePLPpiKlVzKKUiNuwMOY2zWqHM2esNI1II/JZC?=
 =?iso-8859-1?Q?AWCVfh8dVolDu6WbqhDPYnbV5FZ/wOwmsCMSokcyRYYfVPonmdumhFHVWy?=
 =?iso-8859-1?Q?8Y/Xc8uK6SrigBxtYJ98VNG/k4ZwZaPblq+7gGsIh7qO1Pr2lSzt1IqiHc?=
 =?iso-8859-1?Q?7ve3RXIHNo975Y5GKUo2P5nT0dzBtYnMxjxJrB9NX+zicXonyleffEYFZZ?=
 =?iso-8859-1?Q?I+zzeF/KNX9UWKkQyeppN5NwlNZR7emiv5XzIi/Y3wHvMezi/HxB84TgQ2?=
 =?iso-8859-1?Q?bJyS/wuYzWhuWso7X2gTAu/meS3+rBvd+XcGtsoJMmbw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0602MB3830.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(10070799003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dhB6PIw2Ts/Upqq+mbJrYnkFD43/9BzB1PEgtSYhScCVStDuux4uSRgiqi?=
 =?iso-8859-1?Q?xRQ99H2I8yiub4OhwrjQ3gyQyddA78P68gXYgaT/nISTQEiMwgwe9WKiir?=
 =?iso-8859-1?Q?5aEK/dAC/jzLHjiSowZocLXGJhmWX8EEeWK/Csg0pEz65OEtO0CbI7ipGM?=
 =?iso-8859-1?Q?A/1f8JCkTIyq2xNudeOVFD2GEQfD+YN6lsNPhwSgHViRHe88Zg2l/tCj5a?=
 =?iso-8859-1?Q?D06im5IVnAKQm6xHbejLYS9kx3LbehHpTzgKpUY/Mo2WxWTaCybgu5X7nB?=
 =?iso-8859-1?Q?Wp3nWzIQCb8qqgZNTInYqYGmlQNC/itHnnbvGoGucqmNHpxvmBNQFCtEEU?=
 =?iso-8859-1?Q?MnhzuGpgU5ghdAaTYUxyGB2MuzJZugefRg19MpwwVS8PsQRlP1h0KOPnnH?=
 =?iso-8859-1?Q?t+H1PC0sHSjXZchGY+t9jbaJsjx01skuCprEmzPikOaFsrDh9dUe82VYke?=
 =?iso-8859-1?Q?lEmqK95AzqW4eOPMfcTOytOLbuxSboUMmMUjcoSp2nBtgX5kDwvlP/Afym?=
 =?iso-8859-1?Q?mS9B4DDpqQIBbQwe16JIZE014fyOJN7oTw6DaJ0GFFQufPPMJxYhsjDgFE?=
 =?iso-8859-1?Q?6aeH6LUnnMGUssxTlcLXhqLrlr+z001TeFydGipHv1kGw/kI59Xtm1EKEv?=
 =?iso-8859-1?Q?lD5cuzeNnbA0HG2Reo2FtiPgNdpGHXmIdLc51L/cqGm05jYTpwlPovpnUx?=
 =?iso-8859-1?Q?73sPcS+elDg2HmA5MWOuFfZfHPmFFkCUPhyp5cP/845vdAtYaV/7n/EvNf?=
 =?iso-8859-1?Q?UgaDOZ4tnG6eVh4euPlEOJ0I5q2okf+SzSDtx3qKF/n6YLuVYDpwfpC7de?=
 =?iso-8859-1?Q?EMbPyfIcroV1JqtpUxinPDa5QqOLxbGvjCwtxLYJA9Ldibj0/8IOS0lj7W?=
 =?iso-8859-1?Q?iP2G8ew5HFb+NP47ns2CKgYwW28JJba5LLg+a7S2Wr1Gs0RDsFjSujViVZ?=
 =?iso-8859-1?Q?9TRxBP9m4q6cPg9nZ3xOAJumeVC0h/LAHUcQt35gDV9h9bxrJtnWInNchs?=
 =?iso-8859-1?Q?wYcHl7fnKabR+plufum44oQRgJKJpeGFYvZzBLbyFRFeJoRo9Dv4QtA3nh?=
 =?iso-8859-1?Q?akzBu3+1MYyXTgzrWLy01po/Ex3BYtXNkB5eWepwLp+WZ0qhu5i6KiM1xT?=
 =?iso-8859-1?Q?tRtjtdUrP7WaPxD50GuVrBVPqpvRHMNIfTm185M+cuJoxOvYZCZgVJW9wh?=
 =?iso-8859-1?Q?42l/mZJDcRmO3f68Y+ESlaqKcv6fVF+Gg+d/dJg1tEY8wNzKfvtQwART6s?=
 =?iso-8859-1?Q?Fq4jt3KwjVDCBr+gTiJ8FhY25MhOi2DiJlFY3LH5S28jorbeoaw09pmvsZ?=
 =?iso-8859-1?Q?TnTZa+wFRYFhWSsQUXbGduLfjH+u6adJPLiQep+Enf/ON/HVRY7GtuwPXy?=
 =?iso-8859-1?Q?9x6aSUP9cpY3zqvkcaKKYzP9hC12INJYFJ33pcu5GV48pz/+eHgy68jqmw?=
 =?iso-8859-1?Q?zyHfSg5/atcDg/VwpdqDmupF1b2Yho8tN2z0Rm+J+b7vf+uz2FK6dpgpJ+?=
 =?iso-8859-1?Q?5syFtUK4j6Pkdwo0IepiLskhodfocI6juMNgCIYE2mu/CHZWdX+rfRUI6P?=
 =?iso-8859-1?Q?6kA3J9zlQp0DOSpVsymTeOojc+0XZYNXz4FdysAtxwhyWAjjqRs9kCmQN1?=
 =?iso-8859-1?Q?cVzGalUUHQL0JG6B3hN0fOWgwe7FYIxi3pta1YqKP7Jmf3q5M4ByI8wNeD?=
 =?iso-8859-1?Q?DtVMVNgLzcNYt8qNd7wE3D3OZJdqd79e3k3uQp6eSipSHJCVqsekbDwEoM?=
 =?iso-8859-1?Q?yX93u9zw69qS/UIw/ZZTVx7nU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0602MB3830.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd2afd5-c0fa-41a5-5ee2-08de12c8926d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 06:42:59.2512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4GOs6N+Gm+FI7Ga7zSnTwkViVgtBKvTV2RlcOfu1MsxbwOZ44UbeRoKDsWsET7k48H28Ryu/Ykwy4K69zeH+zcOpaWQ1aX5nWgD1mTwwttXo3mdc/woqeyxaSGxlz0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225283

Hoi Adrian,

>
> Hi Johannes
>
> Thank you for the patch. I agree, we should do what you are suggesting. I=
 will test and think about some details during the next few days.

:-)

> This is just a quick response written on my smartphone.
>
> Johannes Schneider via lists.openembedded.org<http://lists.openembedded.o=
rg/> <johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org<mail=
to:leica-geosystems.com@lists.openembedded.org>> schrieb am Fr., 17. Okt. 2=
025, 03:41:
> When deploying on devices with a RO root-filesystem, devtool would
> fail on writing to the hard-coded "deploylist_path =3D '/.devtool'"
>
> Since devtool already supports deploying to a different root-prefix
> with: hostname[:destdir], we can make use of this guaranteed RW
> location to place the deployment-list there.
>
> Add the destdir parameter to the _prepare_remote_script function, to
> construct the deploylist_path from it. For the 'undeploy' the same
> host:destdir splitting logic is used as in 'deploy'.
>
> Now it is possible to modify and build a recipe 'foo-bar' with
> devtool, and have its ./image content deployed through:
> $build> devtool deploy foo-bar target:/opt/development-overlay
> Or removed again with:
> $build> devtool undeploy foo-bar target:/opt/development-overlay
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m<mailto:johannes.schneider@leica-geosystems.com>>
> ---
>  scripts/lib/devtool/deploy.py | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.p=
y
> index b5ca8f2c2f..a98b33c571 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -20,9 +20,9 @@ from devtool import exec_fakeroot_no_d, setup_tinfoil, =
check_workspace_recipe, D
>
>  logger =3D logging.getLogger('devtool')
>
> -deploylist_path =3D '/.devtool'
> +deploylist_dirname =3D '.devtool'
>
> -def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse, unde=
ployall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):
> +def _prepare_remote_script(deploy, destdir=3D'/', verbose=3DFalse, dryru=
n=3DFalse, undeployall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):
>      """
>      Prepare a shell script for running on the target to
>      deploy/undeploy files. We have to be careful what we put in this
> @@ -31,6 +31,7 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dry=
run=3DFalse, undeployall=3DFals
>      busybox rather than bash with coreutils).
>      """
>      lines =3D []
> +    deploylist_path =3D os.path.join(destdir, deploylist_dirname)
>      lines.append('#!/bin/sh')
>      lines.append('set -e')
>      if undeployall:
> @@ -146,7 +147,7 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -
> +
>          srcdir =3D rd.getVar('D')
>          workdir =3D rd.getVar('WORKDIR')
>          path =3D rd.getVar('PATH')
> @@ -244,6 +245,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, lib=
dir, base_libdir, max_proce
>          tmpscript =3D '/tmp/devtool_deploy.sh'
>          tmpfilelist =3D os.path.join(os.path.dirname(tmpscript), 'devtoo=
l_deploy.list')
>          shellscript =3D _prepare_remote_script(deploy=3DTrue,
> +                                            destdir=3Ddestdir,
>                                              verbose=3Dargs.show_status,
>                                              nopreserve=3Dargs.no_preserv=
e,
>                                              nocheckspace=3Dargs.no_check=
_space)
> @@ -303,12 +305,19 @@ def undeploy(args, config, basepath, workspace):
>          scp_port =3D "-P %s" % args.port
>          ssh_port =3D "-p %s" % args.port
>
> -    args.target =3D args.target.split(':')[0]
> +    try:
> +        host, destdir =3D args.target.split(':')
> +    except ValueError:
> +        destdir =3D '/'
> +    else:
> +        args.target =3D host
> Just dropping the directory was probably not the best idea, I agree. But =
does it make sense to drop it only in the else case? Is it properly defined=
 if there is a ValueError?
>
> Or would it be better to not alter the args.target and fix all the code w=
hich uses args.target to handle the directory part properly?
>

the try/except/else follows the same pattern that is used up above in 'depl=
oy_no_d'; so your concerns would apply there too

we could refactor both places some more - and raise an error is a user pass=
es a malformed [host[:dest]]?

the current patch tried to be "minimally invasive" :-)

>
> Regards,
> Adrian
>

gru=DF
Johannes

> +    if not destdir.endswith('/'):
> +        destdir +=3D '/'
>
>      tmpdir =3D tempfile.mkdtemp(prefix=3D'devtool')
>      try:
>          tmpscript =3D '/tmp/devtool_undeploy.sh'
> -        shellscript =3D _prepare_remote_script(deploy=3DFalse, dryrun=3D=
args.dry_run, undeployall=3Dargs.all)
> +        shellscript =3D _prepare_remote_script(deploy=3DFalse, destdir=
=3Ddestdir, dryrun=3Dargs.dry_run, undeployall=3Dargs.all)
>          # Write out the script to a file
>          with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w'=
) as f:
>              f.write(shellscript)
>
> base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224987): https://lists.openembedded.org/g/openembedde=
d-core/message/224987<https://lists.openembedded.org/g/openembedded-core/me=
ssage/224987>
> Mute This Topic: https://lists.openembedded.org/mt/115801291/4454582<http=
s://lists.openembedded.org/mt/115801291/4454582>
> Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openem=
bedded-core%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<htt=
ps://lists.openembedded.org/g/openembedded-core/unsub> [adrian.freihofer@gm=
ail.com<mailto:adrian.freihofer@gmail.com>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

