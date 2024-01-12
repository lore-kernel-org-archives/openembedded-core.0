Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD44C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:25:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11624.1705029937294800478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=C0ivLvc/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17418cb69f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C3LAdW029148
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=FXBcbEY50tuWdOCpragwD2LCuRRNJ6DnM1UlzrkcVw8=; b=
	C0ivLvc/ICC6+JPDy6VvI+L9588+4K7r9qzP4leTEfaRyo10W7N6WaZg56UrATrw
	ZEHuGihLB6fFgS+aeKgwioDZNTDS6XF963GN81wlUDUcRIs+8IwuaM7XOGAMkkt6
	NoPYjHTfItjRZPyhn6p9qViZetCPNmMbze1HXyAaR+CZ/f2/1f0fUy93+1KwybT9
	nC9ZoCdTGqgerHgXoTL34uW/MvMSHWWAy2vtIC4gw/QdFVKqlv6ERaWh2vLmi4C/
	/3iByzJSxsbUXnjhopw5ruLDEg90eZwQAS5Z+FGiynlnADdonpMzucUdgi0/3Lwr
	TYNgtAl3f6qdMs3NnBTF0g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vj75yh8v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:25:36 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40C3PZcU000730;
	Fri, 12 Jan 2024 03:25:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vj75yh8v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 03:25:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbBy/XY8zXn3pvsC0c2a157VUdaciWEiecX0BZ4B2TBDIID/xU+5piSuAQyKipEB0mNMFGIeIfVmMVEK65mFXBvyXQpkiLDjKht2RWKbXHOX2I/8a7733rook9xBpNHr4R4x0tqoEj613wZHErleEln3d8PCDbEwvPnGnrMTxlzIKi88qx+2DpCdQk1OuY7UPS570q+h4zI8N6bI/n58H8qozjH3oV4Yh/kOQnwSfPyOqdDlX0mxImxH7ObayYDDj0/FpQ1x3cOGqwCBKcs2Mg4r63dtNk5UIOmtKUdxM5C0i138Os2a4ItZwVIqHxUXWdP+IDC9Rheo8NU8IjV4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXBcbEY50tuWdOCpragwD2LCuRRNJ6DnM1UlzrkcVw8=;
 b=Y9coHIr2RDXsL+aF3UYi3ybb8Fd1RiqKE7CzlpdgrUpJdd2OIu6AhWSweZjn+W6E0Nf4yb9D87Ux8y87UsznKQowRS8O7JtKzMCe4XWfgHx6xsPcpj+W20eo/wyuMtFYvuJ/MdEDr8bYREH/rMqHOm9vfmIBENCtyfvn1e0a2NK1R3YOWICMqTLydWxCOaVTKu8JL3Co172HT0jKduUeq0Sz5Qp5KAMW/Ju27lsC+kP9AsA3+UsgCu1DNQyFIeJsczkUxy20maEeA6XSGvtM/0987Vc/XSHMyROetHky3cQCUOYu/6kOFt1dnKAG7wpxTqkw+EHuAtqEBo7deipE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 03:25:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 03:25:31 +0000
Message-ID: <8f36fab8-e9ed-b177-f742-1abcb8734808@windriver.com>
Date: Fri, 12 Jan 2024 11:25:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] kernel-devsrc: copy source files under tools/
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240112024357.2656128-1-Qi.Chen@windriver.com>
 <CADkTA4P7NZGEpe4t=PdG3e0558xr9+QcuM8wsv9wQM6SN6rOzg@mail.gmail.com>
 <257b3e66-2cdd-b5cf-7a4b-532e32f9ff3a@windriver.com>
 <CADkTA4Paiqgfh5D_=SmDEc8yRvrRErGaum2gXi5Qv-qw46EZrA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4Paiqgfh5D_=SmDEc8yRvrRErGaum2gXi5Qv-qw46EZrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c75e12-89a4-49b9-5e73-08dc131e21b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	md3sN3/W3d+gC6tanTYw34EL6Mok89mZvKG70CnGDWU8Reh26aDKVaodaJ8doc0zSKPyQS7KC/bkRlHNWnPItqTKp8vBrP1kJkR5rGCAEk2Eu0gqcsfPttjGo3R0aVjwbrKKG10GXCRwavEBbW27yjvpcYmv7UGVPykX579dxe93Gb6SgzU8cPGgaYEL3VZAv6YD8LjzRcn3yFjEti/zabvFpgHXfNnj+WqMRMPA/bTTSjoiksb/Wz7hHDcz85C10IBI3Y75h64pK1T/tKeypowMgpLGYqN/4iLoXkhSgPAutYPlrk015eBzzRorYWaoTgrSckFffkGbObOTAh3/IHzfSh65sN0l5h0mjCuA/vtJJ/CdlaIQ39QE3POHfxtUITzUCoeTC0+Yt2K86SBAsY2AZGa4E2rXPrihrJmumzUZDkOSqUsDn5k2J4B/C/Oy9UhWkmrgOtPdVatkcenMttlBewFfxUyJTx/mKLj+YDYO8VMbjPX8y6/i/uD8AKgy82XeJstD9YWNIw8w1qB/tB0SboXPCKKpR2xkN5rcWIl+KoG27KVnU+xlroJbIiQifIgq1Yr8vEHWjPXfufXnEi/c2yy17LSb77y/S3bRXaeQCM8pd/GrJB8vAX3hLpIeUEOuhwbaABqP87qQZVoe0bo0GWWPwkbpG3a8cgnPOwlsnfOqO7RdjF4rYS4bR51D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39850400004)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(36756003)(66899024)(2906002)(66556008)(478600001)(31696002)(6512007)(66946007)(6506007)(66476007)(86362001)(53546011)(6486002)(38100700002)(4326008)(83380400001)(26005)(2616005)(966005)(316002)(5660300002)(6916009)(6666004)(41300700001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0oyL1IwcTNaM2huY0JKRkZxazdmeHlNNFhVMDB2WmNOVzRDc3dWclp1MUxm?=
 =?utf-8?B?TUV2a1VWMU9FV1VmYnpHS3VMclI4d2JxNmZaNHVySXJoNUpPNE1iVG9FUG4y?=
 =?utf-8?B?TzRUVXdhbFphUDZXYnB5bzdzMGtIY3JTdjl6WmQ0OStXa0Q2Z2ZkT1NWeWMy?=
 =?utf-8?B?bEFpR2FtWjN3UnkyODNBaUQyK3BKaGN5TEJqc3FVWWR6dzdKYXJCaUNYTVpx?=
 =?utf-8?B?U3gxZ1pWN3c5TzJ2eUdtQXU4aGVlMXVPVlc3d3ZVWCtVU0RtR0pVdEt0TzFh?=
 =?utf-8?B?b2NkZklXWjdjc1RWNGxoWVUyaWppckwzZVEzSUV3Q2xRVm40bjM4VE9HSVlR?=
 =?utf-8?B?UTM4QzRvSHRJeU5QWUdUbGY2Q1dFSkYxVkhrT2p0MThmdjBZRkZkQ0hNMkk4?=
 =?utf-8?B?TlRNUjRQdXd2WEo0dncyTHZwNjdTTGpnYThOYXM3REo3WVhKR2dxd1pWWENl?=
 =?utf-8?B?NXpOcU9QUU9XbmNtVWliWG9iNGdiNUQrL2wvS2lSZHdQQ3BxbjEyVTRTTHlx?=
 =?utf-8?B?RUhDU3o0YXFkWFhHT1VxbHZtMENDN1JrNUlJakJHdUpsSy91bTJ0NitKK2Y2?=
 =?utf-8?B?NDFkOG5mQmtJTy9EZTZOZUg0cERYRU5vQ0NjU3c3c1lreElXd1lxQ2pmTjVx?=
 =?utf-8?B?L3ZaSWtoU3IrZ09vMWhJdEpzNmIzS0ZlRy9xSkRuT3ZneHg2Sk0vb01QSVM0?=
 =?utf-8?B?bk43Z3dKSVVOMGYxS0xXYlVLc0JqaVN4TlBmbjJXOVVyREVjc0RJRGNQREQv?=
 =?utf-8?B?bHYxR1ZzMzdrVEg1YXlwSUxkSXNRRmlwVGZTMGhmbkZLaEhhQjR0dHhKVVJ5?=
 =?utf-8?B?aEF1TjIxL3lxUGRQSUcyMzdNQkZyclJKV1J0SElaVnZwaWVHaXNKU3phNlA0?=
 =?utf-8?B?T1J4MUFJSlNHUmhTdWJ6Q1IrSnpHRDMrdmVDOTB6SGF1amFURCtYQjMzQVJL?=
 =?utf-8?B?UUlUbHdxMDRkZ1NmZktWaWJzUUw3NW5yMGVIaUY4OVNQQU1VN0NZQXpZbWVH?=
 =?utf-8?B?ZDZvUE1qTHdKUWQyajBKT2N2TjVvcHpFMlR3YmRmbklaM2pOK054djFKMld6?=
 =?utf-8?B?eHNqTDBMckFodEdZMFJzbTY0M1dSeXE1NGtYa2cwTFZjS2l0VFJIbVVKZDhZ?=
 =?utf-8?B?VTBJa2N0dnVscTZKNnRLYnprdy91SWZpM3hTZUxnRUJFNlAwNGt6K2lnZUVx?=
 =?utf-8?B?WFdsV2VJRTZEMkFjQjFDR0RQb2M1RzQ4d3NHQVRWYlJXNnhBUkpFOGQ2WExm?=
 =?utf-8?B?Z1BXUWdCeHlCYnJxZ1FERU8razI0OEhLdzg1c2VvNkdNVnhOY08xRGZZUUpF?=
 =?utf-8?B?NDBiVCtPd2I1ZlA1aFFPNVA1akY2MUZhbUNqWVlLenVLckwvMWVNUTBBbDFE?=
 =?utf-8?B?S1dpN2FGYjVHcFpsUFJ1amhmZklFSHZ2aUtXT2REUldncWx5Z1JWa3lSWjhP?=
 =?utf-8?B?RnlVejgvazhHZjR2cWhuRG5pWFFtQmh2eU1xTXdCempDREE4QUJDRmU1MWkz?=
 =?utf-8?B?S2ZEb2ZBNm9WYnJjVzFHVzFHQXFWNE1ZWUJaQnJaTkJTQTRSWFNvVmp1TElF?=
 =?utf-8?B?dGRvR1BlSUxPUEIyOGVNTyt0K0xlUUhQOVRJUm02ZnhHczg4MU5kbzBMaGJM?=
 =?utf-8?B?ZkxneTV6WDl0WUxOSlExUWsrOUh3eHhEZ2NDcnU3eHFQYXJRK0VqL2twVmdO?=
 =?utf-8?B?aCtyTDB3aml1NURNd3JTOGk0RlZoMkpYZ3VXdEtSK0xpLzZIbFJyVExTWUJw?=
 =?utf-8?B?UUNqdlV4TDF0OURyUC9JbEtkaGs0MFVTVXFBd0xqZVBDaGdDcHNoN283Tlc4?=
 =?utf-8?B?d1hpcGRYaXIzSkZsS3dxUGlQOWhhT0hnZm5GMmNQVXRVMnpoYU5qRW16M1NV?=
 =?utf-8?B?L0RnOFpNUGNKUEFnYlpwNkk4ejhmcmpNREZCbC9uRnFRWWdGTzJWS0Y5bHVI?=
 =?utf-8?B?ai95QkJTSWtNczljZDZzSjM0ZFlaU2F5Tkx5OUsvQnRwemRzUDZ6N0Q5dWhB?=
 =?utf-8?B?YThpWmlTck9hbTIyWGliV3o4RGRCSGxmc3lhbkhaOE5LdU1yM0xSNENvcE9B?=
 =?utf-8?B?bU5oWWlsSEY1RTN0R0QyanhtU1NBYXArU1h2RHQxL2lWbFlvbGlsenNLS0wz?=
 =?utf-8?Q?OlLYikprQFA3NCsmGaflNX0qM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c75e12-89a4-49b9-5e73-08dc131e21b0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 03:25:31.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkzBRh7CVju5MJEFJ3E8Poe6ebg/t8imigt5NznQ4TvPv6qUqtma6ggDQgp8sd0BRhCd4oOLI1rMjnHN/8nXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
X-Proofpoint-GUID: LF-o2jb2g4Aer68jDtvsqC30oLtLlr4a
X-Proofpoint-ORIG-GUID: Z3wy3AnyF8yBP4v43VQVNQkkGf60tpla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40C3LAdW029148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193568

On 1/12/24 11:22, Bruce Ashfield wrote:
> On Thu, Jan 11, 2024 at 10:12=E2=80=AFPM ChenQi <Qi.Chen@windriver.com>=
 wrote:
>> On 1/12/24 10:50, Bruce Ashfield wrote:
>>> On Thu, Jan 11, 2024 at 9:44=E2=80=AFPM Chen Qi via lists.openembedde=
d.org
>>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> The source files under tools/ also need to be copied because in
>>>> some case, they'll be needed. For example, in case that the
>>>> CONFIG_DEBUG_INFO_BTF is enabled, we'll get the following error
>>>> without this patch when doing 'make prepare'.
>>>>
>>>>     No rule to make target '/.../tools/bpf/resolve_btfids/main.o',
>>>>     needed by '/.../tools/bpf/resolve_btfids/resolve_btfids-in.o'. S=
top.
>>>>
>>> Tools has been excluded on purpose, as it is relatively large
>>> (and complex) compared to the rest of the curated files.
>>>
>>> Figure out just what you need for bpf, and copy only those
>>> files.
>>>
>>> Bruce
>> I can do that. However, I want to raise my concern here first. Does th=
e
>> 30M really matter, compared to the potential errors that would possibl=
y
>> give users bad impression?
> Yes, it actually does matter.
>
> That's the entire design principle behind devsrc. It is carefully curat=
ed.
>
> Considering something like this pops up every couple of years, I'm
> quite confident that there are very few bad impressions to be made.
>
> As you could see from the file that there are many specific copies from
> the tools/ directory structure. That should be the hint that if we want=
ed
> to copy tools in its entirety .. we would have done that long ago.
>
>> Before enabling CONFIG_DEBUG_INFO_BTF, things were working pretty well
>> for us. In fact, I was a little surprised that adding extra configs
>> would result in failure of 'make prepare'.
>>
>> Not sure if CONFIG_DEBUG_INFO_BTF is the last one. I guess it's probab=
ly
>> not.
>>
>> Again, if users are using kernel-devsrc for compiling things, do they
>> really care about the 30M size?
> It's not relevant if they do or don't care. It is the principle of keep=
ing it
> as minimal as possible and not doing things "just in case".
>
> There's a bugzilla that I've attached a patch that creates a parallel
> full source copy of the kernel, but we've never merged it as keeping
> to the low footprint design principle is important.
>
> Bruce
>
Got it. Thanks for the info.

Regards,

Qi

>> Regards,
>>
>> Qi
>>
>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recip=
es-kernel/linux/kernel-devsrc.bb
>>>> index ce5777fbe9..c2aeb8e216 100644
>>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> @@ -62,6 +62,7 @@ do_install() {
>>>>           cd ${S}
>>>>           cp --parents $(find  -type f -name "Makefile*" -o -name "K=
config*") $kerneldir/build
>>>>           cp --parents $(find  -type f -name "Build" -o -name "Build=
.include") $kerneldir/build
>>>> +       cp --parents $(find tools/  -type f -name "*.c" -o -name "*.=
h") $kerneldir/build
>>>>        )
>>>>
>>>>        # then drop all but the needed Makefiles/Kconfig files
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#193563): https://lists.openembedded.org/g/openem=
bedded-core/message/193563
>>>> Mute This Topic: https://lists.openembedded.org/mt/103676210/1050810
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [bruce.ashfield@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>


