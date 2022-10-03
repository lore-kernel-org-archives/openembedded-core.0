Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1624EC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 08:09:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web10.16493.1664784546982681621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 01:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=H9MYFxLF;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.58,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnupJAzRTJ3D0fa2D2kM0XjLxeYKgqVVASegg9+l/o7qz4mzlOxGzYRduEVy4zujOjoZY7IASoTPA5o3YdT//2kSGvBxQ2/wMo1UrE9PijJcbzVDY5FCB5eIm+AltIupGjr1IvV+NVYuJ6+yJ8TjJjKe/8shIIL5yAsgCTKBUzJdcyo5TEVxGDcvMOfrZA9wZnHqO+xJ7xxhEzAZ07AxFbTW1FLVphovdHaWVrr7i/drl/KkutHH44GRoM1VvdmEBvWwiuyCPiINLWkU+KDW2+p9kiXGHcCpjxhyPFkSNpBcQ3G5HhGpbAICMKtDGN0YgwPlnIXAo2oTSD/CQMW0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8rYF9WTSjdaMz4pvwpnUMmeZnbH++wj6j1yaWMaEdc=;
 b=oSySq9G45C0/quiTsTSwwH8iy4cN3pcTGGA21tyi/3zmFdylaLsSOeSE9rxQWWIFVCWEdFemzxlSB6lQ6Yq2VX44+ll1DOa6JmSz+lcAgHM2Fdc81LyILGefIZXdkxnLWohWNLs8hl+k5nXZYtOcY01xgJ9BZcT6ZXRsdIWt3IDpKXR3FrWF4aonDdfthWVYI0SP3qcCTFGNc6abtw2gU3up6CqOaE5V4iBFicviIRZfax+1whAvYmnpR3IpXRkBV3gwgsVvDaHlXDJR8oSPtv1ip3MhERrLvX8c8RCQnC1bCKNw1HfrUTKNcu0Woagj5JmQjDfiOEK39eguL6a94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8rYF9WTSjdaMz4pvwpnUMmeZnbH++wj6j1yaWMaEdc=;
 b=H9MYFxLF8CJOSJ7AG6Slq+505RwYTqnuy7AhNvuB1pGdfXaoyfXNV/2JQlwYUBCxiRcdhjuO5HKbNcJ72zMfl3lrerXZoK8Qgv3Sa294NBoYiJVa0Mh3R4ntILeYiWOOJa+5YaS/5R1FDAN1QHhhAZzrl1CIWAO3binfwYcnHJwFs2Td45GetngBkRxYHTT6ujwAkF4jVY7e1sa+y1Q7/974qUlncVCasC0ruYQbmWeLfcXY1RKcD+Hz61JhiC52wIvkZ0+a+auoFgxN51QlHSvyVlIewCY3q7FUV12kvihMyCVR7I/gH1DeTHmKNevhyt3sqH/2/loGHn1O4QCbbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB9257.eurprd04.prod.outlook.com (2603:10a6:10:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 08:09:02 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 08:09:02 +0000
Message-ID: <683fa2c8-3f04-c498-6cce-530da13b3383@theobroma-systems.com>
Date: Mon, 3 Oct 2022 10:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [OE-core] [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220930175520.2850089-1-alex@linutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220930175520.2850089-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: a2925c6d-f679-493f-ff16-08daa5168833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5gfaolssCVMjtonYFLiaInhd+8VlXC5uSuU8PoXhxdu+cbfETMt5cRbdHUwUMGql9Eul+dpXktfWSXIBdm5d/XLNeeeFo+sdTl8DilgP754xhVzn2IanlJHfr8ndPfwIQRA3udeIw4K0unE1zDYy/HUfBHV3lfk8ioOf07CFCbk47Q0QubSCKj6bYsvVU6dBht0MpSShP5S7pWb3bjPP23XlnlOeeeszTyU6EAYGexE2IB7b/iZtG0gQn16PQE2QlnlqYpxvGH/ik63pOcN3jo3L0ERegTjaCAyf+1FQoMmpuqMiNWd6GLBU0XP3Tfqs3UKns8GM2BowHdwj+PWcifbc1QGO+D2sujwIxUklY8zRv27yBwwM9FZ3GQPkBpeAgtHagMbpOhKe/GOeo8mEvoYunqxJI2Mz3G993MZ2BVGgeTcu2Iatl9lUqZd2eYh/qQBKBM57wmHdK52q2RMEhG4zkef4RXjG5Yno2r6Elkj3cCukaq8WwbBAUj5hrkA950LndEEBefCz0VTfcMvbJszAqrFeZAujW5kEyImh4bibQSAoYLXBj/r1Xt1fZklwclGxoNKh/f7spQTt7o2r2iu50JnoANS/863ofGqeIaG2q0SaensPiCirTq6G4xZgV1c6o1P0F6XasfXkmew9Id7OrkREcnP7LnS9jyvrnGEsQTCmlp/fta7GZRiA7POcgagVlZtjhLkXX4cYkrN4Q/kPWtFncHPB1v9rzC1pY2FT9C40LcaXkCOAkiEQWGmHdwshftUu4zrZFshoj0WiKIqIdHvbeW0Bh++d5fKpdSA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39840400004)(376002)(366004)(136003)(396003)(451199015)(66476007)(66556008)(66946007)(41300700001)(4326008)(8676002)(38100700002)(186003)(15650500001)(2616005)(2906002)(83380400001)(53546011)(6506007)(31696002)(8936002)(86362001)(26005)(6512007)(5660300002)(44832011)(36756003)(31686004)(6486002)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEhwS3BhS3d1eUw3UnZMbUM0dnRQQTRnQ0IvWXR0WXBTaXRxNGFzcG52enNs?=
 =?utf-8?B?d1kwNUJ0cWtldlpMOTZxYzVRaFN4NUxjQWlhS1V4UFVMT0dRODJwQUVjVXJl?=
 =?utf-8?B?VUFRbGNaYnY4QUxXRHlsajZyanV4RUV2blM1TG1HeHBsbFZ1TGMzU3pLOXV3?=
 =?utf-8?B?ODNNS25JQ3p3MHY0TVdCSkFnTnNwbXlqbm1WMG5pNUNadjh1ZlhmcjZ6Vlpu?=
 =?utf-8?B?TEdZSkJsL21OcStSR1IwQTV0VFlsQUE3Z3psZm05aDVQbjFyeklxYllodWJh?=
 =?utf-8?B?d284KzNMRWtXY1d3MlByQkhmODVZS3NJNkN2eWt2ZkQ4am8wTHBzc3B0b3hi?=
 =?utf-8?B?ekNWUlJ0dXExTHQxTWtJV1ZUd3IrVHBHczBmZ0ZBejNUbUF4RmRyMFhRTjFS?=
 =?utf-8?B?Z2x3emNhWlkwUmxzUDRQWGx4eWsyY3ptL2wwSWF3UnlTZWZDd0VyY1dSdUQr?=
 =?utf-8?B?OFJsbEQ0dVNHNTl5NTFya01qbC9ESlVBVHY2Qis0bk5VWHdaZDY4a0Nhc2h3?=
 =?utf-8?B?UkRpaGs1SG93aVhzK1p0RWpTZkZTWUR4SDIxNmNXZmp1NUIvcGJDV3hLZS9B?=
 =?utf-8?B?SnpNUEVzamtWNnFsVWtaQ05oRk40TmM5MzRHRzlTS201TFlsRVYvRlIrMmVk?=
 =?utf-8?B?T0xNRjZBUkUxVEh5eko3SjI0SmR2KzUzaWc1eGFkT25UdUF2NEpyWFRoSW1z?=
 =?utf-8?B?UlovMjN0Z3dhTCtSNm5sNm5jTm04cTZiVmk1Z3Bsc2luaXhXNnA3cUxHTGRy?=
 =?utf-8?B?bStrQW8xZVhlUTJsT3d4dDA0Q0gvTnhKbHhjTWFHMUxMbks5ck9qS0VzSE03?=
 =?utf-8?B?VTBJcllZMDUzWS9vaFJmMEJtOTk0YytCQkVOYmpZZ3c0T2djaDMxNXpOTzhQ?=
 =?utf-8?B?dnkwOHprZzFqQU92ZithSEJSOUdnMGRSbWxpRGxYMFlWYlRoaW9HNGl2MG01?=
 =?utf-8?B?VFhWSk5oaVByYWlZdml2V1g0NFBjbTZKT1lyNmhySVoyY2VndzZHQlVkUlFo?=
 =?utf-8?B?Z1NXd3g1Qm4xNkk5aG1HeDVQU3JoVC9qYXluRm8wNlVIUjZJaDhiMkYvN1J4?=
 =?utf-8?B?Z29PMGNCZlpYMFppalFDVzFCNFczalhVUEVzVlgwYjJZN3ZBWDBTTHpqQUFZ?=
 =?utf-8?B?RHNTc21ncmtKTms4NXM3a0RhTWxYakhKOGQvcXFlQlRXQW1GVzJOc01aNjU1?=
 =?utf-8?B?TlQzY3B5M0FSdVNMM3RRVDNYeS9iWSt0ck9oKzhwQVhQcjNycDk5VnVNcXds?=
 =?utf-8?B?aHNwenh3M0tseHBId21vaDVIZVcxakF1SHM4RVZRRUdKQVdsT1k2QVF2WVBQ?=
 =?utf-8?B?THIrNXRONkNXVVQrNm04aXJRVDAzVk1hbW5QeFNneDIvMlNyUk8wUjdoaG9k?=
 =?utf-8?B?SFJWMXVmc3VRaUtPT1VNb2lnSjBSbVpiYWhzTWs1eUdhNTNVZWR3MGNPdGlm?=
 =?utf-8?B?clUvK2pZNVFiSVpNU0Vack53aDRkRmJQNnpQUGNyKytjNExXc1FabGhoQnRP?=
 =?utf-8?B?eGJyM3RvR2thM2g3QW1kdFZ3UWhtbHNkcmRmcTVwektMekhHWm41cFM1Y1hw?=
 =?utf-8?B?eVFuWk13V1pjQkJLQXFMWHp2WjVEK2Z1QmR3Qm1COHZHZ0thaTNtbVFsUzBr?=
 =?utf-8?B?MStqVVZoMDdnaU81QncyQVlHeVhxdHhOanMyVVhjSVVBNi8wek9EUjRyaGsw?=
 =?utf-8?B?d2JGUkM3RGVBdFRJYVdibGRBVEtEUFh4WHZJUmpOVzJ6ZW5icmVHeFR3Wkh6?=
 =?utf-8?B?K3NERlB2NUdTN0wzVU5wajJ2UFVZaFY0Y2hrY2ZwQi9aOWNYVHpVRlpyMi9B?=
 =?utf-8?B?cVc5b0EwaU1qRkpTajJVWWlIU2lZNXRuZ3BXT21NbXd3YU8rZ2EwaWdGREN2?=
 =?utf-8?B?Sk9uenBLaTdaRjAwZjRTOHZMZEJEY051SXMzeVhGVW16ck1DL3p6bzlUam1s?=
 =?utf-8?B?RElXSmQyVTVGcmpKb3ZwUUlzVVFnVERSenNzdk5IaUV4TUdxR0hreFQyOTkw?=
 =?utf-8?B?ZnRZMDQ4RkpXN3dLZERoYTVRclJ3TmFUSE9rcmFoRmlDWnZKZzZ1VlN1OHMx?=
 =?utf-8?B?WUNTd2p4R2dGbXE1eWhIajJjNitGVWtmZXpxTGh3SktBOTlPL1hjU1oxN2No?=
 =?utf-8?B?NTBuSnhyRkhCNGxYenR5aUN1SUJmd1lDdENVclNOUlN1aDZaSGVaMW5XRHln?=
 =?utf-8?Q?tGrkwkdm2mQXcwGDM9t01gk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2925c6d-f679-493f-ff16-08daa5168833
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 08:09:02.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2c5seVaQEkTi58afNPpycnF16hDMHeR55gTNMRLM32b5/DbVcoOdd+McQRKBtE9vR0/WtPkPWTKPULpWpUbEhS9x5At+5tYNAbBmaj6Z8ACQYlm8ASy6+shuVvHdWMmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9257
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 08:09:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171359

Hi Alex,

On 9/30/22 19:55, Alexander Kanavin wrote:
> For better or worse, more and more rust components are appearing that do
> not include their dependencies in tarballs (or git trees), and rely on cargo
> to fetch them. On the other hand, bitbake does not use cargo (and quite possible
> won't ever be able to), and relies on having each item explicitly listed in SRC_URI
> with a crate:// prefix. This however creates a problem of both making such lists in
> the first place and updating them when a recipe is updated to a newer version.
> 
> So this class can be used to perform such updates by implementing a task that does it;
> the next commit shows the outcome for python3-bcrypt (which has been tested to work
> and produce a successful build).
> 
> Note: the python script relies on tomllib library, which appears in Python 3.11 and
> does not exist in earlier versions - I've tested this by first updating python to 3.11-rc2
> in oe-core.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../cargo-update-recipe-crates.bbclass        | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 meta/classes-recipe/cargo-update-recipe-crates.bbclass
> 
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> new file mode 100644
> index 0000000000..f90938c734
> --- /dev/null
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -0,0 +1,41 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +##
> +## Purpose:
> +## This class is used to update the list of crates in SRC_URI
> +## by reading Cargo.lock in the source tree.
> +##
> +## See meta/recipes-devtools/python/python3-bcrypt_*.bb for an example
> +##
> +## To perform the update: bitbake -c update_crates recipe-name
> +
> +addtask do_update_crates after do_patch
> +do_update_crates[depends] = "python3-native:do_populate_sysroot"
> +
> +do_update_crates() {
> +    nativepython3 - <<EOF
> +
> +def get_crates(f):
> +    import tomllib
> +    c_list = 'SRC_URI += " \\ \n'
> +    crates = tomllib.load(open(f, 'rb'))

Aren't we supposed to use context for this or close the file descriptor 
after opening it manually?

e.g.
with open(f, 'rb') as file:
     crates = tommlib.load(file)

?

> +    for c in crates['package']:
> +        if 'source' in c and 'crates.io' in c['source']:

if 'crates.io' in c.get('source', '')

> +            c_list += "        crate://crates.io/{}/{} \\ \n".format(c['name'], c['version'])
> +    c_list += '"\n'
> +    return c_list
> +
> +import os
> +crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> +for root, dirs, files in os.walk('${S}'):
> +    for file in files:
> +        if file == 'Cargo.lock':
> +            crates += get_crates(os.path.join(root, file))

from pathlib import Path

for file in Path('${S}').glob('**/Cargo.lock'):
     crates += get_crates(str(file))


> +open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(crates)
> +

with open... here again?

Cheers,
Quentin

