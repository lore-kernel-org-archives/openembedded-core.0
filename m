Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C58BC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 05:31:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.66746.1705901489136423092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 21:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iVKNN8Xl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M5TqT2009814
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 21:31:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=W44bDVacPZR4Zv14lyfeHpOH6f5SkrFDTEPba4sioOY=; b=
	iVKNN8XlKG8Qp/FOguaFWsWcFjzXSSPUSKENtAI++6LI7A7iU/qRakNd1P6nwvMB
	WI9p8vlzoO4dQevekwaO+HnL529OmsybQMs0oHHGujwdg3Aouu1Fm+HjbnH3jT5L
	szwDc+e1zFI/7r+qROmWmrHKDcFpb7FxngE9G/YgJDvBJO5zFIEl7Q+tngdWwRhe
	H43/JOEZPG8BsL/eLZTDmQ2x70Hdabc3C8X8zvcJRMIW1oypt6VHX53oaf80Zmw+
	r7UXtdAuGSashISDTXf+5U3iCGCBhTJooSIvA/3FXlhNF7BQ/cxCLWagtofVZ+8C
	dYyIUlzY7KX9MBKO4M6L2g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejks6w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 21:31:28 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M5VRXo011907;
	Sun, 21 Jan 2024 21:31:28 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejks6w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Jan 2024 21:31:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG5t+lfOD+MEhewaY3f+Gq9eu8XGk5/FZ8gg/TcvtxeCF2albDn2sVu31kVN102oQLpAxsQh2Qe/2jVqTkfJtf9vgeVWx7CaTONMAz1jTj6tNMDFpCU/dGImMJJlsA74Xhj/PGFHJtVzQgfJHIOuFCwug47onSHZPwweqBLDJf7TqXarAQkkqgz5yeF6v5kF+C240g3CksHQ/8LW5efuEBCAKFAr7QFOZPBtXZVMkFv8mG2Po6oT6Azhrdn8m4X/cOAXTTGIsZ3bF68uif14qc/ahlqk+oeKhi96/fOje89yg4Cc7Xd1thnIIyTCEGyVp9pqzUUvl5/AVTNVKBefTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W44bDVacPZR4Zv14lyfeHpOH6f5SkrFDTEPba4sioOY=;
 b=J4SdCydk6n8+zjFieKPkX8mk1Yw0gpSrzXr+kUat5ikD5Vh3GPMzkiPClZFGGvbvb18SYeNQlPs8QKHjUMcf/ckFOHyaHITA7dAJ2rHft/rpWw3tGC3+kj+4aFx2Uq8GkKpDkl6cZ7+JgULIvuVEZEZjg8Oc/IXKAqK+BzsfK9Tnf2f94U6ft0Briw2h5xaEW2TBkc+ftAuWsf9UZQhtJn2gy2PpVGzhB2zeiI44KHqzQc6Ib0TQNIqLENqTn7KjkgCjgHFEkuzUw/au/hc2lH2A3stKw3Ts80L+I9eVSxoPAVbz1HgsEEAaFob7UpCqZuBp3MESJ6+zr9mQg/klPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:31:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 05:31:25 +0000
Message-ID: <f598afb1-a09c-741d-0b51-c93e9a42b67e@windriver.com>
Date: Mon, 22 Jan 2024 13:31:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] devtool/standard: avoid KeyError
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20231226044457.3699093-1-Qi.Chen@windriver.com>
 <0dcd0753b7a5370bff4ecf9862847b64afa673bd.camel@linuxfoundation.org>
 <17AC92B461D40AF5.16230@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <17AC92B461D40AF5.16230@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: cba7468f-9709-4a7c-b432-08dc1b0b602a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N7JEblLQSJjFD9Cy9A6RH/DdaHUhjFl5l16UfYm7runnQn5H24un7ZSwk7zYEuKsjQ9AkBLK2slr0ZMFS+q4/JC9BSoCaDsFJLBurolVK1trgR2ySIgj7efCya3g2tU0AnVkV7OhXAyRKUcrQhT4bvQHINpoBvFkx+e9g3WafNVFnLaB860de0ogG81G6wRTF0G+9QHe+Ah9Bl6r1Oo9OO4nH0TFKW1LGpnfFqG29mPBTY4yWMldkk0tiqgPIdhtzfSPoX3/zJ3DIIcKGk2gBcLHiQ805B7Op7STgD+olRau9NrBrgIHrwi9WqE4bU8kh1XYyIDKTuu5X1fCmFQeuvXLl+IIkRcXU3PSfvWey4NYzaYUB/xL+Arfp7fUYRj6GHDB/UIZbbt1p9lxefMOh17yRiqQJ1hAF1gkQYlxN0/FCtIg/ayxNoDwcUf3hujGo8/5kGyOIWU0sQ0qn8pqfi8vLtV3VTd4BdpFPEssdWZRw2Eq7oCBEIWncCo2mWoaU0yrANnnXydLX4CsO4mjlTOHh/6/5LFjVxpgfAhz19ssUqpEGPWG2nWlPB/bcqxZXp1mZsVahmLn6j2Ly9iIEAwVyOSYtwIvxjxEsqhkF7HWvZ/FEthBttbYfqAQa+gERdRJlxotTxNqgP25mOcl8mLPTq6pfZ6JW0U5LXfg6sD55L7DEPJGJOwJtjQU8CZ6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39850400004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(26005)(38100700002)(2616005)(5660300002)(53546011)(8676002)(8936002)(478600001)(2906002)(41300700001)(4001150100001)(966005)(6486002)(6512007)(6506007)(66476007)(66946007)(316002)(6666004)(66556008)(86362001)(36756003)(31696002)(66899024)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXBqYmdFaDc3V2ZIM3U1bVZQMERzc0tvUFpERzhUVVJRK1pJTi9xUkpjZmNY?=
 =?utf-8?B?Zm1DNXIzZXdZZW9kaVE3ZnZoVm50RnI5clFPcDNreU1vWWVYRU1jMytsN2tu?=
 =?utf-8?B?cXdUUDBrZk5uUmRVVk1rRXJuNHVSZmpjSUVpZDZteFVUZ2k2MjU4LzJhQW8z?=
 =?utf-8?B?eGRSUlhWK2YrbWRXOVZhRGh0cE1UMEErcmlrMFM5Qkg3eFpCTXVFUERXSzNo?=
 =?utf-8?B?VDhtQWtncGNFYTBiNzNER09Wc20ydHpuUTI3L1lTWnAxanRtQ2VDYU1VM2tT?=
 =?utf-8?B?NXAxMlRZZ2NFeHBlVnVGMGRwanljRVNHSlF0UlhaRTlLN0FsdzM1UTlSNkky?=
 =?utf-8?B?d0FOdVhGanVoL1FoYVNuRmo3eEZFZk1jQ0o2OFNpZG56Uk40cFdVcVl1dGRS?=
 =?utf-8?B?SWxYSXFkd3lzY0l0aTUrT0lUTGlmVXBxTlp2dmZXQVRpWDh2NEZ2RmZoUmN5?=
 =?utf-8?B?RFp0WjZOYzdBbG5UNWtOb0FnWjZpYnY2WEdxTzBkMnExUVA4TXZwRUwwOG9Z?=
 =?utf-8?B?dFFzbTQ3OEorc3FnaVJUT3RHUjRQa0kzTk1MTFNzZHkrZ3pUYmo3ZDQ5NHhk?=
 =?utf-8?B?TG45aXFUSDNkcFg2Nms5U0hCSXJHL1VBRFhRQldmUDRDMlhybHlveW9HOHY1?=
 =?utf-8?B?N1JPaVltRFIvbC9jamRXbVVOczhJK2tBd2VoSDgxdzkzWCt4bGY2MmVUdHVV?=
 =?utf-8?B?eUpISlN6NngybUJXbVFGMytFdjNXVk1sQk9rQm9rdWdRZ1MxaitlUjgyeFdt?=
 =?utf-8?B?MFlXMEgvWmc2QXNHK1dvcVdoMUhJazg3S3dCbUdQREFoUHZ6V2ViMU5PNC9K?=
 =?utf-8?B?a1dRWGN1UnFrQ1VOaVliS2tSL1Mzbm5SenI3ZnduQmsvYm5MaWprZTNMQitC?=
 =?utf-8?B?ZHpOK1VkWXQzajc1cGN3MUZYU0FJN0dFazJORC83bldIOHBnQVQ0MU54QTdr?=
 =?utf-8?B?Y2tHZmdDT3hZR3h2RFArN0NPL1VjM2lDU01tN0w5V040b25IeW1WRXF4Zk44?=
 =?utf-8?B?TE05NlNpWHFtU2hTNFlYNHpVcDE2bWNXY2dJS3F0dWY5S0tOTFUyNkZvMmYr?=
 =?utf-8?B?RnFjbmc2N2ZNZzdwWFl6WFViaXd1aVVORmFvOU9MUVpiL2QxUTBKbE8wM0Qx?=
 =?utf-8?B?TWRVWFBzWjJQNW1pbit3UzhVUkp5UkIrNURheHpGSEFiU0pHZnZOdUV0RVhV?=
 =?utf-8?B?QUdIYW1GeXBHNUNTa3dIS0V1TFdsbE9jaXQ1aGpqL3B6dms3WmNVQktUa3hT?=
 =?utf-8?B?akw3OWwvQ0IxNWVlRmVYTGw4amlWYWwrTFA4ZCtpUzIweUlaY1V3Z0twcW9o?=
 =?utf-8?B?Z0Y3WEFobVJaMlYySlgrTlVmYjBRSFNsc2wvT3RHcjFGV3lmeDYyZmpIZm1s?=
 =?utf-8?B?UUl6am5IRm51YjkyVWZaY21CSzh6dlBPSDhDRE5meldZRVJUU3hzcXF4R3Bj?=
 =?utf-8?B?T2xEK2hhNjBpdkRyYUJNcE1vTDdoTnFOYmJNZkV3OEl4QkI4Rlkxandzandz?=
 =?utf-8?B?MXc2QjJvVXp0bHZ6SllBZ0xTMkpuMmNxWU4xSjlpUHJuOC9kdnVCWUVTWmpL?=
 =?utf-8?B?WnVRVndQQjhNV1NLSGJCbzJwdWQzdEdSUmNybExPR0RBNGowYmJaeTdBTWwz?=
 =?utf-8?B?SkJSQWVqSWI1ZjcrUENxcG1BaVdoR1MxdzRINEU1ck1MbTA1dEE1TldURmtm?=
 =?utf-8?B?RkVzYVFtNkM5cjN3UnExQzA4VVFhbkc0UEI2bjFhQ1hnd3cvS0tLZ0piWWo2?=
 =?utf-8?B?MzZTaXVkREVGMEE2WUtRNTNRSUZyTlNUSVN0MHpGQWJmOXhMUk0xWnZ3bk9D?=
 =?utf-8?B?b3ZMd1ZuS0NxUFVycEoxNU42RGoyeUVuRlJWeUtmdVdFSWQyeExUQXdQekVl?=
 =?utf-8?B?b2xDMlA0ZS84aC9XM0ZxWHdlMzBlS0E0NFBGVDVCYkxDSXJqQlVjUDJiMjdT?=
 =?utf-8?B?S2h4SmxWYlRSL0JETVN4VTBudHFjSWozcE1lZTN1MEhJTUJWajlIU1RDZHZM?=
 =?utf-8?B?YUZSN09TTVpEQnRxaEU4Ykk5b09COFBhQmVZTktRVUlyUTNQYW9UUTMzNFd3?=
 =?utf-8?B?ZEd3WGp1Z28xVnFOQ0UzTDVZWFF3WUQ0SmYybGRhWktlQS82UC9lREZkbnJF?=
 =?utf-8?Q?Hi6VdMl3Rpsk2iPwa+ls3gPIl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba7468f-9709-4a7c-b432-08dc1b0b602a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:31:25.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufvM1vD2Pwfq51I6eo1Ob3LZm6Abamo/6faZDPoDDWrcYRMfYWqT+9mCUihoh5eUxfntVY8YWxu9X3j3PxnuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-Proofpoint-ORIG-GUID: WN93b1p0TD2-nuMMfB_2A9FYxMU8I3wI
X-Proofpoint-GUID: M2cSWCEVF-S9RwTpY95oc9f4sO4UZZbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40M5TqT2009814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194115

On 1/22/24 13:00, Chen Qi via lists.openembedded.org wrote:
> On 1/20/24 01:19, Richard Purdie wrote:
>> On Tue, 2023-12-26 at 12:44 +0800, Chen Qi via lists.openembedded.org
>> wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> The initial_revs["."] does not have an initial value, resulting
>>> in the following error:
>>>
>>> =C2=A0=C2=A0 KeyError: '.'
>>>
>>> The problem could be reproduced by running:
>>>
>>> =C2=A0=C2=A0 devtool modify -n systemd </path/to/my/local/systemd/rep=
o>
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>> =C2=A0 scripts/lib/devtool/standard.py | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/scripts/lib/devtool/standard.py=20
>>> b/scripts/lib/devtool/standard.py
>>> index 559fd45676..5d9b86ed6a 100644
>>> --- a/scripts/lib/devtool/standard.py
>>> +++ b/scripts/lib/devtool/standard.py
>>> @@ -905,6 +905,7 @@ def modify(args, config, basepath, workspace):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdout, _) =3D=
 bb.process.run('git rev-list=20
>>> --reverse devtool-base..HEAD', cwd=3Dsubmodule_path)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commits[submodu=
le] =3D stdout.split()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nitial_revs["."] =3D None
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if os.path.exists(os.path.join(srctree, '.git')):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check if it's a tree previously extra=
cted by us.=20
>>> This is done
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # by ensuring that devtool-base and arg=
s.branch=20
>>> (devtool) exist.
>> Why aren't we seeing other reports of this? How is it reproduced?
>
> I checked the devtool OEQA, there' no test case to cover this.
>
> You can see my reproduce step in my commit message.
>
> When I was trying to add an oeqa to this case just now, I found the=20
> problem has been fixed by the following commit.
>
> """
>
> commit 64d5db2f89b4f3712b55127215ae02ce50dd747a
> Author: Jamin Lin <jamin_lin@aspeedtech.com>
> Date:=C2=A0=C2=A0 Wed Jan 3 18:13:44 2024 +0800
>
> =C2=A0=C2=A0=C2=A0 devtool: modify: fix exception
>
> =C2=A0=C2=A0=C2=A0 Root Cause:
> =C2=A0=C2=A0=C2=A0 initial_revs is an empty dictionary and do not have =
"." key.
>
> =C2=A0=C2=A0=C2=A0 Traceback (most recent call last):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/devtool", line 349, in <mo=
dule>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D main()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/devtool", line 336, in mai=
n
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D args.func(args, conf=
ig, basepath, workspace)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 File "scripts/lib/devtool/standard.py", =
line 922, in modify
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not initial_revs["."]:
> =C2=A0=C2=A0=C2=A0 KeyError: '.'
>
> =C2=A0=C2=A0=C2=A0 Solution:
> =C2=A0=C2=A0=C2=A0 check key exists, then get its value.
>
> =C2=A0=C2=A0=C2=A0 (From OE-Core rev: fb0db5c48abb4d56233a175fdd349d18b=
972e452)
>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Alexandre Belloni <alexandre.belloni@=
bootlin.com>
> =C2=A0=C2=A0=C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxf=
oundation.org>
>
> """
>
> So my patch can be ignored.
>
> Regards,
>
> Qi

To avoid any regression, I just sent out a patch to add a test case,=20
devtool.DevtoolModifyTests.test_devtool_modify_git_no_extract.

Regards,

Qi

>
>> Should we be adding an extra test to improve coverage?
>>
>> I'm assuming this isn't related to:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15318
>>
>> ?
>>
>> Cheers,
>>
>> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194112): https://lists.openembedded.org/g/openembed=
ded-core/message/194112
> Mute This Topic: https://lists.openembedded.org/mt/103366660/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


