Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63358C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 08:28:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6065.1646123300322822045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 00:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=re8bpodB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0059b693a2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2217MSCc001223
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 08:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=s3sgSyds6aiCLChqmtzxWnvn2zUtoOew2KvKpf6ev44=;
 b=re8bpodBlo4kGvd7XmU6/wsu8rKxg6qE6b94tsytuQjNL4vWfSjHzQKKIPptlUKcXveK
 Ouo//RiVSoEvjLBLZsgiOAleszVijGuFtiS7SUPORXIOhVYBJL8rH2cEVvly1upDS3xL
 foBNnjX+tWjuOh0dCO9vh9mIR80g8IGyjOpYm5GnOY8Xw1nfxrKeSK8qzY56VrvTZLJC
 XF3QQOFFUv1pCMpF/lnW3XyYentzlePIYklvl3SePGu71CHU2RwvTVXWUCfPaq80pvlU
 PusqdifYdQ3rT8B0Jqfy5xUCe7HvJ0axtFNPSSKKJIuM6t1xD8+FRJJMqAwo1L4GmYM3 vA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3egvnxgwyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:28:19 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2218SI7R014264
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Mar 2022 08:28:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3egvnxgwye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Mar 2022 08:28:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEPbe2EDd3HxDAZNV1KDhsM0Rq4MJo9X9WupLYiDm4j7Jfc571hSImf+lnXvf8Dtufa3LrGefwbnNf/mYn8l1mzP0AcUHXDle1wwerwjk41+BMZ75rTlFI7/HCUwWFk73uEjnSXU7SyxMEZJN/wMmJWBC3rkTaW/h0U+24gtQmX+XyFkFyv8+z+PU8Bclw/QTLLUCCvMLf9shz1ivh0OQl8nQ1k0iR2jMAOgCAUgFCIWNhtMGrJtQdGkSLCAZKFMpVrxK2f539QrRV/a+wduOBHhe9TsRFNI0VV69C8e4noldfC+1ENQ7LJs/676hgvYRJS/htI0tFOmUgaMQNJAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3sgSyds6aiCLChqmtzxWnvn2zUtoOew2KvKpf6ev44=;
 b=QhxtP7qtR/nAFcxEOQ1rtC+HgK21bhd2euXHPXbz6M4kw42c8/Rb/8/T0lg4tlSYjE1QSIUkQuwNhso/23EAHLlWH470dv23b93t4YBfRksBSms9TcmP1cehQRc+B+hI0LV/rA9609N24WgqZXz4YEpN6GtBRs/XpM+N28za3ePGO710Z0YRDMHV5oGC+2ux7QCPd4HtKXOaLD3YwX0H+pMC1zDPB2VL8N9ouLAFAfAqZMnkmsBmaHZujbOmPZ45y9ga8TdvmX/se5UxiY5WCvp+GEKeE3ACsxvG1ohhzDwcDQgmQBl6JtYD444oDdgwIiHAqCBZcelzIBvNMSmYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by SN6PR11MB3518.namprd11.prod.outlook.com (2603:10b6:805:da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 08:28:16 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::9505:de88:28c6:f439%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:28:16 +0000
Message-ID: <cd4ad00a-083c-53aa-28c1-3d979d9d8bc4@windriver.com>
Date: Tue, 1 Mar 2022 16:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/1] coreutils: fix statx failure on native
 builds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1646119426.git.liezhi.yang@windriver.com>
 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
 <6e3a32402d372d518e6c4bce86f54f4791aa5081.camel@linuxfoundation.org>
 <7e92775d-b2b1-6482-4221-fb47935f1c47@windriver.com>
 <95f7b7a87d37215c4c5145f6a9316486e6ecc6e4.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: 
 <95f7b7a87d37215c4c5145f6a9316486e6ecc6e4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0246.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::27) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 141003bb-7aa3-4e96-2565-08d9fb5d6ec4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3518:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB351877C0F0A638133B354E4CFF029@SN6PR11MB3518.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LwpK0gjBOa3EzwDwqE3y9VeGaNQdwtOHCTNy4oOq/w47HRXM8tCUZiucRNm1KbxNdeFl1BUpA4ADJBZuhqdKLoSymFYylF551F8uK/FDfSy4vAYajFe8WQyMs/Gtiqgl9xe8V+U4uhLOPTgnNWAEQKhjzlEubfV4RlhdfxAQ8+p5E3XohqRT6QuJe+QTU/Wstfl4DYx7a4ExWIiE2ELqJy96/ElKlY0vpfgTC4YSI0KyOSf2kCrsDhJXnyx8sERaQtuc3cl8O0aRo7Gs1Il/+WkltiQ+YGez8wsoFVsjC7nsE2uMmoH72V2VYJdug+DnybqHoOznG3AreRNLwGy6ZjxYcoANu5ZCKfYVDOcfX2F5WVOSn7+MbvZRjGnynQg0RRUhOMjfxwE6jjrs3L0uHTwflg15Qo8FDvJnb9+XZ0ghab76W0V7sGsw8YSzXQkWG+CIY0UEfxPNOmgMc90eJQAzhTbdZJfktnDSkb4KrLVs+uQ0/2UYxLDaJdFPj9UHvvLrsdLVGHFGkB/9sUWitrPYNq1S8AxnmASisGya47ersZpolaNqN+h1yQqBAa9uaCo9rlvn8LUPheNn6QGf2vsDrao7Ihk1ur7Q5mEMRWNFmFEPEFolLmTKafb4Udi6uSnphyN7Ok1Td5ju/meavezwlViQZrRuDcihfgUOxqCVw/ZUrXq0zTa01G4Ak6msunVhNluNmz621hNPzpzTyNFaP23N0+wiujcbBA9X+8j0A0uEfl+MzgRbU0J08WH1+rkueSCVwYn6mpsF/WY47w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(6666004)(26005)(186003)(2616005)(86362001)(31696002)(38350700002)(38100700002)(6512007)(508600001)(6506007)(52116002)(316002)(31686004)(36756003)(6486002)(66476007)(53546011)(66556008)(8936002)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2U1VTk5WFE5bUJKZlJWbm5iYnJuTGVuNTVNOFlZZ3BNbnpJeWNrQkhxK2Vs?=
 =?utf-8?B?Q1NnUEdua2haR3NzRnlnR3FzdUZxT2h6WGlhbDFHYmxvMGNZZE9MSW1GRVFw?=
 =?utf-8?B?dXdCQUYzdklXV2xMOTQ4VTE0cFV4OEl3SHF1OFE3Z3JmN2N1U1dqZzVxOEdo?=
 =?utf-8?B?dlQyc2toRU5uVGZwNVBSSTMrbjZySjFXVmE0Nk1LbzdnSzgyWU5zdmRSOXo5?=
 =?utf-8?B?blB1NzJub3lkbU42WGhwcVRnVS9MSzR6TEtRclh1dENGMFBlSWs5ZUlvK21v?=
 =?utf-8?B?TWNVbVlLem1wYVZGb1pCdWUrNzRwWFBGS0F1R21rMWdVaUh3aW9rbC9rOGVO?=
 =?utf-8?B?RlhSeHpDZXRzc0VKNUQ4WjlKYzdHaXpjNUdsUlBpd3N0VzdPTDRORGpzdVRT?=
 =?utf-8?B?SUEvNlcvSDJ3RnE1bmN2YzFIV0FGa1dXN1dpS0NNT1FMQ1NpQ244UTBNamky?=
 =?utf-8?B?MUVKVWtrSFhwUEdPd2hWdE91TkhHVVRaNUU3aVZxRG9EOGFHWHliNWtqWStu?=
 =?utf-8?B?WG5VSXpaTnY5bzJ5SDl1aW1rdmNCalRHSFdQRzFnd1V1V3F3djFiKy9OWjkr?=
 =?utf-8?B?eldnSDRzU1lxQlZKUXJuTFF3dTF5YUNOSzVXSER5U014cFB2Zlhoc3dXdXd1?=
 =?utf-8?B?Q1ZDbEZBR1VmdWpnS2VxM1ZzaFg4MEtWdVB1MElVZzlxcTUwYkZPeDV1N0FT?=
 =?utf-8?B?dlVSRWJkWkdXRVQvU2t3clM3Q3M3emhscFZhVE5vSTdCSk9BZk4wNnpmL3Fa?=
 =?utf-8?B?L09vWHRkMjIxMU52Zk9HYkZCeFZmQWVNSlFGKzdBQjdGZVU1UWNkeEV0NFVh?=
 =?utf-8?B?bDJjcjZqd3QvdFRneGppTzlTMVU2Q1Y5SFV1YlVrcnNUN1pWcGZnT05CY3RN?=
 =?utf-8?B?aWlJdXRtZkZVTHV0RFlaaFhUVGI4NFR3WWxZRXBxQjNUMzNHdTdFU1VUQjAw?=
 =?utf-8?B?aUp6V25vUjd1OWJSbnA1VEd3eXJjbnh1YnU5RkhSZ2hCS1dTck1JY1RzNk1m?=
 =?utf-8?B?VEd1aXZIZUUyUWhYbjJjTTI1REV3OGlHOXowZVlHcE1lNTFWNWhpQ3VYakk2?=
 =?utf-8?B?NDIrV3hDUUFFR2VLdFZONmVFSFlUL0plaUIzRTl6QjZSZjViS0p0dE05UDBJ?=
 =?utf-8?B?ZmtqWkJpRUNuN082ZndLSkJ6T05zdjVZYStoaWxvZEVNVU9pa1N6cXowSWhi?=
 =?utf-8?B?WFhvQjNUbmxxaGFxT0w5ZFVWMzlXeDFrSk82MzVoMTcya1d2a0ZZTTd4TnZD?=
 =?utf-8?B?RG4rbkR6TG1IUDNweXdXcytSZCsxTXBQOTdYai9kQWdjeTZsZkFwS3dVQTlO?=
 =?utf-8?B?dm1CTTRUOWRFN3pER0VsczkzMjhNZ2I5dERwL3ZQdlNUZ2tYWXlUK0lFaEV6?=
 =?utf-8?B?UmpnOW9aamgwSDdQazlURmk3dGJIK0d5OUhEaGtTazE0aDkxRzhOdzlBaWxY?=
 =?utf-8?B?M3ZqZ3p6NmkvQVV5MTNZOVprb3A5SGxLd2g1Qlg3MDlucWJXc3N0VEhZS3Ro?=
 =?utf-8?B?b3FLQWgwbElsL0I3dkZwMDBRRC9TTitmMG9ZWVV4b1NJZUt3a081OVp2Wm54?=
 =?utf-8?B?QS82L3ROUC9UUEh2NWVDVGhzcm1ENDlsMkg3MGxQd1JpYXRGL2xaKzJ4dXN2?=
 =?utf-8?B?WE9CTmczLzdwL1NtdWN1M2hYd05xdndFNW9ENWdSNmd1cFUzN1U4czVkVWp5?=
 =?utf-8?B?WjBDbTlnRjNCM0g1RnE5TDVVclhDNkdZRFJ6akVZRmx1bC9QU01TZDBld1Fh?=
 =?utf-8?B?WStNS0NaQ2hueG9iYW9CZEkwdkVSQTg5WEJWZlpZMXpORWVUVExiSC9YMVp6?=
 =?utf-8?B?UEJncWJEN0Rwdlk1aDgvU0RnWW1qVnBwYnN3Sis5bWJSMTdwbDdxTkdrR28r?=
 =?utf-8?B?amFYWDN3Z3dqM1V4cTJHaXRtc2hkK0wvdnFiOG42UktvRjZFbllpMU9FYlox?=
 =?utf-8?B?L0VKL2thbUt3S2FnNmVPTXJ3U3RVcjFVMWtQUVpleHJBZnpLRXFJM1MvZGhk?=
 =?utf-8?B?bEQ3QjduRHdiWnNtRWJEY0kzc3JxQmdEeXVteFphMXEyd1J0WjM2WTJyZlpQ?=
 =?utf-8?B?N2M0VVJKY2Z1YmlyMmxIRmFHbi9Vc2JRZkF1em5mSWcyd3FhUDAyTDdqVHhW?=
 =?utf-8?B?bnVGb2dNeFN1dnEvcUV6ZDd6aG0yMVNaL2ZMcVl3N281MlA5aGxzQXMwcmhZ?=
 =?utf-8?B?MUZyL21pY1RscTNDZlhRMVVtOXVQMGZLUStjL0w4T0FCNjBqNHJ6bURML2oy?=
 =?utf-8?Q?O7aLKjKETJZ8l3ClUwwHtw5PBqsweMH/OnJr5HXC1c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 141003bb-7aa3-4e96-2565-08d9fb5d6ec4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:28:16.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hvGpzZiu/ehH1zU4VLvxlPn9UGKZydRvtuYWRWWt/bqTrVvraU16zbENeG0csMB2r9Mjy3NfzdpnHdbLWnY2hDVZ3IyvlQIc8smrFLxSXhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3518
X-Proofpoint-GUID: aVNKq5cX-wrjoZc69pM31N9hohIJeQVd
X-Proofpoint-ORIG-GUID: NLxBnEYrO-0FPtm0zdTzgAVYCeVTTC7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 08:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162534



On 3/1/22 4:21 PM, Richard Purdie wrote:
> On Tue, 2022-03-01 at 16:19 +0800, Robert Yang wrote:
>>
>> On 3/1/22 3:59 PM, Richard Purdie wrote:
>>> On Mon, 2022-02-28 at 23:24 -0800, Robert Yang wrote:
>>>> From: Davi Poyastro <davi.poyastro@nokia.com>
>>>>
>>>> Coreutils configure only checks glibc compatibility for statx
>>>> syscall but fail to check kernel support.
>>>>
>>>> Fixed on RedHat Enterprise Linux Server 7.6 (Maipo)
>>>> Host kernel: 3.10.0-1127.8.2.el7.x86_64
>>>> Docker distro: Ubuntu 20.04.1 LTS
>>>>
>>>> $ bitbake coreutils-native
>>>> find the binary ls and run it as "ls -l ."
>>>> The result is something like: "?????????. ? ? ? ? ? foo"
>>>>
>>>> Signed-off-by: Davi Poyastro <davi.poyastro@nokia.com>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/recipes-core/coreutils/coreutils_9.0.bb | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>> index e4633949f42..40fad72bbf4 100644
>>>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>> @@ -152,6 +152,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
>>>>    ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
>>>>    
>>>>    python __anonymous() {
>>>> +    from distutils.version import LooseVersion
>>>> +    # statx syscall require glibc >= 2.28 and linux kernel >= 4.11
>>>> +    if LooseVersion(os.uname().release) < LooseVersion('4.11'):
>>>> +        d.appendVar("EXTRA_OECONF_class-native", " ac_cv_func_statx=0")
>>>> +
>>>
>>> Shouldn't that be EXTRA_OECONF:class-native?
>>
>> Yes, you're right, I took this patch from hardknott and built it, but didn't
>> realize that I need change the override syntax.
>>
>>>
>>> Which makes me worry about where this was tested/needed?
>>>
>>> I'm then a bit worried we have two different signatures for coreutils-native
>>> depending upon which host this runs on, which will cause a number of other
>>> issues. I don't think we can do this.
>>
>> That's a problem, maybe we need disable statx for coreutils-native?
>>
>> The errors happens when glibc has a higher version (Ubuntu 20.04 in docker)
>> which has statx(), but kernel version is low (CentOS 7) which doesn't support
>> statx.
> 
> Disabling it unconditionally which a comment about the version issues may be the
> only option we have. I'm not sure everyone will like that but if we want to
> support that combination, I'm not sure we have much choice.

It's worth trying for deterministic build, and we only disable coreutils-native,
I will send a patch for it.

// Robert

> 
> Cheers,
> 
> Richard
> 

