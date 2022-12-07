Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2788DC4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 15:28:52 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.88])
 by mx.groups.io with SMTP id smtpd.web11.18245.1670426928800795673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 07:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=EnZkK/a7;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.88, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtlW3+IZb0NJP1sV730WIWVc22RBh0Ux+nDmAwZd3soAolqUnQnKe3pQbs7cZ1WPjk1slWnqB6iVJJe1N8/ItSmkb6X/vvvbpWkpqHZmjofkuquAj6EJXKXSfLXty63dDQrhaxfMxByDSgEz1j5Ux+u4rxkqgl3veLEwDtq9AWVdhuVUh7vy5iyAtM/1LMnsHD9K4a2Sgs3mXRAsHOARHpbIq4G+iASt0sIi1r+Ai6I6pnlyaQwH+oogvYkwseMuembKl1vdmx+XsPBU8YHKnaW2X8Yv+NWRrx6nsVoPy6XRtpuGJ5hHaUFQCVFe3/Js6cl2vJK0J3vQtCCcG4d2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm8OFUlU4x7TJU/F7RzDGPn3pbtDcxyyOy2XXXx3TBI=;
 b=HS9BANgi93CGzJXlnSehT9uOxq3v9DUxEwkt/jFbOKuvNijeHEXR35TKf6GM8IQ6bMpREuILWz2rnu3wmh4Uo5yQmBF+ZTTW9o+b7Kp5H0tCYE6B4VU/vODcyh/MizmrBuhsW0o0yUFdTBDUZvLIdfSfID+XWOvAOdO8hrFlAcpAWzCprhsP7WRN9PBNk9Y/38fXrlxXBx0qqN0FluKjl3QaeMBPZwaWlOHtfpcFFG7JHBiCv4ddGkiCwlyJjsiA7qHfcvJTaUzHMe6AauW1+aF58HI+rSua40WQ/75s/NbYDjZWRlsMhfrJIP5L9yOTmJ0Ac1uV4875Yd07Og+hdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm8OFUlU4x7TJU/F7RzDGPn3pbtDcxyyOy2XXXx3TBI=;
 b=EnZkK/a7z5uStxWxNdkPxRq5Z3zqetj3LuuZtQvpzoaYFPeFYcI12BGg7Mdnvzvv7JnJGT0iqUG7b8KgqtJCH4DPLLAEoj5ci6rP+YjxCF+4AhoDwCxZU9tvL2KgWGzsRIgA+SbsnGQUvYb+DF0+i7FfzTnunI1UXE2LINnCzPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6301.eurprd08.prod.outlook.com (2603:10a6:102:e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 15:28:43 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::9167:8ae0:289:7af%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 15:28:43 +0000
Message-ID: <96c54599-b4b0-5235-28fd-41c71272c213@weidmueller.com>
Date: Wed, 7 Dec 2022 16:28:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH 01/13] cargo-update-recipe-crates.bbclass: add a
 class to generate SRC_URI crate lists from Cargo.lock
To: alex.kanavin@gmail.com, Sergey Bostandzhyan <jin@mediatomb.cc>
CC: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Alexander Kanavin <alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
 <167d8dfa-fe50-24ff-d2d2-249df3445ae8@windriver.com>
 <20221207002040.GB1080@xn--80adja5bqm.su>
 <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CANNYZj9_46SdQdVuwFQ-HosVB7X2QpG0PDYNybV+ZL2Xt1FS3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6969:EE_|PA4PR08MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 123041e7-2681-4851-6375-08dad867b91d
X-LD-Processed: e4289438-1c5f-4c95-a51a-ee553b8b18ec,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJ4uK2GZ945QxYMZCjNY1Ydz7scz227BMx4WHw3KoUPzC4s1TzY99A86uSopZjzAZ0GyaBc3V5EGrMrbA+yF0xSvcE/UJWJCWKxqdc57ufJCsLuXcOHtw/TMkNkm87YlLqabBPKDbcjxjJjzkPn/Md7n4fGzePAX1I7StO+X79oTJDko9KtAO3rX6dSPpSlCUjeAAVktCbp1FBG1SZ7F6wTGwJ+UZCxXfOa7a7I1s9B9KcStwgrk2o7X+BkGFyA6E2RsP062g8kt1++1Nki7LWMHEZUhA3Vf8Pog7OKthAeEoK5fW2Ov0JE6/gDk9TxO8R9WDS0Gunem0GTrdeSR7L6PyS7w3tKLLgIOMidhlR4h8lgG12bOG7udAvTl1UzHXS6JLmjnN0XudGuQc8WxdVwvPtZOPwTiXc7sJPfYY6jCDy/4fTa2OlEROLY8Y4U2Hkn2zV6qa0wXFK3s5G/xPYuJlPDFkvgO9piHUPyTybfdH1QtsVU8iwxpcEbflFN415xYaC3iQd+QF5uCbxmLsBj5JVF/23tPr6DodF6x8y2puou+w7lY/oq9FV0qPEkufLHBqck98VIRNSyJeXbny4aXvH1VEiVFsUTIe+j96WSVFOHM/JvTglYwg3tIkpuqbIDG0itpeBh6xvneRIRS0m7NyvTizr88saCjNIC5XmPkQ1v2WWTmB2ANAat5fFWpH2S6wOWj5e4WT5w0dZn+fVf6QQiY8JnPzgwQhtPAlh2TUrjtV0f40V4nfZJc1dwKPvKeXdvegE49nRixhw/pzc2TQC6xw9XfKopINy1nmRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(31686004)(316002)(6916009)(54906003)(478600001)(966005)(36756003)(2906002)(4744005)(31696002)(66556008)(8676002)(66476007)(26005)(6512007)(6506007)(6666004)(6486002)(4326008)(86362001)(38100700002)(186003)(2616005)(41300700001)(66946007)(38350700002)(5660300002)(52116002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hWSXU1c3g0aG41dWEvS0xLZ0dPRG1nVWR5c3RMdm9uck1ld3pZcFp5MHFC?=
 =?utf-8?B?SVo5NE9PVWtVV01XdVNUNVBmQ08xUFB1L2Y2TitibnBtUVBnKzYvQUMwOTNy?=
 =?utf-8?B?T0h4czJFM2l1bGM0TWIrdkhWZnFUMmlKRVEyUUhXdW9jeXhYOWt2VXBuSVpl?=
 =?utf-8?B?SHFGSXd4ZytQSnpxaHNRM0s0Z1R6dVgrUVkzS2tuM3VLVUlkQUlBSHFOZ3Jq?=
 =?utf-8?B?SDZPQURZYVpRYm42REszTTUwU0ZwVFduY2xIcXppcHM3V3dDd3Z5eHpnc2xH?=
 =?utf-8?B?NmF6TVlQMVR5YW5iUWs3UTYxYkhDOUtDeXFHM0pqNjcwd3hEZTc2ekpSQzVv?=
 =?utf-8?B?OFUxQWFHSUJBdnNIWVEybk5BQTZQNWh0bTNpTlFQNnJxSUcxb3ViRDI4SFI0?=
 =?utf-8?B?V0J3Tk9WL1JELzVzOGhKY21ocU5rUmdxSjJOcmxQVWxhVUhYYi8ycWRZNFhT?=
 =?utf-8?B?ZzZNYno3STVZWU5sL0FEWll0YjhCOTFKODRUTWxEZ1Z2UklqUTRGZFU1Z001?=
 =?utf-8?B?MGF3cUhjcTlpaFJMeThadFUreitxdUlPS1lYclcwcjZQQ2hSSFhhRHdrdUJI?=
 =?utf-8?B?c3VMbFZvd2V3QkRWZER0bnJrcXA2K1lJTlNCcTFsRlJXWlcyYStOV3dSaFFp?=
 =?utf-8?B?Z3k1TFljZEtLTGlEVSs2RjRzS1NmRVh3RDFFcGxJamgrS2J1T2RHUExETjBL?=
 =?utf-8?B?dE1ucHJMZFN6cUlCSzRQRVU4cHZOYk41dVcxaWU4V0lYK0JNTm1pVStrQkZZ?=
 =?utf-8?B?c1RNSmlRd1gzTWNFWThodVh0UWlHVlMyKzlCUmRrYTBONzk1QTAybHkxdWtr?=
 =?utf-8?B?VUhMQ05Fc09ROVhOV0MzcE1vckN0U0x0WWt0d0dHa3A0NmtHaHNNU00yWmMx?=
 =?utf-8?B?WTgxbUMrd0N0MnIvaDZTd2VMaDFGWWtPSjJNMTdaU0toWGRZYzFvdzVhdVRY?=
 =?utf-8?B?RmVWSzZPZzZYUlMyRVdMM3NlOHpNU1ovQ3F1TC9sZ3ErMUdnTXkyZFNHV2E2?=
 =?utf-8?B?OEc3aVpERFc5VVZDK1FlWlpyeFVIVlRyZE5YVE0yRHdpVUpOMVpzWWQ3eTI5?=
 =?utf-8?B?elBlNWZHVkxDZ0JGdzEybWJ3am0vOHpTSVIwc0xodWtRY1RxR00vejNocTg5?=
 =?utf-8?B?eCtYbm9MaU45K0lFQzY4L3NsRmd4U01waDFjZWlJTEpZNHlQWU5EVkI3WFdx?=
 =?utf-8?B?K09VbE5GMFNHVG9Dcno3UGUvQks3S2d4d0RVelVuL0ZtbDYvS2h1dnlIcEh6?=
 =?utf-8?B?NFR5Z2M2Tk9CQ01IZytjOERQRWUzakNzZXd5Smk2MHFpcjRKUmMrVTFRcEFl?=
 =?utf-8?B?Z1JlYXVaMmFCdGRRVlUwbktSczJ5NTN6OWg4bnQzbHVqVFN3ejF1eFpkRjV3?=
 =?utf-8?B?cmk2dWUvYTlXNTMwbG95N2dLK0ZDbVZaaGhOc3libVFPeHAyTXV5Y1ZpeDB0?=
 =?utf-8?B?aHQ3M0pXZlNsR09KeWlUUXpTeS9BSmpOSklhSzkzdngrbGhYMXY3OWN1YVhY?=
 =?utf-8?B?bmdBVWExMG5Cb3phTUdlcE0zK3BXY2RlZEhqRkxPeDM0cldyeHUyOG1qTDFK?=
 =?utf-8?B?NEZYK3JxUFUzMkVTS1VvL203elBsYi94NUdrMUJKU0o0c0lobDBKVUtqY3JT?=
 =?utf-8?B?MHRVcVErdUQzNXYrY1JiN1dXdUVCR3AxS1hLSE0rcE5McGtXZUJJZTEyd3dF?=
 =?utf-8?B?N0pKZmR6RXk0V2ljcTlqS2pqMlRxSjlpTHdzTG9mRXVHcklub1pUeGtNdytL?=
 =?utf-8?B?a0FNYkN1NzdBVUVNMmlubGl5b3Flb0VNSUJVM21FSFlkMnNuRkR2Y1ExUVFZ?=
 =?utf-8?B?RE5yOU9yL29ta002dmU2LzdjZDcwNFU0dkRjTHVmYXpCVHdyLzNtQWdENmVI?=
 =?utf-8?B?UnZPUHY4bFZzRUZBQk9obyttNnBuUGxaRWFYVGUzbFhzTkN2MlVkdHFyRW04?=
 =?utf-8?B?WCtVQUI2V3daSEFjbjNzQ3R5WExmVzR1ME52NGk3NzAyZVFpcFVvekZyQVZT?=
 =?utf-8?B?Qi9BdU5rZEZ5U2dWelRxMUNNanA1YlFzaHdybGEvTTBtWHkyOGFQR0kxbEw4?=
 =?utf-8?B?VnhUQTF0Uk1uZHJQOXlkTjhqVHBDS2R2NUVFVDdpWEdBVmhlTGVwRXVRbFZt?=
 =?utf-8?B?dGgycEVqZ3F1VlVoZFRrRzRIZndFYWdTZGlwTHVnZEQ0UE8ybXhoVmErK29U?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123041e7-2681-4851-6375-08dad867b91d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 15:28:43.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roMYs4h5reFRIq9FQ97t/zo2KNgbKDEEToU0O84yaJQztcghXd9POr7Mm9yC35a4c9C+/ODeGr1VPbsLfOycrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6301
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 15:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174359

Hi Alex,

Am 07.12.2022 um 09:53 schrieb Alexander Kanavin via lists.openembedded.org=
:
> On Wed, 7 Dec 2022 at 01:21, Sergey Bostandzhyan <jin@mediatomb.cc> wrote=
:
>> I think this should be documented more prominently, as missing informati=
on
>> on how to get going was the biggest obstacle, at least for me. The benef=
it of
>> this workflow is, that no additional layer is needed and that everything=
 seems
>> to more or less work out of the box within the usual checkout.
> Thanks for the report, I totally agree that the rust recipe workflow
> should be documented somewhere in the official manuals, I'm just not
> sure where. Perhaps the 'common tasks' in
> https://docs.yoctoproject.org/dev-manual/index.html ?
>
> Can you write and propose a patch to the documentation repository?

Is the recipetool obsolete or why we have yust an other tool to create a=20
recipe in oe-core?

Regards
 =C2=A0 Stefan


