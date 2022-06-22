Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4833ACCA481
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 15:06:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.88])
 by mx.groups.io with SMTP id smtpd.web10.8379.1655910400817348934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=pnCUsIqE;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sh3gJ6dPC+CeJnTgMhSa5qtgVsn+xl5++p4zo+kDG9tBKbgjCqWGNRzfah9iS3tMZt+DbAegTD8wwMkiWw0ActAqkirMARXZ1a2R8OcwZH3XCdVYmDhkpWj7+SjvZGhm33evprwwHeC5dFxhERzxDisUfVzHJgPiGgZEfU1muztwJgNm5I/cQPodCWu+JGHtCvRNgIjLUbTU39Wt4cpPdK0miYpWyMmGTZPnIM3ewGuBddzFGk6nPzt1KH3eiR3msz+jufFXCUH44fX7fROnDdmsYEsK82cV/H8uCl5Ljk5+krWnHjDqkzS2PhcQ7DdHB7aDl9ppinwo9vvU+xE5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+6t/v8yluqFs/6/9wIcaZLGm9eLMrzhAhsl4ykWTYE=;
 b=Xnk2FsI5WU06GF/tVcIz2//GDRlZHGinycwEsWCM34f9LzTuIgJ83h0y0g9EIzzWenlCk7piEDqWD1txWAffWqAZBzb3Ub7rSZa+aOZAi7CPWr09Z3LS8367gyQuvFc58DE8y9uOlqjgKYwgvNXufKArpBDBQ5fn1euqKeiIXSkk2KanaKtYszD9UMsdkGoXMjPM+KzFf4SD3a7Hp86mmHV7240zilsUUFYev01ZzuAdWfxBXiq2elRZ2zLQiYXY1YCiP+WCg4Y4Zn6CuhO7s6/VV71dMmY9/sHO9RNHTfIAUDpa3rjnGYSIW8MqncsO4mz4uca5t91j8VEmX8VeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+6t/v8yluqFs/6/9wIcaZLGm9eLMrzhAhsl4ykWTYE=;
 b=pnCUsIqETszcuDK6aVZh1ZJ9mRsHQFDqMTD/Y0TOSB4W312wTfI/SUNMf3wGnML5knZyUMot6BR4KMSH7kECzMKSwPSH8MvvBpp/VRHinCRfNfZtZAe96++fbhdkjZBjFWdy5bLNc7RHSbTwfpZzqmIJnHar/avyqWY5f+qjp+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR08MB2871.eurprd08.prod.outlook.com (2603:10a6:6:23::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 15:06:35 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::49a6:e5ff:7f94:8787]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::49a6:e5ff:7f94:8787%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:06:35 +0000
Message-ID: <976357c9-f919-bf53-afe6-dbf71ee2c75f@weidmueller.com>
Date: Wed, 22 Jun 2022 17:06:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] Easyish reproducibility issue for someone?
Content-Language: en-US
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
References: 
 <31700e81f90027d7359c688ac8b3d5bdf914a0f9.camel@linuxfoundation.org>
 <1df0fc03-e1f3-de99-bf81-f19c022e9fa7@weidmueller.com>
 <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <679be2d1-4311-41af-d2e5-4132c96b3421@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::27) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d871d3c-1f23-4457-768e-08da5460ccc6
X-MS-TrafficTypeDiagnostic: DB6PR08MB2871:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB287135C86F96EC1848E97EAAD7B29@DB6PR08MB2871.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hs98gUvRnf8fDQDVImU5BCAbL8EUVAEEZSUAOQNIDzl8G1geRxtdOSnhPjxctVHbQCdHfhvGAGFHbDdl855ijdOPgsr56TnE3b62kYjZPa8tHQHbCRom5JwYz++SiTVUK2wnikJ04j1apK0tnd40IxZW31kZT2ughGsRcfaFE8mlX+taiEGCC7mXScBfeuJQZcKTtRiQNmSsSX2za8r99BnQxs511UryERjbsNjdN9jbSREB6v3tmdF+1pifZonlm9C9bUIK//qnf9Xe58cXVXjyWToYA91vx9SIRO9vJaXbPWsp3O3t+kPyaeR27QII6OO6oD2+xIMmNq3+48i/DidZlCxMUbDTP7KF+ODqJB9h0qTV7gW0g9IKgxZHisb2aFRHs1mEow2ZPSFJuepE6NLJpB5y/Aw2QWbv5YWuCHf2jB9qSwrONs1wpwLuRVeTnq8g4lkvod7LwUtdY0FURRkWnjv3OxdWorR9IbuQHS0xW2jml41maifi1KHxuFrVSmR71UKfjwzLi1nAwPp/AfR1qcZQQmLltIcs6CvJa90+JEZ4edNFxNsws24LQ6PG84RHXcGC48PXUACV1mQpfLzTbgeykg8Saiqcv0N2+Fu5LZXWQF7tr0iE62LZeKgCy6Z9LbcTNLx0jRvmUJz4vmMd1g557C+VJFdDWMpMYOre95y/wJzh4myb4kUqsDN5QEgmJbg/H8VJr/qjM/GoPaI6SxKA/ya7Sa/rD2WngKyDyusyOcfySL5erBXPZaEi8bx1lbIo0wPlT16xvKlIC0SES6XgjP55jatFtcPD/xAJ3wy4o/VOCox6GecuqXW0J2dKPrrZUZ77955EUcctwO9QPTTGOQsLLnNdVavAcbY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(26005)(8936002)(6512007)(6506007)(52116002)(38100700002)(38350700002)(2616005)(5660300002)(36756003)(478600001)(316002)(2906002)(83380400001)(6486002)(31686004)(8676002)(66946007)(66556008)(31696002)(966005)(186003)(66476007)(41300700001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pg3mC26Eazyb/O2xZ+LKTX+xLJ3pE92NKDi4xjyusbEWC5GNISLeL6MdUfZj?=
 =?us-ascii?Q?3UAomVOfXD4WKVMQwBRw6nbIDV9TSgPWHdRbKZD6B4oDGbXTNkNNsaQj3o61?=
 =?us-ascii?Q?LXKT75iua+6Qg5l2KotTNqlWNBFcO04Pq7rPdyc8c1LGsMqsMAr1Cy2OzG6z?=
 =?us-ascii?Q?5GsBg9Rs43k3FIbEPHT1Jga4/dhoBLt7GgSmCqCAcUFgcy5iiFf58VaR1RWF?=
 =?us-ascii?Q?Aj4v8zenC/rXvVRL9HGqdKttct4ncUWOMTjtrCwPIf3yX/DB61W/5wngAM4p?=
 =?us-ascii?Q?ZkKTMLiq8f+2tKolzTF5pKuDbjLFzjCSoC+eoKXVmSqZkvIAPgg1QcVz4eDS?=
 =?us-ascii?Q?+nqczTNEegsQUnWdumi8SQ81SX0NnqNEdZIYeWPkeVndg89z+3Uq1xHP1/yW?=
 =?us-ascii?Q?Hbpmn60ml2jTsXJ48m+DgI4OHirOhFxoJGNbURprlt92qlMSl5u/uxlArBU0?=
 =?us-ascii?Q?KDjHpjXHD09Ln7kwlaRlHa2iyZldwJ3rHu7h0iXvNiHCXfLFbS6S7g3Uz7Mm?=
 =?us-ascii?Q?Dxt7STiHVjQYmfJLoQZEqkYsdQE1TXShvkFUhSvuxfA4VWzKrHvuqoRq+mah?=
 =?us-ascii?Q?vg0+RVVMEqV3bT1yGybeNjEuMwGpcbURK3mP5hjYPwHklrhe3HTCovf4gSae?=
 =?us-ascii?Q?kwXft1czoTrs+IPOr94xfOmw1qiuv6P9x9420RVeopPQrpzMXR7l6GT2Qxz3?=
 =?us-ascii?Q?oxSotDEMvaCEJWjO1RcvfcOU8JievP0ydOyQaFLTaSacGX/mm1FmZNRQ+N/w?=
 =?us-ascii?Q?myJpDxD8swwcImV4+tQ0YliC2YM/TgZv+WF1CcXDQQbxs/iKG1rKkjdxDgcm?=
 =?us-ascii?Q?emQ5s0Q5Bpd2C4pcl6S/C9Tn2a887+4k/y6FEZ4/a7WHERHidmTLCIfGEfUX?=
 =?us-ascii?Q?wujnzbmT9cNrH7Xe5JEVaU4ZDAei6y4ywP4ITMXyMqwZv4fG8spfRah7y8zP?=
 =?us-ascii?Q?EXAf+oIPItruwd56s6wtNfbgtGFmWJhPNxR0dKNWJuV+ozyUiYjgblNfa0vv?=
 =?us-ascii?Q?D2R0gdowONeZ9WA0uc91SH0ki4nNmkRz8M3j+pmEF7kxMc7cClpWpTZePp5N?=
 =?us-ascii?Q?9NpdLCfrtDQpU75zjLJrntMaoZ8Dxy6mBuNSD5Zw5TNNy+rhtQaPWvMKXbjR?=
 =?us-ascii?Q?SM9vE40g7rlmhBkigWZxv0+WrR2biHvp6IQU0GX53e3t1dMzHWT0XpvKq4Ib?=
 =?us-ascii?Q?I2tj7CRRje+8O8S9cX9Az/dHbbjoyZ9TTFMm6HrmPlomnJIarpmYh9jAJanH?=
 =?us-ascii?Q?6da7YRJw2HHEQ+cNB9e3EiI2A7K9wBexV2Qu1H9Ywtyj90V4IWFJBniwNxIe?=
 =?us-ascii?Q?iLIPFU5Y85IoXirm5wmXa4K8H06VDyLS791JM62QX8EC40qk8pQp1flSLR5g?=
 =?us-ascii?Q?e2bmXL0AznQKVCExs6cUZuERPnWoYv28tp2peY01aaiED9V/yu8QNYh5i32n?=
 =?us-ascii?Q?8XmVeh5g0CU3saPnR69iuInXVEokNqdl+hz1Ts4FnBmxQTEejoTuJAYvUWMB?=
 =?us-ascii?Q?kCWs6oYp5gSv7TNAXyFIkJZ9e9KSCL91ZxTg7vkTMUGHnSbCnpmvvRFt5+75?=
 =?us-ascii?Q?bUo4e/5TxZqTSzGKxAsI3M0Bor3wX4CVDTAZk7IG7ZHqgTDOssMkWog1Yu7H?=
 =?us-ascii?Q?F4notXeNjaevAd/TVwAL6lhAXlzf5Q+GSK5D+mijskCzoVpwx9ZsY1gwxPov?=
 =?us-ascii?Q?AzniuAuEGiQ7+EyZjJlZuML1FLsDulbfFpWqrt2jJIbOXv3kqYmlfPsBvgFK?=
 =?us-ascii?Q?Uo89jDQ5TQoVOsru/JKqtNrju7vTk7c=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d871d3c-1f23-4457-768e-08da5460ccc6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:06:35.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YxWakkLd8doE6Iz/GNNrcjLEEq9spPf/lkgy2LvWrqnSQSpworyMOrj6/F9+eccguhCEurFIY43TOBgMd7yqoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 15:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167241

Hi Markus,

Am 22.06.2022 um 16:18 schrieb Markus Volk via lists.openembedded.org:
> Hi,
>=20
> couldn't we just do it like this?
>=20
> PACKAGECONFIG ?=3D ""
> PACKAGECONFIG[optviewer] =3D=20
> "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLVM_HAVE_OPT_VIEWER_MODULES=3DOFF=
,,python3-pygments=20
> python3-pyyaml"
>=20
> Depending on wether the PACKAGECONFIG option is taken it looks like this=
=20
> in CMakeCache.txt:
>=20
> //No help, variable specified on the command line.
> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DOFF
>=20
> //No help, variable specified on the command line.
> LLVM_HAVE_OPT_VIEWER_MODULES:UNINITIALIZED=3DON

Have you test it? The config-ix.cmake file sets the=20
LLVM_HAVE_OPT_VIEWER_MODULES variable [1].

Instead of LLVM_HAVE_OPT_VIEWER_MODULES I would set PY_PYGMENTS_FOUND,=20
PY_PYGMENTS_LEXERS_C_CPP_FOUND and PY_YAML_FOUND.

[1]=20
https://github.com/llvm/llvm-project/blob/main/llvm/cmake/config-ix.cmake#L=
693

Regards
   Stefan

> Am 22.06.22 um 15:54 schrieb Stefan Herbrechtsmeier:
>> Hi Richard,
>>
>> Am 22.06.2022 um 15:10 schrieb Richard Purdie via lists.openembedded.org=
:
>>> There is a reproducibility issue which shouldn't be too hard to fix if
>>> someone had a few minutes to help out:
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14845
>>>
>>> It is in llvm and is a cmake configuration issue. Rather than setting
>>> that option based on the presence of python modules (with python from
>>> the host), we should add a configuration option to force it to be
>>> disabled in our case. Should be upstreamable with the right patch.
>>
>> I'm not able to test it at the moment but it should be possible to set=20
>> the variables (PY_PYGMENTS_FOUND, PY_PYGMENTS_LEXERS_C_CPP_FOUND and=20
>> PY_YAML_FOUND) to OFF via EXTRA_OECMAKE:
>>
>> -DPY_PYGMENTS_FOUND=3DOFF
>>
>> The find_python_module function in config-ix.cmake returns early if=20
>> the variable PY_${module_upper}_FOUND is defined.
>>
>> Regards
>> =C2=A0 Stefan
>>

