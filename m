Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6000C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 15:30:19 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.54])
 by mx.groups.io with SMTP id smtpd.web12.27405.1639495815236817780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 07:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=cn71/klk;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.54,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaFYFnAfWJ4tRAWotBmze71ElrIEvn9OkW2P9ZiA4PeLbymCLPkozeXUpSYl8cO/oTNOJ3vhe/Ofzzb4u4INOoKAjP9OhgT24A1XdgkF4mtu6Iz7sOET5x4GgO5zxzyOYT3YD33+rNBqXNclBhEbY4r4s4VGM0x86j39VxtR5GLaI7g5oVJlYmtIODVgleVGxPZ8UL4T45bJWP8ghC1m3dnkOQMBfOpU3++pTeV5FWAXEcYmWl3lXCsObcB945RecOWAp0dgdpCaPv1v/Kian3KQySFE46isa3YzLJGG3naAv8hCReFDKISY0qzQxS8mO99usWqP74UxGpwgU9istw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=347VgE3FUCuP+cU7qRU4TsTh39wgTe0PAiOEkBDRg5g=;
 b=dv7ZT6LxE1zW4h2O3HCr0iMran/cV93Kp9I7g9wwt3qxfOtUzplwzzbjMBknpuqYOhQhOf/6zwmhAlIEqajFbBdp+Z83Ngrw2JJeNkZGHbG0prb1GNMkvQcAqeIwzTQDOaDQ6mslQJgNl0yRwtEdusgvRGcBie6mNf0e+rNpd+sBj2iw1rUN45xtALFTXcrxN1jci0pXcFhCaEEVwbqJcRbVocigjwRl+BmgXTLmj1jQRHbw8ASPmGzKIU7zTkWz47sLS8Fi1jf3dZcxdTXLHFEd3OUwoRRITHuDp6etbd7e2n18oynyT1tMdumgopm7jexobYi40KcpfLB7bQtvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=347VgE3FUCuP+cU7qRU4TsTh39wgTe0PAiOEkBDRg5g=;
 b=cn71/klkWBllNryfzIf/qsvMFIw6JUL84bH+HY0Fk+NZqMSy/BUaPJaaHm1KGKRnukkWCECDi02smyElnXI/Ar5fn7h0TvgE0OlCpfh2jYhOnW6qUUagA4Up61YCrw6slrsXi9eIClskU7RXNm3+cBOkvaDXbYa6cbsExb4EwqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 15:30:11 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.032; Tue, 14 Dec 2021
 15:30:11 +0000
Message-ID: <82b3a24f-c148-f2ab-29fe-a861af8dc736@weidmueller.com>
Date: Tue, 14 Dec 2021 16:30:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [RFC PATCH v2 3/3] selftest: recipetool: Add test for
 handle_license_vars function
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20211213150546.22196-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211213150546.22196-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <81f66ff3524b0c4e82b3ed2974dbb7e5664817b5.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <81f66ff3524b0c4e82b3ed2974dbb7e5664817b5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0092.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::33) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.94.40) by
 AM6PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 14 Dec 2021 15:30:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91f3e28b-3bdc-408a-6c0d-08d9bf169dfa
X-MS-TrafficTypeDiagnostic: PR3PR08MB5563:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5563A1A3CFD65230DD905604D7759@PR3PR08MB5563.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uk8A7fup5fcZUJ/2mR6lliXgyxsD/8Ls2iFQpVtir3HOvAZFcRPrgRBv27Ks3mkRvHyGB1jsN6/tsrEOaOjJz8Z8Q1L74U5fT0cgdbYH+eTD2FZIQQ8q+XFov+swKN08SqLZeLqbiWHyKsuLM3L5vmcdwQ5gx+fJ1fHZCPoR4hdpEar7jtri3JVGvyL7FzTz9C2AKYmdjlPORukcSBcGD+ZQE74vKt/5LytbQ+PHX/AGM6x5cUi1dfUBT/7AGaQIimiXT3qF1OKvXgN9UAHbZ35P5YsR9kO8/sx4gD/SbJbkIqUR4iNKLpyRURMdUOwgZXXsYqFr6kYYJ1G3g5YzcrigdvU62ydAIUSrHPaumJhP4+fQKWnN/InP3UEC5X4zYhGChsrqrIWBu5tMs47PHpeUY2OuiMWJDAwhtsecLKGNgDTj+RMwgnxGUJuMDcskHpKDJQT9Sm+2j+XNXG5K0nrP7ga+12EvqMFxagxax4D3BKfOh60KR/7JgCuCyG50bDRLHvH+1PyrVHucK++9pVGmfXeLRVWboGcw/eh4ufJJ98tD7SgG+3yg/GfMZ2qroBO5qConY6H9JVfn4f6AUK7iBCEu5UT/kBLs4wlhFyB1chTrvZaPxYLRT+qI7/ya5/fVc8WncIim1swxWLQv3P3+VtDtA9nrF4jnV7jEcuU8JVh26J9vcaAIoJoAkDCjT+pGC7TsM5QRVRidLdSLNvweEiC/gMXZybT8TVg3mfVJjiOi/X8RT+NOZOE2hwBWaX5agSZTQnIxGHmSNd9+phraXyM9CmKnag8hnyWGdH5z7QaH9wgClJqwAW4l4yTFWhFI5Qq33/sUxYT/Ue47/U3yH5eBNQ5xSu4iv0thsv4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(956004)(31686004)(2906002)(31696002)(38350700002)(66946007)(38100700002)(36756003)(2616005)(186003)(26005)(4001150100001)(107886003)(16576012)(316002)(52116002)(8936002)(5660300002)(8676002)(83380400001)(508600001)(86362001)(6486002)(4326008)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXpZbFJvOGdQMWtjTHdEUHVyVVZ5UU45RFlFa1Q0VXFCSUt1NWlockxBRTVa?=
 =?utf-8?B?bGcwc2RkK1ltUDFQbENVTHlGV2dtckxRS0hEMEJuSVMzSTVLNXZEbmxZRi92?=
 =?utf-8?B?eExybktBb00zdXdrcDQwZEQvblA4ZGhJb3JSVndIZlFBc2xFclhsNGwzb0F3?=
 =?utf-8?B?TmR5MXFDbnhXRWQ1SmlDQWkwdmhMZ09Fc0JVZW5sYllnSE5CWUw3Vjdsd0FF?=
 =?utf-8?B?VDFjVGNZckF6MU9rak85M0RkRHlPUTZ6WnU1OXhOcFhOTXRGUUdiZEJUWVVv?=
 =?utf-8?B?aXI1STFiTldMOXpYcE9ua3Z0WUZyaUdEelBsN1c5UFJ0UzBteFA5Y1BxdXN1?=
 =?utf-8?B?dit6V0ZGUlJ6V1F0a2IrUldXaGJZNjUxTHIxaDQ2MGx3MThML1VEaGZEamJJ?=
 =?utf-8?B?UjN1Z2JsbDdaTUlyZHdTd0NDdXNVcEd5UzRINFJqSkROUEYwTy9ycDBwdnN6?=
 =?utf-8?B?Z3pSUWhhTGpFQzNhNHRsdEFtdjFGZ0h4VGRlNzVuakpoZUszOEpkamZMK1lr?=
 =?utf-8?B?THlSdVNabUxUc3VkQkg1MnhHTG9QcUkySGUxdEZpNGZmLzhhSFhPS0JvclNj?=
 =?utf-8?B?YTRnRDU2S09JSVhQeU5pd0hVc2hYQ3FvVmRHZHNKYnBzZDBoc1NkNmMyLzF6?=
 =?utf-8?B?Rm10YzhYeVBQNEYyazUwL1lMN1dESzZHeWNjMUZnRkFGWmtuVlJIMFZodCt6?=
 =?utf-8?B?TFE4YUpHbVZHbGtyc2RsSW1lclVQdjJoQTk3N0Z1U05yM3BJN0R6bUhOUDJN?=
 =?utf-8?B?WW9sTk9ZWUYyOUJOM3ErekUzRi9xcUU3MnR6TkFWd2RzZW8zMFJEV3VtRkxw?=
 =?utf-8?B?NUxHR1krcGpGYUVPU3VGOXNkWHRROUUzNW0vU1hqVDN1N2xSNWU4ZGFDUkNz?=
 =?utf-8?B?Zm1DeURPRy95ZEQ4akptWnIvK0xGNUczWkdMY1Ftck9SQVNrbGN1QmQwbTJt?=
 =?utf-8?B?R2FwWExNbHJiaGFxMllSbmVneHRUTFhxVHpDWVRVV3hyVjdrb29xR0pRQTdK?=
 =?utf-8?B?NWRKVlVvRUFmQktOMFArcHQyT3RsS0l4TkxRQXBCbGlHeUd5L2hnL3VJSzgx?=
 =?utf-8?B?MjNLM05JTDFGaytFNG1tV2Y1Zjl2WnlHMUVkSXpQZHpYdDZzZHJzb3M5dFdz?=
 =?utf-8?B?NkRBWnFZaWRqU3RZMm5sRFBGcTFmY3RrSmdoT0hPcWo2WDRmSnZtN3BpWDF6?=
 =?utf-8?B?UmhOTUk2MmE3blBpUG15NDhCZlE5YnRvWkxrYnRwQUxncTJRZEVZeXZoRURs?=
 =?utf-8?B?Y2NMK0ZZTDBxMXlwbC92UEd3UlE5a1RQZU5lVFM1OWNoaTVLdUlyWnRJMHE1?=
 =?utf-8?B?c1ZxSXNsc205TEI0dUFxcmVPUEozTlBka3BYMkVwNm0xSkRSLytxRzhlNEx0?=
 =?utf-8?B?bDg1aG5McmhibGMzeUJ2aFROcmFUQTRKOGUxY0VQMld2UTA0WWh4OXhZYTNi?=
 =?utf-8?B?SlczUlJCZzBReTkyeTlDVnJtWE5pZFJPejBnbXVoalczd1NQZXFxekZjVWlm?=
 =?utf-8?B?WXgxaTlVNkRtTGRLV2syd0twNjRPQWdHUUtRMWNadE1Yc2tOaEVrOGtXN25M?=
 =?utf-8?B?RXgyU1RBajU1QkpGMk9PNGRFWnUvMTJwa2ZJMWtFNWNOdmhxby8rbnBaS0pq?=
 =?utf-8?B?eEpUYm42VGw2U1hvSlUvUDBQZmhpMHB0elhvbFNrM1hheUo5VmpMcFdkdVZV?=
 =?utf-8?B?cEZCM2ZMbjlKMnE5ajVuc3dKTUFvdExlNjlXeDc4SWhwNnhxL0FSR29LQW1Y?=
 =?utf-8?B?VTVENkJpUllubDJjTWEwMXlWOGw4QVhhU29ma1EwSHBNVWRRUmtPL05teE9h?=
 =?utf-8?B?cGhSamk2MG1ySFd2QmtsRFFraUZGYU5JaFY0cXRheFFTTDRuYmlqV3hjTkhv?=
 =?utf-8?B?Q2FkdmRVTUpjeWFSRWU4WldOTWtUeTRtLzRnc3BRZlR0d2JIWGRyRlVVNlBD?=
 =?utf-8?B?WWkxamp5cGh6RGIzVTl1c3NTTXgyWVNGdXJlTEpudGJ2RDRqQVZoTElsRStY?=
 =?utf-8?B?SnBmQzZCMkhVVlRZc3R4ZThmZzZZZk9wbWNhVXFZbko5b3AvZjMzQmpHUk02?=
 =?utf-8?B?a05UbWJSQjBId21WZkFtNmpLZmM4b3JYLzJKNXFoTUxQNWRxd09zSkFJeHRa?=
 =?utf-8?B?QndSUURLUWM0VzF0ZzhBZ3FkT3RrVFZaaDdHZzlFd2FsQzhUSWFrelVweE02?=
 =?utf-8?Q?h1K5O9NB4Twfm1kJYY1v8cc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91f3e28b-3bdc-408a-6c0d-08d9bf169dfa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:30:11.2038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P72cWVe7lMsZUN19UMuIUuwW9eLTPuYPC6RY8MDOC6Nquev9DWjD1IKDWGd9exNjbJyS2RBsTeehkwszuW4F+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 15:30:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159692

Hi Richard,

Am 14.12.2021 um 14:01 schrieb Richard Purdie:
> On Mon, 2021-12-13 at 16:05 +0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>> (no changes since v1)
>>
>>   meta/lib/oeqa/selftest/cases/recipetool.py | 62 ++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
>> index 1c73b2c5e0..5330d73cbf 100644
>> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
>> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
>> @@ -592,6 +592,68 @@ class RecipetoolTests(RecipetoolBase):
>>               with open(srcfile, 'w') as fh:
>>                   fh.writelines(plugincontent)
>>   
>> +    def test_recipetool_handle_license_vars(self):
>> +        from create import handle_license_vars
>> +        from unittest.mock import Mock
>> +
>> +        commonlicdir = get_bb_var('COMMON_LICENSE_DIR')
>> +
>> +        d = bb.tinfoil.TinfoilDataStoreConnector
>> +        d.getVar = Mock(return_value=commonlicdir)
>> +
>> +        srctree = tempfile.mkdtemp(prefix='recipetoolqa')
>> +        self.track_for_cleanup(srctree)
>> +
>> +        # Multiple licenses
>> +        licenses = ['MIT', 'ISC', 'BSD-3-Clause', 'Apache-2.0']
>> +        for licence in licenses:
>> +            shutil.copy(os.path.join(commonlicdir, licence), os.path.join(srctree, 'LICENSE.' + licence))
>> +        # Duplicate license
>> +        shutil.copy(os.path.join(commonlicdir, 'MIT'), os.path.join(srctree, 'LICENSE'))
>> +
>> +        extravalues = {
>> +            # Duplicate and missing licenses
>> +            'LICENSE': 'Zlib & BSD-2-Clause & Zlib',
>> +            'LIC_FILES_CHKSUM': [
>> +                'file://README.md;md5=0123456789abcdef0123456789abcd'
>> +            ]
>> +        }
>> +        lines_before = []
>> +        handled = []
>> +        licvalues = handle_license_vars(srctree, lines_before, handled, extravalues, d)
>> +        expected_lines_before = [
>> +            '# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is',
>> +            '# your responsibility to verify that the values are complete and correct.',
>> +            '# NOTE: Original package / source metadata indicates license is: BSD-2-Clause & Zlib',
>> +            '#',
>> +            '# NOTE: multiple licenses have been detected; they have been separated with &',
>> +            '# in the LICENSE value for now since it is a reasonable assumption that all',
>> +            '# of the licenses apply. If instead there is a choice between the multiple',
>> +            '# licenses then you should change the value to separate the licenses with |',
>> +            '# instead of &. If there is any doubt, check the accompanying documentation',
>> +            '# to determine which situation is applicable.',
>> +            'LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & ISC & MIT & Zlib"',
>> +            'LIC_FILES_CHKSUM = "file://LICENSE;md5=0835ade698e0bcf8506ecda2f7b4f302 \\\n'
>> +            '                    file://LICENSE.MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \\\n'
>> +            '                    file://LICENSE.ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d \\\n'
>> +            '                    file://LICENSE.Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \\\n'
>> +            '                    file://LICENSE.BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \\\n'
>> +            '                    file://README.md;md5=0123456789abcdef0123456789abcd"',
>> +            ''
>> +        ]
>> +        self.assertEqual(lines_before, expected_lines_before)
>> +        expected_licvalues = [
>> +            ('MIT', 'LICENSE', '0835ade698e0bcf8506ecda2f7b4f302'),
>> +            ('MIT', 'LICENSE.MIT', '0835ade698e0bcf8506ecda2f7b4f302'),
>> +            ('ISC', 'LICENSE.ISC', 'f3b90e78ea0cffb20bf5cca7947a896d'),
>> +            ('Apache-2.0', 'LICENSE.Apache-2.0', '89aea4e17d99a7cacdbeed46a0096b10'),
>> +            ('BSD-3-Clause', 'LICENSE.BSD-3-Clause', '550794465ba0ec5312d6919e203a55f9')
>> +        ]
>> +        self.assertEqual(handled, [('license', expected_licvalues)])
>> +        self.assertEqual(extravalues, {})
>> +        self.assertEqual(licvalues, expected_licvalues)
>> +
>> +
>>       def test_recipetool_split_pkg_licenses(self):
>>           from create import split_pkg_licenses
>>           licvalues = [
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159642): https://lists.openembedded.org/g/openembedded-core/message/159642
>> Mute This Topic: https://lists.openembedded.org/mt/87699203/1686473
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [richard.purdie@linuxfoundation.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> The test failed in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2956/steps/14/logs/stdio

I didn't know that os.walk() is not deterministic.

I will fix it.

Regards
   Stefan

