Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB708C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 17:29:40 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.92.58.84])
 by mx.groups.io with SMTP id smtpd.web11.2839.1708104571780960966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 09:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Y2Nbawo1;
 spf=pass (domain: outlook.com, ip: 40.92.58.84, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipXShVS8zcO6rxxIZcWx3akBFMLeh5YNqTFXHMFjysFOwZZ1xB49IXNbsylzV27624S2+2VMLspz0ESWWfUvnTLPIeQnRQeIBEjqVuTRUBUhc02Zucfaf/YoQvo5KLckwH3ou5qwjEFbSazpeyvwVXKfdtH78NYt/Zrm648LYitVMt0CV/plqPjVrjNqkIctoayv3kWEnTyrGDNA1R7Cs0g4p4u4mrwyl3ZnrJ/EsNVOtrbwIhust2nKnqvg0k1u6+QULOUhoL5QLsOa97K7G5rzbqcKSOTTx9UP1Jz3D2RUTsoJH3bv/Yn9uWnlCGwIarkwPeLZIPVS/p7XH0DZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GDisjs4t9zoxU5URLuISrON40rOBFEF+gaOnCLBSRc=;
 b=PSbJCKyEIHkk+qdxzxCSkIYQlczUbvHRGPA45yKO9QK7cnHwwuVn1oV5ShZWx4xM++YZsgBQu6octpjy5EdLJcCvKpf5dEJB2prE2pc0018Ojkef3YIhRbzf9Z+8B9V6Y2dQ0V5VfM+zg99acqOZc58cmr7I+WVVjGwU4fxMQuedU0KUlhgrX3OnVCaebNfS3csblH1Cgr7ZWa3Eli/sXaLiorQx85EECMIcb4mIUplOVK9jr9lNEKi9JqpjBh/AV919Uf7avPFaWapY9/d0QGVUsAJ69G/G1tQp3hS0bjvPtPtTHS6rIU6lyZAKP1hs/2QFbJG/kIaoVVhRctuDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GDisjs4t9zoxU5URLuISrON40rOBFEF+gaOnCLBSRc=;
 b=Y2Nbawo1SPsrYTSQRlUsNz4DTzYb4IHS6qTNBk+suaCtC/PzID8+Ei5wWdCbE8dAuYuhf5AvYJi63+/xCuKHf4Nr/1US94WeomJe+oIJzmKbuciM1dIXpYJvGYp3m7QL2VkqhtFvcLrX4f6oWzn1PBWt5tU99iDefgGxVoDDoum2yJ9AFtxKbtz0ZYkK4q+95x98p5QVIItseXHv9LXV55nzjze4mRXH7MskW2L+tcqfv6umGXh1DzNr8qO6WKelG+b++86Jwql98r0OubyVJyI2+K57tN4Q81IIBbZMVduxN3IGaYhyT2C4mZkiWF/NGXSgugvoQc+VGMpQYjMCig==
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23f::20)
 by AS4PR10MB5672.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 17:29:29 +0000
Received: from PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ca91:3de8:73b4:b1bd]) by PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ca91:3de8:73b4:b1bd%2]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 17:29:29 +0000
Message-ID: 
 <PAXPR10MB5541F7BBD51B807EF3A1634EA84C2@PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM>
Date: Fri, 16 Feb 2024 18:29:28 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: Re: linux-yocto: Enable goldfish RTC for qemuriscv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [7URGFOWI8mo4r3llond0Z+bTPQldWs1YNAbA8vMya9FikMlje7EmNFYkN1snoOfq]
X-ClientProxiedBy: BE1P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::15) To PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:23f::20)
X-Microsoft-Original-Message-ID: 
 <8ae9313d-4ade-4703-9b70-b82939a780dd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5541:EE_|AS4PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea029b9-e3da-4339-9d18-08dc2f14d49c
X-MS-Exchange-SLBlob-MailProps: 
	EgT5Wr3QDKx+tOuZgZhSUDmbF9IGIZJCnNrkT7cXr/CQxlTFy1qCQP1ceb0uPlGQ0vTURr9NyYu/e9sRyOJi4QZ6mbjb1dLZr+OGsSZgpwVyLDoPy0JmMpF3zu+ZCoa4B7viRkosBm4nhkOLqOoJKvLjSfVCEvhGcIw6SwQ+uNW0UfMaG4IGMg92DBrmwlyQjKCY84ZXYsWEPnxOeq1JRSa9Ni4JdQUU+UeECcBg7tj7FoLc6UB54+Iyz6ASUZVYTYrAnZPpN0pYdth5pwZmdwFULqcsi8zJMVat4Dz4KbkVzVAW+tlCliyRmaAQAwhSBtIyvNLjNYxiP+4Q36D2ZIRw2oPDsnQqJHyorC1WC+8cuF3lawBlKW+YxH/AYAwN+uozQ90j6Eel2ZYge4RmEVN3Q5HVLXgAsYXYKMcWv8rhe8owFaXDqo+7kQNCjnOnGbymUPZ7/TGx8ep1Q8+SHTXghDcFNd+fN63lJRo0kLAyye0ahbi5OwfYMs8eJ1X+GCSOtLj5ElWDoce7D+EIfOotm7ZkPKRSlxXlWoZ9KYe6BAd0eguzbZjDSbwKjwlBVelx6u6hdBtaLVMQOzt4QgJZnB7N1cshitRC/DSyuGEADr9stPrbqrP4uwqmEvtXlEYLIjIkabRVew7CZClgECb5C6Y5LWpu8ALQ5ONhG8KMYh3Xz6jEYkCCJ7SjmPEbl8SFPg5HsD9TLn4U9SagjuuIPEzR2sVm5mfnFO31ovg=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yD4qzEJXvTKpOwHmVULx/0IjcrvRznajiNf9OFdQR5HmJVOqEhC17p84ffPx4K9oa00pdZwWbEEMKGwuW9QMRZ3oAIvqo3kd9gSmBfvGqsP8OXjEg1WIbX+vykqW5mqw3iFYYJubzVK0Hl3ey/J6rNy3Is+3omAOs3prMDHNDJyjuAJzOA1Wcq7KHdDvTQWkJ2Ih59gDabiH3jBc8AEwPaXj3JliyeNeNT3JpAX+pvzhEdSCo1Wb5USD6w8F9VGB0krHOMJq2ztTREsPMwF0i6a4xcj/soaKzN69ygF2Ron1vHXmGpsyGEbPqvWoitng+MOh0GgMhX1Fjv3K5BnstcluuPk71x91zM99pZGApPyr1xrlCfdEWbj7Xn7WBhjK2R50c5wgdHShyk5FEAeVYDwrrKt8nvWingUe9rfBsJEOOeRFkJAfkkj7yc5Y5e0CApz0BfZrToeHZIzNPVsq9LTXqgQITCW8+STMwVSh375FNNRKg0irrrB8hUWUsd/Vs2huO9bNVmJ2zDDlyOhhe+mGWFb7I2Y6FM070JyGeV/Pc4cQGwbdniRBqWkQ1KJA5wfIMJ7zPX2VBiMfq5EVoDCqzWQwOBya3Ujlt3rXLuA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0twQXpWWUpYeW1iL3N0NmNnS1Y3VkR4THBiTzcwQkhFK0Q1Z2xzckdSTVht?=
 =?utf-8?B?Q0Nhb2JEaXBxR2pRN2tvTXJ3dmQyVGVLNlBNalNZTXNUNVpKTU1ESHBBdEQ1?=
 =?utf-8?B?Rk5tRXFCM3BreER4cFF1NExmdlNWZHJBN0RyUWpCWDYyVFoxSW1nM2E5WHdz?=
 =?utf-8?B?Z2RGclhKbnJBMDU1TFNFWVRsdWswRUlFY3laR2JVYUJrTVlYRFZuSnRzUklk?=
 =?utf-8?B?cmVpWVdhT3o0NnQ5dy91L1NwaFZGb3pxQ2UvMmtCaDNiV29VeGsrbGl4UHFa?=
 =?utf-8?B?QW1qZGM1SFozdWlCK3RIVnJFZ3EyMTA0NzIyL0dGcitObzE1aDdvZy9HVEp0?=
 =?utf-8?B?TjZUbDlBVktWSnUyMm92NFQvTHpsSUs2MFJZU3FmY054SmJ4NEdEYjIvSStL?=
 =?utf-8?B?Y1EzSUxka2svRzlHRHlVNzNVUFNKYXhtaGhXa2dYcU1YcllXa242Y2JRcW5x?=
 =?utf-8?B?TlZLSGNmWENkL3JHK21oZGREeU9BbGl6SE95dllBYVhyaWlLVWNCelI1bGZY?=
 =?utf-8?B?UldTNVI5VUJ4S240WmJPT1FvVUJlYXp5RCtUZVA5N2p4YnF3V25pRGlHa0hO?=
 =?utf-8?B?dzc2N2xTMlVKZElxTjZaTnFpUko1Qzh0a2tBN2RqVllXeStwZTdiM1BHSTBv?=
 =?utf-8?B?dW44djBIbDZDNzM2N2N4M2RweFVIWUNtZXVyajFGMlNyN0xRaFR1bnBPOVJQ?=
 =?utf-8?B?Q3dGYlplcHVtVUFmM3NLN1MrbmdhdjFYc3Ard3E3UU5IOUdMcURvSVVxWUNE?=
 =?utf-8?B?eVNYRVVIaWR6Ri9rZWNsRytpSk9sZE1abzMwQ211WHhOM040ZXlLR2REVWR3?=
 =?utf-8?B?dEtqbUEzbHZnaTEzclYwczNJR2lFNXN1VDMzZnIrbjNqMEVuQ0tzVnBwSDds?=
 =?utf-8?B?UlhIbURmdGs3bTBiSjdXdHovNWtjaGJHTFRKcmhtYk1ETEFHcUFRRnAvVTY0?=
 =?utf-8?B?VDg1VHF0WmlXSWhkNXpUREhOaTFLVGljUnEzYjBBM2l5Z05udTUyYnk0N2xK?=
 =?utf-8?B?RS85WHBUaGxoMUpMc1h4L0pqWEVCd1lDcGNpbXFRcFRkc1lNcGI0VVJnSXU3?=
 =?utf-8?B?QXdoZktEWVB3Z2xEajlwSEtUMEt5OCtvK2ZPYnJQbzB6Y3p1YnVFL3RpUm13?=
 =?utf-8?B?eUgrUVBlTUFDdEtJbEtLdGRrMGpselNDRHM5NEFkUlp3VXRRTTd0RVZqM28z?=
 =?utf-8?B?cFZRQldqZW1GYVIyN0pFMHBtY0lQVTJEd21JRnVKemFKcUp3VnoyM1JSeC8z?=
 =?utf-8?B?ODRiRXRlSlhMbHdEYkVSTmlJeS94aFJPNkpqd28xbXVwbnhhbFQ1ei9SRjZk?=
 =?utf-8?B?RzFHTDh3RU1VQmZFb1VJUGF1M1o3WUlVM28wemxyaDZZVC82aUk4ZkNQa2RM?=
 =?utf-8?B?ZXppVHdEcnE5M1hZVUhqM1dQS3VrVmE3b0xCRjREZzNYa1JDMFBnSTVINmUx?=
 =?utf-8?B?VlBXZThpbFJVSUV3UWdWdzU2ci9Jd21MK2lFUy9xK1Vta0FIanl2c1hJNUpx?=
 =?utf-8?B?eXRtZ0xtMXVtZk42cmNOWk1FWlpoM1RPc1c2OGFESjAwQlRXcDl4Skk2N1p0?=
 =?utf-8?B?R0cwa3Nhd2xCenJxdDZJV1NTa28zU205K0R6MmZwdVV4RjExcWJSL2tZMDFw?=
 =?utf-8?B?NTBOMFNyS3lENVVva2lJOUl5T2M0SERwc3A5eWowZmxvUk01aEJpK1JLb0tr?=
 =?utf-8?B?NkRLR2V6YWtva1p6a3pLNzA0bGUra2R2KzZHb2JSdXQ5dlFPWDFtOWNLc0Nm?=
 =?utf-8?Q?Hgh5YkP21IXbPshlOs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea029b9-e3da-4339-9d18-08dc2f14d49c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 17:29:29.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 17:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195789

Hi all,

I disagree with the proposed change, as this is unconditional, even 
though the commit message claims otherwise.
It would be better to have it limited to qemuriscv as the commit message 
proposes.

Fun fact: I can't find this message on the web interface of 
https://lists.openembedded.org/g/openembedded-core

Cheers
Konrad

