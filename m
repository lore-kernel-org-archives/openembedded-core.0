Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD46EC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 07:37:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19296.1644219472748654838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 23:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=BhC6BZB8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9037c3f122=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2177NrjM019690
	for <openembedded-core@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:37:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=31tDYJp2pRW45r2x4uHq6LeE6vf9Mcm0ushtPceh2/E=;
 b=BhC6BZB8zdD/xJhrf1DwJ79CdGr/PQZ4e/fvtbtgjGUiKPCFqEOhdW3gUVfcTRrxrmRy
 MdTkm3zgfDaz6A6FIs6ftj17GhduImtpOsJF4Z1UMYms5I9aHpXh4ICaeOw0QdiLGXJF
 SubQd3Pv9t19S7uy4kbJoFPV2MyS0/xJ6n16NJXtSJ/gOeT3b8oAx1orbH9VRMD7eCrQ
 IZy3uW0zYYwabJum95oI+tQIg0rKeVVMiypwk/hFPn2Q1joDtBggRFDmiIGDUk9/hu/E
 fmsIigWrqfaoGJ1BLd37qJZdVZNu4Si3SSgzIEoUYN0q0fzUHdxnJHmF9C4g6PUsWq+0 TQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e1smprxt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 23:37:51 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2177aLV3012090
	for <openembedded-core@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:37:51 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e1smprxt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Feb 2022 23:37:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmgY1t+oaPRL/MD+i9tUaztOYDLgxcfnfpXweTgFJ1bGTSA0HLYjffyFvyKA6h55mtKsSKcg8Dzd+AL6HI3vAXwxrCMJpX83m7hRxBpAKITPluf/tI2qH1rX5QX8MCgB+eJt5SqcyMUnNyqZa127sReZXk3txPcR4P/1gdQgb9dziI7kVb5jivwLbuo6aiiiY3IBL1hKLr234+OQlzhg5bYpoH4R63Du+Yz79qYhxwnvVJJQxdqPag0jRN59Ei5u98yJyM8CxH4SXTrGiQZJwNgk3r+ML4kHn+RkrcAtGn1/L6ZEQ77F6MuR5okLR3+NFZIS4F3vVUANH17kJvPMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31tDYJp2pRW45r2x4uHq6LeE6vf9Mcm0ushtPceh2/E=;
 b=ZOIwO5RDckZd4ZpibUztsvs2BWk8OAARdGGs4iPozC3bxnCiabZEToYcAjbQwaQwG1jbnJ4D/a3+to0ceJJ3APWwWMDKgo8hs5f1+MyYOiKJXZ4AkEKzSoSgJfcTQROF0PxJCLRJdaq76ArklhmfOXDSkwyDG0TVOYFtviSjFylJH2Z8JxhB0O57YF1fguTT9Jtiervak8YRnVcxhXprHKRR2MWA2C/OTXYa+Z14FeLrKJnAIEqmiF35BLK8JXSLhkjuvN8bup1jQjmwL44iGhJvAkNFB1oB/uyfAMNbwNMRgDw9LODqpRUmcs8u21pYuyj62PzBhrL71KPPWyjcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN8PR11MB3825.namprd11.prod.outlook.com (2603:10b6:408:8f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:37:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 07:37:47 +0000
Subject: Re: [OE-core] About the sstate cache directory hierarchy
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
 <CANNYZj8-SNPbD0Mbmbe-BovkrDTLH8dQYijvDjoqPDo2Mnjd=w@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8fed915d-6adf-42f5-9830-4b8e48862d52@windriver.com>
Date: Mon, 7 Feb 2022 15:37:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj8-SNPbD0Mbmbe-BovkrDTLH8dQYijvDjoqPDo2Mnjd=w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------971B35415BFBBF8E90541258"
Content-Language: en-US
X-ClientProxiedBy: HK0PR01CA0062.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc97d1fd-3e93-46c1-5cf3-08d9ea0cbc1b
X-MS-TrafficTypeDiagnostic: BN8PR11MB3825:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB38253419D6FF6C7C50D46008ED2C9@BN8PR11MB3825.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2djSjRtQzJDRjZ5c2ROWmtIV1NqWVJ2aGNVbmpJN2huaWllWUtYd2x1UUZj?=
 =?utf-8?B?UXFxbU5OV2Y3Y3RJdHVDQXhQK0VEVjR4dDZtOHlBRjNGU1dDbVZMWTNKcjIx?=
 =?utf-8?B?dGkrMWVsc1ZnbWh6RzdtMkJFcGkyOXBkYXRvMVcyRjVEYjF4Vm5OSU1HNytU?=
 =?utf-8?B?T3FlejNUaVBhN1JYYkNHaWNJdjE2eGxXd2VqTUw5bkgycGswU0gxTFZaSUZy?=
 =?utf-8?B?OEphZ3R3SVFUendrTXBFSmtZZ29OYnFzcUdXREJFUVdxQmRhMHhZRU5JYlpS?=
 =?utf-8?B?cXpRNlJ1TDFhRzNKWUFOOWJDZ294NXNrWFdKVTNvYXUvWlh5N1F0eFBWQkpr?=
 =?utf-8?B?SE83SVlPVHc2K003RWJObTR0MHR3VUYrQUlTYmgya2Urc3J1MHI5U3JtZmp1?=
 =?utf-8?B?dWxnKzBVV1A3cTlsZEczQzZ6YzhKaEcycGtkNmZpNmpyMkNOTFA1blNlR0Np?=
 =?utf-8?B?bTdPTFB0Z0xyT0JHeEZtazNjeDBhR2FrcEYyYW50VDZEZ2NUb3VGUGxNNTRv?=
 =?utf-8?B?SkE5cVQ1dWFmd1FBUWZKMjFIdG8vMzNJVmRTeVFKeERRbnU3MUxqYU1OY05a?=
 =?utf-8?B?UEdkd0xoNUg4cFNSbVpZMzF1RnV5dVdtaE53aFlMRFNXQmprMXJxaW8zNUdt?=
 =?utf-8?B?cEJZb0doZGlQblZqWFhVREJoem5Fei84R2FBaDdrRWp0WlQwVS9rS3pzWmJH?=
 =?utf-8?B?UVAzVVloRTNJblY1aTN3eTVmN25OVXVtamZIOWFPcWhveklSdnFOaC9iYjRY?=
 =?utf-8?B?Q1JHZkh1R1o1elg0VUlMVHpEejF3QWtRaGd2VkFXNXYrM2tUdmlzZGxxMGlQ?=
 =?utf-8?B?anFzaEVEcjlyempuekxhd2VmdmxpMTluWVhlSi92MUdnbHNDQ3hSYTJxWmdy?=
 =?utf-8?B?dVlLT3pxV3M1Vm1BNmI0WkFEQXJnN1oxSGZJS1k2anJVWnJ4UHV0RzFReVRO?=
 =?utf-8?B?TndzQ3NqKzFWcUdDM2hHV0dZeWp0cnl6bm1ZbVdQTTl6MUxXNEl6clpPSWRV?=
 =?utf-8?B?TkIyM1N1TWJkUG9weVBkSGZyeWJBaGZOMVRSZGtXem4wS2JwYkJtUUo4UWJm?=
 =?utf-8?B?QlFvcDFRcXdDYnpTdWRJNVhuQ0N4MlpTNmdtdG5sRFhhUitPVldiWGVYRlBE?=
 =?utf-8?B?eGtsb05mYS9md2pTRElZNHNOaXhITlZsdUJzWG1rZDlaSlFvMmsyei9rR1ph?=
 =?utf-8?B?RytUcTBkV2xCN1FIdnZSTUF4OHg2NXh5NmlEbjdOcTV5Q0dYM0V0RjVha1dW?=
 =?utf-8?B?TEVmbC9LY1JpcU90RzhHcVY3bUllUFdJSlYyYmU5cmM3SHhHdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(186003)(54906003)(6506007)(316002)(33964004)(6666004)(6512007)(6916009)(38100700002)(2616005)(2906002)(31686004)(53546011)(52116002)(38350700002)(31696002)(86362001)(30864003)(66946007)(166002)(5660300002)(508600001)(83380400001)(8676002)(8936002)(4326008)(6486002)(66556008)(966005)(66476007)(49910200005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1Y1MThkSmdJV09hbk9WQkxaTm4xMEdvdDlXalhBTmNvK2JMN2p4aWVoeU9y?=
 =?utf-8?B?V0JLQXo4Z0JpVElxMFIvRUN3eWZoOE0zZ0R6eEFlSUJhTmwwaWRkVllWaENi?=
 =?utf-8?B?RkJuSEd4RmoxWGVyb2N2eVJuVmhvb0tYTmJnNjhTZjR6Mzh2eGpiQ21yZStP?=
 =?utf-8?B?YlNrdUdCWG5Fc0RtSkRDN2JvWmMra082eXN4ZFFRWXBMODFYVXROS2gzMExp?=
 =?utf-8?B?RUdIL0VwNFl5aEZxbGZTdjZ5STN2L0RLSXloMkUzZ2VnRlR5UUFhTjJ1dTZR?=
 =?utf-8?B?dlhUVDRnRUJ3cmU3cmRWYVJWRUswM09CRHR2VWd1UjZBUVhKK1lOa0FwTUEz?=
 =?utf-8?B?cko0MkJwb215U3dCWnhVSHVnS3lkdGYxM0ZCbTJMNEQ5UGhhZW1Ob01ZMmxa?=
 =?utf-8?B?d3IvcnpTaGQzVHFtUE1IUEQ1TE82QUY5NkdHOGJSOUM1cmR5WkdCNHBLemg5?=
 =?utf-8?B?aDNHZ1F3V296bTNBTHFqdkNWM2tBMlFxUEZSc0VHVXpySGtLZktPa05xRzFr?=
 =?utf-8?B?eFpMc3ZyUTN5MnVnNUJnSFJBeW1HS3VMamI5ZlM2SEtPdy9JdG9NelpVS3RM?=
 =?utf-8?B?Z1dFdE9GSk9jQ3h1SW53UE9FUUc3ODRzazQ3MERYTGRqVWU5MTNqeGpqOXNL?=
 =?utf-8?B?azFNaVFJOC9ic1VWQnEzY0ZaUldGb1FwLzdYd25qVU5Rd1dGdjZMazVvRUtN?=
 =?utf-8?B?MS9ENXNRL0R6emp0NjBuamlVVTJZM1RONjZyclErWTZhdnhWQ0hTanh5NTgz?=
 =?utf-8?B?Tmk3SXBORks0SUVqYVcveFlZUktQem43c1BFTHd3VVJqY1plbWdXa3lndEt1?=
 =?utf-8?B?YmhNMExXLzRnK0xQNkFvZVlTVjV1c2Y5YXZlWTdaam5FOFZtUHJZazdaQW81?=
 =?utf-8?B?NU1pVlJYOXpmanlGRklURW5DeDNBeHphZTJjSlltMlAyMTZ6cE93dDhNUGta?=
 =?utf-8?B?K3JyN3hRQU1USktQYitLTFpzVWhOdFVadXUxeTJ6YzB3QkMvOFBGY2liMkY1?=
 =?utf-8?B?c1RjOGJQTGpYNEpnNlZLN3J5SHQ0ckt5bVIzc1lnMVVEQTVRRDBzNkFFYzND?=
 =?utf-8?B?Nk8rY2ViUG84R29yRS9FblRlbUhIMFVvc3ZXL1lTa2tmUkZ1Z1FOMlBDSk5r?=
 =?utf-8?B?U1NzUXNzWXlsR3hnWC9VVzBZQnRjK3ViMXh5R2toMFV3TjJoUG15YTFzNDJt?=
 =?utf-8?B?SUl5cWFDY25lSzB5RzAxMUUzaDZTdEdmWG0rTU1QclEwZjRTOHNHSk85NHAv?=
 =?utf-8?B?OUdZQ3VseFJZc3VpM0kvaXEvNm4vTDdCUG1pVHV3NlU2clUwa0FRYkVZWW50?=
 =?utf-8?B?L25hMWFTbFhZRUpXbnNMQzhiOEZvcUdCWFVDUkJQMmtXbHlkckRQMFI2emNZ?=
 =?utf-8?B?WlN0VW0zT3NTcVVzRDFLNmh5Y3FnS2V2d3dLUFpkc2cySmFWRFlxcG11Ly9p?=
 =?utf-8?B?ajMxM1Q5b3JMZXQzTytKbEFFRzIvNEU2S3ZTdnRFeVlRaXdUVjgzSitLa21v?=
 =?utf-8?B?MFFpWm9HQk1sRFJYMDVwd09FYlRYb0g5eHJ3SzlvOU9QclRBYU4xdGh1Z1h1?=
 =?utf-8?B?czdHK1RIbmtVUmdWS0dEeU45STg4b3ZtN2ZoSk9EK3QyQUU0eE5kQTJZWHFV?=
 =?utf-8?B?Nmt5M09Mekgzb25Zb0VwbFhJOTYwckRoS2NzQ21XQnhMSUswVm1LVWo3a2ZR?=
 =?utf-8?B?MzBUcWZIUFpiMUM2VVFJSFZUZ09iT2ZYSDNMWGNCaUNlMXRsUGhHalp0VTBN?=
 =?utf-8?B?NUNUbUtVbEVZZVlBN2tYeUtmN3pmZ1NLN0FEWmFQQ3lkUXF1K0p5cEE5NEZQ?=
 =?utf-8?B?N2pabWF2bzdZS1MrendUMG9kWS9qK0Y4Z3YwTVl6K203bjVLU2dTUnJyZ0cy?=
 =?utf-8?B?OHJIc0tDbE41KzhlQVJCSXlnZHU2TnowZDZZNFZWVTFOVUh0RXF0Zi9HdE5N?=
 =?utf-8?B?bExzaE1CZ1BvbDZnNG1UU0tEZzJ2UUZXdUZhc3hhYnhscGxpWDZlTU1scnpi?=
 =?utf-8?B?QXRnZTNwQTh1SEFUZTNFbWdTbFNSN0xnWTdZMFF6aHdxODRKUHdDNHFSVGNi?=
 =?utf-8?B?bWpGRkR6U0dBbHNrZk9DYUI2RlJIKzhxMFhvdy9WcVVkNjVGQVRnbjBrclBj?=
 =?utf-8?B?Nm9tbEtreGpkMnNHOTZWS24zemkybWZTdmpSNlRPMVJ2d3puNVYyZlJjTkww?=
 =?utf-8?Q?z4sTGSkc4le2Xq/h98GE2Hk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc97d1fd-3e93-46c1-5cf3-08d9ea0cbc1b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:37:47.1651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x/jNNQq18cvirWG/tlumqzqr/8w+GaQMMfc7X1K5BZnxxTDdMMjofJ5XPAm/g8CxdY3iBhGyNfTGfIUkK1K2Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3825
X-Proofpoint-GUID: -HLlzQzvBatVViLL_LOa_7QofF4teBP9
X-Proofpoint-ORIG-GUID: TBH5tJc4AOqRCX6sghbMrSCuiDQffioR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=540 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 07:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161439

--------------971B35415BFBBF8E90541258
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2177NrjM019690

On 1/28/22 6:29 PM, Alexander Kanavin wrote:
> I do like the idea; not everyone has a pcie gen4/5 ssd for builds, or=20
> rigorously trims sstate on a schedule. But there may be consequences=20
> or regressions, maybe RP will immediately shoot it down :)
>
> I would however still place a single level of hash[:2] *under* the=20
> pn/task/, to avoid too many files piling up in a single directory.
>
> Can you send this as an RFC patch?
>
> Alex

Yes. I will ensure that all oe selftests pass before sending out patch.

Regards,

Qi


>
> On Fri, 28 Jan 2022 at 08:06, Chen Qi <Qi.Chen@windriver.com=20
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Hi All,
>
>     I'm sending out this email because I'm wondering if we can change t=
he
>     sstate cache directory to use ${PN} and taskname as subditories.
>     Hope to
>     hear your opinions.
>
>     Below is the long story.
>
>     Recently I noticed that running `bitbake xxx -c cleansstate' usuall=
y
>     takes more than 10 minutes.
>
>     After some investigation, I can see that most of the time is spent =
on
>     file searching. This is because we have:
>
>     SSTATE_PATHSPEC=C2=A0=C2=A0 =3D
>     "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRT=
ASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
>
>     And our sstate cache directory's hierarchy uses
>     hash[:2]/hash[2:4]/ as
>     sub-directories.
>
>     This essentially means that all sub-directories are searched. This
>     would
>     take a long time, especially when run for the first time. I made so=
me
>     changes to=C2=A0 output the time and the logs are as below.
>
>     $ bitbake glibc -c cleansstate
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst=
*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 secon=
ds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seco=
nds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 secon=
ds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 secon=
ds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seco=
nds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
:2.34:r0::7:*_populate_lic.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seco=
nds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 secon=
ds
>     WARNING: glibc-2.34-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:=
core2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*
>     WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seco=
nds
>
>     I figured that unlike git, we do have knowledge on our sstate
>     objects.
>     It does not seem necessary to use hash value as sub directory. So I
>     changed the sstate directory hierarchy to use ${PN}/taskname/ as su=
b
>     directories, and here's the result.
>
>     $ bitbake libgcc -c cleansstate
>
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_sou=
rce_date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_d=
eploy_source_date_epoch.tar.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.020630598068237305 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/ss=
tate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.0011608600616455078 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa=
/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.=
zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.0007557868957519531 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_wr=
ite_rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_=
write_rpm.tar.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.0013995170593261719 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedat=
a/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.ta=
r.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.0007488727569580078 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_l=
ic/sstate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
>     0.0005896091461181641 seconds
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>     /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_s=
ysroot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_=
sysroot.tar.zst*
>     WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125
>     seconds
>
>     It's much faster.
>
>     In addition, the sub dirs now give more info, which should
>     potentially
>     make sstate cache easier to manage.
>
>     Attached is the patch to quickly try things out. Hope to hear your
>     opinions.
>
>     Best Regards,
>
>     Chen Qi
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#161067):
>     https://lists.openembedded.org/g/openembedded-core/message/161067
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/161067__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlca=
hVqvjTbg01fXC5Sptlu1wS-nKbk5PGtw6ODQA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/88740516/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8874=
0516/1686489__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlcahVqvjTbg01fXC5S=
ptlu1wS-nKbk5PGWaXA87A$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlcahVqvjTbg0=
1fXC5Sptlu1wS-nKbk5PEkTurZng$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--------------971B35415BFBBF8E90541258
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/28/22 6:29 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8-SNPbD0Mbmbe-BovkrDTLH8dQYijvDjoqPDo2Mnjd=w@mail.gmail.com">
      
      <div dir="ltr">
        <div>I do like the idea; not everyone has a pcie gen4/5 ssd for
          builds, or rigorously trims sstate on a schedule. But there
          may be consequences or regressions, maybe RP will immediately
          shoot it down :)<br>
        </div>
        <div><br>
        </div>
        <div>I would however still place a single level of hash[:2]
          *under* the pn/task/, to avoid too many files piling up in a
          single directory.</div>
        <div><br>
        </div>
        <div>Can you send this as an RFC patch?<br>
        </div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
    </blockquote>
    <p>Yes. I will ensure that all oe selftests pass before sending out
      patch.</p>
    <p>Regards,</p>
    <p>Qi<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8-SNPbD0Mbmbe-BovkrDTLH8dQYijvDjoqPDo2Mnjd=w@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 28 Jan 2022 at 08:06,
          Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com" moz-do-not-send="true">Qi.Chen@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
          All,<br>
          <br>
          I'm sending out this email because I'm wondering if we can
          change the <br>
          sstate cache directory to use ${PN} and taskname as
          subditories. Hope to <br>
          hear your opinions.<br>
          <br>
          Below is the long story.<br>
          <br>
          Recently I noticed that running `bitbake xxx -c cleansstate'
          usually <br>
          takes more than 10 minutes.<br>
          <br>
          After some investigation, I can see that most of the time is
          spent on <br>
          file searching. This is because we have:<br>
          <br>
          SSTATE_PATHSPEC&nbsp;&nbsp; = <br>
&quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
          <br>
          And our sstate cache directory's hierarchy uses
          hash[:2]/hash[2:4]/ as <br>
          sub-directories.<br>
          <br>
          This essentially means that all sub-directories are searched.
          This would <br>
          take a long time, especially when run for the first time. I
          made some <br>
          changes to&nbsp; output the time and the logs are as below.<br>
          <br>
          $ bitbake glibc -c cleansstate<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:r0::7:*_populate_lic.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835
          seconds<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*<br>
          WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043
          seconds<br>
          <br>
          I figured that unlike git, we do have knowledge on our sstate
          objects. <br>
          It does not seem necessary to use hash value as sub directory.
          So I <br>
          changed the sstate directory hierarchy to use ${PN}/taskname/
          as sub <br>
          directories, and here's the result.<br>
          <br>
          $ bitbake libgcc -c cleansstate<br>
          <br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.020630598068237305 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.0011608600616455078 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.0007557868957519531 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_rpm.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.0013995170593261719 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.0007488727569580078 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sstate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.0005896091461181641 seconds<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroot.tar.zst*<br>
          WARNING: libgcc-11.2.0-r0 do_cleansstate: Took
          0.00080108642578125 seconds<br>
          <br>
          It's much faster.<br>
          <br>
          In addition, the sub dirs now give more info, which should
          potentially <br>
          make sstate cache easier to manage.<br>
          <br>
          Attached is the patch to quickly try things out. Hope to hear
          your opinions.<br>
          <br>
          Best Regards,<br>
          <br>
          Chen Qi<br>
          <br>
          <br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#161067): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/161067__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlcahVqvjTbg01fXC5Sptlu1wS-nKbk5PGtw6ODQA$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/message/161067</a><br>
          Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/88740516/1686489__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlcahVqvjTbg01fXC5Sptlu1wS-nKbk5PGWaXA87A$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/mt/88740516/1686489</a><br>
          Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">openembedded-core+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!N5Dyvu4eenTGK1TY1BrreaZ7uMlcahVqvjTbg01fXC5Sptlu1wS-nKbk5PEkTurZng$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-core/unsub</a>
          [<a href="mailto:alex.kanavin@gmail.com" target="_blank" moz-do-not-send="true">alex.kanavin@gmail.com</a>]<br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------971B35415BFBBF8E90541258--

