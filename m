Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B1BC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 15:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.234.1648826920245187756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 08:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=a1qW7Pxi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1090296863=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 231BPmEr011348
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Apr 2022 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=u6PRYs4Q2kDOErSIbgZBM2XzyEmUzgypsOZ2J+O1ssw=;
 b=a1qW7PxiRvJQFSEukOt7JLmrdIkBzY2Mu4gie4anWqtLM1YGp+YSZ0TweRBBBKzxUFWy
 Edd1vLN2vxUm8dR+K/eWfQyo/1PlSQoBDE+syiG8KPpRgU2tLFUH7hmAl+05XOPRQXWb
 kvAyqFnsxuKID+w7lDRdWcqS1regcIiO3hTw6Yf82s+Bj/Kwz7PkfTKVzAEjzSjGq7/t
 FNaeF0EEwj4udd1dr5NgdYXPTol8HKicze/aqMDPM3N4MkcAhbTX50gjOy1PpGVQWQsO
 IvQROJjONyhD6GZE8FCmxF77sElHj1O/VvhIAbVehXofIJMGQH60z/f9VjBu7klJyzfd Mw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1st85squ-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 15:28:38 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 231FScsf015860
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Apr 2022 15:28:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1st85sqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Apr 2022 15:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FA831h3WTIm60uvtAEQSfSNZkcKrkaALGKFv96jowBc2XMuQHzz34Vt+K9E1MfIac9NduFU7vAB+EU2p2pnezF0F4f/dOd6Wary+9iVES0/JCkhJlwdEoPCwAbfWhOYY7FiBETr9B2RpAG6C1kmi596bg3a3G/QMpaJA1PwQiwInSjty1jS0cvLvOpmEXxA/ngIq29tHbPdPsmZxASEM6as4y98BZdlkwtao2TNX5d41qwSzLZULstUY++l1krSqzGGNNplLVldNv/AsNJv9z/rn1S3SS6fNdQqClaSb0hvBiquvV+8MenvLv05n4/jaWuVrKwRpjwIfMI32BIMHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6PRYs4Q2kDOErSIbgZBM2XzyEmUzgypsOZ2J+O1ssw=;
 b=ZAfPZLd1BBzOuarkC4j5FKhZmM9SiglXVbRFiHjUxp6cXE14CtFPaor8I9R88KcoTuhveYo0yS1XX4tPJ0zFZmZLSBZj3RdjiYJvl6vQrauPj4f25cKkvyWSBx4YSsiOUPJM9f/wnLVvg9Hd8+fQNAk4btvEC7LYNfFZsC8YcCJIUJAYmhcodtQQxdkydcT+iqm3FOPkfgN3oICGjUFIYkndGbXde4Y1zplgaG/viM68QDzLjnxcgd+NUH3o6nmD2/TYOyUFYTrldN/5FAbKId2IQcT+ljwbv8HHXnRwYe/P6Lu/gFdmzqmpWidJrWcSAepRdvHeEGvmILoylJVfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BN6PR1101MB2065.namprd11.prod.outlook.com (2603:10b6:405:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 15:28:36 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 15:28:36 +0000
Message-ID: <d3c65d9a-9959-b8cc-4fcd-8f282e6263b2@windriver.com>
Date: Fri, 1 Apr 2022 08:28:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH v2 3/3] depmodwrapper: Use nonarch_base_libdir
 for depmod.d
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20220331222153.76037-1-saul.wold@windriver.com>
 <20220331222153.76037-3-saul.wold@windriver.com>
 <26d7155b1477eebde96ac003a62adeca55900c7d.camel@linuxfoundation.org>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <26d7155b1477eebde96ac003a62adeca55900c7d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b803c848-9718-449f-8de5-08da13f449e1
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2065:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB20653147DD5E59A87CE61950EEE09@BN6PR1101MB2065.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BCiw6wWIjatEK740oTDpRqBL7Q6fc8z8Uwpl4SBFlolphQ0qY7VO4FVOCcq/BwQE5IFky3yDPoQksAR5ZuuIgkYRd94JaNvQbbowCTC9FeYH3pWQUWsPnjlMygy6X53s6ht8WimaTt15vCoXBd1BEGPeXJPwzCdyz+sSHryyJfQtWP4bPgwQCScEXC9jAsgsJN2vDz/u3yilGOa8Z2a0BxoqoQaIknQ1amlGsZS2wsXxUqR53ygOxl8wrBXnSepMbiQkJASidhAMuYgx+PYQ6hX3LqvGsrmshxySwmODjlpsppSgw44cBkM0Q3d/pW+5jZmOkWIqANptqzDxmJL8A4QJXqioSxJjWfn5CKcsuA1uJS+mFrLwvy3ZX/5h95k44F697xswNNmGynNK6xZ8qUG/0JzjlgTN9Dn/f4srw60NUj8TNvgqNS0xlIN86nluW5N+Aly00kYdQPoS/N8brv8QM5kllFYUM2Tu8ynOaJZTlW0z8Glj659p0sULzUzrIvtVWjZL6ova2Ot2C7YWzXPrPuhAmFLBhfcqKRsJClqVZeGXsa0cILIPTYM1nOjn1/VyrcnTUXkMaCuzvrD5nQrZawAB6uah5rSrp7DyVitvZyWHXQwTPwbDp4SLXG0viKVy81IQSdwg/vO2fbjWLU2ncO5xmxdYFmuSwKuwcXQE6bonn+ysiSvCuZmsNEeUDylTKS8Olwnxnq4GOUErsvzvLiUCetyJ8YgQZhxshhkQv+PkD0MeVvpoLSrsr6TlSDuypBk/rQnrn16LeQ6xvmJVNf38xd1THJgbgslukg4aKyb5GxMLF+sl533xRgEQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(508600001)(186003)(2616005)(6666004)(66946007)(53546011)(52116002)(86362001)(66556008)(31686004)(66476007)(8936002)(8676002)(6506007)(31696002)(36756003)(316002)(38100700002)(38350700002)(2906002)(6512007)(6486002)(83380400001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlhQcXNjMWsvNGpmVS9PZW5ic3RqMDY2YlpvVmNDeTVGaEN6QjNlcUZkcHpZ?=
 =?utf-8?B?eEYrVzR6bXhJb25wYTc5ZFFQWFI0OUUwb2xZNlZ6VHlNL1lmdHd6TGhONU1T?=
 =?utf-8?B?S05xaCtTaXAvZWVMVnVwKy9CaHlXbzhWQ05DdUpYK0REK2lGTTVhN3d4RXJO?=
 =?utf-8?B?RnNPQVNLVzdMNE1idnk0bTloa2t1V1FhdC9pbmk4SWRUQmtVa29DYTN5S3Y1?=
 =?utf-8?B?dGNuQUpjM09oTDMxZVRIVEtlUlVlS1hHZ0NtUnUvd29JdThTVTJZY2RtV3pN?=
 =?utf-8?B?aWFOUWRZeHZlcHg0aTZ6K0hyQkZiUk9FY3BMdUpqRTBFNWlla0pKakdMR0dt?=
 =?utf-8?B?VnNyaFdlUVovUzU2bkJRS3NBVTJqNlFQaUFGVXc3dm5jaE9kZnQvSzNqc0xw?=
 =?utf-8?B?VUxOaUhhL3h4NUV6VjNSdDhLaXRsN3U2c3pxcWloakc0MkZTR0pCUVpoV3pi?=
 =?utf-8?B?WVdlQWV0L1Fnek92bzREL2J2emNjWi90TERESE9SQ3BUcXBDVWFqMkYxV2Ro?=
 =?utf-8?B?cUY1UnlOd0tiSXFpbDFPNkh2RWRYM2hUb1JxSG5nSWErS1Q1bGN6R0VCSHBE?=
 =?utf-8?B?UUJqenI1QkhZUWxxbEMzOEpGSmpqQWh2cHdacHpidzJFWU1xdDl2RmpoMDFj?=
 =?utf-8?B?cXluN3JySjJTeG8xbXhzSHZ5bWNzOURkMGpnWTIvR01ueEhjczEzUFd4bUpJ?=
 =?utf-8?B?R2ExWDFacUErNFFEaEdOaWhLeXFvTldHL3d6QWFjaG5mYm5MZXhpcjNIVHlo?=
 =?utf-8?B?YWo4NDI0MHdJNjEySlQvVE5RSFFQTi9LZjV0a25lZFpMWDhiWDFibHNsYktZ?=
 =?utf-8?B?K0tIQXJ3Mm40ZjFyRTdDcFRBYlZpbTRhZ1NCaEVtOFNWVC9uTVBWVk1MdTRL?=
 =?utf-8?B?MnlvVTE4WFZWRjNQZ3F1UUUyby8veUUrSEo5dlNnVkgzSGJTRDVETVRiZUtl?=
 =?utf-8?B?TGZUc1JwWkZuc0szYk51L21ZZEZDOGFuZVhmalVtRi9qdDZweGE4Qm5DbFRy?=
 =?utf-8?B?N2pXQjc4a2tVMjlSU3dWbVF6SnRDWmhDZE5hazhPVks0VWMvY3lXS1kxbWgx?=
 =?utf-8?B?bGRQMklVcFUyY29naWxjU25pdUo2UGQ5a2EwczdPN3JoMW1IMytzc2ZpZkVX?=
 =?utf-8?B?OHU2bGFzTW1oUnJMZzR6OFR5V0kwTUJHTkV4Rm05WnBVbHRFeldVRHNoNTQz?=
 =?utf-8?B?UWJJUitWMWptNWhQTXlvbGE2NnhlTWRjYXoxdmJYaFRqWm1XUlhRN3BJK1V3?=
 =?utf-8?B?TmtNd2FFbjVDSHgzeW8yamR4am1uZ2hteTJRQVB4OUh3ZjZCaEhTZzF0M1VQ?=
 =?utf-8?B?UmUxckg5LzlaZklCSDlUL0ZTcFMrRi85NVEybWpjc3M5NkJyd2RyWnIxUUh3?=
 =?utf-8?B?SHVoQTNVZUpTWlE3dHR4RXBhbHF6RW43Mjd1UWtEYkF2MktYZS8yTW1RUWlJ?=
 =?utf-8?B?YVRHRlRZaHJPcHRVa2Z4ZlY2M0Qrc3luRkhuTVdGQVhDOVNhVmgrZk1KYkxi?=
 =?utf-8?B?REcrWm4rcjlBSmhQMVEwbGYyZVVQYzUxY1V5SEFnMytSS1R1Q25zMEpOemFB?=
 =?utf-8?B?VFRRdE8wR1JHT0ljSnJCSGVTVGJEbm5CT1J4VGhGa3ZLM1pSMVNYZzFRMktY?=
 =?utf-8?B?L3oxRTV5UUNYZ2JPUHBtZG9FQXgvSzZ5VHdiejRZZDl4MHYrS2NBSUYvdjBO?=
 =?utf-8?B?NmZtYVV3aERvSlcwK29jWTkrNEUxUXVvOEQ1cmIvRjlWa3luWGltMzMzRGNs?=
 =?utf-8?B?MFoyVjBpNkRxQ3NZcEt1dklPdmk1SFFWOWlkNXBPeWl2YUdhQ2djcmJ4dFJX?=
 =?utf-8?B?RnRYeStHK242RklQUW9pbklnNXF0anlOKzNCVTUvbXovSFU5aXh0Q1RkRm15?=
 =?utf-8?B?YlJ2RDJOYkFOa1RpRzhkUXg2azlncXAyL0VkaFRSNXNLZlB4cExUdHBCS1JE?=
 =?utf-8?B?UEdQbklCUTRDR2lHUVl0ajBkOU9aWjd4UzAzZnBVZ1ZYaDN2NGNJK3FUYzFo?=
 =?utf-8?B?NUZQUTlnS2VsY0tSYkwwMFByU1FORnB1MGI1M3E0QUV4RGl5MVVSbWppNHVz?=
 =?utf-8?B?SzlmeVdmUTUxQzdlU0svMGxHYVNwMGpTMXZzbnd6bGgxT3d5L0FsTFpRZnJQ?=
 =?utf-8?B?cmQrc3V2bXRhYTVkWElVSmNpYkRIUDIxdk5mM2oyT1hFU0JJWnpnZGlUUUJn?=
 =?utf-8?B?VHhudjF4MkE0VFc3R2U3WnFSS3I4MTNqeWNZTmNqdDg3L2pUR0V4Z2NXMjVE?=
 =?utf-8?B?M0NjMXYxeTdKUUg2aFMzR0gvM3I3VTQydXRhTGtmb2hPZEJVTkJWSmpuR0dr?=
 =?utf-8?B?SDZ2MS9OWTdZUE5nbTNuRVF2VEROdEZVSkE5WlVZdEdPbGIrMFRPWmI5Y0cx?=
 =?utf-8?Q?UbWUr0aiwbRxEB2o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b803c848-9718-449f-8de5-08da13f449e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 15:28:36.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r3Ztxl+nnSwIdqW1YN8fkVsY1LjQQFfYgGGccE8yH4myH8NSnSxP3XR1yXYsP5+B8ULfHkLhKWmdzk9TaqljNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2065
X-Proofpoint-GUID: i5eLxDqiCUC3OKyvvsDlYf_EZazzlopN
X-Proofpoint-ORIG-GUID: q1qVSWetKUOE4LQp6LDJcm6FFqDpDcTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 15:28:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163943



On 4/1/22 04:11, Richard Purdie wrote:
> On Thu, 2022-03-31 at 15:21 -0700, Saul Wold wrote:
>> This ensure that when depmod-native runs we can find the correct
>> exclude.conf information, in this case adding .debug to ignore
>> the .debug kernell modules. The kmod utilities like depmod can use
>> either /etc/depmod.d or /lib/depmod.d. The kmod recipe is installing
>> the existing search.conf to /lib/depmod.d (nonarch_base_lib)
>>
>> When the busybox modutils are used, /lib/depmod.d is not used, so
>> it's safe add the exclude.conf file to /lib/depmod.d.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> index 04fc14a6d21..65068f02df8 100644
>> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
>> @@ -30,11 +30,16 @@ if [ -r "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" ]; then
>>       kernelabi=\$(cat "${PKGDATA_DIR}/kernel-depmod/kernel-abiversion")
>>   fi
>>   
>> +if [ ! -e "\3${nonarch_base_libdir}/depmod.d/exclude.conf" ]; then
>> +    mkdir -p "\$3${nonarch_base_libdir}/depmod.d"
>> +    echo "exclude .debug" > "\$3${nonarch_base_libdir}/depmod.d/exclude.conf"
>> +fi
> 
> Shouldn't the above go into the kmod recipe? We need this on target as well as
> in our rootfs build, right? I'm worried about the case where someone calls
> depmod on target.
> 
The kmod recipe does install it into nonarch_base_libdir/depmod.d, this 
is for the case of busybox which does not install anything and we are 
using kmod-native and the code below has depmod-native pointing to the 
correct depmod.d in the target rootfs image.

Files installed by kmod-native don't make it to the target rootfs, so we 
need to create the exclude.conf here.  I could remove it after 
depmod-native runs if that's your concern.

>> +
>>   if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
>>       echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
>> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
>> +    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
>>   else
>> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>> +    exec env depmod -C "\$3${nonarch_base_libdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>>   fi
>>   EOF
>>   	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
> 
> Does anything in the build install to $sysconfdir/depmod.d ?

Not that I know of, it's only created by the kmod recipe.

Sau!

> 
> Cheers,
> 
> Richard
> 
> 

-- 
Sau!

