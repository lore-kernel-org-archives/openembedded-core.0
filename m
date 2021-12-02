Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF05C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 08:59:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5769.1638435549018435138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 00:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iUhiOCXF;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7970cc8842=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B27KIgE030665
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Dec 2021 08:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/w4o95mk3uFdlLVRa+K+HZhaDD7o6B9xK9BwZWnf654=;
 b=iUhiOCXFB3LFr/DHU2MuE296juXhvYWnwTCQ0P5bEPbIU/x/WzdvkuwE1n+a2rt+2l+N
 hMBSFtALhjOg8HEM/HYf0v19Dd5CEaiMjg7jY4PSnCxMGOv7/IiV7DuwamUQoDRlnkzS
 HguM1/F1ZW9tORa9YK7boRnbqxD53TItJt/5GwKqcfomhAO4k/Q+VTqROdpkaCk16CYH
 /M7yApslJczFkLT5ajI6hB4rkhAuDgloav2JbeTyfdA90gRfqKz35VBAmAuy9s+X8Vg6
 4orSswmY1jyVyNx21xLYsNS86QSgM1pfglurwKZodLuLQKnVXcC8sqFflP7nWyVHMPct Qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp4pns2b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 08:59:07 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1B28x7nM025928
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Dec 2021 08:59:07 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cp4pns2b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Dec 2021 08:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9JLEFsCd2R/8Un/ZZevKYejUReV2vsCe3vBwlWKDumZSdQcRSio/M/6TGZL2QU1FGtEgPqVoWoSw7LvrDiO4jJK/RIZf3zcy6uPeldpQbBoZerA0r/VryTUd0n/6sqrbtOrGb8H+fR7eOqwbBNxGRGDeyPZMC62XL8iyrDHilvWZ604jR5ylFKUTTN2mBnfE9w71/MC/vudS0FUhNrJ66B9dqNcmkKHMDNIGG/m47PRWBriMIDWV4qBZPzGrRCDtkj9U3I3W8900al8fitm8nRWnOpP5Nn1cvBwHPC0iY+fF4lMD8b194WvAzOz1rwkuqK16I8IlrS9AEgUvC+QBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w4o95mk3uFdlLVRa+K+HZhaDD7o6B9xK9BwZWnf654=;
 b=BRLswQ9xZJPW/Sd+h5/Sk8X0KCvSgiXxXFtbUzoraCbJltJFwjZPyjdtty5iIlRQu/AjcOASuKcSqy6ZY/ai2pAXu79FyPjk4ABdBv7PVXzV+v5VWP0syL7DQqG8Uu1E7OBoRc6tg0LEc/BQkWHwrbUCMEyL+6G999McbjlhTpQlzHfbErxgbltxKp8BkUiuspJSJOPP9IrusF5+PBCJvAWOvg95QMHULqJGBgjyuzdJ+JudMoszMVUcCxAgwhEaaqiS+JZgtFJ0aHRrvnB/7LB3rcqF+3D0hyekEAd0cTy8Zd6ZB/ISQXr8HZFjKRb7jVRCcdzbTJI/xyww/M3Lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Thu, 2 Dec
 2021 08:59:06 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::824:3c44:1168:fa1e]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::824:3c44:1168:fa1e%4]) with mapi id 15.20.4755.011; Thu, 2 Dec 2021
 08:59:05 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Jacob Kroon <jacob.kroon@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native/cross: make ar wrapper support to read options
 from file
Thread-Topic: [PATCH] native/cross: make ar wrapper support to read options
 from file
Thread-Index: AQHX51mGayOSsgW0l0qkCN6+Nq0fB6wfbLYA
Date: Thu, 2 Dec 2021 08:59:05 +0000
Message-ID: <b77f3385-e3c7-e86c-ce66-f66693633e4e@windriver.com>
References: <20211202083742.69650-1-hongxu.jia@windriver.com>
 <accb2806-163e-e29d-46f7-705771a231f8@gmail.com>
In-Reply-To: <accb2806-163e-e29d-46f7-705771a231f8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MW3PR11MB4633.namprd11.prod.outlook.com
 (15.20.4755.011)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
suggested_attachment_session_id: 53b2d7c9-dcdb-1d66-0da6-05bbc08128f7
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a99986c-3b47-4e10-e5e9-08d9b571fe9b
x-ms-traffictypediagnostic: MW3PR11MB4747:
x-microsoft-antispam-prvs: 
 <MW3PR11MB47478E05C389B38C26EF8BFD94699@MW3PR11MB4747.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ENP1MR6U8aFQ/i9gkjRxD1KCb7+mj9jBH6+K1oeo3IEtvydSAlB6JJf4KKDS4O5N9NiLFca4IW8y80nH3qiEiaU/l9+GAQdfdb7BCtzgavciUf96eeqkKZLita5f1/anmIBXi2WqYG/Vcb5l2VesKRR20CvKhso2vOv8wUZm5rTqr+aiojqLkSgx4jzp0LAlbLU+4H8bUCgNr21D2phWP5XDgrW/7Hb6X9Gth2S/RJro3yz7W6mdSQT7WHedrD0eJcc92kfFbvhpfJvK4YrJTFchC2OwuMluS8eF+FrUKw9dIB7PALbmqmWEEMdPiaOofiN5sBqhEv2/QtKXbWVYSOcOVxZPUsHI8MBaFzwH3jrNp8KolJO3eNEmGzBcd473GlLhrRLgJsE/FqrciLIrkBP8S8r+kyIEdwmHkyK6bRR/65U0S9PR/esbhgPbzMLdea43l3YYMUT1XVPxV5rjUMEIQkoIeBWRfzmnXTBOl7kKECXoTBYv3133+DpimQKoEn5cg9/bsWWJVDCo8NhSY6mdElGypvpUxs2vvkjiculatpv3bOW72o4tZK7GSMKpBI8BIo2CFmjTbSLtnwK2FRuJ5uIzbvJY6FPS9wkYpfyXRe/TMlnLJyLytUVzo6XNtXfx2DS2QXlbTLfV/Mv9KyfmUWwDmd0fp3miRUcKQu+M82GLJEb/AGJA2e8duQoI2S9Tru8Z0zHmBC0C34D6bKPBxf0Idy4eAKRBp8y+oEbO7NcgG5sLLyVKiEk8B0o+MYvtUNWQflcCZ5rKH9FThA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(38100700002)(508600001)(66946007)(66446008)(66476007)(31686004)(5660300002)(86362001)(26005)(64756008)(6486002)(36756003)(6506007)(2906002)(38070700005)(66556008)(122000001)(8676002)(2616005)(91956017)(316002)(110136005)(6512007)(186003)(8936002)(31696002)(53546011)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5ny0WaB58h9eVzd1NsFWai8FOHm24KXWr1848E0kTdwiVDqSn2Uag4vtYk?=
 =?iso-8859-1?Q?bhxfkh+NhbpCKsDq5LppwU6BhLfxn5J+mV3LGwAIJQfcrfOLj3/x+50Gu0?=
 =?iso-8859-1?Q?pEO1fQhalYOUICyqFE3ucosSonqk2ZUAFhzpXvjx6Mc4tmuuUCjI+umU/G?=
 =?iso-8859-1?Q?2eRNnOwFsFnXP68hn7A7D2YTmQOKJNh6meHpv5kHm8iEtpE9g5omNP5Czp?=
 =?iso-8859-1?Q?k9W8W83SLDdb2sl2vpLK5ct74vlGbvcLNFqXSaX2VxuoOwggB9q9uzq799?=
 =?iso-8859-1?Q?4U9un9+uaLYo7Y5GWVLp6kF+k758w5gwkufPF3sXcMLwu3fFQQreO03mY+?=
 =?iso-8859-1?Q?foQKj+NPMeKwp+jQGSdpqyghEkZS9C/yLEv662iZB4bm4nbUZuXTgajoMM?=
 =?iso-8859-1?Q?G4PF8bvQe2EQj9IvXaS4s/RH3JEIXUZ/EulPt/aFeRn3Ejwb0JvkX03rkq?=
 =?iso-8859-1?Q?2Ag4b7Iu7nRFMkNVmG53wot9x4xBP0CXFr9C9r/CJ7dlcBZnbcNuc0cxUr?=
 =?iso-8859-1?Q?m1NotZ7X6eNWHH1Q8rC9TkWANGlj0fLuQa4yblE77uWJOqauAv+QaLxbu5?=
 =?iso-8859-1?Q?5MIPN4SU8tEdg04qtNEmgB2BExCeoad8Wa44R+LGbzUxS1UAZhJ17/ZTyh?=
 =?iso-8859-1?Q?8JMoD4OpLvM4Y1Naj05nyrSszTNSsjAwConZz4NziW1h/okB9Y4DrWTdR/?=
 =?iso-8859-1?Q?I1pJ+meHq6NnIgLrnBLTS9a7V/kWFQgdFpGJ2E+/JXjVyqdRRFyrQMfLjQ?=
 =?iso-8859-1?Q?a2K0uqcYsZQxC8bpV6Jw8zEeMAwNsMCr75IgRrxOI8vQC4HENxrvI73VNo?=
 =?iso-8859-1?Q?bqaQNBtkw93quT1CmCEJukYIsRh21AkZBI6srX10O9uQN+w9LnH6DOBoMb?=
 =?iso-8859-1?Q?hSgmZlSoQ4Q2ITzcfqFedrvGVHrmEoma9ISMlK62JNkgqLKJEj6cntvRXt?=
 =?iso-8859-1?Q?nZdwwplHtEv3wiYD+Zd+USWgOLPVJ3W8gImXqf50Xj5zCzSAIVJv3MM/su?=
 =?iso-8859-1?Q?mXzO8ATRfzwvvKFnAor+Qc6xpS7LM3qKi32ZqJ5j51iKwxn6xgiYk0ifq+?=
 =?iso-8859-1?Q?EXjzQWDpOttAn/Yt2sUI3Y886wj+isafLHb9MNb+m6GO7upl6QTJ+chUQP?=
 =?iso-8859-1?Q?KZtDcvuVr2jWiuLu4oGoHwBVt88qE2DQybVMJqMwZ8eyRi2psZix95Jk5F?=
 =?iso-8859-1?Q?UtxSu42vL8Z9HeBFZBLpMeudvYX+lzbwyH1k0X3ETGC2LS565m6o7CU2Bj?=
 =?iso-8859-1?Q?Syy2aZljCJSvWE8ql8ZuXzbupdOyiOpvo0sMqzMaJdgXDOeRFF7zZ/lLvz?=
 =?iso-8859-1?Q?V94kUy+K8c8d1Hhggn5YiJhq8jb4akr0pjfCzdNjgFf1vMq2dGRoHNNFT9?=
 =?iso-8859-1?Q?+K8vWELp8zMFG20Sts6H0mmNQwSLaCeOb6sebmXxL/Qw3pfTqh03g7Kj8t?=
 =?iso-8859-1?Q?cToV8ZqHBoWV7/Q0xJMGvoOC4CEtYfCpJlG+XhmC0gJsW0rk+mA7uUwgKP?=
 =?iso-8859-1?Q?9KI+CPPelZIhxt8DIcIotXsz5eyvys2KUbVWIHJ2gWfCuMvUU+/Cld/ugG?=
 =?iso-8859-1?Q?jCvzC1C+QE608azGGYSyteoUWO3PgeJA449I7EPCTwLhaGjREcNss66DDR?=
 =?iso-8859-1?Q?Usw/uzQSITGs+4zahg5i/Cs5UiG4g/qJ/RWlQ9T3t4OaJsEK1c0ePYVMDA?=
 =?iso-8859-1?Q?Q6Z4lpeEzZYpnMw0EOt4S0OvyjvvNwsL/CiKUF3c?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: 
 <7DAA25C505506A4A9CA1712E46851247@windriversystems.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a99986c-3b47-4e10-e5e9-08d9b571fe9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 08:59:05.5256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 orVrMsB80/uZn2qnLuwECUS7iZ3Per0srWGyqtSSFARedgrtxROucRduMGYqs63rA0GBzUdDXVA4os+j1aiw4PhatQzCAOq+n3n+z4zH0nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-GUID: FeFCrW1JClMfbJIrC9CuW1o0phyBLHz0
X-Proofpoint-ORIG-GUID: L-u4jOFjepvnq5iH6Q5gcvEzYoJp-1Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-12-02_05,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 08:59:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159078

On 12/2/21 4:49 PM, Jacob Kroon wrote:=0A=
> [Please note: This e-mail is from an EXTERNAL e-mail address]=0A=
>=0A=
> On 12/2/21 09:37, Hongxu Jia wrote:=0A=
>> If ar input params starts with @, it means to read options from file=0A=
>> $ ar -h=0A=
>> ...=0A=
>>    @<file>      - read options from <file>=0A=
>> ...=0A=
>>=0A=
>> It failed to call ar wrapper to read options from file:=0A=
>> $ path_to/oe-core/scripts/native-intercept/ar @bazel-out/k8-opt/bin/exte=
rnal/llvm-project/llvm/libSupport.a-2.params=0A=
>> |path_to/oe-core/scripts/native-intercept/ar: invalid option -- '@'=0A=
>> | Usage: path_to/oe-core/scripts/native-intercept/ar [emulation options]=
=0A=
>> [-]{dmpqrstx}[abcDfilMNoPsSTuvV] [--plugin <name>] [member-name] [count]=
 archive-file file...=0A=
>>=0A=
>> If input params start with @, append option -D to argv list=0A=
>>=0A=
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>=0A=
>> ---=0A=
>>   scripts/native-intercept/ar | 2 ++=0A=
>>   1 file changed, 2 insertions(+)=0A=
>>=0A=
>> diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar=
=0A=
>> index dcc623e3ed..32f45171d6 100755=0A=
>> --- a/scripts/native-intercept/ar=0A=
>> +++ b/scripts/native-intercept/ar=0A=
>> @@ -19,6 +19,8 @@ argv =3D sys.argv=0A=
>>   if argv[1].startswith('--'):=0A=
>>       # No modifier given=0A=
>>       None=0A=
>> +elif argv[1].startswith('@'):=0A=
>> +    argv.append('-D')=0A=
>>   else:=0A=
>>       # remove the optional '-'=0A=
>>       if argv[1][0] =3D=3D '-':=0A=
>>=0A=
> I am a little surprised this works, since "-D" would be placed after any=
=0A=
> archive/member parameters. But if does, ok.=0A=
I've several tries, and append -D works well=0A=
=0A=
> Otherwise maybe we should just give up if there is a '@' and fallback to=
=0A=
> not modifying the args, unless we want to process the file itself in the=
=0A=
> wrapper.=0A=
=0A=
This is my original trying, if above failed in some cases, we have to =0A=
give up to support determinism for @=0A=
=0A=
//Hongxu=0A=
=0A=
> Jacob=0A=
=0A=
=0A=

