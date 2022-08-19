Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89443C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 12:51:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2693.1660913453852364352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=kz+zF47K;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52304e8b70=dragos.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JCD6tE019154
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Kjsoq95wvl6O2jfbyDatjR8CHMlDO/NVvYvPnIva0uM=;
 b=kz+zF47KmADqr6aAPXAiyQSx7XZ/BBB823p60U+geV0/dHqu4Afm/Umv6P1tI3sSiAhM
 wQusAit1+8GSLOsifg6U+jz5YCgYByRoqzT17ad693PcuOL8V+pLxqZ4l1iKkOymYnnn
 l7D5K/WT5iqVb+mRREJxraBdd6jwaBEDYMGIEd2eSf/G9pH51ooVJjxZl2qlpxsk1ey5
 pooKpNIhCzqq9SwsPin21mufJ3GRigESmjPT9EBFi9FENrc0xpPKFDJLTzzvUgOOndwR
 xDFOsQT1kb4bCTUmkc5eaIDCCOnf2jyybpIGb0XsVVCts7A4l5bCsIbRSeqopka79S0G ug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160wch8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:50:52 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27JCoqFI032739
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 12:50:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160wch7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 12:50:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igrEC9sfFVhKRHRMyW3z+LzRaz12Q1mKLYnH6BGt4uklWkxtJhNSDsJZ9eyVwD0sdioWFIEFWtXBhrwiTkrXGUZqL34hdl5vX/COE3uwFjYTGNBj0VI0o6F655JIFtFVFx05cA++k37SOMYjFdmfefGVEy+1ZNnBDtzd2S0w/cI49nQMDpPGH1c20OaxXBAVQqLzfqDZJjnDMWPrNcFwBKYPMhNyAUK88cUzw08NmNiRPlXVlFUVHT3pXYFv8mhWWYwhX5zofqS2ZypPjCqY7CK+PxHOBiDkh2Zsnj9IFszfUR+KwyigfuvsQ4xOHvQBXJFOcxOcBcEa2aL+yFA4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjsoq95wvl6O2jfbyDatjR8CHMlDO/NVvYvPnIva0uM=;
 b=eUGpDZmUsba2gmjTVb57UCYMiBfJz4FS2LL0+G8t+Qy/9FKwXp3q6Yi8cG0l4Hc9ylHapeGgPx3CCxkRAsAfkOmgXOg0SdfmJ++6lHCV1/uUWO0ajuBK2eieOkfELb95JHrlbhF/n5fvL0jTGrxnthvpNTqmvrvauPrtKVUEnUo2qyy28tVroB7AtN/3hAxErhkqiOoluFhY9zxJjy9i1tkfKtZbJMlZpPrjDUQuRJsp3OIfQIW/wzeQx9QEcuP/mxE13KKuv9nTSg+DuupfqANHQLCEi61TDXWn0fVPtFL4lMLhDdz3MQ3OJlajq490xuzgAbpC0XFcXyFjr9U6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by MN2PR11MB3583.namprd11.prod.outlook.com (2603:10b6:208:ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 19 Aug
 2022 12:50:48 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::18c8:8786:808e:6e9a%8]) with mapi id 15.20.5525.023; Fri, 19 Aug 2022
 12:50:48 +0000
Content-Type: multipart/alternative;
 boundary="------------YzZ9Mk0lRNnoLIBb5o4Rm4Yc"
Message-ID: <c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com>
Date: Fri, 19 Aug 2022 15:50:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for
 dev-hwrng.device
Content-Language: en-US
To: Claudius Heine <ch@denx.de>, drew.moseley@gmail.com,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
From: Dragos-Marian Panait <dragos.panait@windriver.com>
In-Reply-To: <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
X-ClientProxiedBy: VI1PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::36) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e5b923-2514-428c-66b0-08da81e17095
X-MS-TrafficTypeDiagnostic: MN2PR11MB3583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PYpARTRQYz3AubjBqwEiXoHBGwscd/CkoQZsbXRVWgObsfNPY37uBU6jmWNoC7NZt1zSnANjKM9cWRKY73/Fk6CX6naH5Yv1tzmsZSwfAjH48zW8lciYfBnuJECh1PmKYUK3nIoqjxRGV2gsB9P356EKyS7+tJ93GTS0od3RQY3qrRiOqLymMBBq/5joF0VCEEc1F1BFW9mdR9kUelq0b1Wuu7u708YQHpuW50M2r1MJvvSGG8kIQFYBWvAiUdlYSFzbBp06aI2Douvg8brUTqeDpZnJGrXO6x1g4ioY9MifixuG4kh4iI4BOo7vqbHeJHGNS2AdNbj/k80gAhUe/H6qcFz2e68/DFy6TZX5ce7J8FD3VnJbNv/YnbZqIUrXSUnisnZoJUrB84QiPIBJIxzkwdcMdZnH3FdazQPO81RLCStHpQEzFEQRLFroi6QXHrqz8QRr0toQm0YjqNEIEhcOh5eaIe/hfx5as1fsNAVYsjnD/FEL1WSGP4DXPDCPCMGfpyWqKvwpRkRu/PoctedvGhsz7+f77Vd6WDHMy13E5sFndzg+C75wG2IZie/EXPutGD4C6FB2WMZ56916xwHQBv2rHimRljGauJbFQLkafumtrtGxDlWpN+yJlDmucxVPxs18yqcyZbLPpAQ5/curtaxboQGgi+AcNrvYUBbDWl7TsjLrb5Vod9a522xll6BzyQVAuPMhUoNWBlobzaGaTFTSgYprqUAoncA1YYmZd50IAGQ5+D+JqBywL//mlEyOySYGznvQKucHN/3HP8rbHCIhJ8j/qfi6lFDpG8q8CNbNKo/oOMch3Ri8DrRM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39850400004)(366004)(346002)(8936002)(38100700002)(316002)(38350700002)(5660300002)(2906002)(8676002)(31696002)(66946007)(66476007)(86362001)(4326008)(31686004)(66556008)(36756003)(6506007)(186003)(6486002)(26005)(41300700001)(6512007)(53546011)(33964004)(52116002)(478600001)(83380400001)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2hjWnk3c2Z2T1BGWTJLc0tQcjU0MVhqQjdncFNKMy9JcnNiUG9BY2RvWU5l?=
 =?utf-8?B?ZDZJZ1VUdnpXOHp5MkFwSEpxM2N6Wk5MenZ1eWEzQWpWN0N0cklmOHJWTlJu?=
 =?utf-8?B?Yi8wMUtTV21sQ1RXcWswNVpBazBHMGIvUEdpampNWDh5VnJUaS9NZ3N0Wm5G?=
 =?utf-8?B?OGE4VFVncTZ4U2Q1V1hRNXVpa283TUkwZG5zK1JFSytEZnRleVhJSTB0aUxi?=
 =?utf-8?B?OS9jWFNOVGk2L3dOT0pnbnVOdGxzSlFPRWtVUkhRN0Z1eVFNVWxpVFpoZkVr?=
 =?utf-8?B?TXV3dEw2RXhYUWltNFVKVnQrTzdTNG12QXdteHljaHFGcDZwcDJSSVg1S2g2?=
 =?utf-8?B?UDVjczFUUzhUR1dNLzkvN1NXQlhyekRwaHl1d3dXWkY5cmdoR0JLT2MvM1c1?=
 =?utf-8?B?eGUyb3VwMWt1NVdYWUJWQ2xkNjRZSjEzNWJlVFVWNGFBTlBCR3Axb1g0Tmdm?=
 =?utf-8?B?TjhvbFZXOFNtYzc4N0NLU05aS1dFbWNiZnVDbkNYTm94bWY5aUk0SHIwd1Aw?=
 =?utf-8?B?MGt0TWVEZUFJVllSSEtONFZkYzM3ZnJqS3Z3TS9RYU1TZnBub0ROZ1Vwcmo3?=
 =?utf-8?B?U2pXUGNveHR2eGtYYUwvdGV6cUVPN05uZWxtemZkZVNWbTNVZ3VCNk5wQ3py?=
 =?utf-8?B?WDBJeXdRNGNPbXJPL1lTQTV2bFNOM0gyaFAwai93WmUyVVRpTG9IMmRNcUYw?=
 =?utf-8?B?dGI4TWVyZkVHWkx6QS9ob3ZRUG1WR3FJVFZsL1JNWHk4MDVNWDhWVWEwVlZv?=
 =?utf-8?B?Rjd2WGtrRXBXVlUvMGhlVDJmSGdHVGRJSXFlR2Myc3oyYVk5a0J4djF1KzRW?=
 =?utf-8?B?SVZuTThhN0pORUc4a0tjbFNkNk5KMmtwNE9CUUlxSUduUGJHSjNvVFlNdFEy?=
 =?utf-8?B?RXozL0NqOHIyYVB3VkZua054UElENk5yUWdwMnk1Y2pEcFdTbk16cDgyNFpE?=
 =?utf-8?B?dmJ3RGVDV3dVMGd0OW5MN09LdmdxMVUrZ0Fsa2I4d1dhcTRzU00xN2ZuSFp5?=
 =?utf-8?B?eTJCaldBajFRWkdsYWN6Z1VXZldMaFdPenJHL1IyQzV6NFBpcmpLNVRSckdT?=
 =?utf-8?B?VlVHdTFCOHlhdjdJSlRnRnRjWkFic3JTc0djYUl0UHk0RGZwaG9vVHMrK1Ra?=
 =?utf-8?B?QWx6MVo1OHdCQjVmaWU5RFdVVnQySGlSbjJ0K2FERjNoNzZtdzl6VUhZMGVl?=
 =?utf-8?B?WFBJYytIWnRzaW5CbnJoL05aa2JMTXZYL0cxc3Q3S01pcFhicmdVVzh0R3dK?=
 =?utf-8?B?a3Awd29VR2dkY1RIQ0lIa3doUDMvVzdzUk1yR2xna3JiRTNxbzZOZ1NhTkg0?=
 =?utf-8?B?YzZkS1J5Z05SeDlpYy93T1krdUttSzhaeElwRkJpaWlQZHVkRVYwR1ZFalZr?=
 =?utf-8?B?VHE1eHVDeWRHdWo3dVlVU2NGSXQ2MENtK29pcTJJM01kdGZBWnZXeHcyakgz?=
 =?utf-8?B?dTlFQWxwbVBDai9xU1E0MnNKL0dtc0tNZDMvZDViRGk3QStuY0t0UGUyc3JH?=
 =?utf-8?B?RnhsUVBrbEZ1VCtadk9zM1BBRHNNSGNRWGY0bFgxcUJFYmhDZjZWNHNTSzB3?=
 =?utf-8?B?R21GMFlqUGdYbTRpRHRhR2lvWndFTEQyVmppK0xzNGtheTc0UTV5b1VYb0Na?=
 =?utf-8?B?bzFyaEFjRVJjaDMxanAvTEF0Z0U2T2czSW14MnUrcTVYRlJKb1BiMGI2c1NP?=
 =?utf-8?B?UFkvMjU3cGFyNGpYdmR6VDhmWHlRZHUwL1dvZ29LY1JaclZxR2MrTHZvOGRu?=
 =?utf-8?B?MmQ2R01LNFljVkh1ZkIySTlESXlsSHBDYjBMSWxraDFEWTZYU2tMMFVQL0Na?=
 =?utf-8?B?QU1uS29PMUdlRFhjcmhzbDJJbGJ1aGt5YzdLWHdYUzFHZ3ozUkpLdE84SUhz?=
 =?utf-8?B?dkNIOUt4bDdUb2JRQWpxUEZuMVN3NWhiNk5YQ0ROTytLeWl0dDYreDU5Rlg0?=
 =?utf-8?B?SjhIaUNld2VQYkxndGR5aDhuMVBnQmJLYms5YXhyN1lDSUJCMk05WVJzSlBp?=
 =?utf-8?B?a2pHZXhDdWpNUkpQQU56RUNNVjZCOVdJb0ViQmNXYVBxZWpTT1NHc0dmcnYv?=
 =?utf-8?B?QzNocjE2QVZ1OWorRWRTemwwZmE0Mnk4dXdBang0TFdqKzh4Y2lkcnhieTds?=
 =?utf-8?B?MkdkMzZnT29xK1Q1ZHpjd004MFhmcmJiNmNZL2tRSUg5QmhNMHRwaER2QlVT?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70e5b923-2514-428c-66b0-08da81e17095
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:50:48.5154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cYxtxc+DojNtfQpdOxHj0jKsBJhBh03PArNeSGGtcouZj5snswKk5xzp/a9oYUX67OlCkxCIdV29yjQUsGJZZYOlC8TVKYAANLSXdKzKEcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3583
X-Proofpoint-ORIG-GUID: hC8hUgvzdAF3-5yiyJeo_rdZeIeEh6-l
X-Proofpoint-GUID: eulS-e2AcMdL9E5gTH5lKKv0pI2zvwBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_07,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 12:51:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169627

--------------YzZ9Mk0lRNnoLIBb5o4Rm4Yc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27JCD6tE019154

Hi Claudius,

On 19.08.2022 12:36, Claudius Heine wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hi Dew.
>
> On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
>> From: Drew Moseley <drew@moseleynet.net>
>>
>> The previous change to remove the dependency on systemd-udev-settle
>> caused boot delays at least on qemu. It seems that change required
>> a hwrng device but that's not necessarily available on all platforms.
>>
>> This changes the "Requires" to a "WantedBy" as modeled after the
>> version of this file on Ubuntu 20.04.
>>
>> Signed-off-by: Drew Moseley <drew@moseleynet.net>
>> ---
>> =C2=A0 meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 =
+--
>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git=20
>> a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service=20
>> b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>> index 0f50890dcb..b013d95932 100644
>> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>> @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>> =C2=A0 DefaultDependencies=3Dno
>> =C2=A0 After=3Dsystemd-udev-settle.service
>> =C2=A0 Before=3Dsysinit.target shutdown.target
>> -Requires=3Ddev-hwrng.device
>> -After=3Ddev-hwrng.device
>> =C2=A0 Conflicts=3Dshutdown.target
>>
>> =C2=A0 [Service]
>> @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service
>>
>> =C2=A0 [Install]
>> =C2=A0 WantedBy=3Dsysinit.target
>> +WantedBy=3Ddev-hwrng.device
>
> This looses the order. Have you tried just replacing `Requires` with
> `Wants`. So something like this:
>
>
> ```
>
> Before=3Dsysinit.target shutdown.target
> Wants=3Ddev-hwrng.device
> After=3Ddev-hwrng.device
> Conflicts=3Dshutdown.target
>
> ```
>
> If that still would cause the long waiting time on qemu?
>
> I haven't investigated the qemu issue, but maybe qemu just doesn't
> provide a hardware random source? If it doesn't provide a hardware
> random source, then installing rng-tools on there might also not make=20
> sense.
> Alternatively maybe just adding a start timeout might solve it?
> regards,
> Claudius


I've tested the patch on a NUC7, results are the same as with qemu:
- increased boot time
- timeout for rng-tools.service
[ TIME ] Timed out waiting for device /dev/hwrng.
[DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer Daemon.

Regards,
Dragos

--------------YzZ9Mk0lRNnoLIBb5o4Rm4Yc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27JCD6tE019154

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Claudius,</p>
    <div class=3D"moz-cite-prefix">On 19.08.2022 12:36, Claudius Heine
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:6d48f3e4-28c9-848d-9b14-cb5f195=
0c4ca@denx.de">[Please
      note: This e-mail is from an EXTERNAL e-mail address]
      <br>
      <br>
      Hi Dew.
      <br>
      <br>
      On 2022-08-15 20:25, <a class=3D"moz-txt-link-abbreviated" href=3D"=
mailto:drew.moseley@gmail.com">drew.moseley@gmail.com</a> wrote:
      <br>
      <blockquote type=3D"cite">From: Drew Moseley
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:drew@moseleynet=
.net">&lt;drew@moseleynet.net&gt;</a>
        <br>
        <br>
        The previous change to remove the dependency on
        systemd-udev-settle
        <br>
        caused boot delays at least on qemu. It seems that change
        required
        <br>
        a hwrng device but that's not necessarily available on all
        platforms.
        <br>
        <br>
        This changes the &quot;Requires&quot; to a &quot;WantedBy&quot; a=
s modeled after the
        <br>
        version of this file on Ubuntu 20.04.
        <br>
        <br>
        Signed-off-by: Drew Moseley <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:drew@moseleynet.net">&lt;drew@moseleynet.net&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-support/rng-tools/rng-tools/rng-tools.service=
 | 3
        +--
        <br>
        &nbsp; 1 file changed, 1 insertion(+), 2 deletions(-)
        <br>
        <br>
        diff --git
        a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
        b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
        <br>
        index 0f50890dcb..b013d95932 100644
        <br>
        --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
        <br>
        +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
        <br>
        @@ -3,8 +3,6 @@ Description=3DHardware RNG Entropy Gatherer Daemo=
n
        <br>
        &nbsp; DefaultDependencies=3Dno
        <br>
        &nbsp; After=3Dsystemd-udev-settle.service
        <br>
        &nbsp; Before=3Dsysinit.target shutdown.target
        <br>
        -Requires=3Ddev-hwrng.device
        <br>
        -After=3Ddev-hwrng.device
        <br>
        &nbsp; Conflicts=3Dshutdown.target
        <br>
        <br>
        &nbsp; [Service]
        <br>
        @@ -32,3 +30,4 @@ SystemCallFilter=3D@system-service
        <br>
        <br>
        &nbsp; [Install]
        <br>
        &nbsp; WantedBy=3Dsysinit.target
        <br>
        +WantedBy=3Ddev-hwrng.device
        <br>
      </blockquote>
      <br>
      This looses the order. Have you tried just replacing `Requires`
      with
      <br>
      `Wants`. So something like this:
      <br>
      <br>
      <br>
      ```
      <br>
      <br>
      Before=3Dsysinit.target shutdown.target
      <br>
      Wants=3Ddev-hwrng.device
      <br>
      After=3Ddev-hwrng.device
      <br>
      Conflicts=3Dshutdown.target
      <br>
      <br>
      ```
      <br>
      <br>
      If that still would cause the long waiting time on qemu?
      <br>
      <br>
      I haven't investigated the qemu issue, but maybe qemu just doesn't
      <br>
      provide a hardware random source? If it doesn't provide a hardware
      <br>
      random source, then installing rng-tools on there might also not
      make sense.
      <br>
      Alternatively maybe just adding a start timeout might solve it?
      <br>
      regards,
      <br>
      Claudius
      <br>
    </blockquote>
    <p><br>
    </p>
    I've tested the patch on a NUC7, results are the same as with qemu:<b=
r>
    - increased boot time<br>
    - timeout for rng-tools.service<br>
    <font size=3D"2" face=3D"Helvetica, Arial, sans-serif">[ TIME ] Timed
      out waiting for device /dev/hwrng. </font><br>
    <font size=3D"2" face=3D"Helvetica, Arial, sans-serif">
      [DEPEND] Dependency failed for Hard=E2=80=A6e RNG Entropy Gatherer =
Daemon.
    </font><br>
    <p>Regards,<br>
      Dragos<br>
    </p>
  </body>
</html>

--------------YzZ9Mk0lRNnoLIBb5o4Rm4Yc--

