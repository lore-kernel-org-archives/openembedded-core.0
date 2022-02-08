Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FAFC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:37:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.16])
 by mx.groups.io with SMTP id smtpd.web10.12587.1644334675843759539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=iJTe22pR;
 spf=pass (domain: outlook.com, ip: 40.92.64.16,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N88Tbi7zwYcWzrL7m9B34/Pkj3eL4XozGEYRFy2gDNwthd+nNGN9lYCAS6KXPAOMJ2k7Qe/fLo36jV+2UMf4F6utr62D95mqtgWHLBAsjXS9sjJWrIgFS0ZALIL25LJxH75JzDwKh4C2dtQgyj3QMc7ZxRApe2cL+xU/z7kMBEKtAsM2zU6ul7jjhz9DAD061wYm0NE1ZGiNGO4yadfm63mlW6nSjeq5PrDEGBObZiqyBXp15dHJjfqvE4lWid9edG+rPw8ZnvAwtGQS/wrobAby5ZG9TcaYA985NSPML0aDcSzePD78LxNYN/E6T/uza44QEmqhkMKLBS1GRkDA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UC3qvm/XwA3ZjZ1PxR5bDx/IVbsLU5YXNG3F83Wf3g=;
 b=JkwwprUFTZxyHuc8k4HKhQNKh0ZgEnjzozhaqVxXhxSUCLaqqILsS1cOyWGRJvKH2s88+HaHtqlnp+XuttJAw+h6uXRSWTj1ZPJnaFLY0s7KaC7Az3sfzBD0p96vA7h9YkjNB5s+eqveioixHkud92ZNT53gOYORPxlF/BQahKAAyZYqcH9DJOiWOV/4tSG8/nOmy1gFmZrT4GFw3uY1MPMrv4ui+9anQyG8mYe+h2bIftqa7n/7axNFr8ot7fHkYdGVcjnsjb/jRhnPeP4WE6g3e/IxvuNRz4F5ESOGbEvwfn4xu0hvQHpNx+st13U5IWgBoQh05nptbZEpgUgp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UC3qvm/XwA3ZjZ1PxR5bDx/IVbsLU5YXNG3F83Wf3g=;
 b=iJTe22pR23JH5foj0VrZcbH6hMKNbpB72OGzj9nrPNzFljHl3JB8MwMtesyJzcBr4j0wqcIvz3PXHgr2FWtBtlXdmYtt5EWj3/Q7oJrhvrHc+DDDOiv4aktIvJOlMZHPy6twV10y0aEN+KsJT7Adi7GXGmC3cfcRmzTF23xc0O5h2yAi4S6ogP566swgq9MEWEGPNpXKY+GfCMnc/XkE32ch39d7PrBpEq7i5R3yC1IMGPG2QJrbAcVsrQLfwfwVPqeR9iukGpl6IWjeF5nBxT4yhSVTeyjjqSFdxZYSSeY9T5/GPSGh03Ukl73vH4oh3YCzaLVntWEJ5oszRnIU7g==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB2231.eurprd09.prod.outlook.com (2603:10a6:20b:44::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 15:37:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702%9]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 15:37:52 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: Saul Wold <Saul.Wold@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Topic: [OE-core] [PATCH v3] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Index: AQHYHPzmDLDA/zJGZk2d4SGCjLWixqyJ2euA
Date: Tue, 8 Feb 2022 15:37:52 +0000
Message-ID: <a1b3ffce-56d1-5602-c243-b1dbaba79e25@outlook.com>
References: <20220208150211.181994-1-saul.wold@windriver.com>
In-Reply-To: <20220208150211.181994-1-saul.wold@windriver.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AM9PR09MB4642.eurprd09.prod.outlook.com
 (15.20.4951.019)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9S9HZajLwqtdSHMSGrJH4c9JRN8r/exSKFFKwWubF9Emhkg59g6uPtgfejKq1Lkd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18ba15cf-7cb5-4b12-f764-08d9eb18f846
x-ms-traffictypediagnostic: AM6PR09MB2231:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 urQMzVh18XP75VusDGdvVGJJBPY1cji4KuOgwKjnvmVLYfKMcaHF014xHU8ApQbheiBkagX7ALQmUdR0p/fIa8VvKOFoYHXhyTHRXs6opUvbpzencZ9jmdHkHLFvgNUjqwBF8nH954k0jOcIwwdEZMHnmgqI/qVxwhIWg1G8wEtwPqJ349oIabq5zA2csQbVe7DUFqyciRkq4dEkVjSpNySGCiQWRNddsN7M6tDJssB13yQA8CRTWk/EsJxCFQ83mEjivsFgmQ6am68qdbMvE+gBvRCijIr2Cd6e85yl1XoedadlavJhOaM+c80AKtzUrzKsoSvRpbitotCr9AS2Qw3SSW2JRr6mJJ6XJJ0VkCNAr3oz4D04FqFwsXY14jsviacGiSMs5BT2ovQN//6VSvK4ql0W+gHP7ZyXnp+uJUpC2x8RdZ7pSmHhFXLUs53KgeglhWx2VNLbzzpPofjTq6NdMK6roYY8pgrWQ9/i2fEpHWm4JoH78FSKJN0Pc3fmO9xDSVlFNiWmH2BLP+GHxd1uN/Pvao4Ap2CJXZPG6v2gUax0HE8zvXf+PCjf9KB83gvN3Txd2EehcNrBC/isu3U/lSQEl+Vhf8KT2WCVf69OM18hjEnHZpp7ZKw0RWqqOAQs0TUKd3N52PdB/E5nDzU00xtQeOIrG/O77ulDX1A=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dBcp/Vgu4c81LvPGDNMf6LnMKQST1eV8SQEU0tWs9bbyY5LxtIT4v9esgk?=
 =?iso-8859-1?Q?5ewcU969cCQKWkBJf0m/eCwRMamlf4ivX6sh/EKesFAVhuofwwBHv6Tpbl?=
 =?iso-8859-1?Q?NcJ3XWEtNwrp8Sfk/fcpmYaoITlUCXsxnqIiC3N4D9ejFp7640SHnRcRGz?=
 =?iso-8859-1?Q?4kgSzmsdj82iumq87pEVNe7plQV/w8uNMD4+aPVtAIGgjXGql+EEmZAAEG?=
 =?iso-8859-1?Q?05NAJesNNSjszZBhYOCGLQ+MrnTgZK6k0X3+kjIVG91UWsO6sjNi4Qh3zY?=
 =?iso-8859-1?Q?n5NgbNtgwDvqtKJPUFwDp4v6aOTrImxyxdvhvm56Pjyre1JEJlZSDxzRZ7?=
 =?iso-8859-1?Q?SsRH2XIRbj9kcZ2cVy2DR2CeYgyihvSX/i3iF8oeq3ljV0ljIGvkiguBGJ?=
 =?iso-8859-1?Q?2AtGEoeAYKE3eUqPHwb3AJ08uEmWL+YgtW1MObUVjIs3HJP8mZjoSvGZzE?=
 =?iso-8859-1?Q?6l65Z/v5fOHytQa3ZPtZzQW8ia8zQxfTgXs5RWKDNMrcjVRMsccZq4yUxH?=
 =?iso-8859-1?Q?g1AA3qiTgeqVG+EDM76hEifz1Zq3LimxpW5mUAeY/PxAvveKZOj3tk/h2w?=
 =?iso-8859-1?Q?XW3U4FsTiHJQXykJfnUwqPbU3IxxUCg/xxXMT4MFJxzQqwZsTeOCLEvOst?=
 =?iso-8859-1?Q?Rh2Y1SY52e077lc2AFkfvWMUBS0eUW9m4408Y7drJnBvhqTUYAgP63AhSj?=
 =?iso-8859-1?Q?mLFljX85UEzlc3w2w8wTwBCIrhyxhDoMl4218LcZXUJOI+ZAlkDVAFGmbv?=
 =?iso-8859-1?Q?BbmJ2elW84AwZ4h8qPTgBmGaDll7Emy0/JomVMqr0iObjz7Ml3q/mf/obm?=
 =?iso-8859-1?Q?ZAHLD7kSQvv04j5RHKCHnSdk5fTOnv353UWi8YaLZVBEkA+r0h8Ig73pvH?=
 =?iso-8859-1?Q?lvFAXr1hNEPWKQHPVh7kh80vgpllMFn3xe2p/MxhTcAxBej1JlaAcnZ1I6?=
 =?iso-8859-1?Q?vU+/cW6ciA4exK1MZ0vqHQcJMC8NuM9KS7t2BneU9tloc3/eoo+2Db4ugc?=
 =?iso-8859-1?Q?e07iIoKZ0SyMQQRpXRnn1nlRNkcPqOcakUqg3o?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: 
 <8817B689345CDA419EDB9A9220691777@sct-15-20-4755-11-msonline-outlook-64da6.templateTenant>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18ba15cf-7cb5-4b12-f764-08d9eb18f846
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 15:37:52.6153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2231
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161515

On 08.02.22 16:02, Saul Wold wrote:=0A=
> This patch will read the begining of source files and try to find=0A=
> the SPDX-License-Identifier to populate the licenseInfoInFiles=0A=
> field for each source file. This does not populate licenseConcluded=0A=
> at this time, nor rolls it up to package level.=0A=
> =0A=
> We read as binary file since some source code seem to have some=0A=
> binary characters, the license is then converted to ascii strings.=0A=
> =0A=
> Signed-off-by: Saul Wold <saul.wold@windriver.com>=0A=
> ---=0A=
> v2: Clean up commit message=0A=
> v3: Really fix up regex based on Peter's feedback!=0A=
> =0A=
>   meta/classes/create-spdx.bbclass | 22 ++++++++++++++++++++++=0A=
>   1 file changed, 22 insertions(+)=0A=
> =0A=
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass=0A=
> index 8b4203fdb5..64aada8593 100644=0A=
> --- a/meta/classes/create-spdx.bbclass=0A=
> +++ b/meta/classes/create-spdx.bbclass=0A=
> @@ -37,6 +37,23 @@ SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field=
 for SPDX packages created f=0A=
>   =0A=
>   do_image_complete[depends] =3D "virtual/kernel:do_create_spdx"=0A=
>   =0A=
> +def extract_licenses(filename):=0A=
> +    import re=0A=
> +=0A=
> +    lic_regex =3D re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()=
+-]+?)(?:\s+\W*)?$', re.MULTILINE)=0A=
=0A=
Taking inspiration from reuse-tool =0A=
(https://github.com/fsfe/reuse-tool/blob/master/src/reuse/_comment.py) =0A=
and the way they parse comment blocks the results with the updated regex =
=0A=
look good.=0A=
=0A=
Test sample set:=0A=
(* SPDX-License-Identifier: Foo-Bar *)=0A=
(* SPDX-License-Identifier: Foo-Bar *)=0A=
/* SPDX-License-Identifier: Foo-Bar */=0A=
<!-- SPDX-License-Identifier: Foo-Bar -->=0A=
<#-- SPDX-License-Identifier: Foo-Bar -->=0A=
<%-- SPDX-License-Identifier: Foo-Bar --%>=0A=
{# SPDX-License-Identifier: Foo-Bar #}=0A=
{/* SPDX-License-Identifier: Foo-Bar */}=0A=
{{!-- SPDX-License-Identifier: Foo-Bar --}}=0A=
@Comment{ SPDX-License-Identifier: Foo-Bar } ---> Only this one is =0A=
missed (which is bibtex syntax) - no idea if that is of importance for =0A=
anyone.=0A=
=0A=
Just wanted to highlight that this is not catching every possible input lin=
e=0A=
=0A=
=0A=
> +=0A=
> +    try:=0A=
> +        with open(filename, 'rb') as f:=0A=
> +            size =3D min(15000, os.stat(filename).st_size)=0A=
> +            txt =3D f.read(size)=0A=
> +            licenses =3D re.findall(lic_regex, txt)=0A=
> +            if licenses:=0A=
> +                ascii_licenses =3D [lic.decode('ascii') for lic in licen=
ses]=0A=
> +                return ascii_licenses=0A=
> +    except Exception as e:=0A=
> +        bb.warn(f"Exception reading {filename}: {e}")=0A=
> +    return None=0A=
> +=0A=
>   def get_doc_namespace(d, doc):=0A=
>       import uuid=0A=
>       namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UU=
ID_NAMESPACE"))=0A=
> @@ -232,6 +249,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv=0A=
>                           checksumValue=3Dbb.utils.sha256_file(filepath),=
=0A=
>                       ))=0A=
>   =0A=
> +                if "SOURCE" in spdx_file.fileTypes:=0A=
> +                    extracted_lics =3D extract_licenses(filepath)=0A=
> +                    if extracted_lics:=0A=
> +                        spdx_file.licenseInfoInFiles =3D extracted_lics=
=0A=
> +=0A=
>                   doc.files.append(spdx_file)=0A=
>                   doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)=
=0A=
>                   spdx_pkg.hasFiles.append(spdx_file.SPDXID)=0A=
> =0A=
> =0A=
> =0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> Links: You receive all messages sent to this group.=0A=
> View/Reply Online (#161513): https://lists.openembedded.org/g/openembedde=
d-core/message/161513=0A=
> Mute This Topic: https://lists.openembedded.org/mt/88997967/3647476=0A=
> Group Owner: openembedded-core+owner@lists.openembedded.org=0A=
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kw=
eihmann@outlook.com]=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> =0A=

