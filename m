Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E326C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 15:13:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38081.1702048393140529903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 07:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ve0xD8Aq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0706163bac=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8DIfV0000830
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 15:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=cMhBi1PjRnK874ajYG1
	f5Gdcc8OG5VmwH3Cppr833rE=; b=Ve0xD8AqtiyVun4MI+n14ecZaC8nbRRgdOY
	SRDNhMCvMV2LQhBSrTFRuNEU6+P8rj9K+WykwIRkGciOGaLDIC9iqVKWIJPEVBU1
	sZ7bnP1f4bvdRd+tqQvrDgO31amHIa/KlHRYuMlViEv565DdDCXlu9qaXs2FR9zw
	JBtY1edoeWHA2xmTYZy79LQtgnJ3IoJ2AiFQc7qw3Adh/CSE0v/9x6E+PO0M098Y
	nroGY27/q7ZPyOPxK0aI3LEBGrtLAiQNzJotp1Wkjz+zwJ4qCQXQR9XKyP2pqsaw
	qKA2NSxl4Hx6WrrTOXyT7mqFgjRlLUXiCCtlnP65WJ3kqFwRwkg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53tyet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 15:13:12 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B8FDB6E001198;
	Fri, 8 Dec 2023 15:13:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53tyes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 15:13:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzUCREkyC2PospdqGHGGFPnCtDWNL+ZbbXqHc9HG1gO1vU6j5ZpGDd8PpiCvM8EXyeEQgDHJlMj+TjO70iYRs0oRLIxZpjelVsaFycUU46EHK5nceSphNmUT9uLoSplHQWg2UqmwRFlfvXejdPUGokzIR2yC4GPlsmqdPkO1Cu4Lg4Vx9NiWRr0dCkb3faBTI9ibH+JFEoxpLE4zWII+jXOQEd46TO2HqwtzphkRSz7te9NC4jfYsHFcm9xaAb0JnmLO9SQiV9uKBGxhp46Ycu3oyPTcp5EIEQ9iCsP8qM+QCaIloTE/CSyfOfIqJXpIKXL4YlRegR2/hiVb0E+27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMhBi1PjRnK874ajYG1f5Gdcc8OG5VmwH3Cppr833rE=;
 b=gAr1zdMCbGRF77j9Vbeghntnor179+LJe/q5Xm0L8cRqO+mMCEiT3dYs5b0KKyRWzcF/Co0F6J48l4xqmEgTxm8YOxARwXqCJZs01rZ/bFWevYMbjENBLFmVpjq/oxYXaQ8ISt2HHAG3at7aDQP5wvhmSxoa206iuXmHiWb9OGtybgsuD12TigNVokEUhVBXPPVAS8/yf/fvp9z1SmvHy97InXD3yRJ3+bIlvUI12uxDoKVYYbO/Zth0QDfjbszyLEaTpoUBzJMEEoTtDjoM27d0lil4WrIS73vWdxDj/D5zzv+4LNg2RCbG0ruKbwXDBn2CbtwcVE29nEX6A3OzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 15:13:07 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b0b6:b188:9e9a:2c2a%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 15:13:07 +0000
Content-Type: multipart/alternative;
 boundary="------------8AkZafJ00lZd7JqCZgAYRymc"
Message-ID: <2ddecaf0-8f1e-4bdd-965f-7f34601a2583@windriver.com>
Date: Fri, 8 Dec 2023 10:13:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: Disable rust oe-selftest
Content-Language: en-CA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Tim Orling <tim.orling@konsulko.com>, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com,
        "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
References: <20231208104800.4175679-1-Yash.Shinde@windriver.com>
 <20231208104800.4175679-2-Yash.Shinde@windriver.com>
 <bb8e3b3c-9f8d-41ac-b67c-f58465c81aef@windriver.com>
 <2023120814464190b6f0e7@mail.local>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2023120814464190b6f0e7@mail.local>
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 081666a8-e32e-4f54-d745-08dbf8002e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d86bslHwnJi5DEhPfkYmOWPzqbdj0Ph+lmlbV0m5XGTLoOwXUkoA7qU8MBrpnaK83hCIA2f4SauA4+aoffhAyd76cGoNWc9rqDDg8mimmasIJ3N4QEkkDk6XtfSbuEFXhiZKVJ+8xW9nsAOU1Pm44yGg0qrZNTb8LjmTYfL/X/lKq3c4BN3gGwdi0Jmq+RoCKctMB2a7O2oJ+DHlX84S5CFwtiySYLMB48zLNgzpAiEWycSGyfgiB5e5CcC8CGNh+7yIbaTl957c7ofea3JXRCKNwx418Gx0cewoZVE9lYEXNMXkIbtAjuXqvfkXfFIKpP0EfIRQuudfovluyW8ZDjVDyFSXbmDPzGYakyBdR+PU49mSYY767Of65muHWV2eINmdvCRDkMlFwHvu7fsWVBZ44/CWQ4sN/ihFATCIliJi/9N92I7dO2N6MF970HGXuM+0HJTX/8RxTig2E5DNG7v53aqegWEXWYv+XBV49zSUNYgHQrNOR7w///xVSCjJN7Ccu0KyYtEH6nWsBpEFByAd23tGNYG4u09Gmc+R9ASK5V7OHQU0cD23raMB3+erwSLd+OzJAbrjil5h3/jyE/+62BVlqOf0MMvEAlfwcXq0g5+3l7yAAk6+LzX3yTwg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39850400004)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(166002)(86362001)(41300700001)(83380400001)(2616005)(6512007)(26005)(31686004)(6916009)(66946007)(66476007)(31696002)(54906003)(66556008)(316002)(38100700002)(6666004)(53546011)(33964004)(6506007)(966005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QzB6eTg1eC81ZUZHZGJma2ZXT0dUbFphNnR0dEN1MVpPRkpNRVhSaWF0SWhX?=
 =?utf-8?B?Z3BTYTYrR2ZNcTI5ejljTlRxQkRkZVlDcm9pUVlLcm91UnpaM2FsT2psM2Y2?=
 =?utf-8?B?NWUwYWhJRVZMZS90dGpBNVFvQXluU3hxUHcwcWFiK2d1eGoxVmRVNitXMEpG?=
 =?utf-8?B?d0piT0VsZHp3eHFEcHhmRkhkZ1YxZll0MnoxQytnWVgvL01YVE15M2N0eTJ2?=
 =?utf-8?B?bWQwVVlLdVJjcC9uMTFHVzZtWmZlaTBqWWNTNk0vM1dReThrU2tBMzBvOC95?=
 =?utf-8?B?ejJybnRxRVdQdXJyMkRlUDNOY1RSZW1rTGpZaWRZdnIwM0VBZlIydm5WVHFF?=
 =?utf-8?B?VlZXWkg5NXhtK2o5YjBtL0NIbGdLUzlCb1pFTGVnNVFrTVgrNkFpSzZ0VVVO?=
 =?utf-8?B?eWhyMmN1TXVwUVFGU0ZCOFZBNDk5dGxObW03MUlIS0lsYzBFQW05SzNScTNt?=
 =?utf-8?B?L1UvSHpxYW1Zbnd5RFFpdE9CMHBUcjhtSlB5Nlg2MjhHNUJPUERseXFNdWhH?=
 =?utf-8?B?RWlZQ3NBV0grb3YxVkIvTS9OTVE4dmYrV3NFbVIvWFZ3ejNJZHdGdUFGcEg4?=
 =?utf-8?B?VHhqK3I2YXA4eW5MejByc1JDWmhVbmVaVHNiZUlWTkNUNExmT0hrUDlrZk9F?=
 =?utf-8?B?S011ZE52K2Z1bGdpODBBYWFHUDJRUUhuU3AwczRUMHVkWHpncVJWZ3BHRWVO?=
 =?utf-8?B?YmpMQ0Vxek82aFFBM1JVN1hwRmVDVVNKOElQelRrR2czejN0RmF3V2NSZGpk?=
 =?utf-8?B?djlHUmVkOWNCRGV4NU84UmREUW5scU1ZTTU5bGJrdlRMTkZ5T3pEcnNkM2Fn?=
 =?utf-8?B?VVhudlcyeHRnWVoyMFY3ejlUem9sTWczSUFQVzg4Y2VvZFBheGhPRUlxc2Q3?=
 =?utf-8?B?c1pPUDJ0NGU0RFlkZ3pUUUZmcFNJZzg1ay9VNXZjTUltVjd5NlZJNG5WQUV3?=
 =?utf-8?B?WEd6ZXJjNVUrRVpTNXlLT2IySVFLdy9yZWM5bXdhWXBpZTdEbWtKbHlMM1Vt?=
 =?utf-8?B?K3pySVdNS3NubEY1dGczbE1lbGJVdEVxYzh0enVQc2RPUDVpeTZCWkFLZjFn?=
 =?utf-8?B?RVpIN2F3c09rZUNzY1JINGVOV1BTVjgzdHR6dzZlbnZESnZMMlM5bmJ0WDBO?=
 =?utf-8?B?T2o0M3RkdGhRdFNVbWtnUHc4TXFHeUw4ZWcyOWV1VVE1U1BReFVUS3RjdTVX?=
 =?utf-8?B?YlZCOVFQL2ZybGc0SDBpMFpIQlY2OFFEam52TFJ2VzA1ZnJWS1NIckpGWkVu?=
 =?utf-8?B?d1V2M0ZESXNPaWc2TlplOGtPbkZmeTdiNnNSeUlTZzQ0N3BLUnVYK1ZkeTNE?=
 =?utf-8?B?NFpWaFZYb1YzKzJvUFM2UXpJM2lNaDNTcmo0TytUQTkva0NObkl3ZVFiL3cy?=
 =?utf-8?B?K2ZBSU5TeFR2QWhyaWFQRy8xbzQyNUFLVG1IM1kzRi96bkc0d3V0czBXNXoz?=
 =?utf-8?B?d0UzMHg3Y0VCUFBrVlF3UGovVzA3YUtrMWpqVkJackpMRE9HWk1yWU1yaDFj?=
 =?utf-8?B?dENPcFV0YTREQXZLbnI4SG9xY3hjNjlaWkk4Z1RRL0ZWM1h1TTA4QVZnQ3hk?=
 =?utf-8?B?ODkvSjNIam1qaEFiWVQycXZ3OTBmNU05ZUtpVHBEcW9pOEs0TndTaG5odXBS?=
 =?utf-8?B?clZPTnNjUXp2bUJKTzRKSGxGeFFOTlQxcTBkbnNNMU1lZFNDM2F5NXVFdDlv?=
 =?utf-8?B?elk5YkJnR2lBdmI5K0RWT0JsUE1EcUlHcGVNWFdGS0c0MGdHbjFvQm9rdmdp?=
 =?utf-8?B?YjlmR3B4NGp3K2RMbTJLQWMzTHF0L3pGdy9PMlB2TnR4U1hLRDBBOU5JZWha?=
 =?utf-8?B?VndFZXBFUmFRN1dka0Q2bWJBTDRoR21pbUxvWnU3RFZXV1BMTUJtaHFpcDVH?=
 =?utf-8?B?andENTdueFJuK1VoWEMveS81d0FpNUNsaHFZWDNjNldrek1ZdzNXUDJxamhF?=
 =?utf-8?B?T1puWm9IdFVDTmVSVy9xd2FmRFRtTlJjZDN1clUvR0RCUmkzeGlXQVNvVXdF?=
 =?utf-8?B?VktFL3huelFubjdreXpXekpZUElVblUxZ2NXSStWd2pjZWJGYndHM3hDSHha?=
 =?utf-8?B?eVowVWpBN1Z0QzNXZUlVaGRrTFNBSnNyY3hlNEZ4bUVkQjc5ZGI3V0FTaHhh?=
 =?utf-8?B?c3g0NU5YdEswTVNtdTFwT3ZScnZVUFFseURWQVNyOWsvOEsyL1hsQ0Y5YWxX?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081666a8-e32e-4f54-d745-08dbf8002e94
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 15:13:07.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xYZCfw4mtsU1G8SDQhY0Jhngdpxb9Tw/eG+ESBLXmqRsOagWkBHnsOFAnBr0t3oI53kCxmXEUHdkmn0wntEdm2NwMGgg4qSxs+qgge+3Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
X-Proofpoint-GUID: FSt8gnj-dhIGru0vEEBCnPYA-_bV6HCC
X-Proofpoint-ORIG-GUID: 7vu8yzpJrSwCL80uUVdWHJ_ssbSvINDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 15:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192076

--------------8AkZafJ00lZd7JqCZgAYRymc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B8DIfV0000830

On 2023-12-08 9:46 a.m., Alexandre Belloni wrote:
> On 08/12/2023 09:05:51-0500, Randy MacLeod wrote:
>> On 2023-12-08 5:48 a.m.,Yash.Shinde@windriver.com  wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> After rust is upgraded to 1.71 and later versions, the rust oe-selfte=
st gives
>>> build errors due to unstable nightly options(see the error mentioned =
below). Thus, disable the test suite
>>> until the issue is fixed
>>>
>>> error: the option `Z` is only accepted on the nightly compiler
>>> thread 'main' panicked at 'failed to gather the target spec for x86_6=
4-poky-linux-gnu', synthetic_targets.rs:66:9
>>>
>>> Following issues are created in Yocto bugzilla and rust upstream to t=
rack this issue-
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15275
>>> https://github.com/rust-lang/rust/issues/115642
>>> https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-o=
ptions-during-bootstrapping-in-rust/103108
>>> https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1=
-73-is-bootstrapped-in-yocto-poky/102959
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>    meta/lib/oeqa/selftest/cases/rust.py | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/sel=
ftest/cases/rust.py
>>> index 7d148142fc..6dbc517006 100644
>>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>>> @@ -39,6 +39,9 @@ def parse_results(filename):
>>>    @OETestTag("runqemu")
>>>    class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResult=
TestCase):
>>>        def test_rust(self, *args, **kwargs):
>>> +        # Disable Rust Oe-selftest
>>> +        self.skipTest("The Rust Oe-selftest is disabled.")
>>> +
>>>            # build remote-test-server before image build
>>>            recipe =3D "rust"
>>>            start_time =3D time.time()
>> Thanks for the Rust update Yash and it's unfortunate that we haven't
>> resolved the problems
>> with the test suite. We decided to diskable the tests and do the updat=
e
>> because some changes
>> were blocked waiting for a newer version of Rust according to Tim.
>>
>> Yash,
>> It would be better to disable (skip) the test suite first so that ther=
e
>> isn't a commit with the testsuite
>> broken.
>>
>> Alex, the commits are independent, will you please re-order them befor=
e
>> merging?
> Sure!
In case anyone doesn't read the other thread/messages, we're going with
Alex Kiernan's patchset that starts with Yash's patch:

 =C2=A0=C2=A0 [OE-Core][PATCH 1/7] rust: Disable rust oe-selftest


../Randy

>
>> ../Randy
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------8AkZafJ00lZd7JqCZgAYRymc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-12-08 9:46 a.m., Alexandre
      Belloni wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2023120814464190b6f0e7@mail.local">
      <pre class="moz-quote-pre" wrap="">On 08/12/2023 09:05:51-0500, Randy MacLeod wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2023-12-08 5:48 a.m., <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Yash Shinde<a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
build errors due to unstable nightly options(see the error mentioned below). Thus, disable the test suite
until the issue is fixed

error: the option `Z` is only accepted on the nightly compiler
thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9

Following issues are created in Yocto bugzilla and rust upstream to track this issue-

<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275</a>
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/115642">https://github.com/rust-lang/rust/issues/115642</a>
<a class="moz-txt-link-freetext" href="https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108">https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108</a>
<a class="moz-txt-link-freetext" href="https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959">https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959</a>

Signed-off-by: Yash Shinde<a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
  meta/lib/oeqa/selftest/cases/rust.py | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7d148142fc..6dbc517006 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -39,6 +39,9 @@ def parse_results(filename):
  @OETestTag(&quot;runqemu&quot;)
  class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
      def test_rust(self, *args, **kwargs):
+        # Disable Rust Oe-selftest
+        self.skipTest(&quot;The Rust Oe-selftest is disabled.&quot;)
+
          # build remote-test-server before image build
          recipe = &quot;rust&quot;
          start_time = time.time()
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Thanks for the Rust update Yash and it's unfortunate that we haven't
resolved the problems
with the test suite. We decided to diskable the tests and do the update
because some changes
were blocked waiting for a newer version of Rust according to Tim.

Yash,
It would be better to disable (skip) the test suite first so that there
isn't a commit with the testsuite
broken.

Alex, the commits are independent, will you please re-order them before
merging?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Sure!</pre>
    </blockquote>
    In case anyone doesn't read the other thread/messages, we're going
    with <br>
    Alex Kiernan's patchset that starts with Yash's patch:<br>
    <p>&nbsp;&nbsp; [OE-Core][PATCH 1/7] rust: Disable rust oe-selftest</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:2023120814464190b6f0e7@mail.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">../Randy

-- 
# Randy MacLeod
# Wind River Linux
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------8AkZafJ00lZd7JqCZgAYRymc--

