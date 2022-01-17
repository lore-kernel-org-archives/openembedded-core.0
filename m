Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942CCC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 09:12:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9012.1642410755965926602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 01:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hq8T8oi3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8016305b07=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20H8POxm001089
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KcsVcwmdH68aI/wabc2IJ5fAAsGfFBNWM93O6qCAtg0=;
 b=Hq8T8oi3evcWxrTEetDdewpa21OGUMUW9EZ+DXc3dveorjWRJxaB78Knrk1euJS2472Q
 3AcUHxH8GI7/FtwGiva0uAbqyAl4GePGBRYG/uSGEeamB/df4wXgeiMmURdM63zaQ5zu
 15OQUBumazF1WsTh4u83nsq1O7D/geivhL4rz9Y3VLJbmT0p8BlduV5R0YzBDKzz7mjR
 /QglteOy2Yg82mqa071Sw70DUIpIs0s3aTsjqg9meVAfzMV2vcqggrL+MWEystJ5taB7
 TAbYkYRELRBuxCAo91SISMSDHwpHa7I4WWH7XuPE4JRidmtH9tp370JbMdOeL+AQKyOj pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts6a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 09:12:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20H9CXsN032409
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 09:12:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkq7ts69y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jan 2022 09:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obBpgIpVl5BFuO8w8brq7/kio94NeqkWYCxv7odASWfQ7X6k55u++ftjrzUJcZONGgfZwqxPiFLvXfIWqZk/hTuffwRQB4DnPJTUueLJhA6qXPPR7bvcchDz/EZQ7PyjFxsD1+Na9qKR5KVxBwJLBixZm8NqFyfa6GHuXnjSprCsgylIICECmUB4GrmNDHe0E8Wo0y0YGTCt0qs/tdM7h0ojyKeZu4beeYpFIeTiIhw5szpNRRKfkYOZE3zVzbf0ZuiOer+lw/8WDDIpKdRDAIlmvkqIMGpyT6SWDJBFYt8NwDnbxCsTmpYqRlzQLR/gC7s2eHrlNls9aAkDIkquBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcsVcwmdH68aI/wabc2IJ5fAAsGfFBNWM93O6qCAtg0=;
 b=H6g7gX0CUHHIB7OYlBGSUhxL5xE/G2J7bnSRxnj6vwDUwDRZCw3dgx+5099Mkqd6N4ki/91YjgOgS2OixzzoE9QPOIjXAD9xSRZV5jRpvXVPDkujG0Aaq3uoK/zs3EFu2PSHyct8WfO+YjMBgFHdVCsybSLnxmREmiC5IeNC9f0RaAQNt2pDuI7tEw9kRIARtkJYQJd5AczEdEiRqRF1fTwwP/gmT3+Uld230bfO9846BJ8VjPUmhkjQPMnYxoewW/B2n+b7AwOjIlsOqL8EltdMm0Drjd8hg+9ZnEft7YNB12a5Lci7DwHfTlX5C6p5BIp3XAar8/i4+cmKdkUOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (52.135.90.161) by
 CO1PR11MB4803.namprd11.prod.outlook.com (20.182.136.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Mon, 17 Jan 2022 09:12:31 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 09:12:30 +0000
Subject: Re: [OE-core] [PATCH] nghttp2: fix for multilib support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220113034439.19018-1-changqing.li@windriver.com>
 <ba495e2870d62f9445d0c5f43da51cc2aba41527.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <cd21db4d-bc16-3166-2301-c752c137303f@windriver.com>
Date: Mon, 17 Jan 2022 17:12:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <ba495e2870d62f9445d0c5f43da51cc2aba41527.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d37b08f5-6e34-4740-403b-08d9d9997cd8
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48030E07F7CBEC1679549A1D82579@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zm44C8FGndSBiIvBarg9NzMsn0PwcYGGX2Xb5lMvjyx31QeKB/GOaY2iVow4d9xhRovJ67kFKRR9+jn7MHSloJkPZqZwIC7jRt27BZfJDKyXG05+3u/ZPNAtRFc7RiXMmKqOWgiUddm3Efuk1ulUq1LVmdN5Ya8eq+Jtb9uCaY4WIBm+c0nEd2wpOcCbSP89WCV+RtnFbXxN2SU0lJu007ncqem/vbi4Af4gDw3XnEnBv/WwhPZUYX8FOGxP0qlT38tUaW3psH+FukD+Bebzg99AUxdszZKdrUHzjcK/xKLWYmH1qWThndF2lQ1XCcfvQrK1MKQTLvUjdzivdUK3C3d94giJgUCDIkuMngnl7tQIEy18l7rTwfl3hlxYwqR4CH9q7T2asZ+wELihHtcd6o9UG9fk+VkiQKR402oLKSdoxG62L5vlIpaZbsFveayltJB0uBtFrhCDBVflTTERd/aJe6WD5UizCt53hOCP1P4lUEMnXeDcr3Gi2lM/1ddMiVBkhYdUeQc9NAXZ6r7YXuRalQS35wbjGqTp0HSVuyNVwDRHf3WHqIPHVqFlai4/jQAt6ZtxnjKkxfbtfW5zIUtu0luXgAh+QOvolkWOj1gtZyTBFNi/jWFDgiHRMjwlzIbTPxhABgTamBdy/NrMRoLlSA+mUve0u1KnPkL4LNHoTycjQoZQ2mDbCMBuL7DAqa8RxkEqyP27dEPwyqiNZReM4wPIMnxnn2i25FltVPvtBbAD2lN/qcqLcWI351geSfpnMJ725DqdNsnXEbqb2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(83380400001)(44832011)(66556008)(66476007)(2906002)(26005)(6512007)(8676002)(31686004)(6506007)(66946007)(508600001)(53546011)(38100700002)(6486002)(38350700002)(316002)(8936002)(52116002)(5660300002)(31696002)(6666004)(2616005)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnZUZ0lOOFNJdWxkNVNDOTlvSFBEY09BM2swbHJOZ29FUGVCc0ozc2NqVkIx?=
 =?utf-8?B?MkY2NWhxNllqVXBqRjNTNVh4YmdQNFVCZnZnY1NPZU1vSEVUYnA3MmpxUEdT?=
 =?utf-8?B?OUljZGZIMkErVVlZK3pZenBHSzRWVFdlOEdsbzIzTnFUaHYvcTRudEk4czhU?=
 =?utf-8?B?Nnc1UkF1N1ljTE1IelBvZDNLTnNkcVRzR1c3UGMzYTdVV2M1NWJvNHhpRHpL?=
 =?utf-8?B?cmhtSzFKSDZ0WXcwMzkvYzVCQ3F4aTB0aWNET2kwUWdWcmFUSnE0K0hDUE5z?=
 =?utf-8?B?U2YvYXhVemZyMHh1VnFjTUtxcEtQdStqdWpjR0w2NzNSejl1SWRGNzRVMzRZ?=
 =?utf-8?B?NHYxZjdRcUduOVlNZUJaQUtpSFd6aTBhOHZGcTJqQ1pyWjRBVm94WTBERmQ2?=
 =?utf-8?B?ZHhQVVFHRHZGMjQwYlptWjhROW56OUZXUUVsdDJoYklCek9ud2J3YlBlQmVy?=
 =?utf-8?B?MU9mRjJNSDFuS0tib0ZPSkdoTnJaS2VsN0VEeDRNR1JMbXE3OTVnTGt1VXdJ?=
 =?utf-8?B?VUd1MVJCQmZJZG9aa3pqc3BnVjY4OXlWVDlQWS9BbTV5aTVENHlBWXNKTjNE?=
 =?utf-8?B?dnp1OGZaYXZLdjMvaktKdVdnRlUzQk1iVHYvRUR2Wm9QRFpRdHdhcEsvdE9B?=
 =?utf-8?B?YjI2c2FSalVVamY4OHBJMDNPTUtJS3ppUGxzOU1xM0dZM1Q5c1JBSmRMUzF4?=
 =?utf-8?B?ZkhkVGc1RUZEWTF0TlZGMXVtT1pjTkdTQkZmamlMeC8vbjlmOG1HN01GbzlU?=
 =?utf-8?B?WnFaaWVUbFRVZGp0aUxVbmNkdEVEUi9wTWN1RGxvYklDUyt1UGhIUnAvaVFz?=
 =?utf-8?B?NWNxNVNpZkdmaWRGODZmWjBjSDM5aW9LL0IrenpqaVhZRVdSSkFYVU5MRE4z?=
 =?utf-8?B?Ukl6bkZXM0oxbERNb1Vjc3JZMXpyVWNxa3E4b29MYms5cFYySGhJcG5RVHJZ?=
 =?utf-8?B?VmdNQmVWVHZpa1R4VEMzNXpBenZ4NENCdHJPbko2T1VQdTllTEt0aUV6WHVS?=
 =?utf-8?B?Ulcwbk9OQXBRMUN1Z2d1OUY4czFOeERDUllUY095QXhRNXRtZmhmZTZjQWxK?=
 =?utf-8?B?Szl2NnBIOUVBRnFYZ1pyMHY4T1IvWnhNSVhTQjB3RTJsMng3ZzFwV3ZpZnRR?=
 =?utf-8?B?WFJGZEdiK0FjWXZha1A3YnZqUEliUHpFeGhkS0dHWVU2VXBTSVRacEUwZytW?=
 =?utf-8?B?VnZ6Qktldnphb0Q2Ny9tS0FYRS80K2lBL0ZqemVXaURjYVYxVWRndGFQRXdW?=
 =?utf-8?B?ZHhKdTg4Zk9rUmt1TWoxMjFBcU9WZ3dhTWh3Z2pGMFBBK3FnaU04RzRxUVlQ?=
 =?utf-8?B?R3liWTFESURZd1FYVml4Q0FiR2NVVG1DbmZ3UTMwVVk4YzBsR2FKSU1KblRt?=
 =?utf-8?B?K3VDdlVIdEdPTXd4a2U0Zk54c0xBMC84SHFJWng2M2ZPbjJUQjI0UUFySjF1?=
 =?utf-8?B?ZmF1M3RZMWx1dW9wNEtzMVNkOG5vSlFIdEd2ZFhpdWgwL0RsdUJmVktyclIv?=
 =?utf-8?B?QVVoQk9CeXBGeUs4UGRxcHJ5ZU1FRG1Fc09sQ1JqaHQySGJXSlhVTWRTeTdI?=
 =?utf-8?B?Z1BCcHVLV0krb2pjaFA0OHk3UG1JSERIQWFwNUY5TTBvMmJnclc2ZVU1Tk0w?=
 =?utf-8?B?enZzSnhWbEFLWDVtTlk5akFFbW5MMUx2Yk9aeGhjVk5BelY3SCtpNDRDTkRq?=
 =?utf-8?B?bmFuUlorMEFYUFR4ajluU2JaMGhtOVQ4NVZHY25tcmNUeW8vVGNtMDdTZWxa?=
 =?utf-8?B?VU90a0F4MHJuZWdIaFdOMDY4U2RnWTZhVEk4MTZOZWs3bnliTWFhVXJSV3Ro?=
 =?utf-8?B?dU5EaDFOMVJ0SEhjNGk4V21NYUx6WWRjb1ViMDA5WThpcDVLQkdTbjVhQ2x1?=
 =?utf-8?B?RlNLMUF2QkxvSUJON3Y5cFF5SGg2S0NzenZYV2xkNjEycTJ4eVlQeFZUYm5y?=
 =?utf-8?B?VjNxVTJnVllIOTFpR3RHYWl0T2tBcTIxaG1xQmh6NkZ5cWlBUEQzQ2J2Q2Nk?=
 =?utf-8?B?a1o2VHFLc2tYVG85TGMrYWQrSmdzbW5QV04wUmttY3g0NmZ3a0xvQy9tQytZ?=
 =?utf-8?B?cGlUcEJOb0xQeGt2dldkZWw0azFNVEwrRjRzbVJhWHpid0xjMFFteEhvU2Jw?=
 =?utf-8?B?ejFZQ3l0QkVJMWdDQ0RkTmhFMjEzTUg1MFpwQlVxV1o4Y0FKeG5WdThCcmZZ?=
 =?utf-8?B?L2JUd1h0cXhsVkFXTC9TN0poRkwrMzJUM2grZmkzTFg3Z01vZnlsYUZieFJz?=
 =?utf-8?B?Y2lQZUl0YW5WRjJnN2ZRc1dBeUxnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d37b08f5-6e34-4740-403b-08d9d9997cd8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:12:30.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eHdOS/hZqR84eYFyfW5LDnzlomRc1z1q1e54jahPHU6Ys9VtPnM0h05VSY+qKPetYQpWFNE5M+DS9xsWF06j1h2cb29bSATAU+lPVorEv2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-ORIG-GUID: MgRX5EtiQNKTBi26kSvI_LiFBxAZiZlX
X-Proofpoint-GUID: I0nShrzpzQymtOgA4gjCjTURxP3wPm1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_03,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=933 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 09:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160638


On 1/13/22 11:26 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2022-01-13 at 11:44 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> correct the package name
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/nghttp2/nghttp2_1.46.0.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>> index 972ff2d60a..a5f0be856f 100644
>> --- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>> +++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
>> @@ -19,7 +19,7 @@ PACKAGECONFIG[manpages] = ""
>>   # first place
>>   EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
>>
>> -PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
>> +PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>>
>>   RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
>>   RDEPENDS:${PN}:class-native = ""
>> @@ -27,7 +27,7 @@ RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
>>
>>   ALLOW_EMPTY:${PN} = "1"
>>   FILES:${PN} = ""
>> -FILES:lib${PN} = "${libdir}/*${SOLIBS}"
>> +FILES:${MLPREFIX}lib${BPN} = "${libdir}/*${SOLIBS}"
>>   FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
>>   FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
>>   FILES:${PN}-server = "${bindir}/nghttpd"
> This doesn't look correct, particularly using with MLPREFIX in one location and
> not in the other...

PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"

the first package lib${PN}  is not correct. when enable multilib,
for lib64, ${PN} is nghttp2,       lib${PN}=libnghttp2,
for lib32, ${PN} is lib32-nghttp2, lib${PN}=liblib32-nghttp2,
but I think it should be lib32-libnghttp2. so change it to lib${BPN}.

for PACKAGES, it will be extend by classextended.py
#   prepend /buildarea3/cli10/yocto/poky/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb:22
#     "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
#   rename (to) classextend.py:127 [rename_packages]
#     "PACKAGES_NONML"
#   set classextend.py:128 [rename_packages]
#     "${@oe.classextend.get_packages(d)}"
# pre-expansion value:
#   "${@oe.classextend.get_packages(d)}"
PACKAGES="lib32-libnghttp2 lib32-nghttp2-client lib32-nghttp2-proxy lib32-nghttp2-server lib32-nghttp2-src lib32-nghttp2-dbg lib32-nghttp2-staticdev lib32-nghttp2-dev lib32-nghttp2-doc lib32-nghttp2-locale lib32-nghttp2"

for FILES, other packages start with ${PN} aleady extened with lib32-,  so don't need MLPREFIX. but lib${BPN} need to add it manually.

>
> Cheers,
>
> Richard
>

