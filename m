Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E77C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 04:53:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.81276.1684126396040249543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 21:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=E/R3TxYP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4499d06315=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F4eDPI032270
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9qEMchwiNf1MTMeehTtEloylHTQfHuRWUK1zwRYufSY=;
 b=E/R3TxYPv/ZlgmpuHUC5UCpHtrLt41WyKsCvIfrxWZlytyFERGc1nzp3Xv7IfdXt1Y39
 eS2imZFZdVcstHbXfBkA0hqxytqiTETKM2m9bEawSECh7b5l6C39iYLP7BF8iEjb4Bf1
 DAxAktf/yw7TmM1RikLib/mWlbXU+y3yN2nzKNdxB1TjLvAR7ZzDkbpuGSYtsXY+q3Pu
 NKNlvESi2i+Hh6IaW1835TtmB3gr8jG9nmQ8Xx5DK6mbc/DIW4vzxRs84zLeOAmANeJ+
 LchkFfzBdc0tTCnDJDWjuF3KFVwPFelEgBbJDdlmRHo+TpNZBlb4Ed4i1UQqWVyWmAIL bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys01f79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:15 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34F4rEO4018044
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qhys01f78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 04:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gacq190iooZvs9Penji4VRxeVfyhqckDxYdNP+2iqPDozS+5NIVNkp4V8Dl+7hZ4Em632dTObkxETVrq2rmIj2idEawJZSxNhh/Hz5WfSGMl+wfWlfY2/MiGhs54WWec9SkMjNj+KrPhyn7PQOQ48VHGCYq/8ZmH4+G0R02N9SPGnanAgiKAasM+r7AWpCfE2V+rEann5zPc2jSqWqAGJu96NvzHw6fGHgBeMJYAhvmLDZVD7QI/7xHBPkSgK7/9GI0wdw9+nczTCbrZgcRgneGPcvRcqOXcqC1C/u+Ju05r8wh6Uk/4TW7rDwsdb26xjHL42W+L94vlRwUk+bHohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qEMchwiNf1MTMeehTtEloylHTQfHuRWUK1zwRYufSY=;
 b=V/Lc8STRAVD2yMlF5YexZjT2jZwSeuxeQ+XOf8AC4eBLSKP6IhILkWOGIKm7BZ7O6EOcbmSwwmsdVyKzU3Zgu5/vLOhzhkJ4qSQMk8gtU8UVfthf08A/4f05HU68qi9RPcUHY/4kodHhmmUcW4ZcCtBflboBoZDGKLMrccL7rMavXpkx4orMWO2ZrOCtwhKSt2mcbjD4ailqm9+VOF1klhjEcVt7hR3ek1/460HplxO3Vz4iv/kpqXQBPfVV7m2EmM0Fr+7sRdFq3mVFUecfUZ0kq95GOOL0tLCTgI8yAvVexOut41JgO6GKd3DIi6bjuuhRKfU90N3sXh4YCOn5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 04:53:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 04:53:11 +0000
Message-ID: <f1f419aa-4c1c-8301-e61b-dcfa2e732c11@windriver.com>
Date: Mon, 15 May 2023 12:53:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230512031550.1715288-1-Qi.Chen@windriver.com>
 <DB5PR02MB1021377099AD45EEFECFF51E6EF759@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DB5PR02MB1021377099AD45EEFECFF51E6EF759@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: f8266ce9-8f1a-48a8-2778-08db55004852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iRjOJSiXhfeiPH/DYPbpSnS0d74aJgZUgTIc391DmH2c4ND+heszEg/ssVNQTEjJUbRBttMYe8+2jULYpMTjGs6s5GFlujgliTn9c53FJINQevTsES0SYBYz2zryQPO27VhMRAOzO7U5okdpNQc/IaZMWSH8r/CWkf69WG8mnkCtA3AaG/dZ2eHUQ1EONbRa0v614oYAhbJxM95Xl6d2CsWhhcb3kOu8AzI5QMCUajnwozTC04GO/cvZETEN/JaER0QuQO57SPoDZL7vLKBVhjvfvuymdwAyJkJPWWaaL42pQEvxtqqvTdwrN5DlrTFPWQlzX4lanK4pv77KEsDYhLGHLiI77tzm3SjxM/ctsPHVFHMz4PeRAyppcE0WGuTBz4i3mVHKM507KDAgqRBs/1KP/e9mCrho/wYOJzH+a/kr1zPOdfWdv8IejxDHlo5nNRz9o8KOMb0KVxbNJVFNPax2ZlRozKBQyYbgx3iG4rgEt/NpgWlMgcOidofDiQyaPLW0JUleymM7zKBmeYXV/x1AVXp9S+QD4oeZoU11nkq3TK4HxcC6pR+8cDEgxzSRU98kQrVc/DglA29n2Z1t2GOHyW6ND6Zx6MGuXUc02kFWgQD3BrZTIREhKvgz/QZo6I2t2Dc0KEQSWHdHXmiLdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(451199021)(31686004)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(8676002)(8936002)(31696002)(316002)(86362001)(66476007)(66556008)(66946007)(41300700001)(53546011)(186003)(6512007)(26005)(6506007)(6666004)(478600001)(6486002)(2616005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dndYVDlzcnNsYW9WZy9NS1ZRS2d3bzZjNEFkWHM5KzFxb2EwSitWRmxNWTRu?=
 =?utf-8?B?UXY1RWdyd0g5cmxpVTNUV3B4UGdUU2E5WGVZMTRUZVludlZ2ek5kNzhUNU1h?=
 =?utf-8?B?M3A2Y0p3UURUMFdOODdoRVJrMGdvZlAzM2crWmtEMG8zaWNLUjRtOU9iOTNs?=
 =?utf-8?B?MFhPOTJqUWc1MkdpeS9kTVdJdVJ4eUUrREozSjRxUVBnV1VHckc1amdTUFNl?=
 =?utf-8?B?V1Q0WXBtcVhBQ2VvcGZTR0Q2QUN6MDNTeUY0dkd4ZXFiNHhHbi9BdDFxU1d4?=
 =?utf-8?B?cEt2SXZ3WXlsRUpPb1lzZjYxVkYvd0F4ZEZDU2hEOGFjNFIvOVVnS1NJZnBz?=
 =?utf-8?B?TktiKzBUejl5dGovSk1zbnVMU1p3YXI0REw3dHVsMGVINGZKTHBVUVVoNkR0?=
 =?utf-8?B?UGMrUXhvTGV3ck96eVZDYWtyRUlaSmloNjNNSThIeFd6SHFSeldOd1NWV3U0?=
 =?utf-8?B?RnF5OW9WeGpWWnh1RVZMSTAxQWIySnZBRWthS2xibVRRcnhvbjdMTi9JZHFo?=
 =?utf-8?B?ZWV4WkoxWWRld3NPQjN0dTYvSlBNdkJoeFJBdHhIS0J1M3dpdGZEczJVM1E2?=
 =?utf-8?B?bStuK1QyaWtWU0Z1Y1lMTitvZWJiN0JjaS9mQVJiMDhwUXlHNXR0MzY1akc5?=
 =?utf-8?B?TzJsdk1yOURyRW9hUVEvQXdZZkVFNDI3VWUxUG9VNE1BSE1GMHhlN1NHeFBo?=
 =?utf-8?B?Q2lVWWFEdk5WTkQrRVI1MEFBLzJVbFpFdVVUa01JTnBQUWlYNjFGSFpMdllv?=
 =?utf-8?B?Y2lJK1NPQXI2WDd6c2N3RlFDWnJDbGhZd3NORFltOE9ydHZ1bkQ3KzF4Sy9n?=
 =?utf-8?B?U2dGamIyYmF5SFhtTGpPLzdxay92RStUWVRBd1hDOFZlSjUzdFJ6YkZ5aFRj?=
 =?utf-8?B?YnpwSWkvbVZOYVA3WXZsbGRUbERzbWI0VHdUWHRGZmlNU1VsWWp3WlQyN0Zx?=
 =?utf-8?B?bk5kNTdydFp6TU1QcnhmcmNOZlpCQnJHZkVnQTQzeVhVMGYvVUhUSk9GQUJE?=
 =?utf-8?B?MVRiemhvVWRLeDR0ZUVsTXZKcVVEWXNoT2tpMEZNbnhkSHV5cG4vWC9GTlpK?=
 =?utf-8?B?bFhMeWFNSmRaVXJGam5hSFNOZVJVS0RJTVpzbnR4SElEWjh3cmhwalY2dmlz?=
 =?utf-8?B?bHptZGViRlM5SllTRncraHZyMHZTUy9uSDRuSWNBa1Y4bzNNQTVQb214WWhB?=
 =?utf-8?B?TzBWaU0rQUtXdnFNT0x2bEdkQ1FLSEtUaDlGcTdFaHJudVpIVnUxdzJCUkww?=
 =?utf-8?B?NS84Kyt5MGdKWG9sVFFsS3FtemcxK3BSeEV4ZWxFUDF6QzhQL2JEREszcG4w?=
 =?utf-8?B?TmxqT2ZwbzNMc01ZbUlpcEx1ei9VYWlBOUV5S0tTRFFEY3ZkbjNLa1BITFpD?=
 =?utf-8?B?RTgzME9LNWlaYXIrWGNicmdlRUd1MHVXKzJnVlNDMkNiNncrang1SHJZUXdz?=
 =?utf-8?B?cGFzVWpPYzh0MTJYL0cwbm5ITzlWMElUVGpiNlpNUHY4NGNGTzdHNXVFVGx1?=
 =?utf-8?B?eEU5ZVZlUjk2MiswZTdURHBaazYyaG5jcldVdzg4bTJ5N0tZaFFLbzB4eG9N?=
 =?utf-8?B?am0zMlQ2QXp0RXpxU2Z4YklGQlNWRm9IeTRLSjBXV094d1ZBT2NuZ29YWUZa?=
 =?utf-8?B?SFd0WFpQTUFYMjlZRVhWb0dvMWNkUFhQY2JhdlBzdXN6NXlPUENvRmlBOWVy?=
 =?utf-8?B?RHo5Ky9aUXNOaXYzNUNFQlU4WjNPaHUyUk0wM2VXUGptWTJRYUpxU0hka2NK?=
 =?utf-8?B?ZnRXWTN4TVNOSlIxSVBQSDdaVWFRQWV6ekVJdkIydEphM1ZNTGFQTXhzNGR5?=
 =?utf-8?B?aVNNTkEwQXYvdmZNSjRWWk5XOWxabnNQa2dxSVMraWxoOUJGYUpYL0I3b1J3?=
 =?utf-8?B?YUpIRDJHNlcxL0JVUVBxU0F6SVhtaWJvZnNRVnkycm4xZGpGSmtqMS9MOHIv?=
 =?utf-8?B?ejdhS1F3OFlPbExmUDM4Q1JlSkRWeUdqVE1CM3JocFBtTWhQQzRRL1k0bitM?=
 =?utf-8?B?RUxSNVd5UHlQZStYejJMaWhIR1QyaVdOdzEvL2JsWGp1dDB5TFg0YVF5M2tR?=
 =?utf-8?B?TWhua2FiVGJKOVVZUWp0OVI2V09vcWd0dXF4UDJOTm1URUoza1ZFL3VTRWZr?=
 =?utf-8?Q?CmS4meGuTVbZic3ROd6VT6/EE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8266ce9-8f1a-48a8-2778-08db55004852
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 04:53:10.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MxP4RQw4ehztUbWd7SWi2eMSIJ6kJ2a/NM1MBqSEbwalPMACN3CHTJzZwWmhOPDJfMbPqS0giuEV2Hcc6VtvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-Proofpoint-ORIG-GUID: wnjgsMdL4ZXnSMMf83N1t5iBKj5SG27H
X-Proofpoint-GUID: NGjRIx4guY5dcM6aXG4xfiUOVTM1Q7s8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305150041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34F4eDPI032270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 04:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181226

Hi Peter,

Thanks for your careful review. I'll send out V3 according to your=20
suggestion.

Just one thing. I think we need to export OE_ADDED_PATHS for two reason:
1. users can clearly see it in the `env' command's output.
2. if the prefixed PATH is carried into some subprocess (e.g., a subshell=
),
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 so should this OE_ADDED_PATHS varia=
ble that prefixes it.

Regards,
Qi

On 5/12/23 20:27, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Chen Qi via
>> lists.openembedded.org
>> Sent: den 12 maj 2023 05:16
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH V2] oe-buildenv-internal: remove path from pr=
evious project
>>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> For now, only that paths added from current project are removed
> Change to:
>
> Until now, only paths added for the current project were removed
>
>> to avoid PATH growing unnecessarily. This is to handle the case
>> of sourcing the init script into different build directories.
>>
>> However, if we source the init script from different projects into
>> different build directories, the paths added by previous projects
>> are not cleaned up.
>>
>> To avoid this, we record the paths added into OE_ADDED_PATH, and
>> remove it in the next sourcing.
>>
>> Note that the paths, "$OEROOT/scripts:$BITBAKEDIR/bin:", are added
>> as a whole. A previous commit, "oe-buildenv-internal: Add paths to $PA=
TH individually",
>> made the change to treat these two paths separately, the reason was
>> not "assuming the path to the scripts directory always is in $PATH
>> directly before the bitbake directory". But this is exactly the effect
>> of the codes. I see no reason why we should complicate things.
> And now I have to try to remember why I changed this seven years ago...
> Unfortunately, time has taken its toll on my memory and I do not
> remember why I changed this. It may have been as simple as to make the
> code more generic and possibly handle more paths being added, or to tak=
e
> into account that other things may modify PATH after oe-init-build-env
> has been sourced. I guess I will just have to wait and see if anything
> breaks after this change is applied...
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/oe-buildenv-internal | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-intern=
al
>> index 485d4c52e1..598120a86d 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -92,15 +92,13 @@ fi
>>   PYTHONPATH=3D$BITBAKEDIR/lib:$PYTHONPATH
>>   export PYTHONPATH
>>
>> +# Remove old added path
>> +[ -n "$OE_ADDED_PATH" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_=
PATH##") || PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/b=
in:##")
> Change to:
>
> # Remove any paths added by sourcing this script before
> [ "$OE_ADDED_PATHS" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PATH=
S##") ||
>      PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##=
")
>
> and rename `OE_ADDED_PATH` to `OE_ADDED_PATHS` below.
>
>> +OE_ADDED_PATH=3D"$OEROOT/scripts:$BITBAKEDIR/bin:"
> Move the above line to after the comment below.
>
>>   # Make sure our paths are at the beginning of $PATH
>> -for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
>> -    # Remove any existences of $newpath from $PATH
>> -    PATH=3D$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
>> -
>> -    # Add $newpath to $PATH
>> -    PATH=3D"$newpath:$PATH"
>> -done
>> -unset BITBAKEDIR newpath
>> +PATH=3D"$OE_ADDED_PATH$PATH"
>> +export OE_ADDED_PATH
> Remove `export OE_ADDED_PATH`. This is a sourced script and the
> variable should not be needed by anything else.
>
>> +unset BITBAKEDIR
> All in all, this is how I would like it to look in the end:
>
> # Remove any paths added by sourcing this script before
> [ "$OE_ADDED_PATHS" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PATH=
S##") ||
>      PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##=
")
>
> # Make sure our paths are at the beginning of $PATH
> OE_ADDED_PATHS=3D"$OEROOT/scripts:$BITBAKEDIR/bin:"
> PATH=3D"$OE_ADDED_PATHS$PATH"
>
> # This is not needed any more
> unset BITBAKEDIR
>
>>   # Used by the runqemu script
>>   export BUILDDIR
> You may as well remove `export PATH` on the next line too. It is
> not needed.
>
>> --
>> 2.34.1
> //Peter
>


