Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E55C25B0E
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 08:55:15 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.8509.1660294503189646080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 01:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=qSHpyeMD;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.54,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpSvBJ9DWL7WhJkLjwt36YqlvcPYJZgh7i3MbwwFY+sSrUPXsTd5Sxg2qRLZDBVVLtHPreO4sItw8ytHkWob1VNcmp3IPQ1rFZxXk8UckhJ9v/0YZdq++nAndnnQSDP7BBG9Ori95WLXfw1aziLO+ujGOHwMlBLF+RnRfCT1KpBLN0B0Ar2RUw2fFSp1prJhLO3ZHk6u97ZczxJJeIL5EPos0gYjRettSyPC2VS9PsTnAddpz6t/vYzc/GClxhm7gESZ4J5J13UPhVn5dm5AR6PRjvIV+FxxbjnwULv7udgQP6XsAWoNyFRjyXfasnjKm7WmJ2bsJVRtg6N9NMTBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9AfYcIelJzDDwivSuiTD50UjWPl+oZWJzbvkiVO+Do=;
 b=dvZh3ceRb1IhYNzK7FkPdaTExMwc1yepyl1+oUlpG+UkJpwlEhvI1GGC7UrLLzYlbQVCD/+QGoKvnZVTE0nGT2Rv7CIMhljV3/KjnoWKaIgB1NxTsRQneFIKIyXHUA/mqPcdud2s1veFzk8xLB42cV1QuBDSnrzK5SPt1FXbT5y7MJQXTSF0t8vM7yGk9baauJ6VfRErsraUhfthasjZw71IaJPmf8ZybphJk2QcM7p9n/4PgqSqWzMpFHY9MuEU7OSz4zABnlKjZ0fJq69xekh2yguTcmNqCGKYDWSNOjxbnLEs359gMYvvksOLxoT4y7ANr+M/cJ9w+LVCQ4Uf+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9AfYcIelJzDDwivSuiTD50UjWPl+oZWJzbvkiVO+Do=;
 b=qSHpyeMDqpotZ/3No6X6NaHwYI4+yPVzrXuUzx8NqxDV/RykFrBW7QVfENXnm4Hmrz0WLOGjVA34vN/0iU36vjteRMLtRflMqMz+zQcWzsa7mb5L7O6dKKAGbdwSnDsT3VWGgKGMNhkeg6xKcXXfFI3BC7j2J+tNvX+773lEv5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB5992.eurprd04.prod.outlook.com (2603:10a6:20b:93::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Fri, 12 Aug
 2022 08:54:58 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 08:54:57 +0000
Message-ID: <e88bbc24-0ffb-75fb-3406-a18d9ee920e6@theobroma-systems.com>
Date: Fri, 12 Aug 2022 10:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: only package unique
 DTBs
Content-Language: en-US
To: "Belal, Awais" <Awais_Belal@mentor.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220808103227.104898-1-awais_belal@mentor.com>
 <5a58fa84-6b17-b4e5-dd30-43277dde7d05@theobroma-systems.com>
 <33274b612f714d78a0c721035d58c091@mentor.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <33274b612f714d78a0c721035d58c091@mentor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0132.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::16) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c24c5858-d305-4a5e-4b0a-08da7c4054f8
X-MS-TrafficTypeDiagnostic: AM6PR04MB5992:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R96fDZCLNdJPRikzF4oyP6rg2jRR90LyiNilnXmdrL1wHdOmmMhIVKNUF1zJH1OmqrleDWcNiRkNpaHOqmFkCzGo0dWE+FS/+rmdgWkN0Vci5hzKv7i2ORbrwvTAdrdSc0Hc2wNMtPxHdNoY5107G/2klyDkg4dsuqJYPmsHNCtwMVy89MGGbF0G7x2Gc+FBs85ZZ374tvzc+DoWpamxtoTjHFnXrY/E49pHyLn7BsF714GoQ/d+Vqps8gBCYoIoCLHtqa5LiFjBYy37Vgj+Uj8u9nuZ4gfTjfSjhUKLsrdKXEC6hSTxUs8cYbTNnK0LCQ69TKFE3MJsLOqSG0LkndRKOgG0fUjFpiMzWaGAUhcQtuHPe+SLVub1+7LkPhw2iRGB8fu/x2+xoMERvp/uxag/617VAStNRcCG8dh8n+k/SSz7UIzbF3IvELeWLjPkMWNXr6lbhh5Z4CqmzKOwQij7OxwvVtkrrRjyhs7bDwmOWGk2FcXWzjq6qBjJJv9kt8uYas8w6A06AqQz5qOEbCleGxFcLCDF8t4k+lLBNDUsxKqvrcEsUjEOgqToyLQsJJxn70Oglq+quVg8KEHFeb+h2zJzFBZ9Wtg6ZW8ez1bHFqrmNtR50zcVTtb7tw0zp3zzjJky4bC/WGArQXQ/2DowfSX1XoRFN94PztEt7lYeGQV9Lw7tDJTeKxQFAp2n44nXhFbvqR/3wTW3wYxY97sPF3T35EPAM/EwTiHFfofaAAewk9vytsllI/U+LMC9mNG8w5QW1voJMS8Awhk+L2qkZ+iLN9Ji4i7p3oJH0PrmrW+j9SD8O+wlDwgTU86uG6UbZKqX8aEGjyLIVqPWJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(6486002)(36756003)(478600001)(41300700001)(6506007)(86362001)(6666004)(186003)(31686004)(2616005)(31696002)(110136005)(53546011)(6512007)(66946007)(5660300002)(66556008)(66476007)(316002)(8676002)(8936002)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFpuTTNYSzREVG5IcHRLTzlPWFdOR3ZaMlRwZHlLTGc0clZrN3VwbEFBRDdn?=
 =?utf-8?B?K2NpSFB6eWMrWDZPRGRZNTUwUGcrZHFTb09mQjd2RCs2RHZjWGVYUThDbWtr?=
 =?utf-8?B?YU9hTTRxdWJyekZHYk5aaEQ3R3Y1eUFpTHptdjRJaVFDaGxqU3JXK1FHV3c2?=
 =?utf-8?B?Y2NNSVdDclYrRHNnbysxTm96NlhaRzJqZ1piVXdhM3Z0cHJtM2w0WWNCaHAv?=
 =?utf-8?B?M3l1eEc1ZnBaVDREaDBvSm03WUhZRUFQUXVWVklTa1RIaUgxNFhNcnR2RUVm?=
 =?utf-8?B?V2hLNlhQZWJsYWkyUFBpWS9NRTh6aWVTc2cvbmRIZjQ0OExhOU8zOW5DR1F0?=
 =?utf-8?B?U1FsNStJSUdCdm1lRWo3SzdCWlBoOCtXdTNaajFud1hvM1R1emRIdnBqMHMv?=
 =?utf-8?B?YmJLUGxEZWlPei83VG5rcmlqc3d5YXoyUTJZdUxpYkZ1K1JNRnJuaFpKS1Fw?=
 =?utf-8?B?TjNYZ0t2bFNaR1hMbHIzZXFLeWJtRWFTSTN1OUVTaC9YS1gycHpQR0JoRS9n?=
 =?utf-8?B?N2tadjRlTGkya0UvNTVYUmhUejJZeklUc3VRVkgvb3lRTDVsQ2pZTHZoeHU4?=
 =?utf-8?B?WnZWRHphTkMxUnVFOTBZcUN3bkVxQlA2Z0JPQWora0F0WWNHQ3FWT3RaSnox?=
 =?utf-8?B?L1o1VEIwQ3BIeVdtMy84Y0oxbExuMUl4Wm9NdUJLaytMNmJsTzc3b3JFUXgx?=
 =?utf-8?B?d1pDWmEwOFpuZXpwdGhRUWFoUHNaRVVmS01PTHN3Rm1iQy9sQnA2QzljWW5P?=
 =?utf-8?B?cEJPeVNIWktmYkIyTGZrUUpQa1duQUZGaUthWnduZmJ0S252VlVqajlnTWJK?=
 =?utf-8?B?Z1Y1dWI5b1FxSWY2cmFhWUNwZmE5L3dPaUErL3czcG4ra0NOR3NPaHRTZyto?=
 =?utf-8?B?UlRvYzhycDRMcWtkcGxJQnMvY1Z5MmdjY3c4Q056SjlPWFg1T084cVVCU1pS?=
 =?utf-8?B?ZGdhWkk4aWE3SFhnZWpJbHVtSnF1Y3grUU8wQjE1SVhDMnlIOEdabEc0YTRV?=
 =?utf-8?B?U1RnWnhZM3MrblVmL0pSOHFVakhERmh1NlFRZHRGdXRvcEZSS0ttRC8wSWxM?=
 =?utf-8?B?TUJodWxlOWtaTjJtTU5DWUJFQXMra0VsYy9FYzZZVHY3bnpOZnRjUGRiQzc1?=
 =?utf-8?B?SUlsUC9CM3N6QzRFa0Q2T1cvanFha2xvWUE3TFU4T2o5cTBVTmdvaXJkUzFt?=
 =?utf-8?B?KzBBeFowRTlyTkFHbTkvZE1UU3J3MGNDWXlTUWwyQ1ZSUXE3bnZCdHpKRjBN?=
 =?utf-8?B?V1lVb0NpaitGV2xGdGNKRktITXBHU1hQNjdNOGhUOGNrOWhLMzBZM1pnaU5z?=
 =?utf-8?B?bmt4dWZUOGlhRG1vRTVUMkgyczRGTUdROUpTeDluWGpvT1VleGFhTTZ1cVNv?=
 =?utf-8?B?WXBWUWhMeEtnVmUwdXVyN0wxRzlCbjh4S1FqTmFsZ1dtdHBNMVhmRVdiMXhJ?=
 =?utf-8?B?UzRrNi9hdlVhTTQ0dFdVcXlBaGpEcUdtOGdQanErUjJwb0VITld1MGkzV3gw?=
 =?utf-8?B?UVo3U3ZXZmNNaVcvQ3psSDZJdExRUFRNeFZ6eFVSVUlrTng4RGR5Tjg4RU41?=
 =?utf-8?B?R2hOWVQ5S3ZrSmlnZUpqd1RSWlBXKzJxUkI3OUhCaWY4bjhJODBBdUFseU9k?=
 =?utf-8?B?STgzQnFscWlwUVVHaHZ5UUpvZldzN1psZ2FnRjdXWHdjSjZacld0TXNNb0or?=
 =?utf-8?B?ajVseGNSazFZY0t5M1hzT0I0LzVWOWZyT2FCRDlWTWdJOFVrWURHNXVHTlMy?=
 =?utf-8?B?SUJtNURpRnBWMlNQNWlvMXdlR3dYN3AyZlBHOEZNcDV2Z2ZHRHc4eW9ZQnBq?=
 =?utf-8?B?TmhUNDR5YnlZVW5pR0p5UFVGY3kvYzNQRHZsMnRER2J2bmlwdFZQR2gyMXYv?=
 =?utf-8?B?VHhXZGs5RnNKVktiY2ZmRWFNSE1PNm9KYXgzL2F0VEVNWFNuRHY0alhhQ3JM?=
 =?utf-8?B?VElPNGhBTmF0SkxVZWd5cVhqb2NaWDVDWHR5bmNKeXRDY2ZlSUt4enlnbXlJ?=
 =?utf-8?B?M1BXVG1LRlZpczlDRlk0UjFRVy9hYWZRRzM2L3VZMmFYZVhhQTh2ZVRPc3Jo?=
 =?utf-8?B?eXFDbHIzT2wvQzdPSmtvQVE1QzZQTTRTWWdaR0NnbW5kbmVLa2RUbVRQSmNX?=
 =?utf-8?B?QTNWWnBwdU5vbWRFRnR6d1lQRXV3WTVMZ1pHOHZEN2tmT2tsYVB0TGd2eit4?=
 =?utf-8?Q?g+4WF6T4Fj5Krlo5fDI0GOG7sQC2uYifIXOmDz21LMij?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c24c5858-d305-4a5e-4b0a-08da7c4054f8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 08:54:57.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QI9n3Lo5pfxFRaMKGvkdBbyFMXv1ikhUZ/aMSwQFZGFKUuDY9/PovPLv2zqDG3EqwOB7GEVOyflTZoUSQStTkB03Foeg2d0skpo3vM1oGhBeoo6PshNUbotn+oEWqVCG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 08:55:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169275

Hi Awais,

On 8/11/22 05:23, Belal, Awais wrote:
> Hi Quentin,
> 
> 
> Thanks for the feedback.
> 
> 
>> I think this might be a bit too much. e.g. I could have a DTS/DTB named
>> this-is-a.dtb.dtb and another one this-is-a.dtb and this would say it is
>> a duplicate whereas it isn't (poor naming choice, though.. yes :) ).
> 
>> I believe that:
>> for DTB in $(echo "${DTBS}" | tr ' ' '\n' | sort -u); do
> 
>> would work and avoid unnecessary loops.
> 
> 
> this would definitely avoid unnecessary loops however I don't think sorting would be the right thing here as the first dt in the list gets to become the default config which is something assumed for the runtime and sorting would break that. If we want to cover up the corner case you described above would something such fit the bill
> 

I completely forgot about this. I think this is a not so great behavior 
:/ But nothing to discuss in this patch :)

> 
> echo $DTBS | tr ' ' '\n' | grep -xq $DTB && continue
> 

Don't forget to quote the shell variables to make shellcheck happy :)

> 
>> I believe using sort -u here should be enough for this second diff?
> 
> 
> sort -u wouldn't help here if the same name dt is present in KERNEL_DEVICETREE and the EXTERNEL_KERNEL_DEVICETREE as we'll run into the same problem of having the same dt being packaged twice. I'd rather use the same technique here if you agree.
> 

Sounds like a plan :)

Cheers,
Quentin

