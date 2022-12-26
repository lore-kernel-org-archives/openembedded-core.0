Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D118C4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 00:13:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.127152.1672013631709428916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 16:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VwvQec6d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93591f022c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ0Dove005664
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=071UX5HPitRGKjAI9WTKQjmaNEUyRA5PLoBg7dTgMD8=;
 b=VwvQec6do0oJr53q362H62tZtlt0EK/vcFfEtxf9Afad9T9OQtSHg0siWuvR/Sy3dNgJ
 H/4zB2f45AUTjKV141UGWDhOczIJHkfzD7/qOjYq11+66dXk0gR4pCIF4Xi99BVkRVx0
 cZ22YMDMPddhC4S84TO4q/wHyLZdzA4sx+Vm3djD3rrTPs37vkOQ5NIEEaTvYSvZIW3t
 OAsNQnIvHiNp7pg/5I8OWKGlZVL1Er3ATG2lv3cJgpavutQryIch5uVPMAj3QoVzvm0s
 NADHM5k4iy70TEwuJOVVRtr11IrCnoR/+VC9Drw3bzofSvrI4ViJtYklYb+H/SUfdvZ4 FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda0wcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:13:50 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BQ0Doq7005658
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:13:50 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda0wcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Dec 2022 00:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hR/KRe/P1bu96LXxZjsV2n0kNY/tjMDD9nys7NW72psexPHXSL51IwtfdwV1z9Kp7kgGBFi3QJX2CnG0LbvlRQPMcPyp72bOA4RjDP/XtsZWWSCwsT/aAkvNVHhHFqdrFPoJCO9nUAeO8lyXzvzPHggMFNqSltMEPwZv9tRtoxFywAckWOrSPmzrkq2adHWGQ9AL72axXqgsQL3Xzsq0wig4hA6UXv46Si9fJTHzMEKZZCX2ghYWigGon54z3VH0azEL4BFf44FRC+H2SQRauVFoQp1oT78F4yrx9qqe2sfND1TQ1TeZaSqZ9CylMN5hkdcU6O3KA2B0Trslp+l7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=071UX5HPitRGKjAI9WTKQjmaNEUyRA5PLoBg7dTgMD8=;
 b=POcwkzKpvgZbvnR8HbjoNcOW5/kI/e/U33xyaUQ57eClcaORxd3LAI8J2b2TzHnIAQUqJvZnhaXBkMA9ipRf0WBhhsaUYtiFxsX7huuNFgtFUyyO4uZZShI3uO9ALRC9QUut/bk9vOa1OdNscHM7rcrGksFcB3sAnKm491I3rBevVvFHI36rqu3i7O/J0N7SIZ9yB1iBfW9dRfNO+BVOCIze/7SkPV3M0at0F+WruFcAm3TNh/VmkISVx+e+vTrC/NeC8JkEey6btsULfkBlajExjZrRlpEwJud2SB5fLi7nszZ7P2ZT3Iu0lU9GzgLxFEBCPUi10VUH6NPWVo9wNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH0PR11MB5362.namprd11.prod.outlook.com (2603:10b6:610:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 00:13:47 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 00:13:47 +0000
Message-ID: <95441494-5a98-6831-3897-83e58dec8fff@windriver.com>
Date: Sun, 25 Dec 2022 19:13:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
Content-Language: en-CA
To: richard.purdie@linuxfoundation.org, Chen Qi <Qi.Chen@windriver.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
 <Y39W7D6ps5v1cCyn@mail.local>
 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <Y39rTVzD41m41oyP@mail.local>
 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <Y39zIuEp2//QoOxc@mail.local>
 <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
 <CO6PR11MB5602D48B1A9960C0E627C2F6ED0E9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <a6c3d013926c1c18e41efd9f860a2c74f6155470.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <a6c3d013926c1c18e41efd9f860a2c74f6155470.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:74::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH0PR11MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebea4d6-82fd-4cbb-0bf5-08dae6d60ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x8HY2ITYhwsqn5Vay/Uh5gdjJEwjIj6ChjS0LxdCHjGl+uTsK//7ZnGcufInuwd9Fkfq5/UdY5HKFur8yKIUk/8oejuYxRiy0nEUcYKd7/W9TAVD/8SybbLGpuTAhgClbWgaq6tQIo1lUP2scM8hJlgiEmQ+KZ36pqF5xDJy8apeZ3B5imBOWkpzKlF6+CmGqROlnAbMK9YUxR9Z8wBeusgOxRCMazQWENdhJx2Rt7+na9wYjfOnVYSG0ipA57XmWVFRMrL9OfGoNfmBiSpvQmnqEb0C3Xe82dy0wwP/EHp8wJKo5hmNR+KRnSXUNUyvRj6ATT6Kr/SiZVHD75u0LM1TdkRx2heR3+b+a1m+mE+ezs7HcMcidHAHTnRyWso+tIUUHFOPTQem+9xLfQ91sPzcNTmwQQAydIC7CM2rT6FIN2M9ALweRFZfzpiaYQqwhBD7YaKB9TiiQQFPkiDCs2VyjmfUkrmIi/hvES3hlmUiQ8b40nEVM3XPaOCzMjKGjkZfxJGf0v6p697syZWdh2MDw1/xofqNF8gU+e2zFpwyJz1Yppg9efQSmziD9dtCLEmm+h/ZRPDmO2Sm/CZFyBbwSTMco1hzAKmxlRjVXpxfA7PCIyMeTP3oRH6xX00YxQHe5QOiri4mAwCuS8PxhkKPFr6RSXv8Cr6Kh7MwZQenyplDEVukZTrEezWpuOKCjz5KFL13eyuNv+Sp/9HAMBL6fRpsSzRRpkSCQml6UAcgbVTxlbTBZ3XOWQv81N3KLBQ+OM5fP51Jp7cHmwlPO/i54R54tdcOdrI0DrZBCHo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(451199015)(66946007)(41300700001)(31696002)(31686004)(66476007)(66556008)(4326008)(8676002)(86362001)(5660300002)(8936002)(66899015)(36756003)(316002)(4001150100001)(110136005)(2906002)(83380400001)(6486002)(966005)(478600001)(6666004)(2616005)(53546011)(26005)(6506007)(38100700002)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUl2UVN6a1A3SlVXLzA0LzMxMnU2M2xsY0ZvZ1RlMkliUGNXcWVRRGxCREZh?=
 =?utf-8?B?UlVlSkk3elR3T0NqRW9HanB1TWlCV2xjV3dzeFFTanFyeE5yemdXRjhWKys4?=
 =?utf-8?B?a1IzSk9NNFlqNE13TmMwWmo1MTBOSmxvemNqM2ZoSURWelFhUU5McUdHTnZj?=
 =?utf-8?B?dlN4dlJUcHJVaFAyZlBacHRsR0I3NkQ3OGJ6N29vRkJPdUFONVhsT29HZlZk?=
 =?utf-8?B?emtPVnk4TWdSdm83eW84ekVWWFp1eHR5bzRzZEVDVzRzeE0vVGVXc29qL3N2?=
 =?utf-8?B?N2R4QjFOdFZRUml6MmZscGJPVWJLV1cvNDFnRkt6NTVsT05sTDBYZG1mbWhT?=
 =?utf-8?B?WCttTkNXS25sYVhKbzdiWEVzYVJxbFJhQVh0M1hKRzJTNERUeUc1amtCakRx?=
 =?utf-8?B?WDFSazc4QkRtaGw4MXdJL1cvaHlYZkMrV3I5RHJIQ096TzJqR2dXYU9teG5E?=
 =?utf-8?B?ZlRUajh6K3Z6THdIMHk2WTAzZTk2a1JTbzlUMm5KbktIeWoxYkVqN1BneTBh?=
 =?utf-8?B?cDZxRUwzaFcwaWtweE44Ym9GaXU2N25CR25RSzBRK2NWTHlyT0dzNzJxKzI1?=
 =?utf-8?B?eko2Wnpid01GdmNCQUFGc3NmbUpyRkFJeGwxLzRyTXNMUUR1ZU5yWk9CcVZs?=
 =?utf-8?B?NFhDbXliZjA0eFJnYUZpbElEbGVOaDVZVVdVUU1JY1FMT2ozaWRFOXcwL0NW?=
 =?utf-8?B?N0kyeWNrb0FOSEdKVHcvdDIwQVlodHdhaHVXQnlkdWFFenZ6d3YwZEMweE9S?=
 =?utf-8?B?S09RMi8zQzdPWGtoY2FRaDNrSDczZHc2K3R5UDJyY3pnaEFrb2g4MXYvV2dW?=
 =?utf-8?B?NHFvMmxqVmtlSGYzYU8yQnlqbFI4SWQ2M0phd2lLS3o4LytkbHQxbFBQZWpX?=
 =?utf-8?B?SkFwSDcwR3Vka25NUTA1ZFJUenp1Z0lUQTVqMTZmQ0J0RVRDR3lodXJHVDZv?=
 =?utf-8?B?Zk1RRjd2a2crVWlNVE42T0s4SWNPNnpNeHJhR29lVGwraUt2T3Q4MWVISldk?=
 =?utf-8?B?VTdoVDNoUzMwRW45cUVLOTVtbm00bFpwdTkvS0JXL0xVeUk5YmVPREhBazJD?=
 =?utf-8?B?N0k5amMweU1UMEpXK0lzY1FjSlI3QVR2NE9xMlcza2dCaGx2eW9WZmMwdFhv?=
 =?utf-8?B?QzNTVXU2cHl3Z1U2WTNaRDdnZzlKclUybFRiNmpPOFNjQmFXMnJmcm9yZUJC?=
 =?utf-8?B?VkpPRHZIdjY2Q0lzY01TT1g1KzFLc1B4UTlGejBIVE1oZDdxZ2pjSUorRldy?=
 =?utf-8?B?UnJzRHVBV21uR1JWWGdJaFhJcmxPV1hYVmNKdDUwamdnUm9iQkRpanhaV2dH?=
 =?utf-8?B?UVFXNVJoWVdDZmlTdWVCVXVDRllta3BQT1E4d3JZTERGemQ0bW5uZndmNXRE?=
 =?utf-8?B?cTU2c1pEalBCeExSc1V4OG0rTGk5Wlp4NXdYRWxWbW1DMVJwMS9zRy9lZDFM?=
 =?utf-8?B?ek5uRitPNDVBY2dtMjFJTzZUb3V3ZDFoOVJtRStUMG9qdkoyNGdFdll6bnp6?=
 =?utf-8?B?NWRpRUhCYXFIc1g3TkFPeFlJcERubWNNa3lMOVZYRjZqR21jOEpiMEFTM1JD?=
 =?utf-8?B?VG5YbnkwbU10bytIZUVjY0VFMVNzRndBY3VNNGRTWjlhd2hzNWxMZ2VaUXFs?=
 =?utf-8?B?aHd2T0d0dko2Q3dRcFVBRHNmaFUraDN3aWMwM3JSSmdQZm53UVVxd1Qzcjd0?=
 =?utf-8?B?ZVd4T0g5MWp0c1puNzNYeUdXUGxFV0tieGhvTTBwUWFTSWF2dmxTTXVhRmxq?=
 =?utf-8?B?ZUZuSnptRnVsZkJVc1lHNVdNSU1EY2FncDRaWnpROFh6ckNqcnJIM21adk0w?=
 =?utf-8?B?cTlBTWp5d0NNQjlNVmlSTlh5eWhRS3VKWC9sd1BkV2w0TTZKT1liYmFnNyt2?=
 =?utf-8?B?WFEwemFGbTlCRGdYb2J4MW9vdUNjNkhkd0d3OXl5bGdORGdNYWxqdHJUMTBr?=
 =?utf-8?B?WmlVTzBOeVJzK1pQR2xxRndPbFNST2RzTS9Mc1Y3YVJabEVpWHV1VWYvTUpN?=
 =?utf-8?B?bnNIYnZFbXYwNGcrTmlNMytwbzhXeVhIamJYUGlhdzlsM0s4MzllemUwd3hX?=
 =?utf-8?B?aGlDNm96MUhmQ2VRZjJnOEp2cUg0QmR5OGhxSERYOXk2bUZUQkNBeU9UazFQ?=
 =?utf-8?B?c3FhY2sxKzhjOVpTUHhiSWszVkxibE1pMmZZNFBEQWhQQW1rU3VYQ1F2WnVP?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebea4d6-82fd-4cbb-0bf5-08dae6d60ea8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 00:13:47.1817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey0IXTIhkOA89JQQxC5h1OtiCMX6HWBNnY5v2lbPJ9sSgN/jp27gsBUdQTzw7s2JfH9qq7VewhNSb50dKXlqk8Cn9KvRprzSN9v4Fl+mVB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5362
X-Proofpoint-ORIG-GUID: r7QmrK2oHjhWU2PmNt-NXofxFcIQzeX1
X-Proofpoint-GUID: bvc5oL36CQ5XBfAYLLTukVETci3NR3h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-25_19,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212250211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175007

On 2022-11-25 08:00, Richard Purdie via lists.openembedded.org wrote:
> Hi Qi,
> 
> On Fri, 2022-11-25 at 05:56 +0000, Chen Qi wrote:
>> The AB is actually running 'all' tests.
>>
>> The '--skip-tests (-R)' option means 'Run all (unhidden) tests except
>> the ones specified.', according to its help message. This is also its
>> actual effect for now. You can see there's an implicit 'run all
>> tests' meaning in this option.
>> The '-T (--exclude-tag)' options means 'Exclude all (unhidden) tests
>> that match any of the specified tag(s)', according to its help
>> message.
>>
>> So the AB's oe-selftest command means: execute all tests except the
>> ones tagged with 'machine' and 'toolchain-user', and also skip
>> 'distrodata.Distrodata.test_checkpkg
>> buildoptions.SourceMirroring.test_yocto_source_mirror reproducible'.
> 
> You're right, a different build has -t machine and I'm confusing the
> two, sorry.
> 
> I don't really like making changes which require lockstep changes to
> the autobuilder configuration but I can see why we could do with doing
> so here.
> 
> I was thinking there should be symettry between -r and -R like there is
> with -T and -t but that also probably doesn't make sense when you think
> about it more.
> 
> Alex: We'll probably have to work out how to make this change...

Nudge and Happy Holidays.

../Randy


> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173766): https://lists.openembedded.org/g/openembedded-core/message/173766
> Mute This Topic: https://lists.openembedded.org/mt/95231396/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
# Randy MacLeod
# Wind River Linux


