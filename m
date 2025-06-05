Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBEDC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:01:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.16])
 by mx.groups.io with SMTP id smtpd.web11.4773.1749121270479062072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=zHAEBWJJ;
 spf=pass (domain: ericsson.com, ip: 52.101.84.16, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rr7xjwe6K+KvVajFsbHYK4HbcgBQ+HEUIxy7U5fs6FpW9vPaKwMe0pHfdjYhrUHjJn4k8cDbSWZ3uJOApZb44kvEb/eciuNyq0jo1b0CRaZtLBrRU1aKqNcWtFQQ3oJfmF+kiM6m+28+vDoU7NXPa5DeWGfXvoOw28WUbYsVFH1mEAQONas4NT2gavz04c5ovk2DMTSNxlsqx9MkALJKryKTacYH278MOdV/XIeAMmnYrXRLBbERuJIOsOsPVDdXau14gUEI8N+ze8ZRpQsH1pwVIsPYUS/ViYibgcjYATg/KIXnujVLiTApUGtGncdS0+P7D3uX/k/vjU+3y6E4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej/QSr5v3ObilUDG3kDMVSMLOCmzndoqYC9Ds930PF8=;
 b=g+p5IVinCg2qmqWT46VGct0NECyZr569B+y1L+rIKqJpoNaEA5YpOHzy6/EH0HcyQrCyJuXUaqG+s2AfwINrPd8eXJNL7LBfNjnB9xm6kpqxWGdDTj3US2GB6MTnQ68SzqFrNZs3ugZUVgd30hZbmDqCiRPyZ/QNP+VDzT43DEr28nbhWgYwlRh+jOwkmUqrR8I9kId102n2Erj7JflTUGUbCiwKdQ8vlKFstK9AkHgec81I7U8GCqILdDk/wo561+Fad3npDrn+yxxds+lsmv74iKoSkXWTtxyZLq5qg2G1GJ2ZCKtl3weWdRyb8DHI3UvoDCu9aQb1lzWGcvqmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej/QSr5v3ObilUDG3kDMVSMLOCmzndoqYC9Ds930PF8=;
 b=zHAEBWJJt/gM89hb2IoZ6I7ccwosH1yOEwnADPctkw9gjfD5zp8ykJ4yj3nqtGBKqF6Huq0r4FvY5kd5GoFuCQ1iurDUgsq0JlHVaVXjSWzpMIKg3cFe1KELVdkTFyl5O53Svwu/Pa2IbEFD97I8nYCxLQZucsImp9O1EavQySsbk3XCR0sEXr1BfEC5LA12rYwlaAR1RfKZOIgolAyXJozEyNHd0bKS7KbSZc7pMXHBMBK0gnl7XKqwT6BNwborQnzDoHg5U+IynNkurTgUf7E41h8aZ2BWvVj7A95c4hPk99pNMUXt6EIEMwhh6cyqV0irzrKw8N9fVyX4YPFZ3w==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by GV2PR07MB10334.eurprd07.prod.outlook.com (2603:10a6:150:2a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 11:01:07 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 11:01:06 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH v6 1/3] package: export debugsources in PKGDESTWORK as
 json
Thread-Topic: [PATCH v6 1/3] package: export debugsources in PKGDESTWORK as
 json
Thread-Index: AQHb1ULdmiwUgxEoNUG6MfVBZwIpa7P0XmKAgAAI6Zc=
Date: Thu, 5 Jun 2025 11:01:06 +0000
Message-ID: 
 <PR3PR07MB666659AD2EE7924E191731C08A6FA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250604112133.2581063-1-daniel.turull@ericsson.com>
	 <20250604112133.2581063-2-daniel.turull@ericsson.com>
 <d765e17f7c7b3e2d46da0f2983748dc7cf413948.camel@linuxfoundation.org>
In-Reply-To: 
 <d765e17f7c7b3e2d46da0f2983748dc7cf413948.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|GV2PR07MB10334:EE_
x-ms-office365-filtering-correlation-id: 36bb36e5-3215-462e-92b3-08dda420453a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?lhlzYF3dC8skAWXvVWXml8ua4NTFUpSvpR+HlQQOMuxkmzR3bYKZ3kkd?=
 =?Windows-1252?Q?xk0TzEz8Jm6JeQA/yJ7xMfRikoRUvlImahAaUwaErWfC0Y5qMIqOmBBY?=
 =?Windows-1252?Q?th8lxV0wWjOukyuvdAVmP2ffqlxJtBMfhN31kQc/QhzNSEaMkU293Kht?=
 =?Windows-1252?Q?HqLmA1AyKEkne/LQHhO4WGb6X4rwV7jIdU9IH4TU7zH7qje4nocdo8Bq?=
 =?Windows-1252?Q?2yk38w3hC4krxwzKD8u8y4nB+J0pczXkM1MygkB9hMXvYqMTbtTOwF1C?=
 =?Windows-1252?Q?6jXEDZk2H4uY6FV7Hn5V3m6XEVByUctF+ofkUWqxXtyas4MsF/0spAAb?=
 =?Windows-1252?Q?rNBIa7uQhyDlBUto5EARGI42HOSMBrR477Rq2REGGatbpn6opoLk3Ikb?=
 =?Windows-1252?Q?MvivsgA4KB4sRTQ4dmXErmgGZS/mBx+MypeZJdkCI3/thYB83sBlpvWN?=
 =?Windows-1252?Q?Z1oS2kcnJ77pBYKRz5cYsyOLJDKBRU4Kc+NZAtXFXNOefwlAdtYCHkCL?=
 =?Windows-1252?Q?rqoD75OIsQQFTSiXkMmH3fnhSwy/FNeQfGz/xoCObJKM/RYyaxqa2VAO?=
 =?Windows-1252?Q?wq+bJBsHIjQdTp2/6y/ZTQtsenQ27tXS3uGxtVI7MQU2JQ+7xAj8/98B?=
 =?Windows-1252?Q?qPrgU/1vDJSsdsVCM5te8512zfI7w404YK9y9NESUH8mnFu3+NauoUEq?=
 =?Windows-1252?Q?kqr4gh5SuO8HU+rh09MH+w5ZpfZk/DXSEQ5ELpSxmejklfaIxWeZOGjG?=
 =?Windows-1252?Q?Tmdiy9UTbRS84h3F0M1TyqrMBdpC4txUZsFH+B06J8AZkK6h4RE9Rc+B?=
 =?Windows-1252?Q?Qx39Vb3QNiOZ6Yxi+Lv1K0/zCfity3ExTPomyCUd5EDQytgpTdmhwTai?=
 =?Windows-1252?Q?c460NvN6te0rfhe/mDXrZaUx2T8heLtbZyIOtApwml+9oX1EC78Rlz9Q?=
 =?Windows-1252?Q?wVFEOF2kkgFy6tQL2got48kLcfTlTKYqql99SR7WeSjrje+T/wCEhU6J?=
 =?Windows-1252?Q?1CM5CaZnj5b5GIPyRzlRR/kq0RdHd2Gz0XijjsPGvGWmxuAttBGTDm/P?=
 =?Windows-1252?Q?UTv+j/2Zp1xtwpUp5uRoZbhEf9j3F1DR0KCEKmDTwnuI/BUiBE/3X15K?=
 =?Windows-1252?Q?X1Gorj8QZ8A/7CTODb7IrNaiX9PoM/29YvAzswe8rcIKYIpP5LHJ1hVB?=
 =?Windows-1252?Q?wKlHasjCwGo0KPjOH/1VqP0PeDim/LPBG+uiRdoqL68ekttwNLvpzygI?=
 =?Windows-1252?Q?T94qieKOB3MjlLw2UDVSyxhOE1WtbhlKQAP6/tSkIA5FWPFwouEwuAcV?=
 =?Windows-1252?Q?JfOHgvnPyV09QReaHRcV5x/t2EF5jbZZBi4SE+5/UEhGzbcjuNZ2SQgN?=
 =?Windows-1252?Q?c1nA2yyWuJJe87lygMlORGQlStSss5vQVakUEFb3agm/jYGLTu0P4B8X?=
 =?Windows-1252?Q?/T9b6zLTvVZgvsWlob5LjgM10ptbudes5imLhRh2/meMp4mbAZmZ6/5o?=
 =?Windows-1252?Q?sbaBe+aSFabr9I/RkjuFxt0bA4t1GN7wyYpJ4Isk8j6ZH+dAVAkEgWwI?=
 =?Windows-1252?Q?H7DHj27AnF1hXIXC48RHcBibpSGPUkqsZXhop+iGQwlqSwSMs3pfO6Eo?=
 =?Windows-1252?Q?kto=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?2QweWkoT4MmV2Uf+GKdHRvdPqZTRJVhB6VjQdK6hdqQVaghKiPEomvO7?=
 =?Windows-1252?Q?JhbOdmyXlcfmxRWDW0mAYaVT5Nv9yyfpGmEtDWfcB5PBHl5386dmfuyl?=
 =?Windows-1252?Q?nBeqKNoKC8BHlVvKkgGjy/sRwmnl/R5IuYRz21nX491OJUJV7yb8pMD5?=
 =?Windows-1252?Q?BZc2JqM/YxTeRMhTUQzh1B3urKtfSzt6Od4fxktVhxg95xbRbALOgXc2?=
 =?Windows-1252?Q?dkHvP5usx2lWCiOsPbzSXIWH/jaq+3xRaG3oebKS460vG2s6zKTfVL5Q?=
 =?Windows-1252?Q?xhhsch8u80zXrmRQ8AkWKYLdiuE41rioPsfkftbAyv8lKP+DX6xBxV7I?=
 =?Windows-1252?Q?JzVwRRPlGZEYT8I1uruCGdCJXC8QzJmqVUsYgCg+VHQCk86s03p/D1kH?=
 =?Windows-1252?Q?/5zyoQUQq5TpwPOtU4xmijiMDFUWJdulUh5zopRtNmN/qEqhmOKju6dN?=
 =?Windows-1252?Q?OPlvLTwGWptrUY4y1Qm1p0y5hjhqEUjbGZ/4NBWwrOXfEyvTo41dgkES?=
 =?Windows-1252?Q?2WL5+XXG77kbDoMRKLeEpKeZbPLEp1UUs8aqrtDhxfDIA/ppiqrwQG+x?=
 =?Windows-1252?Q?FemQfEJSvTkxwoPHp0NU0ClfBoe4xDhI25q3CfVKq2l5JI5aSYPLtsXl?=
 =?Windows-1252?Q?hOLM5rjUqiFcrfmK0/top2stDWYT8EQTJdkkrctOqaNPcDbS/2Flw7pT?=
 =?Windows-1252?Q?J9EpITLR86WupXha0BFB8PBzN528X8nEfYrK0HCwUJpYIBFLAyaAvIBQ?=
 =?Windows-1252?Q?FFFq97941Wie2QOLUdxKMEF3NQJR7Pyq5vEKUacGZe73G4Y/04VOur8T?=
 =?Windows-1252?Q?ALHvIQSZNmaHqnh3FrlcJpaqS8dPw52Ls6cC7f8z2yi1a6t4g7aLY7mY?=
 =?Windows-1252?Q?+OIJFihUQWq/drZ68M7qVZWbRrRjr49b3vuaiNwpKI9dHYPHevXN1LcL?=
 =?Windows-1252?Q?29aeR5ZzinWPlP+Q7irsAOUbBO+pwAQNDJdFcEMioNRTi/jdu+joZQ2Q?=
 =?Windows-1252?Q?Cg7ldqOLppzxocrZGSGTLDIL+Kxr1jrErwIHWw8jjK4f940t00kTneaI?=
 =?Windows-1252?Q?+b6uIQ+QUVSgPbiS0H3He7NgBQECvBpgVmau/mEwtLbqHvG2ySzf3FIw?=
 =?Windows-1252?Q?WWz2oMMED95nBg0L3s6NNU7+l7okmEUHtC6fAoems6kbNEmyliHiSzQc?=
 =?Windows-1252?Q?CGe78HE8GOM4UdhipjOY45xw6frylsuzqyLLs/Q0AbxABawf5KzluRNr?=
 =?Windows-1252?Q?xheSbv9hyvTCxsDaOH/EHUjmGzMfLAenZvEAsfNqkby46ChaFcQBg0C9?=
 =?Windows-1252?Q?8JTlwJfvdH+NZp7tUXJpnrFiYgLQYaqS3ktGkCOxRoyOmsxj3p/dvDfu?=
 =?Windows-1252?Q?7XXdzP2RNWfpnO9HbWsGMxgVArYsy44wZvbkXsNLoDl5XrNjYxTnORN4?=
 =?Windows-1252?Q?ez/KqHVVIZbvaZmXctPsUpCaS/LwJuKDNcKsa9dnUPU0kRIGNNkdTizr?=
 =?Windows-1252?Q?mo1Rl/0nqIHyRSRXjP7LoyYluvzzb1FzQFG1AsECsgRWFAwkfGXp7tZ/?=
 =?Windows-1252?Q?N3SLrIF6rFFpAqYIv4MOcuiAGfx82hiuuePRVtgro4JxBt4ar7p5bxCp?=
 =?Windows-1252?Q?Bfv0BAziTZ9refh5h8DX/4O0X/01dC/E70Wd5D9WM87VpKAuT8b3YwQB?=
 =?Windows-1252?Q?lYWT2q2Esc23HvBw0gHqbNowXtQp+iFAuSwnW64Ifn1V5xXkCbIs0A7R?=
 =?Windows-1252?Q?SPOHSjiJZN7nYIC1sf0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PR3PR07MB666659AD2EE7924E191731C08A6FAPR3PR07MB6666eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bb36e5-3215-462e-92b3-08dda420453a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 11:01:06.3433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgfEIe3w9ZXxKChd1/rya6up+aootkAoVQuTLF7dpWctVJeulma7QilXV0cvKDV7Pg/wItoCsoRDmtWormoDNkuZymiCKpgDc6147nzeQFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB10334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218004

--_000_PR3PR07MB666659AD2EE7924E191731C08A6FAPR3PR07MB6666eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks, I=92ll do that and resubmit with the changes. Should I resubmit the=
 whole series or only this patch?
Cheers,
Daniel
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Thursday, June 5, 2025 12:27:35 PM
To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH v6 1/3] package: export debugsources in PKGDESTWORK as =
json

On Wed, 2025-06-04 at 13:21 +0200, daniel.turull@ericsson.com wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> The source information used during packaging can be use from other tasks =
to
> have more detailed information on the files used during the compilation a=
nd
> improve SPDX accuracy.
>
> Source files used during compilation are store as compressed zstd json in
> pkgdata/debugsources/$PN-debugsources.json.zstd
> Format:
> { binary1: [src1, src2, ...], binary2: [src1, src2, ...] }
>
> I checked the sstate size, and it slightly increase using core-image-full=
-cmdline:
> Before: 2454884 B
> After: 2456860 B (+1976 B or 0,08%)
>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 0bcc04ea54..c5acb7d205 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1049,6 +1049,49 @@ def copydebugsources(debugsrcdir, sources, d):
>              if os.path.exists(p) and not os.listdir(p):
>                  os.rmdir(p)
>
> +def save_debugsources_info(debugsrcdir, sources_raw, d):
> +    import json
> +    import bb.compress.zstd
> +    if debugsrcdir and sources_raw:
> +        debugsources_file =3D d.expand("${PKGDESTWORK}/debugsources/${PN=
}-debugsources.json.zstd")
> +        debugsources_dir =3D os.path.dirname(debugsources_file)
> +        if not os.path.isdir(debugsources_dir):
> +            bb.utils.mkdirhier(debugsources_dir)
> +        bb.utils.remove(debugsources_file)
> +
> +        workdir =3D d.getVar("WORKDIR")
> +        sdir =3D d.getVar("S")
> +        pn =3D d.getVar('PN')
> +        pv =3D d.getVar('PV')
> +        sources_dict =3D {}
> +        for file, src_files in sources_raw:
> +            file_clean =3D file.replace(f"{workdir}/package/","")
> +            sources_clean =3D [
> +                src.replace(f"/usr/src/debug/{pn}/", "")
> +                   .replace(f"{sdir}/", "")
> +                   .replace(f"/usr/src/kernel/", "")
> +                   .replace(f"/usr/src/{pn}/", "")
> +                   .replace(f"{pn}-{pv}/", "")
> +                   .replace(f"{pv}/", "")
> +                for src in src_files
> +                if not any(keyword in src for keyword in ("<internal>", =
"<built-in>")) and not src.endswith("/")
> +            ]
> +            sources_dict[file_clean] =3D sorted(sources_clean)
> +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> +        with bb.compress.zstd.open(debugsources_file, "wt", encoding=3D"=
utf-8", num_threads=3Dnum_threads) as f:
> +            json.dump(sources_dict, f, sort_keys=3DTrue)
> +
> +def read_debugsources_file(d):
> +    import json
> +    import bb.compress.zstd
> +    try:
> +        fn =3D d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.=
json.zstd")
> +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
> +        with bb.compress.zstd.open(fn, "rt", encoding=3D"utf-8", num_thr=
eads=3Dnum_threads) as f:
> +            return json.load(f)
> +    except FileNotFoundError:
> +        bb.debug(1, f"File not found: {fn}")
> +        return None
>
>  def process_split_and_strip_files(d):
>      cpath =3D oe.cachedpath.CachedPath()
> @@ -1280,6 +1323,9 @@ def process_split_and_strip_files(d):
>          # Process the dv["srcdir"] if requested...
>          # This copies and places the referenced sources for later debugg=
ing...
>          copydebugsources(dv["srcdir"], sources, d)
> +
> +        # Save source info to be accessible to other tasks
> +        save_debugsources_info(dv["srcdir"], results, d)
>      #
>      # End of debug splitting
>      #

This looks good, as I as about to merge it, I realised there is one
issue. bitbake.conf has these entries:

meta/conf/bitbake.conf:oe.packagedata.emit_pkgdata[vardepsexclude] =3D "BB_=
NUMBER_THREADS"
meta/conf/bitbake.conf:oe.packagedata.read_subpkgdata_extended[vardepsexclu=
de] =3D "BB_NUMBER_THREADS"

and I think you need to replicate these for your new functions. The
reason is to stop sstate being dependency on the number of threads
used.

We have had work in process to move these definitions alongside the
function declarations but I'm not sure we've solved that yet so adding
to bitbake.conf is the easiest thing to do for now.

Cheers,

Richard




--_000_PR3PR07MB666659AD2EE7924E191731C08A6FAPR3PR07MB6666eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr">Thanks, I=92ll do that and resubmit with the changes. Shou=
ld I resubmit the whole series or only this patch?</div>
<div dir=3D"ltr">Cheers,</div>
<div dir=3D"ltr">Daniel</div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"ltr"></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Thursday, June 5, 2025 12:27:35 PM<br>
<b>To:</b> Daniel Turull &lt;daniel.turull@ericsson.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Cc:</b> Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
<b>Subject:</b> Re: [PATCH v6 1/3] package: export debugsources in PKGDESTW=
ORK as json</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2025-06-04 at 13:21 +0200, daniel.turull@e=
ricsson.com wrote:<br>
&gt; From: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; <br>
&gt; The source information used during packaging can be use from other tas=
ks to<br>
&gt; have more detailed information on the files used during the compilatio=
n and<br>
&gt; improve SPDX accuracy.<br>
&gt; <br>
&gt; Source files used during compilation are store as compressed zstd json=
 in<br>
&gt; pkgdata/debugsources/$PN-debugsources.json.zstd<br>
&gt; Format:<br>
&gt; { binary1: [src1, src2, ...], binary2: [src1, src2, ...] }<br>
&gt; <br>
&gt; I checked the sstate size, and it slightly increase using core-image-f=
ull-cmdline:<br>
&gt; Before: 2454884 B<br>
&gt; After: 2456860 B (+1976 B or 0,08%)<br>
&gt; <br>
&gt; CC: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
&gt; Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/lib/oe/package.py | 46 ++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt; &nbsp;1 file changed, 46 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
&gt; index 0bcc04ea54..c5acb7d205 100644<br>
&gt; --- a/meta/lib/oe/package.py<br>
&gt; +++ b/meta/lib/oe/package.py<br>
&gt; @@ -1049,6 +1049,49 @@ def copydebugsources(debugsrcdir, sources, d):<=
br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if os.path.exists(p) and not os.listdir(p):<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; os.rmdir(p)<br>
&gt; &nbsp;<br>
&gt; +def save_debugsources_info(debugsrcdir, sources_raw, d):<br>
&gt; +&nbsp;&nbsp;&nbsp; import json<br>
&gt; +&nbsp;&nbsp;&nbsp; import bb.compress.zstd<br>
&gt; +&nbsp;&nbsp;&nbsp; if debugsrcdir and sources_raw:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugsources_file =3D d.ex=
pand(&quot;${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd&quot;)<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugsources_dir =3D os.pa=
th.dirname(debugsources_file)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not os.path.isdir(debug=
sources_dir):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.utils.mkdirhier(debugsources_dir)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.remove(debugsourc=
es_file)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; workdir =3D d.getVar(&quot=
;WORKDIR&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdir =3D d.getVar(&quot;S&=
quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn =3D d.getVar('PN')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pv =3D d.getVar('PV')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sources_dict =3D {}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for file, src_files in sou=
rces_raw:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi=
le_clean =3D file.replace(f&quot;{workdir}/package/&quot;,&quot;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; so=
urces_clean =3D [<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; src.replace(f&quot;/usr/src/debug/{pn}/&quot;, &quot;=
&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .replace(f&quot;{sdir}/&quot;, &quo=
t;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .replace(f&quot;/usr/src/kernel/&qu=
ot;, &quot;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .replace(f&quot;/usr/src/{pn}/&quot=
;, &quot;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .replace(f&quot;{pn}-{pv}/&quot;, &=
quot;&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .replace(f&quot;{pv}/&quot;, &quot;=
&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for src in src_files<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if not any(keyword in src for keyword in (&quot;&lt;i=
nternal&gt;&quot;, &quot;&lt;built-in&gt;&quot;)) and not src.endswith(&quo=
t;/&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; so=
urces_dict[file_clean] =3D sorted(sources_clean)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_threads =3D int(d.getV=
ar(&quot;BB_NUMBER_THREADS&quot;))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with bb.compress.zstd.open=
(debugsources_file, &quot;wt&quot;, encoding=3D&quot;utf-8&quot;, num_threa=
ds=3Dnum_threads) as f:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; js=
on.dump(sources_dict, f, sort_keys=3DTrue)<br>
&gt; +<br>
&gt; +def read_debugsources_file(d):<br>
&gt; +&nbsp;&nbsp;&nbsp; import json<br>
&gt; +&nbsp;&nbsp;&nbsp; import bb.compress.zstd<br>
&gt; +&nbsp;&nbsp;&nbsp; try:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fn =3D d.expand(&quot;${PK=
GDESTWORK}/debugsources/${PN}-debugsources.json.zstd&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_threads =3D int(d.getV=
ar(&quot;BB_NUMBER_THREADS&quot;))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with bb.compress.zstd.open=
(fn, &quot;rt&quot;, encoding=3D&quot;utf-8&quot;, num_threads=3Dnum_thread=
s) as f:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn json.load(f)<br>
&gt; +&nbsp;&nbsp;&nbsp; except FileNotFoundError:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(1, f&quot;File no=
t found: {fn}&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return None<br>
&gt; &nbsp;<br>
&gt; &nbsp;def process_split_and_strip_files(d):<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; cpath =3D oe.cachedpath.CachedPath()<br>
&gt; @@ -1280,6 +1323,9 @@ def process_split_and_strip_files(d):<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Process the dv[&quo=
t;srcdir&quot;] if requested...<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This copies and pla=
ces the referenced sources for later debugging...<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; copydebugsources(dv[&=
quot;srcdir&quot;], sources, d)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Save source info to be a=
ccessible to other tasks<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_debugsources_info(dv[=
&quot;srcdir&quot;], results, d)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; #<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; # End of debug splitting<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; #<br>
<br>
This looks good, as I as about to merge it, I realised there is one<br>
issue. bitbake.conf has these entries:<br>
<br>
meta/conf/bitbake.conf:oe.packagedata.emit_pkgdata[vardepsexclude] =3D &quo=
t;BB_NUMBER_THREADS&quot;<br>
meta/conf/bitbake.conf:oe.packagedata.read_subpkgdata_extended[vardepsexclu=
de] =3D &quot;BB_NUMBER_THREADS&quot;<br>
<br>
and I think you need to replicate these for your new functions. The<br>
reason is to stop sstate being dependency on the number of threads<br>
used.<br>
<br>
We have had work in process to move these definitions alongside the<br>
function declarations but I'm not sure we've solved that yet so adding<br>
to bitbake.conf is the easiest thing to do for now.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PR3PR07MB666659AD2EE7924E191731C08A6FAPR3PR07MB6666eurp_--

