Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D5AC433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:50:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6031.1640911846634284995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=NfQa0WFT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=89993e9ed3=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BV0hUIO011702
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=zWynBw7rb79StUouNyIZDtFQ0/7bl0u/8031hC7q5/A=;
 b=NfQa0WFTYZMKKxPupNiZzhtthbX135+AnBUxEpiBcLKDxpPlZV4RNHwDF7q0cSsi6EBF
 mWVQfjJCKO48PgUnSLJuOgraZii2JCBqrsPlONMiGI2pirwsOBYWpw2ws/FD/HE9uSPL
 ELjkI2Lfn7ql/8IvDGY5aAsmKVGIS8nyMq+GftzABG3FmZUm7RZ/00eQKTSI69b0oZf/
 L11v6YpOzUQNAvRWYnXIhQKPe0cGvx522Y2e0kCHhp/bv6tIklqunctWRQgZWEECe02O
 bApRXllxyHJg9eRfDbsUliIb7PucF/t8NEvgxPZ8kzZ6laNHw4BPqpYGtxXRobNDjSgL Qg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayrngm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 00:50:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BV0ojtw020434
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:50:45 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8yayrngk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Dec 2021 00:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAnQtuiy5fWSLVJE+03sO9ZI7jTBTBqcxLBl5f13yeBs6YfgqpPs2jQVLuwy/yxIsRiuGM/KL3B6wOopls6NybT3/POzmXQzlxkvdbEKoIowPDVWf9pUrIO7uVjgIKQxDludX9fBhPw4VF5iP3g4ielvM9RuuCwAVy6x2i+r2fBY8RlRR+XZSsLHIOdpfj1CP5Pu30veODiUS/PPEoTG8KpxsgQiJtnGPPJB8WedJ6K01sCx54C8BW+Hh42doMKqJdouHv7bPZOKHcPHHc8XQpSqwalR1vESESwnWqA6iLnCS5APA8oGQD74XDTnRgzRi/wcoUNgpiEX40FKh8Ie+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWynBw7rb79StUouNyIZDtFQ0/7bl0u/8031hC7q5/A=;
 b=gw3WBE6sAL4UTTeZiG/hlpgUIf8GUz4v7Bnjlzv07feKOZ4wV7hB/MTUvIdn4gGUviMC2tlxAAjOo45MHGFjp/Qq+Oy2qqcH9rtqtFudQhw809RuJK0fJXYeIAByUXCraHCF+AE9sAmLzefE7g1sT0JPHcI9urveMTnzK4eyznes/ih7NNWM5k5XnHGrKHSaSZKmLs34QkaJOh0BR8WWi3P783NSIFiTav613/ofvNhCRh4mdHLUMERNMWyAkdIftcojEA1kqeSZKtmGbLSHyJiu/Icp+UFoHpXeLpd+YvTUO5l/DzukUHe2WhJ/rbR2tUnzSNRYM5DS+qCc8prRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:230::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 00:50:42 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4823.024; Fri, 31 Dec 2021
 00:50:42 +0000
Subject: Re: [OE-core][PATCH v2 1/2] qemu.bbclass: drop OLDEST_KERNEL
 reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Matt Madison <matt@madison.systems>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
References: <20211216114836.964835-1-matt@madison.systems>
 <20211216114836.964835-2-matt@madison.systems>
 <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
 <80057c485bdc44beb4e4cd4dc533bb6f8333516d.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <3bb83ea8-9b36-b2f3-c889-db1d2ac6c2e8@windriver.com>
Date: Fri, 31 Dec 2021 08:50:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <80057c485bdc44beb4e4cd4dc533bb6f8333516d.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------7642CFD5103DB81F5979BF24"
Content-Language: en-US
X-ClientProxiedBy: HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::26) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88be43cf-2c0e-4416-c9b4-08d9cbf79212
X-MS-TrafficTypeDiagnostic: SA1PR11MB5777:EE_
X-Microsoft-Antispam-PRVS: 
	<SA1PR11MB577770283A90E328CF8D2A9182469@SA1PR11MB5777.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YOzz9VfTVhu+4wlvtV4h9ww25W5z6bu1I4yXgImGKmLv+DW1iOg4gKy3pLlGuK59tjVoNvVZa67yRpe5YxVkVPikG5YESoZ/9ayU/YyY+/Vzn8tKsA/7xRO5omF8lrFi41b5Z6ubosKi/9Ld1hNnrDdWrENdS8hmLNJCYm1L8hKQGd294BKxfS5Xal6DwEQ5SoE9BocA6etu8jLEhEJ8+ynqrPd5AnkUMdGZ0wE7+zXoKBEgG4yxUhz06MO/HZX/OfSWeSSd8v1CqNx8bo76Esg1SgDaGbaanKaHZdy8NUez815N+LXE4akBQgUXoojM6aJU5ZErVpL0kl7hko/mAW5q24WP6aRkxF5eOiFZGmvTa8wu1VwHuJkG8eG//UxTJQwA1izJKvjRvtMOboRozsusVezFExaILiyh0Tstn+5yMtg7nhKOxL7ueOxsqtFqrm+TFmAINc8A+gKxnNJlQ8JLtBBPwNgA4lag6AEVTlXyX8g/WxLehFxj4RKKba5a1vlscLl6IF5WCW4YG6KPcHSzvRmBLekBewWNib4uJ1RqJDhhnrdqQaccyeiTLD1i6YUhA+ORKeWjt+JI0nNADG5XOmHuSOGP7Ah12gGL/AS2ee2RPXrFNUUTqlcHXa3IiDMCELqvSCqnvgfedISSQ1kbq3KF6QUtgbeGDxWQjRdZaYi4nkRFpDoeHwy2SsO+r/4go7NkN3cXRy86ZPnAt2tsy9KzzeW2gUraLJKqP+nFOS0GqnIXNwaIexGw58BBsCysjOfuliFIz2erxrPlYRjzH/NmCSQJqn2m6mqZDv/1GZyazo/XYIdAubgPgSo73LnPP99VjQCYjnt1H8uiSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6512007)(2906002)(316002)(110136005)(31686004)(26005)(86362001)(186003)(66476007)(4001150100001)(38100700002)(38350700002)(66946007)(6666004)(33964004)(66556008)(6486002)(53546011)(54906003)(6506007)(52116002)(4326008)(5660300002)(31696002)(44832011)(36756003)(8936002)(2616005)(8676002)(83380400001)(43740500002)(45980500001)(460985005)(2480315003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEFHNUtVNUxPQWNwR2Rjdks3bDc0YWkyYTZEcEZJLzJZcklnS2ZseHcyK2hI?=
 =?utf-8?B?MVlPREtZN2J0SFMvNkF3QkFKb3BEb0VYWXEwOHN1MGJ0dU9vS0VacjgyTlRF?=
 =?utf-8?B?NlpXSUh3emFvM1laNHlkaDYrMEh1NHpBcmJpQU82SW51NkxmamhZRXkvY2Y0?=
 =?utf-8?B?ZjZKUUx1bUx0bGZNN25YT0djem9sZDFRa3hRUVVSRHdvWDVMdzJ2MldSTCt6?=
 =?utf-8?B?emhPelp4K0IrazJKN05YMU9uaDVXZ0xDL2JUTytYMHg1amY0bkRuQUxZaFBs?=
 =?utf-8?B?QThObXFJTWJKTlo2Qis0anA3eGVzekNhUmEzRTkvVFZlRGFlL2N3T2ZZQ1NX?=
 =?utf-8?B?dDVqZFdVdDA0a1NuNGs1bEZHelZTdEhsRjRLOWdjWjJmdEFtbFNKQ0MzRHQw?=
 =?utf-8?B?TDFmSVVPRVB1c3FhQjdaZmFYdnl3V3pzRGROeGcvSzhmc1g0UE93aFNha2Iy?=
 =?utf-8?B?MFFtUVc1L1NKYUFFZC9zRm56ZlFIRUtnZURCQnkwTFdDN05iSUxCSUhaRzln?=
 =?utf-8?B?Y00va2E3cW9nMit4ek15bHIzekZqNTVnWnpKRlMrbUd2K09vb29XZ3piczhF?=
 =?utf-8?B?ZXZxSVZkNEFlclFzVFhQRHVkZXZRSEtkNCtUYlp4UEtuQUh4a1pUa0JHdmFY?=
 =?utf-8?B?NXlrVDI0ZkhzWWt0TlNhbW0rS1ViQnlEdU1CMm9NYmdCUFVVVGdFVGh2aGhL?=
 =?utf-8?B?WWJTSzNhMEtVS2lzNVpFaFFrL1R4OHhZTU5GdTdubEdFZTRHaTVhYncwOVFp?=
 =?utf-8?B?T2tyM2xTczRSbWJZZWNkeDdpYjlrdEVUSllVQkc2c1lYRWJxcUVqMjEvUis0?=
 =?utf-8?B?QWF4bFdNSndMQTUyVmlYbFMzK3huUkQzRXpjQkJQcVk0SktkcFdnUi9Qak1M?=
 =?utf-8?B?Z1EvS3lhT2tzeVpkMmtvem5VcTFHVW5QdE01RGYxVDVOUGVkbFUzWjczcjht?=
 =?utf-8?B?c3lWWGhaUFNRQVdoZXZwRmhlTTBsUjFDODc5MDV5SWlEN2IzRHFqTlQ5enhS?=
 =?utf-8?B?QTV5VEltNzZqYW0yenF4Q0VoSkRqckxFZTVvdC9RbzhvL3Z3empXRzNtNEph?=
 =?utf-8?B?bXdoUkkvdWFtejk0MHRyWHRtMzNjUjR5Uy9ObCtZNnFhbTBxYzIyYlJtTkNW?=
 =?utf-8?B?a09jQWZuY0FOazhKZ3pLbEhTYURQT0FUYURiVmI2RFVyVExjWjEzV29seDVU?=
 =?utf-8?B?WVArc0ZiUzdBV3Z6dmdmS1huNDV0Uk9tVzl5NHFZWVNsYzZxajZqRU90U3M0?=
 =?utf-8?B?bnlMNlJzN25DNFpxWUROK0szaGRaRCtURGN0KzJpYXFRZmdHcDdic2kzelNI?=
 =?utf-8?B?eTJzWmpJejZtR3JaY0t3SDdwMUtidHE0WnNkT1lsdnJjNERpcExxZk1XaEMv?=
 =?utf-8?B?V29WR3NoTTFNOWcxeEVxOG9uakU3N3ZwR1lJWGJTWnZZUnhsR3ZXcVc2QTlN?=
 =?utf-8?B?TkF5WjF5RTB4WElIUzg4MTJqTjVhTWdvZ0dYcTdZWEFRVXF3MWxjK0w2UDFV?=
 =?utf-8?B?Nmgxa2s3cVJERDFNM3JzdFJRLzJubDR5MXROcGxNVHZlZXphN056TGhpRDE3?=
 =?utf-8?B?NEJPaHRpMVVHOTUyMytkNUVTa0k4UU5lMnRQYXRtekdGMTl0ekdCbzBES25H?=
 =?utf-8?B?QlNrTzBibzdWVU02eW43ZktXc1BNSDh6UUFFY1l3V0lvcU5SRTNwRWp5QUNs?=
 =?utf-8?B?V1FzZGN2QVFHeHFscjRqaFhENmpUS2t3ZmoxRUVrSkR6Y1hFQW9Lam5sMUJv?=
 =?utf-8?B?ZEttcm1jelduRWYvSUYxMUxvN1cveERBY0FjT2hBM0NwanpDWFU0WE95VDc0?=
 =?utf-8?B?aWg5enB2UXVOT29KKytiYmp6OVdnaTh5OS9VRytwaU1JVXhvYndDSmMwU0Iz?=
 =?utf-8?B?RVM4S3hMWHdaUkFnNUUrMWoxRlQ1M3dsWGNyTlRDNFVvVGljdzc1R1M2Q2R0?=
 =?utf-8?B?RERMZnpxNERsZEdxblU0TG04SGpjR09MMHA3dndLSnl0Q2xxQU9MTFZoSmZS?=
 =?utf-8?B?c3kzbXExUU5LUVh5ckhzWUFiZ1BSLy8yaHZJWDh5Z01wNHFkdjB6bXJ6L3lK?=
 =?utf-8?B?ZTE0MzJmSUdlbTQ4ejFCYkc4OWQyeXlvYy9FbzkvdHpPVGFDR25kdTgwVjFK?=
 =?utf-8?B?RHd1V25wZkJLWmdjYkpLSDREQUQxamNLRnRXWHRFd2QxL2J1QW1pZmRWUEpT?=
 =?utf-8?B?YzNKODhpdnFMU2hIZVpENVozVlFZREI5dFo5Y3dra25wQ3h3NE5zOUVubnds?=
 =?utf-8?B?c05iQnZZV29RaWNOZGJoMW9oZVV3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88be43cf-2c0e-4416-c9b4-08d9cbf79212
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 00:50:41.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cxiETtZo+snhyrYKsgfm9OXzEkdRF8RIcgWgO+jmgpHyiKd9Sf1u8cRHXb7PvwdMmBjy6UvVAmmw1b0YKsuzmrerdww111OSJmOQcR0syYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
X-Proofpoint-ORIG-GUID: 69XgPModYodmoKKk-hGkFhAKYNewU4UG
X-Proofpoint-GUID: J-ltK6To68pR5k686zIyXIxf2riLTqO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_09,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160081

--------------7642CFD5103DB81F5979BF24
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BV0hUIO011702


On 12/30/21 9:21 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2021-12-30 at 16:51 +0800, Changqing Li wrote:
>> On 12/16/21 7:48 PM, Matt Madison wrote:
>>
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> which is introducing task hash changes for some
>>> allarch package builds, and should no longer
>>> be needed with recent versions of qemu.
>>>
>>> Signed-off-by: Matt Madison <matt@madison.systems>
>>> ---
>>>   meta/classes/qemu.bbclass | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>>> index 01a7b86ae1..333202b7c4 100644
>>> --- a/meta/classes/qemu.bbclass
>>> +++ b/meta/classes/qemu.bbclass
>>> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>>>   # this dance). For others (e.g. arm) a -cpu option is not necessary=
, since
>>> the
>>>   # qemu-arm default CPU supports all required architecture levels.
>>>
>>> -QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS=
_%s" %
>>> d.getVar('PACKAGE_ARCH')) or ""}"
>>> +QEMU_OPTIONS =3D "${@d.getVar("QEMU_EXTRAOPTIONS_%s" %
>>> d.getVar('PACKAGE_ARCH')) or ""}"
>> Hi,
>> Latest yocto still take "CentOS 7.x" as Supported Linux Distributions.=
 But
>> centos7 have kernel version 3.10.
>> But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14. Witho=
ut "-r
>> ${OLDEST_KERNEL}",
>> some recipes which will run qemu during configure or compile will fail=
ed with
>> error:
>> FATAL: kernel too old
>> How about add it back?
>>
> It was removed for a reason and believed to be no longer needed. Which =
version
> of qemu was this with?

For aarch64,=C2=A0 systemd do_configure=C2=A0 failed during run following=
 command:

Running test binary command:=20
tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/meson-qemuwrapper=20
tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/build/meson-private=
/sanitycheckc_cross.exe

meson-qemuwrapper is wrapper of qemu-aarch64

tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/recipe-sysroot-nati=
ve/usr/bin/qemu-aarch64=20
-version
*qemu-aarch64 version 6.2.0*
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

>
> Cheers,
>
> Richard
>

--------------7642CFD5103DB81F5979BF24
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/30/21 9:21 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:80057c485bdc44beb4e4cd4dc533bb6f8333516d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

On Thu, 2021-12-30 at 16:51 +0800, Changqing Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 12/16/21 7:48 PM, Matt Madison wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

which is introducing task hash changes for some
allarch package builds, and should no longer
be needed with recent versions of qemu.

Signed-off-by: Matt Madison <a class="moz-txt-link-rfc2396E" href="mailto:matt@madison.systems">&lt;matt@madison.systems&gt;</a>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..333202b7c4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since
the
 # qemu-arm default CPU supports all required architecture levels.

-QEMU_OPTIONS = &quot;-r ${OLDEST_KERNEL} ${@d.getVar(&quot;QEMU_EXTRAOPTIONS_%s&quot; %
d.getVar('PACKAGE_ARCH')) or &quot;&quot;}&quot;
+QEMU_OPTIONS = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar(">&quot;${@d.getVar(&quot;</a>QEMU_EXTRAOPTIONS_%s&quot; %
d.getVar('PACKAGE_ARCH')) or &quot;&quot;}&quot;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Hi,
Latest yocto still take &quot;CentOS 7.x&quot; as Supported Linux Distributions. But
centos7 have kernel version 3.10.
But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14. Without &quot;-r
${OLDEST_KERNEL}&quot;,
some recipes which will run qemu during configure or compile will failed with
error:
FATAL: kernel too old
How about add it back?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It was removed for a reason and believed to be no longer needed. Which version
of qemu was this with?</pre>
    </blockquote>
    <p>For aarch64,&nbsp; systemd do_configure&nbsp; failed during run following
      command:<br>
    </p>
    <p>Running test binary command:
      tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/meson-qemuwrapper
tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/build/meson-private/sanitycheckc_cross.exe</p>
    <p>meson-qemuwrapper is wrapper of qemu-aarch64</p>
tmp-glibc/work/cortexa72-wrs-linux/systemd/1_249.7-r0/recipe-sysroot-native/usr/bin/qemu-aarch64
    -version<br>
    <b>qemu-aarch64 version 6.2.0</b><br>
    Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project
    developers<br>
    <br>
    <blockquote type="cite" cite="mid:80057c485bdc44beb4e4cd4dc533bb6f8333516d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------7642CFD5103DB81F5979BF24--

