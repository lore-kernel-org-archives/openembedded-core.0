Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D35E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:37:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.web11.126797.1734604650231416342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=WQWN9ig6;
 spf=pass (domain: cherry.de, ip: 52.101.69.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzgofLjiRcoQmat64M5Gml4BfwYk8SeTTlIDT0uyCM5pU7TXItSNWoC/G+qUaKAysYHepGnyHs3zrlah9wujyDO3O5fVQ9Gt4B42x+uC0tOzTii+hPChtuO8qkCsj2xOhzpr4vAID7DcM/vu8u+9pMP9J+4nSQtlQ3ZR7+D6KjieZUB9rgdpJgQJTFPQx5ADrtca1+KZjSzR1M8eNo7ARgnMoSLWau5j5Mszd9d0R+MBHXe28sW1sJYqErKHID5exrCYYQMJhduyhQiRVqR9iyEIzD1S4Q1N5XQouT2IHDyV5oY7DC6z5bwkxGMT62tilhU3iWTJ8sKu5sS9azVmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq1Ua3E18kBvFfkiPZSEBKmCCY9hciE4fbyppmL9R6k=;
 b=cAoe0uchdDYc8kwrmnUDlbnasYY9Ow+v+ZxSf2oqu0HqjNiYxAq/TktvrWCX5vnvJGyFYDCPE+Ksrn7otwX9V/AK8uu9JfCmi2UXO3KQHRK4pou0RvP9ia3tChsdLA/kf8Ix6BKVU07+SSuS9gdKDo5wqrqhhpNVoE/E4K4telAgkcsr7yk/mVDY35kDDyKLGPrM9CYHEabxBTN2Ow6JGaa+7ZWLAAlNOU2z2qQ6Yl48jTZaG6CMLThpMs1XH7uWE93hpBC0BoFcQF6uro1Smd1mFT4zS7duD74HvVuLD7SHmn2UAGvrHSDU7Uqy3HKUoOZggtBjcWbT4xPbzRnyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq1Ua3E18kBvFfkiPZSEBKmCCY9hciE4fbyppmL9R6k=;
 b=WQWN9ig6PSvz0Zct1+E3ryNQfJAKwQylrWBsfgj+y+OAwWxmEmZygQujZfTu4rG+lL3LwjxhSP2fo94e2lQF2Sta6QfbRJDMhrtqAcwt8Q9JZuXSafVIQTSWGJhgaLBjmxgGgXbI+3aztPB3AyjgyCDpSq1oL0KOj7cZRzHPkMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:37:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 10:37:25 +0000
Message-ID: <e1856b91-8aa9-4e01-a85c-5ba1ba05f18d@cherry.de>
Date: Thu, 19 Dec 2024 11:37:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: Derek Straka <derek@asterius.io>
CC: openembedded-core@lists.openembedded.org
References: <20241217231202.3384873-1-derek@asterius.io>
 <3edaa887-9925-4503-9126-22fcb0a6175a@cherry.de>
 <CADNbA1oNnU6mt_D9p+nzNwjEqsOVx4syTXEShuYgHFO4tg7O=Q@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CADNbA1oNnU6mt_D9p+nzNwjEqsOVx4syTXEShuYgHFO4tg7O=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0254.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e474783-98aa-4654-a5ab-08dd2019209f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HaySZ1btg4/jocNHyXD8ikf5sqBwB+eKI8Ijilc+Ln8qIxcDNKimWgWQweA7?=
 =?us-ascii?Q?x9S/kBAXpQSqvQOkwnzUhDEaF4FrcaqCr3HmbNSoELwPpYJhHivFo8By4Sj6?=
 =?us-ascii?Q?vGGvXXBIohvPFxi/0dmUwkAV54xo+GyQVqtPrFf2gXa2plFlL2iIZXv/YwmN?=
 =?us-ascii?Q?vWP9fPpFKV807NL6fQUg8sSEI/z+aUmBnZo26ryvCVu+fnzKCnn1yYRapcN8?=
 =?us-ascii?Q?x647KrVHtc2TPyhK9zCECS35pDo6TCYWWj8gjbTEQFLEQ8xVyx7vJG8VUbAA?=
 =?us-ascii?Q?aFXbBDhB9ZaKxxMnyf+LJrQzYc842gXTOSDDxQBEEhR+8M1JBTWkKAxu8bMM?=
 =?us-ascii?Q?WShLSnC5+ycku9WaTSUxnCu1XBaRcuVxDHHbNTtHXLABvv+3QVuNMfx2vuT6?=
 =?us-ascii?Q?uZbd9qQ87B5LAzvYT66uGC8jDU5huQiPFAC31lam9l7Ri/CukG2sEF2N8oa5?=
 =?us-ascii?Q?GcwqfBjHVWoX44b64bceKfYRHcg1xN73Oy0VxIEvrfStnyWEPUEqDAlrxREv?=
 =?us-ascii?Q?DmPtf0HvKJzhK8SvzBEHrJAu/3M/0dCygCa4JnL9YGD13jHp8CvUyn71jbEa?=
 =?us-ascii?Q?qFWFeIPzhyrqRcjlmK0DsMEn1josuLWq3WaurnXK6N1VkBmFf3YYOwYeeqd8?=
 =?us-ascii?Q?UdyVyZuhRYHOIV4cPobwnbHoCqUfakblU8LEvBH/h4vReR1ir2Ef1ET37V49?=
 =?us-ascii?Q?sSkn1rVLVcrpRtjTuebloCjFsu8VzwsJ6SEQMnaOCuI6lBKKV2dM9TPABBMC?=
 =?us-ascii?Q?laKMwcvTUv71L3KlsP2UE5VSg8lQeqU1EM+wFA9LdxAL+3dZt2bTBsje+6G0?=
 =?us-ascii?Q?+5QVR5Ox94Kt/wxelryI2zmb+DqbVo5RsH3H9Wf5OkRQWvz95vzidtoONn3w?=
 =?us-ascii?Q?qykylNmiD9Z22iv8yHIPofUENFjPb4qr7yVN2uIt2lvdHRuB/nRTpTC6UA+A?=
 =?us-ascii?Q?XFMk1HSOcz63XjD3Eewq4AfAd9jttbwEZykyeqhER+26F/s5iU+CVst4Yn6T?=
 =?us-ascii?Q?aXsxK/cHzGbMJOXBW8omvn9wxDwq/DxKBmFFPHgCFqiQCcImM/KXVCr/VM2B?=
 =?us-ascii?Q?45vGoS0ZO/sBFRtcOhUtIKRd3xXPbsjzihVrI9mYjVHEbXVj5uGUdCXi2vlw?=
 =?us-ascii?Q?5qyBB+8swxA5VzkpU374R6MWCGZoTbQ9duNFOhJnAWt4HIJQR0GNpuhD2Tz0?=
 =?us-ascii?Q?wMCkQM5fyQ2OElAPVoBbPhnIoGDolST4lYZBmE5C+jVckx8+1+SowNATWZsG?=
 =?us-ascii?Q?5BDVSXu+H2TXSbE6Q/8wiuUPPMmvByJWJAZf4dDEyGCok/GaAikowGIfH0dA?=
 =?us-ascii?Q?uWILx044kxwE9UimsFd6K1VLIFOXsWCeRhoJdy/hl34sX31IIbWVX1nTXGjV?=
 =?us-ascii?Q?SgpfYdGmF3s+qAuamFTtVe+ZzTSa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?83Dcvmk86p/5fQJLgnIlgBo/VS3ywcOQj2ITajFHdiIgek/Z1zZQ9/mWfHC6?=
 =?us-ascii?Q?kM2K6xuYf/CrqLrYRUDE4+jMYUIkU103lSGWNLTukoC+ocquW0Hud04yzNK7?=
 =?us-ascii?Q?XEoZ34cZmnCx7/ZAW6SeGWZdQZn3YBZg7BHXARa6R3fgNpts3WpdV9eaCenn?=
 =?us-ascii?Q?jwLMfaQtojfKG76jyMWeKVFJN0Fdb4cOirh/olCYc10GjDn/mhoL1UJqN/aP?=
 =?us-ascii?Q?/LwTUd5Mrz7fgPAFX3TOO9g66fweyDU+dqbxZVHmvQSN51t3nKE6g5XRny6d?=
 =?us-ascii?Q?dCbCd0hGENe2zObtFl05NZQV68nx7psmPK7RAcu3l7i999/zSAc6Z0OdWWb7?=
 =?us-ascii?Q?PCM1cKZ7hW4G6X2U4a9RL0rkLTW8lZvK5TuDWSyaF6rLRMR0vCqCmMRSKGbC?=
 =?us-ascii?Q?3nVat2/UBHVWoOaVs4+emaC3BgVU08RnIVc8zyvfA4VNEqm4DAyTV98RZQ7H?=
 =?us-ascii?Q?SQf2uRZYB/GJv5OXM3COH6wHPn/ALr8i3gdcJH2enUlfUhT4y/f7E4oaIhmC?=
 =?us-ascii?Q?3pOCDqOZ6pI06Wpp9QN71dYXntO9ey9M4EeWy9CzExTV0gfv+1tt+uaP+7Sw?=
 =?us-ascii?Q?S4yVVGIzZBXVL6W9HSYBLtJwnFpUNUocKgptgACVQqGisi5jQ7Fh7GmUiytK?=
 =?us-ascii?Q?ofEA1dUsOVhbNe20vfxtS2M5SccSRMmWixQT9KC+KEX4Y7AMm6xQ6hdV/mGP?=
 =?us-ascii?Q?06NdcrZfekpHuwl6/DRQgdVYiZ9sBSpT0enNAqYVc3yiRCWAKYu0pGKlJmjW?=
 =?us-ascii?Q?DnF480io+72ro4CzHOEBk8ov4X6aNUywa/MH7lCwnceH3KTA6vDNGQZoiDXf?=
 =?us-ascii?Q?gx90llrNL6LLYyNc5znfZo8Jv5BzObOWLiLI0hBkzL4xwX1Qv/KXGcAEjiPG?=
 =?us-ascii?Q?cPwbgEYh9NlGXHzuuUXsH3Fs0itCiV6nSrraXfGKCTiWeycg56acbSYaF/J8?=
 =?us-ascii?Q?Wk230Znprl9LYy4r3fKUojtIiwODSF55UsGF0Vr9OQi6X+lfRSvBKIfeuGug?=
 =?us-ascii?Q?gEgcls2jmT1UIIlJ6YBUKvEjY0hQQUSPlwmGfCB9FcldfUaJcXq9wov8q4WX?=
 =?us-ascii?Q?WLyC64yaVP/wvLys+y2FuuDNLNRp691a+4EejDZd+5CsWzqSv5z9kyOZM70L?=
 =?us-ascii?Q?+hzmNDwDcxwKlyyawvxevmJFDu5mSZZ9Qucg8mpSRC9B2Vngkkrb6uzr1fuM?=
 =?us-ascii?Q?I3FFbsLq5yJPpnLCtgWc965QR7SozRqQCQKRo+bvqq2ulGHCllR4zH7SMEWX?=
 =?us-ascii?Q?9L1O5DWx2UjICePEQdSg0tJOsoRI/hMz/SiQsyLbO3pu0+fZQld1820AALSK?=
 =?us-ascii?Q?KvW9yJ9EhCMsiM+s5j8CA/vV/qMe3qF3Lo5vZnpm9mQSQ+DBhJwfu2Qtrj3l?=
 =?us-ascii?Q?MMq8pGauNaaMkM/XujsrmefQyAzaMKT9Gbr2HdiWnwGGhB6mpsC3Tn2pT3yf?=
 =?us-ascii?Q?KTEFUgxZS4vGT0xVCgAQoZBfWhNIFb27s0LCpldTZrLLZzj3XEZXSYeAEXmx?=
 =?us-ascii?Q?KhLR0GPig64wgEf/E2X7xzEI7KLt+1RC9kTIvSp7/N2usLt6vCg7cxNZB3C+?=
 =?us-ascii?Q?V/vgEpS84EIZsgbkJV/09AXd91VRvxbwoLWI5KoRJb7MHwwxUyZPMqEva3d3?=
 =?us-ascii?Q?HBHxbQ5ly2PWh+VYR86qYW4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e474783-98aa-4654-a5ab-08dd2019209f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:37:25.2195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnPRLlxnkn0DVlpP8r7guReGBhePP4aKxxUF39g1APza1nxLEfA86/MwNP7kmHDhZOaSj5MHecGzCen58wM+REpWSIIxmU01uIAKsR8ToW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 10:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208903

Hi Derek,

On 12/18/24 7:04 PM, Derek Straka wrote:
> V3 to be sent shortly based on inputs from you and Alex.
>=20
> On Wed, Dec 18, 2024 at 7:32=E2=80=AFAM Quentin Schulz <quentin.schulz@ch=
erry.de>
> wrote:
>=20
>> Hi Derek,
>>
> Hi Quentin,
>=20
> Thanks for your note.
>=20
>>
>> On 12/18/24 12:12 AM, Derek Straka via lists.openembedded.org wrote:
>>> A large number of python packages leverage the pytest unit test
>>> framework for their ptest functionality.  Currently, many of the tests
>>> have duplicate code for:
>>>       1. Installing pytest files
>>>       2. Declaring ptest dependencies
>>>       3. Script for executing tests (run-ptes)
>>>
>>> To simplify adding common pytest based ptests, added a new class
>>> enabling base functionality.  Users can also override the location of
>>> the pytest files in addition to using their own version of run-ptest
>>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>    .../ptest-python-pytest.bbclass               | 42 +++++++++++++++++=
++
>>>    meta/files/ptest-python-pytest/run-ptest      |  3 ++
>>>    2 files changed, 45 insertions(+)
>>>    create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
>>>    create mode 100755 meta/files/ptest-python-pytest/run-ptest
>>>
>>> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass
>> b/meta/classes-recipe/ptest-python-pytest.bbclass
>>> new file mode 100644
>>> index 0000000000..89ff10c335
>>> --- /dev/null
>>> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
>>> @@ -0,0 +1,42 @@
>>> +#
>>> +# Copyright OpenEmbedded Contributors
>>> +#
>>> +# SPDX-License-Identifier: MIT
>>> +#
>>> +
>>> +inherit ptest
>>> +
>>> +FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
>>
>> I think it'd make sense to use :append here as we don't want to override
>> anything, just provide a fallback in case the
>> ptest-python-pytest/run-ptest isn't find anywhere else. This would also
>> allow to easily override this file by just adding the file next to the
>> recipe, instead of having to add a FILESEXTRAPATHS:prepend :=3D
>> "${THISDIR}/${PN}:" in the recipe after the inherit for example.
>>
> I was able to override in oe-core without adding any prepends in the
> recipes.  My understanding is the EXTRA paths are searched as a last
> resort, so recipes having their own run-ptest get theirs included first.
> Overall, the class was adapted from ptest-perl and ptest-cargo.
>

FILESEXTRAPATHS:prepend is what we use in bbappends to search in the=20
directory next to the bbappend **first** and then from the original=20
recipe second.

It's a bit convoluted, but FILESPATH stores a list of paths that is=20
constructed from FILESEXTRAPATHS + <original-recipe-dir>/${BP} +=20
<original-recipe-dir>/${BPN} + <original-recipe-dir>/files (c.f.=20
meta/classes-global/base.bbclass line 59, which calls base_set_filespath=20
from meta/classes-global/utils.bbclass). FILESPATH is then read from=20
left to right and the first path to have the listed file "wins".

Can you please provide the code you used to validate overriding=20
run-ptest from the recipe? If that is the case, then I would like to=20
understand how that happens and we possibly have hit a corner case we=20
should fix (or at least be aware of).

>>> +
>>> +SRC_URI +=3D "file://ptest-python-pytest/run-ptest"
>>> +
>>
>> We use append/prepend everywhere but here, should we?
>>
>> The code was borrowed from ptest-perl.bbclass.  I'll update the python
> class as suggested.
>=20
>>> +# Overridable configuration for the directory within the source tree
>>> +# containing the pytest files
>>> +PTEST_PYTEST_DIR ?=3D "/tests"
>>> +
>>> +do_install_ptest_python_pytest() {
>>> +     if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
>>> +             install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptes=
t
>> ${D}${PTEST_PATH}
>>> +     fi
>>
>> This means if we ever built the recipe and don't clean its WORKDIR, but
>> update the file, it will never be updated. I don't think that's what we
>> want. Can you explain what you're trying to prevent here by having a
>> check for NOT installing the file?
>>
>>> +    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
>>
>> Shouldn't we use UNPACKDIR for file:// SRC_URI in master?
>>
> To my knowledge, the pypi recipes aren't putting the sources into UNPACKD=
IR
> for better or worse.  I looked at several packages, and they're using `S =
=3D
> "${WORKDIR}/${PYPI_PACKAGE}-${PV}"` (See pypi.bbclass)
>=20

I'm not familiar with UNPACKDIR and its use as I'm still on Scarthgap.

Cheers,
Quentin

