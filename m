Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F8DC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 04:07:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.59695.1643774830708192169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 20:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PqXVMbS3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9032c75327=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21242Wj4018417
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Feb 2022 04:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IAvbpY6wTk49ESBn1LjyO0AcnK+FD1V1f7rbJxlOQ3k=;
 b=PqXVMbS3rUipNQGUKAQTvjJ2XMDPm7lvMpzOjXIoHzG44tliz8XON7mZFbhkpabAqxHF
 6Qx+EZ1dA96D763FdPnV/7xg6ov/rFv30dnoHS95oHShSzUASHYdmuhCtgrEaeBODy6r
 81IuolAWajCEW1TsZEu53rNLhFy+5xsksqP8YqZAXCKI9+8deWj95ZTcVADIYolruvPL
 OQeELvLWMNRP5QwL7xvtJnR3QUi922MQoY/gnS3MLDdUxZSC6BQFZ9s2rdWpM51+OaPW
 Io3u18cr8+7lOPPCDhnvUTOr0sePxTVEqIBgBFyWHHTSkwwh5iGngMtpXrpUfxuWD910 BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxfssha2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 04:07:09 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 212478CQ027617
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Feb 2022 04:07:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxfssha2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Feb 2022 04:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLVRJ0RkLsVXle3RYbGTvB/Tai1+HNu+OiYU1ut/+BmGIlKCKRWtlKlqgkcwZtw8qDf5Akvy5ho3eWt+KUNsUrRcm5fvRE2GwKmoMAw5hyqH7b8KzArFdI/5V9cfW+wBRJCYLqAi/8kqdmJtJ5KHzzKr0I4t6gwHtxNbZHJVa3VBseng7RYxGsfjDQNxBJdJf1De6h8uM3pMisqylPlyUJRr80Bg6qj4Zeeq0S5hfMxWjXhuU8TcLfJABshqBGFkA5cpJV0QmZOAKV90eIbi6QZ498HRxDdMBdfC1cqpgvOm5aDupAi1A4z6Jn4N0lfpvqwDMo4BMZQ5/ERPEGOMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAvbpY6wTk49ESBn1LjyO0AcnK+FD1V1f7rbJxlOQ3k=;
 b=IJyJQUmwsjBE/NV1JQsiynvuS89N8LEAvylwDkESm4b2+kJ88Y2WsCp5dtVePkW92mIMFJ5+dadJFeqga4SgTe1vuNlABeQkP2fcg3w+hrOo+sHbTaGS427/NEihvb+xCtgwRv8mv+3JiKIGYlO+Oe2A690KCWqAnNrsJkBSC1Kuky5eUeqFbCGc+Db8Hwu3pAvzKEIfQltv9guRyyKT3IQxX3MVylneT96p2zo7VkYcu/rAYt7/rraGACfoYbsMTgp9H3bwr5eDLLSJu/+RKUJwNd3ex3wSIfcB55f99EdxjeuHMC1yAljpmRrOLHx7Min49I5yl39V/bLgmt25VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN6PR11MB1906.namprd11.prod.outlook.com (2603:10b6:404:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Wed, 2 Feb
 2022 04:07:07 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 04:07:04 +0000
Message-ID: <4fbd26c0-e5f8-e9f1-5933-4e2c0d7c3da6@windriver.com>
Date: Tue, 1 Feb 2022 20:07:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] create-spdx: Get SPDX-License-Identifier from
 source
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
References: <20220202000148.1462-1-saul.wold@windriver.com>
 <f7190e1f3a454459b0d5ffc2202f9626@axis.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: <f7190e1f3a454459b0d5ffc2202f9626@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb29ec11-3f2d-46cc-b99b-08d9e60178c9
X-MS-TrafficTypeDiagnostic: BN6PR11MB1906:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19066C1913F17EE1415562C4EE279@BN6PR11MB1906.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BmrZL3sLesJIMTCNEOu7AriVfgjX/woCbQecT+oeq5U+TPrWx90Wsm+prQw3+RnJzQ1JlBvLUNdd/RmTw7KYMUdlQZ3Bniquoxf/6KMMjmXYQQ7qD1g5gm9myMHfEC92KNRB/SBEkBDMUxGoLFPcFnzcEsRltFD3VJrk3r348Z+mLMBmubgcZaNL+X/Q2Y54574PMBxrgs4sRJk+mccDeldJFEub4D2EWJBPEgOwnBqMxkQkm2HWLl6xuEx1PZsXKQD1xVkcVohKhg7UUN9yFDx+JfZCRAEwSCVZEZbfqnVUJP1a68f/8t/Ch5wttLofC8gza8JauR2DkxqUSJxyYLpo46EB7idgL+nA4WOb8gCnkhvWVDenqaZQZvnnxhE2vvTuqnOJQJE3om7AkXMQY727bubC9uka4qU1S/xOl2ST3dqckqXgE0xIow3Ps3dpQB1njY67eiLYcQsmNXgDRZZ17CPEAqp1DUOkLpLoTnjvoEJiqDUhAuVCw0a1Mjv8slqI0PoQjWo7sO3IdoMlGmoBaJAnz2M/IMdsqVA31AI2IHvGGRDfWd/VvdrB2dv+kYhAwwuHzzYvYbzxnpU5MP0I5wE0nIcHA9EIMHjOFPN5MC5xlBjIy1a+ynhn8rUsyWBwLhmakpMaGnN8MYb8KGj7orhy+zdk026lY31nO2ZsTqqJT3H09oKAXAyq9hULas1pbdo4B6mEHSWy0eBwVg18aZs5Ar3fjqAUMym9L+04YkNx5TLhzUPPjpsNainJphvfOuBE8xf68dLIHkBbzlLwaGWoP18HksAYaYJgYalAKPLaaimv5KboBnYNey7eOjB81lkxoqZHde/LsNpzsT2MKxgKglHDXuNkdiIAyUI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(86362001)(52116002)(38350700002)(38100700002)(53546011)(5660300002)(66556008)(316002)(110136005)(508600001)(31696002)(6486002)(966005)(6506007)(8936002)(6512007)(8676002)(66476007)(66946007)(31686004)(2906002)(83380400001)(2616005)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Um5zbVM1WVFGcGM2cGgzd2tpRERaWjRablZnR1cxRnRRcGtRQjZ0cWV2TVIz?=
 =?utf-8?B?RWxTNWJjMFVvN1RhdjJialZid3ZiUHBzUFQ3YlRnN0w5c2FoUzVhR0FBaFN1?=
 =?utf-8?B?YklsTmk5UXFxMmpHTmFJbUdtZlZHZmR6Uzlvd01JVk1IVFZJQk5LamxWZkZa?=
 =?utf-8?B?R081TFlwTjc4bmR0cENZRmQ0N08wcERYaUdDUFdNY29xeVBqYitCU2h3SXFx?=
 =?utf-8?B?UzJsMytwMUh1aXcrRk9selkxTWpDNEF5ZTFnMkdnWFI4QUdEOHJ0bTZLRlNG?=
 =?utf-8?B?SFZhYjRZZnJNMDA5a2NmUEdKeW5NeXh2YlRybDRFN2lYU3dvbWE2UlZXVWtM?=
 =?utf-8?B?dVAzbFhiOU1RU0xuSnkzamxnQzdJNjNoS0pUSnJ4bnZNbUVaRDlvMVZJTjlN?=
 =?utf-8?B?YWhHbzBLbjZGbHNmRkwxZ0t3ck5uR3ZPTk81U0x3MXB5M2xZNU12ZVI1bm52?=
 =?utf-8?B?TkhvbWI3SVJzcEtZYXVMbzRiWnorbHJzVVZnSUw5b3BBd1RpK0g3ZEFPUEwv?=
 =?utf-8?B?N1E1K2Rla0NsZHlhcExLekc2TUFTNWtVYnVYVnlrc0ZORVA0NGcvREdhZnpy?=
 =?utf-8?B?U3BKak9SRkg4YmJQWTBwbjdpbFJuWmJqSCsxWXlJNkJyQXRiUnp4MXVJQUN5?=
 =?utf-8?B?aFFqMmlDbi9Sc0o0LzlNYUdVVEM1cWxuQjBtckM5d2VCZ0xxL2lEeXV5Uith?=
 =?utf-8?B?NWhka3gzWWZSK290dVFsaTRDbnUxbkkvdzc0aW9yVG5rY3RISUhZK2RodUZv?=
 =?utf-8?B?YjlKNDV3aGVjL0xERCtDVDkvQ2NkY0VsRFlVOWU4UXBlSnUxT1VYN01EYk1N?=
 =?utf-8?B?dm5DWUlCNjBMVTFwVllYdnNPWUw4Y0R3akN5eEdMeUpVZk9ON3Q2V2g2UDFp?=
 =?utf-8?B?aG4zdWVTbUlSRnExaGJWQi9KRUh1R1d2cEJvTUhtbzk3a0hwRVJ5R1QwYUcr?=
 =?utf-8?B?T3lzY3l5QkM1VitQTkMvVmpjME9xQ2pJMFJKU0w5YnNZRFFXQi9ZNjB2ME1u?=
 =?utf-8?B?a1pHYkMvcld5TjNTbzg0YXBuTFd3aFl1SEdKYTJNZGVKNlJQMHprQ1MzUmlx?=
 =?utf-8?B?MWdBWVZRNWNOSGVXNnM4azgwQ3ZmbHlqWGp4SzJUTnR3VTdRYzlSSUNtM29n?=
 =?utf-8?B?SWRuWGRvaGdpYmxpNmdmUjBJSldWVW1EWllRZWVqaE53RFBXd1prUnZhSVlO?=
 =?utf-8?B?RzVTUFdPZDRqZTkzbkh5WGFreXYrOUpjTlY4WmRZODFxcE9hdy9sZjdQeTZw?=
 =?utf-8?B?Z0h5QlFJTjI5VTc3MVlWNHBDU1lEQ3g1S1lUQUh4bVIxK3hPdUZWZkszcUZo?=
 =?utf-8?B?bmVMS1BCbjdJRWlSekFHSUpIWFk5bzFyTEZCUnJTUStnU2FPODUyZ2dlR2ds?=
 =?utf-8?B?V2RRR2F1eHNZdnlkN2FrYitpdHJpb1oxWE43bGlVNG5LN0cvdDRRbXFQdW1s?=
 =?utf-8?B?T2N2QnlZR2lRZ2NlbVZ1ckdkMm9lQnlRUnNYNnM3cVJjNHI2SXl3dENxak1J?=
 =?utf-8?B?LyswVWZLZTI0ZFloMDB2OUo5RFFMQzJxWVRnVGFQQVQ0VWlNbjM1R2xpa2Er?=
 =?utf-8?B?dm00NkJ1eFNSYWI1M0NnUGdQaEFBeGZ1MXRtbXUyVk5mUWVvcFVOVkJvR0Fq?=
 =?utf-8?B?NG5SYTllK3lDamI1bFNXVUR5WGZoZEdjSEptdnp2SEpIRkpXdHBoaHI4MVM2?=
 =?utf-8?B?WEdmOTlCV2ZDNm5xRTJMSEpKMDBodkt3REhQdTR4ZWpsbkZoME9pUnB3dFlH?=
 =?utf-8?B?UHduWXFQaXFPb3JKamRZblFZdHNHWkY3Z1NsMEo0aXBWSmh1Z1Y2OW5ybXFK?=
 =?utf-8?B?Q3JhMGJzdjk3Z01acW0wR283dytrU1V6S1VkTjRKY1Y1ZkRicVBXcUVJYU1H?=
 =?utf-8?B?SDFKTXRnUlByN2RxSHpLaWY0VkZRMVBTVjVnT0VzalgvNTdXM3ZpeUhZZkJn?=
 =?utf-8?B?NlJrc2R3eUticTR4ZWZYMmpFWTRnYi9lamtTTUFSOUVVTjJpSmtrTlVMZ1hm?=
 =?utf-8?B?NjFid0hBRmRPUXdVN09JbWVML3VLRVJOYW1hTXBkTzEyUnlFeTFxK2R5RUxj?=
 =?utf-8?B?UUMxQSsrUEJiS2h6aGc5Mk5XOUpQT1pJMmZVUkVPWXBwV2JWY1d0UFBnOHZX?=
 =?utf-8?B?WE9MWXF1Vm9iRnJhUitqOHhXTjBBOFBaclJVRDcxTXZiMFp6Zi96SHdWWXNJ?=
 =?utf-8?Q?DVVd4R7YF2K8cmlNTSWX2lM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb29ec11-3f2d-46cc-b99b-08d9e60178c9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 04:07:04.6883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L/IPt7G2s0AOvSN4+iNpduZcWW51pf6SpDssiHpZWO8FaVuaw7AfndewIKCDte1HFhaaIhIj6ZKhKZ5SoC0sLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1906
X-Proofpoint-ORIG-GUID: QlWC3F9ZPuFZoJlXTzhJp9pGArr3915Y
X-Proofpoint-GUID: gLCIyGmDpn1M9gHuqoqQzzNBKb3dE2lS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_01,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 04:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161177



On 2/1/22 19:21, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Saul Wold
>> Sent: den 2 februari 2022 01:02
>> To: openembedded-core@lists.openembedded.org; JPEWhacker@gmail.com
>> Cc: Saul Wold <saul.wold@windriver.com>
>> Subject: [OE-core] [PATCH] create-spdx: Get SPDX-License-Identifier from source
>>
>> This patch will read the begining of source files and try to find
>> the SPDX-License-Identifier to populate the licenseInfoInFiles
>> field for each source file. This does not populate licenseConculed
> 
> I assume that should be "licenseConcluded".
> 
Well that depends on if "we" want to take some "ownership" of the 
conclusion as the "preparer".  How would we handle the case of 2 
SPDX-License-Identifiers tags in a file, is it an "AND" or an "OR"? 
Simple example.

The description of licenseConcluded is:

"License expression for licenseConcluded.  The licensing that the 
preparer of this SPDX document has concluded, based on the evidence, 
actually applies to the package."

At somepoint we might be able to fill in that field, but for now I think 
we leave it as NOASSERTION.

Sau!

>> at this time, nor rolls it up to package level.
>>
>> We read as binary to since some source code seem to have some
> 
> to -> too
> 
>> binary characters, the license is then converted to ascii strings.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>> Merge after Joshua's patch (spdx: Add set helper for list properties)
>> merges
>>
>>   meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
>> index 8b4203fdb5d..588489cc2b0 100644
>> --- a/meta/classes/create-spdx.bbclass
>> +++ b/meta/classes/create-spdx.bbclass
>> @@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
>>
>>   do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>>
>> +def extract_licenses(filename):
>> +    import re
>> +    import oe.spdx
> 
> You do not use oe.spdx in this function.
> 
>> +
>> +    lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> 
> I assume you meant:
> 
>      lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)(?: |\n|\r\n)*?')
> 
> Not that it really matters though, as it will yield the same result as:
> 
>      lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)')
> 
> However, neither of the expressions above will correctly match all the
> SPDX-License-Identifier examples at https://spdx.dev/ids/#how.
> 
> Use this instead:
> 
>      lic_regex = re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
> 
>> +
>> +    try:
>> +        with open(filename, 'rb') as f:
>> +            size = min(15000, os.stat(filename).st_size)
>> +            txt = f.read(size)
>> +            licenses = re.findall(lic_regex, txt)
>> +            if licenses:
>> +                ascii_licenses = [lic.decode('ascii') for lic in licenses]
>> +                return ascii_licenses
>> +    except Exception as e:
>> +        bb.warn(f"Exception reading {filename}: {e}")
>> +    return None
>> +
>>   def get_doc_namespace(d, doc):
>>       import uuid
>>       namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
>> @@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>>                           checksumValue=bb.utils.sha256_file(filepath),
>>                       ))
>>
>> +                if "SOURCE" in spdx_file.fileTypes:
>> +                    extracted_lics = extract_licenses(filepath)
>> +                    if extracted_lics:
>> +                        spdx_file.licenseInfoInFiles = extracted_lics
>> +
>>                   doc.files.append(spdx_file)
>>                   doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>>                   spdx_pkg.hasFiles.append(spdx_file.SPDXID)
>> --
>> 2.31.1
> 
> //Peter
> 

-- 
Sau!

