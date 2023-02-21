Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6871DC64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:14:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52906.1677010455245499110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QP0RIosi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141607783a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDbINb023967
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=c7Ki0e4/n7Pksf9T0KIZ9EaBONIgCWfzEH30ZNZBbsY=;
 b=QP0RIosiD6gg6TwYkcSrnDBMrPwLFTy+PNdVgKgduIAXFpNQttOtqHAfA2q0+4gP/loH
 OKQxwH3whkri7HX8ZVmPUOBiRO4SjZyvl4VOADLdlppXQaDYM3Vrfr99IxMpf5ix49gn
 MmrtLFFdg2Iv3BuwTH6xf267hpSm46NlXG4e8dCsEYSFBfpa2k4M3owrnhgsAEfos5vm
 iKbiKN8eGIUckvN6uU0HqGJA/biKGQlO0JDXqhz7vuMtBtTwkVCRO9H5T99PbuaiWIzP
 ZgNSxoFQPMBuRi9LP5Di82aI4XwihXrtDNIayYKbusAl+5K6PmrxeL7q1IJhpOYQfQVN hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3u1sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:14:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31LKEDQL022553
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:14:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3u1sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 20:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoNl9dxqOoOCm/VzEEdx634/wK87NKnXAeW8N7BnfSV13aS6hHj55uCrd4zTtpTSmfqkWJmZ+x7/OuE90GzStw5r3gml1g4xSuSVgdsVCvTRAk6CUhzjv6Tg8SMs50TckEg0fQx840JE6qNzZrfysyHrH10KZaIp2H6qtRTUyAcHPvzVYDn9FADqMQYaCCVYZ9TB9H74ee8tCPcTQZVOEdHpi6rj/UXajI+BpK2n/1yj4asdHYpLXTnRBJJY31ESlfmkmok3OOd1qB008y7+cpwE8OiFi6/1j+MLEJ8umKCStdUyuBWGu3JWTogbwke7zBUJ0Gld0ngWKLtYaX8kvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7Ki0e4/n7Pksf9T0KIZ9EaBONIgCWfzEH30ZNZBbsY=;
 b=lEU33B1mVSIMCF4Z9lWs1akc857s1vUy3L1wpsTZckRIw2f4MdakEZPoCpZeruBx8fiVmtY59ewyeVjR4GLjbYydwZtFccgYV9eHkRtyGAUvNhhkSpISmY9Uifj9YBFJ4J5856fDdd/fwgWkpA6j9iXfAskhWyhRPrupE/46bb+kebYPrOSijRxhKs6YZAfZ5WXmUBJ9earIPj4TUzQvgiopwN4CI+pNMMnTLBfpu9uC4r3eXyCYDg6cT3j8/9jVpOoGTXJ4295xC5SVP85xyGpaB88NoiDSrMTZ/we3BtW+o4nWVoMHlzQJNDTd2e+t1qUUyBhkoA7rwhb3Sr49zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 20:14:07 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 20:14:06 +0000
Content-Type: multipart/alternative;
 boundary="------------68PbHmSfkWpOmxYS0FMcFXBI"
Message-ID: <799c12d9-92b2-34ea-6870-075bd2ea8692@windriver.com>
Date: Tue, 21 Feb 2023 15:14:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [kirkstone][PATCH 0/1] Update webkitgtk to 2.38.4 for
 CVEs
Content-Language: en-CA
To: kai.kang@eng.windriver.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230213055043.15294-1-kai.kang@windriver.com>
 <CAOSpxdY3vz2p083y=5gUzFcYSS6DpafGN=qNtS_9sP+Nip90pw@mail.gmail.com>
 <65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc79bc2-10c1-4cd6-0d66-08db14482e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	npcj0FgF0axr+/YYmh4eAi0+ePqZ+q6eKYnoEf/kps+z5aBMuXLbfbIZRzv9OUJUKA8QT0/zlX9SK/6MRmn9k5WQLN9dBJ79yQIPx2KXqX71ZVAOFbmrqMyo7e0tVHcWG8u7lEzh4Chytpl8uVjPRk5mrwh49X+VK6k8j+8kjZJpIua8wPNY5R/hQOZ6RRxpI5D6DD/9Yzk1fuSrB4vhiPQ6b7B89QP+UXwCk0pvf6RLRdGps5VoAJU0xKrO4MQejNuTi8GPb9LGQTRzo6zvdkA6i2T/D4fpR5TyWk8lyEUqKQndSegbcMjSDhmAYL4iIk6woT7ZjULTzKlveYzvUF7hieYMLSqjPvd8Yavwx9NtdMcIzkR6cuqaFIlqMuv3wV10Hf5juqZF3OY+BiZIlDBlFPC7++9BoaGjc0Ez/we2PgeG728HZ33sRJS2PCyayZsyyhQFY6auJqgBpv8XA3AHF48Me1OW7qH3FjS8tFbJj4Yztx2+u4SVdty5mFVSueCEzKfTNjdpUFd9xS0zPPJS+SYDJmHeDXKJRE+1h306NPhCu4fVdRrhXsetRCMkyhei9JbSd2nOy9elQwJVIgQkapx+qte1eAK0wfIXwFI6kg+BS8cDLGdunsL2o5Oy/rLp7OK0jNPnKHelcRU5ul7pMeVakIe73zkSRONwRqvmPD8Q2vN+aeB+RkC5+n9ruZDoIv7OmCx13e7aKU/Hk2+mWHqNV2i0KwhKOudxArIA+Taj5B8M54mfr+F4nhWS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199018)(83380400001)(66556008)(66476007)(8676002)(8936002)(6916009)(66946007)(5660300002)(316002)(6666004)(2616005)(41300700001)(186003)(478600001)(6512007)(26005)(33964004)(6486002)(53546011)(6506007)(966005)(4326008)(36756003)(86362001)(15650500001)(2906002)(30864003)(166002)(38100700002)(66899018)(31686004)(31696002)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXhnRXdJbFJjWUZyVUJJNUFIcUppNVhCdHBMQm0zYllNdVpqRGdyZkx1MU1w?=
 =?utf-8?B?MUJPWWJMK0h1dWJxR0tpR0U5NXJvQUtER05qY1NwRVVLOGN0TDJ4WmdTQitB?=
 =?utf-8?B?Sjh4Qndscngrd09IcTVhZ1dJVGZhcXRyVk1TcVJIbTRIbzkzSi9aTE1kVGE2?=
 =?utf-8?B?YURqSndLMFpmODJVWnpRbmExZy95cFRtS2VONDBFK1dKMERFQ0tkcUdudXdx?=
 =?utf-8?B?eUlHSW9rUXlndzlaYXc0SHcvTzc5YmFBVVJYanRzcEpUdXZzL1Z1SGhLRTBV?=
 =?utf-8?B?emFhWm9zM0hEWTdDRGNNREJsWS9CenUxSnZ3cGZIWDRaZW1oYjdOSEVUNVlr?=
 =?utf-8?B?T3pQbXYwMzYzL3oxck91dGNJbXNrTU8wK3QyeTJvOTlLYVV4VnJ2TGRDaXVn?=
 =?utf-8?B?cVpaREVJWDREY0hkRHRIVkFZOWpFT1ZHa2xlbS9KbkJqSzk5L0VGeHo2Wno2?=
 =?utf-8?B?Y1ZjSjhoUC9jSkREM2xmaVJxMW02bFdzaDU4ZVZDVGRoclJCRHdUdVhzeVNU?=
 =?utf-8?B?WmtScDA1UCtJd3djK0luVU9UU2Rtd1FIOXBxSVhrRUJjRVFmdElQNGp3dC9N?=
 =?utf-8?B?eDgxTTRaVUI4RzJxR0dLbGdCVTdoR0RvSzc1YWwyY0ZVZkxpUFQ0NFl4UU5N?=
 =?utf-8?B?K0FaVFlVUHZtaDVFS2ljYnd6R0JDMC9POWZjWUVucHBoMmRzakVqVFVsK0d0?=
 =?utf-8?B?aGJQWkFkZ1lyZ2l0dElkZGI4Q3RRQTRydGxzNmpUeldxYzZ1bVBjdDZzNUw5?=
 =?utf-8?B?TGNia1p3cmg0eVhhb01KVEo3TlRKNXNCRmtrZ1J5TUJQUFlVVStsa25xclJU?=
 =?utf-8?B?cjY0NGtKQkVsVEFHYjU3QVgrNHhjOWpqZzhVOUZ0ZHdkaVNidGd1WnpvaE5J?=
 =?utf-8?B?VWcxZGpvU3c1MTQ1OFByQUY1OENJaHlGV0FheXczdnNoR201R3RibWJFUWMy?=
 =?utf-8?B?QmxDZVptTUxia0lWRiszb1J6cDFrZGpVbXR5RndiM2ZoS1B2bEk4YVVaWnpM?=
 =?utf-8?B?NW92L3R0TnluUkZOT29zTVdXVUkxU0JYV0JUaGRpMXpSVitaVjhxMXdOOUgy?=
 =?utf-8?B?WTR4a2ZBZnZRQTRzbUgzeXY3dnNPckhVUlVsdGFGckdYYVRFWjdMMFRmeUc4?=
 =?utf-8?B?Y3dSRmJuWlNiRXNobUg3TmRGZzIvVUZMdUc5TzJlcUNySHBnNW1vRVpCT05k?=
 =?utf-8?B?alRQZ0VtRExlYUhycGZhWDB1UE0zc3lXMHY0U284Z0JJVFRSVjRGOE5jOU40?=
 =?utf-8?B?d1ZDN0d0ODEvbHQ4NnFNZzMzWVUwNVVWVkZpSitFemdIODMzTWt1YkdzYkFx?=
 =?utf-8?B?LzNtMlM1YTZLRVBrQUVqam9TQUxNMmNRNFpjbXc5dDVpcTJvT3VjbUxrbjZM?=
 =?utf-8?B?WU9LbkJzYUxSa3dod3JiMExNTUQxZ3RYVHVDcDloQzJ2cGt6bW5lUDAyTFZI?=
 =?utf-8?B?OU5QQnJNVHBQMVM2bzdhVXhmd3ZJMElMbnRpMFlxbTdYR21PblZ3U2d6cnh6?=
 =?utf-8?B?OFZ6amtmQ1I1Y2F3dXRGR3RFNGNIQmNtUXJqU2NCMVR3alJlQlB2MXdEV2Nr?=
 =?utf-8?B?NVRNUFRJZFhkSFpXdzA5SjJ6WFhYWWpBSTQwRzNZWGcrUVBxOC9ScmQraWc2?=
 =?utf-8?B?Sjk3MVcyVkRLZ04xa25yUks2cGZna0Rzd1M3T0FWUDJOOFZpcEszQmdiVXI1?=
 =?utf-8?B?Smk2UDN4OE9LQXQwcU5yWVZQM2dnSU01NUErN0RzUHZIQ0R3OEZNZHhRUXFa?=
 =?utf-8?B?NWxVNWZqS0t1L0t4aHNYclBudzJPNXc1OXRDZ3dCN3pTR2xqaE10cEVTbERn?=
 =?utf-8?B?dUg0TXN3UFB2Ny93NVo5TUliNS9oMTJ0d1RIQVRoT1doK2pOUk5TL1BBNzRU?=
 =?utf-8?B?RlE4LzFYM3kxQndPZ3pQY1IyR3hJdmtwYTUzUFMxZUdxMlB3SDc3cmI3ZWJV?=
 =?utf-8?B?WENGbTBCczZkUmpWZUJ1blB6ZG4wSFJrYkpZQzJYenhrWDFXeVc0YmlxN0Qw?=
 =?utf-8?B?STlVbUJpam9nNzEyWDR2K2pIcFJQWDhRdE5CRG1ZTnR6QWhUMjZyOEQ3dlUx?=
 =?utf-8?B?cUI3UDBrQUxEdmdIR3UzdE1aeGNsT2w5YVlRZ0ppRzV6SFBMYmsrQS9oMmk4?=
 =?utf-8?B?c2tObmVwU2V2QTVDSG5tYUlzaUV3MHV5aVhGVElnSUtWc2hsaWwxWVVSYmMv?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc79bc2-10c1-4cd6-0d66-08db14482e9b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 20:14:06.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNDfGUK+SEaa4NZgGIVH37QrNl30JnZ21sq9vLlA/qdCDZ1WDVNB3/45QDfGpO4rMYjdlI5NOA1vRXhBEUfWDESmdJ8ZgJxwrf3LaAdhbVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
X-Proofpoint-GUID: et0_IFmO1Pg9-y94fodRKgcECK3wS6pv
X-Proofpoint-ORIG-GUID: JJQx3acjvQFfx3RNN1hOLtAN0B2l56Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177537

--------------68PbHmSfkWpOmxYS0FMcFXBI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31LDbINb023967

On 2023-02-14 20:55, Kai Kang via lists.openembedded.org wrote:
> On 2/15/23 00:22, Steve Sakoman wrote:
>> Stable branch policy doesn't allow this type of version upgrade.=C2=A0=
 I
>> can only take upgrades that are strict bug/security fix only releases.
> The reason that why upgrade webkitgtk directly is that there is no=20
> obvious single patch to fix CVEs.
> It just declares that some CVEs have been fixed in x.x.x version. And=20
> update to 2.38.4 could resolve
> 15 CVEs at least.


Can you check with the webkit devs to see if there's going to be a 2.36.9=
?
If one isn't planned then send an email to the Yocto TSC with that eviden=
ce.


>>
>> Exceptions to the policy would require TSC approval.
>
> Who is TSCer? Would he/she like to review it, please?

https://wiki.yoctoproject.org/wiki/TSC


  Members

  * Richard Purdie (Linux Foundation) - TSC Chair
  * Khem Raj (Comcast) - YP Membership Elected
  * Ross Burton (Arm) - YP Membership Elected
  * Armin Kuster - OE Elected
  * Denys Dmytriyenko - OE Elected

tsc@lists.yoctoproject.org.

../Randy


>
> Thanks,
> Kai
>
>>
>> Best regards,
>>
>> Steve
>>
>> On Sun, Feb 12, 2023 at 7:50 PM Kai Kang <kai.kang@eng.windriver.com>=20
>> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Update webkitgtk 2.36.8 to latest version 2.38.4 which solves a lot=20
>>> of CVEs.
>>>
>>> The diff output of header files is attached at the end of this file.
>>>
>>> Kai Kang (1):
>>> =C2=A0=C2=A0 webkitgtk: 2.36.8 -> 2.38.4
>>>
>>> =C2=A0 ...spection.cmake-prefix-variables-obta.patch |=C2=A0 39 +--
>>> =C2=A0 .../0001-Fix-build-without-opengl-or-es.patch | 133 --------
>>> =C2=A0 ...tings-so-that-gtkdoc-generation-work.patch |=C2=A0 47 ---
>>> =C2=A0 ...trospection-files-do-not-quote-CFLAG.patch |=C2=A0 78 -----
>>> =C2=A0 ...44e17d258106617b0e6d783d073b188a2548.patch | 296=20
>>> ++++++++++++++++++
>>> =C2=A0 ...bb461f040b90453bc4e100dcf967243ecd98.patch |=C2=A0 30 ++
>>> =C2=A0 ...ebkitgtk_2.36.8.bb =3D> webkitgtk_2.38.4.bb} |=C2=A0 15 +-
>>> =C2=A0 7 files changed, 348 insertions(+), 290 deletions(-)
>>> =C2=A0 delete mode 100644=20
>>> meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-e=
s.patch
>>> =C2=A0 delete mode 100644=20
>>> meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that=
-gtkdoc-generation-work.patch
>>> =C2=A0 delete mode 100644=20
>>> meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-f=
iles-do-not-quote-CFLAG.patch
>>> =C2=A0 create mode 100644=20
>>> meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b18=
8a2548.patch
>>> =C2=A0 create mode 100644=20
>>> meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf96724=
3ecd98.patch
>>> =C2=A0 rename meta/recipes-sato/webkit/{webkitgtk_2.36.8.bb =3D>=20
>>> webkitgtk_2.38.4.bb} (92%)
>>>
>>> --=20
>>> 2.17.1
>>>
>>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h=20
>>> 2022-06-30 17:49:25.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h=20
>>> 2022-09-20 16:13:44.000000000 +0800
>>> @@ -23,7 +23,7 @@
>>> =C2=A0=C2=A0 * THE POSSIBILITY OF SUCH DAMAGE.
>>> =C2=A0=C2=A0 */
>>>
>>> -#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION)
>>> +#if !defined(__JSC_H_INSIDE__) && !defined(JSC_COMPILATION) &&=20
>>> !defined(WEBKIT2_COMPILATION)
>>> =C2=A0 #error "Only <jsc/jsc.h> can be included directly."
>>> =C2=A0 #endif
>>>
>>> @@ -42,7 +42,9 @@
>>> =C2=A0 #=C2=A0=C2=A0=C2=A0 define JSC_API __attribute__((visibility("=
default")))
>>> =C2=A0 #endif
>>>
>>> +#ifndef __GI_SCANNER__
>>> =C2=A0 #define JSC_DEPRECATED JSC_API G_DEPRECATED
>>> =C2=A0 #define JSC_DEPRECATED_FOR(f) JSC_API G_DEPRECATED_FOR(f)
>>> +#endif /* !__GI_SCANNER__ */
>>>
>>> =C2=A0 #endif /* JSCDefines_h */
>>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h=20
>>> 2022-06-30 17:49:25.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h=20
>>> 2022-09-20 16:13:44.000000000 +0800
>>> @@ -49,6 +49,21 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JSC_VALUE_PROPERTY_WRITABLE=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D 1 << 2
>>> =C2=A0 } JSCValuePropertyFlags;
>>>
>>> +typedef enum {
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_NONE =3D 0,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_INT8,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_INT16,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_INT32,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_INT64,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_UINT8,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_UINT8_CLAMPED,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_UINT16,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_UINT32,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_UINT64,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_FLOAT32,
>>> +=C2=A0=C2=A0=C2=A0 JSC_TYPED_ARRAY_FLOAT64,
>>> +} JSCTypedArrayType;
>>> +
>>> =C2=A0 struct _JSCValue {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> @@ -246,6 +261,55 @@
>>> =C2=A0 jsc_value_function_callv (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value,
>>> guint=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_parameters,
>>> JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 **parameters) G_GNUC_WARN_UNUSED_RESULT;
>>> +JSC_API JSCValue *
>>> +jsc_value_new_array_buffer (JSCContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *context,
>>> + gpointer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 data,
>>> + gsize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size,
>>> + GDestroyNotify=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destroy_no=
tify,
>>> + gpointer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 user_data);
>>> +
>>> +JSC_API gboolean
>>> +jsc_value_is_array_buffer (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API gpointer
>>> +jsc_value_array_buffer_get_data (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value,
>>> + gsize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *size);
>>> +
>>> +JSC_API gsize
>>> +jsc_value_array_buffer_get_size (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API JSCValue *
>>> +jsc_value_new_typed_array (JSCContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *context,
>>> + JSCTypedArrayType=C2=A0=C2=A0=C2=A0=C2=A0 type,
>>> + gsize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 length);
>>> +
>>> +JSC_API JSCValue *
>>> +jsc_value_new_typed_array_with_buffer (JSCValue=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> *array_buffer,
>>> + JSCTypedArrayType=C2=A0=C2=A0=C2=A0=C2=A0 type,
>>> + gsize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset,
>>> + gssize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 length);
>>> +
>>> +JSC_API gboolean
>>> +jsc_value_is_typed_array (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API JSCTypedArrayType
>>> +jsc_value_typed_array_get_type (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API gpointer
>>> +jsc_value_typed_array_get_data (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value,
>>> + gsize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *length);
>>> +
>>> +JSC_API gsize
>>> +jsc_value_typed_array_get_length (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API gsize
>>> +jsc_value_typed_array_get_size (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API gsize
>>> +jsc_value_typed_array_get_offset (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> +
>>> +JSC_API JSCValue *
>>> +jsc_value_typed_array_get_buffer (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>>
>>> =C2=A0 JSC_API gboolean
>>> =C2=A0 jsc_value_is_constructor (JSCValue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *value);
>>> diff -Nur 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h=20
>>> 2023-02-12 23:02:14.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h=20
>>> 2023-02-13 11:34:32.000000000 +0800
>>> @@ -44,7 +44,7 @@
>>> =C2=A0=C2=A0 * application compile time, rather than from the library=
 linked
>>> =C2=A0=C2=A0 * against at application run time.
>>> =C2=A0=C2=A0 */
>>> -#define JSC_MINOR_VERSION (36)
>>> +#define JSC_MINOR_VERSION (38)
>>>
>>> =C2=A0 /**
>>> =C2=A0=C2=A0 * JSC_MICRO_VERSION:
>>> @@ -53,7 +53,7 @@
>>> =C2=A0=C2=A0 * application compile time, rather than from the library=
 linked
>>> =C2=A0=C2=A0 * against at application run time.
>>> =C2=A0=C2=A0 */
>>> -#define JSC_MICRO_VERSION (8)
>>> +#define JSC_MICRO_VERSION (4)
>>>
>>> =C2=A0 /**
>>> =C2=A0=C2=A0 * JSC_CHECK_VERSION:
>>> @@ -61,6 +61,8 @@
>>> =C2=A0=C2=A0 * @minor: minor version (e.g. 2 for version 1.2.5)
>>> =C2=A0=C2=A0 * @micro: micro version (e.g. 5 for version 1.2.5)
>>> =C2=A0=C2=A0 *
>>> + * Check the version of JSC header files at compile time.
>>> + *
>>> =C2=A0=C2=A0 * Returns: %TRUE if the version of the JavaScriptCore he=
ader files
>>> =C2=A0=C2=A0 * is the same as or newer than the passed-in version.
>>> =C2=A0=C2=A0 */
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticatio=
nRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticatio=
nRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticatio=
nRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticatio=
nRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -52,6 +52,7 @@
>>> =C2=A0 struct _WebKitAuthenticationRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSes=
sion.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSes=
sion.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSes=
sion.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSes=
sion.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -58,12 +58,14 @@
>>> =C2=A0 struct _WebKitAutomationSession {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitAutomationSessionPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitAutomationSessionClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
st.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
st.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
st.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
st.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitBackForwardList {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitBackForwardListPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitBackForwardListClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
stItem.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
stItem.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
stItem.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardLi=
stItem.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -43,12 +43,14 @@
>>> =C2=A0 struct _WebKitBackForwardListItem {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GInitiallyUnowned parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitBackForwardListItemPrivate *priv=
;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitBackForwardListItemClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GInitiallyUnownedClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h=
=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h=
=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h=
=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitContextMenu {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitContextMenuPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitContextMenuClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager=
.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager=
.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager=
.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager=
.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -74,12 +74,14 @@
>>> =C2=A0 struct _WebKitCookieManager {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitCookieManagerPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitCookieManagerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -45,4 +45,11 @@
>>> =C2=A0 #define WEBKIT_DEPRECATED WEBKIT_API G_DEPRECATED
>>> =C2=A0 #define WEBKIT_DEPRECATED_FOR(f) WEBKIT_API G_DEPRECATED_FOR(f=
)
>>>
>>> +/**
>>> + * WEBKIT_DEPRECATED_FOR: (skip)
>>> + * @f: replacement symbol name
>>> + *
>>> + * Marks a symbol as deprecated, indicating a replacement.
>>> + */
>>> +
>>> =C2=A0 #endif /* WebKitDefines_h */
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPer=
missionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPer=
missionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPer=
missionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPer=
missionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -49,6 +49,7 @@
>>> =C2=A0 struct _WebKitDeviceInfoPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -46,15 +46,18 @@
>>> =C2=A0 struct _WebKitDownload {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitDownloadPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitDownloadClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< public >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gboolean (* decide_destination)=C2=A0 =
(WebKitDownload *download,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const gchar=20
>>> *suggested_filename);
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h=
=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h=
=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h=
=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -64,12 +64,14 @@
>>> =C2=A0 struct _WebKitEditorState {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitEditorStatePrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitEditorStateClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h=20
>>> 2023-02-12 23:58:45.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h=20
>>> 2023-02-13 12:30:22.000000000 +0800
>>> @@ -198,6 +198,10 @@
>>>
>>> =C2=A0 WEBKIT_API GType
>>> =C2=A0 webkit_media_capture_state_get_type (void);
>>> +#define WEBKIT_TYPE_WEB_EXTENSION_MODE=20
>>> webkit_web_extension_mode_get_type ()
>>> +
>>> +WEBKIT_API GType
>>> +webkit_web_extension_mode_get_type (void);
>>> =C2=A0 /* Enumerations from WebKitWebsiteData.h. */
>>> =C2=A0 #define WEBKIT_TYPE_WEBSITE_DATA_TYPES=20
>>> webkit_website_data_types_get_type ()
>>>
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h=20
>>> 2023-01-27 21:16:47.000000000 +0800
>>> @@ -147,6 +147,8 @@
>>> =C2=A0=C2=A0 * @WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE: The =
JSON=20
>>> source for a content filter is invalid.
>>> =C2=A0=C2=A0 * @WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND: The reque=
sted=20
>>> content filter could not be found.
>>> =C2=A0=C2=A0 *
>>> + * Errors that can occur while compiling content filters.
>>> + *
>>> =C2=A0=C2=A0 * Since: 2.24
>>> =C2=A0=C2=A0 */
>>> =C2=A0 typedef enum {
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDataba=
se.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDataba=
se.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDataba=
se.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDataba=
se.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -46,12 +46,14 @@
>>> =C2=A0 struct _WebKitFaviconDatabase {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitFaviconDatabasePrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitFaviconDatabaseClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRe=
quest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRe=
quest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRe=
quest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRe=
quest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -50,6 +50,7 @@
>>> =C2=A0 struct _WebKitFileChooserRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindControlle=
r.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindControlle=
r.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindControlle=
r.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindControlle=
r.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -75,6 +75,7 @@
>>> =C2=A0 struct _WebKitFindControllerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissio=
nRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissio=
nRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissio=
nRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissio=
nRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -50,6 +50,7 @@
>>> =C2=A0 struct _WebKitFormSubmissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h=20
>>> 2022-06-30 17:49:38.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -47,6 +47,7 @@
>>> =C2=A0 struct _WebKitFrame {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitFramePrivate *priv;
>>> =C2=A0 };
>>>
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationMa=
nager.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationMa=
nager.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationMa=
nager.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationMa=
nager.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -53,6 +53,7 @@
>>> =C2=A0 struct _WebKitGeolocationManagerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPe=
rmissionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPe=
rmissionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPe=
rmissionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPe=
rmissionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -50,6 +50,7 @@
>>> =C2=A0 struct _WebKitGeolocationPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult=
.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult=
.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult=
.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult=
.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -66,12 +66,14 @@
>>> =C2=A0 struct _WebKitHitTestResult {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitHitTestResultPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitHitTestResultClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissin=
gMediaPluginsPermissionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissin=
gMediaPluginsPermissionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissin=
gMediaPluginsPermissionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissin=
gMediaPluginsPermissionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -43,12 +43,14 @@
>>> =C2=A0 struct _WebKitInstallMissingMediaPluginsPermissionRequest {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitInstallMissingMediaPluginsPermis=
sionRequestPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitInstallMissingMediaPluginsPermissionRequestClass=
 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySyste=
mPermissionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySyste=
mPermissionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySyste=
mPermissionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySyste=
mPermissionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -50,6 +50,7 @@
>>> =C2=A0 struct _WebKitMediaKeySystemPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPol=
icyDecision.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPol=
icyDecision.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPol=
icyDecision.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPol=
icyDecision.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -53,6 +53,7 @@
>>> =C2=A0 struct _WebKitNavigationPolicyDecisionClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitPolicyDecisionClass parent_class=
;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.=
h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.=
h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.=
h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.=
h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitNotification {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitNotificationPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitNotificationClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitOptionMenu {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitOptionMenuPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitOptionMenuClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h
>>> --- 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++ 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -43,12 +43,14 @@
>>> =C2=A0 struct _WebKitPlugin {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitPluginPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitPluginClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPe=
rmissionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPe=
rmissionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPe=
rmissionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPe=
rmissionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -50,6 +50,7 @@
>>> =C2=A0 struct _WebKitPointerLockPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecisio=
n.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecisio=
n.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecisio=
n.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecisio=
n.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -51,6 +51,7 @@
>>> =C2=A0 struct _WebKitPolicyDecisionClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWi=
dget.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWi=
dget.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWi=
dget.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWi=
dget.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitPrintCustomWidget {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitPrintCustomWidgetPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitPrintCustomWidgetClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< public >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 (* apply)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (WebKitPrintCustomWidget=20
>>> *print_custom_widget,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GtkWidget *widget);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 (* update)=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(WebKitPrintCustomWidget=20
>>> *print_custom_widget,
>>> @@ -57,6 +59,7 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GtkPageSetup *page_setup,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GtkPrintSettings=20
>>> *print_settings);
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 (*_webkit_reser=
ved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 (*_webkit_reser=
ved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0 (*_webkit_reser=
ved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperatio=
n.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperatio=
n.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperatio=
n.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperatio=
n.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -57,12 +57,14 @@
>>> =C2=A0 struct _WebKitPrintOperation {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitPrintOperationPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitPrintOperationClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolic=
yDecision.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolic=
yDecision.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolic=
yDecision.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolic=
yDecision.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -53,6 +53,7 @@
>>> =C2=A0 struct _WebKitResponsePolicyDecisionClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitPolicyDecisionClass parent_class=
;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManag=
er.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManag=
er.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManag=
er.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManag=
er.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -43,12 +43,14 @@
>>> =C2=A0 struct _WebKitSecurityManager {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitSecurityManagerPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitSecurityManagerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h=20
>>> 2023-01-26 20:05:13.000000000 +0800
>>> @@ -70,12 +70,14 @@
>>> =C2=A0 struct _WebKitSettings {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent_instance;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitSettingsPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitSettingsClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> @@ -133,17 +135,17 @@
>>> =C2=A0 WEBKIT_API void
>>> webkit_settings_set_enable_html5_database (WebKitSettings *settings,
>>> gboolean=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled);
>>> -WEBKIT_API gboolean
>>> +WEBKIT_DEPRECATED gboolean
>>> webkit_settings_get_enable_xss_auditor (WebKitSettings *settings);
>>>
>>> -WEBKIT_API void
>>> +WEBKIT_DEPRECATED void
>>> webkit_settings_set_enable_xss_auditor (WebKitSettings *settings,
>>> gboolean=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled);
>>>
>>> -WEBKIT_API gboolean
>>> +WEBKIT_DEPRECATED gboolean
>>> webkit_settings_get_enable_frame_flattening (WebKitSettings *settings=
);
>>>
>>> -WEBKIT_API void
>>> +WEBKIT_DEPRECATED void
>>> webkit_settings_set_enable_frame_flattening (WebKitSettings *settings=
,
>>> gboolean=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled);
>>>
>>> @@ -154,10 +156,10 @@
>>> webkit_settings_set_enable_plugins (WebKitSettings *settings,
>>> gboolean=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled);
>>>
>>> -WEBKIT_API gboolean
>>> +WEBKIT_DEPRECATED gboolean
>>> webkit_settings_get_enable_java (WebKitSettings *settings);
>>>
>>> -WEBKIT_API void
>>> +WEBKIT_DEPRECATED void
>>> webkit_settings_set_enable_java (WebKitSettings *settings,
>>> gboolean=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled);
>>>
>>> @@ -513,6 +515,13 @@
>>> webkit_settings_set_media_content_types_requiring_hardware_support=20
>>> (WebKitSettings *settings,
>>> const gchar *content_types);
>>>
>>> +WEBKIT_API gboolean
>>> +webkit_settings_get_enable_webrtc (WebKitSettings *settings);
>>> +
>>> +WEBKIT_API void
>>> +webkit_settings_set_enable_webrtc (WebKitSettings *settings,
>>> + gboolean enabled);
>>> +
>>> =C2=A0 G_END_DECLS
>>>
>>> =C2=A0 #endif /* WebKitSettings_h */
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -51,6 +51,7 @@
>>> =C2=A0 struct _WebKitURIRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h=
=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h=
=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h=
=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -51,6 +51,7 @@
>>> =C2=A0 struct _WebKitURIResponseClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequ=
est.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequ=
est.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequ=
est.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequ=
est.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -46,12 +46,14 @@
>>> =C2=A0 struct _WebKitURISchemeRequest {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitURISchemeRequestPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitURISchemeRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResp=
onse.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResp=
onse.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResp=
onse.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResp=
onse.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -45,12 +45,14 @@
>>> =C2=A0 struct _WebKitURISchemeResponse {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitURISchemeResponsePrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitURISchemeResponseClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFi=
lterStore.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFi=
lterStore.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFi=
lterStore.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFi=
lterStore.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -58,6 +58,7 @@
>>> =C2=A0 struct _WebKitUserContentFilterStoreClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentMa=
nager.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentMa=
nager.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentMa=
nager.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentMa=
nager.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -52,6 +52,7 @@
>>> =C2=A0 struct _WebKitUserContentManagerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPerm=
issionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPerm=
issionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPerm=
issionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPerm=
issionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -49,6 +49,7 @@
>>> =C2=A0 struct _WebKitUserMediaPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h=
=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h=
=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h=
=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -57,12 +57,14 @@
>>> =C2=A0 struct _WebKitUserMessage {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GInitiallyUnowned parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitUserMessagePrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitUserMessageClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GInitiallyUnownedClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h=20
>>> 2023-02-12 23:02:17.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h=20
>>> 2023-02-13 11:34:35.000000000 +0800
>>> @@ -28,42 +28,10 @@
>>>
>>> =C2=A0 G_BEGIN_DECLS
>>>
>>> -/**
>>> - * WEBKIT_MAJOR_VERSION:
>>> - *
>>> - * Like webkit_get_major_version(), but from the headers used at
>>> - * application compile time, rather than from the library linked
>>> - * against at application run time.
>>> - */
>>> =C2=A0 #define WEBKIT_MAJOR_VERSION (2)
>>> +#define WEBKIT_MINOR_VERSION (38)
>>> +#define WEBKIT_MICRO_VERSION (4)
>>>
>>> -/**
>>> - * WEBKIT_MINOR_VERSION:
>>> - *
>>> - * Like webkit_get_minor_version(), but from the headers used at
>>> - * application compile time, rather than from the library linked
>>> - * against at application run time.
>>> - */
>>> -#define WEBKIT_MINOR_VERSION (36)
>>> -
>>> -/**
>>> - * WEBKIT_MICRO_VERSION:
>>> - *
>>> - * Like webkit_get_micro_version(), but from the headers used at
>>> - * application compile time, rather than from the library linked
>>> - * against at application run time.
>>> - */
>>> -#define WEBKIT_MICRO_VERSION (8)
>>> -
>>> -/**
>>> - * WEBKIT_CHECK_VERSION:
>>> - * @major: major version (e.g. 1 for version 1.2.5)
>>> - * @minor: minor version (e.g. 2 for version 1.2.5)
>>> - * @micro: micro version (e.g. 5 for version 1.2.5)
>>> - *
>>> - * Returns: %TRUE if the version of the WebKit header files
>>> - * is the same as or newer than the passed-in version.
>>> - */
>>> =C2=A0 #define WEBKIT_CHECK_VERSION(major, minor, micro) \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (WEBKIT_MAJOR_VERSION > (major) || \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (WEBKIT_MAJOR_VERSION =3D=3D (major) &=
& WEBKIT_MINOR_VERSION >=20
>>> (minor)) || \
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -113,6 +113,7 @@
>>> =C2=A0 struct _WebKitWebContextClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< public >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0 (* downlo=
ad_started) (WebKitWebContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
context,
>>> WebKitDownload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*download);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0 (* initia=
lize_web_extensions)=20
>>> (WebKitWebContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *context)=
;
>>> @@ -122,6 +123,7 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gboolean (* user_message_received) (We=
bKitWebContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> *context,
>>> WebKitUserMessage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *message);
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> @@ -300,6 +302,9 @@
>>> =C2=A0 WEBKIT_API gboolean
>>> =C2=A0 webkit_web_context_get_use_system_appearance_for_scrollbars=20
>>> (WebKitWebContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *context);
>>>
>>> +WEBKIT_API const gchar*
>>> +webkit_web_context_get_time_zone_override=20
>>> (WebKitWebContext=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *context);
>>> +
>>> =C2=A0 G_END_DECLS
>>>
>>> =C2=A0 #endif
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.=
h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.=
h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.=
h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.=
h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -44,12 +44,14 @@
>>> =C2=A0 struct _WebKitWebInspector {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebInspectorPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitWebInspectorClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h=20
>>> 2022-06-30 17:49:38.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -67,6 +67,7 @@
>>> =C2=A0 struct _WebKitWebPage {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebPagePrivate *priv;
>>> =C2=A0 };
>>>
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h=
=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h=
=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h=
=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -45,12 +45,14 @@
>>> =C2=A0 struct _WebKitWebResource {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebResourcePrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitWebResourceClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -85,7 +85,7 @@
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0 a #WebKitNavigationPolicyDecision. These d=
ecisions are useful=20
>>> for implementing
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0 special actions for new windows, such as f=
orcing the new=20
>>> window to open
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0 in a tab when a keyboard modifier is activ=
e or handling a=20
>>> special
>>> - *=C2=A0=C2=A0 target attribute on &lt;a&gt; elements.
>>> + *=C2=A0=C2=A0 target attribute on <a> elements.
>>> =C2=A0=C2=A0 * @WEBKIT_POLICY_DECISION_TYPE_RESPONSE: This type of de=
cision is=20
>>> used when WebKit has
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0 received a response for a network resource=
 and is about to=20
>>> start the load.
>>> =C2=A0=C2=A0 *=C2=A0=C2=A0 Note that these resources include all subr=
esources of a page=20
>>> such as images
>>> @@ -221,6 +221,23 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WEBKIT_MEDIA_CAPTURE_STATE_MUTED,
>>> =C2=A0 } WebKitMediaCaptureState;
>>>
>>> +/**
>>> + * WebKitWebExtensionMode:
>>> + * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
>>> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2 extension.
>>> + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3 extension.
>>> + *
>>> + * Enum values used for setting if a #WebKitWebView is intended for
>>> + * WebExtensions.
>>> + *
>>> + * Since: 2.38
>>> + */
>>> +typedef enum {
>>> +=C2=A0=C2=A0=C2=A0 WEBKIT_WEB_EXTENSION_MODE_NONE,
>>> +=C2=A0=C2=A0=C2=A0 WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2,
>>> +=C2=A0=C2=A0=C2=A0 WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3,
>>> +} WebKitWebExtensionMode;
>>> +
>>> =C2=A0 struct _WebKitWebView {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebViewBase parent;
>>>
>>> @@ -231,6 +248,7 @@
>>> =C2=A0 struct _WebKitWebViewClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebViewBaseClass parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< public >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (* load_changed) (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> *web_view,
>>> WebKitLoadEvent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 load_event);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gboolean=C2=A0=C2=A0 (* load_failed) (=
WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> *web_view,
>>> @@ -293,6 +311,7 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gboolean=C2=A0=C2=A0 (* user_message_r=
eceived)=20
>>> (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *web_view,
>>> WebKitUserMessage=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *message);
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0 };
>>>
>>> @@ -489,6 +508,15 @@
>>> GError=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **error);
>>>
>>> =C2=A0 WEBKIT_API void
>>> +webkit_web_view_run_async_javascript_function_in_world=20
>>> (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *web_view,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=20
>>> gchar=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *body,
>>> + GVariant=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *arguments,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=20
>>> char=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *world_name,
>>> + GCancellable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *cancellable,
>>> + GAsyncReadyCallback=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callback,
>>> + gpointer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 user_data);
>>> +
>>> +WEBKIT_API void
>>> =C2=A0 webkit_web_view_run_javascript_from_gresource=20
>>> (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *web_view,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=20
>>> gchar=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *resource,
>>> GCancellable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 *cancellable,
>>> @@ -637,6 +665,12 @@
>>> =C2=A0 webkit_web_view_set_display_capture_state=20
>>> (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *web_view,
>>> WebKitMediaCaptureState=C2=A0=C2=A0=C2=A0 state);
>>>
>>> +WEBKIT_API WebKitWebExtensionMode
>>> +webkit_web_view_get_web_extension_mode (WebKitWebView=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>>> *web_view);
>>> +
>>> +WEBKIT_API const gchar*
>>> +webkit_web_view_get_default_content_security_policy=20
>>> (WebKitWebView=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *web_view);
>>> +
>>> =C2=A0 G_END_DECLS
>>>
>>> =C2=A0 #endif
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAc=
cessPermissionRequest.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAc=
cessPermissionRequest.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAc=
cessPermissionRequest.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAc=
cessPermissionRequest.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -49,6 +49,7 @@
>>> =C2=A0 struct _WebKitWebsiteDataAccessPermissionRequestClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataMa=
nager.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataMa=
nager.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataMa=
nager.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataMa=
nager.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -62,12 +62,14 @@
>>> =C2=A0 struct _WebKitWebsiteDataManager {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebsiteDataManagerPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitWebsiteDataManagerClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolici=
es.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolici=
es.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolici=
es.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolici=
es.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -42,12 +42,14 @@
>>> =C2=A0 struct _WebKitWebsitePolicies {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObject parent;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WebKitWebsitePoliciesPrivate *priv;
>>> =C2=A0 };
>>>
>>> =C2=A0 struct _WebKitWebsitePoliciesClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>> diff -Nur=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowPropert=
ies.h=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowPropert=
ies.h=20
>>>
>>> ---=20
>>> 2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowPropert=
ies.h=20
>>> 2022-06-30 17:49:37.000000000 +0800
>>> +++=20
>>> 2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowPropert=
ies.h=20
>>> 2022-09-20 16:13:49.000000000 +0800
>>> @@ -51,6 +51,7 @@
>>> =C2=A0 struct _WebKitWindowPropertiesClass {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GObjectClass parent_class;
>>>
>>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved0) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved1) (void);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*_webkit_reserved2) (void);
>>>
>>>
>>>
>>>
>>>
>>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177178):https://lists.openembedded.org/g/openembedd=
ed-core/message/177178
> Mute This Topic:https://lists.openembedded.org/mt/96930211/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------68PbHmSfkWpOmxYS0FMcFXBI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-02-14 20:55, Kai Kang via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com">On
      2/15/23 00:22, Steve Sakoman wrote:
      <br>
      <blockquote type="cite">Stable branch policy doesn't allow this
        type of version upgrade.&nbsp; I
        <br>
        can only take upgrades that are strict bug/security fix only
        releases.
        <br>
      </blockquote>
      The reason that why upgrade webkitgtk directly is that there is no
      obvious single patch to fix CVEs.
      <br>
      It just declares that some CVEs have been fixed in x.x.x version.
      And update to 2.38.4 could resolve
      <br>
      15 CVEs at least.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Can you check with the webkit devs to see if there's going to be
      a 2.36.9?<br>
      If one isn't planned then send an email to the Yocto TSC with that
      evidence.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com">
      <blockquote type="cite">
        <br>
        Exceptions to the policy would require TSC approval.
        <br>
      </blockquote>
      <br>
      Who is TSCer? Would he/she like to review it, please?
      <br>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/TSC">https://wiki.yoctoproject.org/wiki/TSC</a></p>
    <h1> <span class="mw-headline" id="Members">Members</span></h1>
    <ul>
      <li> Richard Purdie (Linux Foundation) - TSC Chair
      </li>
      <li> Khem Raj (Comcast) - YP Membership Elected
      </li>
      <li> Ross Burton (Arm) - YP Membership Elected
      </li>
      <li> Armin Kuster - OE Elected
      </li>
      <li> Denys Dmytriyenko - OE Elected
      </li>
    </ul>
    <p></p>
    <p><a class="moz-txt-link-abbreviated" href="mailto:tsc@lists.yoctoproject.org">tsc@lists.yoctoproject.org</a>.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:65d65ba3-b82a-06ad-48df-65796ffa23c6@windriver.com">
      <br>
      Thanks,
      <br>
      Kai
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Best regards,
        <br>
        <br>
        Steve
        <br>
        <br>
        On Sun, Feb 12, 2023 at 7:50 PM Kai Kang
        <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@eng.windriver.com">&lt;kai.kang@eng.windriver.com&gt;</a> wrote:
        <br>
        <blockquote type="cite">From: Kai Kang
          <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
          <br>
          <br>
          Update webkitgtk 2.36.8 to latest version 2.38.4 which solves
          a lot of CVEs.
          <br>
          <br>
          The diff output of header files is attached at the end of this
          file.
          <br>
          <br>
          Kai Kang (1):
          <br>
          &nbsp;&nbsp; webkitgtk: 2.36.8 -&gt; 2.38.4
          <br>
          <br>
          &nbsp; ...spection.cmake-prefix-variables-obta.patch |&nbsp; 39 +--
          <br>
          &nbsp; .../0001-Fix-build-without-opengl-or-es.patch | 133 --------
          <br>
          &nbsp; ...tings-so-that-gtkdoc-generation-work.patch |&nbsp; 47 ---
          <br>
          &nbsp; ...trospection-files-do-not-quote-CFLAG.patch |&nbsp; 78 -----
          <br>
          &nbsp; ...44e17d258106617b0e6d783d073b188a2548.patch | 296
          ++++++++++++++++++
          <br>
          &nbsp; ...bb461f040b90453bc4e100dcf967243ecd98.patch |&nbsp; 30 ++
          <br>
          &nbsp; ...ebkitgtk_2.36.8.bb =&gt; webkitgtk_2.38.4.bb} |&nbsp; 15 +-
          <br>
          &nbsp; 7 files changed, 348 insertions(+), 290 deletions(-)
          <br>
          &nbsp; delete mode 100644
meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch<br>
          &nbsp; delete mode 100644
meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch<br>
          &nbsp; delete mode 100644
meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch<br>
          &nbsp; create mode 100644
meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch<br>
          &nbsp; create mode 100644
meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch<br>
          &nbsp; rename meta/recipes-sato/webkit/{webkitgtk_2.36.8.bb =&gt;
          webkitgtk_2.38.4.bb} (92%)
          <br>
          <br>
          --
          <br>
          2.17.1
          <br>
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h&nbsp;
          2022-06-30 17:49:25.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCDefines.h&nbsp;
          2022-09-20 16:13:44.000000000 +0800
          <br>
          @@ -23,7 +23,7 @@
          <br>
          &nbsp;&nbsp; * THE POSSIBILITY OF SUCH DAMAGE.
          <br>
          &nbsp;&nbsp; */
          <br>
          <br>
          -#if !defined(__JSC_H_INSIDE__) &amp;&amp;
          !defined(JSC_COMPILATION)
          <br>
          +#if !defined(__JSC_H_INSIDE__) &amp;&amp;
          !defined(JSC_COMPILATION) &amp;&amp;
          !defined(WEBKIT2_COMPILATION)
          <br>
          &nbsp; #error &quot;Only &lt;jsc/jsc.h&gt; can be included directly.&quot;
          <br>
          &nbsp; #endif
          <br>
          <br>
          @@ -42,7 +42,9 @@
          <br>
          &nbsp; #&nbsp;&nbsp;&nbsp; define JSC_API __attribute__((visibility(&quot;default&quot;)))
          <br>
          &nbsp; #endif
          <br>
          <br>
          +#ifndef __GI_SCANNER__
          <br>
          &nbsp; #define JSC_DEPRECATED JSC_API G_DEPRECATED
          <br>
          &nbsp; #define JSC_DEPRECATED_FOR(f) JSC_API G_DEPRECATED_FOR(f)
          <br>
          +#endif /* !__GI_SCANNER__ */
          <br>
          <br>
          &nbsp; #endif /* JSCDefines_h */
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:25.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCValue.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:44.000000000 +0800
          <br>
          @@ -49,6 +49,21 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JSC_VALUE_PROPERTY_WRITABLE&nbsp;&nbsp;&nbsp;&nbsp; = 1 &lt;&lt; 2
          <br>
          &nbsp; } JSCValuePropertyFlags;
          <br>
          <br>
          +typedef enum {
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_NONE = 0,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_INT8,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_INT16,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_INT32,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_INT64,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_UINT8,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_UINT8_CLAMPED,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_UINT16,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_UINT32,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_UINT64,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_FLOAT32,
          <br>
          +&nbsp;&nbsp;&nbsp; JSC_TYPED_ARRAY_FLOAT64,
          <br>
          +} JSCTypedArrayType;
          <br>
          +
          <br>
          &nbsp; struct _JSCValue {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          @@ -246,6 +261,55 @@
          <br>
          &nbsp; jsc_value_function_callv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          guint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_parameters,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **parameters) G_GNUC_WARN_UNUSED_RESULT;
          <br>
          +JSC_API JSCValue *
          <br>
          +jsc_value_new_array_buffer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gpointer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GDestroyNotify&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; destroy_notify,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gpointer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_data);
          <br>
          +
          <br>
          +JSC_API gboolean
          <br>
          +jsc_value_is_array_buffer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API gpointer
          <br>
          +jsc_value_array_buffer_get_data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *size);
          <br>
          +
          <br>
          +JSC_API gsize
          <br>
          +jsc_value_array_buffer_get_size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API JSCValue *
          <br>
          +jsc_value_new_typed_array&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          JSCTypedArrayType&nbsp;&nbsp;&nbsp;&nbsp; type,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; length);
          <br>
          +
          <br>
          +JSC_API JSCValue *
          <br>
          +jsc_value_new_typed_array_with_buffer&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *array_buffer,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          JSCTypedArrayType&nbsp;&nbsp;&nbsp;&nbsp; type,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gssize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; length);
          <br>
          +
          <br>
          +JSC_API gboolean
          <br>
          +jsc_value_is_typed_array&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API JSCTypedArrayType
          <br>
          +jsc_value_typed_array_get_type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API gpointer
          <br>
          +jsc_value_typed_array_get_data&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *length);
          <br>
          +
          <br>
          +JSC_API gsize
          <br>
          +jsc_value_typed_array_get_length&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API gsize
          <br>
          +jsc_value_typed_array_get_size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API gsize
          <br>
          +jsc_value_typed_array_get_offset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          +
          <br>
          +JSC_API JSCValue *
          <br>
          +jsc_value_typed_array_get_buffer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          <br>
          &nbsp; JSC_API gboolean
          <br>
          &nbsp; jsc_value_is_constructor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (JSCValue&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h&nbsp;
          2023-02-12 23:02:14.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/jsc/JSCVersion.h&nbsp;
          2023-02-13 11:34:32.000000000 +0800
          <br>
          @@ -44,7 +44,7 @@
          <br>
          &nbsp;&nbsp; * application compile time, rather than from the library
          linked
          <br>
          &nbsp;&nbsp; * against at application run time.
          <br>
          &nbsp;&nbsp; */
          <br>
          -#define JSC_MINOR_VERSION (36)
          <br>
          +#define JSC_MINOR_VERSION (38)
          <br>
          <br>
          &nbsp; /**
          <br>
          &nbsp;&nbsp; * JSC_MICRO_VERSION:
          <br>
          @@ -53,7 +53,7 @@
          <br>
          &nbsp;&nbsp; * application compile time, rather than from the library
          linked
          <br>
          &nbsp;&nbsp; * against at application run time.
          <br>
          &nbsp;&nbsp; */
          <br>
          -#define JSC_MICRO_VERSION (8)
          <br>
          +#define JSC_MICRO_VERSION (4)
          <br>
          <br>
          &nbsp; /**
          <br>
          &nbsp;&nbsp; * JSC_CHECK_VERSION:
          <br>
          @@ -61,6 +61,8 @@
          <br>
          &nbsp;&nbsp; * @minor: minor version (e.g. 2 for version 1.2.5)
          <br>
          &nbsp;&nbsp; * @micro: micro version (e.g. 5 for version 1.2.5)
          <br>
          &nbsp;&nbsp; *
          <br>
          + * Check the version of JSC header files at compile time.
          <br>
          + *
          <br>
          &nbsp;&nbsp; * Returns: %TRUE if the version of the JavaScriptCore
          header files
          <br>
          &nbsp;&nbsp; * is the same as or newer than the passed-in version.
          <br>
          &nbsp;&nbsp; */
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAuthenticationRequest.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -52,6 +52,7 @@
          <br>
          &nbsp; struct _WebKitAuthenticationRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitAutomationSession.h
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -58,12 +58,14 @@
          <br>
          &nbsp; struct _WebKitAutomationSession {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitAutomationSessionPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitAutomationSessionClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardList.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitBackForwardList {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitBackForwardListPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitBackForwardListClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitBackForwardListItem.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -43,12 +43,14 @@
          <br>
          &nbsp; struct _WebKitBackForwardListItem {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GInitiallyUnowned parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitBackForwardListItemPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitBackForwardListItemClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GInitiallyUnownedClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitContextMenu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitContextMenu {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitContextMenuPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitContextMenuClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitCookieManager.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -74,12 +74,14 @@
          <br>
          &nbsp; struct _WebKitCookieManager {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitCookieManagerPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitCookieManagerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDefines.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -45,4 +45,11 @@
          <br>
          &nbsp; #define WEBKIT_DEPRECATED WEBKIT_API G_DEPRECATED
          <br>
          &nbsp; #define WEBKIT_DEPRECATED_FOR(f) WEBKIT_API
          G_DEPRECATED_FOR(f)
          <br>
          <br>
          +/**
          <br>
          + * WEBKIT_DEPRECATED_FOR: (skip)
          <br>
          + * @f: replacement symbol name
          <br>
          + *
          <br>
          + * Marks a symbol as deprecated, indicating a replacement.
          <br>
          + */
          <br>
          +
          <br>
          &nbsp; #endif /* WebKitDefines_h */
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDeviceInfoPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -49,6 +49,7 @@
          <br>
          &nbsp; struct _WebKitDeviceInfoPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitDownload.h&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -46,15 +46,18 @@
          <br>
          &nbsp; struct _WebKitDownload {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitDownloadPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitDownloadClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; public &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean (* decide_destination)&nbsp; (WebKitDownload
          *download,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const gchar&nbsp;&nbsp;&nbsp;
          *suggested_filename);
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEditorState.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -64,12 +64,14 @@
          <br>
          &nbsp; struct _WebKitEditorState {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitEditorStatePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitEditorStateClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
          2023-02-12 23:58:45.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitEnumTypes.h
          2023-02-13 12:30:22.000000000 +0800
          <br>
          @@ -198,6 +198,10 @@
          <br>
          <br>
          &nbsp; WEBKIT_API GType
          <br>
          &nbsp; webkit_media_capture_state_get_type (void);
          <br>
          +#define WEBKIT_TYPE_WEB_EXTENSION_MODE
          webkit_web_extension_mode_get_type ()
          <br>
          +
          <br>
          +WEBKIT_API GType
          <br>
          +webkit_web_extension_mode_get_type (void);
          <br>
          &nbsp; /* Enumerations from WebKitWebsiteData.h. */
          <br>
          &nbsp; #define WEBKIT_TYPE_WEBSITE_DATA_TYPES
          webkit_website_data_types_get_type ()
          <br>
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitError.h&nbsp;&nbsp;&nbsp;&nbsp;
          2023-01-27 21:16:47.000000000 +0800
          <br>
          @@ -147,6 +147,8 @@
          <br>
          &nbsp;&nbsp; * @WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE: The
          JSON source for a content filter is invalid.
          <br>
          &nbsp;&nbsp; * @WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND: The
          requested content filter could not be found.
          <br>
          &nbsp;&nbsp; *
          <br>
          + * Errors that can occur while compiling content filters.
          <br>
          + *
          <br>
          &nbsp;&nbsp; * Since: 2.24
          <br>
          &nbsp;&nbsp; */
          <br>
          &nbsp; typedef enum {
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFaviconDatabase.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -46,12 +46,14 @@
          <br>
          &nbsp; struct _WebKitFaviconDatabase {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitFaviconDatabasePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitFaviconDatabaseClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFileChooserRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -50,6 +50,7 @@
          <br>
          &nbsp; struct _WebKitFileChooserRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFindController.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -75,6 +75,7 @@
          <br>
          &nbsp; struct _WebKitFindControllerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFormSubmissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -50,6 +50,7 @@
          <br>
          &nbsp; struct _WebKitFormSubmissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:38.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitFrame.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -47,6 +47,7 @@
          <br>
          &nbsp; struct _WebKitFrame {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitFramePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -53,6 +53,7 @@
          <br>
          &nbsp; struct _WebKitGeolocationManagerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitGeolocationPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -50,6 +50,7 @@
          <br>
          &nbsp; struct _WebKitGeolocationPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitHitTestResult.h&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -66,12 +66,14 @@
          <br>
          &nbsp; struct _WebKitHitTestResult {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitHitTestResultPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitHitTestResultClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitInstallMissingMediaPluginsPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -43,12 +43,14 @@
          <br>
          &nbsp; struct _WebKitInstallMissingMediaPluginsPermissionRequest {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitInstallMissingMediaPluginsPermissionRequestPrivate
          *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct
          _WebKitInstallMissingMediaPluginsPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitMediaKeySystemPermissionRequest.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -50,6 +50,7 @@
          <br>
          &nbsp; struct _WebKitMediaKeySystemPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNavigationPolicyDecision.h&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -53,6 +53,7 @@
          <br>
          &nbsp; struct _WebKitNavigationPolicyDecisionClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitPolicyDecisionClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitNotification.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitNotification {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitNotificationPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitNotificationClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitOptionMenu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitOptionMenu {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitOptionMenuPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitOptionMenuClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPlugin.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -43,12 +43,14 @@
          <br>
          &nbsp; struct _WebKitPlugin {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitPluginPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitPluginClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPointerLockPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -50,6 +50,7 @@
          <br>
          &nbsp; struct _WebKitPointerLockPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPolicyDecision.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -51,6 +51,7 @@
          <br>
          &nbsp; struct _WebKitPolicyDecisionClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintCustomWidget.h
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitPrintCustomWidget {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitPrintCustomWidgetPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitPrintCustomWidgetClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; public &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; (* apply)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (WebKitPrintCustomWidget
          *print_custom_widget,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GtkWidget&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          *widget);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; (* update)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (WebKitPrintCustomWidget
          *print_custom_widget,
          <br>
          @@ -57,6 +59,7 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GtkPageSetup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          *page_setup,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GtkPrintSettings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          *print_settings);
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp; (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitPrintOperation.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -57,12 +57,14 @@
          <br>
          &nbsp; struct _WebKitPrintOperation {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitPrintOperationPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitPrintOperationClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitResponsePolicyDecision.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -53,6 +53,7 @@
          <br>
          &nbsp; struct _WebKitResponsePolicyDecisionClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitPolicyDecisionClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSecurityManager.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -43,12 +43,14 @@
          <br>
          &nbsp; struct _WebKitSecurityManager {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitSecurityManagerPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitSecurityManagerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitSettings.h&nbsp;
          2023-01-26 20:05:13.000000000 +0800
          <br>
          @@ -70,12 +70,14 @@
          <br>
          &nbsp; struct _WebKitSettings {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent_instance;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitSettingsPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitSettingsClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          @@ -133,17 +135,17 @@
          <br>
          &nbsp; WEBKIT_API void
          <br>
          &nbsp;
          webkit_settings_set_enable_html5_database&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled);
          <br>
          -WEBKIT_API gboolean
          <br>
          +WEBKIT_DEPRECATED gboolean
          <br>
          &nbsp;
          webkit_settings_get_enable_xss_auditor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings);
          <br>
          <br>
          -WEBKIT_API void
          <br>
          +WEBKIT_DEPRECATED void
          <br>
          &nbsp;
          webkit_settings_set_enable_xss_auditor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled);
          <br>
          <br>
          -WEBKIT_API gboolean
          <br>
          +WEBKIT_DEPRECATED gboolean
          <br>
          &nbsp;
          webkit_settings_get_enable_frame_flattening&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings);
          <br>
          <br>
          -WEBKIT_API void
          <br>
          +WEBKIT_DEPRECATED void
          <br>
          &nbsp;
          webkit_settings_set_enable_frame_flattening&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled);
          <br>
          <br>
          @@ -154,10 +156,10 @@
          <br>
          &nbsp;
          webkit_settings_set_enable_plugins&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled);
          <br>
          <br>
          -WEBKIT_API gboolean
          <br>
          +WEBKIT_DEPRECATED gboolean
          <br>
          &nbsp;
          webkit_settings_get_enable_java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings);
          <br>
          <br>
          -WEBKIT_API void
          <br>
          +WEBKIT_DEPRECATED void
          <br>
          &nbsp;
          webkit_settings_set_enable_java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled);
          <br>
          <br>
          @@ -513,6 +515,13 @@
          <br>
          &nbsp;
          webkit_settings_set_media_content_types_requiring_hardware_support
          (WebKitSettings *settings,
          <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          const gchar *content_types);
          <br>
          <br>
          +WEBKIT_API gboolean
          <br>
+webkit_settings_get_enable_webrtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings);
          <br>
          +
          <br>
          +WEBKIT_API void
          <br>
+webkit_settings_set_enable_webrtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitSettings *settings,
          <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gboolean enabled);
          <br>
          +
          <br>
          &nbsp; G_END_DECLS
          <br>
          <br>
          &nbsp; #endif /* WebKitSettings_h */
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -51,6 +51,7 @@
          <br>
          &nbsp; struct _WebKitURIRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURIResponse.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -51,6 +51,7 @@
          <br>
          &nbsp; struct _WebKitURIResponseClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeRequest.h&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -46,12 +46,14 @@
          <br>
          &nbsp; struct _WebKitURISchemeRequest {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitURISchemeRequestPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitURISchemeRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitURISchemeResponse.h
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -45,12 +45,14 @@
          <br>
          &nbsp; struct _WebKitURISchemeResponse {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitURISchemeResponsePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitURISchemeResponseClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentFilterStore.h&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -58,6 +58,7 @@
          <br>
          &nbsp; struct _WebKitUserContentFilterStoreClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserContentManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -52,6 +52,7 @@
          <br>
          &nbsp; struct _WebKitUserContentManagerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMediaPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -49,6 +49,7 @@
          <br>
          &nbsp; struct _WebKitUserMediaPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitUserMessage.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -57,12 +57,14 @@
          <br>
          &nbsp; struct _WebKitUserMessage {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GInitiallyUnowned parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitUserMessagePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitUserMessageClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GInitiallyUnownedClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h&nbsp;&nbsp;
          2023-02-12 23:02:17.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitVersion.h&nbsp;&nbsp;
          2023-02-13 11:34:35.000000000 +0800
          <br>
          @@ -28,42 +28,10 @@
          <br>
          <br>
          &nbsp; G_BEGIN_DECLS
          <br>
          <br>
          -/**
          <br>
          - * WEBKIT_MAJOR_VERSION:
          <br>
          - *
          <br>
          - * Like webkit_get_major_version(), but from the headers used
          at
          <br>
          - * application compile time, rather than from the library
          linked
          <br>
          - * against at application run time.
          <br>
          - */
          <br>
          &nbsp; #define WEBKIT_MAJOR_VERSION (2)
          <br>
          +#define WEBKIT_MINOR_VERSION (38)
          <br>
          +#define WEBKIT_MICRO_VERSION (4)
          <br>
          <br>
          -/**
          <br>
          - * WEBKIT_MINOR_VERSION:
          <br>
          - *
          <br>
          - * Like webkit_get_minor_version(), but from the headers used
          at
          <br>
          - * application compile time, rather than from the library
          linked
          <br>
          - * against at application run time.
          <br>
          - */
          <br>
          -#define WEBKIT_MINOR_VERSION (36)
          <br>
          -
          <br>
          -/**
          <br>
          - * WEBKIT_MICRO_VERSION:
          <br>
          - *
          <br>
          - * Like webkit_get_micro_version(), but from the headers used
          at
          <br>
          - * application compile time, rather than from the library
          linked
          <br>
          - * against at application run time.
          <br>
          - */
          <br>
          -#define WEBKIT_MICRO_VERSION (8)
          <br>
          -
          <br>
          -/**
          <br>
          - * WEBKIT_CHECK_VERSION:
          <br>
          - * @major: major version (e.g. 1 for version 1.2.5)
          <br>
          - * @minor: minor version (e.g. 2 for version 1.2.5)
          <br>
          - * @micro: micro version (e.g. 5 for version 1.2.5)
          <br>
          - *
          <br>
          - * Returns: %TRUE if the version of the WebKit header files
          <br>
          - * is the same as or newer than the passed-in version.
          <br>
          - */
          <br>
          &nbsp; #define WEBKIT_CHECK_VERSION(major, minor, micro) \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (WEBKIT_MAJOR_VERSION &gt; (major) || \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (WEBKIT_MAJOR_VERSION == (major) &amp;&amp;
          WEBKIT_MINOR_VERSION &gt; (minor)) || \
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebContext.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -113,6 +113,7 @@
          <br>
          &nbsp; struct _WebKitWebContextClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; public &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp; (* download_started)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          WebKitDownload&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *download);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp; (* initialize_web_extensions)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context);
          <br>
          @@ -122,6 +123,7 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean (* user_message_received)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          WebKitUserMessage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *message);
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          @@ -300,6 +302,9 @@
          <br>
          &nbsp; WEBKIT_API gboolean
          <br>
          &nbsp; webkit_web_context_get_use_system_appearance_for_scrollbars
          (WebKitWebContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context);
          <br>
          <br>
          +WEBKIT_API const gchar*
          <br>
          +webkit_web_context_get_time_zone_override&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebContext&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *context);
          <br>
          +
          <br>
          &nbsp; G_END_DECLS
          <br>
          <br>
          &nbsp; #endif
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebInspector.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -44,12 +44,14 @@
          <br>
          &nbsp; struct _WebKitWebInspector {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebInspectorPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitWebInspectorClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h&nbsp;&nbsp;
          2022-06-30 17:49:38.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebPage.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -67,6 +67,7 @@
          <br>
          &nbsp; struct _WebKitWebPage {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebPagePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebResource.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -45,12 +45,14 @@
          <br>
          &nbsp; struct _WebKitWebResource {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebResourcePrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitWebResourceClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h
          <br>
          ---
          2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
          2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebView.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -85,7 +85,7 @@
          <br>
          &nbsp;&nbsp; *&nbsp;&nbsp; a #WebKitNavigationPolicyDecision. These decisions are
          useful for implementing
          <br>
          &nbsp;&nbsp; *&nbsp;&nbsp; special actions for new windows, such as forcing the
          new window to open
          <br>
          &nbsp;&nbsp; *&nbsp;&nbsp; in a tab when a keyboard modifier is active or handling
          a special
          <br>
          - *&nbsp;&nbsp; target attribute on &amp;lt;a&amp;gt; elements.
          <br>
          + *&nbsp;&nbsp; target attribute on &lt;a&gt; elements.
          <br>
          &nbsp;&nbsp; * @WEBKIT_POLICY_DECISION_TYPE_RESPONSE: This type of
          decision is used when WebKit has
          <br>
          &nbsp;&nbsp; *&nbsp;&nbsp; received a response for a network resource and is about
          to start the load.
          <br>
          &nbsp;&nbsp; *&nbsp;&nbsp; Note that these resources include all subresources of a
          page such as images
          <br>
          @@ -221,6 +221,23 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WEBKIT_MEDIA_CAPTURE_STATE_MUTED,
          <br>
          &nbsp; } WebKitMediaCaptureState;
          <br>
          <br>
          +/**
          <br>
          + * WebKitWebExtensionMode:
          <br>
          + * @WEBKIT_WEB_EXTENSION_MODE_NONE: Not for an extension.
          <br>
          + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2: For a ManifestV2
          extension.
          <br>
          + * @WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3: For a ManifestV3
          extension.
          <br>
          + *
          <br>
          + * Enum values used for setting if a #WebKitWebView is
          intended for
          <br>
          + * WebExtensions.
          <br>
          + *
          <br>
          + * Since: 2.38
          <br>
          + */
          <br>
          +typedef enum {
          <br>
          +&nbsp;&nbsp;&nbsp; WEBKIT_WEB_EXTENSION_MODE_NONE,
          <br>
          +&nbsp;&nbsp;&nbsp; WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2,
          <br>
          +&nbsp;&nbsp;&nbsp; WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3,
          <br>
          +} WebKitWebExtensionMode;
          <br>
          +
          <br>
          &nbsp; struct _WebKitWebView {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebViewBase parent;
          <br>
          <br>
          @@ -231,6 +248,7 @@
          <br>
          &nbsp; struct _WebKitWebViewClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebViewBaseClass parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; public &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (* load_changed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          WebKitLoadEvent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; load_event);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean&nbsp;&nbsp; (* load_failed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          @@ -293,6 +311,7 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gboolean&nbsp;&nbsp; (* user_message_received)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          WebKitUserMessage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *message);
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp; };
          <br>
          <br>
          @@ -489,6 +508,15 @@
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GError&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **error);
          <br>
          <br>
          &nbsp; WEBKIT_API void
          <br>
          +webkit_web_view_run_async_javascript_function_in_world
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const
          gchar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *body,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GVariant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *arguments,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const
          char&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *world_name,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GCancellable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cancellable,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GAsyncReadyCallback&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; callback,
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          gpointer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_data);
          <br>
          +
          <br>
          +WEBKIT_API void
          <br>
          &nbsp; webkit_web_view_run_javascript_from_gresource&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const
          gchar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *resource,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          GCancellable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cancellable,
          <br>
          @@ -637,6 +665,12 @@
          <br>
          &nbsp; webkit_web_view_set_display_capture_state&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          WebKitMediaCaptureState&nbsp;&nbsp;&nbsp; state);
          <br>
          <br>
          +WEBKIT_API WebKitWebExtensionMode
          <br>
          +webkit_web_view_get_web_extension_mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view);
          <br>
          +
          <br>
          +WEBKIT_API const gchar*
          <br>
          +webkit_web_view_get_default_content_security_policy&nbsp;
          (WebKitWebView&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *web_view);
          <br>
          +
          <br>
          &nbsp; G_END_DECLS
          <br>
          <br>
          &nbsp; #endif
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataAccessPermissionRequest.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -49,6 +49,7 @@
          <br>
          &nbsp; struct _WebKitWebsiteDataAccessPermissionRequestClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsiteDataManager.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -62,12 +62,14 @@
          <br>
          &nbsp; struct _WebKitWebsiteDataManager {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebsiteDataManagerPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitWebsiteDataManagerClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h&nbsp;&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWebsitePolicies.h&nbsp;&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -42,12 +42,14 @@
          <br>
          &nbsp; struct _WebKitWebsitePolicies {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObject parent;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WebKitWebsitePoliciesPrivate *priv;
          <br>
          &nbsp; };
          <br>
          <br>
          &nbsp; struct _WebKitWebsitePoliciesClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          diff -Nur
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h
          <br>
          ---
2.36.8-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h&nbsp;
          2022-06-30 17:49:37.000000000 +0800
          <br>
          +++
2.38.4-r0/image/usr/include/webkitgtk-4.0/webkit2/WebKitWindowProperties.h&nbsp;
          2022-09-20 16:13:49.000000000 +0800
          <br>
          @@ -51,6 +51,7 @@
          <br>
          &nbsp; struct _WebKitWindowPropertiesClass {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GObjectClass parent_class;
          <br>
          <br>
          +&nbsp;&nbsp;&nbsp; /*&lt; private &gt;*/
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved0) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved1) (void);
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*_webkit_reserved2) (void);
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#177178): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/177178">https://lists.openembedded.org/g/openembedded-core/message/177178</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96930211/3616765">https://lists.openembedded.org/mt/96930211/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------68PbHmSfkWpOmxYS0FMcFXBI--

