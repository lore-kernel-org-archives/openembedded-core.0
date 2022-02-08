Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F77C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:19:57 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.41])
 by mx.groups.io with SMTP id smtpd.web10.13280.1644337196022564952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=s+uZPqvZ;
 spf=pass (domain: outlook.com, ip: 40.92.64.41,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glQyCdU5orSxeZBFpldVE6Lwfc0pxBaRLq8uRvmrg9qJ8KOE/PJY6rnsJUPWqO6dtXB6VgauIRNPfdFOS3izCA/6JvzLdxQYysBfxAWltq0vDFjXT/fFwyWGoMj+E3vJNXiLRcGObY5M5hIYrqxDuEnYawNGHqWk2Z9crlkVyEew47npVRpzzRwABEPtCyblqnCJvuW438QPQ8/FM4bcupiWWHTJBoZBiouwLGRD0yiFwwEf6+GobqFWpAGk5ljAFV0+6AIBGLgdS9bzjAZoV0KKS30eeDIp8Px/QCxk0Zh/y/58OEI4s6tvxmQCvCYZbLuD/yFaafJZj5EZfg1VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+E3Jn6VHik8PYNoKfDy8XVYr4sWdIb+7KJ+cWNJQVs=;
 b=WaSsOHgAXDWOPVxt2UmApHkU2UR8fdKfxXS4+poo/FIljxZ0ND/jZpwyb2BqBUb/HRsNk3ISX4EiNnPlFhra05xrWnMu/mSpzxoMzDFaADDGMJGE49tkO1cjL3quYc6/77UUn5dxezWFOEHzEApDHWD1xTNMVfNhbvKy+DLeuyrMe+sEjE75jSrJJ4fUW+m/wqTUYgj0Cid9iRznUqC7iiDJUKirqQc9KTsX4pcFWEnCKzkJrQ9kuTeFKEdb/g2F9nW5qcY/Ee+sl8OeGlyMSyvHEZ2C97MnnyJboaYONLAApNFLiWT9oWmrJ1hmqU28phJ5alY5nyosbeaApNmSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+E3Jn6VHik8PYNoKfDy8XVYr4sWdIb+7KJ+cWNJQVs=;
 b=s+uZPqvZG4LQuJ+w+bJa837/c5mU0yq1AF7BDTyrcaITlp8aBdJLOyjl/m+duPeEoGD171KI3odzgFl8x/oqVjwMwzJh+1diORueijJSwqpsmvl0taFaXa+nKub2xFpVNpqwYakyOTNTQ/axvOuDybjF4tiqtUaRT0FAHLce32sMpyHotxRP0LTxzZtx4vB20KsYcfWA07fpEMAtEhBMoqm+2qEXZTrhZyoiPH+kK/Oxf1gfQS2zgkBOYD1fI69G4e0ua/kimbnahlGqPV1yPhgbqkZ/kJ8uIZrabQRED2Rr5ccABF14S/hUaPBfRCGutrowlWOQQgazb997gnvDBw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM8PR09MB5291.eurprd09.prod.outlook.com (2603:10a6:20b:36e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 16:19:53 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702%9]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 16:19:53 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: Saul Wold <Saul.Wold@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Topic: [OE-core] [PATCH v3] create-spdx: Get SPDX-License-Identifier
 from source
Thread-Index: AQHYHPzmDLDA/zJGZk2d4SGCjLWixqyJ2euA///zL4CAABj0gA==
Date: Tue, 8 Feb 2022 16:19:53 +0000
Message-ID: <f6d59e51-7fb9-8c18-080a-770175f5c527@outlook.com>
References: <20220208150211.181994-1-saul.wold@windriver.com>
 <a1b3ffce-56d1-5602-c243-b1dbaba79e25@outlook.com>
 <78122d10-849e-0d9c-6fff-3d092c48f93c@windriver.com>
In-Reply-To: <78122d10-849e-0d9c-6fff-3d092c48f93c@windriver.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AM9PR09MB4642.eurprd09.prod.outlook.com
 (15.20.4951.019)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [4bE2Nk1vYD1Uaneo7SGgTXTmDbOZNoDNPBrW9qjPkrTHnJfZ8AvBOa1B/Lh/IFMb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 846dfc1d-4f01-45c2-ab1c-08d9eb1ed69c
x-ms-traffictypediagnostic: AM8PR09MB5291:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SM/CtGyVV1gbzBn5qbgIMMMMuqPtl3/1CImqihuZ3qcWqtR14zfuQuSUD9UFea5U9z2838Sk7ILNw/dDk1E1bLAK4chAZmCvGKX+OArkxc0JYlZBaymM1J4Q9KMk1ngMSSYi07xNGB5DDKhKfaHLXiMV7pVvE8yABTBoOQx41wDURdReEb4/Q0O6EwQokZ8H8vXPCkhvD2gGSZuzqT8+llWLb1skX4FxsSCa5WWMBOv+aZQJdG77yUMi1D9HVJGQxvUTipusrxBuQHMxkRaaTEI1It+D67Sjfk2724rYtMVNX8E6jYP1CtLg40foYqPM9DK7Qk3CL4OYla+gD4tyQHp/nGU5o6Jb2GcGM706D3AtFCFuffrKyXL67SfGidmbGkYPJhkzkwjc5cBMdwBoKVQrCWGcyJUvN3OJTW3u4pe939jAaS9bzbGxFz/TyZ4tbsWTyud4/kb/uUrdLmfQ8aDSFBRNIVlmjc+iOPiIPGy47I/ppBEZAl8BP32ECtBLAblCiF57w0FefF4jDXqfwA0HIllpkQ84b/dUrqoFsj8rI4Jqh+cve+LyVdu01ng2usDRs2W7XHqfaAVCXvjqQwK3OplTcymLw5MWwk3KTtgVAc2W1hChDVfSRemRkbK+Adk2ky+I95/fpkJze/7hXv73UhIkmmyMDE44WW0DwfA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?vAYIK/N7N+DLN9uTw3knJSZfjwDEmhrgfZGb210uUj9N8dk6ask6MiOp5i?=
 =?iso-8859-1?Q?edUSALdj7uxrcGPrFYfUejMdloB1pDaiOhKBX7eEhF2aFnULBsBh0WH2DD?=
 =?iso-8859-1?Q?NvB+GYV7XNyPmwH/7biGjnKolgCteqJZfdLGty8HRLykXffVVnaIXwJofw?=
 =?iso-8859-1?Q?dtINJklbkXxIxj6HVx+/H4NJGyv/9pETaUqon4OV6X0AhD4BPzfckretuQ?=
 =?iso-8859-1?Q?w+b9P35LRzcTVxJ+HbtqwiuzEO/+ikDAU8DEAX93n6HwgOFnoZ9l8MNntj?=
 =?iso-8859-1?Q?WjEVXRgnsQzmPR8ZNs6AGaMG/ZuT2lRXH0X8LlXHClzs8F9aCmFeIgYecN?=
 =?iso-8859-1?Q?czp1kKkjLzVJLNpPoySvc5SWIcx1hkwVCO/RuG2CEbdsssKrcWvMMxFDOq?=
 =?iso-8859-1?Q?XeV+qTuExpz1LJZ4t0/KZvWlyz/pb0bkTZ86HNP6XX2bdcjUnpbva+Vvxp?=
 =?iso-8859-1?Q?rLhl1eebQby8HbxicTrBvMawMXLGvZMDYEDtxfhb2RrVciNJT0am8nJATL?=
 =?iso-8859-1?Q?kFba+nrDn+iAtQrZ/Gv15ZocqL9ltX87AKlcbzQAe5mEU+GogNVoQW1smC?=
 =?iso-8859-1?Q?x/9gKwVdq+E/72zf8nhjzg/fb4Y+uc9fWm4GdbEN8Cj4ZV097NV0sGbv1o?=
 =?iso-8859-1?Q?U7IL+Zq8d+ZC/W3T+OEzvPwaexB2xiAFUFlwHCxlDCyAmeWOmWJIB0ysI5?=
 =?iso-8859-1?Q?/574W0ITSE5NkeyOFNhxppd5+axNOOz3U9tlNmJhVdudETbF+C26C5JEqx?=
 =?iso-8859-1?Q?Wt5u33zyg5RYy0UAqJtd+IR3cFwI5hJDOsNSahorNY0SZYFvP7UCdPwipQ?=
 =?iso-8859-1?Q?Od6t4LY/bGk0qgMneN/3ijfr25h3LcwrcXLd+UHu2CDKgWX7hZWuT7lo1d?=
 =?iso-8859-1?Q?p64Vu5qLF1iPHq0mDPLnbu/+YXq8MSleD7Ekil4NAPeBDCXP/s5Sa30nMs?=
 =?iso-8859-1?Q?kmCyAkVZaj30COI4iwpPTF7gfn5x7dX438BENPaqysa434McWlzgCrtfoZ?=
 =?iso-8859-1?Q?h3lDFBmylsp5/KWJn94XmuoZ0I4yHoXLb9hU97?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: 
 <FC74BD43FA92744F82364A10BF5AAD88@sct-15-20-4755-11-msonline-outlook-64da6.templateTenant>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 846dfc1d-4f01-45c2-ab1c-08d9eb1ed69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 16:19:53.1148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR09MB5291
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 16:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161522

=0A=
=0A=
On 08.02.22 16:50, Saul Wold wrote:=0A=
> =0A=
> =0A=
> On 2/8/22 07:37, Konrad Weihmann wrote:=0A=
>> On 08.02.22 16:02, Saul Wold wrote:=0A=
>>> This patch will read the begining of source files and try to find=0A=
>>> the SPDX-License-Identifier to populate the licenseInfoInFiles=0A=
>>> field for each source file. This does not populate licenseConcluded=0A=
>>> at this time, nor rolls it up to package level.=0A=
>>>=0A=
>>> We read as binary file since some source code seem to have some=0A=
>>> binary characters, the license is then converted to ascii strings.=0A=
>>>=0A=
>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>=0A=
>>> ---=0A=
>>> v2: Clean up commit message=0A=
>>> v3: Really fix up regex based on Peter's feedback!=0A=
>>>=0A=
>>> =A0=A0 meta/classes/create-spdx.bbclass | 22 ++++++++++++++++++++++=0A=
>>> =A0=A0 1 file changed, 22 insertions(+)=0A=
>>>=0A=
>>> diff --git a/meta/classes/create-spdx.bbclass =0A=
>>> b/meta/classes/create-spdx.bbclass=0A=
>>> index 8b4203fdb5..64aada8593 100644=0A=
>>> --- a/meta/classes/create-spdx.bbclass=0A=
>>> +++ b/meta/classes/create-spdx.bbclass=0A=
>>> @@ -37,6 +37,23 @@ SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier =0A=
>>> field for SPDX packages created f=0A=
>>> =A0=A0 do_image_complete[depends] =3D "virtual/kernel:do_create_spdx"=
=0A=
>>> +def extract_licenses(filename):=0A=
>>> +=A0=A0=A0 import re=0A=
>>> +=0A=
>>> +=A0=A0=A0 lic_regex =3D re.compile(b'^\W*SPDX-License-Identifier:\s*([=
 =0A=
>>> \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)=0A=
>>=0A=
>> Taking inspiration from reuse-tool=0A=
>> (https://github.com/fsfe/reuse-tool/blob/master/src/reuse/_comment.py)=
=0A=
>> and the way they parse comment blocks the results with the updated regex=
=0A=
>> look good.=0A=
>>=0A=
> I was not aware of this parser.=0A=
=0A=
It was advertised as **the** reference implementation of SPDX-Lic =0A=
scanning a while back - so I would consider it good to get "inspired"=0A=
=0A=
> =0A=
>> Test sample set:=0A=
>> (* SPDX-License-Identifier: Foo-Bar *)=0A=
>> (* SPDX-License-Identifier: Foo-Bar *)=0A=
>> /* SPDX-License-Identifier: Foo-Bar */=0A=
>> <!-- SPDX-License-Identifier: Foo-Bar -->=0A=
>> <#-- SPDX-License-Identifier: Foo-Bar -->=0A=
>> <%-- SPDX-License-Identifier: Foo-Bar --%>=0A=
>> {# SPDX-License-Identifier: Foo-Bar #}=0A=
>> {/* SPDX-License-Identifier: Foo-Bar */}=0A=
>> {{!-- SPDX-License-Identifier: Foo-Bar --}}=0A=
>> @Comment{ SPDX-License-Identifier: Foo-Bar } ---> Only this one is=0A=
>> missed (which is bibtex syntax) - no idea if that is of importance for=
=0A=
>> anyone.=0A=
> =0A=
>> Just wanted to highlight that this is not catching every possible =0A=
>> input line=0A=
>>=0A=
> Do we need to pull in the complexity of the reuse-tool comment parser? =
=0A=
> Let me know, might not make 3.5 if this is the case.=0A=
=0A=
For me it this seems to be a good best effort approach and as long as no =
=0A=
one claims that the output is technically a 100% correct, I'm good with it.=
=0A=
If one would want to improve it, I would say the usage of an external =0A=
tokenizer like pygments would be good - extracting all the comments from =
=0A=
a beginning of a file and then filtering by regex.=0A=
For now the implementation might miss out on a few edge cases (like the =0A=
syntax I highlighted or comment blocks longer than 15k chars) but that =0A=
is totally fine with me.=0A=
=0A=
> =0A=
> Sau!=0A=
> =0A=
>>=0A=
>>> +=0A=
>>> +=A0=A0=A0 try:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 with open(filename, 'rb') as f:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size =3D min(15000, os.stat(filename=
).st_size)=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 txt =3D f.read(size)=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 licenses =3D re.findall(lic_regex, t=
xt)=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if licenses:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ascii_licenses =3D [lic.=
decode('ascii') for lic in =0A=
>>> licenses]=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ascii_licenses=0A=
>>> +=A0=A0=A0 except Exception as e:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0 bb.warn(f"Exception reading {filename}: {e}")=0A=
>>> +=A0=A0=A0 return None=0A=
>>> +=0A=
>>> =A0=A0 def get_doc_namespace(d, doc):=0A=
>>> =A0=A0=A0=A0=A0=A0 import uuid=0A=
>>> =A0=A0=A0=A0=A0=A0 namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, =
=0A=
>>> d.getVar("SPDX_UUID_NAMESPACE"))=0A=
>>> @@ -232,6 +249,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, =
=0A=
>>> get_spdxid, get_types, *, archiv=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 checksumValue=3Dbb.utils.sha256_file(filepath),=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ))=
=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if "SOURCE" in spdx_file=
.fileTypes:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 extracted_li=
cs =3D extract_licenses(filepath)=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if extracted=
_lics:=0A=
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
spdx_file.licenseInfoInFiles =3D extracted_lics=0A=
>>> +=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 doc.files.append=
(spdx_file)=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 doc.add_relation=
ship(spdx_pkg, "CONTAINS", spdx_file)=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spdx_pkg.hasFile=
s.append(spdx_file.SPDXID)=0A=
>>>=0A=
>>>=0A=
>>>=0A=
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>>> Links: You receive all messages sent to this group.=0A=
>>> View/Reply Online (#161513): =0A=
>>> https://lists.openembedded.org/g/openembedded-core/message/161513=0A=
>>> Mute This Topic: https://lists.openembedded.org/mt/88997967/3647476=0A=
>>> Group Owner: openembedded-core+owner@lists.openembedded.org=0A=
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
=0A=
>>> [kweihmann@outlook.com]=0A=
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>>>=0A=
> =0A=

