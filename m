Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562A9C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 08:06:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.22])
 by mx.groups.io with SMTP id smtpd.web10.5190.1646208396837093094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 00:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=HjVCV27M;
 spf=pass (domain: outlook.com, ip: 40.92.89.22,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhTn7/grAvdcnnP1NuuCv9w0XFPUQmoR531jj1LUxess/8XzYyVF6ppPlcB4sSJ1/mTCmXftBsD/7dZemWE5BA2rZO6AnPkdp9ml5xP60/RHwS6/ou9k4+SuduFAvIsm7s9tOrESK4Rcj2TwRZzGgAwcg7xXiScGNiMeFGf1nqrgtUNdPH1gg889XoItu99koxP1DKYPEsu0POoe5/qpY3U+dMD8hLp7n3GOWO1zydRppv5Ko1Mcf2m03SS89UdY9SJqFu84TjBXqFzjBVo4PfOAV3HX4YAIXj8YTNC6fAWQ3DR14Q0gRULvrQAr6kWbnbemlrc93jGjOv/ggDmgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dMftzphM9kFi9a7h5RHM2twGi/QHjB7UdBIf1XwpKs=;
 b=R2DCH1OoAG5kvR/Ukl/WMFU2KpsiTEYG3hm731vxV4nMOJuPZDDEAuISXX+Hg4+Cj/OztmXq8zvSfxk7Oc8Btyrc138B3S5gyyZ9QjoXJgrWcCzj0dz6PcCGNHxeImvhW78Cu5N+Isx9JRRv1QUiHTRjq758Dk4Z56hHKJuiLUGHbiWW5P68dJaBQNJ30INP1Hm3pz7smp7D36Hg5T+lANK6P/kuNDWTbo61QGJCbaxIHJZi//sttkEkV7tBPjxz70G9MlDn9phuWQwfzclln/2fD8QRqJgdTOe1THnMzpCxqOEGf43ZtRR0TV6JpdZobS8CYwf8PRFTnCoaccjqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dMftzphM9kFi9a7h5RHM2twGi/QHjB7UdBIf1XwpKs=;
 b=HjVCV27M1OIRdsD2c9VAS7YJumbWkhrvrpXEJQj6qOcZLBuXAiziOIy6SapcaE/7MeFhxhGpdUFWho+ByXfJgsqJG85reSR6NPUZBbUujvQPdP45FwDDwDSal4JpUryU+5q1oD03QgX5WtP7YDLYRyD02I+Yz5TY5t0Oi8SGzLOlFIMwAh0giSHp8CnvFhN5hFUONFswMCWglRY/vGTn60BhFQWb49N+uiIquCYN/kZhONBJNg+FfkGbf2hjstZU6Z+xS4n/9r5yD/7iOtUk0pBcCl4ZSnIf2A0TvCSRC+EMjGDOwLbbDEkfg0I/b+Xl1wmClIWkuaqU+UaXWBrm5g==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VE1PR09MB4494.eurprd09.prod.outlook.com (2603:10a6:803:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 08:06:33 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 08:06:33 +0000
Message-ID: 
 <AM9PR09MB4642F83FE01DE7F2725D06ABA8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 2 Mar 2022 09:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [gmDCzVUonuKUt00geZ9cZQPCFWtWtyWVMkk+DpQI9twTaxJGZigshy30NAN+VD8z]
X-ClientProxiedBy: AM6P192CA0060.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::37) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f03c689b-465d-8051-9a06-758d9b19a2b3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9da54d1c-af96-43a1-a025-08d9fc2390ea
X-MS-TrafficTypeDiagnostic: VE1PR09MB4494:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IEu37laXj4Tg3SReSlHx7PXR0qYWzpHiVDwrJlAnUN+tqiC2/ORQdvg702+gdO4JDYS/W1rsKj0URsy9kqvKzcPRT46J0Y5hMcCXAwT9eZe0GRegMnLX7zPyeTnpFJI5KEWcO18OuRZgNZ8ZeIz+zT3HxTIri/r6XcmfeWaL98hCNmBCaJLMOMaLo0hO2CFaZshNfmGxdn7O+ZAYzgYzA5vgCG/coG7qmDZgC7G2YR3YCvKbGdAHD5uj46VEDs0xw5m1/DlHYqLXkkM/xNzcgte/HsioKxiFuc0xNNAlaAp6Xajim9peDPF1AwsDXbwAnj6JxdiE8b5HAz2rMXyTri2t5eB8Gh0Ba1gClobj/QsD8kxZ7ctXkR+83tFb9tfVupO0dmZjYhCW0LhoYccuP/A4qNNQlWDvPtugAgYR0hWpTM0wyMmgNaqy18rVgoMQurL92cEtMVklp9knjr54eRHpr4ZWhuJws5nqtKr2AvSd6NEMSt1XTWDlL0NSVqQdposl7pggA/gkhVC/BiRMlLdxD/8tzKBGiQs6NiG4RsL1chdADtVQ0dxc5eQ8+m2zLSVEo4/3XmU/0yH+4UiPD5S53I841f23h1JEGm+jzDMBun/gAd3poIXMH2IRV8YQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmtuLzVESDMzSDU2SGgxZlZIMThoVW5GbDNJbWs1RlZBbjZBSi8vYS85R2dw?=
 =?utf-8?B?TXRoS3FXRTRYa0FxanJoNC9LbHhFQ1cvSGp1YWxKbWNHOWc3M2pORlFhMmRB?=
 =?utf-8?B?ak9yTEp2S3R4alVpeTVsUXFTZWk3UEFLUVNMWUR2ZHB5aFM0YXpxdkVERU5y?=
 =?utf-8?B?cDNhRzJpS1NoOFZNRGxaRE5RdnB4eStqOE13ekFDZGh1TkZNbk9BZ2tXeHBK?=
 =?utf-8?B?T3R3K3NwVU8xYWlNMnl0RWt3Q2FjR3dNUEFCdlEzdWtKbG5DbFRoT2M1dm8r?=
 =?utf-8?B?LzFMdkZEb1JuMjhSQnM3ZG8vUlBZODhmbVJvMk91OUpTUmZKNjRuUUxxK0R3?=
 =?utf-8?B?N3pQa1NIbXMza1EwcHRwbTBNQ290dnpqM2xEU0dWVnd2djlwZUdEVWJiRWww?=
 =?utf-8?B?TTVuRHJiTXh2SHNvWTY4NHJHWVEremgrRGhPd2F5bmpseTd3Nm9WT2xiTWl2?=
 =?utf-8?B?V09Jd2o5YnlJTGF0NHROREEvWVllSk85Q0dzeHBWY0txa2FCZlcyMUlHSjZR?=
 =?utf-8?B?US9ReWJvMWN0TVdpek04ajZkankzTVdySDFNTlY0b0lmR2gzQ0RrUDk1Y04r?=
 =?utf-8?B?eDZmRUhPQm9vQ09nQlRrRmsvYllrczJvNllQazlMcTJ3OFI3clZaMG0zWWR5?=
 =?utf-8?B?N3oyOE5mRFNjcGZ0bDBkR1BCSWtzZGZFeFN1NTB6Z2JMbHA2eW5RK1RzU3Mv?=
 =?utf-8?B?K04xQzkxVG1JSkdPWDJxckQwdU9aWE1JU3lEK3hobDJ6Z2dueG5sck9ab2R5?=
 =?utf-8?B?TW9VZllsWUhiVTVHQURiV05EeWJ5b3NqRk4vZHdscmh1QnJkUVhLSThYenFp?=
 =?utf-8?B?eXIzRXo3YTNKZFpNd25TeEhzd2xZWkNRaGdsZUNKMFhIeDNHRTJVaVpTNUhE?=
 =?utf-8?B?NldsMXkwVE4zdWJmYkxDLzBWZTdmS1JoVTNMOTB6b2pGYmRHL0tKZ0Q3QTZG?=
 =?utf-8?B?LzJlc0YzQXlHTHFZNWZIb1hUTHh0cWxSazlmNWVQb09zeGtwS1FGMFF0L3dK?=
 =?utf-8?B?NGRXYllFcDBWRGdWVE94cThtV2s1SWx6bWxtUFdyZmdUOUYvck1MYVBNZDBF?=
 =?utf-8?B?T0JZVlZNb0ZySHAzTXhNV3AwckZlS0F0S3FRSFliRldqMGdRNEIvLy8yUVNy?=
 =?utf-8?B?UWVJY3RkRjlBaGZxS2RPL3lmNThuMEFzR2cvMFRGdHFhOHIvNDZnNFR3S3Vz?=
 =?utf-8?B?VXpsRkN6YTc5dnY3Q0c2Q0xrMjQzblN5VUJBYlI4K2JJRmhpU3pyTTBtOVVj?=
 =?utf-8?B?RGdlMndMazVaSTRYU0t3Y2haQ2RiOGhLUzJSQUVXb09EZ29VWUJxd29DWmJ0?=
 =?utf-8?B?bTZNNndsMUhscU5XRGtxYjBROHp0enUyT0JlTnc2ajRUNStHaHJkaS8vV2I5?=
 =?utf-8?B?YWhvZENqVDJmRXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9da54d1c-af96-43a1-a025-08d9fc2390ea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 08:06:33.8591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR09MB4494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 08:06:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162595

My bad - one of the brackets in the name guessing slipped...
Will send a v4 soon

On 02.03.22 06:20, Khem Raj wrote:
> this is causing 100+ packages to fail see
> 
> https://errors.yoctoproject.org/Errors/Build/142116/
> 
> I suggest to include meta-python for wider testing of such changes.
> 
> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
>>
>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
>>> where the wheel file is called
>>> pytest_runner-5.3.1-py3-none-any.whl
>>
>> I'm thinking we should tell pip to install the wheels to a directory
>> we control and then just install *.whl.
>>
>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
>> it's clean on builds.
>>
>> Ross

