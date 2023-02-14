Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3A8C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 09:44:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2985.1676367865154108359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 01:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nTlvjGbS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14097dbe8b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E8eRXG022154
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:44:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9TSk/it4OI1MfzG9vheDZsqF2z/GbPk7CD4croaK3+A=;
 b=nTlvjGbSe6Pk+2YYwtHK/xa0sVWkcyp6ehP+ZkAhXBfKuP3m2xQgaE4lHTRddOh+k5x4
 DyxuitpLDW1SKtC7hzbeqSB3COsHWWOOFsjFCNI09icfz3k772EavU6MZ9jkwoM+OVvF
 gw0Hms/nEPnILq66s5HMijneM8xSo5oNl/wL4XTrzjw6LBA00cI6t12zGnrEyDkP5Ctp
 7lo5j1Q60B0br+Zrkg0EHRcJw99Ttoc6tmVWeg0UxF9GM1m++dGmGTl0GXPWJntljJwz
 BxlFUhjLuZmxhflmY82nEG+GVJrtGOyPjkvGGvTat1SdVmSAbR8zzfJp/snD82T0GhKj Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768aatc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:44:24 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31E9fZDd007765
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 01:44:24 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np768aatb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 01:44:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5MSYju60/GMlEtUtY9Ek590cOajCAkjtQAK1iIVGzs7eEAjcgfrc6KxgqiF9c4ZIRPkYAumynkK5aoZm54ExEVHkFCkHlsf7N8ZnkCP0dHxOPNvu186yEVtgj5Zd0p9En8gXIiJyYkzp+Ou0TkQgw+ZqYEJHI8/d2on0o1YlSehNpemaPrJDU2eDUTmerr7IPCOJjmeBtY2VeJup1ZqlZljWyyZKh4kXovQ6v8g9mCxsaFyLVSG7EcHxG0KI/e4OBV5U8UmiKq9/nD91KpedfI7WGOkd9e/aYUbax34BFTSe5CP++xFbAhtNht5Gwck5X7RchB6nFB9B3B9MNH6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TSk/it4OI1MfzG9vheDZsqF2z/GbPk7CD4croaK3+A=;
 b=ZxqQL6IUGdlX3hz+5NtifFh3Aag5ENWHj+LOZVlwb4yLCYZwQCs6vNzY6Ri5fJ13qVjGH+5GJDcTDlkDomJG2IvthjSaufpfPlypy6jFYQokjV7nLuzxT984LaewVfIBkd8BoKEaClTZo+ZOBIgiWuhvXDrJ6VBoraBtygnWSoP/zfSAyNs40zKbvSKVDn+vlbEynFp8BCqXHKkBB+nr7L7ZpPJaYNvdgBDlfkrhlqxCn5OKB3//9iEqD28Qdrwfia2EcdANPVhNc9b0K3qx5nEIUkRm50L7pwxmaNR2zpprhPPhWEV3+AtD63HPAi2wjKPxBeT2B4iTFAaZrZHyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 09:44:21 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::144c:b47b:a51a:b602%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:44:21 +0000
Message-ID: <d4b98ea2-efc7-cecf-b92c-3f1fa2f842c5@windriver.com>
Date: Tue, 14 Feb 2023 17:44:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Fix dangling NATIVELSBSTRING
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1676363155.git.liezhi.yang@windriver.com>
 <8e3f56d34bb5941970bce8e43bfa43d38b2ba4b8.1676363155.git.liezhi.yang@windriver.com>
 <ee78e0537a53ae57ee4c4cf8249b7cfa1124c8ce.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <ee78e0537a53ae57ee4c4cf8249b7cfa1124c8ce.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|MW5PR11MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b47611-6213-4a49-6bf8-08db0e700c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eH6MFWhsXSLWOVP63LHnyILUv+TGAq9Hs8zb55c5/bXYBPeBtioQET9x8EbWlD0ss0sgndjhgvOF/zZd/1+hX+Gwiq0XUnGTFbJj5IxCMWB8J6vSC84UNbhE443UhXy8RZiISJfHfMh/WE9xlIBykMotr+ogpoj+lILdf3O9L8SJ9j9zoljp2OBt+4yum5r/h7rznBfXOUlgQp+ECm3VW6mAcvK/Bqv7Zcq/Q11vzblVU3ZarsE22W7MYYjqaGc7svqka5o3AsE+uyaf+6wucWAdx9Stf1vRg6mhGtEuKAhxcv/IesJTUgkYnBR0nnWgJJxca/qjzmdgTiFRpWMmEmkcFeefzxzbY9XgG1WAKNv0rLP6MbVWIxOkH4HmKyvhJ8bZ9fDIkEpOtJyFHO+y2ivzsb5A+mK6TsE0/YXT7CKTEAaGmPOBw7dkQlMLRRDU7QYKJQnHfHdxIMYv8OkrzRBU77acfktV/qg5cCH/SFi5fBC9qfGaknGd9z7sVZeomXQ9qOP8/H47joO3jMQpZuGfHl0NdKBj9e8+wyPF1v6mWojLud8HEXjdwDIPtGmv38chJlRoWCsiOA0xrRjhV96uqdqDWTFtiEuHdZCDZN/BAN44ef2HodxUoJCo2L0+mlgA/xyzzA001iXb+3mmZ5SEQYo9jdMaz1IKabM35IIYum8E6NWlU68ORK9VY9DdrN96xYPr63A8vRKhx9aL9UIs88bkYWyvjJUY0kMqH+TWEsi7gI/s4FNSQpuhs//G/ZyCUxkPXwitPEywYSfSFnz3LjO2AzG86pnPPKbotuU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(2906002)(31686004)(5660300002)(41300700001)(8936002)(66946007)(66556008)(66476007)(8676002)(316002)(6666004)(6512007)(53546011)(6506007)(6486002)(478600001)(186003)(36756003)(26005)(38100700002)(86362001)(2616005)(83380400001)(31696002)(9126006)(156123004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WElBSG93UEFnYmwwU081aE8yckl5WjFKK2tuQ3pGTitjb25nTnI4TVg5UURO?=
 =?utf-8?B?ZS9jS2E4VTFtbkJFVGJBbHpRSzNJSUFUZzZ2Y2FQRGFXaGM0bzlDbXhkSGs3?=
 =?utf-8?B?THEwMVl4R1JmZG5pMnlxdG85VGlXVmt1bjJBdVJOY1hwc1dlUWxsRnl2YlF4?=
 =?utf-8?B?YmtkK2FOSHA0WkNNcUxSeUhsZkkweHM4NnlIVnNNUWxwbVkwNVNwV25hdDhz?=
 =?utf-8?B?dDZyNmE0MEFwUW11dlhQOGpUUmdWYUN6TnIwalovc1RQT284SThzY204b1Zt?=
 =?utf-8?B?bTFWREJuV3o0R1M2TjhOdzZUaktmZ2xCaklhUFhLMHcrYXZyZnVtNXZHeUpF?=
 =?utf-8?B?eHdHNUYyWVVlelhCSCtNYUk4UEd6RXlucGdENDFVeWx1bGovRmJyUDZtSDNl?=
 =?utf-8?B?dVphcHBUcUdsUXQ2TllRTkJqMEZjSVFqL0tVdC9ZbllIQ0NKRXVBQUphTm9T?=
 =?utf-8?B?eEJmelBpWmFnWWNQR2FtY3FyaEhEQ3kvNGRUVFlGQlpWWmI1VXZOdjhLcU1s?=
 =?utf-8?B?K3RJakRxZWE3bkdtWHVxQTNWb3gwUkVTUjZmQnJjUTB2STdwd21RZTE3Kzc5?=
 =?utf-8?B?bmhmdmpJenRXNmRYeXVUbXBMekhuTkU2U1BRRzE4dXUvNTcwcG00cUp6UjZM?=
 =?utf-8?B?UXlWMFZZc1dpZG1CbDBGd0U2QzV6eUVISm84cHdiOHZSWkd0SEpxWXZFUFdD?=
 =?utf-8?B?WS9samJ2NVNOTGFGZ084ZjNhZ1hBREcrL2t5Z3BxTEpMN3F3aE5LL2NhOHFo?=
 =?utf-8?B?c1hPYURNZzFjK2Ezd2NyM2doWFllVE1EV2JxdlVuTzFDdEFUcDNTYnpCVWpt?=
 =?utf-8?B?cnd5RHVLaUx2Ulk0WGw3ZnJwTjU2alZod2RGVlk2YlpDOXdvQUtEMHdBY25M?=
 =?utf-8?B?THNaR3ltN3pqN2Y2VlFMYURlTzFnSVJBa1A3MVFzOEhNSHh6NFhsMFhubHFj?=
 =?utf-8?B?bEZHNVJBdjhDUFc4Um1NN0ZPUXJYdmxnU0U3RUl2UFh1bzNXbEUxMGRNK3Fz?=
 =?utf-8?B?cGNOWll2UGt0Q3JwQXVOSVJTUWNzYk9LL2lUY0NuLzdLQy9qQy95eCtJVlhD?=
 =?utf-8?B?aE1iL3FDQjlMTjMwSVBZZnhjNVhGdEJXY09aSklxaU44Um96b0dHeHBocEZr?=
 =?utf-8?B?dWFtTTF6NHg4Yi9hcUtqdDFVdjFEY3dOODlTUWVCVytIdVV6UnR4V1VTaDBH?=
 =?utf-8?B?VG1hOWM4aU5FaFc2YTV2MmFpRm9kYzJ3RkFudnlxQXBVemVPYkxJcGpHYnFi?=
 =?utf-8?B?N2VlUERITEtUdGd3KzdsUlRTajA3ZjZGVE41ZmVoaXoxQjJVaURERXR2NXh1?=
 =?utf-8?B?SzlGaGtvbER5M0NEVkZRRmRiaGQyS2dUUGgxUS9HSHlrL3hnOTRmVXJhS2ZW?=
 =?utf-8?B?RjRPVkZjRFhickZrNnRHRjBvYWNOQTcxSVpVZzZZTzFlbTJlSmhORkJUNGU0?=
 =?utf-8?B?ZCtTWHBOU1RCYUIzRzRsSGpVNSs5UGtpY2tncG1Nc011V1NjcHRQdHRxWXh1?=
 =?utf-8?B?QTJIYlMxV2FDSmRVWWNXU2U0Z3JEelFsK0pJbmRBOEVDZ2FhQXN4bTZEdHFG?=
 =?utf-8?B?TmJSK1VCMWhqTHlzb3dWUkVhRXd1ZzhWdit1a1pya2doZzBabkNkUUpqczMy?=
 =?utf-8?B?SGp2bmNJOU5OMC9zN0Rtb3dmaFhraWFWaW5hanJxYzJyYnl3MktJKzJiS1VM?=
 =?utf-8?B?MWEyOTFaQXhLZEorRE95QkdTMGdheFJjYWdsTTJ0WVd1WmlUL2U1M3dUeXpq?=
 =?utf-8?B?YWRQSWZJWWdGNm9SaVVEVEJCS3gydW5sU0t4L0hzWmxvRnFTV2tXK0xWUStT?=
 =?utf-8?B?Mkg5ZXp1REFjcUdJcCtsMnRnRHZvNCsxd005b2ladG1uSWp1bnBubHB4dU1Y?=
 =?utf-8?B?U3c2NHhPTncySUhESmxNRGZHMDNBQUpZUjZhcUtXazdVV0lrb1RkZk1NMCtR?=
 =?utf-8?B?OUF3M3UwUUJnZVoxWDkvUzhyVjZEZk5hRjFOTkV2Uk9ZWEVRcXhPcmRIWTNi?=
 =?utf-8?B?OWhzTnZETnZtK2pvVEhtL0kvaitUSmZGZ0E1NUhOZE84RmRyMVBXS3krVi9S?=
 =?utf-8?B?SlFndHYzdStBckVIK3dyeXM4YUFPZUU3QjN0MkFrNUw3clJjR1RiYUR0M1ln?=
 =?utf-8?B?MDRPTWZIY1BzZnBjNzdESC84SC9vTFJ0NHEvZjFGZ1VnWGMxRS9PMFNBeXRw?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b47611-6213-4a49-6bf8-08db0e700c53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:44:21.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0HrtIbNcnF75lcC4rmH3U5BZONtLbQ8WvN9gh2r003ZoeV2L1BShln2TE8rQRngZDcGG+4yVWVBNbqUqA4nQxdw26e8YJia5SyeSN9BSio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
X-Proofpoint-ORIG-GUID: 6Ku-pJIHF7eldH3u9PsP_MrUESBCpobw
X-Proofpoint-GUID: 2f6iIUwZqpYx-J_BTyiXHRd6JSzdZEA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 09:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177135

Hi RP,

On 2/14/23 16:44, Richard Purdie wrote:
> On Tue, 2023-02-14 at 00:28 -0800, Robert Yang wrote:
>> Fixed:
>> $ rm -fr tmp; bitbake quilt-native -n
>> Build Configuration:
>> [snip]
>> NATIVELSBSTRING      = "ubuntu-18.04"
>> [snip]
>>
>> And when run bitbake again:
>> $ bitbake quilt-native -n
>> Build Configuration:
>> NATIVELSBSTRING      = "universal"
>>
>> It has been changed from ubuntu-18.04 to universal on the same host and build
>> directory, this is because it is overridded by NATIVELSBSTRING. This patch
>> makes it print the correct value.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes-global/base.bbclass | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>> index 64e805c947..cf42d9d4d2 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -226,7 +226,12 @@ BUILDCFG_FUNCS[type] = "list"
>>   def buildcfg_vars(d):
>>       statusvars = oe.data.typed_value('BUILDCFG_VARS', d)
>>       for var in statusvars:
>> -        value = d.getVar(var)
>> +        # NATIVELSBSTRING var may have been overridden with "universal", so
>> +        # get actual host distribution id and version
>> +        if var == 'NATIVELSBSTRING':
>> +            value = lsb_distro_identifier(d)
>> +        else:
>> +            value = d.getVar(var)
>>           if value is not None:
>>               yield '%-20s = "%s"' % (var, value)
> 
> The uninative code runs "late" and this is an known issue, there is an
> open bug for it if I remember correctly.
> 
> I don't really want to put hacks into the BUILDCFG display code to work
> around it since it is just going to make it less clear what is going on
> and is also likely to break if we evern change the way NATIVELSBSTRING
> is set. If you really don't like this, we should fix it properly some
> other way rather than work around it.

I'd like to drop the patch since it doesn't affect the build.

// Robert

> 
> Cheers,
> 
> Richard

