Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4969EE9B268
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 13:58:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20711.1771941114737112851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 05:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=OaP0REJb;
 spf=pass (domain: est.tech, ip: 40.107.162.35, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RivvDOLdI6hgRkdxw1dL2J20CISnbOpwOx0rnQ7HeY/5i548JhJ7+rQTKza/ENRqMasC58/9iuy8APcD/4L4qDarCu7HkyCzlKDFn/nUvOAvrcEdPKv8T2mToBrCbJQ8uliZzc15bvXTdHADW7zkCkI2basjsDM1DGJ3JeTfQ01B10gWe3woLxuTjq6jV8M/iekWsF50wXUpFq8/vaBrCZiXe6dmc3pQv8rpI/q4TSus4u143bOgcO2ECJseTRv6P4f0tPGBTP14fehSvZSSHyuP8waDLlPMrRHjkyz59chrRxF4ztdviAnU9XTRFBrxHW2FE97YJioFKP5wpwsyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUTbB+nLg/LyLX3QcrIYlutyLtODKdEtKKPDguzX5ro=;
 b=Sz0mJHHgNfmsjic09CXkxQFsImKQtMor2JbTXIa1J5odpf+UP7aNDwvNsy7kqJrpii/W7dFcy9lkCni/pig0m1BbS01/etxln5xlgBwl5pfDVyY+CRxqAzUxZN91KPK+scIrvHfEb1SSuuE0/GSYufBZmG2TW9WDmo3g3kynY/SZajISjcR8egRZcwhIAcJ5C2+XEWEgaNckzQNnCpLDKm3Fb+3FYc5uLpL7I62cphClPY/+nh8TOPocAkqFU2odwVvbaWaVtuEqoH/7IjeMvetR/tjXej4p+V9jTYrfVhQQHBg+tEQc6pBW35UQOC194iuzn0BUJNotIYKHFY71BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUTbB+nLg/LyLX3QcrIYlutyLtODKdEtKKPDguzX5ro=;
 b=OaP0REJbUQ5+YaSo4dNbXwKXxZvW4MDDVGoce2Ro5b6T+o+5lLKPwr7YRntXHaIyIotBeClzd+ruk17pWOxKiD9e6u5RlBPR7FChEnNuWsN7BENOucLCA5YbRSKXqlIuLaWb0WajGDmyHh/UKwMuYfuq/TSx8ciSqx4NBNqY9ewfRxaLV3DhMQ3P19w6SyAPwZI26DqIsWWcYl5chQAfzuC5xp5Zh4I1FG+R7uxka4526gLXpKOCgX2ANjwgPA9kTUcDP6EABk0eSNaqYiFVE6dPWPLdyFhHNv1e7Iz7lQgZvUbiO0h+w7eIlnHPbyw9Mcz5zXdsxCSreIri7u7Bqg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DBBP189MB1194.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:51:51 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:51:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcoxPZKW6wCEPPCESmdNKTFVRVsrWRizwAgAAKsLSAAE0VPg==
Date: Tue, 24 Feb 2026 13:51:51 +0000
Message-ID: 
 <AS8P189MB1672258FFE3FB25370AB973DB374A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260221092411.802178-1-adarsh.jagadish.kamini@est.tech>
 <DGN1ZXB3Z7EY.JKGGP9H2SP8G@smile.fr>
 <AS8P189MB1672712CB3B77941204EAC62B374A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS8P189MB1672712CB3B77941204EAC62B374A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DBBP189MB1194:EE_
x-ms-office365-filtering-correlation-id: 57b8484c-0b47-489e-0afa-08de73abdcb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MfZqlabrFfjb35LKy1pQ+RYQ9jvkRyqG5x5Dw+QHzvx9tP3mBEW09SEWvIPI?=
 =?us-ascii?Q?NyjdiPVGa+d5S7InifiKojIkRF0rdFqHIqdcS3DfSQ9RE/M0NlwzBppjiCSC?=
 =?us-ascii?Q?UI8cORP6DKmYVej6ctrTzb/3MOtYkL/OWU7TpuFWB8mFzgoyMPDDNeXP55po?=
 =?us-ascii?Q?KahzP8rZiagNHg120NF8TWBO7b9ogbW8gvUQDpZPbUN62ObFZTby/oMXl/tf?=
 =?us-ascii?Q?BXVz/HfwaJptDTVc2gWFNTJNoUxnJo2TuBDKwQVgReDGbfX2A9PQPpjQwT/Q?=
 =?us-ascii?Q?6kCyf834bg3pRiBPA7PgPMQF5KZhlQnBd1mkwqOgfeWmRU9aFEDM2/nepLnO?=
 =?us-ascii?Q?2n1ubHtf3Te/G3stqkm+BEaK22JacPEsR4UoQIis7hZR3CqWlbe6KNUINclp?=
 =?us-ascii?Q?IHyIKBRIYX58gpIInugCQOWmZARE4vpgnCA+udM2DVTPuqsZvHbTEH36wzWp?=
 =?us-ascii?Q?pCOtbVvQGRBNLVjbtwtOQC9LJ7/C1i3RqcoT0wERw7e/4KzdQCLQzrS7D4ts?=
 =?us-ascii?Q?JBTRd3R3jOe+35X2C5Z6mLeEdA16ixU5OhvsoAqhkJLhNKoIGHY/gB4lRwz/?=
 =?us-ascii?Q?uCfHY0ceijuHCDXD6lANOxKoBEHs+rR53jrkTgOv+WJKdr11KmbLGY1rpt0G?=
 =?us-ascii?Q?np+fAvjBH+dxMaenhdzYQD1zy4OXn6Qo7hB91P920Sb0+qvZ/ZIZ7aNu2tea?=
 =?us-ascii?Q?Trw+zyBEz4Ro0cGZ4mBzvUhAuDdv/sRKBXVvRXorknoAaHtlTHMbN8BBhXJ3?=
 =?us-ascii?Q?lYEmDl8MG7cs6qI49RQxLoI5ANIvaofYsA0UOWQWOUMpvsWln8bGAF3Dcdr8?=
 =?us-ascii?Q?a2/Zqh6WqjnUP+weqwZF8QH6Ykni5V+N0S7hO6ClZu4hzzR2PccGOxglhoYC?=
 =?us-ascii?Q?8/b/kCoPpj36vsPGAQthgqXjaziKEFTk7cCa3Bi85Lx41kvYxRJhZDVuan/P?=
 =?us-ascii?Q?J0xMRauxImP9tax4ySd5J5w/NlNmkASIzs1VjW8bv6Y1rGbAndZi7zsBFZkw?=
 =?us-ascii?Q?EZB3jpk6ApyLytSsF8iSZH7OiIAc73xOVrMKa9UnqTnYeTI1TjIU6DL5vj0e?=
 =?us-ascii?Q?h+lQo+zx8K56mYxITGr0rKIzUisiv/ujdtCR8DrVWl7602ktxaB+Hab8ykRL?=
 =?us-ascii?Q?nr2qwCq42DHKmIKXXn2JkS6BS1Luw6EyVh/FKJtJaxWIMMBGIl2oWbMr+TR8?=
 =?us-ascii?Q?k9eFrxe5hni4xxJpi7PsefNyBqRuLlz+e1wjaVfSRxxoTnIIPHChzG17ws/P?=
 =?us-ascii?Q?VAuiYbsrrdLSba8eBvTlrsQ5s+TwFaDfV4iimw4GQhB1Aw2cKjTteSAr25zD?=
 =?us-ascii?Q?IMnbUD4Shor17glT+GAs4Ku+ldVW8AlvRA9A57Dr0sus08r/D725TMJ/eOyi?=
 =?us-ascii?Q?XbJU5jagKWYEKFjXswjRYskMTM9SxTzPv2H6qQvlPrOTjxhm8wddePy+OF1P?=
 =?us-ascii?Q?m2fu/jKq0k/7pK7ubl2Sl4Fcd04JHQOeaUVGzTMUeVKsBxlY/WeAp4IoIBuf?=
 =?us-ascii?Q?Thwi3KlYn0bF1uOlm68tHM6hoLHhjrgMN6hGymNlpPgaswdbi2DHfo4huYSP?=
 =?us-ascii?Q?pPzvyMbTnDlXCLdwdv5MEWmspWb8f62+CHL05FDk?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EgobdJGjhuGQuM3g40HvW87UGCV3JMFm0mcbjA7VW87ZIcCI7p6O2QKo+K/5?=
 =?us-ascii?Q?WEK69nslI93KeTt9qgQHzsytYURf5ujSYGYCR1QewwXlW1pwVm4zjzwnmA/f?=
 =?us-ascii?Q?Q6tjorBe8S4w+53LrN7afY79AsP9B6FNJl5ONZF+rGONM9H7rObrAHFF6gm2?=
 =?us-ascii?Q?0G7vJW64rqoZtoJZwxOsWyetmdgO9gtDjPvpaaniZceyW9kEj+TwwjTHhbRP?=
 =?us-ascii?Q?sOKDWWdRMpKXo4c2gd2cEDJ+sdoep9Phx5+21yS3WbeDL4VYJ/0QIZrokdRK?=
 =?us-ascii?Q?MimoTj6YMg97BAQvvQWwyFCVl2wVqCrJngt06lGmDfijVGH+DJVfI4SjEzuL?=
 =?us-ascii?Q?vjz6Bf70+IHgUxPdpCCJ0Sz7fWRZoC0nCfPQW7j35vZRSdMncK58GP2WcEvD?=
 =?us-ascii?Q?bCuRXYSdEpNGSMsoSW4NlYbSbm1+BOiVuk3XyQZhhrP7ve0fa+ofc0leyZVb?=
 =?us-ascii?Q?5jc7C9Ph21jZEiCVr76GVgS9/jdUi/hHaI9tQkcZICB+EaK7UAkajS0FtJbf?=
 =?us-ascii?Q?zMG8P56Dmh67xMV36mfH1Ie99cwT8IghHQkhUEYS1DEiBVE957qX4jickqzf?=
 =?us-ascii?Q?/Rrh1K9ESN8tBMKrD4OOcI0QSwMNIjTL2Y60lQ20HFvKIuc4innInvZxzKrD?=
 =?us-ascii?Q?PDTtVCBILvnU0PSSzJTDAyXxmBQGx5UH+ByL9aTY0zoWTDsM20swn7iL7atp?=
 =?us-ascii?Q?uOru/1a6oR7We0mvsyofOo6hKDBie5Kzm29Al/RRp0rtcekzO10MyGSy4Dsk?=
 =?us-ascii?Q?2w3nYgiWgRlawQFZjIboWhY+UUlroPMoIX2ONN/SO+38m5JKBPoxDsjYVDHa?=
 =?us-ascii?Q?KbKCAXejrWoe0sLAZBaXqpyBulfOehOhijdmGI3LI5sqTyvYlYqq+4Lhdfu5?=
 =?us-ascii?Q?NkaoL4R7r6+8VGFKlIiCCtmeRRXpZxBwfO2BJYllJBDrt0AAaSIYYgy3MxN+?=
 =?us-ascii?Q?DadBwM8EsHXVgwpwSAYHdbBHWOiV8SoAJhyr0tZMMuae5sIBrlQVEC8PYPNb?=
 =?us-ascii?Q?vMv1Greanl9xUEV8C69S2RnBJyMVanraQpCeedaVVNKe+QWYfadNc6lrQUgi?=
 =?us-ascii?Q?nqKWROT6q+dbqNTEnS7W7FiSv+0IEn+ArIiUbNFgGrp2psXHrdmUBRWhNHZz?=
 =?us-ascii?Q?WEs0HMTL5WP3ExAMgudzGl3SqJkAFWLPEzy7FHkkvnGvQKuAc7VBpRDyJGSL?=
 =?us-ascii?Q?g5iy1HMPvBgds0uGPKwyeuv2bLfuJHGOtfExsBR5dtK/TFY70LLan/VC5VnS?=
 =?us-ascii?Q?QNeqYlEbwfye2PGrpu7GQcDgXtd3H4dPbqFh1mH8x5wPFoph9QZJXEEcfXFM?=
 =?us-ascii?Q?b4pxK+XBBpr3Nk/CrTHQdPDNNPYX/1zT47r+F/t+qq2mz9rFpOmRbkRz4Qia?=
 =?us-ascii?Q?xebwz9ZWykEyRV5/qdrjg/BnNXAvOvHROVybooMf6RfGN21V3nM/oydOdUNY?=
 =?us-ascii?Q?Il3Nf2l4cLD9DzpRpw+yJHwYrbk178x47PoWheNjTtZfgLGdoFGPGoVUWWKe?=
 =?us-ascii?Q?CwULLiELvUD17acluYzjmz17B+bVNSKWjalx3ZmIBGTLwAF+NSfYxBMP3ixf?=
 =?us-ascii?Q?sQa74NJknBiV8cVtMiR51sJXZUvwmKW2CCagZEkYsPUV7hBHbfEBVqSxAxYX?=
 =?us-ascii?Q?B7cXDBMYZPfZ1d41o/a/5S7tUkWbXkP/Tp+8Bg1acyRvXxuP+OnOXE0takqL?=
 =?us-ascii?Q?ZEDaltvOenPd18rf9l3yMmnpFM9FGEb7VHWkc8sFmkLa9PxYMjg1n0cAkabd?=
 =?us-ascii?Q?qAI8ngS9kJD6wdLJd4nbpgkFp1w4Mi4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b8484c-0b47-489e-0afa-08de73abdcb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 13:51:51.2374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9SoMzdB6YrLgtMMDJ79Gu/6atYSfgrhukjadbB+/PzZxhqc+rdv6qT931XTU3tOXM3TjO7Q5X4QZeQwvtUAAL1Za0oIKpgb1/JxMdAbXh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1194
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672258FFE3FB25370AB973DB374AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 13:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231765

--_000_AS8P189MB1672258FFE3FB25370AB973DB374AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi again,
It was not -p option, there was another problem.

Fixed it in v4

Thanks!
________________________________
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Sent: Tuesday, February 24, 2026 10:15
To: Yoann Congal <yoann.congal@smile.fr>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix CVE-=
2026-1703

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


--_000_AS8P189MB1672258FFE3FB25370AB973DB374AAS8P189MB1672EURP_
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
Hi again,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
It was not -p option, there was another problem.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Fixed it in v4</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adarsh Jagadish Kamin=
i &lt;adarsh.jagadish.kamini@est.tech&gt;<br>
<b>Sent:</b> Tuesday, February 24, 2026 10:15<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport f=
ix CVE-2026-1703</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Hi,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Sorry, it was the wrong -p option.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
I will fix it in v4.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Thanks!</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yoann Congal &lt;yo=
ann.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, February 24, 2026 09:36<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport f=
ix CVE-2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Sat Feb 21, 2026 at 10:23 AM CET, Adarsh Jaga=
dish Kamini via lists.openembedded.org wrote:<br>
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
</div>
</body>
</html>

--_000_AS8P189MB1672258FFE3FB25370AB973DB374AAS8P189MB1672EURP_--

